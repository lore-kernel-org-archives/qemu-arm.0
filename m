Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297BFCD13DA
	for <qemu-arm@archiver.kernel.org>; Thu, 30 Apr 2026 15:31:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wITMN-0002fy-3U; Thu, 30 Apr 2026 11:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wITLm-0002dU-7s
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:30:50 -0400
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wITLi-00085a-9V
 for qemu-arm@nongnu.org; Thu, 30 Apr 2026 11:30:48 -0400
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-65c0bda7f15so1051611d50.0
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2026 08:30:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777563045; cv=none;
 d=google.com; s=arc-20240605;
 b=incXknNn13jFcxaI581geDssHg0Xf5t5hN4ZHijUxI+MHe2o18rI1ifeY5UEI+XuHG
 Q5qvXxwglsmiw2sZc+ku7CtL0pdDhVdlP96L9P+dksPXOjx8o8tkyAV3yMZkaJ1D6mNG
 IWLl1Jn8ThAvK+6/6/hRYsWiP0EtTdUsRHymnomDwhXe7ahA/7XGsKHBstqWH0aHkMlG
 +x7VVZlwlf8qKx2sKolQNFHz0x/oBS/kemSnBwHLTFUjfdHVdzKdxLa5c7sqUP6ajOCk
 PiTpCgiGfuaHK2RwWgIDtJEHuuLZX+dmsN3CRoWN0fsfevjyIQAUg1sfgPFoLd1aipv/
 a79g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=dFYUmsxpYxNeVnEWvGfeRKeiHiWjjJcXujbHi4Nouvo=;
 fh=gHTSqhni7cLSn5r1tt5NLi6+Sq0QcFxMsNIKAlyWNOk=;
 b=hQCCIuF78vAtntOI/3EenjuckR85oU938WQKIyIG9QOsZmqn7qlsp+1uatTfTqlSIV
 ZFOetalddiXzVszPuypPouKhdYDU9pgcKDS3CIx0ZobcLCfebQuZAgznHzaIwURP+Fve
 5dxMFpVNWseOie15bFRoFLMaUDZ8Bg76DTDPMAtntkNwMaLAC3Wvwee+Ijvd2umytN1X
 HJlDCA7I5nH15TVtvz3JMCLL7CU/38mWnhNoJ6M45jxwcxjzkP3G0E4zA4Pvsq3TGH5m
 th56WO/mDTBojj2r/ePuI6gebZaQivHRO2nWnj+YbivvE0kPjRiO+TjanwtbYslYdxZU
 29Lw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777563045; x=1778167845; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFYUmsxpYxNeVnEWvGfeRKeiHiWjjJcXujbHi4Nouvo=;
 b=SrIqihMZ6Ch0SSNDhq/qb1vJ14XBF0XRg7lyITDMKzAK9Wv4LB2LTmGU5aLz2xILUM
 oMdcOTVaH5Ab7MDiRat8Ln/20KxWzzFF82e14XSAxQar2PP4MmCMheVO/HXrJObDZ8N4
 TdG3IHNZ0ltYEzxSPgkcO46tS8zmekpBAVogmkWY8+76Ft5WPe4z8p41V5ulhTohKiVU
 cYBmA1d3ZwI1HlNnNUsxBuMmJgzduP+fGx3YwPIzD769TZjfCW104zRCCzMQw6L86ra6
 idZJqBgGa3a/uc4ZR2Jm4+8Nm/++xF411O5yb7aZv0BYgCkvKskTNlyy0F0msv41Nrbj
 /t2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777563045; x=1778167845;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=dFYUmsxpYxNeVnEWvGfeRKeiHiWjjJcXujbHi4Nouvo=;
 b=OhpObzj1tV8rnIPl8fnS+okoTC8I6+xrymEjB2DMHLf/B8sLM9mocazr05ZWQCkrmF
 QTdhpeR3yIjXPHDi4Om3Fzgd5NQZc6PxYjVa0XlLOmIRLE88SDzRF131y3i5rFbd53/X
 Ize5Rp4eCoV8CXhyvwsJ9VAyHtR+U2xBQmTVFFCdNivNW72X7iI56xkiI+OQnMdnR1G2
 w5HTYm5z6hDKtPH95QFIxxF/Lwz1BDxbSr5K2ZJ806yjgfbk0Y0gHZC/GePN40UUnWOu
 VK8yS3ixnQHSNEDEO5AWNxPfxAKKZyKH4DFi6N/RgWIsE76D56Kwp3fNNpa71xRjA21X
 tr6Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+eUeGvKit71uvegF2pqYRe5t5fa6Bgo6eQlZ246+Jp5b5GBT3NTB30yzBVdmyl4GLT296Y17TzRw==@nongnu.org
X-Gm-Message-State: AOJu0Yw28JSN2th5L5EE7S2iTF7wfY6iX+pFViSJYmi4AEafxpRChZfR
 sK6mL2khFDcA8FQDMyR6Q2war/BDssb8W1G3RlD+1txkyutDZboY2756hAPQuaMAIWt6eVtvBgS
 9rM94GlAWqlsAYAro4Dn00yqClMV7OvLQ8izf0IQrAQ==
X-Gm-Gg: AeBDieuxVUJ2QxML+Mkl4NSrsuUUAX+mzY/bUDAOgY/389JPHK6GLpCUVoHhuuGfT02
 pUO3ttbfOX2AJxwMdqXUGz4x0DMn04pQMDR4qCLZzIOOkxOPW/3t7+j8JvSitryimlt4Ndm+xro
 s0EFuEO/di6ggRcH4e7pzrL5F5jPg2gD9Scfn312XEA46z5KQK5yZfWGHUcy1xvBL5c3xDmKpzT
 cI/s7yBrST305pE1mb2IO2MAn7ukJJVpEAcWeEvRe0bnx0zO1ldjWd9DboWt7ojD5up+7Vm2HHo
 UElDNcN+ACia2MHrpH0daI6BPyf38do0g/fEbz+OwhIBGPoLVz1MA4aU5eOPA3iZNfQY5NSnUf8
 cJA==
X-Received: by 2002:a05:690e:2518:b0:64c:f4ff:607c with SMTP id
 956f58d0204a3-65c18de22c6mr1938423d50.33.1777563044370; Thu, 30 Apr 2026
 08:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260427-qom-tests-v1-0-c413f3605311@redhat.com>
 <20260427-qom-tests-v1-34-c413f3605311@redhat.com>
 <CAFEAcA-tSqa7SQUE-f5yTq_P9eW6p_XrnNSnHZjw4g=Z2WncAQ@mail.gmail.com>
 <4f90d39a-560f-4922-ac54-2c975dae249d@linaro.org>
In-Reply-To: <4f90d39a-560f-4922-ac54-2c975dae249d@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 Apr 2026 16:30:32 +0100
X-Gm-Features: AVHnY4JBP1_L_uvofr5Vpxo45GYDlKrZBmYLSz9Y1l3ero1v48W7SBi8qZA9Zjw
Message-ID: <CAFEAcA_LcHgtAAYFjqm+P68ULwSRJWfr6LipMg9YsviyWDxH7Q@mail.gmail.com>
Subject: Re: [PATCH 34/41] hw/arm/virt: free flash devices and OEM strings on
 finalization
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-devel@nongnu.org, armbru@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 30 Apr 2026 at 16:18, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 30/4/26 17:12, Peter Maydell wrote:
> > On Mon, 27 Apr 2026 at 20:45, Marc-Andr=C3=A9 Lureau
> > <marcandre.lureau@redhat.com> wrote:
> >>
> >> +static void virt_instance_finalize(Object *obj)
> >> +{
> >> +    VirtMachineState *vms =3D VIRT_MACHINE(obj);
> >> +
> >> +    for (int i =3D 0; i < ARRAY_SIZE(vms->flash); i++) {
> >> +        if (vms->flash[i] && !qdev_is_realized(DEVICE(vms->flash[i]))=
) {
> >> +            object_unref(OBJECT(vms->flash[i]));
> >> +        }
> >
> > We currently use qdev_is_realized() almost nowhere in
> > the codebase. Isn't there some way to do this such that we
> > don't have to care about this because the object is
> > parented and gets auto-dereffed ? Having each object
> > have to care about the possibility of "inited but
> > not realized" devices in finalize seems like it's going
> > to result in a lot of bugs...
>
> Why are we creating pflash devices if we aren't realizing them
> (thus not using them at all)? Destroying them when unneeded
> would avoid that manual cleanup, right?

I wondered that, but what happens is that we init the pflash
devices in the machine's instance_init by calling virt_flash_create(),
and then later we do the "configure, realize, map" part in
virt_flash_map() in the MachineClass::init method. So if
you init the Machine object but never call its init method
before finalizing it, the flash devices are still in the
inited-but-not-realized state. (This is similar to how with
a normal qdev object, if you init it but don't realize it
it will init but not realize all its child objects.)
(We need to create the flash devices earlier than we do
the other devices on the board to make the machine properties
that virt_flash_create() sets up work.)

Since virt_flash_create1() calls object_property_add_child()
to make the flash device a child of the machine, I think
we could make that be the only reference, by having
virt_flash_create1() do:

 Object *obj =3D object_new_with_props(TYPE_PFLASH_CFI01, OBJECT(vms),
                                     name, &error_fatal, NULL);
 DeviceState *dev =3D DEVICE(obj);

and then using sysbus_realize() rather than sysbus_realize_and_unref()
in virt_flash_map1(). Not tested, though...

-- PMM

