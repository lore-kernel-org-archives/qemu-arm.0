Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp864927wrp;
        Thu, 14 Feb 2019 03:34:34 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZaqaoOtbcEbAA3Ia6AOmJSAVYm5vlF/0k7auGhgdJJRSwEO/FgcUvVtUkjk2swnvT14rDu
X-Received: by 2002:a25:16c6:: with SMTP id 189mr2577099ybw.17.1550144074898;
        Thu, 14 Feb 2019 03:34:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550144074; cv=none;
        d=google.com; s=arc-20160816;
        b=OlDe/doIvx0fkOSfBl8HSWGS4/qhJZ7ppiZy6Yf9mFW6blgoUT9tXknr4GOnAKRNmz
         GD6syEGk45h7AJ4HBWF0zG+fQt1JwcL935rQX2Wf9D06McR7ENFpyarLsLrctaenN2Ou
         0nAW8V/gJ+4/uBoplyD9wuZCN7vhkQuSx4cOOHOFFrYovX2P6FKF6BuAJOgp3CxqyKni
         TBijqxBHJJdENJX3NT/QRQneYGYY8QcLJYGhJC0L2Mjxy49lhSN+hEyfh8k9Ew2Ub8zz
         bctEPnbNkGLfM1oPUv5ra+4NDzcFHQ8ltDQFCXPvyIHCvSqu1kdrBHuB1Jn4krOl1NDw
         g6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature;
        bh=iX1skGwvvJGFENnn/ez6jeDMPRxcBgS6Sl8tAEAfTag=;
        b=fZqzxemd/alFo7psJkyfMi2aj2v4Vy+MZ0aHVCO6Bpeyd2sQmo0U5Ux2O2zTXE0VMW
         KPnXqWH/CS45xngl5aKLYPbfUyukdY8+yuzj1XB6vAIMWkrWibHtZKCdhvoED7aFTVTz
         gtMt9eHI8FfCPSdSd++984T3boCexq3dnpSAqK+IqWIRCxgvI74dMNpHzPtWqMdT7NSZ
         lyZZHRYM7vhHxxYG3SSXq0PITJ6B9SL0vH0ogLpkXI507lownB2gWaeMgNejjCV8br4I
         1wM/QiLl9yAAgP1kkdySqf8N+/lzVFOSEE+PjDTDx1L8rGftuf9BiMSDalbjjmW8DoOa
         cEvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hKlEfJ2I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1si1184538ywb.38.2019.02.14.03.34.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 03:34:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hKlEfJ2I;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:46952 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guFHm-00042L-CO
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 06:34:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33963)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guFHQ-0003wa-WF
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 06:34:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guFHQ-0008MZ-4h
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 06:34:12 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:45590)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guFHP-0008LB-Tt
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 06:34:12 -0500
Received: by mail-wr1-x441.google.com with SMTP id w17so6048115wrn.12
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 03:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iX1skGwvvJGFENnn/ez6jeDMPRxcBgS6Sl8tAEAfTag=;
	b=hKlEfJ2IWHwv6qAiwTeEG/ze9UIi6QeVZWl9oY2tsuGSmTHBK6rEXmuzhFmMOdI10/
	1fvF1NVvKxiTJbud9DZ7p4y3sWyOY6ILQko+GqK8FnHdFUVH48k/pz+BA7QP9ejlXKIK
	lk9k6/vpdRkODiVCbFXjNHPax4uA8cdk48JdS1XQY64u9b/WmaWEfO6h771m213ZBoRA
	7n1imDI0ubiaLeVSoYeBcdNYvFs4eqSjPSEFCmiokvvAKgycxrsgKdEdiEqSpdzh8HVm
	FN0wnJbh/3cjIgcAlFdSTEjZdRkYTXep401K5YZJZn1k6iuo4Xj62EdoI8bxOexA7OwC
	GEDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=iX1skGwvvJGFENnn/ez6jeDMPRxcBgS6Sl8tAEAfTag=;
	b=e41Coa/jWU41duKdarP+cL5un11RCjjqzxqlSa8Ech5R6M6ZyqI9wE5oGKUHCjueXf
	QF9jRNC2qjL54mHhxMm0VWRgmDdSsrbwXwQ+ouO46BtgJKprhaHUZdy2dwhXtsWtiiJZ
	jQOvRL0jv6gIICoucmwTXjlw9ik5Tgh2AIaIYG/tSv80Hkx2w5iuZIdPWhISUgrfvbLX
	zxT3sxNOgPOkPwIreDFj6MRc+KTblDY1VC4+428LFqlNjVsHw3fzWzeN9HBikJYdcn74
	12liGhmAZlEEFzxl8s1faJl+w98mIWcGUpYrtkYB/YvNKyu3QvSAXFNX+3Al0ZvcNjY/
	XGKA==
X-Gm-Message-State: AHQUAuZXnXEXFr7hb2zc0QQZ7AJ8Zx4+pUC5CDn7/yCPLmSxrX5TUx6M
	sfhGZ+jMMTGc9pAs+/5KCsNJaP6g2CWpgw==
X-Received: by 2002:adf:d08e:: with SMTP id y14mr2474227wrh.306.1550144050205; 
	Thu, 14 Feb 2019 03:34:10 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	b18sm2195399wrr.43.2019.02.14.03.34.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Feb 2019 03:34:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 14 Feb 2019 11:34:08 +0000
Message-Id: <20190214113408.10214-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: [Qemu-arm] [PATCH] target/arm: v8M MPU should use background region
 as default, not always
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
X-TUID: M0N22Anb0tRV

The "background region" for a v8M MPU is a default which will be used
(if enabled, and if the access is privileged) if the access does
not match any specific MPU region. We were incorrectly using it
always (by putting the condition at the wrong nesting level). This
meant that we would always return the default background permissions
rather than the correct permissions for a specific region, and also
that we would not return the right information in response to a
TT instruction.

Move the check for the background region to the same place in the
logic as the equivalent v8M MPUCheck() pseudocode puts it.
This in turn means we must adjust the condition we use to detect
matches in multiple regions to avoid false-positives.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
I found this because the incorrect TT response eventually resulted
in the Zephyr RTOS writing an invalid region number back to the
NVIC and tripping the guest_errors logging.
---
 target/arm/helper.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 0f5eb3229b7..d3e15585c25 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11291,9 +11291,11 @@ static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
         hit = true;
     } else if (m_is_ppb_region(env, address)) {
         hit = true;
-    } else if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
-        hit = true;
     } else {
+        if (pmsav7_use_background_region(cpu, mmu_idx, is_user)) {
+            hit = true;
+        }
+
         for (n = (int)cpu->pmsav7_dregion - 1; n >= 0; n--) {
             /* region search */
             /* Note that the base address is bits [31:5] from the register
@@ -11331,7 +11333,7 @@ static bool pmsav8_mpu_lookup(CPUARMState *env, uint32_t address,
                 *is_subpage = true;
             }
 
-            if (hit) {
+            if (matchregion != -1) {
                 /* Multiple regions match -- always a failure (unlike
                  * PMSAv7 where highest-numbered-region wins)
                  */
-- 
2.20.1

