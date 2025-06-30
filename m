Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2244297dye;
        Sun, 29 Jun 2025 21:33:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUVi6YCS5RUWSqepoChCIfhO4pQmbeq9eAhKAMu8PDjDdFe/uyr0n3OW47vSl/7QvNGNUaPzDodFkY4lQ==@linaro.org
X-Received: by 2002:a05:622a:1a27:b0:48e:9b77:38a4 with SMTP id d75a77b69052e-4a7fcaaae06mr197299241cf.26.1751257981486;
        Sun, 29 Jun 2025 21:33:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751257981; cv=none;
        d=google.com; s=arc-20240605;
        b=N8Ve/pzFd+hl6W1dJiLWRdQ0v8ovQBkYOzNTXxF1qGLM8M3oM6sBkh6rqk56oxOGi4
         SohK//1zbphxg+ivFJagzKgOa7C2kCbQgivqhsNFcb8dEBOwU7a31z1nonrs/n8vOxcG
         FIRyHT007Sfoh3j7qDqjaE2NG5LzGZc6pa8Sfp83I/9t0x8sosllaE0HJsnFSfZ/ujPQ
         Mrkcf3yoNAzu4qniE6Rg3dB5UuGuNqopbu6ANbvBwGmKpu4RU/dHcCSjyFqgoSV6/WZs
         wqm/ih0+F0xyT33KzryiUfSRn5m4+70Ejg1H3WmIFddWV1FUAhEKPK5CQVWenvXKfTLz
         a+pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NElkJwQRf1CyYZ1pLfGMEkRff1YKnUUmnNhqdv4yZE4=;
        fh=oUchYWjtu8a1AvKXwexwA0j5B69QkwZHFIHmrFjPlMs=;
        b=kFYG/Qi7rAL7UPL94JRoSQAZCdU+ByxVpNR8LPcCD/4fH7WUnqd+0S2cyf3k3c1sTc
         Jx8aE8Ww8N+x15yxRN5gJzSrpczrXRUoB2VOjtsXmtww6IGd2gGnbHK5oIlEhFEFR1y/
         Mo1lWQukI146d54XTEnZHvHYwkrlUVQjvv/MUzomP+mMm/GsB2RvO509wWmO2Fs80htk
         kzdBqwZqQ85fdWixN6ac3V9eAQkWnTnf0NKa69qHANVg16m+1rSRD6vYBL1ZW4mgmRJO
         s5fe9+h2mAA72mYGi1MPVRUuiQe08ubFTzokTTAnXcNjjvvRpfgANRGUqknJbw/+3CD9
         iGiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hLCoWgBL;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d75a77b69052e-4a7fc210ef7sor85334391cf.8.2025.06.29.21.33.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 29 Jun 2025 21:33:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hLCoWgBL;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751257981; x=1751862781; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NElkJwQRf1CyYZ1pLfGMEkRff1YKnUUmnNhqdv4yZE4=;
        b=hLCoWgBL3y7xewt4SCvDFc/tC/42j/CxJ31aZSAeozu9pES9cq2PdHIXeahnVY1RNF
         4rgY+J6cEAPOSK/JiC1I/7gvFr0R/kkTpq/frZ5Ekf4UM+XqpRvroTIKHeyfl/7PaWiN
         22CSVDWoiU4khzI+E3HAGbDhvdrfech92qc4EBJbUEtv8BKAfGhAKAbuZlnunSbdd9Yj
         iGK2WF+gc2Wlk/1PNR3lQtKkH9DhJZ6Up5eysVk/kxqA61PxfUeLSBj26dKUECIMmWuX
         mmWxn6GbzTeezFlIco2sL49URN2YVCOUEkNKihgvO8oR7Wsfs0x3ZWIdFMoshhw8nbED
         SVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751257981; x=1751862781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NElkJwQRf1CyYZ1pLfGMEkRff1YKnUUmnNhqdv4yZE4=;
        b=fGeIbRXShPS3sGwN2S4fjKxnav7s4curylC28Ks1BTO8no3zBzlZlGrZfagkzWcbfn
         sepPur9Q34AdJMQZZwZgueiXMl1P3Tp0OpMerUEDy/mwgHYrS8YOWrhjP6BsyQoOFJFX
         rnehNHX6UPql4VPpG/YeeSQq1ln83zEt4GbWxkZcxy8cKM84sna3ERKS5Iw4lr8vYKDP
         5XerSb9TBkMNfJn7pJ0KF/rzR62zk78GQmgDWCj2iASmKeQpfRbAeQEiDJ4OlHkI4rj/
         xmGIdSV3jXvXd/Tuw6uOld6vyVJ6M9ApchwgdICa/o7OpoFU5KTbzVPBd7xIKbCNr2l0
         cCRQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmET2Fu5dFA9IqHFyfQ2WxOv2uS1D8BzMbtucp+pGlxDM+p+r54NgKzpermFZvqglZJv/kvZP+tbEs1A==@linaro.org
X-Gm-Message-State: AOJu0Yww+uT9qDeZ945PT4s/Dl3RP6hLYnZowh+5cI1Qa3JQ3kXuVn2p
	jOFveZkqroyeYa/zHkRkvwH5opEtHVoYX8VCbq5T9wInVO6h3gup5IBPzHQgZrUGjGwOmA==
X-Gm-Gg: ASbGnct1IKqlYnQMGuBeBq7BY+26EcZ38ZBCG4ENjd9rb9jK6A7TBYJzgPxcLgP8X40
	l7dvHPwFqUXoJTOCe1oyQrN978mwQxtvCIYOpamz50kEK4tbDMiiokOnyi2Dcx1kORSi8MHu8Eu
	mZELj/ZAbI2fOZT4pCzzNsZvw0qi6LIIDQrhk9aNrUzGKGV+XGyjJ9Fgp3xNwtxK7j1TBxNHDl0
	+hLhoJWvDtN10v0RHRrGbfm1xb34Yc29XUCyvShJ4L8eV/gEpkY9IVdL/sQr64Q8biz9xFI+zUM
	Hf4z+klsG8teqNg4W2cRe0fzTCsZPAoVI5KhTzNl8AWZ9wpsOxYnQCHKV9zWTcWdIJg=
X-Google-Smtp-Source: AGHT+IHVfyDFenWheXr6gxrFqO5swCx1BFaOdEsGs+vJnNU4yAPok30BqXoy6P++i6BxgdOU9F1tLA==
X-Received: by 2002:ac8:7d0d:0:b0:476:95dd:521c with SMTP id d75a77b69052e-4a814226439mr58055621cf.45.1751257980989;
        Sun, 29 Jun 2025 21:33:00 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from gromero0.. ([186.215.58.88])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a7fc13971fsm53470171cf.20.2025.06.29.21.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 21:33:00 -0700 (PDT)
From: Gustavo Romero <gustavo.romero@linaro.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	alex.bennee@linaro.org,
	gustavo.romero@linaro.org
Subject: [PATCH 1/3] target/arm: Add the MECEn SCR_EL3 bit
Date: Mon, 30 Jun 2025 04:32:35 +0000
Message-Id: <20250630043237.996788-2-gustavo.romero@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250630043237.996788-1-gustavo.romero@linaro.org>
References: <20250630043237.996788-1-gustavo.romero@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: wkufqTk8/PBr

The MECEn bit in SCR_EL3 enables access to the EL2 MECID registers from
EL2, so add it to the SCR mask list to use it later on.

Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
---
 target/arm/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 302c24e232..8ce30ca857 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1683,6 +1683,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_TRNDR             (1ULL << 40)
 #define SCR_ENTP2             (1ULL << 41)
 #define SCR_GPF               (1ULL << 48)
+#define SCR_MECEN             (1ULL << 49)
 #define SCR_NSE               (1ULL << 62)
 
 /* Return the current FPSCR value.  */
-- 
2.34.1
