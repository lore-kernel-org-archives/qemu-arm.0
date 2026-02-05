Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A77EEC1E92
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Feb 2026 10:09:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vnwI5-0008J3-0u; Thu, 05 Feb 2026 05:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnwI3-0008Hu-F3
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 05:08:47 -0500
Received: from mail-yw1-x1130.google.com ([2607:f8b0:4864:20::1130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vnwI1-00060F-5o
 for qemu-arm@nongnu.org; Thu, 05 Feb 2026 05:08:46 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-795232991adso1081567b3.3
 for <qemu-arm@nongnu.org>; Thu, 05 Feb 2026 02:08:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770286124; cv=none;
 d=google.com; s=arc-20240605;
 b=dAbYZ0QRqhebhiv2MP2hzECpKNEqA0AXzrVM1VnyvAJdhsrAuEL89YFDCw63DBY5kd
 YRBSFjt1G/HzUZYmsjzSfE2yFeoIvijnCrutMUavDBgOLm9MNY8UxjeMWKOMlD/5VgGF
 G9PJ2y1koVimvZe4mgA3QaRakuDpVoxXV/aj59AXeGvqhCb3/9HvtJr0n7doLK2/jRBB
 s3aZGE9AcEju1kr8qmnpV5SDxc7tcc1SZ8MFT3+NptnzS70hTHSX0caINF53umDkpVaY
 IbHFCe3CN+oazSAD10A2nTVZn/cb7kmIR6/ZIlPLDL3BsMg4636iVQFYY+iRt8hkrVqI
 cnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=zZGf57OTFyBpTKAezW0EbwiHzwWufY0vou1uc1E83/g=;
 fh=CEF01c6vWOrHeVeV0bLaagyH4IsKlMa5VGNaXVFYRTI=;
 b=QkBOkdQuBwJaZg0xbSpYF+86H4gnfIeZ02wQ5cD5NMLFhFHGBgr0+4dRHQhck/lOCV
 KO4OYRxgRhBKl41fZdEF3ovI4aNg9aWYO2Xw2Cgyjj9MiCbMVyGn+0De1z1oDdQOIXXM
 2ehIPFiiZME+v7zT1ClV3lgxXteWt38Bx7ed6QmTK6kRdw1Dt0xXmqQoRYiaHmOOtK56
 FNyGjaf9yw/Frf8Zg/qehMIY2RMbAlxsHrdXNFrUHjCFep+DAoNGojkL0rYdEZPrqXAS
 WQWBtwlUBmKaceDj8yf7Q9byzvJOQ8scmt7j81apCCYITlritLGAhWDCQAgjUv0PdPer
 OCFQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770286124; x=1770890924; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zZGf57OTFyBpTKAezW0EbwiHzwWufY0vou1uc1E83/g=;
 b=aCVKPAGNi4xS2Bsdhj1WGR6YWlS+LMz4cyptvuFcarvqx2lCNwl3uZNt2n97UJm8Js
 T/PFkaT3vy7cXu60MO7L364SB8AlY8dt0AW9VWTOg0Ey+wHH3VuP0LovfKnuDvtX3Qp1
 IAZtyfUr4+x9oM+eGZYaTYKsXYP4U7RP8NgF67OLJM8IIvYj267yxLaLDpRJ43lTVblf
 WTyXqhIXDnz5H5kugVTgNLYB8J7iPVIL40NsYySdaGIoiOMola2+5xtJqUTFQq0Qv+Be
 gOdGyBYdMy/VUKnAJ4KdiL162hrG+4ml75cPiQ2L7PepUCoNporgcMJjMQVbhY5Qn+4T
 lmmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770286124; x=1770890924;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zZGf57OTFyBpTKAezW0EbwiHzwWufY0vou1uc1E83/g=;
 b=n4584LBRBAO2A2DgdlJj5cGKrh/y+85Laztn5ftXdw+3LXy5M/Ta8PdN5fhblt8vxp
 lrjouc1t22w+3sk5qK318iXwAjBal+gfuQkzRJ/oMkcGzusvo+bJ7CSXsqWbmurVuAbH
 dbBET3YHPaNUVZrAnOg/NhL1RjvJJU2Zp71aY2V8sXjZGB9OmB8du6P/ZP4r1GRWgh8k
 JXNDwHxB+9KSaDZjFhGO5ZnsoF7oq3MFvLZu/gJZ3Ykb2J5cBCTZV7bydtpfEqkvlf4d
 OEQQ/a+9i6u93pWOSBjNPAtMe4HwloF5yZCtHlqzZPez3KuSdLuXkUg5cj9lLdWcrZ2U
 c3Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW58wayYRLx4YtGWsXZ6J+mcoiG2Z1KSfkk/e95YN7ryd4oFVXSyKfsEtjv5kzizWS+QzGVBXrNug==@nongnu.org
X-Gm-Message-State: AOJu0YzVlP25vrG+EE3MJXeUpNkPSLC1QAxRPje/Gl2JWjKr6QcG26Ue
 uAeqwg+EDAzd4tfJFB5hQ13KCdGKlduWoqr0kIPcuaReJm52A4Le8/IReVYHueJsNOTfSPAbHjl
 4OMl/JIJIyby0Tbhj/bW0bQkKOelsJZB3bxPkxumPtA==
X-Gm-Gg: AZuq6aJdzC5UZ6rBFsDyJKAu4KmZbMmaSoDxyujCrYMpAeCt2BbaEV5hNU2ppNket9G
 ZSFzohfPyxgeUTZKVX+DDcn+rae7a/QPNst7LzeNVNUxeTY1a3UBWcj6Ihfg24mte7p8QZhaGwg
 O6iWHOGDiBO8emlLO1nAX4hqp4o9WXxqL+KDYY7qbTMEVjxa9nvzKo+EapuczaMlUDnTsb7cdLx
 bKwj/961hRpk4JZEET8s9dhpOvVruSyeFRBIW8hmO0ye1RlQ4iFK7vLGtEvwqixDNt6HA==
X-Received: by 2002:a05:690c:305:b0:794:fcf8:f824 with SMTP id
 00721157ae682-794fe692adcmr57612817b3.28.1770286123732; Thu, 05 Feb 2026
 02:08:43 -0800 (PST)
MIME-Version: 1.0
References: <20251211102025.873506-1-me@linux.beauty>
In-Reply-To: <20251211102025.873506-1-me@linux.beauty>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Feb 2026 10:08:32 +0000
X-Gm-Features: AZwV_QiLlvkymMPBYxReoDKgqnks0cmtehoARLLhJfZ8g73tl9u9K64Boo4K3kI
Message-ID: <CAFEAcA8FcW22-TnyBKHmFUUsR=xk2u-74uPz6KisJTeG=YWxmQ@mail.gmail.com>
Subject: Re: [PATCH v6] acpi/virt: suppress UART device & SPCR when guest has
 no serial hardware
To: Li Chen <me@linux.beauty>
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Yanan Wang <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>, 
 Song Gao <gaosong@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Sunil V L <sunilvl@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alistair Francis <alistair.francis@wdc.com>, Weiwei Li <liwei1518@gmail.com>, 
 qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>, 
 qemu-riscv <qemu-riscv@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 11 Dec 2025 at 10:21, Li Chen <me@linux.beauty> wrote:
>
> From: Li Chen <chenl311@chinatelecom.cn>
>
> virt machines always instantiate a PL011/16550 UART at slot 0 and describ=
e
> it in ACPI (DSDT and optional SPCR table). When the command line disables
> the serial backend (e.g. "-serial none"), the guest still sees the UART a=
s
> a preferred console even though it is not usable.
>
> Teach the virt ACPI code to omit the UART device and SPCR when there is n=
o
> serial backend attached. This matches the hardware that the guest can
> actually use and avoids confusing firmware or OS code that relies on SPCR=
.
>
> The bios-tables-test qtests rely on an ACPI UART node and SPCR entry for
> UEFI-based virt machines. To keep those tests working we create a UART
> with a "null" chardev backend instead. This preserves the ACPI tables
> while discarding the firmware's serial output so it does not corrupt the
> TAP stdout stream.
>
> Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Signed-off-by: Li Chen <chenl311@chinatelecom.cn>
> Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

Sorry, I must have missed this patch previously. I'm not sure that
this is a good idea, because it means:
 * the dtb version of virt and the ACPI handling diverge
 * we tangle up "what chardev do you want to connect serial output to"
   and "what UARTs does the guest see"

If the user explicitly sends the first serial port output
to nowhere with "-serial none -serial stdio" they presumably
had a reason for that and won't be happy to find that we've
adjusted the ACPI tables to redirect that output to the
second serial port they were planning to use for something else.

thanks
-- PMM

