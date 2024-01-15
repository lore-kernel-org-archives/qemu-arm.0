Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp290594ejf;
        Mon, 15 Jan 2024 06:53:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwxwV9cCvFsp/vjtB9m7ls50R3QPn9xblqJj8h8hRUr9/F4VMYcxji56wKrCjqgQ6CLReN
X-Received: by 2002:a05:622a:48e:b0:429:e350:4870 with SMTP id p14-20020a05622a048e00b00429e3504870mr4404487qtx.52.1705330395901;
        Mon, 15 Jan 2024 06:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705330395; cv=none;
        d=google.com; s=arc-20160816;
        b=PbjUrSMTHSgDnYAL8R7aopFqTyhYFrK/nJqFa0bib3FsamGAgO58G2137FNDyOx+yp
         qvH65Fa7xuDg+wT8m5M3bI15372ugj+EBWHRQ2zaukk7iy+726Mt/Zxbo5BlgYVo19Sh
         1k+TJR7bsTgB40KIyaheQwCZW2Zhsf37difZEHcXXoKPqHwcNqwxyMTHF4NNvFprgv00
         TXY6eTuZXAT/2Kc1Vxf0fxjGZcjWouRXDYNRq3dbNgyKKxChZl79/8In4dX//dwHS+xu
         rqnFvG+2SuxPa0MY+dO8qjV1gxWZaPVv4ORQa0iZLvuhZbKu3OseS/AiqSDTqBWLFZA2
         OM0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KnLlvw4M5+iUvLq0cVo7gVoZNCnY8eXVo0w0z29vHUo=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=0LVRfzCIMNUApGy9UQwIFsD8IJ518HvIl1wLhvYl28euXiePXTlmKZmLyUE4UUW+Ms
         gR9VWBA87ZXGQxHUfEUJ6/xHH+80JVKDDIPAJ2OnSi4FaWk9CRktmRJzSDadmv43Rt8E
         c0PkWjsJpBYNWdNlTwqPTljD6i8dEaq3HU7sFPwDHcYDaR+9Iw4Gvlik/CkFOqInKveG
         4kfbFtXFkEkK6nMyVGIHts3tnpLua2HO+3kGQzoara6aGS966BNUmfGXcceu4MU5TyiV
         XNvJBmQV30fmokM/nbSR6DAcQ7yHiC65oB5p6DMOvDgZjLsnbyTY2X2Vvhmy5+Wun9Vg
         u36A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lktXds6l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y20-20020ac85f54000000b00425c3b740b8si8181955qta.766.2024.01.15.06.53.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 06:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lktXds6l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPOKY-0002LK-F3; Mon, 15 Jan 2024 09:52:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOKW-0002KR-2Z
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:52:48 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOKU-0006h3-7w
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 09:52:47 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5578485fc0eso7917706a12.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 06:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705330365; x=1705935165; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KnLlvw4M5+iUvLq0cVo7gVoZNCnY8eXVo0w0z29vHUo=;
 b=lktXds6liicKG3kYKXMTOkLwsJULD9LtmQQNvDjoQpzo43AkQKrV5vdNSa82642FpL
 LZsXb6Cb+K3f8gBmN+FFa4PUvpc/hAYkZbU6Hge5yVGCFPYwOY3kylKTJSz3BzAILQjB
 lubncntaDYDs+TY6iZc6gQQHeP6HX6aGekMwXjMXrdxMuFhV5id406TTtka0KF9ruRdn
 LmMEFg9rxrtaBrQEszacDKKNtY6mAcL5ZCvYvWyP0T9ZurvOHjWbiVFWvEvo8aGDvWri
 LcdF0YmNhGaea7GzR8pXH5yVWgNXaaPK5IgMsZ2nOVfht5gxfayd+Gd1oB1eIgUyXClv
 VMrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705330365; x=1705935165;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KnLlvw4M5+iUvLq0cVo7gVoZNCnY8eXVo0w0z29vHUo=;
 b=t5kAZrGASCNSovsFXXX/loVKXPHzKVLZNqytLqjXbnqDQ/nFXYssbZtLjy9ZBuh9XJ
 8gEMCeV/GTTtjSTWc6AbCnmCWGvdCX0IVuQUkaGO+8Wy+86NQhK/9i5vQbKmQ68LbJEi
 3YdNboKDH5buPYf5EmRcUGFtF12G6ES1WcCtCd4U+JVXgVNKJWZESxAI59eBrxx7j0bV
 xUHS8DOlbZZgS48UofQHQ9zPPbsIo1coWZ/Eb8I80MYsr2N471bBd6Ho8e2D331fUPYb
 Qp7pbFY8bbs3U7zfe+U8HirKrHqH32RNKsSmLseCRl/N6Lgt5yf70yqwozejC9BD5bZi
 swpA==
X-Gm-Message-State: AOJu0YwzsYHL1ko6kie8W5ugpCyTuKWcCKJe2fzjcT7lMb/Cy5YSAZXP
 U0iFW5xQsJPjem1a9k1uA7w9BVbqiszVm6j4FwQgtI76jQKACg==
X-Received: by 2002:aa7:ca55:0:b0:559:73cc:6fa5 with SMTP id
 j21-20020aa7ca55000000b0055973cc6fa5mr223252edt.80.1705330364801; Mon, 15 Jan
 2024 06:52:44 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-36-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-36-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 14:52:33 +0000
Message-ID: <CAFEAcA9cNDmDxU=kEBmDb00yQLQWNGikzeNNh6+uHhOx0Jt6Kw@mail.gmail.com>
Subject: Re: [PATCH v4 35/45] Add mailbox test stub
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: k0GhkYKl2qVK

On Fri, 8 Dec 2023 at 02:36, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  include/hw/arm/bcm2838_peripherals.h |  2 +
>  tests/qtest/bcm2838-mailbox.c        | 71 ++++++++++++++++++++++++++++
>  tests/qtest/bcm2838-mailbox.h        | 46 ++++++++++++++++++
>  tests/qtest/meson.build              |  1 +
>  4 files changed, 120 insertions(+)
>  create mode 100644 tests/qtest/bcm2838-mailbox.c
>  create mode 100644 tests/qtest/bcm2838-mailbox.h
>
> diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
> index cdeb892f04..2b97e55048 100644
> --- a/include/hw/arm/bcm2838_peripherals.h
> +++ b/include/hw/arm/bcm2838_peripherals.h
> @@ -56,6 +56,8 @@
>  #define BCM2838_MPHI_OFFSET     0xb200
>  #define BCM2838_MPHI_SIZE       0x200
>
> +#define GENET_OFFSET            0x1580000
> +
>  #define TYPE_BCM2838_PERIPHERALS "bcm2838-peripherals"
>  OBJECT_DECLARE_TYPE(BCM2838PeripheralState, BCM2838PeripheralClass,
>                      BCM2838_PERIPHERALS)

This change looks like it should have been in some other patch
(also it's the second define of GENET_OFFSET I think).

> diff --git a/tests/qtest/bcm2838-mailbox.c b/tests/qtest/bcm2838-mailbox.c
> new file mode 100644
> index 0000000000..2edc24e15e
> --- /dev/null
> +++ b/tests/qtest/bcm2838-mailbox.c
> @@ -0,0 +1,71 @@
> +/*
> + * Helper functions to work with BCM2838 mailbox via qtest interface.
> + *
> + * Copyright (c) 2023 Auriga LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/registerfields.h"
> +#include "libqtest-single.h"
> +#include "bcm2838-mailbox.h"
> +
> +
> +static uint32_t qtest_mbox0_read_reg32(QTestState *s, uint32_t offset)
> +{
> +    return qtest_readl(s, MBOX0_BASE + offset);
> +}
> +
> +static void qtest_mbox1_write_reg32(QTestState *s, uint32_t offset, uint32_t value)
> +{
> +    return qtest_writel(s, MBOX1_BASE + offset, value);
> +}
> +
> +static void qtest_mbox1_write(QTestState *s, uint8_t channel, uint32_t data)
> +{
> +    uint32_t reg;
> +
> +    reg = FIELD_DP32(reg, MBOX_WRITE_REG, CHANNEL, channel);
> +    reg = FIELD_DP32(reg, MBOX_WRITE_REG, DATA, data);
> +    qtest_mbox1_write_reg32(s, MBOX_REG_WRITE, reg);
> +}
> +
> +int qtest_mbox0_has_data(QTestState *s) {
> +    return !(qtest_mbox0_read_reg32(s, MBOX_REG_STATUS) & MBOX_READ_EMPTY);
> +}
> +
> +int mbox0_has_data(void) {
> +    return qtest_mbox0_has_data(global_qtest);
> +}
> +
> +void qtest_mbox0_read_message(QTestState *s,
> +                              uint8_t channel,
> +                              void *msgbuf,
> +                              size_t msgbuf_size)
> +{
> +    uint32_t reg;
> +    uint32_t msgaddr;
> +
> +    g_assert(qtest_mbox0_has_data(s));
> +    reg = qtest_mbox0_read_reg32(s, MBOX_REG_READ);
> +    g_assert_cmphex(FIELD_EX32(reg, MBOX_WRITE_REG, CHANNEL), ==, channel);
> +    msgaddr = FIELD_EX32(reg, MBOX_WRITE_REG, DATA) << 4;
> +    qtest_memread(s, msgaddr, msgbuf, msgbuf_size);
> +}
> +
> +void mbox0_read_message(uint8_t channel, void *msgbuf, size_t msgbuf_size) {
> +    qtest_mbox0_read_message(global_qtest, channel, msgbuf, msgbuf_size);
> +}
> +
> +void qtest_mbox1_write_message(QTestState *s, uint8_t channel, uint32_t msg_addr)
> +{
> +    qtest_mbox1_write(s, channel, msg_addr >> 4);
> +}
> +
> +
> +void mbox1_write_message(uint8_t channel, uint32_t msg_addr)
> +{
> +    qtest_mbox1_write_message(global_qtest, channel, msg_addr);
> +}
> diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
> new file mode 100644
> index 0000000000..1d02ca9c2c
> --- /dev/null
> +++ b/tests/qtest/bcm2838-mailbox.h
> @@ -0,0 +1,46 @@
> +/*
> + * Declarations for BCM2838 mailbox test.
> + *
> + * Copyright (c) 2023 Auriga LLC
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +
> +REG32(MBOX_WRITE_REG, 0)
> +FIELD(MBOX_WRITE_REG, CHANNEL, 0, 4)
> +FIELD(MBOX_WRITE_REG, DATA, 4, 28)
> +
> +REG32(MBOX_SIZE_STAT, 0)
> +FIELD(MBOX_WRITE_REG, SIZE, 0, 30)
> +FIELD(MBOX_WRITE_REG, SUCCESS, 30, 1)
> +
> +typedef struct {
> +    uint32_t size;
> +    uint32_t req_resp_code;
> +} MboxBufHeader;
> +
> +#define DECLARE_TAG_TYPE(TypeName, RequestValueType, ResponseValueType) \
> +typedef struct {                                                        \
> +    uint32_t id;                                                        \
> +    uint32_t value_buffer_size;                                         \
> +    union {                                                             \
> +        struct {                                                        \
> +            uint32_t zero;                                              \
> +            RequestValueType value;                                     \
> +        } request;                                                      \
> +        struct {                                                        \
> +            uint32_t size_stat;                                         \
> +            ResponseValueType value;                                    \
> +        } response;                                                     \
> +    };                                                                  \
> +} TypeName
> +
> +
> +int mbox0_has_data(void);
> +void mbox0_read_message(uint8_t channel, void *msgbuf, size_t msgbuf_size);
> +void mbox1_write_message(uint8_t channel, uint32_t msg_addr);
> +int qtest_mbox0_has_data(QTestState *s);
> +void qtest_mbox0_read_message(QTestState *s, uint8_t channel, void *msgbuf, size_t msgbuf_size);
> +void qtest_mbox1_write_message(QTestState *s, uint8_t channel, uint32_t msg_addr);
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 47dabf91d0..92eba5ac99 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -321,6 +321,7 @@ qtests = {
>    'virtio-net-failover': files('migration-helpers.c'),
>    'vmgenid-test': files('boot-sector.c', 'acpi-utils.c'),
>    'netdev-socket': files('netdev-socket.c', '../unit/socket-helpers.c'),
> +  'bcm2838-mbox-property-test' : files('bcm2838-mailbox.c'),

Does this compile successfully at this point, given there's
no main() function in it yet ? If not, this should go later
in the patchset.

>  }
>
>  if vnc.found()
> --
> 2.34.1

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
