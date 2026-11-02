Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 809DD606A324
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=saFwULBy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNpPw-0005lq-J2; Mon, 02 Nov 2026 05:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNpPv-0005lQ-Kk
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:37:31 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNpPr-0007fn-S4
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:37:30 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-8aea7b7ca0cso23529917b3.2
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793615846; cv=none;
 d=google.com; s=arc-20260327;
 b=GK2Z2ji6vmigH+1GHwQVgter3QcvOD8Xb9WZqSpK4lmF555j30nAAX5q0w9CWaBlLv
 r1bR1mJiQoxL63ahD8MxXfppAV1EH+no/hqBaasaaQfjA5oUM5Lxf0DU43USQZWXGAuh
 XvhAjSmENi9il1rpRnqtlNh/iDTuhDYvFIm5FOkKUctnmUv4lw+XFLmt5/rFSS3iFzxN
 JeX4YbI+FezzmR119WE9eL0LlPujw6A9slUvnD4PaVtaffcfys8Q9Zxy+QK07HNBO5Up
 rDMyUFdlKBMXLAw36+xpcxtXsj5OEORVoDD8TQ2mpfJTsAWgd2JQdpHKE5phewocb4FK
 L6WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=r9pyvIRnD3vmYnXZpLcZCfOXmqy5lBFgrsoMC4kxlr4=;
 fh=CARtNcdOpLuLSdwUh2VRVrXHo6ZN8z2DgBHo2dd6Upw=;
 b=EMQGJMeJpWDnq6L+ikPhQ7vZutLQ9R/HFJ7DbVsTLF5b+F9q85aKqUHOxBJE3zMfzH
 72/RFT3DUxrrc5egi8UDcx6hmPpBtvggN/Hiyu4w3LxZ5EWVUHfiEQxgRFeBMzs9FKzV
 Cni9c6WVBJbaJW1+8AoxnypiTSNv5hIcPxl1SDquHVnTkA+ZgwlY52Hf64fWLE2aRzmD
 v632kbipsou0iztiOMs1Rd0DT7djBg+Q32LrJwW655siPH+NlNL708r8VUnhjsUiB4Kf
 A1W6O0ADjTGCDL5yAVpSDPwrPKnOOsFnWj482c7jDUzwGKCYfS8yP5/W+OQ4pIh8/R8w
 cpQA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793615846; x=1794220646; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=r9pyvIRnD3vmYnXZpLcZCfOXmqy5lBFgrsoMC4kxlr4=;
 b=saFwULBySCtX2D0sep2RST8rtLCGGnkK8x9GF+uzWKZ+8isR4th8M14iN6Lq232Fab
 lg6Z9PUpA+XeY3fpoh6ZWbCYLLmeZSfiL5jixHU0ExhvIthLKiaIwtTXl1Ks4CR8EViw
 EY7UInXQIpNjtdTuzLTytfknC65F5dbeRhAZ37tA6OQ2K4nd1rmTY3N/ffa+WoFccqPs
 PO88LEbmcxjkNqYt5R5EWjJY6p9omgkkUmDwW/bbZOz8i/IBOGwLnurw5AIK/N/wnnNS
 M2iorbjr8UNCfhpze/fJxra8jW+zaJGdUy3T2incJLJuYkVCj9sQMSRMUeHJcMzSDwxb
 zrXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793615846; x=1794220646;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=r9pyvIRnD3vmYnXZpLcZCfOXmqy5lBFgrsoMC4kxlr4=;
 b=WQqrE3TiWfShL5xq3wTky60zQlvUgM5OLae35WH7yrtYeW3eFNQSgia41qBi2Ygc0D
 lWxCriutK1AzbBG0N2iaPwWftJCXkYFWgNH1tSao+7LejDUEYtDE/CdGYtzsYwwgnsZw
 FeTvd6L8xuiw14XhCnl3qw4Pm/9mx96WR1CRLrc+xL48Fc8xUTx/fSrBZ2T9mBsGw77G
 CsnBHJOExCPab02cPY8aCobJzYo1p7fh2fVpZkxwL4MHqbuSlZxx3PZGdp/UIu0ZUxVF
 Kqreqp6Lq9DaNPo/sw1PBmi9964yrRyOktdxQ1VFp0LFg+H7+GXM2SI7ZrXlCw7/w6Um
 ukDQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxyTEgT8D8enmbEMpDFkKT8/z/qzYOrXCp7gn/gO7ClXTJOR2+r01wn0GkHXCkTiyzWES8Od4VFiw==@nongnu.org
X-Gm-Message-State: APuU4Z+p/hafm+G1HToL91yI8+8p6wKafaG+brqyvo8ZFjN3VaX2Mcpa
 XU0/rC4hqRjaFyqZGuo8GgT7BTh5ylh4A9TT2nQEn5I/iaO83VCzjypdqadARtUPay9omnv4ean
 ucBDDDuIVa49MQccn4g8SBAYad0Fx4ikWyp/KLtaTZA==
X-Gm-Gg: AYBFou0iR5ZA4Mhk4po3Ax7x2doL7AO7mUcgKVoEFFxcXKX7aHNWP9k04MZrLUom1hP
 /zFENJrAYVktx0WRtFl5b7OWkXQupB1y21PVcHNjahEcmqsz6/hF/0AISVlK8IRqO6wgELu2Ivq
 9DwkXvQZxuHyOwGgzX3FfABeBcz+0NiURuDag0wTo5niLZgWkhf4jlO+4Xz8pBfXhspX6+wxL12
 FG6aum00ZPy4EdcmaC52FOyCNInqU8H93Cn86cBxn6ol3aa28BexYakqSxUlxd4rouONSfIyJnF
 6pkqookQOyjcmDUYZh4IZ/XiRYZmgEz8l6bSlNx/n7/+jKErvV1UUVRCnW6b6WjYKj1Rll4Rcx/
 D7ybOKZYoFLksS9sLc/ZoMPaLrYtnnXMRPEf0JfuYEEwbKZyd8E31a0SyBtSIufjT1gtGR3s4ro
 oy6xC93ZYHdmyGb+6/a8Fd
X-Received: by 2002:a05:690c:102:b0:8b1:813e:91b0 with SMTP id
 00721157ae682-8b2b65b8d51mr59408477b3.9.1793615846051; Mon, 02 Nov 2026
 02:37:26 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1793613972.bcm2835-fixes-v1.git.lorandmarton.dev@gmail.com>
 <9772fc00645a13988570f4107bf2eec7f5bbe2b7.1793613972.git.lorandmarton.dev@gmail.com>
In-Reply-To: <9772fc00645a13988570f4107bf2eec7f5bbe2b7.1793613972.git.lorandmarton.dev@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2026 10:37:14 +0000
X-Gm-Features: AclHuK8mZLfuhdBR07Z57F3KMBKZ98ksUfQclceLnehyrLJSu-OLaN5uUxlt-fk
Message-ID: <CAFEAcA8nvMRdEbecDq6buH5PxRuGwh2Um-CSdMZutKNsHW394g@mail.gmail.com>
Subject: Re: [PATCH 3/5] hw/ssi/bcm2835_spi: lower the interrupt on reset
To: Lorand Marton <lorandmarton.dev@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@oss.qualcomm.com, qemu-arm@nongnu.org, 
 farosas@suse.de, lvivier@redhat.com, pbonzini@redhat.com, 
 alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 2 Nov 2026 at 10:21, Lorand Marton <lorandmarton.dev@gmail.com> wrote:
>
> bcm2835_spi_reset() cleared CS, so neither DONE nor RXR is set
> afterwards, but left the interrupt line as it was: a reset in the
> middle of an interrupt-driven transfer (a guest reboot while
> spi-bcm2835 waits for DONE) kept the line raised into the next boot.
> Update the interrupt from the new register values.
>
> Test that a reset during a transfer with INTD set drops the line.
>
> Fixes: 28004fb74134 ("hw/ssi: Implement BCM2835 SPI Controller")
> Signed-off-by: Lorand Marton <lorandmarton.dev@gmail.com>
> ---
>  hw/ssi/bcm2835_spi.c           |  2 ++
>  tests/qtest/bcm2835-spi-test.c | 42 ++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build        |  3 ++-
>  3 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 tests/qtest/bcm2835-spi-test.c
>
> diff --git a/hw/ssi/bcm2835_spi.c b/hw/ssi/bcm2835_spi.c
> index 01763c458c..4ab47787a4 100644
> --- a/hw/ssi/bcm2835_spi.c
> +++ b/hw/ssi/bcm2835_spi.c
> @@ -246,6 +246,8 @@ static void bcm2835_spi_reset(DeviceState *dev)
>      s->dlen = 0;
>      s->ltoh = 0x1;
>      s->dc = 0x30201020;
> +
> +    bcm2835_spi_update_int(s);
>  }

No, device reset methods should not call qemu_set_irq on their
outbound IRQ lines. The qemu_irq itself has no state, so on
reset the expectation is that this device resets its internal
state, and the device it's connecting to will also reset its
internal state (which will be to the "signal is not asserted"
state)". Calling qemu_set_irq() from reset runs into problems
with ordering of reset between different devices.

> +/* A reset in the middle of a transfer drops the interrupt */
> +static void test_reset_irq(void)
> +{
> +    QTestState *qts = qtest_init("-M raspi3b");
> +
> +    qtest_irq_intercept_out_named(qts, "/machine/soc/peripherals/bcm2835-spi0",
> +                                  "sysbus-irq");
> +    qtest_writel(qts, SPI0_BASE + SPI_CS, CS_CLEAR_RXTX | CS_TA);
> +    qtest_writel(qts, SPI0_BASE + SPI_FIFO, 0xa5);
> +    qtest_writel(qts, SPI0_BASE + SPI_CS, CS_TA | CS_INTD);
> +    g_assert_true(qtest_get_irq(qts, 0));
> +
> +    qtest_system_reset(qts);
> +    g_assert_false(qtest_get_irq(qts, 0));

This test is really running into the fact that qtest's
irq state for intercepted IRQs is not cleaned up on
reset; so you get a bogus answer if you call qtest_get_irq()
after qtest_system_reset().

-- PMM

