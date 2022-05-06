Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp2027892lfj;
        Fri, 6 May 2022 12:35:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHN/Wl8wxZGqRpZoQjB0xdVOErlhSM7net8vI3/+knKMmEGbu2Z+AKO6V2foOYTWigVid4
X-Received: by 2002:a05:620a:795:b0:69f:d074:6067 with SMTP id 21-20020a05620a079500b0069fd0746067mr3525832qka.527.1651865722596;
        Fri, 06 May 2022 12:35:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651865722; cv=none;
        d=google.com; s=arc-20160816;
        b=X8lgLLIy+ldAYpGk88af4qyAvHrpZUmzOx+0Q7tVgvWLbWb32MfWf2SSfpG32mFnnS
         KYhumw9bVq3s73nuilN7kxklQ2FuF86at+Tldw+K4rM/+0kRhtxQn6CJjGToR0kaUPMB
         BFEeABAnsEsizrJN8L9W7N/Byr1k39w8L5KVlHwba3FLrWNO5mUS3R6ytLbopDH9hzX8
         cRbmdbVh0eDRr8OBOZX3/JHlF9iAdCc+Qgkm+ynHAN1yklbzqFnRStr60dcYKoSIZNI6
         rAVS0NxMOi6Hg8WZNeViJAvzEZggATYUf+M2JqigtJh556r1v6s98SYOdQ7zJ0iRuGkc
         8bxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ts/PNulP+NDUmLMbRyIQpZdrWAAO71Dq0mF88efIU/Q=;
        b=lhhcbsghX9D3GgX41s45trb8VkYEpZnpyjUifarZpL4hxksjvAs1ae4NKUt6Ia1nHl
         IFU0RV3PC5HkJKHZGCSyKwzaZ/gwPtO2P9dwX3uupWJT9eAT8hmjhR86ekKy2XAkbkYh
         wDLZvcRtCc8Q+MJMdtyiFMj1Brsltsj0jkYtHlDeMjGioRfEQkNEQF+60v4oN7VI2kug
         rp9FDBtPM53hBllyLa66cjZfDGhV59fVtw+orN/VKYF7bpAqysiBeaipVIwmAkLH735r
         ziVH7YIAb+JgFJbNnLMfAGIAd0P63QtJUY8G2+/4CwPeA7gvfnlSP8GDg21xLLi74pmh
         Tslw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=PgGkN++a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k17-20020a05620a415100b006a043b0bf45si1962955qko.699.2022.05.06.12.35.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 May 2022 12:35:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@fb.com header.s=facebook header.b=PgGkN++a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=fb.com
Received: from localhost ([::1]:38504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nn3jW-0007bS-2v
	for alex.bennee@linaro.org; Fri, 06 May 2022 15:35:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6125b5e310=pdel@fb.com>)
 id 1nn3iP-00061e-6M
 for qemu-devel@nongnu.org; Fri, 06 May 2022 15:34:13 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:4810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6125b5e310=pdel@fb.com>)
 id 1nn3iM-000287-KG
 for qemu-devel@nongnu.org; Fri, 06 May 2022 15:34:12 -0400
Received: from pps.filterd (m0044010.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 246H0tNd008383
 for <qemu-devel@nongnu.org>; Fri, 6 May 2022 12:34:06 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=facebook;
 bh=ts/PNulP+NDUmLMbRyIQpZdrWAAO71Dq0mF88efIU/Q=;
 b=PgGkN++a7qYsyh3eN0qDegYg5qG1Fn4f/xenyBpuS5GcVNDyqLvcnzTXC/EXExwZTOms
 nSpxRNUEuRKEktvjqw5ghYUlVJuY4kFTTOQ2+k8Vhgw3BqUtB7xxzILnghN9PEAF1Uf2
 xHhJhE2hw1TCOtMNsvWUpCmK3pnj4rHw1fs= 
Received: from maileast.thefacebook.com ([163.114.130.16])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fvhd1gkxk-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 06 May 2022 12:34:06 -0700
Received: from twshared31479.05.prn5.facebook.com (2620:10d:c0a8:1b::d) by
 mail.thefacebook.com (2620:10d:c0a8:83::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 6 May 2022 12:34:04 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 065C75D276FD; Fri,  6 May 2022 12:33:59 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <patrick@stwcx.xyz>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <clg@kaod.org>
Subject: [PATCH 1/1] docs: aspeed: Add fby35 board
Date: Fri, 6 May 2022 12:33:54 -0700
Message-ID: <20220506193354.990532-2-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220506193354.990532-1-pdel@fb.com>
References: <20220506193354.990532-1-pdel@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _8LOOT8_2YaYxmlpXKZn6NcIRKG06AmW
X-Proofpoint-GUID: _8LOOT8_2YaYxmlpXKZn6NcIRKG06AmW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-06_07,2022-05-06_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=6125b5e310=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K1aNixKiVT4y

Add fby35 to the list of Aspeed boards.

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 docs/system/arm/aspeed.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/aspeed.rst b/docs/system/arm/aspeed.rst
index 60ed94f187..fa98549c11 100644
--- a/docs/system/arm/aspeed.rst
+++ b/docs/system/arm/aspeed.rst
@@ -31,6 +31,7 @@ AST2600 SoC based machines :
 - ``tacoma-bmc``           OpenPOWER Witherspoon POWER9 AST2600 BMC
 - ``rainier-bmc``          IBM Rainier POWER10 BMC
 - ``fuji-bmc``             Facebook Fuji BMC
+- ``fby35-bmc``            Facebook fby35 BMC
=20
 Supported devices
 -----------------
--=20
2.30.2

