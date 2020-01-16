Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp8683591lff;
        Thu, 16 Jan 2020 09:44:04 -0800 (PST)
X-Google-Smtp-Source: APXvYqyX9oxtLYafZuUdpWmOougmwYIeLFFGYSdQ/Q/pX/QKLZyIKnOOyB76iaNjboNdsRdRnO9e
X-Received: by 2002:a17:906:19c8:: with SMTP id h8mr4181203ejd.250.1579196644272;
        Thu, 16 Jan 2020 09:44:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579196644; cv=none;
        d=google.com; s=arc-20160816;
        b=B7eNdwlp0hwGCZAMywuaGSYE6WoOinANN4mPWdVMdBuct05NiG9YxS3q4WYTvyVgFh
         SxDuIhytR2ESaPYUcLO8uvpo54TzIOZUOWav/Cvyfh3YvkIjWRi7xbbvkHhM936Gv50f
         CpcDUbXPTZ2lZN3xykReF9SRZj+0i2sAOA7DvI/Ko9qBYQRPTFNRK2Zm0cCzkSfMKspJ
         r8X8gOVGmCzWpb6WVIAXxkr8knZt/ITYvpimtgjxjVPYO08sbbKGnpgLefe4JvoVOXf9
         lteuKbTNcEKU1LGfVivgxEcoN/sBgFjcUJD4YyqY3VD4FGfFI1DX4ad4IIgrI4Iig0ew
         Frsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=rotpn64p7f0JzbmAl5UYYA83qOj/egKaEQ0Cnoo5p4U=;
        b=U8E5Ga8FuiRlbfvL2lnobTR308yd/ArelUf0jQz0RLkbAqPx5fvUP3KXN+k2b5SVe7
         Ibv2PmxPqNEKjDKpeVkM9tDBrHfi45cp8j+ttn9gajtSghMyLsS/Edp2+fVM7Zamv3/B
         0/jC20CcbvRPS8bmJIw/Yy4XmhkvpPunGwhagywrX2Dhdm/mVco1asJcZXG4+y2F/cVj
         W7yNldMXMBlzOpdhBJspr45omM6+kMh1GhsHPR0WgwZwZj8zoiQPRmRGKD7zHyzA5vaj
         feoMozNuJYlp6cIB8KLmW8QwcuowcMZulglVhJUMcaRiHBMoZnj4urFoQNmSbhSV7/1s
         bOvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=U63FYOnI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bo19si13322786edb.511.2020.01.16.09.44.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Jan 2020 09:44:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=U63FYOnI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1is9Bb-0004MV-56
	for alex.bennee@linaro.org; Thu, 16 Jan 2020 12:44:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59391)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leif@nuviainc.com>) id 1is9AS-0003az-2R
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 12:42:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <leif@nuviainc.com>) id 1is9AR-0005gR-1v
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 12:42:51 -0500
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:42096)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <leif@nuviainc.com>) id 1is9AQ-0005fL-M1
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 12:42:51 -0500
Received: by mail-wr1-x441.google.com with SMTP id q6so19964352wro.9
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 09:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rotpn64p7f0JzbmAl5UYYA83qOj/egKaEQ0Cnoo5p4U=;
 b=U63FYOnIwARwZjUm+R3MDuycOhA+tqE998VEqgSaErxVtnsIb2/sFo5ezWM5SACX1k
 EhrdZWadmOv/uZzhT1FRsN5aD5CHOfGLscCPsRxCq/8H1JTgqED1eJInUfXwK7PXf+Yh
 88X6xFrO8wMCD8PlnG9LhXZxrMRtTFA+HfhWOGBwRZJ4nmKGg6jmQCJSGVFlJA0mXvHe
 8QUy1PvW1Z2cwgnGb1L02m9RhO06ei6ScWz+dxUE5gclA/zkg6D/iNQYy/9KHDlLsAxE
 OK3qaY7P0bM3tXlmGezYZwa127umpFIAQypr1rfiSQGIiJ7c/gE2wfDPUrRbe4TMChJW
 HF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rotpn64p7f0JzbmAl5UYYA83qOj/egKaEQ0Cnoo5p4U=;
 b=qPqRLn/K66EhMVC8Xb0IH2Fze0Bp6BX1LAzFgcQjBEWMMgZuuhVtcHk6mmvbAoK6XR
 jUbkUiWGjXCAPLMCi+oaD4sw5nNKbJJ4EgXATHq1ydkav1j9wnvTOBgRhJrmFy+gZOn1
 1EJNtuLaiRgi6uZ0a4iVuLbhFXl7c7BgTTVSKWVisLjsCC5GCLicLBIxxbsU3lZWzb83
 b2R6lwiPEl6GWlBVVJ36zIpsnqQDdkQMdC57R9425glnDacvu2HrLPcIi5h48uYdMzlO
 QoeybII6ZvBjbSJMDE58wfnaCz0DuVcocBj1IelDbEvtyQbMH0OoeU8kTZbMGVl7Fxz6
 3fLA==
X-Gm-Message-State: APjAAAV6znis6hf/7+dgF4rDR4IeBF8MKTEGL06qMka0yIgQ7FrFj+Vj
 GVNMWBXz79ovscISLNW+w3Sx/HRatqyddlfZC/3Zc/xYFSQlI75v9yG9FAwmQoMoQsqLF//Oc5/
 9fk7k+PsOniYytj6Msp5yNydiI9APdb41jBimDEOz9lalQ+C6re2rhijk8V8zYfrY
X-Received: by 2002:a5d:5091:: with SMTP id a17mr4467664wrt.362.1579196568415; 
 Thu, 16 Jan 2020 09:42:48 -0800 (PST)
Received: from urvogel.hemma.eciton.net
 (cpc92302-cmbg19-2-0-cust304.5-4.cable.virginm.net. [82.1.209.49])
 by smtp.gmail.com with ESMTPSA id r68sm124384wmr.43.2020.01.16.09.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2020 09:42:47 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] MAINTAINERS: update Leif Lindholm's address
Date: Thu, 16 Jan 2020 17:42:26 +0000
Message-Id: <20200116174226.4780-1-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
 Leif Lindholm <leif.lindholm@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PIc88uFVSYpo

Update address to reflect new employer.

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 483edfbc0b..3c8653f26f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -735,7 +735,7 @@ F: include/hw/ssi/imx_spi.h
 SBSA-REF
 M: Radoslaw Biernacki <radoslaw.biernacki@linaro.org>
 M: Peter Maydell <peter.maydell@linaro.org>
-R: Leif Lindholm <leif.lindholm@linaro.org>
+R: Leif Lindholm <leif@nuviainc.com>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/arm/sbsa-ref.c
-- 
2.20.1

