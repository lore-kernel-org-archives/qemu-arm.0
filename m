Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2872857ejb;
        Wed, 4 Oct 2023 12:09:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHH1uQMD73t995sjS9NYBFKIuoObDzbBoIhNy+v25DIYuhfoQ0v+kwSt7Dg35IQczqK2Oh8
X-Received: by 2002:a05:622a:1ba4:b0:417:bd2c:2683 with SMTP id bp36-20020a05622a1ba400b00417bd2c2683mr3137971qtb.19.1696446564672;
        Wed, 04 Oct 2023 12:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696446564; cv=none;
        d=google.com; s=arc-20160816;
        b=CrkI5QaKZwQWFawnF0P466UXCAO+K9NRnSwLN+sDrnYcmbE3HQyhFRzODuyD0gbGyv
         nGjR2YzEltbqOw6dh7LaprATbR80BeiafW2OePhJWkslEgCbxpvKoyRVijqqP+UNWdLj
         D8tdxrlc55zrXiH/whYszjuYRF1AXn6TzQHwXpRuvRbfxBFKJTlMOhwvKxaDMYE/4aLq
         S94dTfUy5kEzgl+wDB2RyoHnrPd8iEuahu8+aNy9NiKMVW6WkLoml9KmPluL5GKq3vpK
         XuLU+VCkE33+MYxrypbscTzc9j+5bpx5Z8j65RefpxqFVnJG4nebsu4BV0XNMng4c4un
         hN7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=Vsq849PX4VheZVg4W/m02LXKEpHPLxH031SVAUC7UrA=;
        fh=Iqw+C3zUdjRbqvq8+6x0+40nrEuEq3eUeL/fW1XE9rM=;
        b=WbbtI/lffApV6HJ7tlkXz863KHBQYse6MDwoWwFCeKfTZjUqfHkepG4rsxNCJc0m8Q
         rjy0eOZ+jyY9MRh8K59n3FLwm0vZ5/yTYAf5ko2YSGbvtDy23Oy0Y+X5j7f7+N6Bakeq
         /rT4WGa2wJLqSMbHphBK7bO8Iwwgd7Noz5CkuzdMsgLqdgnunQI7BEx1j7srCNtb+j8z
         vkF0Ql3DWoBjxLo+X+zSS25VCbAehBXp8MYtR+wUck/NoHHk6D9Xi9RAznYrp0MhkM/X
         TBs0nmddFpiumuwJr+N08hkgQH2m7W4o5uRfgQN0g+kYnGPDUOEVPJzreh8pBryZV7RC
         dpgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nn2e1yU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020a05622a191000b00417fc5387d6si1785592qtc.665.2023.10.04.12.09.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 12:09:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Nn2e1yU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qo7F1-0005Gg-Nj; Wed, 04 Oct 2023 15:09:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1qo7F1-0005GJ-3a; Wed, 04 Oct 2023 15:09:03 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1qo7Ey-0005G2-Jt; Wed, 04 Oct 2023 15:09:02 -0400
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2c17de836fbso2342011fa.1; 
 Wed, 04 Oct 2023 12:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696446537; x=1697051337; darn=nongnu.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vsq849PX4VheZVg4W/m02LXKEpHPLxH031SVAUC7UrA=;
 b=Nn2e1yU7qbisv3mC888tKtWWXn2cgBRf2gIKqQDyvbpobuov84xbG30wSpFh9io758
 olaiBJIA8pM56/fgvx2PQZZq1lkiVzCSur3yNA1QeCCay3N2V53OWbtEMJs5VWUW6W9h
 NjIh65YbyeLkOUeV5CIz4foBNyOWz0yf/tZaL4j8NNEyY1XDd/5dx+h9NZ8UoEaC8uwL
 D7+h7O1BPU7XlvYVcfgmo4XAvMsCE38j5+rtlZoads7XwwF8+MPZZgKkdgfkQIDdtu2K
 3rMKQnBGsOqHCj3P9u+nSRgbg126u0vzSrQYCuIpZn9qMaJaxiFNOvKpKBCxL9Othml+
 4R3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696446537; x=1697051337;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vsq849PX4VheZVg4W/m02LXKEpHPLxH031SVAUC7UrA=;
 b=rkxMWK67xTYr5gENuJofXoKXsG5o6CV7ycurPMeK6+mDqmJgQwm//c7YS+RKu8KWxH
 TVNOt54lP92ZekMxU0w525ZvUebdvqJHKESXpt5Oc/Zi6TdRRPw6cgYYvPPaJsD851Ok
 b8EMuWXenl0+MQKSPFqm3Ll1YaKbCtqw96PrQe4ndV+kvnvWpNEhYQkP4i8GRithccNz
 mF29lkF3mYzBRzTekOMxhVtu/RFDUNxZ6b5YMtsXJNSlps1oaPD7FjP95oOaU4ABk/Oy
 e1t1F6QlMg95Nwhbjt/4R6L6n32CQOO4l6dO86DqQt4xr8U+mcV6mdAajw0HOi5lcFu1
 3ZHg==
X-Gm-Message-State: AOJu0YxTu5qac4raBERtpAwn9OTER3+UqgGh7Hboaia6UDQM/CIeEkHb
 uFPLmr5jrKEgedlUDzlfxsw=
X-Received: by 2002:a05:6512:138e:b0:503:7dd:7ebc with SMTP id
 fc14-20020a056512138e00b0050307dd7ebcmr3970906lfb.18.1696446537234; 
 Wed, 04 Oct 2023 12:08:57 -0700 (PDT)
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
 by smtp.gmail.com with ESMTPSA id
 l17-20020ac25551000000b00500a44e158csm703037lfk.235.2023.10.04.12.08.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 12:08:56 -0700 (PDT)
Date: Wed, 4 Oct 2023 21:08:55 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 edgar.iglesias@gmail.com, peter.maydell@linaro.org
Subject: Re: [PATCH v3 3/3] tests/qtest: Introduce tests for AMD/Xilinx
 Versal TRNG device
Message-ID: <20231004190854.GA20007@fralle-msi>
References: <20231004142746.350225-1-tong.ho@amd.com>
 <20231004142746.350225-4-tong.ho@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231004142746.350225-4-tong.ho@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
X-TUID: E2bc29PFDFkK

On [2023 Oct 04] Wed 07:27:46, Tong Ho wrote:
> Signed-off-by: Tong Ho <tong.ho@amd.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  tests/qtest/meson.build             |   2 +-
>  tests/qtest/xlnx-versal-trng-test.c | 490 ++++++++++++++++++++++++++++
>  2 files changed, 491 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/xlnx-versal-trng-test.c
> 
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 1fba07f4ed..215d20e8cf 100644
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
> index 0000000000..ddafaee72b
> --- /dev/null
> +++ b/tests/qtest/xlnx-versal-trng-test.c
> @@ -0,0 +1,490 @@
> +/*
> + * QTests for the Xilinx Versal True Random Number Generator device
> + *
> + * Copyright (c) 2023 Advanced Micro Devices, Inc.
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest-single.h"
> +
> +/* Base Address */
> +#define TRNG_BASEADDR      (0xf1230000)
> +
> +/* TRNG_INT_CTRL */
> +#define R_TRNG_INT_CTRL                 (0x0000)
> +#define   TRNG_INT_CTRL_CERTF_RST_MASK  (1 << 5)
> +#define   TRNG_INT_CTRL_DTF_RST_MASK    (1 << 4)
> +#define   TRNG_INT_CTRL_DONE_RST_MASK   (1 << 3)
> +#define   TRNG_INT_CTRL_CERTF_EN_MASK   (1 << 2)
> +#define   TRNG_INT_CTRL_DTF_EN_MASK     (1 << 1)
> +#define   TRNG_INT_CTRL_DONE_EN_MASK    (1)
> +
> +/* TRNG_STATUS */
> +#define R_TRNG_STATUS              (0x0004)
> +#define   TRNG_STATUS_QCNT_SHIFT   (9)
> +#define   TRNG_STATUS_QCNT_MASK    (7 << TRNG_STATUS_QCNT_SHIFT)
> +#define   TRNG_STATUS_CERTF_MASK   (1 << 3)
> +#define   TRNG_STATUS_DTF_MASK     (1 << 1)
> +#define   TRNG_STATUS_DONE_MASK    (1)
> +
> +/* TRNG_CTRL */
> +#define R_TRNG_CTRL                (0x0008)
> +#define   TRNG_CTRL_PERSODISABLE_MASK   (1 << 10)
> +#define   TRNG_CTRL_SINGLEGENMODE_MASK  (1 << 9)
> +#define   TRNG_CTRL_PRNGMODE_MASK       (1 << 7)
> +#define   TRNG_CTRL_TSTMODE_MASK        (1 << 6)
> +#define   TRNG_CTRL_PRNGSTART_MASK      (1 << 5)
> +#define   TRNG_CTRL_PRNGXS_MASK         (1 << 3)
> +#define   TRNG_CTRL_TRSSEN_MASK         (1 << 2)
> +#define   TRNG_CTRL_QERTUEN_MASK        (1 << 1)
> +#define   TRNG_CTRL_PRNGSRST_MASK       (1)
> +
> +/* TRNG_EXT_SEED_0 ... _11 */
> +#define R_TRNG_EXT_SEED_0          (0x0040)
> +#define R_TRNG_EXT_SEED_11         (R_TRNG_EXT_SEED_0 + 4 * 11)
> +
> +/* TRNG_PER_STRNG_0 ... 11 */
> +#define R_TRNG_PER_STRNG_0         (0x0080)
> +#define R_TRNG_PER_STRNG_11        (R_TRNG_PER_STRNG_0 + 4 * 11)
> +
> +/* TRNG_CORE_OUTPUT */
> +#define R_TRNG_CORE_OUTPUT         (0x00c0)
> +
> +/* TRNG_RESET */
> +#define R_TRNG_RESET               (0x00d0)
> +#define   TRNG_RESET_VAL_MASK      (1)
> +
> +/* TRNG_OSC_EN */
> +#define R_TRNG_OSC_EN              (0x00d4)
> +#define   TRNG_OSC_EN_VAL_MASK     (1)
> +
> +/* TRNG_TRNG_ISR, _IMR, _IER, _IDR */
> +#define R_TRNG_ISR                 (0x00e0)
> +#define R_TRNG_IMR                 (0x00e4)
> +#define R_TRNG_IER                 (0x00e8)
> +#define R_TRNG_IDR                 (0x00ec)
> +#define   TRNG_IRQ_SLVERR_MASK     (1 << 1)
> +#define   TRNG_IRQ_CORE_INT_MASK   (1)
> +
> +#define FAILED(FMT, ...) g_error("%s(): " FMT, __func__, ## __VA_ARGS__)
> +
> +static const uint32_t prng_seed[12] = {
> +    0x01234567, 0x12345678, 0x23456789, 0x3456789a, 0x456789ab, 0x56789abc,
> +    0x76543210, 0x87654321, 0x98765432, 0xa9876543, 0xba987654, 0xfedcba98,
> +};
> +
> +static const uint32_t pers_str[12] = {
> +    0x76543210, 0x87654321, 0x98765432, 0xa9876543, 0xba987654, 0xfedcba98,
> +    0x01234567, 0x12345678, 0x23456789, 0x3456789a, 0x456789ab, 0x56789abc,
> +};
> +
> +static void trng_test_start(void)
> +{
> +    qtest_start("-machine xlnx-versal-virt");
> +}
> +
> +static void trng_test_stop(void)
> +{
> +    qtest_end();
> +}
> +
> +static void trng_test_set_uint_prop(const char *name, uint64_t value)
> +{
> +    const char *path = "/machine/xlnx-versal/trng";
> +    QDict *response;
> +
> +    response = qmp("{ 'execute': 'qom-set',"
> +                    " 'arguments': {"
> +                       " 'path': %s,"
> +                       " 'property': %s,"
> +                       " 'value': %llu"
> +                      "} }", path,
> +                   name, (unsigned long long)value);
> +    g_assert(qdict_haskey(response, "return"));
> +    qobject_unref(response);
> +}
> +
> +static void trng_write(unsigned ra, uint32_t val)
> +{
> +    writel(TRNG_BASEADDR + ra, val);
> +}
> +
> +static uint32_t trng_read(unsigned ra)
> +{
> +    return readl(TRNG_BASEADDR + ra);
> +}
> +
> +static void trng_bit_set(unsigned ra, uint32_t bits)
> +{
> +    trng_write(ra, (trng_read(ra) | bits));
> +}
> +
> +static void trng_bit_clr(unsigned ra, uint32_t bits)
> +{
> +    trng_write(ra, (trng_read(ra) & ~bits));
> +}
> +
> +static void trng_ctrl_set(uint32_t bits)
> +{
> +    trng_bit_set(R_TRNG_CTRL, bits);
> +}
> +
> +static void trng_ctrl_clr(uint32_t bits)
> +{
> +    trng_bit_clr(R_TRNG_CTRL, bits);
> +}
> +
> +static uint32_t trng_status(void)
> +{
> +    return trng_read(R_TRNG_STATUS);
> +}
> +
> +static unsigned trng_qcnt(void)
> +{
> +    uint32_t sta = trng_status();
> +
> +    return (sta & TRNG_STATUS_QCNT_MASK) >> TRNG_STATUS_QCNT_SHIFT;
> +}
> +
> +static const char *trng_info(void)
> +{
> +    uint32_t sta = trng_status();
> +    uint32_t ctl = trng_read(R_TRNG_CTRL);
> +
> +    static char info[64];
> +
> +    snprintf(info, sizeof(info), "; status=0x%x, ctrl=0x%x", sta, ctl);
> +    return info;
> +}
> +
> +static void trng_wait(uint32_t wait_mask, bool on, const char *act)
> +{
> +    time_t tmo = time(NULL) + 2; /* at most 2 seconds */
> +    uint32_t event_mask = 0;
> +    uint32_t clear_mask = 0;
> +
> +    /*
> +     * Only selected bits are events in R_TRNG_STATUS, and
> +     * clear them needs to go through R_INT_CTRL.
> +     */
> +    if (wait_mask & TRNG_STATUS_CERTF_MASK) {
> +        event_mask |= TRNG_STATUS_CERTF_MASK;
> +        clear_mask |= TRNG_INT_CTRL_CERTF_RST_MASK;
> +    }
> +    if (wait_mask & TRNG_STATUS_DTF_MASK) {
> +        event_mask |= TRNG_STATUS_DTF_MASK;
> +        clear_mask |= TRNG_INT_CTRL_DTF_RST_MASK;
> +    }
> +    if (wait_mask & TRNG_STATUS_DONE_MASK) {
> +        event_mask |= TRNG_STATUS_DONE_MASK;
> +        clear_mask |= TRNG_INT_CTRL_DONE_RST_MASK;
> +    }
> +
> +    for (;;) {
> +        bool sta = !!(trng_status() & event_mask);
> +
> +        if ((on ^ sta) == 0) {
> +            break;
> +        }
> +
> +        if (time(NULL) >= tmo) {
> +            FAILED("%s: Timed out waiting for event 0x%x to be %d%s",
> +                   act, event_mask, (int)on, trng_info());
> +        }
> +
> +        g_usleep(10000);
> +    }
> +
> +    /* Remove event */
> +    trng_bit_set(R_TRNG_INT_CTRL, clear_mask);
> +
> +    if (!!(trng_read(R_TRNG_STATUS) & event_mask)) {
> +        FAILED("%s: Event 0x%0x stuck at 1 after clear: %s",
> +               act, event_mask, trng_info());
> +    }
> +}
> +
> +static void trng_wait_done(const char *act)
> +{
> +    trng_wait(TRNG_STATUS_DONE_MASK, true, act);
> +}
> +
> +static void trng_wait_dtf(void)
> +{
> +    trng_wait(TRNG_STATUS_DTF_MASK, true, "DTF injection");
> +}
> +
> +static void trng_wait_certf(void)
> +{
> +    trng_wait(TRNG_STATUS_CERTF_MASK, true, "CERTF injection");
> +}
> +
> +static void trng_reset(void)
> +{
> +    trng_write(R_TRNG_RESET, TRNG_RESET_VAL_MASK);
> +    trng_write(R_TRNG_RESET, 0);
> +}
> +
> +static void trng_load(unsigned r0, const uint32_t *b384)
> +{
> +    static const uint32_t zero[12] = { 0 };
> +    unsigned k;
> +
> +    if (!b384) {
> +        b384 = zero;
> +    }
> +
> +    for (k = 0; k < 12; k++) {
> +        trng_write(r0 + 4 * k, b384[k]);
> +    }
> +}
> +
> +static void trng_reseed(const uint32_t *seed)
> +{
> +    const char *act;
> +    uint32_t ctl;
> +
> +    ctl = TRNG_CTRL_PRNGSTART_MASK |
> +          TRNG_CTRL_PRNGXS_MASK |
> +          TRNG_CTRL_TRSSEN_MASK;
> +
> +    trng_ctrl_clr(ctl | TRNG_CTRL_PRNGMODE_MASK);
> +
> +    if (seed) {
> +        trng_load(R_TRNG_EXT_SEED_0, seed);
> +        act = "Reseed PRNG";
> +        ctl &= ~TRNG_CTRL_TRSSEN_MASK;
> +    } else {
> +        trng_write(R_TRNG_OSC_EN, TRNG_OSC_EN_VAL_MASK);
> +        act = "Reseed TRNG";
> +        ctl &= ~TRNG_CTRL_PRNGXS_MASK;
> +    }
> +
> +    trng_ctrl_set(ctl);
> +    trng_wait_done(act);
> +    trng_ctrl_clr(TRNG_CTRL_PRNGSTART_MASK);
> +}
> +
> +static void trng_generate(bool auto_enb)
> +{
> +    uint32_t ctl;
> +
> +    ctl = TRNG_CTRL_PRNGSTART_MASK | TRNG_CTRL_SINGLEGENMODE_MASK;
> +    trng_ctrl_clr(ctl);
> +
> +    if (auto_enb) {
> +        ctl &= ~TRNG_CTRL_SINGLEGENMODE_MASK;
> +    }
> +
> +    trng_ctrl_set(ctl | TRNG_CTRL_PRNGMODE_MASK);
> +
> +    trng_wait_done("Generate");
> +    g_assert(trng_qcnt() != 7);
> +}
> +
> +static size_t trng_collect(uint32_t *rnd, size_t cnt)
> +{
> +    size_t i;
> +
> +    for (i = 0; i < cnt; i++) {
> +        if (trng_qcnt() == 0) {
> +            return i;
> +        }
> +
> +        rnd[i] = trng_read(R_TRNG_CORE_OUTPUT);
> +    }
> +
> +    return i;
> +}
> +
> +static void trng_test_autogen(void)
> +{
> +    const size_t cnt = 512 / 32;
> +    uint32_t rng[cnt], prng[cnt];
> +    size_t n;
> +
> +    trng_reset();
> +
> +    /* PRNG run #1 */
> +    trng_reseed(prng_seed);
> +    trng_generate(true);
> +
> +    n = trng_collect(prng, cnt);
> +    if (n != cnt) {
> +        FAILED("PRNG_1 Auto-gen test failed: expected = %u, got = %u",
> +               (unsigned)cnt, (unsigned)n);
> +    }
> +
> +    /* TRNG, should not match PRNG */
> +    trng_reseed(NULL);
> +    trng_generate(true);
> +
> +    n = trng_collect(rng, cnt);
> +    if (n != cnt) {
> +        FAILED("TRNG Auto-gen test failed: expected = %u, got = %u",
> +               (unsigned)cnt, (unsigned)n);
> +    }
> +
> +    if (!memcmp(rng, prng, sizeof(rng))) {
> +        FAILED("TRNG test failed: matching PRNG");
> +    }
> +
> +    /* PRNG #2: should matches run #1 */
> +    trng_reseed(prng_seed);
> +    trng_generate(true);
> +
> +    n = trng_collect(rng, cnt);
> +    if (n != cnt) {
> +        FAILED("PRNG_2 Auto-gen test failed: expected = %u, got = %u",
> +               (unsigned)cnt, (unsigned)n);
> +    }
> +
> +    if (memcmp(rng, prng, sizeof(rng))) {
> +        FAILED("PRNG_2 Auto-gen test failed: does not match PRNG_1");
> +    }
> +}
> +
> +static void trng_test_oneshot(void)
> +{
> +    const size_t cnt = 512 / 32;
> +    uint32_t rng[cnt];
> +    size_t n;
> +
> +    trng_reset();
> +
> +    /* PRNG run #1 */
> +    trng_reseed(prng_seed);
> +    trng_generate(false);
> +
> +    n = trng_collect(rng, cnt);
> +    if (n == cnt) {
> +        FAILED("PRNG_1 One-shot gen test failed");
> +    }
> +
> +    /* TRNG, should not match PRNG */
> +    trng_reseed(NULL);
> +    trng_generate(false);
> +
> +    n = trng_collect(rng, cnt);
> +    if (n == cnt) {
> +        FAILED("TRNG One-shot test failed");
> +    }
> +}
> +
> +static void trng_test_per_str(void)
> +{
> +    const size_t cnt = 512 / 32;
> +    uint32_t rng[cnt], prng[cnt];
> +    size_t n;
> +
> +    trng_reset();
> +
> +    /* #1: disabled */
> +    trng_ctrl_set(TRNG_CTRL_PERSODISABLE_MASK);
> +    trng_reseed(prng_seed);
> +    trng_ctrl_clr(TRNG_CTRL_PERSODISABLE_MASK);
> +
> +    trng_generate(true);
> +    n = trng_collect(prng, cnt);
> +    g_assert_cmpuint(n, ==, cnt);
> +
> +    /* #2: zero string should match personalization disabled */
> +    trng_load(R_TRNG_PER_STRNG_0, NULL);
> +    trng_reseed(prng_seed);
> +
> +    trng_generate(true);
> +    n = trng_collect(rng, cnt);
> +    g_assert_cmpuint(n, ==, cnt);
> +
> +    if (memcmp(rng, prng, sizeof(rng))) {
> +        FAILED("Failed: PER_DISABLE != PER_STRNG_ALL_ZERO");
> +    }
> +
> +    /* #3: non-zero string should not match personalization disabled */
> +    trng_load(R_TRNG_PER_STRNG_0, pers_str);
> +    trng_reseed(prng_seed);
> +
> +    trng_generate(true);
> +    n = trng_collect(rng, cnt);
> +    g_assert_cmpuint(n, ==, cnt);
> +
> +    if (!memcmp(rng, prng, sizeof(rng))) {
> +        FAILED("Failed: PER_DISABLE == PER_STRNG_NON_ZERO");
> +    }
> +}
> +
> +static void trng_test_forced_prng(void)
> +{
> +    const char *prop = "forced-prng";
> +    const uint64_t seed = 0xdeadbeefbad1bad0ULL;
> +
> +    const size_t cnt = 512 / 32;
> +    uint32_t rng[cnt], prng[cnt];
> +    size_t n;
> +
> +    trng_reset();
> +    trng_test_set_uint_prop(prop, seed);
> +
> +    /* TRNG run #1 */
> +    trng_reset();
> +    trng_reseed(NULL);
> +    trng_generate(true);
> +
> +    n = trng_collect(prng, cnt);
> +    g_assert_cmpuint(n, ==, cnt);
> +
> +    /* TRNG run #2 should match run #1 */
> +    trng_reset();
> +    trng_reseed(NULL);
> +    trng_generate(true);
> +
> +    n = trng_collect(rng, cnt);
> +    g_assert_cmpuint(n, ==, cnt);
> +
> +    if (memcmp(rng, prng, sizeof(rng))) {
> +        FAILED("Forced-prng test failed: results do not match");
> +    }
> +}
> +
> +static void trng_test_fault_events(void)
> +{
> +    const char *prop = "fips-fault-events";
> +
> +    trng_reset();
> +
> +    /* Fault events only when TRSS is enabled */
> +    trng_write(R_TRNG_OSC_EN, TRNG_OSC_EN_VAL_MASK);
> +    trng_ctrl_set(TRNG_CTRL_TRSSEN_MASK);
> +
> +    trng_test_set_uint_prop(prop, TRNG_STATUS_CERTF_MASK);
> +    trng_wait_certf();
> +
> +    trng_test_set_uint_prop(prop, TRNG_STATUS_DTF_MASK);
> +    trng_wait_dtf();
> +
> +    trng_reset();
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int rc;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    #define TRNG_TEST_ADD(n) \
> +            qtest_add_func("/hw/misc/xlnx-versal-trng/" #n, trng_test_ ## n);
> +    TRNG_TEST_ADD(autogen);
> +    TRNG_TEST_ADD(oneshot);
> +    TRNG_TEST_ADD(per_str);
> +    TRNG_TEST_ADD(forced_prng);
> +    TRNG_TEST_ADD(fault_events);
> +    #undef TRNG_TEST_ADD
> +
> +    trng_test_start();
> +    rc = g_test_run();
> +    trng_test_stop();
> +
> +    return rc;
> +}
> -- 
> 2.25.1
> 
