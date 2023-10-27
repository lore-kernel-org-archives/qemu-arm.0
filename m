Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp189121ejc;
        Fri, 27 Oct 2023 06:15:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbycf/4iGRxVX2Tjsa/1L6pelR6w15PQvr9QoFtbRrS5n2q0P9w/NNTsWHW9Qv/ZQpL8hM
X-Received: by 2002:a5b:c4a:0:b0:da0:cafa:815b with SMTP id d10-20020a5b0c4a000000b00da0cafa815bmr2602719ybr.31.1698412533042;
        Fri, 27 Oct 2023 06:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698412533; cv=none;
        d=google.com; s=arc-20160816;
        b=HDLpThYw/hxuM6IOl1mDFsKb/bY/k1GJsZLLzghLGEV4qpSD94Ft0LmNyEDMiVoeIF
         U7oHR8RZn/LaSACUtDf2UwyMeaX7NxjhS2vpfIwygvYV0Nwpqy0X35nMqnqAJkk6AWBB
         tERqrjw3XM+QGIhOylqPz3X/JkuSzoOPa1IyHUmV2Oa6FjOTT4lWylvl7G6WsyZQcgUW
         UB+LDNvQ0WZvmBpBHiTJ/3s3oFknEM3Kkmc2zUpxgdDiWwNa8FxyuRBGMp066WZ1+KLG
         cdGY89Xo4E2ukzCCLQyuwYBdAJi7Xh1JCzJHSGywhFx2UBN4mCCmPe1MvOcr19ceNFp6
         lp5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=l4gzMSUyQ/FMX0J7Ljcbxg1HLk8uA62Lx8jX0w7ORsw=;
        fh=SvHDuYAzdQV5U08zdZH97tLIUUiEaLY00f4mdxmyTQw=;
        b=BFWwHTRMC4K2sstv+NwH+8LOoUAXtIC4FQ1CG4CcuT2vTkfx0tbZYTLrBnGHMcZOse
         Jm09tI0KxhnZMecbSEXWA5hbMRzatqJqGgLgsbXHqsSsC0YmvFRri01++oOcl4W/euhp
         jYDHfODk7b+vml9xVeuJ98pQ39+ysE5JAf5CqRTffZ/xv9pNVAzY65zlR5o6+43yQg03
         bb/b8gXhXoPg1tM4oSzljy444FiILwnZhXtKQArSZOAxKcCdwyobrZaX+qspPy8I2I02
         etzU5EbVt8QWNnrwwO8fCdUJRHRCsbstZMG+y50XW6hq6VlDFLy3dMyNkAHFxEVKPuhq
         BNwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mnd8ULoB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o81-20020a254154000000b00d9a608c47aasi2267601yba.514.2023.10.27.06.15.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 06:15:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mnd8ULoB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qwMgN-0004lB-3O; Fri, 27 Oct 2023 09:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwMgL-0004kk-DU
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 09:15:21 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwMgJ-0000O5-0E
 for qemu-arm@nongnu.org; Fri, 27 Oct 2023 09:15:20 -0400
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-53e04b17132so3298473a12.0
 for <qemu-arm@nongnu.org>; Fri, 27 Oct 2023 06:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698412517; x=1699017317; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=l4gzMSUyQ/FMX0J7Ljcbxg1HLk8uA62Lx8jX0w7ORsw=;
 b=mnd8ULoBbPvMfyByPfFEiGbx9N51vIjZTrUVnQLIFSXBZ0gnQUfDhVjXyKqLmTFpqe
 nq34TJjCT7B7NI2ryjsTLptEtaQSSNGmnhqVSACTSBtdNxzxRQm6cFisHFtI5r7vvxOk
 GuVkcljBiJfXIAXqBqFjrBbydhF0PNTU9yZUc3uT2D+kY1dTzB6qjicKnC0XspZVVTAG
 LQUYgxJbiQTL47i2WWTdQJe9Qpyge+MFb8PzKZkzgCNXSUDIvIs+V6dDrLoroc5j5Dp9
 fyCua5pYKZCs858Ri0pcom19EIRUiiphs2Or3OXyfrZjqgu9g+9pCwrnISW2KxRotR+l
 XsCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698412517; x=1699017317;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=l4gzMSUyQ/FMX0J7Ljcbxg1HLk8uA62Lx8jX0w7ORsw=;
 b=Kk+BfVBag6ftJBpo6AuTasBETMWzZG0HmvLQoypnwKMGB0l2R3BP4RyvYrhlJG27oC
 nWtjkk994I9xvhj+eQdtfbE8Qlpv+fdZYmg7yzjKeL6Kedr37W1UCC/EIqk4kAccKHYh
 XqQq0p/ivTHzbA+nIYHLjXLkZbdv6ECwr06kbUovweiCh1yPp0O11XGbiryoto78fJ3n
 cKAao3T7YxfofDLaDTk9U1QjVvyQSuXFHR3C1XvXLVC0lVS9GrnZo1e09pKG9VcY7+Y5
 xB6QxnSne88/H8Z8WbHiz9tJ9vcU7i/R86ywpvh++f+zv9tBogK3t/CscyE6din59eIH
 Rxcg==
X-Gm-Message-State: AOJu0YzXitv4w4UU188U0UTSS+QZ8m0YZsTnCZzIi/LdVAOqiqa2a47d
 QWaEkjYV9hjLwAyboOOv99v7tP8Q8euBwf9u8qy+LA==
X-Received: by 2002:a50:d494:0:b0:53d:a4e5:67d0 with SMTP id
 s20-20020a50d494000000b0053da4e567d0mr2453938edi.13.1698412517284; Fri, 27
 Oct 2023 06:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20231017193217.1512868-1-tong.ho@amd.com>
 <20231017193217.1512868-4-tong.ho@amd.com>
In-Reply-To: <20231017193217.1512868-4-tong.ho@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Oct 2023 14:15:06 +0100
Message-ID: <CAFEAcA9z8BAgapk4HixRdpB49reLNGs8_b5GMrEt7uYCEr9Pug@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] tests/qtest: Introduce tests for AMD/Xilinx Versal
 TRNG device
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me, 
 edgar.iglesias@gmail.com, richard.henderson@linaro.org, 
 frasse.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: uijRv4h4EeQk

On Tue, 17 Oct 2023 at 20:32, Tong Ho <tong.ho@amd.com> wrote:
>
> Signed-off-by: Tong Ho <tong.ho@amd.com>
> ---
>  tests/qtest/meson.build             |   2 +-
>  tests/qtest/xlnx-versal-trng-test.c | 486 ++++++++++++++++++++++++++++
>  2 files changed, 487 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/xlnx-versal-trng-test.c
>
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 66795cfcd2..593ca6714b 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -216,7 +216,7 @@ qtests_aarch64 = \
>    (config_all.has_key('CONFIG_TCG') and config_all_devices.has_key('CONFIG_TPM_TIS_SYSBUS') ?            \
>      ['tpm-tis-device-test', 'tpm-tis-device-swtpm-test'] : []) +                                         \
>    (config_all_devices.has_key('CONFIG_XLNX_ZYNQMP_ARM') ? ['xlnx-can-test', 'fuzz-xlnx-dp-test'] : []) + \
> -  (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test'] : []) + \
> +  (config_all_devices.has_key('CONFIG_XLNX_VERSAL') ? ['xlnx-canfd-test', 'xlnx-versal-trng-test'] : []) + \
>    (config_all_devices.has_key('CONFIG_RASPI') ? ['bcm2835-dma-test'] : []) +  \
>    (config_all.has_key('CONFIG_TCG') and                                            \
>     config_all_devices.has_key('CONFIG_TPM_TIS_I2C') ? ['tpm-tis-i2c-test'] : []) + \
> diff --git a/tests/qtest/xlnx-versal-trng-test.c b/tests/qtest/xlnx-versal-trng-test.c
> new file mode 100644
> index 0000000000..dc19c1e83b
> --- /dev/null
> +++ b/tests/qtest/xlnx-versal-trng-test.c
> @@ -0,0 +1,486 @@
> +/*
> + * QTests for the Xilinx Versal True Random Number Generator device
> + *
> + * Copyright (c) 2023 Advanced Micro Devices, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +

> +#define FAILED(FMT, ...) g_error("%s(): " FMT, __func__, ## __VA_ARGS__)

This fails to build for Windows because this macro name clashes
with one from the system winerror.h:

../tests/qtest/xlnx-versal-trng-test.c:71: error: "FAILED" redefined [-Werror]
71 | #define FAILED(FMT, ...) g_error("%s(): " FMT, __func__, ## __VA_ARGS__)

Also, qtests should not be using g_error() to report errors, because
this turns into a call to abort(), which the test harness will
not report nicely as an error. Use g_assert_true() or one of
the family of g_assert_cmp*() functions to test checks that
you want to be test passes or failures (but *not* g_assert()).

thanks
-- PMM
