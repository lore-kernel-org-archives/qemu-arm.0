Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp2677117eja;
        Mon, 6 Nov 2023 03:05:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2Lh7pn5eYomylb2BYOjmLvaSoaCi8bvK525siLgD4xOmqcjcTFDTCWmfUd6rp4PnzgYV6
X-Received: by 2002:a17:903:2155:b0:1cc:1dde:8680 with SMTP id s21-20020a170903215500b001cc1dde8680mr23559125ple.45.1699268751860;
        Mon, 06 Nov 2023 03:05:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699268751; cv=none;
        d=google.com; s=arc-20160816;
        b=m1UbC4lMSopd2Qsln7+locnk3GDEiXqHTjTlCb2R9pgL1wAKwJs67RxCfr0QwKJ6Rw
         Cwtpmh7DLfXZdHxcLkzsO4DHdZhW3+zbiaweeeesRj6Wxq5bxpEwPdUGaMpjR4vR7tfd
         qXPF55ueyALugLXPhoEpmQrlpMV6wkoWX4X9n0/iuBIkdrnAW7Vn6oqoeS1xXptKHLR7
         RuK8a3w1V+oR5VJqv9W97CHCTiwEARAghl0rdWRlLD6S9HGFmpK6RwM+B2plCv/Ujtuf
         VHGRmSBiAZggDV1z95/UfjHQVtqoCRU5caBMLwiui6RRUWvK8K/1eBjWwnLSf9JWLipZ
         XY7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :date:subject:cc:to:from:dkim-signature;
        bh=9TEM4y15WADC11ywrbeYDwNqe54vVpabH+nFuXXR9vo=;
        fh=tqOgyMxMfuHA5GMhfAbYIPsQvE3AsNctCR2lr9PI8rE=;
        b=R4PdeS9Tr9tkUnid5u0IOP0u1WakS0Zeb6ngUMMZ/DDGil6CvqAl450QGHx7UfV829
         hS2vOsBY73d1SbWXzH01fWeGGjApaXwIGR4MMW1s4s4tIfcqSI15KIYHd8/tNb9eHMn9
         JOerpt2cas9WUj4IM6IsRwi5KNdd6kMCdCv4foGKsAvuW1i6Ewtdflf6+C2//aPxNTL/
         /vef8P7EE+1x7joTtW1HdA6+MNV8eylFN5Pg05K9Svf6A+lvMdHI+i9S/knW9TYX2lU6
         bJ1ujpsxINBQY2+SqQZr6nHkefcakLXeqAK8Yxn/YV8YkYWmnJ70uZ91zqf0V94t2oMe
         XW3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PnXLT1eB;
       spf=pass (google.com: domain of kvm+bounces-687-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-687-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-687-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id u2-20020a17090341c200b001b894687ec9si8513626ple.462.2023.11.06.03.05.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 03:05:51 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-687-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PnXLT1eB;
       spf=pass (google.com: domain of kvm+bounces-687-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="kvm+bounces-687-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FD612811AF
	for <alex.bennee@linaro.org>; Mon,  6 Nov 2023 11:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ECB71EB2C;
	Mon,  6 Nov 2023 11:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PnXLT1eB"
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57561EB29
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 11:05:47 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48805B0
	for <kvm@vger.kernel.org>; Mon,  6 Nov 2023 03:05:46 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-32f737deedfso2642022f8f.3
        for <kvm@vger.kernel.org>; Mon, 06 Nov 2023 03:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699268745; x=1699873545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TEM4y15WADC11ywrbeYDwNqe54vVpabH+nFuXXR9vo=;
        b=PnXLT1eBCuQinPJVs97IXV/OXCeaIubvxrdKV2nLnmRWJ0Z3S4VNhygTdPgTesBXPR
         netZkg0SXXjmtwMJkA1ww5VdyBcLTGuPLyDi2EFA/MYk8/PIGC3n/esI2wooN3PPO3Py
         1k72M5T94N6WrStKMS3m2W9iFsOjK5K4Tj84oQnnnjv4WdStFo1XTwmRTPhf0tpnsxAd
         HaTIsmB0DMeQcPkiAk/grIa+hLOF/HXciMI9lUQ8ZDibpswzXkDXbT/bLymfAh0KOhiL
         wmvj7D0JKoBiKHpvfkohdZkQIC3qTYkEO2EslSDTGwciJ1+8DxYIR4ng+cy0nLHYrI6f
         As7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699268745; x=1699873545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9TEM4y15WADC11ywrbeYDwNqe54vVpabH+nFuXXR9vo=;
        b=ZzQWkYoT70fTD1D0SGjmsOnJ84NYod29HnpEUdm6cecyWcd93XheUaMPRgTFRJxd8l
         /GxTKW0/Qcj2+Yl6OCG/pZ/zvhKO3atNQHu6qodjWdfJwVJ1OoPiYBXfDwGB+cldnDZA
         aYh3ibAC7JdwugIWHV/wHjFiI9BSQ1+C3sHHOp+Lv3cVKAVVkQkoF6OcDE/Z/Ol18EC5
         ZRlbvad4C3yJUf1gwM405UcBzTAYROfCtttcgD9JKvmYlh5W5YSZd0KiNWVfS1PpyCRG
         Dvi7FPA37CIafOD0GPcFkwvDKR/MByGH1ZgIgCVz8waiuhFpgpCSh6if30WMDwUVJSDD
         7OJg==
X-Gm-Message-State: AOJu0Yxgy/UeFIJalg8MTGoAXXRaCrYLuwIDpdfviQ4AkX4PipbpQ3gj
	ZSrcr3J2+O2IZfYVyWw57hCI7A==
X-Received: by 2002:a05:6000:1c0f:b0:32f:ba72:e80b with SMTP id ba15-20020a0560001c0f00b0032fba72e80bmr6504480wrb.54.1699268744791;
        Mon, 06 Nov 2023 03:05:44 -0800 (PST)
Received: from m1x-phil.lan (176-131-220-199.abo.bbox.fr. [176.131.220.199])
        by smtp.gmail.com with ESMTPSA id c12-20020adffb0c000000b0032fc5f5abafsm6040847wrr.96.2023.11.06.03.05.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 06 Nov 2023 03:05:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org,
	qemu-s390x@nongnu.org,
	qemu-block@nongnu.org,
	qemu-riscv@nongnu.org,
	qemu-ppc@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	LIU Zhiwei <zhiwei_liu@linux.alibaba.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PULL 18/60] target/riscv: Move TYPE_RISCV_CPU_BASE definition to 'cpu.h'
Date: Mon,  6 Nov 2023 12:02:50 +0100
Message-ID: <20231106110336.358-19-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231106110336.358-1-philmd@linaro.org>
References: <20231106110336.358-1-philmd@linaro.org>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: sQk3OQfg6BV9

TYPE_RISCV_CPU_BASE depends on the TARGET_RISCV32/TARGET_RISCV64
definitions which are target specific. Such target specific
definition taints "cpu-qom.h".

Since "cpu-qom.h" must be target agnostic, remove its target
specific definition uses by moving TYPE_RISCV_CPU_BASE to
"target/riscv/cpu.h".

"target/riscv/cpu-qom.h" is now fully target agnostic.
Add a comment clarifying that in the header.

Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20231013140116.255-12-philmd@linaro.org>
---
 target/riscv/cpu-qom.h | 8 +-------
 target/riscv/cpu.h     | 6 ++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/riscv/cpu-qom.h b/target/riscv/cpu-qom.h
index b78169093f..76efb614a6 100644
--- a/target/riscv/cpu-qom.h
+++ b/target/riscv/cpu-qom.h
@@ -1,5 +1,5 @@
 /*
- * QEMU RISC-V CPU QOM header
+ * QEMU RISC-V CPU QOM header (target agnostic)
  *
  * Copyright (c) 2023 Ventana Micro Systems Inc.
  *
@@ -44,12 +44,6 @@
 #define TYPE_RISCV_CPU_VEYRON_V1        RISCV_CPU_TYPE_NAME("veyron-v1")
 #define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
-#if defined(TARGET_RISCV32)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
-#elif defined(TARGET_RISCV64)
-# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
-#endif
-
 typedef struct CPUArchState CPURISCVState;
 
 OBJECT_DECLARE_CPU_TYPE(RISCVCPU, RISCVCPUClass, RISCV_CPU)
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 144cc94cce..d832696418 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -34,6 +34,12 @@
 
 #define CPU_RESOLVING_TYPE TYPE_RISCV_CPU
 
+#if defined(TARGET_RISCV32)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
+#elif defined(TARGET_RISCV64)
+# define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE64
+#endif
+
 #define TCG_GUEST_DEFAULT_MO 0
 
 /*
-- 
2.41.0

