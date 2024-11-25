Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569371njc;
        Mon, 25 Nov 2024 11:59:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2uZf2PcHb8NdSMJi9YhCND9CDkwkSjLdkE0SOS0Vc3Ta2chuerO10sb7tcl60xADAAHlC4etFX7ZjNA==@linaro.org
X-Received: by 2002:a05:6000:389:b0:382:37b2:87ee with SMTP id ffacd0b85a97d-38260b581b7mr12213951f8f.21.1732564777121;
        Mon, 25 Nov 2024 11:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564777; cv=none;
        d=google.com; s=arc-20240605;
        b=jyT2mw7kiBA96cv9Hb/1ZcqHzLk1UO+Il0LKx5hVOvBs8fELdx/KV9Uc2l/3eVZQPg
         BTyvCxaJKco+wQuspbp7ClbBaoDIXh2xti4dVXvO6pJyXqRklwqXEizxMunkErtoSUrM
         oVKDUZ6IBtxfX5Nn6vH/UwyO8arf9KhinYNPP7evNE3njI1HgY9haGOAKiN93ehwhHdD
         izZy62Hphl/2Ik3FPe6riD/EesrG1MTcPHq9NRMOQE9rAmKz18RANfM2vb+9YYoXQLKD
         Jf0gm3xIL0oIZOWgbdQDedYNw8Uyhxf+IlZTaShnjkKexTtkMpSHTcMyCJYOXgWoKqtp
         c7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EExZMgepRcWmxIXjjA6QAMdeM+PVS7qSljKvbhpCK2g=;
        fh=4L0BhTaOrQnWsoR7ad419vNBSyMsVrvzsNwl8q5Qd4c=;
        b=LTGPPBkIUjqnW8bfQwpnbBkRg2Xq5fHAkMeoXslKudXqsYgON4YoMpbDvW0AYK+jLm
         AcSbZlTMJJYpICtl02nbel+nVyLMJDr4Vl7/FDrlZPphGHgF9L80bJsjOSDSgCSAc9F0
         4XAQ430DCn5olC0iQFis+PDftwNV/qFIiWfUwwt4lscupd8vbQZ+5nvjXZSMjQvLPqcX
         gbQLa9oiCWNLFZ12cCjcF2xRfHBBTenB8HQdn7gQcURZqt187HGyE75lMgAGN5Czaax1
         GV9LfnI/DB9voU26W+B/C9SNDglyoejGq8GicvQvnnLB++DGq88KDkI6P8VPZ3YPZl8+
         fXYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YlNX4yIR;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-383986dc41fsor2401093f8f.6.2024.11.25.11.59.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:37 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YlNX4yIR;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564776; x=1733169576; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EExZMgepRcWmxIXjjA6QAMdeM+PVS7qSljKvbhpCK2g=;
        b=YlNX4yIRMP/EV1pnmT2vN9XIgekVvyfnu3ROd0p0ceT+nmiGZkAKmesuK+CgT0/YcE
         EPNkxXZzFKrSCoOJwA7mNhVTqLglzMYKbtgQPYLOXJzkWbvtmWLQTYGRgxe3AuN2D+2i
         /OpVYrUB72ukbvTJJlBFe9ZhLgakjFVhr1WQsKcIKpq8+RF9FiRZsQ7lw8cOPk0wwVaF
         XAZBKph/erZkv9eIZn10Yk+8JhUlXvnc9V2jGBzWfeunktgDFDAZzsCtp3vasGv7bHr7
         7A43lPIX7E0MaOtbdLfG6ObqMHp/qMA1aIGGBH6tnolYVRRWjIeVHPgo+bjV5W4+9hB1
         klTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564776; x=1733169576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EExZMgepRcWmxIXjjA6QAMdeM+PVS7qSljKvbhpCK2g=;
        b=lVHjSHsM/8fGWUpScD4t7cDYVsa3zubOmdFtgjeM36mL/K/TdJUePDedXw6o2NQB9T
         NxTuUXZqjProwhkGiSytJPyahLBplZRWFlrDQJ/Df6gB1Y0MRlhR4xHyDlAt6Bkpyv8n
         23m236uQo4D/95yOUWnFVManegJzXUzwcRzMthokf5C6WsIw7NoTMaowEliBx19yTBpn
         fgf6vZidIrlCiBo/SoHkEognzOxGmR3vP+/Ru01ECpsnseaonuIpOwT/RVqJTyvqc7pZ
         sHjnibHhuAAUtk9Oq0YNe++N5R2yYPfbf1fCPEhjJ5a57CJb1jSnkd7tDbHIGOwJnEti
         GaPg==
X-Forwarded-Encrypted: i=1; AJvYcCXRgkcers88kAaSjzh3JMPj0LXB8WgHibv5FfME149N4vpP2hfL0Tf6Ft4JX75eml6q1PtYSkGH1jHYoA==@linaro.org
X-Gm-Message-State: AOJu0YxKMfv46lyuwqvW0iVdr1NCNOmxZ2oxKKpesrbbdMvFzSB0Q0nT
	mQyAau4FLln9l0jOYaKkgxQxhpsrkYIxPLc2sNPDrVrpaCa/+zAq4E16mWL4UQ2EKw==
X-Gm-Gg: ASbGnctInV23TqR/l1rHashVTPBue+K8VQfD1mgaNMfl6Qztjnqz/y5+BhK8Y7wy5ri
	RrBAWAS7+Z8sEYQ9fJbxffzA5xBAgHDMf5smRngMhSsK0rQaBCfvfuk/4DjBHvR4HLuVJ/GlQWE
	X3as6Oj+O63XVx36CLJBR6IyKUf/KLLhSjwkqCyuyx7qfzu2HMqcMyOCK5Ufomim+cU5+Pboqcz
	MnnfNTCvZxeo1ikKxCF3214NknZu4ymrLYrMdeSRfQTISWsbVDh4myX2KVB9UQgN1tW
X-Google-Smtp-Source: AGHT+IEpRKX4vqQ5F4ReAVoyjQEr4k+dgtHCLaUTopY3J7lBIhLeQk4UiEwxtDtCCt9+elRt/DkjZA==
X-Received: by 2002:a5d:6dad:0:b0:381:b68f:d14b with SMTP id ffacd0b85a97d-38260bc860dmr13424465f8f.45.1732564776596;
        Mon, 25 Nov 2024 11:59:36 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:36 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH v3 21/26] hw/arm/boot: Load DTB as is for confidential VMs
Date: Mon, 25 Nov 2024 19:56:20 +0000
Message-ID: <20241125195626.856992-23-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Lz3rF147bsni

For confidential VMs it may be necessary to measure the DTB, to ensure a
malicious host does not insert harmful information in there. In case an
external tool can generated and measured the DTB, load it as is without
patching it.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3: new
---
 hw/arm/boot.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/hw/arm/boot.c b/hw/arm/boot.c
index 4cf7dd5b4d..20b3071339 100644
--- a/hw/arm/boot.c
+++ b/hw/arm/boot.c
@@ -523,7 +523,14 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
     char **node_path;
     Error *err = NULL;
 
-    if (binfo->dtb_filename) {
+    if (binfo->dtb_filename && binfo->confidential) {
+        /*
+         * If the user is providing a DTB for a confidential VM, it is already
+         * tailored to this configuration and measured. Load it as is, without
+         * any modification.
+         */
+        return rom_add_file_fixed_as(binfo->dtb_filename, addr, -1, as);
+    } else if (binfo->dtb_filename) {
         char *filename;
         filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, binfo->dtb_filename);
         if (!filename) {
-- 
2.47.0
