Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05133C79F99
	for <qemu-arm@archiver.kernel.org>; Sun,  6 Sep 2026 08:55:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x38dt-0002TZ-Vs; Sun, 06 Sep 2026 04:54:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1x38ds-0002Sp-Ac
 for qemu-arm@nongnu.org; Sun, 06 Sep 2026 04:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1x38dq-0000nJ-Ua
 for qemu-arm@nongnu.org; Sun, 06 Sep 2026 04:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1788684862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XhdwYKD5g6XfDYLPQ0d6PKc21CSZ/GdTRYAvPQnoFM4=;
 b=DVIjs08oZe2K0QwUpXOTuEXjsc+apmma4dfHzZpk+NQKdv6g9gUGUNvv89QfdxO0GOSYhK
 Ognufp7mu1aU0Ww4cPTNyZudTW2gHd4bRga/R7+yAnHqTJZvrptO3/3oP2Tm3W6Q07a3AZ
 ZVWt+udqZn6wvjaevpIat89T1TEn6aM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-oSuwYy-zPBqRk-zFCBSi6w-1; Sun,
 06 Sep 2026 04:54:16 -0400
X-MC-Unique: oSuwYy-zPBqRk-zFCBSi6w-1
X-Mimecast-MFC-AGG-ID: oSuwYy-zPBqRk-zFCBSi6w_1788684854
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6AD4C1954234; Sun,  6 Sep 2026 08:54:14 +0000 (UTC)
Received: from localhost (headnet04.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.116])
 by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 928E41955F05; Sun,  6 Sep 2026 08:54:12 +0000 (UTC)
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Sun, 06 Sep 2026 12:53:38 +0400
Subject: [PATCH 6/9] tests/launchupdate-test: fix fw_cfg leak
MIME-Version: 1.0
Message-Id: <20260906-nohmp-next-v1-6-2b21e63974f3@redhat.com>
References: <20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com>
In-Reply-To: <20260906-nohmp-next-v1-0-2b21e63974f3@redhat.com>
To: qemu-devel@nongnu.org
Cc: Brian Cain <brian.cain@oss.qualcomm.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefano Garzarella <sgarzare@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>, 
 qemu-arm@nongnu.org, Ani Sinha <anisinha@redhat.com>, 
 Gerd Hoffman <kraxel@redhat.com>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Jared Rossi <jrossi@linux.ibm.com>, 
 Zhuoying Cai <zycai@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Jason Herne <jjherne@linux.ibm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 Ilya Leoshkevich <iii@linux.ibm.com>, David Hildenbrand <david@kernel.org>, 
 Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
 Matthew Rosato <mjrosato@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, 
 qemu-s390x@nongnu.org, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=654;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=tvMkFreeH/Ejxl3IdLA0EASIl9I59BW58yWeShIj8SU=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqnSoZY4pm21hFaA3Sc++5/rTbCbG8MEWWVRsT4
 aaMw/OvM22JAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCap0qGQAKCRDa6OEJdZac
 5TAtD/4qzJm8UIVSGwLpCvQb0Wnt+ASjcnKn35WzT8b7LciqKNPEhMD3PRNIgHJwru2XLZBxSiW
 7Ej2BxLkA9CRdXnsvBBN8YgJhVXW6EqaKLpqVA6METdDguPEXtJo6nMkPnPY/hStnl1A4NMdjCi
 hf8/2npMmakzv8FOouoIOVPnZy0OFrjJSjFWVGvsBTAsvspVvqM4nRvtvlO6u0c3TvWRcLwhMrH
 H3siNFA3LjHAIcNFsyv0wXgQW3lq69z8TNBLMAtZOWNd1k3YljQu+V7q1Re053RZ4/ieFfEb7D+
 dnMTlYTKaa8R1g2O94bPV3wITDhY9gwk1xqZgkZPdaUXdAmE1L6c14uUXVLKLjpqJA/a8ZChkbc
 5t3LXwvkNsxlXA3R9q3EoY+6XFO3dvStJFRhSA1wbW4hftP0XbL/b7dR5J/3L1Byera0H5NHRmt
 xt+ijidIrAOVrxfDaMSyW1YKQJKWZTHvqy6proSlHDTVstV0O7A+MvAhthPlEdpXBGn3+A0QVem
 Bz1PMJ+ieh5RPo/LAR5BzaHEeQI1/HjaOJx6Nin0w3Y8Xle0hC8Gs3Bu3e04v1CijXKSUtAbTBb
 jLzrdKuq35C3Zv0uzZArG5LluL69iMT6mS6aLh7Llb5wRrDvBBNnJo2mcaJ5T647x4g18PC+izK
 Og/q5Jzyfu5RgVQ==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: 793IUukoe2--zSIWdd-MTA9GwSjMA1iUXxzd1IEb-Y8_1788684854
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 tests/qtest/launchupdate-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/launchupdate-test.c b/tests/qtest/launchupdate-test.c
index 12a09079ae91..beec902caa6a 100644
--- a/tests/qtest/launchupdate-test.c
+++ b/tests/qtest/launchupdate-test.c
@@ -149,6 +149,7 @@ static void check_error(void)
     /* should fail with LOAD_FAIL since it was not IGVM format */
     g_assert_cmpint(status, ==, VM_LAUNCHUPDATE_LOAD_FAIL);
 
+    pc_fw_cfg_uninit(fw_cfg);
 }
 
 static int64_t get_image_size(const char *filename)

-- 
2.55.0.543.g5ebe2ebe4ea8


