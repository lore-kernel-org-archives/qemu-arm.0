Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2472309njb;
        Mon, 3 Feb 2025 16:23:07 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWZXzdMW9IZ6677C3ib/kFI8uz8DNQrGgeBRsTnbHEi9TKGPGAOhEqe2wZ/g7Ynp7SotEenNCBPJkLLMA==@linaro.org
X-Received: by 2002:a05:600c:1f0d:b0:431:557e:b40c with SMTP id 5b1f17b1804b1-438dc4213f0mr207916025e9.27.1738628587114;
        Mon, 03 Feb 2025 16:23:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738628587; cv=none;
        d=google.com; s=arc-20240605;
        b=EHgCGBwKADCOtllo9vzqMxqrDb3mFRM54wlwxQS4fa56V+w0UROvOqYokFxo0MdIIP
         Ta0JEecAI152c3dbtLgaaTLoQmsqZc71VryARxxrHR72DlbLUb1PowyyVwcercj4hs0/
         23LpwU5+ZnXblFr+44P7SywdHUesi2IZZUfukHLvQRayQIVED3tIORJ3DsuH8nqh48hJ
         RHIguyZc2Tp3Fpx2161Es5/cAdARgA94v3AluGZLRuD5l15Mn2cn+s1BW299L/WF2gOE
         sCs0uMCuZYNMcAL7bvx04L2ySHVsVFLUxToylP9IA2ocxhvNSvlUaMEyUvzcDC7CJ60E
         zPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=qfi4/wO8QElC8iN/q4YQlATETcRX3ZkKT7f3+KqkqnA=;
        fh=P1b5t7w25KNSfzKYLTIh3n5+lR3QOxUdOO06Zo2ginc=;
        b=GaBJz03pghfFslGjwf3Rwt9nQplga/tEoGpzDL/5iFGXXUBXfUqEKZ85ddo9pIvUsD
         mFWa4vRRwMYNGRYGqb4wVuWTb7Y9vYFM8EONBAyGNw356t4ajcdE+eY62No04ZghRL3b
         GO8nd1PVj8srF+PnTRFnk7aF109FLWVK5lEa53yMr6i6ZkS90pQZw7I8CW6rnyYmrUwJ
         N0eBeVxfmdm0Yx29uiPRl/qehy8z74nELZ+2dbCkkzN1ZqQLys4BTg4zPyYSD2hjQwHu
         ZqnmPYEV572eXuaBaFzZrez560h6KW4iy3KMoMb+U/QcdRS/AS4kfUCav3HV5ascXsAb
         mRug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akWmkpHb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-438e23ea4desor52243165e9.5.2025.02.03.16.23.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Feb 2025 16:23:07 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=akWmkpHb;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738628586; x=1739233386; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfi4/wO8QElC8iN/q4YQlATETcRX3ZkKT7f3+KqkqnA=;
        b=akWmkpHbs4Cjp7UIMJ2dlBoLqi+ShLqhLEv7qULECOJpg/Ju0MML9SsfaTP2vClLxq
         +mw042ICXfMabr7+US8/JpHh6bzuYvh45HPYSgWXoPamaIO9SFKyKz0s491Ju1RrQ2m4
         kzb98YHB74eaeM3AJ9eKJ9s/gIMTcROuQEOSza91h/a6Ma2a/ESCjX92Xb71ek+2rdiq
         FAfa5Z+InJnl0AmnQ66upO1vSHJ3y6NsK7517wZc4vFezg2145GxpIHnmyeRJj5eza0f
         2jAhzUNUmGUaK2GHegNEPS8Bg0QWB+eaKXb38bQiDvSB2ajRP0Pr5ODrVuGr64esmg/C
         aXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738628586; x=1739233386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfi4/wO8QElC8iN/q4YQlATETcRX3ZkKT7f3+KqkqnA=;
        b=IZKqgg16KQdhzqZWIV4TieT7mYkJp98aMEEYLBTVT9JrEPQ587sMHz/68QJ/K119Ze
         D35JzmUHZ6n99wXHcDpRkAO7H0Vs43mADGtd54djxng3Zgz9aIGatFIm/s46FzbK1bVl
         iz2DbvQHpnLK4iT+tkpELwvKKbB8zuTO9iluHbq/BZbiKpY01Q9spxeMvBmEsXZjJLQT
         RcW8++SX5kMKCuo9mOrv6e4PRxRIEqsNLL36x6O6YuwsqBw94WDC5rrJUmn4rwlD1SxI
         HeSeuhgL7Fn2XXViQNfs1ULXu/Loea9DFZJbVSSB/WW+9TZrBPLIdqhnaQ+Xw3yZRg2z
         /4Ng==
X-Forwarded-Encrypted: i=1; AJvYcCWvJLIivQYEGvBhg0cwEhDf2cr51nPDirPShESghnzcfn1cU7xpBSokS9nbo8Oa2yIHeQ+4ACZNGFemTw==@linaro.org
X-Gm-Message-State: AOJu0YwIndn/TfvVx2Ga3DXHEOQP3SoBaYs2HQDjBmvXe84t0sJfrZra
	Hv+d3jP+BFPrJ07vtPY7iZf9BL0VoX98XkWZYzAD4hnttD/VSdidECKbqbe5sgJyhQ==
X-Gm-Gg: ASbGncvzA9zXGlnae8ogKseVCRr7lCLjI2fAE/YmvlmshvlBaClOG0VzVGQCTrZaPf8
	tU/hf9+UCJf+MamKKEiw3LpPvgD3QsqPLcCWJvXSMbeHZUVFTjmfj/EXkTmg0uQKyG2Lvr0+iyL
	3GpHdbNep2kezvV1vGy30y+yCxSCL2LGHIN+quxr49Jd8ql5tje9zJsmY/P5qNbLwgQUeWIu1al
	p6aLjiBZL54+Htc4W1dm2dnnNtur18SRodTRRffKj1MpxQGDV2en/uZqfDFV5g/mlaiq7FMF3dG
	8TKU7Va3xaQb4ElzwPF4wyXnj2hrHNKEPqDb1WXxiPbzz8R+idtjsWb5oNvRvfk+SA==
X-Google-Smtp-Source: AGHT+IGwtOzAO4uoqkoycfQcATaNBoRbxxp90e6mhPZc1FH4wFDyWxxo51d3PVPylF8GUURb7ah17Q==
X-Received: by 2002:a05:600c:5027:b0:434:a26c:8291 with SMTP id 5b1f17b1804b1-438dc40d36emr216466915e9.24.1738628586606;
        Mon, 03 Feb 2025 16:23:06 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc26d6fsm204375225e9.14.2025.02.03.16.23.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Feb 2025 16:23:06 -0800 (PST)
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
Subject: [PATCH v2 04/12] hw/arm/raspi: Pass board_rev as argument to raspi_base_machine_init()
Date: Tue,  4 Feb 2025 01:22:32 +0100
Message-ID: <20250204002240.97830-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204002240.97830-1-philmd@linaro.org>
References: <20250204002240.97830-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: zT+s49qtdK7e

Since callers already have reference to the RaspiBaseMachineClass,
directly pass 'board_rev' as argument to raspi_base_machine_init().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/arm/raspi_platform.h | 2 +-
 hw/arm/raspi.c                  | 8 +++-----
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 7bc4807fa51..defb786153b 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -58,7 +58,7 @@ void raspi_machine_init(MachineState *machine);
 
 typedef struct BCM283XBaseState BCM283XBaseState;
 void raspi_base_machine_init(MachineState *machine,
-                             BCM283XBaseState *soc);
+                             BCM283XBaseState *soc, const uint32_t board_rev);
 
 void raspi_machine_class_common_init(MachineClass *mc,
                                      uint32_t board_rev);
diff --git a/hw/arm/raspi.c b/hw/arm/raspi.c
index ef94d57dab5..571b50bef7e 100644
--- a/hw/arm/raspi.c
+++ b/hw/arm/raspi.c
@@ -254,10 +254,8 @@ static void setup_boot(MachineState *machine, ARMCPU *cpu,
 }
 
 void raspi_base_machine_init(MachineState *machine,
-                             BCM283XBaseState *soc)
+                             BCM283XBaseState *soc, const uint32_t board_rev)
 {
-    RaspiBaseMachineClass *mc = RASPI_BASE_MACHINE_GET_CLASS(machine);
-    uint32_t board_rev = mc->board_rev;
     uint64_t ram_size = board_ram_size(board_rev);
     uint32_t vcram_base, vcram_size;
     size_t boot_ram_size;
@@ -384,7 +382,7 @@ static void raspi4b_machine_init(MachineState *machine)
 
     object_initialize_child(OBJECT(machine), "soc", soc,
                             board_soc_type(mc->board_rev));
-    raspi_base_machine_init(machine, BCM283X_BASE(soc));
+    raspi_base_machine_init(machine, BCM283X_BASE(soc), mc->board_rev);
 }
 #endif /* TARGET_AARCH64 */
 
@@ -399,7 +397,7 @@ void raspi_machine_init(MachineState *machine)
 
     object_initialize_child(OBJECT(machine), "soc", soc,
                             board_soc_type(mc->board_rev));
-    raspi_base_machine_init(machine, BCM283X_BASE(soc));
+    raspi_base_machine_init(machine, BCM283X_BASE(soc), mc->board_rev);
 }
 
 void raspi_machine_class_common_init(MachineClass *mc,
-- 
2.47.1
