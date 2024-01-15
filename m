Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp295413ejf;
        Mon, 15 Jan 2024 07:01:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvw24Mdvmu6SU3oNI+Fu0q5NMLVRpn4OV0CfzT4qgB6JpaBy19f+BOLo1t/qmKPVFjAxul
X-Received: by 2002:a05:6102:222a:b0:469:5013:5b83 with SMTP id d10-20020a056102222a00b0046950135b83mr973117vsb.9.1705330898433;
        Mon, 15 Jan 2024 07:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705330898; cv=none;
        d=google.com; s=arc-20160816;
        b=yddv4+hlzjkLYD6DBbUj1YHSVC+PW3Eqo/v/f1SUgLUt6AMEqmBEoefUeLuYnYuoOh
         /c6QkjkhW043vp4fJCAfP6z9Dt7B3x2KrAVEH1KypYmynDyuYu9LEpAm2oMTIRK6F+XF
         fyoA8P77bOln6tNtsgrSZd6mnxCBqn7CE/TlIJpjXd0tZBRiA3RIwEqCa8aRUNzMV1V4
         2VCMBIK9pD5uCJZoCX7KDjO0fU7dU5ghOsH8HjZKfEGpLti5oxIeEeQWB0lm7W1oE3I/
         5bPF3jPYi/YDEux3zOxHv5ZGTYZLQ4xRFP+Hc2kDaIMUztLexCsmULdXbBksablTeHep
         4YiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=28PujvG2/160s21ZgmyeJp2+D3ouujgYXI6YDN4sHA8=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=K4M30YjCwnwOrVufvgWyTAK5vdn6KXubXgdUpttY2hoCgCs6GKdzYIxqLPkrqKGeWG
         Eb4wOKpk/zquSjIExG7uzc2hkkt1/4xqjcVSDX+p2Hmb5/J/zmxPVdUpAtEZLt2nfP45
         hf/Wz1qO89MYJo2P5in9JprOigmYLEVGe77d648Me5fPyU5FEYSkVFLghx9p0f3ewGnC
         1H+mandIHNX8+T7qQQX4n4ZEQVc+pCKinEeF5Qb7aEK6FqZ1PnyCpxjjiLCrU/D5C7CJ
         pyV4rtz6+TwYyiHsQXchiXD9xskN/LI3/S47hkmR/C6JcKlmnhG3yFDy+3shncycgEsz
         XM1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHG+Sufe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jf4-20020a05610217c400b00467ee36eb3fsi866906vsb.96.2024.01.15.07.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 07:01:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eHG+Sufe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPOSx-0005Dj-IQ; Mon, 15 Jan 2024 10:01:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOSw-0005DE-BU
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 10:01:30 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPOSu-0008Mc-G4
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 10:01:30 -0500
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5596d187f0bso649257a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 07:01:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705330887; x=1705935687; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=28PujvG2/160s21ZgmyeJp2+D3ouujgYXI6YDN4sHA8=;
 b=eHG+SufePlfAYKeFn0YdsWSPH9x9WUOqLBH3yXv1eboMCOaZ/oYB4fftV+MjRKfeqn
 zpOyKu/RsxokAWoQznlHix1ish8o/M2YAJ1uy2Fpn0afplW7Lfr68eiwFQok5DRjfEBc
 9fJPSWPDpK3DWHytn7lo9Vw2YgD+fSfiILHNCdiqU9w53TnNkUg0JsGgHIvLNbKxrzQU
 Bhfa76Yb8IUphuxGPSf5KoeCl/I2Mm6zNsR3hggs2850CmUuVUY0lFFB1T57uZajFmCQ
 PfVCJiFlWgQ0QRk3biYINZ/DOxhw39X4/mMqKiGtYlR60PGetmDd/BzYv30hxPbudNEd
 W7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705330887; x=1705935687;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=28PujvG2/160s21ZgmyeJp2+D3ouujgYXI6YDN4sHA8=;
 b=MM2Lk+itzHgfeCkpP77Jz3Odw+ZTyaF5QclED/FouxUCXbYdwYy+6Z1SLd7XTP9AsV
 vZfJa08wU1TBs8SEPkOKKzswM2+jY1Rv+uEG6XlQuosBtxcj9zAxY/VA5kcZBYBPVqRa
 9nFFt+Bgyls3ipqeNpvm8FNkXVN7J/rCWWda+vM5xb4QNdvcF0s9JUqrLyVQYpRB9rq5
 qVaBCn0rXI0ukbnjous0TW0uJu9yzpdlGybYyUKxN+6Mw7oOdEDpXLVgnL6YrIuLIk2r
 Ps7s12JLkD+7SoiO2tx941TSJwJeWTAn4aMraZsgxEeUXjTykFMC9UjOIiskusdlnO0u
 0T5A==
X-Gm-Message-State: AOJu0Yy+v47WOZ9OLwBi1xk6jbqZmeaLE8Iz4/vgtW8U0/wOTvBfD3am
 zcvbYypnMI2YRhHQKC91jzxwmgYMVfysD+K5LXQd/vJq1mODVg==
X-Received: by 2002:aa7:d483:0:b0:558:57f5:6474 with SMTP id
 b3-20020aa7d483000000b0055857f56474mr2092091edr.23.1705330884970; Mon, 15 Jan
 2024 07:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-41-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-41-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 15:01:13 +0000
Message-ID: <CAFEAcA-EbKFmUEmUdNsUTv-49gwTsWM50emPbhZP7Joh5-tX-g@mail.gmail.com>
Subject: Re: [PATCH v4 40/45] Add mailbox property tests. Part 1
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: FQQf0vpuzbcK

On Fri, 8 Dec 2023 at 02:35, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  tests/qtest/bcm2838-mailbox.c            |  34 ++--
>  tests/qtest/bcm2838-mailbox.h            |  18 +-
>  tests/qtest/bcm2838-mbox-property-test.c | 206 +++++++++++++++++++++++
>  tests/qtest/meson.build                  |   2 +-
>  4 files changed, 220 insertions(+), 40 deletions(-)
>  create mode 100644 tests/qtest/bcm2838-mbox-property-test.c
>
> diff --git a/tests/qtest/bcm2838-mailbox.c b/tests/qtest/bcm2838-mailbox.c
> index 2edc24e15e..4b160cd56c 100644
> --- a/tests/qtest/bcm2838-mailbox.c
> +++ b/tests/qtest/bcm2838-mailbox.c
> @@ -12,6 +12,10 @@
>  #include "libqtest-single.h"
>  #include "bcm2838-mailbox.h"
>
> +REG32(MBOX_EXCHNG_REG,          0)
> +FIELD(MBOX_EXCHNG_REG, CHANNEL, 0, 4)
> +FIELD(MBOX_EXCHNG_REG, DATA,    4, 28)
> +
>
>  static uint32_t qtest_mbox0_read_reg32(QTestState *s, uint32_t offset)
>  {
> @@ -25,47 +29,33 @@ static void qtest_mbox1_write_reg32(QTestState *s, uint32_t offset, uint32_t val
>
>  static void qtest_mbox1_write(QTestState *s, uint8_t channel, uint32_t data)
>  {
> -    uint32_t reg;
> +    uint32_t mbox_reg = 0;
>
> -    reg = FIELD_DP32(reg, MBOX_WRITE_REG, CHANNEL, channel);
> -    reg = FIELD_DP32(reg, MBOX_WRITE_REG, DATA, data);
> -    qtest_mbox1_write_reg32(s, MBOX_REG_WRITE, reg);
> +    mbox_reg = FIELD_DP32(mbox_reg, MBOX_EXCHNG_REG, CHANNEL, channel);
> +    mbox_reg = FIELD_DP32(mbox_reg, MBOX_EXCHNG_REG, DATA, data);
> +    qtest_mbox1_write_reg32(s, MBOX_REG_WRITE, mbox_reg);

Why change the variable name? I don't mind which one you use,
but please pick something and stick to it.

>  }
>
>  int qtest_mbox0_has_data(QTestState *s) {
>      return !(qtest_mbox0_read_reg32(s, MBOX_REG_STATUS) & MBOX_READ_EMPTY);
>  }
>
> -int mbox0_has_data(void) {
> -    return qtest_mbox0_has_data(global_qtest);
> -}

Why did we add this if we're now deleting it?

> -
>  void qtest_mbox0_read_message(QTestState *s,
>                                uint8_t channel,
>                                void *msgbuf,
>                                size_t msgbuf_size)
>  {
> -    uint32_t reg;
> +    uint32_t mbox_reg;
>      uint32_t msgaddr;
>
>      g_assert(qtest_mbox0_has_data(s));
> -    reg = qtest_mbox0_read_reg32(s, MBOX_REG_READ);
> -    g_assert_cmphex(FIELD_EX32(reg, MBOX_WRITE_REG, CHANNEL), ==, channel);
> -    msgaddr = FIELD_EX32(reg, MBOX_WRITE_REG, DATA) << 4;
> +    mbox_reg = qtest_mbox0_read_reg32(s, MBOX_REG_READ);
> +    g_assert_cmphex(FIELD_EX32(mbox_reg, MBOX_EXCHNG_REG, CHANNEL), ==, channel);
> +    msgaddr = FIELD_EX32(mbox_reg, MBOX_EXCHNG_REG, DATA) << 4;
>      qtest_memread(s, msgaddr, msgbuf, msgbuf_size);
>  }
>
> -void mbox0_read_message(uint8_t channel, void *msgbuf, size_t msgbuf_size) {
> -    qtest_mbox0_read_message(global_qtest, channel, msgbuf, msgbuf_size);
> -}
> -
>  void qtest_mbox1_write_message(QTestState *s, uint8_t channel, uint32_t msg_addr)
>  {
>      qtest_mbox1_write(s, channel, msg_addr >> 4);
>  }
> -
> -
> -void mbox1_write_message(uint8_t channel, uint32_t msg_addr)
> -{
> -    qtest_mbox1_write_message(global_qtest, channel, msg_addr);
> -}
> diff --git a/tests/qtest/bcm2838-mailbox.h b/tests/qtest/bcm2838-mailbox.h
> index 2b140a5d32..7e660e65a7 100644
> --- a/tests/qtest/bcm2838-mailbox.h
> +++ b/tests/qtest/bcm2838-mailbox.h
> @@ -77,7 +77,7 @@
>  #define TAG_SET_GPIO_STATE         0x00038041
>  #define TAG_INITIALIZE_VCHIQ       0x00048010
>
> -#define BOARD_REVISION    11546898
> +#define BOARD_REVISION    0xB03115

This doesn't look like it should be here ?

>  #define FIRMWARE_REVISION 346337
>  #define FIRMWARE_VARIANT  0x77777777 /* TODO: Find the real value */
>
> @@ -147,22 +147,6 @@
>  /* Used to test stubs that don't perform actual work */
>  #define DUMMY_VALUE 0x12345678
>
> -REG32(MBOX_WRITE_REG,          0)
> -FIELD(MBOX_WRITE_REG, CHANNEL, 0, 4)
> -FIELD(MBOX_WRITE_REG, DATA,    4, 28)
> -
> -REG32(MBOX_SIZE_STAT,          0)
> -FIELD(MBOX_SIZE_STAT, SIZE,    0, 30)
> -FIELD(MBOX_SIZE_STAT, SUCCESS, 30, 1)
> -
> -REG32(SET_DEVICE_POWER_STATE_CMD,        0)
> -FIELD(SET_DEVICE_POWER_STATE_CMD, EN,    0, 1)
> -FIELD(SET_DEVICE_POWER_STATE_CMD, WAIT,  1, 1)
> -
> -REG32(GET_CLOCK_STATE_CMD,        0)
> -FIELD(GET_CLOCK_STATE_CMD, EN,    0, 1)
> -FIELD(GET_CLOCK_STATE_CMD, NPRES, 1, 1)

We only just added these in the previous patch ?

> -
>  typedef struct {
>      uint32_t size;
>      uint32_t req_resp_code;

thanks
-- PMM
