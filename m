Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5155642wrt;
        Tue, 2 Oct 2018 08:00:07 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62lmn4cyqIMfHYrjBf/kvCw6uwlUZrpyFyLaWJnxhb1/R0kCRDPFKMQQbAvCHFpf3guqyS2
X-Received: by 2002:ac8:70b:: with SMTP id g11-v6mr6780902qth.219.1538492407870;
        Tue, 02 Oct 2018 08:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538492407; cv=none;
        d=google.com; s=arc-20160816;
        b=WwgbwMJvmI2rDCeCXMEwrqBMRzKxc7Lh+qPo/Qwuw0OOg/g8+FjKI/sZUtQLQG4pSu
         n3jcCQuoin2rc5rS6GNiISf3x/nhHmMo5ZBre6kdBRxAwjByihZa3x3sqvF4w3FfTfR3
         ENyPA0W1pMdDa/zl5H6VUPDNQER5gaCkJ4+QfjlFdn11E2MBtdgP0nTHdYC2NwTjHU9N
         GsQmrOtqoy5K63qAOuQdXxgOSwXrZWP/floi/n2Yp08qqsYbh4M+ZQWphzAN+XtajjF7
         UK72BszQnSih//+FFDm/pNM2axGgCefL/ONs5ILrI6TV2dgWW6+Z6CvzjpK4GZVdDtEL
         5BrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=lATKzu1zNOgXYBnMduhKOeYYtddwsiAeS3Rm0sIRauA=;
        b=BzySo576eD/Zxs2TcPLXrNbU3HGYDY42FLPdrhCTF+MDW36HvD+OuR77dcOXXRF7y7
         IZNOmnyGkhMCbOl/8tNEoZsSBa7M+QM+65qlVaBvUrXMXm3bup8sTPug/UhnPM3ilJBr
         TaqWYm8u+SwI5O6lxrrxCB/VpzxYWyghn3JKevhWRFbDYWIeBmC7A2YNjNsODQmQI1pS
         b8ep0U51JTyTULVCMwOvxJpdla9ru0d/h6qs3+ZinyDOFOqhn9TnhpTkBcCY8z2bz0P8
         13phGukhKIx4qF54OPv6vtCE3snugD6rWd4kWVfqsOxq2YvI81odIcXm6JQHFYOJvkay
         bdvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11-v6si3436300qvk.267.2018.10.02.08.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 08:00:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44156 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7M9f-0006s1-Ai
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 11:00:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7M9S-0006r0-Bv
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 10:59:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1g7M9R-0002aP-EN
	for qemu-arm@nongnu.org; Tue, 02 Oct 2018 10:59:54 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:51536)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1g7M9R-0002Vt-4M; Tue, 02 Oct 2018 10:59:53 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1g7M9H-0007D0-Mu; Tue, 02 Oct 2018 15:59:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 15:59:40 +0100
Message-Id: <20181002145940.30931-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH] target/arm: Correct condition for v8M callee
 stack push
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nhikGT448CZM

In v7m_exception_taken() we were incorrectly using a
"LR bit EXCRET.ES is 1" check when it should be 0
(compare the pseudocode ExceptionTaken() function).
This meant we didn't stack the callee-saved registers
when tailchaining from a NonSecure to a Secure exception.

Cc: qemu-stable@nongnu.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 64b15645944..073fb3c5cb0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6938,7 +6938,7 @@ static void v7m_exception_taken(ARMCPU *cpu, uint32_t lr, bool dotailchain,
                  * not already saved.
                  */
                 if (lr & R_V7M_EXCRET_DCRS_MASK &&
-                    !(dotailchain && (lr & R_V7M_EXCRET_ES_MASK))) {
+                    !(dotailchain && !(lr & R_V7M_EXCRET_ES_MASK))) {
                     push_failed = v7m_push_callee_stack(cpu, lr, dotailchain,
                                                         ignore_stackfaults);
                 }
-- 
2.19.0

