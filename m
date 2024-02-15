Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp735467ejb;
        Thu, 15 Feb 2024 09:59:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX2lKdavtIDycfIWFo/+pZ2LwvhI1IL+VJ3ljmm0QvPjqP447dMADcqNpU2lTZ7yQS3c2Dnh9kYhu6sw21crOyOxNgqccIz
X-Google-Smtp-Source: AGHT+IEWx0Cg68BuDlwP6lXPJadKrLaEkrkv/wAZKNECaqjM5fiFRi5iN3hI0+PGfse2OdXoKxwr
X-Received: by 2002:a05:6870:1716:b0:21a:3c94:7489 with SMTP id h22-20020a056870171600b0021a3c947489mr2408781oae.39.1708019997769;
        Thu, 15 Feb 2024 09:59:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708019997; cv=none;
        d=google.com; s=arc-20160816;
        b=x40wfPOvQph7e3U/+U3gkdJuhos67ypbusVWjE8pbUTumGrpq0uUAHacwdpe/OwDOm
         dIzBWz4Fxp/ILS7g3j93CGaZu8ypmrby5wrWvnhC2GjRX+dFrWWg708YQQ0bwwgB1bRB
         orqR36Q3yUnSkVMfIMJsx4P4+HlQoOzIFfifHWorJPJbkaM4nM/t97vlODi2uGVQpNLJ
         Ty68W88/j1OlEZbM0MxuQUyULZANdONxXDQDYekQV4jPqnkp6XXZyMAinN7MOqfqcDDm
         kEcNMuneUFSbF2JsVwHgbIjLONKQvk1KiHptmngN86bwAQu1cJ42Jl/8iyb3kpylNW+H
         tMXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=hD8QAEO8EbU5eNO1CRG3i0Yg3oXr277vzzBLMpE0y8U=;
        fh=9OEigYyeQuXaY5BohipyGpVUjq4Ysjv2UahERfKegZM=;
        b=Rr7cBugjGLIozZzGzD2FpYpZnaODiOKT0gMgJhcBUtx8DzgHFahkNPY59pCdxk1XGe
         lgvLapgpcRFUbcmktpH1vIBwHKpxmbU9GpEfh5kexF2qjKZKIM3gWBG9pTwt8WSQNAUS
         7CNY2cewpGyCMzbR4FrOA5eRvuZFnr9RXi9YwKd/eNlCPiifDtCS92wHA3OIXWGu1n73
         AxHKWkSzdALa10be3HH84u+xDuo7Tk0Me5kom/E7rT1QJ/z7TSxczhZEERssZ0yXvZE5
         8bXUx8d5L/7D6HgghDCIbQ6oiyuOSWq7g5yH4b5mnpS9vXceJqqeTdp3MnH98HTxkPMP
         DVlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=scyoVn6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7-20020a05622a050700b0042c2ada4b7dsi2023919qtx.749.2024.02.15.09.59.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 09:59:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=scyoVn6H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag0h-0002zA-IY; Thu, 15 Feb 2024 12:58:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0f-0002u7-1w
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:58:57 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag0d-0001dq-1A
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 12:58:56 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-411f895c8b6so9985435e9.1
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 09:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708019933; x=1708624733; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hD8QAEO8EbU5eNO1CRG3i0Yg3oXr277vzzBLMpE0y8U=;
 b=scyoVn6Ham4tZol/QCpB1xrrnDs/nLkG3EBS7sOoEp9dhb9kSY1TS6/EDoiNAiaW4h
 bwsKDZdQKMF1ywawiHVSU33SGBuHoVu/QVeY+EnMleVk34UtXyR7aoeczBV7SCSewqQQ
 6vetTpj5AQfMUr+lGrWXJw3VRfUceIn8RGgVgIOCu2sDKoRU1fCZSbCxTIz9PPSo/ba6
 VT5OM2CKTfwGU+cQ0JucKwzig29qOV7H1Y+ZxD7QUvS7Q+b7lHjQUa957zklMIGsE20m
 NE08a1aKeG7XsnfJGmabR0raWHaYXaxXdJt7CPJDyYdcitxXYGlgR4ZoRASJUcJNfAbS
 Hc2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708019933; x=1708624733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hD8QAEO8EbU5eNO1CRG3i0Yg3oXr277vzzBLMpE0y8U=;
 b=Z8cgO+zioRxpruSpiAmt+Is6YL2Vvt2VcU/AzNe+inCoF4D166426MbQ4EigY+S5wf
 A2WwxAESaHatLIgML/P6df3vAh2mouR9kJS6O1x4CxeA+cvsHK/3D/u6ShaNDLWQzqbg
 E5nakMYasn2xus/uuk/pgFcqNNsw0phjoE6rFFaBDvXkL+zN3HeF4dq2NbpLWQuaY6WK
 3gEJLne5bziR78e7/FR57nT2845148y/739DuJzpNDYoX7oEtZ3NplUrJ9qefLRatW8M
 xy3DwMEvkXX8IcO/oQ+x3q7cPNmzfLzmf/jw4CLxoN2xuN6g3k7rVpO24l4uEoo97nJn
 uEdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0vI1t5BuYV7n1y+yD2G1Sae+KE7E0OO33XrUNPWUDtplS3oNeobRQsJaQ5NKQgJFXmDRdMd0Wec7nUbKbYYJlfegj
X-Gm-Message-State: AOJu0YzTucZgrdW7H/3C78NgBY5ubBZGgRxMmZzfBgZtB/vbtY2NtWU/
 1k5DiSmENFwtKzuiDtLZyJ40qRHItZIsBph9fxxBGtYiiLBS8lcNR0TXhyFAbIc=
X-Received: by 2002:a05:600c:46cd:b0:410:cf60:d857 with SMTP id
 q13-20020a05600c46cd00b00410cf60d857mr1896947wmo.18.1708019933682; 
 Thu, 15 Feb 2024 09:58:53 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 by7-20020a056000098700b0033b684d6d5csm2601836wrb.20.2024.02.15.09.58.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 09:58:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 09/56] hw/misc/mips_itu: Remove MIPSITUState::saar field
Date: Thu, 15 Feb 2024 18:57:03 +0100
Message-ID: <20240215175752.82828-10-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZE+n2Eumrz/G

This field is not set. Remove it along with the dead
code it was guarding.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20240209090513.9401-7-philmd@linaro.org>
---
 include/hw/misc/mips_itu.h |  3 ---
 hw/misc/mips_itu.c         | 22 +++-------------------
 2 files changed, 3 insertions(+), 22 deletions(-)

diff --git a/include/hw/misc/mips_itu.h b/include/hw/misc/mips_itu.h
index de7400c1fe..27c9a1090d 100644
--- a/include/hw/misc/mips_itu.h
+++ b/include/hw/misc/mips_itu.h
@@ -70,9 +70,6 @@ struct MIPSITUState {
 
     /* ITU Control Register */
     uint64_t icr0;
-
-    /* SAAR */
-    uint64_t *saar;
 };
 
 /* Get ITC Configuration Tag memory region. */
diff --git a/hw/misc/mips_itu.c b/hw/misc/mips_itu.c
index 9705efeafe..f8acfb3ee2 100644
--- a/hw/misc/mips_itu.c
+++ b/hw/misc/mips_itu.c
@@ -94,12 +94,6 @@ static void itc_reconfigure(MIPSITUState *tag)
     uint64_t size = (1 * KiB) + (am[1] & ITC_AM1_ADDR_MASK_MASK);
     bool is_enabled = (am[0] & ITC_AM0_EN_MASK) != 0;
 
-    if (tag->saar) {
-        address = (tag->saar[0] & 0xFFFFFFFFE000ULL) << 4;
-        size = 1ULL << ((tag->saar[0] >> 1) & 0x1f);
-        is_enabled = tag->saar[0] & 1;
-    }
-
     memory_region_transaction_begin();
     if (!(size & (size - 1))) {
         memory_region_set_size(mr, size);
@@ -158,12 +152,7 @@ static inline ITCView get_itc_view(hwaddr addr)
 static inline int get_cell_stride_shift(const MIPSITUState *s)
 {
     /* Minimum interval (for EntryGain = 0) is 128 B */
-    if (s->saar) {
-        return 7 + ((s->icr0 >> ITC_ICR0_BLK_GRAIN) &
-                    ITC_ICR0_BLK_GRAIN_MASK);
-    } else {
-        return 7 + (s->ITCAddressMap[1] & ITC_AM1_ENTRY_GRAIN_MASK);
-    }
+    return 7 + (s->ITCAddressMap[1] & ITC_AM1_ENTRY_GRAIN_MASK);
 }
 
 static inline ITCStorageCell *get_cell(MIPSITUState *s,
@@ -535,15 +524,10 @@ static void mips_itu_reset(DeviceState *dev)
 {
     MIPSITUState *s = MIPS_ITU(dev);
 
-    if (s->saar) {
-        s->saar[0] = 0x11 << 1;
-        s->icr0 = get_num_cells(s) << ITC_ICR0_CELL_NUM;
-    } else {
-        s->ITCAddressMap[0] = 0;
-        s->ITCAddressMap[1] =
+    s->ITCAddressMap[0] = 0;
+    s->ITCAddressMap[1] =
             ((ITC_STORAGE_ADDRSPACE_SZ - 1) & ITC_AM1_ADDR_MASK_MASK) |
             (get_num_cells(s) << ITC_AM1_NUMENTRIES_OFS);
-    }
     itc_reconfigure(s);
 
     itc_reset_cells(s);
-- 
2.41.0

