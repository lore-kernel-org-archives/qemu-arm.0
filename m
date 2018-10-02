Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5271136wrt;
        Tue, 2 Oct 2018 09:43:00 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60rGS6TEVLOEv+ureJcSNPmS77pklwCtL6JvmgWSQl6qhIzJvJilodbtmwUMFEK4J9+i5b8
X-Received: by 2002:a37:b901:: with SMTP id j1-v6mr12678066qkf.73.1538498580818;
        Tue, 02 Oct 2018 09:43:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538498580; cv=none;
        d=google.com; s=arc-20160816;
        b=K3oAhAN9z7g7RcD3j+QsM2HIg9sg3mUap6Obg5XXj9PGTrlFTXv06OhUNf7YV+dP9w
         TrOswHBJKF3iIVOm84okKZ1VqChGp8EniQcj/Nip4ybpxChEQfdHLVRmO8lGeDvSPsbw
         wSQ6mpyoiKBuYR6RISVP1tBNLCUm/BEIYL+bKfxYYATGtaD7vc1AD7I6L1imn7feKRsJ
         dnW8IsErmnQO0oxxCP0PsQ3T8C8YVbq5DQAv14/5vkQSTj8eMdO/SDtRpYAzv9igmC58
         fEE6Wg/V3MDzIq55T8tGcwVxjVUwsLcDmxYLcjlEwza25AwTucPFjgwOxAu3VkdG/KUH
         QCtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=KBngiDfIMsZ9Ol6euspQm3ma/ei8mZ/+DGO48+2qMWU=;
        b=01zr1vdB0fJrBaLPgV1fBfo2Zr1/oHgWOt/E89VLVqKAlplzBNIEMyRJGnLhnNMtSd
         IUgbuKpydVFrMeqaic94+Igk5YUvn/K2dt2zBmEYL0qm5Whmo3vxwXDT149oGLpF8ik9
         sO0+hFdehS7c+y4STrBSiMeWLNOLLOTvAwU3tAIQryScgIvHLT7PX9RgrEcUOiCVCmkl
         cqmLct55+MTDNwkKOKwjqM5KXCch7gkTkuEDCJDeMmSEFvJZ4MlGKm2h/VnG9PqcZbKA
         qVyTl/xwvgaIgbdmtSmszJF5dzUWjjO0O4Zj1eatCHcVYss629oS9xl2R5Ipa7LhFajL
         2fSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q63-v6si173564qkb.152.2018.10.02.09.43.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 09:43:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44757 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7NlE-0004Ra-9c
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 12:43:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35055)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nf9-00079R-9Z
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 12:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7Nf8-0005Jq-Ge
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 12:36:43 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51570)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7Nf6-000565-R4; Tue, 02 Oct 2018 12:36:40 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7Ned-0007JT-Vp; Tue, 02 Oct 2018 17:36:11 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 17:35:55 +0100
Message-Id: <20181002163556.10279-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002163556.10279-1-peter.maydell@linaro.org>
References: <20181002163556.10279-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH 12/13] target/arm: Add v8M stack checks for
 VLDM/VSTM
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
Cc: patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ltVe2ArvFGQY

Add the v8M stack checks for the VLDM/VSTM
(aka VPUSH/VPOP) instructions. This code is currently
unreachable because we haven't yet implemented M profile
floating point support, but since the change is simple,
we add it now because otherwise we're likely to forget to
do it later.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index ef64d2559de..2d3a1be518b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4229,6 +4229,18 @@ static int disas_vfp_insn(DisasContext *s, uint32_t insn)
                 if (insn & (1 << 24)) /* pre-decrement */
                     tcg_gen_addi_i32(addr, addr, -((insn & 0xff) << 2));
 
+                if (rn == 13 && w && s->v8m_stackcheck) {
+                    /*
+                     * Here 'addr' is the lowest address we will store to,
+                     * and is either the old SP (if post-increment) or
+                     * the new SP (if pre-decrement). For post-increment
+                     * where the old value is below the limit and the new
+                     * value is above, it is UNKNOWN whether the limit check
+                     * triggers; we choose to trigger.
+                     */
+                    gen_helper_v8m_stackcheck(cpu_env, addr);
+                }
+
                 if (dp)
                     offset = 8;
                 else
-- 
2.19.0

