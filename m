Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E985ECD13DA
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 15:13:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIT4m-0004sp-GW; Thu, 30 Apr 2026 11:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIT4j-0004qz-SD
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:13:14 -0400
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIT4g-0003lD-DC
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:13:13 -0400
Received: by mail-yx1-xb12e.google.com with SMTP id
 956f58d0204a3-651d692e833so1051224d50.3
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 08:13:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777561989; cv=none;
 d=google.com; s=arc-20240605;
 b=h+iyUEQONlTc33sSEQ8ki7kvWGLt2N5KOLM8htNpU3HJGfPaJhlzOt0WPv8k7RePWp
 2eWxeDcabUV97SVi6AggXAHHXpcPZ9CpWeinobiF0pCvYuPjLdQzOZlRAOu8jvnHa85D
 Nr8JO9qasVX3ZGhVR+652C8jxn4HAAp5RZhV6R8PPDJHRj2/L4slqTWUlBiSTbp5+3gp
 O5/UpR2akbrnm3aMqChCx6ZUf8zRrQo4+X0MBxSrOSlJoXBEWiF1yLVixQiGNBbWxXjt
 xDyTm6pL6n2FqF76HNnRPKL9jYTe/OnHD6y4BYIq0sAZWNMuvqx65tiSx1HSk4NCSCqf
 dpBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=kRfmg2/lhe8tE7lO46l2bILxIDcNmnU0tR5MUeOwWAg=;
 fh=qzdUxgmEPJCw7xrB7IMTfx4iOclHIrLqk8AhhnlJNS0=;
 b=JtcEaeEwvhD1N1VhdPSHR1P5sDpbar4nDbTM4qsyM0ce43SZ8ne26xU3GIDEhF6s3T
 QwhyHp5fL1X87kcrVmFsap3rmzx1RiV03iyDKh17+r77zCuG7LX/7FOWnEJDxPNGmJmq
 J6DLtHZnybfOqf6nVNOmdDjlEDN5pvUF4k7Y2Aywm4L+nmBVb6UJS6zCBE5suaYagtjG
 kGzqwLkbOiNihgn35xxxNFuUwtZgRH1+/NX22DoSS5ISxisbprxbzY91URu+y1t0vSum
 eENr9DL2QYYEjGrzDV9830ZvJAaroRLp8YAY7OgLcuqAPevrwI3YoJn4Ob9526i02nTT
 6cWw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777561989; x=1778166789; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kRfmg2/lhe8tE7lO46l2bILxIDcNmnU0tR5MUeOwWAg=;
 b=T6EU5rNJEExEnhicpO6hdl0dQD72ByleSG9tgVFc7hIYO3GFWM/5vHGY6oX3luBgVK
 xKd5iK+pIF39/6bDgbXIkDmQ0VCUEwiPyeWduOnLCPsjL6k7k5pGMo11uxjVeOBEB4cV
 v51L9wqgosCWG0h5oWZdn3S1BGrC91jgkSr11u4XLio89M5ILVa4bi+9ct7N6ScD58b1
 Snstd/Vj+/3lZkAhqNPmcif/atOXxyYdLbm5cC8iSFK+uGvmxwchnoNRyzRRpawbWb7p
 cAh8LLg0M1YkSng8SRODYNCMyiRHhfpirm5FFZR/2SweGyK932FhY/PbthqcV7MMwsD7
 tFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777561989; x=1778166789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=kRfmg2/lhe8tE7lO46l2bILxIDcNmnU0tR5MUeOwWAg=;
 b=SQMrwKFQ3vtnTtzoCF26s60jlbFOW68ga3HEV6sXd7Dm04xMQlRcZ96DayhLutFyTX
 UahloN2krsrN8QrEINEYLT8UWvH7Jv8h35oqTOlbIng18+1EhMHF0ctuzWkQreL9O4KA
 p5IV/7EqvsBziZXYVxhZgp2n26Z3kCUV+oOLKZMHDJrjdv8kQNJBy6L5/ifcPMxP0+kP
 FAyofLzqdo/QRkInHNOnk4zlBNhcr7f+vXU4B3FhE/4UFeJhY4b3OUjJwIYFHC+xBvc2
 LjItgG+KZRkCEETV5CW+NufDqOu96OGBmYH1E/2Pgjh/r6k3TJmhqEIaV9sqnqNlMZhS
 MOtw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8fNum+r/6PpBepn4xiLOv2RZbHfWMOAvht+ysfNnDFtN/rWkiK/RcgqIFHvwwQO3UduFNu73FpIw==@nongnu.org
X-Gm-Message-State: AOJu0Yw0F2H+ywsKz3fJexsVDRK4LuMJenDAIxmMLFVVm3cEO24Txxxz
 5RP8iARBrv1lJqB9kSfGdZ+KPRXfCHaKeZTUNKcLOB5GePj+RATNn87fI52NOBCg2KBs38HgPHj
 ZwAJ7JiBmAfIv4zzgc53GKuYYUnsWlSdw0TCIiNtl3A==
X-Gm-Gg: AeBDievcYcjDlHPKrijpswYtiEmT1XuilHik99PAljdbU3GsG+LOVAvqyik7kwAOGiQ
 10qJOddnUpZXi1i0QJZOP40uCYLTyv/6o+RborEiSu728Z/xyazKLlc/w0v+FiMnRuDlWxJw6v4
 Qi8QNwTqcB9NqQVlUE5wioeR+STorDGjHQTonMQM6jjo7vyiT13NSLLzCKkTV9xrS5fLV6XwWEh
 xZ+lDBWNQZdntgzxb9RI/NDwKyDz/BdophpBUWJEnky4AW9TBPQTpSXcjCMBjfhlBroDU4vpndp
 JkScc+ocxIkKka1qJqpw1VcYbmugaPc3kECSJcLdYC9J0q7oCrfigutXbEQ+pgC3DNr9wiosORh
 7qg==
X-Received: by 2002:a53:d00a:0:b0:650:1aa5:8594 with SMTP id
 956f58d0204a3-65c18fda650mr2289939d50.49.1777561988902; Thu, 30 Apr 2026
 08:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-qom-tests-v1-0-c413f3605311@redhat.com>
 <20260427-qom-tests-v1-34-c413f3605311@redhat.com>
In-Reply-To: <20260427-qom-tests-v1-34-c413f3605311@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 16:12:56 +0100
X-Gm-Features: AVHnY4JeMnIGjW_otRFblPTUn3jQCgGaBWfqVHBDMQj5iHWMWPdDCK7cPH3MyWA
Message-ID: <CAFEAcA-tSqa7SQUE-f5yTq_P9eW6p_XrnNSnHZjw4g=Z2WncAQ@mail.gmail.com>
Subject: Re: [PATCH 34/41] hw/arm/virt: free flash devices and OEM strings on
 finalization
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12e.google.com
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

On Mon, 27 Apr 2026 at 20:45, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Flash devices created in instance_init via qdev_new() hold an extra
> reference that is only dropped on sysbus_realize_and_unref(). When the
> machine is destroyed before realization, the flash objects leak. Also,
> the oem_id and oem_table_id strings from g_strndup() are never freed.
>
> Fixes: 602b458201ff ("acpi: Permit OEM ID and OEM table ID fields to be c=
hanged")
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/arm/virt.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f62253e1aba..fac825ccd47 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -4032,6 +4032,19 @@ static void virt_instance_init(Object *obj)
>      cxl_machine_init(obj, &vms->cxl_devices_state);
>  }
>
> +static void virt_instance_finalize(Object *obj)
> +{
> +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> +
> +    for (int i =3D 0; i < ARRAY_SIZE(vms->flash); i++) {
> +        if (vms->flash[i] && !qdev_is_realized(DEVICE(vms->flash[i]))) {
> +            object_unref(OBJECT(vms->flash[i]));
> +        }

We currently use qdev_is_realized() almost nowhere in
the codebase. Isn't there some way to do this such that we
don't have to care about this because the object is
parented and gets auto-dereffed ? Having each object
have to care about the possibility of "inited but
not realized" devices in finalize seems like it's going
to result in a lot of bugs...

> +    }
> +    g_free(vms->oem_id);
> +    g_free(vms->oem_table_id);
> +}

thanks
-- PMM

