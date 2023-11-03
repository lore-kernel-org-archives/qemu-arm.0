Received: by 2002:a17:906:33ce:b0:9d0:bf65:29fa with SMTP id w14csp1153426eja;
        Fri, 3 Nov 2023 08:21:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+txAJdjptPyXdJMAzQSoKrOtCjnNdAQJgoxZP5yv/LOon0XoT78Jq5EmpEAj6JiqPpeNJ
X-Received: by 2002:ae9:e207:0:b0:779:d0a6:2e4c with SMTP id c7-20020ae9e207000000b00779d0a62e4cmr20580974qkc.34.1699024908318;
        Fri, 03 Nov 2023 08:21:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1699024908; cv=none;
        d=google.com; s=arc-20160816;
        b=EMtA6W7FQ9wnrQ+NJEZoq+3WVHRYV7x9tfU+eXPRMm9YA26hat5jO02xTTDnYV7JeQ
         xRrmbddK+i53PmkuzazcBe9bNs566KCxkJthOBTByy2Vi8O/tb4LcP6+Nq8iG3pdb+S8
         UfXTYmIJOHmkXuwvz8E2gE5FwyerRdsDUO7nBDifpNZeXeHeSXRR0aYqUC6dj3d78wmB
         1vB10AnZUAj6o0Y5iN+ywRxfdHrFfD7vnXVJjzj+bdRuJYWMucIZje+yvsEIkgRNtlUX
         Uw6J1uoGLaagfJojw1H5h6YqAKZoB7gi+HssfM5mWmXESE9FUI7nz8UKgMsdAYPx0kx9
         r3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=K/q/6Fpok48r78qGBxR1lQWjm+mwOuYuSt34cZz3H8s=;
        fh=wqfvLaBYopGyGisjq/k8ulPaCl1xshcoDnGh5kvEEbE=;
        b=IdfxsF0s3EDw6nLX1P0cvQPKX/LFjGQjEUwo3WvZ3M3c1/f2k4WUFh9NYBqk+6F3P6
         d7O3l+wzHzF/dz6DIi3yxu80B+9A7CSLc5RgyT3v3UL2SyGTxpZ2hrLRRubyaU6uR1iq
         MFJqm+e4Mcmt1D9NGeUNrYerccWNOePb+/V5sEKeUCPrbcVhKwiWV9i0ikwkcBM+7nDE
         UuPIlEmGTh/0XNJ9EG7WXtxHs53xlpmQp+ptkV+HpIztWQzQVrN2c1imbmQ1q1/TIkrQ
         I1USMuCy0JevcFNezn7ALZIdBDFT5FZLRJIF7AFs2fnbaIwx577ED0c5pgPZvfOz/UUQ
         AdLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bJxqZGi+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id de42-20020a05620a372a00b0076f1622297esi1689751qkb.558.2023.11.03.08.21.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Nov 2023 08:21:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bJxqZGi+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qyvzE-0004n5-Oo; Fri, 03 Nov 2023 11:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyvzC-0004ln-QT
 for qemu-arm@nongnu.org; Fri, 03 Nov 2023 11:21:26 -0400
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qyvzB-0002lj-7L
 for qemu-arm@nongnu.org; Fri, 03 Nov 2023 11:21:26 -0400
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2c5056059e0so30973741fa.3
 for <qemu-arm@nongnu.org>; Fri, 03 Nov 2023 08:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699024883; x=1699629683; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=K/q/6Fpok48r78qGBxR1lQWjm+mwOuYuSt34cZz3H8s=;
 b=bJxqZGi+9xsSHZYWttfS+pTAtTBMBQu4liNFXWo3g4MqL+Wwox7Qmf47MPLbEH6Cfr
 fKzl8Mk9nedR36Q4zp5tImOVguAxtFu/IFmHIwDWLpWyb4oVIahLJXQjPcl1O3x8wQ8V
 3FKie/f291VdGCguKkkhwB8gDhsmcIe4/ivL396ceFzodA96EkaSuLCaYcx2munR/1y2
 uaYD4xauULfubB390mRG9tNHGQwkBaQWey3A9WKzO11Qydt4KF10xUwH4U2mwqBGomYZ
 Gq4weQXsMeZMascyvc09qbqz3rycyKfNAJ7FBafflPq4meuZ7/dF2qewEWDj0k/eIOXa
 zwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699024883; x=1699629683;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K/q/6Fpok48r78qGBxR1lQWjm+mwOuYuSt34cZz3H8s=;
 b=HqSNChgSA8ABuoT8sf1xWzw7iGyh2j9H5NbOGHPEd59PAVwU9LnZOUb7DuhBzKZUFW
 KZJeqnxW17P9cb62Bjw27wdXwtaRAHUnijIPu81TJitfaOl/ZQFLKJHNRSaRvPeqS/Ib
 egpJOHtzC2VhmuYxT7Vkah5vR626mQFwWrUJ5srt8+QtDLpkm9kKmHnK5gmKP8Iqsn1x
 495rAQX0e+9QmkOLLla7W1hv+oITejaM7TLV3JrHwol8DeB0aKuBRDEiotsaonnP+ppC
 ZOCP3+Xe+7EYBfPswN9ZIUfzRlmolLrgNOSLhZyLaLov+Dgifg2hoJAGPewbO9tMHvLs
 BA7A==
X-Gm-Message-State: AOJu0Yy8QvZ/0VylPLnVXwQp208uqkQEe2ilHDQp8FcPI3MYBhaVEbzX
 3K5ISp6XDQzNeigAxeDdyORMSwI0d5WKZhnRfNY=
X-Received: by 2002:a2e:88c2:0:b0:2c5:1df1:ac1 with SMTP id
 a2-20020a2e88c2000000b002c51df10ac1mr17966154ljk.20.1699024882686; 
 Fri, 03 Nov 2023 08:21:22 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f16-20020a7bc8d0000000b0040684abb623sm2712165wml.24.2023.11.03.08.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Nov 2023 08:21:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Udo Steinberg <udo@hypervisor.org>
Subject: [PATCH v3 0/3] virt: Report UART correctly in ACPI DBG2/SPCR
Date: Fri,  3 Nov 2023 15:21:17 +0000
Message-Id: <20231103152120.829962-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x234.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: aJEheQZfW6KT

This patchseries is Udo's patch, plus the necessary extra patches
that update the golden-reference files for bios-tables-test so that
'make check' continues to pass.

Changes v2->v3:
 * report the UART as requiring 32-bit accesses, not 16-bit;
   it turns out that Linux has a bug where it fails to enable
   the console if the ACPI table reports 16-bit access width
 * ACPI table binaries regenerated to match that

thanks
-- PMM

Peter Maydell (2):
  tests/qtest/bios-tables-test: Allow changes to virt SPCR and DBG2
  tests/qtest/bios-tables-test: Update virt SPCR and DBG2 golden
    references

Udo Steinberg (1):
  hw/arm/virt: Report correct register sizes in ACPI DBG2/SPCR tables.

 hw/arm/virt-acpi-build.c  |   4 ++--
 tests/data/acpi/virt/DBG2 | Bin 87 -> 87 bytes
 tests/data/acpi/virt/SPCR | Bin 80 -> 80 bytes
 3 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.34.1

