Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472353njb;
        Mon, 3 Feb 2025 16:23:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWtSIZ/oH1dgIYGJAvhO6OD7s53q/QU1zKMg2sIhniCZTbdNT+ijafRtoe6qJ3n8iNIGkd8BzRNmxuyfg==@linaro.org
X-Received: by 2002:a5d:6d86:0:b0:38c:5c7a:dfae with SMTP id ffacd0b85a97d-38c5c7ae299mr16853617f8f.43.1738628593422;
        Mon, 03 Feb 2025 16:23:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628593; cv=none;
        d=google.com; s=arc-20240605;
        b=lHP3pTPDszLPjj4qZTGyhLd6yuQZS39MZyaTod5HzGgikiWBRUfLC9R/N9F7dGHgbz
         ZTgjLB7mcM9P6e8y1cT4M5MnnimVXXf6qRewE1OO428m5PzVnhIrK2USuTVikQsI8f3B
         erHQU9rmWyMbOSgQneHGsASzTtUTGt3uGD7eKjRlzUCQs3YckRFlr6+WR2RZxiq98PBV
         jb909prG1BCN9pqc84VkcS+phiV1TtuHLFFwseAkc+zMPlDxSdoMTZR82SU4+e/7i/TQ
         NwmU4fltx5HXrJQM8TfTObwIB4l/3zcymW+/ucZGBiaCmouivcKvzbb7OTLJ64E9Ntrq
         AclA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Xv7ipWNRcN94Y6xBwaNhx1NocVKRwkP8HpWZV1TV6v8=;
        fh=0pemPMqjsNRfxD/ZH2QtAENxjHSnDqGQ7nxL6C2K6iU=;
        b=bLOKBsIKEybaYRv0nkSJzTZBrf+G9zOCVlebf0ich3jlbgTXb4DjhTvr9p+vO//P1H
         e+pUFBVON9Q8O2GlISMlKV3ye2gx4Bk1KwR83bG4jZE47tTmU4GwNQ1bFFqCLvsSmZ9E
         u1r4Lc5/nC0vIYM47hcmoyZgodnQnMfhF8bdOLjH24Ipr/NTOgH1ZCcz0oFfAbWzzWYQ
         Obv56CN9+Aq5I5a5wNWS5qfvkRFcNLusHesIhXV9SBVQfzO74mQgW08Cugx3nsjZr8GK
         QjonmHqZXephpZ/6+XD0ODpBJUgIBOIQqqS9Zxl9kqmdm/+psD+fBf8DKm2wx9XEFuGI
         wTYg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I59qb8Gc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e23db37bsor36147475e9.2.2025.02.03.16.23.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:23:13 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I59qb8Gc;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628593; x=1739233393; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xv7ipWNRcN94Y6xBwaNhx1NocVKRwkP8HpWZV1TV6v8=;
        b=I59qb8GcfxxJjXc8x1gMSKg/UkB3WqRmqektm/wWuA5WocbpVfSJAmab8yMa8c2wcy
         4hI9TUGAmpc3RXbTyb6RZGby4wWceQxG7D/nzfrJlUvlHxmPPNQQyn6LaOgoMPHnn4sC
         LiJcyJkDZvcC49Pq3fQo0mNmZhqf96d6ZvJVveyN0PG+8ERSfMcVjp+3PPbB/CJ3VNRC
         HZ463cMH3pJZGQmEnObW/oxIgYcFzwx6oIgjOHYvZxwSxFtCrpDY0FMC3Uqi68MSg2YN
         Ava+719wU+k/AnnqP/FyvI7cI2XkmwwO1qFg+t3rarDU8lDWApvlkxn6ijySaLXhno11
         0Vvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628593; x=1739233393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xv7ipWNRcN94Y6xBwaNhx1NocVKRwkP8HpWZV1TV6v8=;
        b=kWcgDHI9eqDP5oijqfKCWKFVa/r9qLK0kx2UhGN+Blj5yDyJP47JDeaEm3Z7WOXFFD
         7hhhr69LK1ZArfJUNcUaPktA1dfla+5FZzvcN/7TkQFGmfffmTiliPd52NJK0ylNaCyL
         2Hz0sjFiwHMDMOfEnsImKX/CfJFlatgwU1WHlWpw7Oh6VWFaMBwsSIBPlfmxutvS/6QT
         BQBY7lF5bhPE9E+EV2lozWtblSsyt10P/48TqrTWRKFXrbjsuiOZ5fehNs0DqR0b5y+z
         hjV7A70j0M0Pd5Hbk10WuQ0JKHlf212eP7ioEZPj7QIoWBbkl4Nj+QJ18u21e6bTV+Rs
         /Cdw==
X-Forwarded-Encrypted: i=1; AJvYcCUNrNwfd8OxeOE7q125hZTL4x+1cp9GFIhU5yPM2hhxS3pitw83DSGEM0Fnw4YFZbKB1rYbzfS0qGastg==@linaro.org
X-Gm-Message-State: AOJu0Yw6v6+TbIWbp3vlOtRO7jdIvz8CWYh8YInBHyUM/RU5gDEyIYFb
	FXAnlHpeemqIqDYSpevVmzMPtV/HMwBV80EV0MVcPx2OadnaF504UFCDJxs7Q2vw0A==
X-Gm-Gg: ASbGnct7sVnolHIQ6XHAsgQO7UTtQt+frhm2l4b3ary2xr5+PjZkTgxE2qCVKtibUlB
	X2CpSneaYVtv+2PdP2oNiaiFn78UMt5Va6oDYu3UdiJI1oTcHprdmbM5rO2ieh0jNgW2Ioba2u8
	Rqw/W3+Z7xBI7CzAWqoPuUZVBzxpBXSDWp2MSUAXyNeQhDurAKyiWhKHu8iC32dbkrnbV3hlxX+
	njN5NTHBGGsffdt7XVUVnbQ/pcXzRpX9BO8ZFsWNrlWERi73fluOUrzIxsOlBascJq7Lyly9Dh7
	ag93jfRdOgCi4KbYfZlm+vfleJ8JXWcvBYt4HjLYiHZdYmqdcTZnNLkEIRPpger7Cg==
X-Google-Smtp-Source: AGHT+IEShj5+5fuL+Ca7d6FxwDebMD6TRS7A+W6gouISzty2rbwluQWaZ7ht+ESAAxKMO6d+ZuQ0Ew==
X-Received: by 2002:a05:600c:470e:b0:431:52f5:f48d with SMTP id 5b1f17b1804b1-438dc436f30mr214083465e9.31.1738628592858;
        Mon, 03 Feb 2025 16:23:12 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390692a4bdsm3295685e9.0.2025.02.03.16.23.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:23:11 -0800 (PST)
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
Subject: [PATCH v2 05/12] hw/arm/raspi: Consider processor id in types[] array
Date: Tue,  4 Feb 2025 01:22:33 +0100
Message-ID: <20250204002240.97830-6-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: aCg7UI2J859b

Expand the current type2model array to include the processor id.

Since the BCM2838 is indistinctly used as BCM2711 (within the
Linux community), add it as alias in RaspiProcessorId.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/raspi.c | 33 +++++++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index 571b50bef7e..1a6a1f8ff22 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -70,6 +70,7 @@ typedef enum RaspiProcessorId {
     PROCESSOR_ID_BCM2836 = 1,
     PROCESSOR_ID_BCM2837 = 2,
     PROCESSOR_ID_BCM2838 = 3,
+    PROCESSOR_ID_BCM2711 = 3,
 } RaspiProcessorId;
 
 static const struct {
@@ -82,6 +83,30 @@ static const struct {
     [PROCESSOR_ID_BCM2838] = {TYPE_BCM2838, BCM283X_NCPUS},
 };
 
+static const struct {
+    RaspiProcessorId proc_id;
+    const char *model;
+} types[] = {
+    {PROCESSOR_ID_BCM2835, "A"},
+    {PROCESSOR_ID_BCM2835, "B"},
+    {PROCESSOR_ID_BCM2835, "A+"},
+    {PROCESSOR_ID_BCM2835, "B+"},
+    {PROCESSOR_ID_BCM2836, "2B"},
+    { },
+    {PROCESSOR_ID_BCM2835, "CM1"},
+    { },
+    {PROCESSOR_ID_BCM2837, "3B"},
+    {PROCESSOR_ID_BCM2835, "Zero"},
+    {PROCESSOR_ID_BCM2837, "CM3"},
+    { },
+    {PROCESSOR_ID_BCM2835, "ZeroW"},
+    {PROCESSOR_ID_BCM2837, "3B+"},
+    {PROCESSOR_ID_BCM2837, "3A+"},
+    { },
+    {PROCESSOR_ID_BCM2837, "CM3+"},
+    {PROCESSOR_ID_BCM2711, "4B"},
+};
+
 uint64_t board_ram_size(uint32_t board_rev)
 {
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
@@ -110,16 +135,12 @@ static int cores_count(uint32_t board_rev)
 
 static const char *board_type(uint32_t board_rev)
 {
-    static const char *types[] = {
-        "A", "B", "A+", "B+", "2B", "Alpha", "CM1", NULL, "3B", "Zero",
-        "CM3", NULL, "Zero W", "3B+", "3A+", NULL, "CM3+", "4B",
-    };
     assert(FIELD_EX32(board_rev, REV_CODE, STYLE)); /* Only new style */
     int bt = FIELD_EX32(board_rev, REV_CODE, TYPE);
-    if (bt >= ARRAY_SIZE(types) || !types[bt]) {
+    if (bt >= ARRAY_SIZE(types) || !types[bt].model) {
         return "Unknown";
     }
-    return types[bt];
+    return types[bt].model;
 }
 
 static void write_smpboot(ARMCPU *cpu, const struct arm_boot_info *info)
-- 
2.47.1
