Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3897980wrx;
        Tue, 16 Apr 2019 06:02:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyC/7Cof/sgZxpKMV/M7cen8g1UZIcKNoqmCGzDiwt7Z6Iw8+ww5Ooy3jEt30GsO+83IWum
X-Received: by 2002:a1c:be0e:: with SMTP id o14mr26624814wmf.118.1555419745948;
        Tue, 16 Apr 2019 06:02:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419745; cv=none;
        d=google.com; s=arc-20160816;
        b=OxKUqURTXJeiO7OKRFfd4GWYQKla9VvtzMBTp19KihwSYMMnoZc26FaXcYMG8HMi23
         n6zfEwxGbS2n7OlqZJlVE0b0TLU54CSiWWymHOKGAGznYiWnSuk0ha29u+/cDlyzcgql
         0fF9SnkKETa8IqDK00yO/vuhy9hLLE2Sb2q1amtULxdQNJkZlr4DPcrgrKvyBpKd4TSc
         9sB7V8nGGdLuRUcok6oNr1JvuV7+KquQnJswmnpNPnXkkrEfb7xWCT5K4hJsG/+KiWLk
         7JxVtCu5Ibv3UhseasyjUcQIwIYkrj0LAeszzRedpYr00eB97mLX4navY60M8bh1ukp8
         71bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=6cCVRnIqDr1YlxNV4JvcQbdEHcgddBmMkialjOjujLk=;
        b=r0UXn4R05aWrFyJl3Ginv1UCwrYdlmPBtNNCFQ9RF/ifUyiPOdsEisjbEkJ7xGP2gU
         zlDJYjXw4ZxZd8DzN0GpL5ZvTW1bBB7tIQVca/gmbcIeyBpo4BLoSGkmrMk67ym3VbSW
         M1ms5raE/V8Ln2D6gEcNgan+/+Fq67xcFk22KNqVCdt7IqmmxUing2idyPi8UHVWunQX
         tzG/pENElKQMH3tK8I828P9oI8pCzo8CyBKS5VV86g8tBw9dw0cM748h00YrzjxNyMy8
         VoRIf0s5UX2HNQNzG/EKRUfYg9Uvh8KeGfmYtDo09QBAMfyiyV/Xt2EBy0QhohTwWxnU
         AJIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c4f+R1n+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 12si13109893wme.125.2019.04.16.06.02.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:02:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c4f+R1n+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36322 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNjF-0007Zi-1r
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:02:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34369)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf2-0004Vf-II
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNez-00016M-1k
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:58:02 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:34507)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNev-00012p-9x
	for qemu-devel@nongnu.org; Tue, 16 Apr 2019 08:57:59 -0400
Received: by mail-wr1-x444.google.com with SMTP id p10so26959475wrq.1
	for <qemu-devel@nongnu.org>; Tue, 16 Apr 2019 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6cCVRnIqDr1YlxNV4JvcQbdEHcgddBmMkialjOjujLk=;
	b=c4f+R1n+jjnEslMRaVeRaR6ItZ5Mw1u+NmUqBlFdCRt0wh83Y76IWliCl2MB5evha/
	VdLNuhgxNjWwmmlkSA3m5/B/I/4d9yJz1NxhNHjOhIxOkC2EaPInzU+TrXG/O34GlqfM
	ZmxEJhCi94tuUOGnsZIQZJlZ1Pn4v3PvIoyzXDJDepjoRQ9vD+2Ua5OLQW4yTPBPwz7o
	dppuCApRJ6d+8kybhp004Z1gJ+037lSjr9XpmUXakMzbBhwNWEzA2R+dWtMe6TAhVq/6
	MBCCp6gnRZ64THuI4ZT0wswx8szE3/HrpuX8Nw2L0nZq3G8msGk2bucTUAGjcbeBT7Wp
	GESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6cCVRnIqDr1YlxNV4JvcQbdEHcgddBmMkialjOjujLk=;
	b=meQZJ2jB1NhzNycOBYkI1FrLs2hSxptiob176sz+4dsTZO7zm2Jcg3JhXZ/U7Wcklx
	Qk1adRpSyI1BNl6k+3ahBLOgFBD3PZRZ65lqd4hY24eKWod8jvoKjyp60fN4ds0/nQ+W
	vt62IkKPdlcGrK7k9cCtxaOqSGRtUQyF8ySQfJU9fRaGd0nW051D+gey61ip0+CgjPZr
	4ykzhK/imP6Ff3/UU/sE34JJfQQ7badkTcVNL3FR0IINwMHnMRnavsB5KnI1jRyVPOZj
	X/O/i271Cpo0avaN3EiZp+1GvmLMEqDQqii3HqXT3njIomv/egjx3LoWY6o8gemCeI/w
	hp+w==
X-Gm-Message-State: APjAAAXzdDU1kafTCVuzBjMNX5L2j4UOB0gTrUO9sjK9iWWOLWaujBVR
	fM+Za4aDWv3NvTjha/sycTxXWQ==
X-Received: by 2002:adf:b6a4:: with SMTP id j36mr50713225wre.55.1555419475203; 
	Tue, 16 Apr 2019 05:57:55 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.57.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:57:54 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:22 +0100
Message-Id: <20190416125744.27770-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::444
Subject: [Qemu-devel] [PATCH 04/26] target/arm: Disable most VFP sysregs for
 M-profile
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: REt660w7UZ5g

The only "system register" that M-profile floating point exposes
via the VMRS/VMRS instructions is FPSCR, and it does not have
the odd special case for rd==15. Add a check to ensure we only
expose FPSCR.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d408e4d7ef4..d56488ec847 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3512,12 +3512,27 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     }
                 }
             } else { /* !dp */
+                bool is_sysreg;
+
                 if ((insn & 0x6f) != 0x00)
                     return 1;
                 rn = VFP_SREG_N(insn);
+
+                is_sysreg = extract32(insn, 21, 1);
+
+                if (arm_dc_feature(s, ARM_FEATURE_M)) {
+                    /*
+                     * The only M-profile VFP vmrs/vmsr sysreg is FPSCR.
+                     * Writes to R15 are UNPREDICTABLE; we choose to undef.
+                     */
+                    if (is_sysreg && (rd == 15 || (rn >> 1) != ARM_VFP_FPSCR)) {
+                        return 1;
+                    }
+                }
+
                 if (insn & ARM_CP_RW_BIT) {
                     /* vfp->arm */
-                    if (insn & (1 << 21)) {
+                    if (is_sysreg) {
                         /* system register */
                         rn >>= 1;
 
@@ -3584,7 +3599,7 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                     }
                 } else {
                     /* arm->vfp */
-                    if (insn & (1 << 21)) {
+                    if (is_sysreg) {
                         rn >>= 1;
                         /* system register */
                         switch (rn) {
-- 
2.20.1

