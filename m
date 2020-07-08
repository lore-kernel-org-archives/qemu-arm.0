Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp603714lfm;
        Wed, 8 Jul 2020 10:04:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCa3Sfb9jEwnDgTbG6LhMgI20d1MrxvmGIUyzVxQY7Ylx4pqF8Q1LJwGm6UDZMc93K0KwT
X-Received: by 2002:aed:252c:: with SMTP id v41mr31635480qtc.234.1594227888761;
        Wed, 08 Jul 2020 10:04:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594227888; cv=none;
        d=google.com; s=arc-20160816;
        b=bguLk1eF9cJ+aREeWsoUGp4eno3NKfqEJrctqvzegNodxaTBPSaE6zWxDJIWzgVB4I
         G4PqB9ODDit1cYgFQLbi4CfMVPr5gkaRXF7frncicmohsKhk8vosydNVaCCom9WpMOHq
         uG3U8HiMq23oo8Ky22uTqNV16gblnG6GOeCsRCqPARWnJZU6rUV3RaDvrl/LYB1e3+ES
         +gPPgA1q9WFBYF3VmKMyMtsGELG/RxJF+kQLMqijhxgJQWEO40xZtlQU0JE60mRvU18u
         00GNUOpB6wh15uKQ/UEicWQQuXgzinIFjfdtjNV7DJfQTkNYw46v/YVgsyzKJab8eYgt
         2v1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=LZvm645YUPRqCMI/6A0GeNSLeLiO3QA47ljKgfkhAYM=;
        b=s3mYj7Xt/vR3wAwhp8FT2KtQyR9dl9fMJnMxRoroYhXOl0febrRzSmy2288f/o6ysI
         EuPZZ3hcgOJQobEZfjPM5OzQaYaj2KhBLfQkYv8ru9Dedm8Kabvh1FW14DAvvgnlYEem
         V418rfpvvZYIL+2tGiNx//345rzxdlY3X6gAsSobDkipDyhNxa3x8rB7db1rucnZomNz
         S8mOL+E588hMLjUyKdWEtL1WcsUARqG9Kg77FYJscEHyX0jcHPmkSELIb8/hB97EPiXf
         LeYeDqfCHUMAk4LpuYOLXaPgtjVup6dQLYdLyueW88vCc73uyMFWhi2hZ6f2PbL04I9N
         m0Kg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=moiHIs1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q15si332859qvo.103.2020.07.08.10.04.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Jul 2020 10:04:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=moiHIs1L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:50144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtDV2-0006nP-2T
	for alex.bennee@linaro.org; Wed, 08 Jul 2020 13:04:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jtDUr-0006lt-4g
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 13:04:37 -0400
Received: from mail-vs1-xe43.google.com ([2607:f8b0:4864:20::e43]:42277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jtDUp-0002WB-14
 for qemu-arm@nongnu.org; Wed, 08 Jul 2020 13:04:36 -0400
Received: by mail-vs1-xe43.google.com with SMTP id q15so14124992vso.9
 for <qemu-arm@nongnu.org>; Wed, 08 Jul 2020 10:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=LZvm645YUPRqCMI/6A0GeNSLeLiO3QA47ljKgfkhAYM=;
 b=moiHIs1LQS/dFXJamRIz8QO0mxOQEu9S8EqNKWg3geEhz5jqJD7NXJ43FR14X7zcRq
 H6SPSnfuuB5AiJKEMQrC+Z1h01INtd8OBtQkKgOws+ZBJRPjZnyMjem0IytXrQNDLqMC
 e/yNlDWTT0ZLFix0KtTLKM3KsuRWwIVAANlOeztkSc63l3rNTCAJcsTpS/Te5oxvHzUl
 Z11a1T4rohIzQbD1Cnjb+9ZB/x6Y0QQsxgKG1GfF3P3J1jQeojWb3hSIh5bx5c33zskN
 +fYUdxuyuAqofGkDeLX+LW/1lr180GEJR7h9G65fKx3h2a409A4hK+HqwX1nh3PYyalI
 0M3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LZvm645YUPRqCMI/6A0GeNSLeLiO3QA47ljKgfkhAYM=;
 b=mLxMC1mvyNj+etS9wVVwHj1j85tZmarH4bodquifxY89jS386AN9BNT9b7SSvQymFq
 OhabJ15eK3vlQOXoezf9/JZvD8uIq3HEW0U3HOuPlTEJ9qfXNlsqdTg1YLBG3rXEmiMQ
 0MuL/FBhC4dBlKUUGZtye4W1KSKI6QStHzGl3Y8gb59jP5P8pGmNTayF96JIooZfoJvS
 rV6pqLiuPUXOIY7MDE1CPNyyRt78Durxwtzzh+lYb8afSSwj2lywk02S/i/YAK4GTg+W
 RV9WRf9uatS0lm04OmnbsXLeKsI/BdRvqmetMbnzozGjy8dbAqCH/64jj9C1AKqle2vW
 JANg==
X-Gm-Message-State: AOAM533YPdxRrzL1Z4uiDOO9/WiQ3vUB1wYkVl+my8ZEz1Py7e9XWtRp
 wwFa1WOm3JynUzcqyU/R5xufdQ0CoxtWuIp/IOJ2ZQ==
X-Received: by 2002:a67:7f8e:: with SMTP id
 a136mr38634537vsd.232.1594227873588; 
 Wed, 08 Jul 2020 10:04:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200707184730.3047754-1-hskinnemoen@google.com>
 <20200707184730.3047754-9-hskinnemoen@google.com>
 <f303f648-91a3-b59b-390f-8f25ec7b4ff1@amsat.org>
In-Reply-To: <f303f648-91a3-b59b-390f-8f25ec7b4ff1@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 8 Jul 2020 10:04:22 -0700
Message-ID: <CAFQmdRZEgYnh-s47Pkx1w-A3n1ddv6LaVKsmk=uj6yMH6co+iw@mail.gmail.com>
Subject: Re: [PATCH v4 08/12] hw/nvram: NPCM7xx OTP device model
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::e43;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe43.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iaR04YNkQ44g

On Wed, Jul 8, 2020 at 1:54 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
> wrote:
>
> On 7/7/20 8:47 PM, Havard Skinnemoen wrote:
> > +    value =3D tswap32(nc->disabled_modules);
> > +    npcm7xx_otp_array_write(&s->fuse_array, &value, 64, sizeof(value))=
;
>
> What is magic offset 64 for?

Good point. I'll add some definitions based on

https://github.com/Nuvoton-Israel/bootblock/blob/master/Src/fuse_wrapper/fu=
se_wrapper.h#L23

> > +        /* Preserve read-only and write-one-to-clear bits */
> > +        value =3D
> > +            (value & ~FST_RO_MASK) | (s->regs[NPCM7XX_OTP_FST] & FST_R=
O_MASK);
>
> Trivial to review as:
>
>            value &=3D ~FST_RO_MASK;
>            value |=3D s->regs[NPCM7XX_OTP_FST] & FST_RO_MASK;

You're right, will do.

> > +/* Each OTP module holds 8192 bits of one-time programmable storage */
> > +#define NPCM7XX_OTP_ARRAY_BITS (8192)
> > +#define NPCM7XX_OTP_ARRAY_BYTES (NPCM7XX_OTP_ARRAY_BITS / 8)
>
> You could replace 8 by BITS_PER_BYTE.

Will do.

> > +typedef struct NPCM7xxOTPClass {
> > +    SysBusDeviceClass parent;
> > +
> > +    const MemoryRegionOps *mmio_ops;
> > +} NPCM7xxOTPClass;
> > +
> > +#define NPCM7XX_OTP_CLASS(klass) \
> > +    OBJECT_CLASS_CHECK(NPCM7xxOTPClass, (klass), TYPE_NPCM7XX_OTP)
> > +#define NPCM7XX_OTP_GET_CLASS(obj) \
> > +    OBJECT_GET_CLASS(NPCM7xxOTPClass, (obj), TYPE_NPCM7XX_OTP)
>
> If nothing outside of the model implementation requires accessing
> the class fields (which is certainly the case here, no code out of
> npcm7xx_otp.c should access mmio_ops directly), then I recommend
> to keep the class definitions local to the single source file where
> it is used. This also makes this header simpler to look at.

Good idea. Will do.

> Very high code quality, so I just made nitpicking comments.
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Thank you. I'll incorporate your feedback and send out a v5 series shortly.

Havard
