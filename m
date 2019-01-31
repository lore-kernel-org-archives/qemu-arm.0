Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp6750319wrt;
        Thu, 31 Jan 2019 03:24:46 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5a+e/RFht0AVzbndJGI17mtBWHbv2ch1OFmyrDqaD04+et0YFMql38HksIJzixC9SzMy1L
X-Received: by 2002:a0d:d983:: with SMTP id b125mr33085135ywe.344.1548933886372;
        Thu, 31 Jan 2019 03:24:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548933886; cv=none;
        d=google.com; s=arc-20160816;
        b=OK01uhgW9MrN868poX97hyd/nk6jhsOgpAwHBr+goLCvE3Qt1gzDyq5+XvxRjwjdKp
         8OHyLRkyCRg+k6vp6jA28p5BEXaQKRdSONMqGnnD8UfQm8a4Ud+W0qWECxlsb7oV4h4H
         u1rSVMn0E15t63sP3RomCyZDYnuwzBRB2mqnswA7HZb6p4p7/0I3eH5jqfOD6CrZzec4
         bq6K6SjhaUxq7XDXfjAaUuNFPZSCCKHRviLknIzYr683oBxps25+1/pQy7zj+iTPm2nN
         +exwtoKKFq/FPI0ensoRdwboXME+DWZpzBCQGSCHKN0u6ruiS1lW/CAu8CVCWqRoRsY5
         CpwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=EHYltQzbjdP9PXVUsQa2ZBGsmLHSOC9Kk9ZVMjL3noU=;
        b=puhQkAVHdSTV7CcGHBMHSQ4Wt3WOqBmiUbd4o5qJ11PfoIyBhXNYS2fzvS6OMqW/3j
         RbJ4lA1ibOvczHMUnNDZpdrrDHeWueYF506xdd23QgeyVRhBBoGyAtGDGA/yt+oOAEOc
         5FNEa9tzjKMWpqpL91ZfT33KQNftsaZGZRLIAV2pY34v6QWTezWhz7khdYsrJ4oRfmw9
         jGW4oIkWPi8/MzTqt+N6iaZCbkbs68v2HZjd65sFzbClHgrYmbsQXe+K6D++RXIDPnOW
         EMKxM56dxwON/t5ql+6I3kBHFWmmN+1/A1WGfYe6faeifcJw3UF+9rd47fAKZIxeqCTl
         Vfrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WTIAGQTO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g64si2465906ywa.72.2019.01.31.03.24.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Jan 2019 03:24:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WTIAGQTO;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53046 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gpASb-0003DQ-Oy
	for alex.bennee@linaro.org; Thu, 31 Jan 2019 06:24:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55529)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQm-0002H7-35
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gpAQl-0008G0-8D
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:52 -0500
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:51623)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gpAQl-0008Fd-2G
	for qemu-devel@nongnu.org; Thu, 31 Jan 2019 06:22:51 -0500
Received: by mail-wm1-x342.google.com with SMTP id b11so2098280wmj.1
	for <qemu-devel@nongnu.org>; Thu, 31 Jan 2019 03:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EHYltQzbjdP9PXVUsQa2ZBGsmLHSOC9Kk9ZVMjL3noU=;
	b=WTIAGQTOaOF0X8Ot8qKFJaLeCnZEEd+aSniq8xo+TNCsgK5c+ceSMIBx2ItlgXfR+2
	vLc/KmOtOUMQn3BUFUI/nWGPrkC46DgQ7WP9UqGBiU7OtBgtYssrL1EHR6P1/99CHV36
	WLF5B1tedYF8f4GnyVSC5FN00+UW5mDLoUH6g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=EHYltQzbjdP9PXVUsQa2ZBGsmLHSOC9Kk9ZVMjL3noU=;
	b=hscYtxL1kB+k9PA7mgfTkX7nEuQfStpqpO2RynnlrkAaHHYbUHJ2WYIa++6dzThbPa
	/0FfYYZaOIKCf9jKog4LuV2W5HAwR+d0Dq4tktbQnsZEI52hGyzT3OGzVuGkCTRfu4Xv
	/5MHgyxNcofqbz/n7yGTRkiAfZa2mQeFhyxjCXoAdUfCfuAHUY3TeLNURolS9Pqvr74/
	ZMQF9heke0pgczkEM6WdlxLP+tQ6Yozlz09Ci6nG7zD1x3hDdNP8Xdd5eFNj4at1gQQA
	6Z28ubvEnJ/aBT95DFYpSsa1NXEnHhIBEN6IIiD1wmaOcIL7ybYJ+Yqm6nzBMe0BCxWG
	c/cQ==
X-Gm-Message-State: AJcUukdSonvg5tD9R+0Vt/UYASyDB1+aesumnZUbV1ukOxYyGuuG790O
	tgB+Qs1c/lEKVu611QUmnj5Ehg==
X-Received: by 2002:a1c:342:: with SMTP id 63mr23470973wmd.34.1548933770150;
	Thu, 31 Jan 2019 03:22:50 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id c8sm4078173wrx.42.2019.01.31.03.22.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Jan 2019 03:22:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 31 Jan 2019 11:22:40 +0000
Message-Id: <20190131112240.8395-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190131112240.8395-1-peter.maydell@linaro.org>
References: <20190131112240.8395-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: [Qemu-devel] [PATCH 5/5] hw/arm/boot: Support DTB autoload for
 firmware-only boots
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
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Igor Mammedov <imammedo@redhat.com>,
	patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AOXhSjUdQNFA

The arm_boot_info struct has a skip_dtb_autoload flag: if this is
set to true by the board code then arm_load_kernel() will not
load the DTB itself, but will leave this for the board code to
do itself later. However, the check for this is done in a
code path which is only executed for the case where we load
a kernel image file. If we're taking the "boot via firmware"
code path then the flag isn't honoured and the DTB is never
loaded.

We didn't notice this because the only real user of "boot
via firmware" that cares about the DTB is the virt board
(for UEFI boot), and that always wants skip_dtb_autoload
anyway. But the SBSA reference board model we're planning to
add will want the flag to behave correctly.

Now we've refactored the arm_load_kernel() function, the
fix is simple: drop the early 'return' so we fall into
the same "load the DTB" code the boot-direct-kernel path uses.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/boot.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index cfcfdf421cf..8e792a911f9 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -1219,7 +1219,6 @@ void arm_load_kernel(ARMCPU *cpu, struct arm_boot_info *info)
     /* Load the kernel.  */
     if (!info->kernel_filename || info->firmware_loaded) {
         arm_setup_firmware_boot(cpu, info);
-        return;
     } else {
         arm_setup_direct_kernel_boot(cpu, info);
     }
-- 
2.20.1

