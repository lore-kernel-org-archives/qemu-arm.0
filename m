Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp1004314njm;
        Sun, 30 Jun 2024 12:01:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXXyI+Ewt4oG6kCbCtRmsfB6sn+AagTe6j6ZciNOxwI2akRAiAZD2t4SiJZgnOGvBODmC/j1/KvJYpLFt4hAdkJe4qSgl/r
X-Received: by 2002:a05:6358:7e93:b0:1a2:89:298a with SMTP id e5c5f4694b2df-1a6acc6e33dmr417568655d.8.1719774061702;
        Sun, 30 Jun 2024 12:01:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719774061; cv=none;
        d=google.com; s=arc-20160816;
        b=bzolcq0ho/xU2LnHCQxuIT6JlXrDUir2ETvuI9hlgFs9w0xHVWy+EiLJ48LD0aIIAF
         mrbg8IbomRuTNlTzaMfb/FC5WtDTDVrnNMbWQoMt65JonwznaGZudBztJ4ccjGWPiO/K
         weC+1D+2SqTlNDwBcL552NBFlcJqVxK3r6uvroSk3cPyapagooS+7yxsyWgFlm5+p6Ib
         Biy4WwpGFpAtxSEk9ER2+wHCWYdHOcy4nAPDdKrXy38+io9uP+ei1cCKj7R6Scl2c8tA
         27PQawAKe3DUVRLZOuTbSOPwwUk3yorcOYOLV8vGKny9Gu2QUeFdqbX6bUxHR/Za+Vom
         66mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=tgpppfkBVV9iuvGOhUUIIQbmuFzvgm7jwu3YigAnmAw=;
        fh=6XuCV87Rkpg5nIIAu7WEx4BPgsi69IUAKbvDht0aNlg=;
        b=Siv9W2IxGB80/prlEcKfE8v8mTcFBM71VgfQvhSjLjbBQuRCWv9exSd8QuPV8xPFpI
         g12pKpKhR8ddwgZnSYP/sA/pel9rfh0f8NZ0aXB4v1G/dgKhGn1KsxdltgtGHgT5A2nn
         Gpg+ZfTyFV1p9jeXCU6vn+u48FMV15jOkMVSblE/7rGx5TG5anXB9OQnfWTL+GZ7D9/1
         wfMU4106gJB55OTd930vnq6I6sYrw+pISn91L/pXRBRSoxPPzyJDaBtMtGs6hN8O4VrV
         Dt/B2g+UD7U8/tFO7GQu3GHpRMP+DTZaj6igP1Dk+PAVdd5qP5uMrAjKE8Fi6dAtjg0G
         Ua8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FOabNvAv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2c9204806bcsor1826812a91.7.2024.06.30.12.01.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 30 Jun 2024 12:01:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FOabNvAv;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719774061; x=1720378861; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tgpppfkBVV9iuvGOhUUIIQbmuFzvgm7jwu3YigAnmAw=;
        b=FOabNvAvVPYpvOZob49M2+JUo3gANCzKTUFrbueyb7/0qYrf7s348H7GWW+EhgVias
         8yRI4+0f+bvs1Kj03t8lF65pPJuqkqmXpWmz/0wdf4tYguQpi2PiNpKwKusnrZxZCOGN
         6QLijNo2+gAH49uQIhakkzs7HFq8tJrGtusrBHzWZhI9Y+0nEfst12/Q6EVZZGhj3U7q
         pjWvTz6DkWva9r8R+T+Am84NEK4dTwlxp70ovQfjO+/+rg1brMFpB4KzvKY6wFem4PFN
         GD63J6J3NcRxT5+K/qj1aCGLGAJr2NnkncmBemYjFt2QNpKMcbjvdoeGFDD21wzkl7Es
         Yz2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719774061; x=1720378861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tgpppfkBVV9iuvGOhUUIIQbmuFzvgm7jwu3YigAnmAw=;
        b=c9UjEOzAhNNaiUUG4ETm1XvPiMe6Mj3sFyWuYFXIM03x/WcgjDSXCCIxZMBfPVKjKS
         Yy+Xk56lYOVo3dfXfLOv8qzXxjshGUy+JfgmdMRvK+qtE9Tlj6ZktIngNC05aYmVD8Bc
         iuIhhSAco+u/HRuKMmVcx7Id0WC8lgncf2YiANL1eT3bDgyQQ3bCyBf3oSjw4IBinz8L
         GhGPNlNjGkdHcI4BuEXBSwG7MRRE5WYhYrWyJVUjMOiS0O/pDh3TZ1jz1WHpfSXFOvnU
         qyZPL0YX9dy4aq5bsz6WIdyfemzDR2fAb4XGbYI6vfa9Ba+LFBKwVjvp/jdmMe3io99a
         acoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlk3Lqb4o+MsdnZtxJFIcKrfCHk5DmFHMKEgty5wwsuv/dk3GjQEzU/qEUTq21k3MDtQVBT3oafIB3ZZvVmBO8j3p8yekh
X-Gm-Message-State: AOJu0YxIlqhqumZEJ0/kG9VKwRoDmTPuuwKhTDcMPu5MtRUrV/IGqIcU
	Gq5jGnACFqOxODNJBiFdXfFOj/kBy2I1TaMYEmDn4u+Dy851U19UPxtwlYOJdLNsrQ==
X-Google-Smtp-Source: AGHT+IFCXpYpVGnojg0mfObCr4UOqQMoUSRBgjCgnfB9eVdB6j/pLbOV19W8Tdrs6pTsSU9CwxMglw==
X-Received: by 2002:a17:90a:3488:b0:2c5:249d:67be with SMTP id 98e67ed59e1d1-2c93d729fb2mr1385362a91.22.1719774061073;
        Sun, 30 Jun 2024 12:01:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91d3e7e4bsm5115641a91.52.2024.06.30.12.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 12:01:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: akihiko.odaki@daynix.com,
	alex.bennee@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v4 09/14] tests/tcg/arm: Drop -N from LDFLAGS
Date: Sun, 30 Jun 2024 12:00:45 -0700
Message-Id: <20240630190050.160642-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240630190050.160642-1-richard.henderson@linaro.org>
References: <20240630190050.160642-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: byG1I8IWUoPz

This is redudant with a linker script, and is not
supported by clang.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tests/tcg/arm/Makefile.softmmu-target | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/tcg/arm/Makefile.softmmu-target b/tests/tcg/arm/Makefile.softmmu-target
index 39e01ce49d..547063c08c 100644
--- a/tests/tcg/arm/Makefile.softmmu-target
+++ b/tests/tcg/arm/Makefile.softmmu-target
@@ -13,7 +13,7 @@ VPATH 		+= $(ARM_SRC)
 test-armv6m-undef: test-armv6m-undef.S
 	$(CC) -mcpu=cortex-m0 -mfloat-abi=soft \
 		-Wl,--build-id=none -x assembler-with-cpp \
-		$< -o $@ -nostdlib -N -static \
+		$< -o $@ -nostdlib -static \
 		-T $(ARM_SRC)/$@.ld
 
 run-test-armv6m-undef: QEMU_OPTS=-semihosting-config enable=on,target=native,chardev=output -M microbit -kernel
@@ -30,7 +30,7 @@ CRT_PATH=$(ARM_SRC)
 LINK_SCRIPT=$(ARM_SRC)/kernel.ld
 LDFLAGS=-Wl,-T$(LINK_SCRIPT)
 CFLAGS+=-nostdlib -ggdb -O0 $(MINILIB_INC)
-LDFLAGS+=-static -nostdlib -N $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
+LDFLAGS+=-static -nostdlib $(CRT_OBJS) $(MINILIB_OBJS) -lgcc
 
 # building head blobs
 .PRECIOUS: $(CRT_OBJS)
-- 
2.34.1
