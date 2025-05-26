Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4045402njc;
        Mon, 26 May 2025 01:06:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXSE6DN+t1dwHnWC+3S2X/wXXOBSA6Az3bijsPrSG0uQo4grRo8mD+cbgp+Cl/+lkZdHbvlcRkeCBE9LQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHrM4iAqcMPk7acmRlLSOgsxkQgZfM/eJkbG5tfOhl9nUDqgrxLGcRc3EoJnvBSXBfsNgdu
X-Received: by 2002:a05:6e02:743:b0:3dc:8a5f:7cd1 with SMTP id e9e14a558f8ab-3dc9b6a9fbemr79959335ab.3.1748246770949;
        Mon, 26 May 2025 01:06:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748246770; cv=none;
        d=google.com; s=arc-20240605;
        b=AILLHnTbBBUiN4cMJF6O/urGTzAobjC/dwtOlrIrZznP6mjQp/vdLkZpoBlPEznvs/
         71UC4WDgVfn9fR1+TzSn/GuNe2d2PJmm5RbvzsnfSCYKLxkZbm2Oa+Oo+PjTVHuz73HQ
         tlTdliLK1eoLGBX6KLRf7Q67Ppuypd0zKBeki+KeoRn+1ysfapLgfsnho6RqmdDzlM2s
         90a4viHL2d08hMUvnv/IB1R0dCvaZzSXGUX+Jml7GiFFjeziQXzRPecVVTtk22WkIgTK
         pnINFQsV0gcQCR0GP8FYhOKFulgTvkdBqY/nTke2XziVyAkKscz4Z6zNZELwZAzlULjh
         u8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=8124PyHBoc7lH78uVDvWLYU3tY+s423pYrexJZ8cpFc=;
        fh=NiEouvAWVTM0Gg2K4yQDh4pkzpklDCRS8ln6HHCER7M=;
        b=VX9g0HuV9wt0G1BN2+0bqslqMm9NMI7fEchWl/vymQUC0fr8iREqwYmo/sI28BmTb1
         m3MjesGbi23K+58xb2uaoLisvM+0XBPExBMYCN+O++izyZDzWzvbOEZlXBzmiGyuXBqb
         ontTGjxoFMSaHEQ6sghzEijBJPxw8rCW5wzHBfA/gvt43eh6Q+kOMAwolrqpPBPfaf69
         nfUn4/TYiA4/Ypp/V8xYtobBYKmklcj6XIWge5Bl/Z8OOQvVbFA+HVVsYNuWY2GXgS/R
         y3l4hqm8uQ/jpmx+fMUlVJmhUAX8sA0k4SKZ7soqgMKxkoU58nd5PVaZjvWylY2gCHN/
         gluA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mf3wGgpI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9e14a558f8ab-3dd75827834si30986125ab.44.2025.05.26.01.06.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 May 2025 01:06:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Mf3wGgpI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJSqQ-0004bd-R0; Mon, 26 May 2025 04:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uJSq2-0004HU-VB
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uJSq1-0002EW-7l
 for qemu-arm@nongnu.org; Mon, 26 May 2025 04:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748246736;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8124PyHBoc7lH78uVDvWLYU3tY+s423pYrexJZ8cpFc=;
 b=Mf3wGgpI0boyyJf62Vh9R6eiSuh3D3ODA5XwMiH5ZLFvEa0sUmpqnBYOHt2qRTenmEVSJl
 qoH126ymkJb6dNM0S10IzNdR9Yt9j7dYgXxjfqrliSojWg72102X2nTROSklUrE3mGRlZQ
 zhXO1K9DbyDloMMXuL1vwUDQ+Fyi2gM=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-208-FEFO9hpXMou85KicKNPjAQ-1; Mon,
 26 May 2025 04:05:25 -0400
X-MC-Unique: FEFO9hpXMou85KicKNPjAQ-1
X-Mimecast-MFC-AGG-ID: FEFO9hpXMou85KicKNPjAQ_1748246724
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8C5BB1955D93; Mon, 26 May 2025 08:05:24 +0000 (UTC)
Received: from corto.redhat.com (unknown [10.45.224.49])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 605ED1800ECA; Mon, 26 May 2025 08:05:22 +0000 (UTC)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Jamin Lin <jamin_lin@aspeedtech.com>, Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>
Subject: [PULL 02/39] tests/qtest/aspeed_smc-test: Fix memory leaks
Date: Mon, 26 May 2025 10:04:35 +0200
Message-ID: <20250526080512.1697528-3-clg@redhat.com>
In-Reply-To: <20250526080512.1697528-1-clg@redhat.com>
References: <20250526080512.1697528-1-clg@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.904,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_SPACE_RATIO=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: q7LjTK0C9tru

From: Jamin Lin <jamin_lin@aspeedtech.com>

Link: https://patchwork.kernel.org/project/qemu-devel/patch/20250509175047.26066-1-farosas@suse.de/

Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
Reviewed-by: Laurent Vivier <lvivier@redhat.com>
Link: https://lore.kernel.org/qemu-devel/20250513080806.1005996-1-jamin_lin@aspeedtech.com
Signed-off-by: Cédric Le Goater <clg@redhat.com>
---
 tests/qtest/aspeed_smc-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
index 4e1389385d85..52a00e6f0a7e 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -228,5 +228,10 @@ int main(int argc, char **argv)
     unlink(ast2500_evb_data.tmp_path);
     unlink(ast2600_evb_data.tmp_path);
     unlink(ast1030_evb_data.tmp_path);
+    g_free(palmetto_data.tmp_path);
+    g_free(ast2500_evb_data.tmp_path);
+    g_free(ast2600_evb_data.tmp_path);
+    g_free(ast1030_evb_data.tmp_path);
+
     return ret;
 }
-- 
2.49.0

