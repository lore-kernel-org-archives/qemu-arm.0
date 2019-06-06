Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4765503wrg;
        Thu, 6 Jun 2019 11:05:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLAB/IGvTJfdY02wR/a9mWAWePqneLD+ZvtsI20udvwX8G9Gx864G31MJugYhZjLhpxYaA
X-Received: by 2002:a0c:888a:: with SMTP id 10mr15954970qvn.0.1559844309446;
        Thu, 06 Jun 2019 11:05:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559844309; cv=none;
        d=google.com; s=arc-20160816;
        b=P3DzaGi1EbZvwXN5C5/An2zFyEN9vBhN5ZGUFLAvtKK54QR0Q/4j9JTA9YpmjkxE+W
         /n35UCdp/Q1yMBkGYZOtNna2es38gFruF5pfzjmeqpGc4VlnVsj+veh802cOKccXqAq8
         9yJtRZ26Q4PzxgEsuSJYBKpkRgsgFOGaadPIPyXEz1Z2mjJxYLoesdWTwHU5XfPqZlPK
         CjYlGRNozBC37ag0nCR3jS8D6t+3148uxOr7gcYg9IPODzazOh0PDbCNxSmQdXw9prWL
         hYSq7y1NOVYXa4P9nvmkH37b3PAwzxRWd1sO/z/lUa4iyLKNnxFYVVlH8sxKFnzR7qJ5
         kN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=YjVm+cX22zoyuHU03fYipUHvsizBftG/iHWYkwVfhEA=;
        b=HUTSCf/dG+GXiiPvXB7QeBkkdGWeV91H7zbTriDTO5U+RN65g6xI0XwfEOH+CK/dSF
         VADy2W+fnMm59xFcNhMi4mkLRoik1MdfztMjrel/je4ignVz7AmElo3oDfJIpYWKMYbU
         1GaF9EIAK1mAbxvGuMsko00+cyz6qk8giYS64YdQP6UMzXGScy0ieG32aTibgWjNj1Wx
         MhRxmv833aH2D7ki0MHK9OzK1u4slvdgya6gbxKnjxntIgSruNzGuD5CdzwLuimnwqri
         LpSaBeJ1jeEnHxfG/caJWukGyc+fXNn3OdTEygA/0DCQxFMp3efVXshDGDd9i9+s8duS
         spxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eowGwb18;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e7si2323847qtq.16.2019.06.06.11.05.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jun 2019 11:05:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eowGwb18;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYwlB-0004l1-0x
	for alex.bennee@linaro.org; Thu, 06 Jun 2019 14:05:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44799)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU5-0004Qu-6y
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hYwU2-000429-HN
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:27 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:43860)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hYwTz-0003Dk-S7
	for qemu-devel@nongnu.org; Thu, 06 Jun 2019 13:47:25 -0400
Received: by mail-wr1-x442.google.com with SMTP id r18so3319700wrm.10
	for <qemu-devel@nongnu.org>; Thu, 06 Jun 2019 10:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YjVm+cX22zoyuHU03fYipUHvsizBftG/iHWYkwVfhEA=;
	b=eowGwb18WGDo4xD8H0ZWgGRnw2MQw0JMlxUcH0N2k4p0QBmJAtpzDuaLw+M+g+3y4o
	+G2o/HzlMzwzZ9EgsBsvdt++8C2KxFZm7LTjLmII28dTsKvf5Oux2KbIyY11PW7qTwCp
	ZWM6yoXvtLgbgZX+0GjGcy37Sz82Vs9HhWfi5XZ7dQJK7YARlwRW1dWC4aIaLTG6kIHm
	gfw9IPEjtIhObnuuLTyIEwenGBKIuMhnN9LWOZto1dhAdeygnAOnhfFwX7gcv+B6f54v
	TvuiiMiXHJ66JL+Pra0QfN+elX4OgBmYzVot6HcZCA/xnggn5vB7Rul6BqHhEnx7qdu2
	Mplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YjVm+cX22zoyuHU03fYipUHvsizBftG/iHWYkwVfhEA=;
	b=soHSkRgzmbms+Ca4zT/Uq5kn26p2mI/MbIOfacxdBnUTgLVC6hhbx0Is8UZdLf+JBM
	5BymI8BkzUUVaKsp750n+4svgd6VMnzox9L7fJvN4RPXZ1tJWoneyKFaJUAvkNPBCevu
	qiw7dSHjf5VjxjYjJBEYsq6BuuhuUmd34IVsNGCckTFWTyuuOfM0iUR83+seg2AiOLul
	TAOgTV/UD13wF+ExwurgI4ay/2PUaWmlSFGg0DKQOI8oUGkA5c/sV/AnfDhxfywi0hEP
	c2wTIdihSAPa9sMxArSI/kU+WNChdGnXkOLx6QZ4nrupiNYA+h4zeH+XElZPxDCBLmn9
	AWTQ==
X-Gm-Message-State: APjAAAVHUtjer90tlqKriX+Yp5aD2YreShFoFQu6mf+pJmcwQsqdfOVg
	Vc0MmToFJ2SLllWNv5c8ov0Xt5XqAICfTg==
X-Received: by 2002:adf:dd82:: with SMTP id x2mr6457026wrl.27.1559843204615;
	Thu, 06 Jun 2019 10:46:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	z135sm2596784wmc.45.2019.06.06.10.46.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jun 2019 10:46:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  6 Jun 2019 18:45:57 +0100
Message-Id: <20190606174609.20487-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190606174609.20487-1-peter.maydell@linaro.org>
References: <20190606174609.20487-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::442
Subject: [Qemu-devel] [PATCH 30/42] target/arm: Convert VNEG to decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u2/CHCTwz6Mg

Convert the VNEG instruction to decodetree.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-vfp.inc.c | 10 ++++++++++
 target/arm/translate.c         |  6 +-----
 target/arm/vfp.decode          |  5 +++++
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-vfp.inc.c b/target/arm/translate-vfp.inc.c
index d0282f1f921..6e06b2a130a 100644
--- a/target/arm/translate-vfp.inc.c
+++ b/target/arm/translate-vfp.inc.c
@@ -1898,3 +1898,13 @@ static bool trans_VABS_dp(DisasContext *s, arg_VABS_dp *a)
 {
     return do_vfp_2op_dp(s, gen_helper_vfp_absd, a->vd, a->vm);
 }
+
+static bool trans_VNEG_sp(DisasContext *s, arg_VNEG_sp *a)
+{
+    return do_vfp_2op_sp(s, gen_helper_vfp_negs, a->vd, a->vm);
+}
+
+static bool trans_VNEG_dp(DisasContext *s, arg_VNEG_dp *a)
+{
+    return do_vfp_2op_dp(s, gen_helper_vfp_negd, a->vd, a->vm);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index ace9f803ab7..cc67ab069bc 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3098,7 +3098,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 return 1;
             case 15:
                 switch (rn) {
-                case 1:
+                case 1 ... 2:
                     /* Already handled by decodetree */
                     return 1;
                 default:
@@ -3112,7 +3112,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 /* rn is opcode, encoded as per VFP_SREG_N. */
                 switch (rn) {
                 case 0x00: /* vmov */
-                case 0x02: /* vneg */
                 case 0x03: /* vsqrt */
                     break;
 
@@ -3291,9 +3290,6 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     case 0: /* cpy */
                         /* no-op */
                         break;
-                    case 2: /* neg */
-                        gen_vfp_neg(dp);
-                        break;
                     case 3: /* sqrt */
                         gen_vfp_sqrt(dp);
                         break;
diff --git a/target/arm/vfp.decode b/target/arm/vfp.decode
index 7035861c270..79e41963be4 100644
--- a/target/arm/vfp.decode
+++ b/target/arm/vfp.decode
@@ -161,3 +161,8 @@ VABS_sp      ---- 1110 1.11 0000 .... 1010 11.0 .... \
              vd=%vd_sp vm=%vm_sp
 VABS_dp      ---- 1110 1.11 0000 .... 1011 11.0 .... \
              vd=%vd_dp vm=%vm_dp
+
+VNEG_sp      ---- 1110 1.11 0001 .... 1010 01.0 .... \
+             vd=%vd_sp vm=%vm_sp
+VNEG_dp      ---- 1110 1.11 0001 .... 1011 01.0 .... \
+             vd=%vd_dp vm=%vm_dp
-- 
2.20.1

