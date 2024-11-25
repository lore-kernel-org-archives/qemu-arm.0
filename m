Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1569388njc;
        Mon, 25 Nov 2024 11:59:39 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXg6ie79xdJ/vqEjIXQaF+ZnKEbqwte1v8X79Lf8naB4KjeCSsTgGXsw20g833c1yeqWvsrXVQMBFdU0Q==@linaro.org
X-Received: by 2002:a05:6000:154b:b0:382:5295:b33c with SMTP id ffacd0b85a97d-38260be4135mr10813314f8f.58.1732564778835;
        Mon, 25 Nov 2024 11:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732564778; cv=none;
        d=google.com; s=arc-20240605;
        b=NgVbHi6mNF98JgYoYDZfVihnDjeHlB32lJ6Mzn8oZq8+CrX3BV4AyntL88WtliY33x
         b30j2n7KHzgQ4fTOQTTbBXIODvykzjdEl3eC9JoEhSG2oQkV5uWUKbihLTpC3mZlixkH
         NH4w5OViwwK5aWtp0VLnChTztpQny8a/WXxono++PY82aDutNUZgl+YW0rBfMTgPvVRD
         U5v/gbPCvg6sEF936WvCqS9McEUktsWpTsNxGzJhGsWT3aT0xU6Db4yPJFM8LZ256rGc
         qb+nOD27sdh89HIWyWCje9QLIXUuiRmHQcwJMEN8KGn/m+nR34YUZiwz1kYHkweDJiJs
         twPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=+uO/papoLLk0b3uqMB8ZdXvs73vVNVF+lSFeGHBI0zI=;
        fh=4fdQ4jBVDHLLc8Lv+sf+ER28FUsrz6FxcEo6ml+/OSQ=;
        b=Md4vYjolhYbHgHv+0mR599QLmGShqwoqeeEZEvYxht5TuVcXYbMq/PHwUFjy+kmgdH
         BPu5PL4cNEmjytIQxX2OqVyHm70BvgX6/A0Ck+dZrZnmEk/NL1fq+TFmObNU95pTCcNb
         mOVk6aTPfzVCJINJvLCtbCSpHuaVXTtxdIfk0lwmAaZzw5/IoI0GWimtZuwksZT5gDrZ
         2aafkIzQ5925w+xzbQ9IB3pH3FIN0v3FkVAHf2xR+/ML2FzeSrxXwBJj5fescuF3V7PR
         0PoEfr5vuI7xMlyPY8Ysjcqf3PiBT9aYohpHrooYikbYP7Yjp0x/FOByheB14mtMbns4
         6uOA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zc2euqA9;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3825fbe7a5csor2208390f8f.5.2024.11.25.11.59.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 25 Nov 2024 11:59:38 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zc2euqA9;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732564778; x=1733169578; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uO/papoLLk0b3uqMB8ZdXvs73vVNVF+lSFeGHBI0zI=;
        b=Zc2euqA9wVsZT/uXCTo6HdJ1pc9vtTtyEUBsGB7vWm2OsH2E6mIBtot8XI8ThNziYi
         DzBRd90ZH5JVOaDzd5On1raqUS5vlX/1Bmt5yc9X0/OTJF6jo42PWDRr2afKYkS0CeEj
         SpAZxiqAvVn88BbP77Oy+2D1c+ksv07/Sl3Ozkex7N3F6SZDaxoKQHAUDZuZt1zImMCB
         T8pvbRU88y7e7gTK6QFZ7HzkostnWVIY8g1hbNGvK6BuLumcruIoibqXqbN1bdC0/dmy
         eBSst9ecfmfKIgvzgglNGdUYvT1sDxA7AW9lpwHk4Dp0UaxalkH+4YKWcUwKDtFXuV6x
         sBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732564778; x=1733169578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uO/papoLLk0b3uqMB8ZdXvs73vVNVF+lSFeGHBI0zI=;
        b=k8eoizoCbI1cVdUQrQEgIdgNOf7ZGLRBCmZI4vUjS6ckwFO7ibb6BHAZbV6OX/itFm
         QWILitVpd7shr38z7GCAkB86fpAjJKETMm02QUmhZv2kuYckX4PrWFUfSL1RRBEvymN7
         wfiM8RetZ31FCvbesCGVI0Q7oINaSXVBSzS1OohGFJRq+Cjr80TDEs4P1rY/3+ci8x/P
         pU5BhskctTStTA+jG6jYA66LKqeNM0JLOFP+xWnvwLYh+vEFKRXTS9Gyffox9eUuhH3g
         RL50/TqcrmRx9tghoAkhtX23rzx3z97q0E59azFeQ3r8y60wwF5TEz/Wok3sqgjIu8vh
         ds8A==
X-Forwarded-Encrypted: i=1; AJvYcCUMdG7hRSFTMu9xcuw6fc3H0wXyJqDfvqpIeQzayhA+lLiU/xAfrsfjfK1gbdwI8bAqqMU0HtrWd0iu4w==@linaro.org
X-Gm-Message-State: AOJu0YxXX6FKAvsXQqWLne1rjfNMGaHsbmylL/hfWRSvkG9GYeDkbjyZ
	aJ0Vd6PPAjJSJK8JRaVV3YpTg9OgN4HsBaPpG1WbYNEEoNg4pP5QoYjva2EaH97gAA==
X-Gm-Gg: ASbGncvZLzbmDfjdErA5bs3Fv0rE0eolDTIvF76ftgV9cQzQFXxbu3lyx89Mh1vJAhv
	ErhwLvg/UD6D6N1YAU21E69ZaPQiMh1yXiiYbxfcTsi6vJG6APQPShaFg9dUFDdU0jRcg3XumuU
	EAB/OmEOBt95D560uqIkoaT2aU8jFel74qlEG/Fp8YAAspeyZ+0Dro4lbHPcBL1r5BcEoyHA1gF
	R7dxdh0aNi/WmmHayKAgeIb/t2oQp9tErtfyUc1Y+Mc8raQqOr4upTrQCTWEYFJtHmS
X-Google-Smtp-Source: AGHT+IGczDRNS0/GYso0gUYtSQC3fi60MTtYP0+QSa7oHPzr77RTsYNzR/7WGuk/JJO1HJo4LUm2pg==
X-Received: by 2002:a05:6000:1541:b0:382:2f62:bd45 with SMTP id ffacd0b85a97d-38260b70e7emr10262936f8f.29.1732564778383;
        Mon, 25 Nov 2024 11:59:38 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fd0fbdcsm11237971f8f.109.2024.11.25.11.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 11:59:38 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: peter.maydell@linaro.org
Cc: richard.henderson@linaro.org,
	philmd@linaro.org,
	qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [RFC PATCH v3 24/26] hw/core/loader: Add fields to RomLoaderNotify
Date: Mon, 25 Nov 2024 19:56:23 +0000
Message-ID: <20241125195626.856992-26-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241125195626.856992-2-jean-philippe@linaro.org>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: uMNaoCN5J2Zd

In order to write an event log, the ROM load notification handler needs
two more fields.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
v2->v3: New
---
 include/hw/loader.h | 2 ++
 hw/core/loader.c    | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/hw/loader.h b/include/hw/loader.h
index 0cd9905f97..73f317966d 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -355,6 +355,8 @@ ssize_t rom_add_option(const char *file, int32_t bootindex);
 
 typedef struct RomLoaderNotify {
     /* Parameters passed to rom_add_blob() */
+    const char *name;
+    uint8_t *data;
     hwaddr addr;
     size_t len;
     size_t max_len;
diff --git a/hw/core/loader.c b/hw/core/loader.c
index 759a62cf58..4ff40e8762 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -1278,6 +1278,8 @@ static void rom_reset(void *unused)
         trace_loader_write_rom(rom->name, rom->addr, rom->datasize, rom->isrom);
 
         notify = (RomLoaderNotify) {
+            .name = rom->name,
+            .data = rom->data,
             .addr = rom->addr,
             .len = rom->datasize,
             .max_len = rom->romsize,
-- 
2.47.0
