Received: by 10.25.21.156 with SMTP id 28csp1225599lfv;
        Mon, 25 Jul 2016 08:12:57 -0700 (PDT)
X-Received: by 10.55.158.18 with SMTP id h18mr22060850qke.161.1469459577636;
        Mon, 25 Jul 2016 08:12:57 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l127si18175901qkb.107.2016.07.25.08.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Jul 2016 08:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32908 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bRhYv-0004iu-2l
	for alex.bennee@linaro.org; Mon, 25 Jul 2016 11:12:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60578)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRhYr-0004iZ-T1
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:12:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRhYp-0002ex-Is
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:12:52 -0400
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:33682)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bRhYp-0002ec-1B
	for qemu-arm@nongnu.org; Mon, 25 Jul 2016 11:12:51 -0400
Received: by mail-vk0-x232.google.com with SMTP id x130so248110241vkc.0
	for <qemu-arm@nongnu.org>; Mon, 25 Jul 2016 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=au7+yZX5XQX7bOt6g4kArGfWkmo3TyfdW4tj63EF238=;
	b=HXIkj9eAgEFAOy5tZxpvjs7Z1V05H0LSgAyBqC1pPGwOBKHoR6SuFgWQfwIeH9WupZ
	LdSXvQvwjuZzkK5BGUPk7YWfUGeO5vhoOILVCdR5tAQ0ew03rk0xjSN4JxtzZiBJwu3S
	IgbWGJKle2Hz48zweXxKnJ7A2grHWHtSwzPw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=au7+yZX5XQX7bOt6g4kArGfWkmo3TyfdW4tj63EF238=;
	b=MgAXD+py+jf7g/ntGJzuE0RmktZrRm4WTpHh4VYPWFXa+aery9PmcaBpOve6F7elWk
	o+mwa4EpqkmYiYKwf/+TtIOvUj8Rdxa/VR9TH1Kh6SrJhzsuH+el1KMEErt5Pc8b5DDl
	9PSLAFCUNdECWqHo0UYQfYJRP9aSZDylbPGPzy8v3S3CBkp+4pIRaeesOItI/B4jPg8V
	qVFdg6CmGxdegbAh+irnmYvHTJEK8eYzPyG6brycSTeWUp8R8r2zy1xlh779mmz9qeWB
	w2ZmM+kJOTqjG1st+W0SxVgL6D9DojIqs+2vr+useMXtVdLPe9YV2Np8chXkOjgqrYHA
	kf+g==
X-Gm-Message-State: AEkoouvt1QcynPbXS3q5JysDZ/zxDdDUKw1WH1jaclTn9elXDQ+F4Fze6RFDnyZothxFD63p5eYLoK4ETEEHGIet
X-Received: by 10.31.188.203 with SMTP id m194mr8873166vkf.120.1469459570136; 
	Mon, 25 Jul 2016 08:12:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Mon, 25 Jul 2016 08:12:30 -0700 (PDT)
In-Reply-To: <1467994016-11678-6-git-send-email-clg@kaod.org>
References: <1467994016-11678-1-git-send-email-clg@kaod.org>
	<1467994016-11678-6-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jul 2016 16:12:30 +0100
Message-ID: <CAFEAcA_zfaVt1Yzs-o6fZr5rjg8+YNdfLGYAoAAYpoqW6XwaMA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Subject: Re: [Qemu-arm] [PATCH 5/5] ast2400: add a memory controller device
 model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wdDFAqMW7ztC

On 8 July 2016 at 17:06, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The uboot in the previous release of the SDK was using a hardcoded
> value for memory size. This is not true anymore, the value is now
> retrieved from the memory controller.
>
> Below is a model for this device, only supporting unlock and
> configuration. Without it, we endup running a guest with 64MB, which
> is a bit low nowdays. It uses a 'silicon-rev' property and ram_size to
> build a default value. Some bits should be linked to SCU strapping
> registers but it seems a bit complex to add for the current need.
>
> The model is ready for the AST2500 SOC.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---

Just a few nits below.

> +/*
> + * Configuration register Ox4 (for Aspeed AST2400 SOC)
> + *
> + * These are for the record and future use. ASPEED_SDMC_DRAM_SIZE is
> + * what we care about right now as it is checked by U-Boot to
> + * determine the RAM size.
> + */
> +
> +#define ASPEED_SDMC_AST2300_COMPAT      (1 << 10)
> +#define ASPEED_SDMC_SCRAMBLE_PATTERN    (1 << 9)
> +#define ASPEED_SDMC_DATA_SCRAMBLE       (1 << 8)
> +#define ASPEED_SDMC_ECC_ENABLE          (1 << 7)
> +#define ASPEED_SDMC_VGA_COMPAT          (1 << 6) /* readonly */
> +#define ASPEED_SDMC_DRAM_BANK           (1 << 5)
> +#define ASPEED_SDMC_DRAM_BURST          (1 << 4)
> +#define ASPEED_SDMC_VGA_APERTURE(x)     ((x & 0x3) << 2) /* readonly */
> +#define     ASPEED_SDMC_VGA_8MB             0x0
> +#define     ASPEED_SDMC_VGA_16MB            0x1
> +#define     ASPEED_SDMC_VGA_32MB            0x2
> +#define     ASPEED_SDMC_VGA_64MB            0x3
> +#define ASPEED_SDMC_DRAM_SIZE(x)        (x & 0x3)
> +#define     ASPEED_SDMC_DRAM_64MB           0x0
> +#define     ASPEED_SDMC_DRAM_128MB          0x1
> +#define     ASPEED_SDMC_DRAM_256MB          0x2
> +#define     ASPEED_SDMC_DRAM_512MB          0x3
> +
> +/*
> + * Configuration register Ox4 (for Aspeed AST2500 SOC and higher)
> + *
> + * Incompatibilities are annoted in the list. ASPEED_SDMC_HW_VERSION

"noted" or "annotated".

> + * should be set to 1 for the AST2500 SOC.
> + */
> +#define ASPEED_SDMC_HW_VERSION(x)       ((x & 0xf) << 28) /* readonly */
> +#define ASPEED_SDMC_SW_VERSION          ((x & 0xff) << 20)
> +#define ASPEED_SDMC_CACHE_INITIAL_DONE  (1 << 19) /* readonly */
> +#define ASPEED_SDMC_CACHE_DDR4_CONF     (1 << 13)
> +#define ASPEED_SDMC_CACHE_INITIAL       (1 << 12)
> +#define ASPEED_SDMC_CACHE_RANGE_CTRL    (1 << 11)
> +#define ASPEED_SDMC_CACHE_ENABLE        (1 << 10) /* differs from AST240=
0 */
> +#define ASPEED_SDMC_DRAM_TYPE           (1 << 4)  /* differs from AST240=
0 */
> +
> +/* DRAM size definitions differs */
> +#define     ASPEED_SDMC_AST2500_128MB       0x0
> +#define     ASPEED_SDMC_AST2500_256MB       0x1
> +#define     ASPEED_SDMC_AST2500_512MB       0x2
> +#define     ASPEED_SDMC_AST2500_1024MB      0x3
> +

> +    if (addr =3D=3D R_CONF) {
> +        /* Make sure readonly bits are kept */
> +        switch (s->silicon_rev) {
> +        case AST2400_A0_SILICON_REV:
> +            data &=3D 0x000007B3;
> +            break;
> +        case AST2500_A0_SILICON_REV:
> +            data &=3D 0x0FF03FB3;
> +            break;

Maybe these would be more readable using the symbolic constant
names you #defined above? (Or maybe not; your choice.)

> +        default:
> +            g_assert_not_reached();
> +        }
> +    }
> +
> +    s->regs[addr] =3D data;
> +}
> +
> +static const MemoryRegionOps aspeed_sdmc_ops =3D {
> +    .read =3D aspeed_sdmc_read,
> +    .write =3D aspeed_sdmc_write,
> +    .endianness =3D DEVICE_LITTLE_ENDIAN,
> +    .valid.min_access_size =3D 4,
> +    .valid.max_access_size =3D 4,
> +    .valid.unaligned =3D false,

.valid.unaligned =3D false is the default, you don't need to
specify it explicitly.

> +};
> +
> +static int ast2400_rambits(void)
> +{
> +    switch (ram_size >> 20) {
> +    case   64: return ASPEED_SDMC_DRAM_64MB;
> +    case  128: return ASPEED_SDMC_DRAM_128MB;
> +    case  256: return ASPEED_SDMC_DRAM_256MB;
> +    case  512: return ASPEED_SDMC_DRAM_512MB;

These should have newlines between the case line and the code.

> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid RAM size: 0x%"
> +                      HWADDR_PRIx "\n", __func__, ram_size);
> +        break;
> +    }
> +
> +    /* set a minimum default */
> +    return ASPEED_SDMC_DRAM_64MB;
> +}
> +
> +static int ast2500_rambits(void)
> +{
> +    switch (ram_size >> 20) {
> +    case  128: return ASPEED_SDMC_AST2500_128MB;
> +    case  256: return ASPEED_SDMC_AST2500_256MB;
> +    case  512: return ASPEED_SDMC_AST2500_512MB;
> +    case 1024: return ASPEED_SDMC_AST2500_1024MB;

Ditto.

> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "%s: Invalid RAM size: 0x%"
> +                      HWADDR_PRIx "\n", __func__, ram_size);
> +        break;
> +    }
> +
> +    /* set a minimum default */
> +    return ASPEED_SDMC_AST2500_128MB;
> +}
> +
> +static void aspeed_sdmc_reset(DeviceState *dev)
> +{
> +    AspeedSDMCState *s =3D ASPEED_SDMC(dev);
> +
> +    memset(s->regs, 0, sizeof(s->regs));
> +
> +    /* Set ram size bit and defaults values */
> +    switch (s->silicon_rev) {
> +    case AST2400_A0_SILICON_REV:
> +        s->regs[R_CONF] |=3D
> +            ASPEED_SDMC_VGA_COMPAT |
> +            ASPEED_SDMC_DRAM_SIZE(ast2400_rambits());
> +        break;
> +
> +    case AST2500_A0_SILICON_REV:
> +        s->regs[R_CONF] |=3D
> +            ASPEED_SDMC_HW_VERSION(1) |
> +            ASPEED_SDMC_VGA_APERTURE(ASPEED_SDMC_VGA_64MB) |
> +            ASPEED_SDMC_DRAM_SIZE(ast2500_rambits());

Missing "break;".

> +    default:
> +        g_assert_not_reached();
> +    }
> +}

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
