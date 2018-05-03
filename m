Received: by 10.28.4.212 with SMTP id 203csp1752404wme;
        Thu, 3 May 2018 03:57:48 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpsZFyhMBUkLOnoHxDhMxPKt9z5KsnmoUuSn/kwGGTBO1XnWNZti6yD8p9uIjEwdM1ehfDX
X-Received: by 2002:ac8:3653:: with SMTP id n19-v6mr18624425qtb.271.1525345068099;
        Thu, 03 May 2018 03:57:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525345068; cv=none;
        d=google.com; s=arc-20160816;
        b=xd7Go6Up6nxcvJPUM3XD4f4+PazhIWqohUNcDdssVcJmaCaMmcHwEId2lUZQlNPt4j
         ZVnnHQQX7AfnVLR7KG4qnnrxE5WcmKms19+1RwzO+VWNAHrWTlwaCleijnZYZi82xhRB
         kWemEdhf9P/WchORrIP0P527gphGUcrXi60Lul3g3xcZG9/M+ty+v92AskTNUv/vOejb
         f1XNSWfIcxrW5Y3NDA+eaUnYeDK4N3HZJWSKj4u3+sTr+CIaPwqF+VJv0pv7gykTFLjN
         pmPOVE3QP+11zxQcCUNHEsF0bqPjb36Jq5gJeWj78RDk3WDovsEYFtwJuO9jO3c6Vo44
         MK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=6zqskAk6lM0lXw1XSSGIJLA9/sBIHF74++qP01hBVx0=;
        b=yTiPKniTX4Fk736WBVjufHrBl2tLEpXH1yWNRQp52pzuTiR8SMMFyppfl7x4QME3az
         An38Piw7IQy3YRzBoxoPJlLc9VZg8D8kS7JJqYihS1zmFm9sQsORaHwrfzA6+re4E86V
         TTchEOVN4cXgAiogopfEkFsms8x3ratzBV+pA8cX3KQxJclbeTh5km1DGffyPUoZ/fo2
         ArqK6X6D2rCIpTRtWgZYg9q8c6vF5BQxQXTQjd9q33JeUgddYH2Uq0nP7kI3vgaQZOTx
         I46p5xGS9Wl1dvdB0yzAQb+nofc8jSIR9bh2kWXGfch3n0So87aw+RlUtthOthKQs5I3
         lIMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o21-v6si688909qtm.123.2018.05.03.03.57.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 May 2018 03:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEBvn-0004YM-M8
	for alex.bennee@linaro.org; Thu, 03 May 2018 06:57:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53225)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fEBvg-0004Y3-Ly
	for qemu-arm@nongnu.org; Thu, 03 May 2018 06:57:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fEBvf-0004kl-NG
	for qemu-arm@nongnu.org; Thu, 03 May 2018 06:57:40 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:41452)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fEBvf-0004gs-BS; Thu, 03 May 2018 06:57:39 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fEBvX-0001Wg-7B; Thu, 03 May 2018 11:57:31 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  3 May 2018 11:57:30 +0100
Message-Id: <20180503105730.5958-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Implement v8M VLLDM and VLSTM
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-stable@nongnu.org, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 23InvBpAyFjD

For v8M the instructions VLLDM and VLSTM support lazy saving
and restoring of the secure floating-point registers. Even
if the floating point extension is not implemented, these
instructions must act as NOPs in Secure state, so they can
be used as part of the secure-to-nonsecure call sequence.

Fixes: https://bugs.launchpad.net/qemu/+bug/1768295
Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
Worth cc'ing stable on this one because gcc and clang will
emit this insn when calling functions with the cmse_nonsecure_call
attribute.

 target/arm/translate.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9bc2ce1a0b..ad208867a7 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -10795,8 +10795,23 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
         /* Coprocessor.  */
         if (arm_dc_feature(s, ARM_FEATURE_M)) {
             /* We don't currently implement M profile FP support,
-             * so this entire space should give a NOCP fault.
+             * so this entire space should give a NOCP fault, with
+             * the exception of the v8M VLLDM and VLSTM insns, which
+             * must be NOPs in Secure state and UNDEF in Nonsecure state.
              */
+            if (arm_dc_feature(s, ARM_FEATURE_V8) &&
+                (insn & 0xffa00f00) == 0xec200a00) {
+                /* 0b1110_1100_0x1x_xxxx_xxxx_1010_xxxx_xxxx
+                 *  - VLLDM, VLSTM
+                 * We choose to UNDEF if the RAZ bits are non-zero.
+                 */
+                if (!s->v8m_secure || (insn & 0x0040f0ff)) {
+                    goto illegal_op;
+                }
+                /* Just NOP since FP support is not implemented */
+                break;
+            }
+            /* All other insns: NOCP */
             gen_exception_insn(s, 4, EXCP_NOCP, syn_uncategorized(),
                                default_exception_el(s));
             break;
-- 
2.17.0

