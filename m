Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2795923lfi;
        Tue, 24 Mar 2020 06:50:02 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuShUNA9Qqzq5C98dt8irZgF+LDVgcmjO948TF5lrngOMe0eRS5LVjNQNG0qQdKLkSNcxHQ
X-Received: by 2002:a37:888:: with SMTP id 130mr23994642qki.261.1585057802744;
        Tue, 24 Mar 2020 06:50:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585057802; cv=none;
        d=google.com; s=arc-20160816;
        b=Dl5cIJ31mZk8r4QwIb731QPh31U3ZoCmhWlmx+s6skd79BoEmUCBMhkQH/tYFUfn76
         b6/gX6GG9cMSDrhendSVukzRRAV8yBed2ddOQhFADtVIMQamebtm0YZxbJ1bCl7vjivk
         Lf6Io7Cv6PDtzFtswNkoNWcVXdZSgJbadDcpJCIAguIc1FYQeZfLQvRRSroKBgAxSrJi
         Rdk3re0pPQvWIhSxSQ0PfHOcsnIrPl35AITFfPoHcZA5P5ZQv9w1BVMuqDkNU8Z8/aff
         aZ1vQIQQIN+3RJEf+Z26YYTWZszrR8X9RaUIkWZPe7h9EtejpnstyOs29d48LCTWITtL
         AtLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=jwhEkemzIII9L6u5biTG+eNYmeN98eqT9fUUQ+VT1NU=;
        b=eg86Im8rDdrEqbMeWDOIaek5iuc719azqiflcJbOcSuprqlRDtdWjOrVnlv8/O4tjx
         MTxJ4Fp+pjZxds93Th1gG0nsyrXCTefgNKrqFlEj78SMA6Ok+OghSFiLF9fpcMYyRgXZ
         ckqh+Y9vQuaGanuPhBI2grxUOyTonO3j4JYgpiJH7VQJVQaYEpJGXrSX7nVt/DoqWuY/
         7dpiow3WZcNuMH2gIt6SY+2y+E49aECnxhMZL/LczKneOR8UvLz4c6y9vFbxEecIaPbE
         moK60SZUkweeNGtRxjvDxgdEKtxfyK9B1yHtq3Bg0uoFFtAJ1kctIyGFbE3ELFHz3F5t
         gZug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eIjn78ZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si3872988qvn.61.2020.03.24.06.50.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Mar 2020 06:50:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=eIjn78ZR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGjwQ-0000tP-3U
	for alex.bennee@linaro.org; Tue, 24 Mar 2020 09:50:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52198)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jGjwG-0000t1-Ah
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 09:49:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jGjwF-000267-E2
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 09:49:52 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55226)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jGjwF-000256-8r
 for qemu-arm@nongnu.org; Tue, 24 Mar 2020 09:49:51 -0400
Received: by mail-wm1-x344.google.com with SMTP id c81so3262963wmd.4
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2020 06:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwhEkemzIII9L6u5biTG+eNYmeN98eqT9fUUQ+VT1NU=;
 b=eIjn78ZRxmS5QVOAabVkIzkRsRfHn9T2OGUESA1SaUkCObGrzh/6VWMW1NZpL12dpG
 XJ78js96nt0kwLoDFSe+KcHt1At3U/FT9oXGq7BUMgqMZUBqvfyYPicLeT3aG4PxANfL
 OUsiAhqkT6Zgup0CjDh55Jl3fq0LwmKfkG5HMva4h9LXXU1pXWRdNWi7wvFrhLoulKhN
 jiJbYcx8sLcMB+QxBlDSXbqtMBE/qAzfLnuecRXUBKZsmKx7aHLZ0zwEucUlWz/3YSfR
 t4ClhSEpirMebqx2dyMR6jYyxJnJkg/xcvALdwMgFCfjrm8bXz37IQ8qEjJR3zEaCO68
 vMEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jwhEkemzIII9L6u5biTG+eNYmeN98eqT9fUUQ+VT1NU=;
 b=pC4DH2THqEy70BxV+0Hu/WnyxrrCq+ClmVpdfC8LiwbdkOHAOgkSkbAr3mvcVb13pe
 1my9ldU2YqqI4MPWSD2C1Q6mwDcJ7tXKHjukkXikhFceBADTDuPH7bet/TS/SS3Sg4uq
 vWenbwoBVDQBDKXoQKxcvYcrTuBbhiBgbDGqvMaC+RdFuk6i9/9vq9qGWYbzzFERd0Lp
 oIITjBSOdFOICndAwrLRiJsw841xvirXLX0JQiyrdPKpX9xhCYzrKnSIfjj8hIT8eh+y
 UHszy0XjABvwnmpP7dyWFttONtZ7b8Az5NUf9PavBWMXvKCj77GKQ714hBsvFB3OMArG
 WJTg==
X-Gm-Message-State: ANhLgQ3hatvh0krg8FlXUZHoqsgK7VWN+VUk3SXV3t0Yt02Xy1R5xX9x
 Lke+evoYc3iu3JZr9KOYbo9SI/iOroxjEQ==
X-Received: by 2002:a1c:48c1:: with SMTP id v184mr5760707wma.20.1585057789956; 
 Tue, 24 Mar 2020 06:49:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id k3sm4332067wmf.16.2020.03.24.06.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 06:49:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/arm/xlnx-zynqmp.c: fix some error-handling code
Date: Tue, 24 Mar 2020 13:49:45 +0000
Message-Id: <20200324134947.15384-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::344
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair@alistair23.me>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r635Ww9eQFo+

This series fixes some minor bugs in error-handling paths
in the xlnx-zynqmp device. The first is a memory leak spotted
by Coverity; the second is some missing error-propagation code
that I noticed while writing the first patch.

thanks
-- PMM

Peter Maydell (2):
  hw/arm/xlnx-zynqmp.c: Avoid memory leak in error-return path
  hw/arm/xlnx-zynqmp.c: Add missing error-propagation code

 hw/arm/xlnx-zynqmp.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

-- 
2.20.1

