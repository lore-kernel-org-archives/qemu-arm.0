Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5018CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 08:48:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDfMl-0004YH-Rk; Tue, 28 Oct 2025 04:47:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vDfLu-0004EX-1d
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:46:51 -0400
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1vDfLj-0006TJ-Lv
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 04:46:48 -0400
Received: by mail-qt1-x831.google.com with SMTP id
 d75a77b69052e-4ed0d2a949dso1932001cf.1
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 01:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761641197; x=1762245997; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=74c4+HqxRJPus9bQybEz+YN4FB48AHHcS3sr1YkogJg=;
 b=IcvSbhL1ZGFLVcTUotjTFyI4ByQbVwWJLU+YVa1YRCGxMzU7LajnMviEMqyp5nu6Ch
 Ximv7tdccAfCIdoWo8XRryg1cGCAVTV//U9TxKoqLvFatfnJMuzHxt7/b3GHpwAxT5hk
 AgwiIb0M8onXgFTy4PEJv0smBfuVnHQOguC2W2SvQoZW5JsKGuyrXRieGLZoXSWUzC1j
 CwFzor9FDthC6HeZrOBP4EO+usP9yqXH6me2XnpG+aYx8n5OqUrWnPq+NIgqfiWajYSF
 QUx4gXZOQ4iPF5PbFUhzhyr/obQmaorAu9XMBf6lfBA90iDWR2PkeuhKMqQgFVgdMmNj
 RCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761641197; x=1762245997;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=74c4+HqxRJPus9bQybEz+YN4FB48AHHcS3sr1YkogJg=;
 b=fLVjGVo2PUffSs5aJIa0zAo5pmT0nL0OEM7IctZ0MkTZ1w+rE+JSFZ556OqgI9cBva
 9QeKDGz6d9/s9UGHRT0hq6jISZwen4DJnu6LrHEvpstrL5D0Bk2N5pcY/vmr/2Wqr6AO
 FhViYELJ14V9ZUkAE1GQYh+m/RzYsP4JswdG9kbPUSgzBEaXq2yDXJXQtaDYVQ7L4Yme
 Ihs2mFbRdE875FmWbEyc2stD/3yexytD/e1a20h45AnfFeiOga8PIwy7H0aSDoUzdhQ/
 CQIeEAqHjnCrWmpsgN0dHkf1OvRNP3+UK0rDUjAA0Twkmc3wSlJ06VxHn6DIM/1ypYyf
 rUnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHHlbEhRL07SRVonR88YHOIgB8FyQdsUsuM7Z9ngsjIePV9kPq/W50kwIBCi5ThIzKs053qQpwZA==@nongnu.org
X-Gm-Message-State: AOJu0Yw/WKlweYiRGpgRbpjbjWdDUDKZqxa+U/2slTWUiXCxCFZ0oG84
 nzmItKzVT/wIFPKzc/dGuuygGFrVO6Cg7otJmBcyd17giBMm4pgZvhvW1BxSQL0aCSBkBMWMgFh
 TRDzKvrqAcD1W29Ros6/YY35Zocimvf0=
X-Gm-Gg: ASbGncvCLqh9H/Z+Y6APa5a9a5W6TLlI61d65V1TxjDoxX7p14Vx1tHwRrxZDNDe+tx
 HcehKMcnxUcJe5Mr25eVU2N+OVbl9k8J6yHA0HGobTpUIrmsu250Jaem71Im4hm69wkT0LIUiob
 v9POjWtLAQ+ZoDVHMQguLizAKUU8BN5OS7Berz3fxkZCYHXof3mzue1yxNzPB8LVgrQjxdSLvSO
 +GcjBGnd/YxiZHeRWjpviZKn/J6aEsQV16qNG+lOi69UDwQpa5Drt20TwWETKdc6IlSEfEAm+5E
 ESjxo7u+LgbK/Ogg
X-Google-Smtp-Source: AGHT+IFzNNq0xtkG3HBZV+k9Q4Qh4wBkcSOloZPVyfaympGwhInn0h4RZJZpXf6Rit9f1sgCDBkCbzqmNa2FO97Oecs=
X-Received: by 2002:a05:622a:4244:b0:4ec:fa43:4d58 with SMTP id
 d75a77b69052e-4ed075cd25bmr42364871cf.50.1761641196777; Tue, 28 Oct 2025
 01:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251028080258.23309-1-philmd@linaro.org>
 <20251028080258.23309-2-philmd@linaro.org>
In-Reply-To: <20251028080258.23309-2-philmd@linaro.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 28 Oct 2025 12:46:25 +0400
X-Gm-Features: AWmQ_bkThyhwBWC8TUuZxvYfJI7M5STrRVP98r7pdXwiwEosZAsP-gMPAiyy5zo
Message-ID: <CAJ+F1CK=CcFS3xxWQtoEcYBmSoTFKwaAqZz=BsBcevp6ZXh=3w@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] hw/sysbus: Use memory_region_name()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 Bernhard Beschow <shentey@gmail.com>,
 Mark Cave-Ayland <mark.caveayland@nutanix.com>, qemu-ppc@nongnu.org, 
 qemu-block@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::831;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-qt1-x831.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

On Tue, Oct 28, 2025 at 12:06=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> MemoryRegion::name is kind of internal. Use the proper
> memory_region_name() accessor, which might return a different
> name.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  hw/core/sysbus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/sysbus.c b/hw/core/sysbus.c
> index ae447c1196a..d33be6b2b52 100644
> --- a/hw/core/sysbus.c
> +++ b/hw/core/sysbus.c
> @@ -154,7 +154,7 @@ void sysbus_mmio_map(SysBusDevice *dev, int n, hwaddr=
 addr)
>  int sysbus_mmio_map_name(SysBusDevice *dev, const char *name, hwaddr add=
r)
>  {
>      for (int i =3D 0; i < dev->num_mmio; i++) {
> -        if (!strcmp(dev->mmio[i].memory->name, name)) {
> +        if (!strcmp(memory_region_name(dev->mmio[i].memory), name)) {
>              sysbus_mmio_map(dev, i, addr);
>              return i;
>          }
> --
> 2.51.0
>
>


--
Marc-Andr=C3=A9 Lureau

