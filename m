Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3505806lfo;
        Mon, 1 Feb 2021 07:30:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh7N4OdXnixawA0Tf9/adBKfSMeVFjtfMtWKakWI+K+929v/A5UgtnUjZQFlmO0DDEv+PO
X-Received: by 2002:a25:c684:: with SMTP id k126mr21553787ybf.429.1612193408438;
        Mon, 01 Feb 2021 07:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612193408; cv=none;
        d=google.com; s=arc-20160816;
        b=yNugBmGMA7hsX8yOmLpmfMz3I5d6xlMeH/KD/+QB45Et9wE+ScLFN7vphX78NrJRPY
         GvOkXLKojs6I0CNpye+ogUEiJXRSWfjq3L7q96xJWz4igOMAigrPn/OFSDMtVhhcEHwt
         aqgZxqVbSmqSbAT9bURuKxn85cfWvm7R/WRzAvzRtGZIL2excAVL1wglJn7YycmytBEh
         RAycFo6fwJrGFkvVeuTNqt1kCn6N/8fmitXR9mNYcFU7ym15qM89WcTL0/5sLTgqdMq0
         Xyg4WuHS4WOoy3fI4TtN9CM1V/oHEcJ+vS1QRkOQXRlnDdl8REHyYea4ZjsxzEJwfVkD
         vjpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=GmdPeZb/oJT4aN44C5E62k5JoooyjcliKf9JKqs8+hM=;
        b=i3uTu6Yr0+yBR6r6HiBEQmguu6hUmxJUBC2d6Yw+suwVwJgIw5bmAxVkayavhjwdIl
         qlap9XOo4VItDoUJW3hz/Ac8KVI9Nwi2yplpsX/k7mkKz+rj3tRJoBXPbxwlRKHaaBga
         qJHWmNLs+XwMrh8uBiyzoFPMYqxH1H6Z+jN9xBbmXJkosIwe5ximzPFmDlRrYLMY4H02
         IH9Hf37RwH55oNZMszndn8Q1Y3burueA44Dk8jtiTS2BP0Qn3ufbu8D+rrwI6LrLth4n
         O/8AGAwo7NqrenVV+lqSJBAiul/dvo/b8ezIMpQRdvY6PdfZKMAGK/SFSXIFB5zYVP3o
         raKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LoyPCsGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si6342942ybh.135.2021.02.01.07.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Feb 2021 07:30:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=LoyPCsGT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l6b9T-0007Uj-QL
	for alex.bennee@linaro.org; Mon, 01 Feb 2021 10:30:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6b99-0007Sn-Mr; Mon, 01 Feb 2021 10:29:48 -0500
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:35338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alistair23@gmail.com>)
 id 1l6b97-0007P3-53; Mon, 01 Feb 2021 10:29:47 -0500
Received: by mail-il1-x135.google.com with SMTP id g7so14851606iln.2;
 Mon, 01 Feb 2021 07:29:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GmdPeZb/oJT4aN44C5E62k5JoooyjcliKf9JKqs8+hM=;
 b=LoyPCsGTZJySEFcbIaxqOjnX8/Fqw0wdudMpr1ZYtUTePYWoghxLxrypHUNnXE9xgT
 8d7sUw6/VlkXoSXCp8l34cZ/PcXyf9ASGRfsaSGJgNaSv/W4AIUJoekZ339rPy3ddFWj
 /Wdt9SEznSFgBwE4gQ9wiYPhgaOkfFFag+g9oWkl7QUkBibFnR9E3azlCwAAeszK2iVi
 znz5L5cCHWrk+NjKL4CKiB3FTUUGJxqmnEHbFBKyxeVs/M0AvtLj3/cIu3jcC+6N92wq
 dkljVfMTe1wg52b10vUQCcZ5eDS/TYQwavWE+ivdEpnfA8obaur3djALtK1BfaMz9xvF
 fnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GmdPeZb/oJT4aN44C5E62k5JoooyjcliKf9JKqs8+hM=;
 b=EbrY6eumx6cHGujXxI4bQqAMOWm8pQyKiGNLz9GX/JY0cF93NBgF6yzAnqdnK2FHHN
 7fiC4yq+SMXYIGVOJWNQHeMGsXi5wrRHyw45NfMUZQS0PfEtV7DIwentjqp0WEFn4CSB
 jqOfsHIYir0edCr3rn0MWc84oVFgwcidmYwRBVMe/FN9DVVtpDzwAy8YGERnpnxwMAoi
 gvUUBCqNoxK9eJzCAOlbYsUnaKKa7iFYo6Nm51TZhQUOs1cEhzs6sGIhNJJ1DOS+zvME
 zNzolTvmmopKWYQxDrCbYDwuz2Ct4f/vCvZsiAh7y4mr7gzGCP4M3ixya65uHo3xUcra
 +IRw==
X-Gm-Message-State: AOAM53119RrSVdCJq+S9Z/w0irCwh/OdaMcSQ1xiSq+BoSLDAdfIWRE+
 AkRpHqlFycmrpwbYwjUevryBNYfoT6wLU4H40Uk=
X-Received: by 2002:a92:4b06:: with SMTP id m6mr14280388ilg.177.1612193383077; 
 Mon, 01 Feb 2021 07:29:43 -0800 (PST)
MIME-Version: 1.0
References: <20210131105918.228787-1-f4bug@amsat.org>
 <20210131105918.228787-5-f4bug@amsat.org>
In-Reply-To: <20210131105918.228787-5-f4bug@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 1 Feb 2021 07:29:16 -0800
Message-ID: <CAKmqyKMDTs11Sm=Ho63SQEi_0XucQE0UfHB5V8fKidEem=LMHw@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] hw/arm/virt: Do not include 64-bit CPUs in 32-bit
 build
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=alistair23@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zRts1bw+JQGE

On Sun, Jan 31, 2021 at 3:09 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Similarly to commit 210f47840dd, remove 64-bit CPUs (which have
> never been available on 32-bit build, see commit d14d42f19bf),
> to fix:
>
>   $ make check-qtest-arm
>   ...
>   Running test qtest-arm/device-introspect-test
>   missing object type 'cortex-a53-arm-cpu'
>   Broken pipe
>   ../tests/qtest/libqtest.c:181: kill_qemu() detected QEMU death from sig=
nal 6 (Aborted) (core dumped)
>   ERROR qtest-arm/device-introspect-test - too few tests run (expected 6,=
 got 5)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/virt.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 399da734548..f0e9d7dd7d8 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -199,9 +199,11 @@ static const int a15irqmap[] =3D {
>  static const char *valid_cpus[] =3D {
>      ARM_CPU_TYPE_NAME("cortex-a7"),
>      ARM_CPU_TYPE_NAME("cortex-a15"),
> +#ifdef TARGET_AARCH64
>      ARM_CPU_TYPE_NAME("cortex-a53"),
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +#endif /* TARGET_AARCH64 */
>      ARM_CPU_TYPE_NAME("host"),
>      ARM_CPU_TYPE_NAME("max"),
>  };
> --
> 2.26.2
>
>
