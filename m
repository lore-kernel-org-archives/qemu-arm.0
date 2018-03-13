Received: by 10.28.91.67 with SMTP id p64csp850103wmb;
        Tue, 13 Mar 2018 08:36:41 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsfwNoSYI1+TpbOKBiLJpRPujfaU1l65VH5ow+w1UExqsidsgocKQL9R2Hjb2DKlHJyLTiq
X-Received: by 10.55.176.3 with SMTP id z3mr1605765qke.298.1520955401539;
        Tue, 13 Mar 2018 08:36:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520955401; cv=none;
        d=google.com; s=arc-20160816;
        b=Kt/ZhaAknOEika6AOHj2HlP+Zuf+0lnhj1I0OuNgob39tQ2p74BbAxdr9IGfGxtJo7
         VXjqHYv7TT9WuFzmLxPBlSJnr/0RQGL0ErfkJxSWhBe6LMjO7pcYRSGV5fxiy462uXho
         ESOMWwbDQagr+0p0plfxZMhqPymkBqCZDGu9U+LVC13SQMfcbzRYeYsTG/rbd9rX0jin
         OGESJIiuimq9KBkGFCb7pNaAEZS42OVHGC0CuKZot0p4zqzIWUe4sze4tzMfDjnx0eAo
         VIhkNOH4u8jV40MXj1VAz7Z613agsV4AFvJkh1liPytE8jnmfaQKCGbcEFlbUSiUK2zA
         /csw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=YN47X/zRb0s5EGxfv46/agloo6jzVtVgYZ3CoCh/dvE=;
        b=FvCgAr93875ckttTipPmhPXdQ8xenncpdCLR3/P7yL4wUCo+dkHvTuA69gFNRABoW9
         yD5JbauhCSCnOzmUcWFHGSLziB+/w1FjmgIfwzVSfLnbOX8lXP3x82xoC/eRNzARnl0b
         oA7/ccUZcza8Qb61yfHZIBpugIC7axL+ELonKOtIL80WQ69fshYFa1JNxfJlFZaLlaUQ
         nyBYdCRsjMwz2WZwlgP/+ja9Vc4eAd+b8i/zcG2dNibtl6q51aexhdmr8gPHzyg1NBh9
         Eb84WKTVa7MiGJGfEdfUW3rLAV1fdUH3wK6WY4gFuvTMCuY9Ve7m2TSPwhXsea3o42SH
         hwlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a66si460339qke.249.2018.03.13.08.36.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Mar 2018 08:36:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40556 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evlyj-00079o-2J
	for alex.bennee@linaro.org; Tue, 13 Mar 2018 11:36:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47010)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxP-0005U2-Kl
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1evlxO-0005rY-Gc
	for qemu-arm@nongnu.org; Tue, 13 Mar 2018 11:35:19 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47058)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1evlxO-0005j0-27; Tue, 13 Mar 2018 11:35:18 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1evlx9-0003Em-46; Tue, 13 Mar 2018 15:35:03 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 13 Mar 2018 15:34:52 +0000
Message-Id: <20180313153458.26822-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180313153458.26822-1-peter.maydell@linaro.org>
References: <20180313153458.26822-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 3/9] hw/arm/boot: If booting a kernel in EL2,
 set SCR_EL3.HCE
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Pekka Enberg <penberg@iki.fi>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /pHU4NGncQsM

If we're directly booting a Linux kernel and the CPU supports both
EL3 and EL2, we start the kernel in EL2, as it expects. We must also
set the SCR_EL3.HCE bit in this situation, so that the HVC
instruction is enabled rather than UNDEFing. Otherwise at least some
kernels will panic when trying to initialize KVM in the guest.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index e21a92f972..9319b12fcd 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -729,6 +729,11 @@ static void do_cpu_reset(void *opaque)
                     assert(!info->secure_board_setup);
                 }
 
+                if (arm_feature(env, ARM_FEATURE_EL2)) {
+                    /* If we have EL2 then Linux expects the HVC insn to work */
+                    env->cp15.scr_el3 |= SCR_HCE;
+                }
+
                 /* Set to non-secure if not a secure boot */
                 if (!info->secure_boot &&
                     (cs != first_cpu || !info->secure_board_setup)) {
-- 
2.16.2

