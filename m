Received: by 10.223.159.74 with SMTP id f10csp662071wrg;
        Fri, 8 Dec 2017 06:15:07 -0800 (PST)
X-Google-Smtp-Source: AGs4zMaU/1j+ptyfnSiFOd2ZCKD8F9PAheCfH/98KO4r8hR7GIMj+uABTjkERFcQCx8qjCB/YP5W
X-Received: by 10.129.43.196 with SMTP id r187mr21816706ywr.391.1512742507503;
        Fri, 08 Dec 2017 06:15:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512742507; cv=none;
        d=google.com; s=arc-20160816;
        b=e10Nr4BgJIysnPOWcIdi8PWioJfSwtWkt+39mtc6Z1kaQQsgoA9eKJwLaFGkGgJR5v
         QuKaC6qqbNtz6n4hvzoSZMg3ozv0Q8w1VE+Pa2iQEmu+Odg72KJP006G3OiHrSw35ucb
         19qNMHbnN3IzsstpnRT11PXKzoILf1NsdeeHPLQjj9n2Dh9RQrH72YrgWEhLLncMODkD
         KUMnadPpJr9rO5/cpj581dhDx5cM4kV0771Uw1N+EteySOQaC5ppCADlQlG1a0mvjVYu
         HEPcjCDYKABwDbZU3lmn9eHSjFYz/HkubBPWfgG6/mMwNe1rnDudh9ALZdvsTJDo8LBZ
         wZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=utfcmAydYl1E0hq6KzqEXKDL1NHAKJX34HlXeavZtMI=;
        b=1KBPOX19/wIhWM19s3L9gQDq9ZNcVO7AZVxPZ9QO8AzPDuAuyTRDP0SkbuRYcF0Wmz
         cxnDoGBwk/XrZmYpQGlDFpY1hSG/ozZkxY9WkSaVgvsZDeR7aVaoTQ+ARRiDX5N/hfE8
         EAOhpC2zcZK+acLCPX1I1PDfrd4dm323Cf8FzWYI3gtualui4SlUbiGlffC124XtLExo
         IjPSoXIlctm18XxKtpo7JE2O+6xFhVkNO0JMZnoTNGXsy6DMdVWc3lLOHI8sIEIsBVEL
         PXXBeUFHzOUs5tVGZ1SClGOnaUxOtI3yIiT4tnmbfn6ZBY5hFm56tQgmgWV+UDdE3122
         vcdg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c12si1656765ybg.503.2017.12.08.06.15.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Dec 2017 06:15:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37465 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eNJQg-0007Iy-Tv
	for alex.bennee@linaro.org; Fri, 08 Dec 2017 09:15:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40292)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNJP5-0005Ec-2O
	for qemu-devel@nongnu.org; Fri, 08 Dec 2017 09:13:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eNJP4-0001g2-7U
	for qemu-devel@nongnu.org; Fri, 08 Dec 2017 09:13:27 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38940)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eNJP2-0001eL-5m; Fri, 08 Dec 2017 09:13:24 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eNJP1-0000qV-7p; Fri, 08 Dec 2017 14:13:23 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  8 Dec 2017 14:13:22 +0000
Message-Id: <1512742402-31669-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-devel] [PATCH] get_phys_addr_pmsav7: Support AP=0b111 for v7M
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
Cc: Andy Gross <andy.gross@linaro.org>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9LtGafCd+QMY

For PMSAv7, the v7A/R Arm ARM defines that setting AP to 0b111
is an UNPREDICTABLE reserved combination. However, for v7M
this value is documented as having the same behaviour as 0b110:
read-only for both privileged and unprivileged. Accept this
value on an M profile core rather than treating it as a guest
error and a no-access page.

Reported-by: Andy Gross <andy.gross@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 91a9300..2f53dd8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -9229,6 +9229,13 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 case 6:
                     *prot |= PAGE_READ | PAGE_EXEC;
                     break;
+                case 7:
+                    /* for v7M, same as 6; for R profile a reserved value */
+                    if (arm_feature(env, ARM_FEATURE_M)) {
+                        *prot |= PAGE_READ | PAGE_EXEC;
+                        break;
+                    }
+                    /* fall through */
                 default:
                     qemu_log_mask(LOG_GUEST_ERROR,
                                   "DRACR[%d]: Bad value for AP bits: 0x%"
@@ -9247,6 +9254,13 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
                 case 6:
                     *prot |= PAGE_READ | PAGE_EXEC;
                     break;
+                case 7:
+                    /* for v7M, same as 6; for R profile a reserved value */
+                    if (arm_feature(env, ARM_FEATURE_M)) {
+                        *prot |= PAGE_READ | PAGE_EXEC;
+                        break;
+                    }
+                    /* fall through */
                 default:
                     qemu_log_mask(LOG_GUEST_ERROR,
                                   "DRACR[%d]: Bad value for AP bits: 0x%"
-- 
2.7.4

