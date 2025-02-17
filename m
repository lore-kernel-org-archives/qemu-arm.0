Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp116937njb;
        Mon, 17 Feb 2025 07:38:16 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXRdsrGBfF9J+FDizm16F+RSbQrR8KkyzN7K2snc9H/sk309DXLhnVfKI26EZNJpD11BnuDWQVK7xeqDQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHvo9WSwT4flzD5xsf8KlI5vxWg/XILP2tkin2XTgR4lElpKE2yGjiPwaTq9aFpCJpT8CR9
X-Received: by 2002:a5d:59ab:0:b0:38f:32ac:7e69 with SMTP id ffacd0b85a97d-38f3406786dmr10672237f8f.41.1739806696285;
        Mon, 17 Feb 2025 07:38:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739806696; cv=none;
        d=google.com; s=arc-20240605;
        b=inZPfFddMBe8ebLkoL93q5YlJSz1FlbjpEkvtyFrTFUCemBQhzOv6qVlOmErXbSujK
         jCeGMAxgV3UCxHQjJYrTE79BBcFNEEq0M9H7nVEd4Qyj+qgJymlZSUz/8S8qQBIHEVuS
         rXcpLA7x+Dfi9xCM8vqPRUq6lgMqnE6GP+kaZI5Y05fCLldWXcIn+0O2RYm6CSP2Na5f
         OYEdxPha8J8KPeJhSrwG/q78ZUj+DW+bjZf+ljL6n66f5v8mIqn9SJ4w5sx+U732v0qw
         qMEPwhbu+TZm3rxcqaVzLR1IJtFqKd9PUrQazAmSjTr81YnbUkinc+oE63M1dCbwtToG
         H77A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4wLnYmRin/+YWBkevN2cOEiMcojJOaA8Kgd0qzfJ3RA=;
        fh=pCfWFbF8/F7H/iWyslWENthrZMoyER03hb9S4x0mq8c=;
        b=Luh3FNI3fXn5z4/QZpYMg7Vs6f5PUzqbqKNtrEGadNYyKVUzDw31teiZAZ0L0VlA47
         KC3gAnOgep3KuoFQO3Ot9Wg7nnXVnkxfrGSfkzW7rrLpQpoJ4IFQj2INElg7g3S6kNws
         HbaC71SZgQBuRt80R+EQyTN91bkoqFlzZ/ypoX3b1ps0xv8aF0dMEV2aFRaZ3vmOibQ8
         QmRxfHbZGUsdQj37Ja9CaJ8Nn2stvQRDzL44PrXXOrrQNt2TGQdUcP5x9qhnvL3NBXBh
         DGupkKJHgmYM01k8ey9lUcd3Wuc6sdX7u4Z/kSyUR5zszn1+Xb4Hm8b/J16hNUVK6yWA
         jsPA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hmoy/eY5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38f2d1dae34si7680288f8f.725.2025.02.17.07.38.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Feb 2025 07:38:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="hmoy/eY5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tk3CC-00057x-7V; Mon, 17 Feb 2025 10:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk3CB-00057i-AE
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 10:38:07 -0500
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tk3C9-0003wm-KX
 for qemu-arm@nongnu.org; Mon, 17 Feb 2025 10:38:07 -0500
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-e5dd164ee34so1536134276.2
 for <qemu-arm@nongnu.org>; Mon, 17 Feb 2025 07:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739806684; x=1740411484; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4wLnYmRin/+YWBkevN2cOEiMcojJOaA8Kgd0qzfJ3RA=;
 b=hmoy/eY5YCOgIZvbVysdtVtLVyM/ltj2aqyI4NFw6pLQUKaIepWk6d9qvl9fd4gNv2
 5/j6d1DPLADb6IuQJ+spyoFBPplWARdiHnkIslwRMYgP/BuMo99np98IQS9nspR1v9P+
 fTqr7WH2UQNGOSFY/p0me++uS4ix7w1cAKsZcyYCI65fNM4osgkHa/x874IYOaXtyPiz
 fNcGXkYutkjIQUa0fuoq2FkohnLnpK4nREiVASkBESHBpEmxZlv+q1XEWB+hlavMCRwN
 6dAY+yd+twc3nZmKKwIjYGZKlOqZXpf+H9etlN7UZzYOWVOwPR8EXq37V9mmBfM/FbrK
 imYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739806684; x=1740411484;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4wLnYmRin/+YWBkevN2cOEiMcojJOaA8Kgd0qzfJ3RA=;
 b=bA1isUZlhORYH3guwnZaekcOsgAAO2A9081idTvFkEgD2CcOU6vPPPnQdwXgQoyhjy
 eCkVh7las0nhc6FJhU+FNDJO70EhWugQx5tYJh93yIJeAcRtVW0bQJ3rXiUjS7c/FEaR
 ADy0KJEcS3xOf+SN2vPU5NMrXZ3ii8mdwkTaIvIIprh5mjcgEDGKTdoGAnZ2XEaSZNdh
 U5yDzRNyeUiZBm7mrwN6dYx+JulLyHt0Rrd3+I6Asa4VkLNG9M1a5IuoMpdC5EPeKAPB
 DY3qNm3XNmwyvH79v7w9QCUTId00+0dueIQfy9CAA/WsZ21BPARQY8pWyPT+WH4D4S9h
 V5LA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1b30BvS1HO/z7EkaydWvx4frbxcZEdz4S3wuSpgcFZ9HBOr2/GoMwErV1p0sXMAJDmxB0KOP87g==@nongnu.org
X-Gm-Message-State: AOJu0YygwHRfxVk9xlZ10kKRIyB7Xz/lOqFyyKFSsa3q7kal7mgt8oSv
 IYwwCUwHAPhqzlNX7+Wn3yobC30NvEG3PEhGd0A5i6Zl3e62ZbNMfik7R1C9Jp6W1jWDYUVeFAE
 6zs0p2+dzXkkSS1FGviDjBAX7WGNVF7oqhqN4Xg==
X-Gm-Gg: ASbGncuVZt10J7oQZrrSm17hY4GVl3FpDZYCs18vBsqHIBjE7IpRVXhZYvWU8WyoBtL
 X1Us1hHHHwgKX9wvCTFUEB7hGwA2JEbJNKvbytboxsf9bhHnb/kqxRx3rBiCkH3jgC/C085B2sg
 ==
X-Received: by 2002:a05:6902:1103:b0:e5d:c686:fe02 with SMTP id
 3f1490d57ef6-e5dc9043cc3mr6113106276.16.1739806684115; Mon, 17 Feb 2025
 07:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20250212145457.1899954-1-mochs@nvidia.com>
 <CAFEAcA8VN=M1ysRGTEY4dVd-PJHnK+bw8L2zH2x2bt2DKJ-OgQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8VN=M1ysRGTEY4dVd-PJHnK+bw8L2zH2x2bt2DKJ-OgQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Feb 2025 15:37:52 +0000
X-Gm-Features: AWEUYZlcLA8dtHhAFrmXl_uUIP-UO9fl042BMfId-WqLdhUlw57izfGQ4sS-bj4
Message-ID: <CAFEAcA-GhpfX2xg+nCOfeu3+p8rg9QC=9LeP9UyLyY4nPUWS_A@mail.gmail.com>
Subject: Re: [PATCH v4] hw/arm/virt: Support larger highmem MMIO regions
To: "Matthew R. Ochs" <mochs@nvidia.com>
Cc: qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com, 
 nathanc@nvidia.com, qemu-arm@nongnu.org, ddutile@redhat.com, 
 eric.auger@redhat.com, nicolinc@nvidia.com, ankita@nvidia.com, 
 philmd@linaro.org, gshan@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AiTuMo+/ehLm

On Mon, 17 Feb 2025 at 15:35, Peter Maydell <peter.maydell@linaro.org> wrote:
> /* If changing this, update the docs for highmem-mmio-size */
> #define DEFAULT_HIGH_PCIE_MMIO_SIZE_GB 512
> #define DEFAULT_HIGH_PCIE_MMIO_SIZE (DEFAULT_HIGH_PCIE_MMIO_SIZE_GB * GiB)
>
> and use it in the definition of extended_memmap[] and in
> the "if (size < ...)" test for the "smaller than default" check.
>
> Have the error message say
>    "highmem_mmio_size cannot be set to a lower value than the default (%d GiB)",
>    DEFAULT_HIGH_PCIE_MMIO_SIZE_GB

...or better, use size_to_str() from qemu/cutils.h,
which will pretty-print a number into a human-readable
form with a GiB or whatever suffix.

thanks
-- PMM
