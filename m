Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp737820ejb;
        Thu, 15 Feb 2024 10:02:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVOauhEZ6EdeseC/E1VUS2gIwBvRR9tqRIB2vJU1dL6mPaFWMtcW0DI9KMdMYS7wEJ3+NIVppi3z9ImDqcWgyt94Y3TTiE6
X-Google-Smtp-Source: AGHT+IFAxfkKFGL6LiBVfOLluVmeRz93UL+6CkfqJAY3yzdi5Q1AYf4QNMT/gXL7aJwvgFaAK/4i
X-Received: by 2002:ad4:5743:0:b0:68f:280f:14d2 with SMTP id q3-20020ad45743000000b0068f280f14d2mr1801134qvx.34.1708020152418;
        Thu, 15 Feb 2024 10:02:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020152; cv=none;
        d=google.com; s=arc-20160816;
        b=v9ASFeSzp8WKMxpAtes8SWGoqka+fCHjN5WmFeXkwLH4oZgKsO4F7xVR8T+1B7TzYq
         hLZDxnF07GZYVg2aUpOnmFt2TqJQC1aml4YyUlanWw3E4vL3faC8JulN0l4wXND404s7
         BWa7R1umKc8t2aAnwg0yYCdFSiugbcsSZAu51WH1e3bFgLNP/Ruph1ZJnCzqggVh9Ja7
         nVdG96X6fNzwMulXjQIf+9WaoEdcDoElQ8y8EdgHE7pQvCtbTCd8tyeqQGFgbeeuMbst
         yXKAJxu98716P/PTEgkkiWT3BnXduT6Y4gSBLgYJfeee2+wuKQRqr33WCpSbNSnRjbl/
         HUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=x8DtNZazjY5IpYdmI7kgwXTFn+YMMPBGcaBqANiU/rg=;
        fh=6aSFKu/7wZylmASNxpBRoG/DnM93aTF68R44OiZ4gG4=;
        b=PBwgyckXUvggfAaqs3fuWFj8X0d0uXyNfCs59WtyEJEhiew+2uX/JvDdh5EVcjak/C
         oqPaeLRjvZ9dWMrHRxrgdxwPHPjbrSW1YnY408Y6CgHJWWOyBcqspNYxlQonBtW9vFlD
         pQA3NFZCWF9VbUHOkefI8zOsZtAk8zvG22y2tOJEhLB2ktUx7Y7hbWbOry73/lmiVIPL
         R9J/KYzS4UztnvBVrYty9yVMFRd0G0CsQiUac9uv/cG+nSgO/9ysLyNIYIZkgOHZwRMb
         7cmwbs9TaDXK9S0KRvGzdtqCWzeNdGHcmOMqVlfWhLS85dsmjY2HXXT1pbJBRq2XXqnE
         OrMQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A4iDdR0A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i23-20020ac860d7000000b0042c8b9d719esi1787107qtm.369.2024.02.15.10.02.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:02:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A4iDdR0A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rag3Y-0003Bw-QI; Thu, 15 Feb 2024 13:01:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag37-0002mc-Fc
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:01:29 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag31-0002UH-To
 for qemu-devel@nongnu.org; Thu, 15 Feb 2024 13:01:29 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a3db14a0a31so70192766b.2
 for <qemu-devel@nongnu.org>; Thu, 15 Feb 2024 10:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020082; x=1708624882; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x8DtNZazjY5IpYdmI7kgwXTFn+YMMPBGcaBqANiU/rg=;
 b=A4iDdR0AZqavcocK+XBa1dccCdUvfCY4Fjix7zXQA/wuAs8NBpstEzV152Eti13x6j
 IiaK9WlweafEQ3HLPViH1Vltl5W7+JSf5KqH0Bmzwj0NoVJaAJwTScNPMsGyDUF2EQ8X
 snZI2QBy2z3vn3fKX/0XfQXbBtLoViRifZXxpNltPGYUhNNDzpDRpSYxK7z43XrIREzx
 min6+MXJo7JNilXmF6RB95fE/ojwtDnqH54vPI9Cz0tlVYgUyurtGqvacpLIcE6qUuw7
 vzkYW49a1UMqhpddQJvy4qH3QO11OEWcU5liqzbWS45NyGITKRKGRLxgB92xUUELHIsx
 +oWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020082; x=1708624882;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x8DtNZazjY5IpYdmI7kgwXTFn+YMMPBGcaBqANiU/rg=;
 b=FioX4BFLOLnvjtNXSDpIusXuVCdH+wGtyYvx2hTN++8AOTw44bcd67dKV/smCPeIfF
 wRAarBVoT7CG6yz0/xtT6157vyNrH+SWeMfWjJbuIsqhX8EP6cPHsarFh3LeCE4LD7mn
 Q2uuQf3rzsieowfQwsclTsjMGgHuPzr5r2JEjbtWB+DigUdkcwcazJa/DNQtdaDlpRcx
 BnJeZ5tPPgdyglTrGPfwTkty+w7CiR2n33f2QRif/5vAVrbKu//eCEPeBwunU4QQX+pp
 8MHdYV/oZ0mubwK0Uhh6i+/7NU0ICTZmtFjapnYw+huV/SCcu1P9QmcDh8eeYfjU1WQ5
 Ob9A==
X-Gm-Message-State: AOJu0YxKVZQgQAEYoHtavsaXPmgS1g44ftek1bOm0m85FAmEH24deGZ1
 KOJ9K/xFmR5CNIFp/gGr8mBaTrAOCrQIRZLbUHMtFZodQFewzI7UAI6q87fxvMQePB0pCTHy3sR
 cN5k=
X-Received: by 2002:a17:907:382:b0:a3d:7d05:21ac with SMTP id
 ss2-20020a170907038200b00a3d7d0521acmr1934804ejb.53.1708020081957; 
 Thu, 15 Feb 2024 10:01:21 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 wb4-20020a170907d50400b00a3cf4e8fdf5sm788702ejc.150.2024.02.15.10.01.19
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:01:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Cl=C3=A9ment=20Chigot?= <chigot@adacore.com>,
 Frederic Konrad <konrad.frederic@yahoo.fr>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PULL 31/56] hw/sparc/leon3: Remove unused 'env' argument of
 write_bootloader()
Date: Thu, 15 Feb 2024 18:57:25 +0100
Message-ID: <20240215175752.82828-32-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uY5mZSI4/xL3

'CPUSPARCState *env' argument is unused, remove it.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20240215132824.67363-2-philmd@linaro.org>
---
 hw/sparc/leon3.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/sparc/leon3.c b/hw/sparc/leon3.c
index 1ae9a37583..5c670b92db 100644
--- a/hw/sparc/leon3.c
+++ b/hw/sparc/leon3.c
@@ -94,8 +94,7 @@ static uint32_t *gen_store_u32(uint32_t *code, hwaddr addr, uint32_t val)
  * state (eg: initialized by the bootloader). This little code reproduces
  * this behavior.
  */
-static void write_bootloader(CPUSPARCState *env, uint8_t *base,
-                             hwaddr kernel_addr)
+static void write_bootloader(uint8_t *base, hwaddr kernel_addr)
 {
     uint32_t *p = (uint32_t *) base;
 
@@ -342,7 +341,7 @@ static void leon3_generic_hw_init(MachineState *machine)
             uint8_t *bootloader_entry;
 
             bootloader_entry = memory_region_get_ram_ptr(prom);
-            write_bootloader(env, bootloader_entry, entry);
+            write_bootloader(bootloader_entry, entry);
             reset_info->entry = LEON3_PROM_OFFSET;
         }
     }
-- 
2.41.0

