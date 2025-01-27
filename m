Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2365981njk;
        Mon, 27 Jan 2025 03:29:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUb6V7sSoEVYJ5oLLXezKNE29kJcFnfqAIxRa6DY7Zh70zVF6cCt4Uv/QKb3WBSqoQB90mGNPQu33Sb+g==@linaro.org
X-Google-Smtp-Source: AGHT+IGpmi0erhwYPhj2kBE/E/+QKXWHqhVNfl8W7RG0QGbMb5odAn45eD7uZ1eQ9ThpPj5bgvKD
X-Received: by 2002:ac8:7d82:0:b0:467:5e61:c116 with SMTP id d75a77b69052e-46e12a1e36cmr455527241cf.7.1737977348142;
        Mon, 27 Jan 2025 03:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737977348; cv=none;
        d=google.com; s=arc-20240605;
        b=YA8WuLWAxqglHRjy9qY44Xxj7dJDbgwUhYzLETyXDVPcmIr8jCiLkoqF7r/JAJ6m8R
         0VFqKHoGyyIc2bZu3quMnOqwyhrc4rR/qKkJZ+jFzoXg+UQbdRc5UK1YNVBG/InvEl0Z
         x6HbKS9YG5zKUTGYr87bzYPqQV/TRcrXlqc9eMPZcc3BcUUdnN0VSsvNWtTjkvZeLbRK
         GFYOzIs4V0mN/iTjEINOX3ds48puBB8BDXWgVJzfmhD/X8NXgCHoufd+Anw2wboZ1wqR
         293RrmS8EpMke/n60s0N5VvwPo7zCeCL5PziqCI6XzoP8Y6x33qUt82sWXo/fGo20ZTz
         cRfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=ZRakPZ6OV3eBLWtDvjLaBsJfRq8OfeLe2uxM2sXVI94=;
        fh=zStpGdvf+YpPddpoiS0n6ESUosbmZd03ICd+eKyb6Oo=;
        b=aRsW23t5CL67/uC6KY7/QM6cmLgp1umEl57HlmZnl5qZTQXERNLBhPZRgEUJITlXx7
         2mbsdFTkfT46sAkuBT5Y9oIfF+MailrAL12GTzBuFd0RcoFAMa9I//ZfKK5bbvfhTNh2
         eeU1/5qWC8bNmfjA5RVTdg0s0xhfL4pul/5BomR8i9MtDU8sceURIsImQPSycctdYnaB
         1T9K56pFucq5tQvzPZbBJv5p3q21BfTFTJb0UUBYeSK7M+Gxds/Us+eAt4vdwVP521Hh
         5d4DvZCxu9ZdESJvSncdtLnnJcn/X//SnJcvQhK7hClD2Idpr2l5YrIdxkayqDhQ7HiN
         Bl9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N37l6MjS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e6686c060si98113881cf.14.2025.01.27.03.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 03:29:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=N37l6MjS;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcNHN-0006vF-IL; Mon, 27 Jan 2025 06:27:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcNH1-0006qd-45
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 06:27:27 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcNGy-0002ua-AK
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 06:27:22 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38be3bfb045so3557974f8f.0
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2025 03:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737977237; x=1738582037; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRakPZ6OV3eBLWtDvjLaBsJfRq8OfeLe2uxM2sXVI94=;
 b=N37l6MjSWTDRX4Lw3xnnsfa5t6rBbTT2dCDd0vDLAfnBp00USrdIg0ttSYTM0TybnF
 iSIMLD2cg62br5VOW0/WesMwLp/xinN+CcpdTNuawn9mm5WaOouiu47yTgrNaPUaD8O6
 nQG9mkGEgIjeQAKXQ2f7PLW7bVUMv/n7E0e8dV1sxBGJ/Kdo87F6PNhoNL0KxVIh+9BU
 t8nQN8Ti7f44jVBXlm5GHmXpvOPLD6xjzGhfz8+I5WjKK9bxa8ScjHf8WjvX3grW15qc
 +V5CcreICvt3dbAJnWeonP5zLwzl4kUrhDVZ7mLkkG4nqcJpSgeMXlgJEap1+BfAJftd
 ieug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737977237; x=1738582037;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZRakPZ6OV3eBLWtDvjLaBsJfRq8OfeLe2uxM2sXVI94=;
 b=Beim/XIUrkxaOCmESJo9Wm9/tdxjYahQ2Hy9CgDbyRzpS5+/TNOCmtrwtd2YPWqgt0
 D0wtZYAI0yZzzdvtokrUbJBrN6sQL/cnW6FPexSp2NL8FOpkuS8CUeuJAChZeq2wz6/C
 ptbZtuWfOSX1YGmnbhALF1ANzYCl7cRHftm6pKiW27R6IRKi4kJftagzCGm2Tyr3qTOE
 IKo8c6MTpVsuFBmMJ13nJD69VSbIUOJ0951LTi5N6Lfb2qZM45Zm96iux2GjMnPURtSv
 fmcuVVCMA3j7fZ4t4XMjbqdH+RxwAt3+P12nIzubd1KsG6xiJZnpXsAr8CYbJNOvz1VY
 kCpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiYSl7jvIykVMljJQqrU7GgOd8bBI+APNiKp/DVJI8/kr5CY5O4Kuas4Ne7cEM1Fs93oAvb/RCGe//@nongnu.org
X-Gm-Message-State: AOJu0YzVS6piH6tM72RBYe5/2GYJznc2PEA6zk3GgHLyF0TkHz0FHRVN
 4QXfdeKn+mNCb6q7DKVIIypiCvtBMXEKhXwA0Tfvw+DbB3NQjFxyl9gU/tmWaGPjLmUfP4agIt7
 L
X-Gm-Gg: ASbGncvzNBiow+EVBVyFXIHYewe5kE2KAEr2Kl0e0YGfk0GaraFJ3fqdKfWFPr1xrgM
 z4RcDqOZF1dHoALwm+EliAXYqYY/aOmzhjCb84iBX0IDpaOvxY3NjA8yj39XuhIVFbRSn7Uu+xd
 iGKHKE8S6PmWlY5Fr/kzrLXOsQG2WvzgfbHUWQykCQESj5h43pZ/cJEHlmfvCPaivRUPmH9DLgc
 mFIRkRCKPp4Efp36yhVjPzWsOI0W4j9T+KqAFF1c/t8koCffdT1FDhLAzIaeTTCopb+j3cdViU+
 Q4H1LviBBA==
X-Received: by 2002:a5d:47a4:0:b0:386:37f8:451c with SMTP id
 ffacd0b85a97d-38c2b65eccbmr11107200f8f.1.1737977237462; 
 Mon, 27 Jan 2025 03:27:17 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a176449sm10925329f8f.11.2025.01.27.03.27.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 03:27:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 0/2] target/arm: Deprecate iwMMXt emulation and associated CPUs
Date: Mon, 27 Jan 2025 11:27:13 +0000
Message-Id: <20250127112715.2936555-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: LDlGaaRYxIdb

This patchset marks all the CPUs that support iwMMXt as deprecated,
because I don't believe anybody is using them, and we have no way to
test the thousands of lines of code we have that's only there for
iwMMXt emulation.  (See for instance the recent thread where a patch
was submitted to fix an issue detected by a static analyzer: we
didn't take it, largely because we had no way to know if the
behaviour change the patch would produce was correct or not.)

The pxa2xx CPUs are now only useful with user-mode emulation, because
we dropped all the machine types that used them in 9.2.  (Technically
you could alse use "-cpu pxa270" with a board model like versatilepb
which doesn't sanity-check the CPU type, but that has never been a
supported config.)

To use them (or iwMMXt emulation) with QEMU user-mode you would need
to explicitly select them with the -cpu option or the QEMU_CPU
environment variable, because the '-cpu max' default CPU does not
include iwMMXt emulation.  A google search finds no examples of
anybody doing this in the last decade.

I asked some of the Linaro GCC folks if they were using QEMU to test
their iwMMXt codegen, or knew anybody doing that upstream, and the
answer was "no". In fact, GCC is in the process of dropping support
for iwMMXt entirely.
                    
We have one test case in check-tcg which purports to be checking
iwMMXt. In fact it is doing no such thing: it runs the test without
selecting an iwMMXt CPU, which means the iwMMXt insns are interpreted
as FPA11 insns by the linux-user emulate_arm_fpa11() code. So the test
prints garbage and then succeeds anyway. Modern distro toolchains
can't generate a binary that will run with -cpu pxa270 (because their
crt startup code uses Thumb insns); rather than putting in a lot of
effort trying to salvage the test case to really test a feature we've
deprecated, I opted to just remove the test.

-- PMM

Peter Maydell (2):
  target/arm: deprecate the pxa2xx CPUs and iwMMXt emulation
  tests/tcg/arm: Remove test-arm-iwmmxt test

 docs/about/deprecated.rst       | 21 ++++++++++++++
 target/arm/cpu.h                |  1 +
 target/arm/cpu.c                |  3 ++
 target/arm/tcg/cpu32.c          | 36 ++++++++++++++++--------
 tests/tcg/arm/Makefile.target   |  7 -----
 tests/tcg/arm/README            |  5 ----
 tests/tcg/arm/test-arm-iwmmxt.S | 49 ---------------------------------
 7 files changed, 49 insertions(+), 73 deletions(-)
 delete mode 100644 tests/tcg/arm/test-arm-iwmmxt.S

-- 
2.34.1

