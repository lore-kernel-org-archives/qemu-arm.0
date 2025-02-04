Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472607njb;
        Mon, 3 Feb 2025 16:23:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUu98ZxyVgRyunwHMC56APEyfxB/IBWPsxGeF0JWSkEV/1ES7umOClvR4nCzuIkB5Thnl138HmG0bLP6w==@linaro.org
X-Received: by 2002:a05:6000:18ac:b0:38a:88f8:aadd with SMTP id ffacd0b85a97d-38c520a64b7mr24045818f8f.53.1738628632330;
        Mon, 03 Feb 2025 16:23:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628632; cv=none;
        d=google.com; s=arc-20240605;
        b=dV7eKDysUP4P7b+ohXPHG1sIE5Zr7QVC3TRnFyyzDo/4j7KIk8KVNcJxVg6TDc3351
         hU2/+N7dTHquT0fjpXXZT5poGoTi+F9YRNFVa7Mj9yRUCrNp7gn1LDvvXtQeSdmXoR/G
         5DARf+m//bjiUFKn9UcCUJAhM0ycPybRHIhz//aYQT8mZyY14ebu5oxXcQtzaRW5N1bg
         qXtWkpusxjfDdBFUEtKz4WN5w6dpASJbThR01js1ygEoi82I4YMh8haSyQaRofFVb8ZG
         zEemYRUb4kCMMIkUEN0m83b5N0QrG2LorQck8dsAWgJXcZuADa+WAyp4thxKoRBAwoR5
         lxOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=KA2PPeT4tEXlHcRLWASfffMgNqf9rFhBVYtXHQy1PNU=;
        fh=08D/wt2dFRAijVSxXtsrjZo5OyCe+BAD8+rAUdJ6jQ0=;
        b=cDHbmMnqfuF3VEFDz/Qr0/78AQCNBeGpDzIS2W6nCfIXHaQ5eToDyBjhzvFoOlZenU
         8nYawAXF3RCigGb+skJ7b1+4uaWErxGcCtny0pFrJZ0wFIwT6TsLgRKeZmYzT+ito4lC
         jtmL8joJLWY8iYJ6Tte7KiTKQD6OlHkNWrdebhVYfUXQHWokBYz+90tV+tNA9KHr6foR
         N/Jjhy5UkBcsyFPCym3Y0oexa73zqsH38OnCqG4Rlz/wJGxt9+88UuN49HdM9iPlk5YK
         6qBM3PtB8vq0TYI2uuMnuZD/2jwUY9q10C1Al8AbFSRinyCN8vdyxpz5KNV9OzvuTBVF
         C7fA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zoJEvR+N;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e23dfaedsor52253335e9.3.2025.02.03.16.23.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:23:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zoJEvR+N;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628632; x=1739233432; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KA2PPeT4tEXlHcRLWASfffMgNqf9rFhBVYtXHQy1PNU=;
        b=zoJEvR+N0Jri+zORj8KNQZp4kLgOev0/21+MIcgdll4hYEicGZG4DGp64Xc549lssB
         qgag3VwoZ8iCyhaCo+vYhF/Li74MkIqhAbY8LD2B9ZQPH/1YcGgr6e8eF631e4/M1If6
         NrR16aqTTwxGaqpJ/SlbtpFL8w0DAuBNnSBysAScmF1n6doNzXpMcSilH4uJd0oHqd22
         txBWpYupieYwO9ObPeCOTx2dwXjuBhMu6vno0LR4IrdSeSXgA3NujkudodOGl6ITF728
         a9/75z931UU6GQ+HMlb6GM9vCNuzI1wCfytfLHtjveh7JF91x3j9kpFyVH9xk1B8+r8p
         Ljrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628632; x=1739233432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KA2PPeT4tEXlHcRLWASfffMgNqf9rFhBVYtXHQy1PNU=;
        b=sG8QQVEZv4zHE2gY3WtGL3mmwCqt43LqYQZfc8SLgLE5H3mUPhogABr6PcQSkLn7wO
         7IWdrSffs5yN7YR5LZUWUe2alcpAsPmLxHRyYkJWqPLzxDZ2j9h1xC+KoYnSlb2djgUf
         3jsdQgmMuLaD5Z3i4uFxrcoisKM2TOqJXMzFD0AoQhLE0CsUdJFxZ5BcPauczKuwVAHf
         oo82y4Qsgpq++9Z/FxBSC+hRutjCgJl0iM6bhOQGphyLCBHPPod1xke3PpEips26H323
         3k79l0nDHU4UFYAKMcl8F8l71DY1+gyWZxdNLclqV4vIunIlye0ezMb2Cm7bixmKo4RS
         kkIw==
X-Forwarded-Encrypted: i=1; AJvYcCVBJnakgDV8xDue3CD+nY6f7uJlvOI9n9eu3ddPViErSKrB5P74o9vo+/ULZ3htmu21JaKNfi3dCMoDJg==@linaro.org
X-Gm-Message-State: AOJu0YxBSLyi75AaulBvHgnjmX+Yb0j8a1a9qNJGrE6Ufpotwb8BtmJ/
	1pcjYH51YCnQAuAyNgM1Wq755jUeBHQSs5xjX34j4xbAzxCwAWhU4ergHcq8Iti56g==
X-Gm-Gg: ASbGnctVJ3VfQOtf/29rto2eQaLvm0CmKErKUavGIdywSquoepnRGeaHak7EiMwcZLT
	DpLg14ImhZA6Qh83sAq5h6yyEoNsxeoPycVh8BVtmv/fEIYlqovyexgUBZ39+0svrJa20gw5y8V
	iBdggrkwqHr8KMLgCw3o1QPXHRB5Rccd9IG49jA+9cbrGG6Rw7259H7Ipb151PbPPETXt8b4h87
	zmo6w1Z3+wWPeNNveYdZBtxO56N1LzAdGBKxagUw+ZiT/VE4fvj8xDL4+rnsSvy7J4W8C0YSb/b
	2C/Y/Umk1lmHDkNgePWmACy8JipPruBIfJcuQG8EHsOSsSM3LBj8o4QP+qvc+BnbkQ==
X-Google-Smtp-Source: AGHT+IE7Rvp8IWHSG8TN0cuLH5HU1vI0hraFlRdcsxcb82PnxgLdH74SRsYB5zKwwE/skHQ3fqKOMw==
X-Received: by 2002:a05:600c:5486:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-438dc40d3fdmr219161265e9.21.1738628631843;
        Mon, 03 Feb 2025 16:23:51 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438e23d42dfsm174646505e9.4.2025.02.03.16.23.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:23:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: [PATCH v2 12/12] hw/arm/raspi: Support more models
Date: Tue,  4 Feb 2025 01:22:40 +0100
Message-ID: <20250204002240.97830-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: BWls8z1aIvY1

Allow to create the following machines:

  - Zero2W
  - 400
  - CM4 and CM4S

Fill the arrays with the BCM2712-based machines (raspi5),
but since we don't model the SoC, these machines can't
be created (and aren't listed in the 'help' output).

List taken from:
https://github.com/raspberrypi/documentation/blob/9b126446a5/documentation/asciidoc/computers/raspberry-pi/revision-codes.adoc

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 86ecc988e06..2346550eec5 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -71,6 +71,7 @@ typedef enum RaspiProcessorId {
     PROCESSOR_ID_BCM2837 = 2,
     PROCESSOR_ID_BCM2838 = 3,
     PROCESSOR_ID_BCM2711 = 3,
+    PROCESSOR_ID_BCM2712 = 4,
 } RaspiProcessorId;
 
 static const struct {
@@ -82,6 +83,7 @@ static const struct {
     [PROCESSOR_ID_BCM2836] = {TYPE_BCM2836, BCM283X_NCPUS,  1 * GiB},
     [PROCESSOR_ID_BCM2837] = {TYPE_BCM2837, BCM283X_NCPUS,  1 * GiB},
     [PROCESSOR_ID_BCM2838] = {TYPE_BCM2838, BCM283X_NCPUS,  8 * GiB},
+    [PROCESSOR_ID_BCM2712] = {NULL,         BCM283X_NCPUS,  16 * GiB},
 };
 
 static const struct {
@@ -106,6 +108,17 @@ static const struct {
     { },
     {PROCESSOR_ID_BCM2837, "CM3+"},
     {PROCESSOR_ID_BCM2711, "4B"},
+    {PROCESSOR_ID_BCM2837, "Zero2W"},
+    {PROCESSOR_ID_BCM2711, "400"},
+
+    {PROCESSOR_ID_BCM2711, "CM4"},
+    {PROCESSOR_ID_BCM2711, "CM4S"},
+    { },
+    {PROCESSOR_ID_BCM2712, "5"},
+    {PROCESSOR_ID_BCM2712, "CM5"},
+    {PROCESSOR_ID_BCM2712, "500"},
+    {PROCESSOR_ID_BCM2712, "CM5lite"},
+    { },
 };
 
 uint64_t board_ram_size(uint32_t board_rev)
-- 
2.47.1
