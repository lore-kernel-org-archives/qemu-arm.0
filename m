Received: by 2002:a17:505:70c3:b0:1be9:327d:8ee3 with SMTP id lw3csp1074223njc;
        Mon, 30 Sep 2024 00:35:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQITGK5DjgWACZJGy3/DN8A7cErBTBl3FJUtUx/tRgydiQnZsl8BUAPIs4yBUNTZogjL10EuRqVkOM2Q==@linaro.org
X-Received: by 2002:a05:600c:2154:b0:42c:dce1:8915 with SMTP id 5b1f17b1804b1-42f5b9310b1mr71355035e9.33.1727681721543;
        Mon, 30 Sep 2024 00:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727681721; cv=none;
        d=google.com; s=arc-20240605;
        b=ftC1kxbG/GXqCY6YRmfICsx8NcH2lLnWynsvWNQiBi2op/X8GI2WFRHQtxmlrnduG+
         lgVjyYVIHW4xDke137+T2jDfcNCMsc3D9pPSkvboWh9mATAV86L/pKZ1aImltZG61gR4
         JJaKg8T7RZXQCd68mr9LGAnr/UZZ30WbLRwHFDLDWfpCanz8rhbzBm5ZO530nl7ituZg
         QAjzIyXnJyEtDbd3tG2lcV0wHRPGHeBCIhOR7clcyJfcI4zT0ia7Nhy0ZYQ7Oh7nfU2P
         gk6bkupvb8CSQeYTluqOBIq0L61wKyMvVTuRib4onUf/lZdFGlED0CEEPMLfkpDyBfAJ
         tt9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=PDKmxhtETyeu/iYuY2neXJ4cpuVufAHpcFENKpKvuEg=;
        fh=hYlBn2H+nFf2Z+j6WPXzArKr0OOX0SzypSJ+DXmxub4=;
        b=NRdsH8q1b72HC83+fxyYeWdJ4Hl7CkGBveXgd4joC927qCp5tM1adjFOqWYQMMhIfV
         YgXhREnk3V/YWr7pUlBJVmxFXTtTdQuTMCuYKTmAB5vP63lJDRtMmgAP3ndyQOfa41CF
         g3ucGqiX3SvrmBJifasmIymFnoRlfoOyYLUIoD+1wn7wh6sRN+k5ZubdO+00aoVNgqGK
         21BDLalk1yd6p1G9S+3d0EnHEwAK3gBfS7JtvDWLDr0M/YzjvuSopvwKueJSTRznsAdB
         9wX7vq3oi6JGl/Bs4KjjfQ8tEfqgOk/+1oxhPjhl+FNr90Ay8Jst6gq2aj5+1sYLDQa/
         0gww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ATpgayvZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-42f58219d43sor21075235e9.13.2024.09.30.00.35.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Sep 2024 00:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ATpgayvZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727681721; x=1728286521; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PDKmxhtETyeu/iYuY2neXJ4cpuVufAHpcFENKpKvuEg=;
        b=ATpgayvZnjIq8Cxe+kq1vSAIgcA3AfHrstzsIBagUqb27wKs3gMqPNLWKHCG7ujTQz
         4PPSaw2zeMyxL1f8QDsPcrzDoKXGZt1P41WEpcPqw+3klZ3iv20xpZFCso7lnBftpm84
         9R4tC2NFwAlnLQYUhnyKOPBhIxXpzepjvYPrrVEC/MbPrkdAX6LDlcx2ksh2u7SZz8Nx
         Mkzh0ftlsJUlpyBtskdUKv3dU9Y2bRFvvVOGAF0AbrbR5s7O5kMIDnnm+OaI6/hLuysT
         ycDHrsocleY0AOfQxsnVTht/d7Esi+hwj7I0Zv3docLPK3IWIqyae5FY/3DL1sn8bxlC
         I9Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727681721; x=1728286521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDKmxhtETyeu/iYuY2neXJ4cpuVufAHpcFENKpKvuEg=;
        b=pdJWoXbIxVQ6Bfoz+kKHSf8LfZQfrZH1D98b2HHqXr42gNMCJmcm+KARkopEL9Hqwp
         fANJ29PcYUEVBwgFnLotn7BfsYOGKRIf29DQWtgozsima9y2oCmHqLGV4PaYvoyqso/t
         8Zs0NEztg3qEihVTKT9yXu6qTxbiqKgtFurrA8MRS7Nv4B/oNC4YnfglxvecGBHC3JRC
         oKKuQtD3lDrFZUpYwMFFZwi0YCXOlsR6U2ftpypChjCmkTefoqlBh8cIF+MMmnLOvlOC
         XM88onjR8qCCWUDP4oJgZWxhHxaAHo6cooa8PklB28JQ71v+Y28I6x1mwDTALwVj1Wxd
         OGtg==
X-Forwarded-Encrypted: i=1; AJvYcCWC/9O6PoBK+ZvsBBAROeD8299UxKC1woYMeNHEF6G3atrLXmzoQyteiu0jxHnCBvGeiTeRV4J/KyO64A==@linaro.org
X-Gm-Message-State: AOJu0Yx0gTE7LmNdW8lQS5pV7Jm8DEwFZmEEyvJMqZwi6KYteDBvjDck
	r163lxNUWwhW7xVsHUSF6Anw8BUFXK/OR/16w259ggREOYv9BZEX3kQxo/qUg7IHx2oObX59YHr
	Stt5PAg==
X-Google-Smtp-Source: AGHT+IHYEAXZvTMQIghMVZv8Pw1TDOBPf+W7tpo+teIiQ7939xyVfth4qR6F5Ris9NSp4atmfNQHng==
X-Received: by 2002:a05:600c:3b93:b0:426:689b:65b7 with SMTP id 5b1f17b1804b1-42f58485cc1mr80571605e9.25.1727681720993;
        Mon, 30 Sep 2024 00:35:20 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from localhost.localdomain (186.red-88-28-13.dynamicip.rima-tde.net. [88.28.13.186])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd5742a23sm8324073f8f.105.2024.09.30.00.35.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 30 Sep 2024 00:35:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Jason Wang <jasowang@redhat.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Anton Johansson <anjo@rev.ng>,
	Peter Maydell <peter.maydell@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Sven Schnelle <svens@stackframe.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	qemu-arm@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Paul Burton <paulburton@kernel.org>
Subject: [PATCH 03/13] target/arm/ptw: Use the ld/st_endian_p() API
Date: Mon, 30 Sep 2024 09:34:40 +0200
Message-ID: <20240930073450.33195-4-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240930073450.33195-1-philmd@linaro.org>
References: <20240930073450.33195-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: caPTfuwcdvlo

Refactor to use the recently introduced ld/st_endian_p() API
No logical change intended.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/arm/ptw.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index defd6b84de..a1a6b1fec3 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -699,11 +699,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, S1Translate *ptw,
             data = le64_to_cpu(data);
         }
 #else
-        if (ptw->out_be) {
-            data = ldq_be_p(host);
-        } else {
-            data = ldq_le_p(host);
-        }
+        data = ldq_endian_p(ptw->out_be, host);
 #endif
     } else {
         /* Page tables are in MMIO. */
@@ -860,16 +856,9 @@ static uint64_t arm_casq_ptw(CPUARMState *env, uint64_t old_val,
     if (!locked) {
         bql_lock();
     }
-    if (ptw->out_be) {
-        cur_val = ldq_be_p(host);
-        if (cur_val == old_val) {
-            stq_be_p(host, new_val);
-        }
-    } else {
-        cur_val = ldq_le_p(host);
-        if (cur_val == old_val) {
-            stq_le_p(host, new_val);
-        }
+    cur_val = ldq_endian_p(ptw->out_be, host);
+    if (cur_val == old_val) {
+        stq_endian_p(ptw->out_be, host, new_val);
     }
     if (!locked) {
         bql_unlock();
-- 
2.45.2
