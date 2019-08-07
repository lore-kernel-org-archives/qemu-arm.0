Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6649044wrv;
        Wed, 7 Aug 2019 07:54:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxQCNdH+joRumVxq1bM6BPsFvnAwp9YJ4dVqjl6CgYjuEheA0k3e1DrgdPokS+og0lLU8BF
X-Received: by 2002:a37:9c88:: with SMTP id f130mr6804809qke.494.1565189681464;
        Wed, 07 Aug 2019 07:54:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565189681; cv=none;
        d=google.com; s=arc-20160816;
        b=iYVZX5d7AaMBQCJxNFonjQXZqRkn26N1JmLVDqYrejfFw+9NwnW/Ylr17UHjfKXrpw
         JBkJ5ntpa1LzqIRfZcGY0qwN7bxjzrtAkQtZ1CWCYmhBAEXAa1+o63ue7wgCfZyVrvu+
         eHqgODQ+BPWr+CLpfzg8epwP8bOn+aLsJJMylforCD03tYLN4ki6dnH+0up2vhTl5MLr
         UrTSomEqxJWNjtWOOhwsUSQ1KiqMlHPvFpyWpKOKun+gg7Cj/JQeoI4qQ98R+KTOgf34
         TK2dPENbzVZFKojH4TjIF/h547dWZXD+BBaKavjLHDbL8o96VL04i+mkqbeWpBD4wGKw
         v1Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQlSHR/U9j1ba3vM8/+lHn5288KTWqRCzbe8FSYgNqI=;
        b=W/4Ve9vWsTeG0vPRrTOWMHCvKyHichG3hgHDSyVeQnS3FGfRetGoHCT4159bnKxtzO
         8P5sBVxcTYnuZgmdj2xBZhKwzKRm4GI0SJHXeQnWDDZ5vVG2VwpLuEhwtDwTH4hw6SvQ
         SgNYFQFSMZa13+NhGfu2lSnH6fuUyjLkE/nR3aczd1Lw6LVGsMurPBQNErstPOqRXGGh
         OK6SM87mfHIp4GqrM4SelmIThLPvnpuF+XV41b9tEukVH/R363NNnYPf+d4hGNOCdc6d
         IWx1/Ac6t24J9B+OVD7jFjVmtaOURUJ4Kc5rbUv9KPV8+N2NaUTZl5WXMPl0T/DI9jDF
         MbWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OLa1kq5U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si49009306qkg.11.2019.08.07.07.54.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Aug 2019 07:54:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OLa1kq5U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvNKq-00064m-WA
	for alex.bennee@linaro.org; Wed, 07 Aug 2019 10:54:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45929)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNKf-0005oL-IG
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:54:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hvNKe-0002LV-IA
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:54:29 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36942)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hvNKe-0002L6-Cp
 for qemu-arm@nongnu.org; Wed, 07 Aug 2019 10:54:28 -0400
Received: by mail-ot1-x341.google.com with SMTP id s20so39893037otp.4
 for <qemu-arm@nongnu.org>; Wed, 07 Aug 2019 07:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQlSHR/U9j1ba3vM8/+lHn5288KTWqRCzbe8FSYgNqI=;
 b=OLa1kq5UQPM+B7AynEJLkel/GGLoRaxLCe35doii/kF6gsPcV1FUZkY46N0FGLd6F+
 Jjdw1srkzFJ+Hh6SBWimnPNYQrHq6YaWYoEnJbLSlmtwuBeCtOckXUMyNwcmbStPxp+t
 RAI63y5dJmYlAzpYVuW6MtgefB7YuysoiOsAaCu1IrtBxjJdApBHGTOsw9uRzm/4pgaE
 H6CtGwyVGR0p9C/hug1Mf7zHmCXMHmoclRSoBra2nG0PvIxfUjs9yX2c4LqNQmJ/kcgP
 asHcxUq9gU6BS3tNjs2dEoXf2VXiNvferauevg19M3vxpzd5l9HiWvRLo94cuadBcdHq
 3J9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQlSHR/U9j1ba3vM8/+lHn5288KTWqRCzbe8FSYgNqI=;
 b=WmLg0EZ/j+81hy+LhGWXGB7XnpqoFD3v8dyxP84tR6UnWwKW/Vl74z2aCQ2/OONydP
 msNoklxFJnrkkq3ba3++c7mZU1dcTYQXDMlpJcN5qMH1oA9G9v+KSKOISu8Rv3fbFfxM
 DyZEXTj/y0xL18ZswtKKHbtx+O95+AoG5wAeBxj/ATkrtkH0vQNM8faIWZBu4EyX810V
 7xyRSAC2iPGxOlAubSieu8b9+yifiDnrsyjC7BpAl50Y/eFGCACK0tCoW9+k46eowsqd
 1f1tH2DrolZvCeG2WXfp5k2Xe0usTWuKQhOnZZ05F1+W8Xq11sk7ML/llfRYtNBUila6
 bKqA==
X-Gm-Message-State: APjAAAX3pEaszAwpwZO566uHYg4YzzxmMgYiCqitYqmtv5UeV5JKJ7Iu
 TEdbBqEUt78/y9VtDUwMFBlUwW6rpE5w00eaphEY/Q==
X-Received: by 2002:a05:6830:1653:: with SMTP id
 h19mr8591931otr.232.1565189667703; 
 Wed, 07 Aug 2019 07:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-7-damien.hedde@greensocs.com>
In-Reply-To: <20190729145654.14644-7-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Aug 2019 15:54:16 +0100
Message-ID: <CAFEAcA_PdOUTFAHBWxEvWLa1oP0BCMNs1zBJo-DV3OjrMLpPkA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v3 06/33] add the vmstate description for
 device reset state
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
Cc: Fam Zheng <fam@euphon.net>, Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-s390x <qemu-s390x@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lB1H11PXVDsK

On Mon, 29 Jul 2019 at 15:58, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> It contains the resetting counter and cold flag status.
>
> At this point, migration of bus reset related state (counter and cold/warm
> flag) is handled by parent device. This done using the post_load
> function in the vmsd subsection.
>
> This is last point allow to add an initial support of migration with part of
> qdev/qbus tree in reset state under the following condition:
> + time-lasting reset are asserted on Device only
>
> Note that if this condition is not respected, migration will succeed and
> no failure will occurs. The only impact is that the resetting counter
> of a bus may lower afer a migration.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>


> +const struct VMStateDescription device_vmstate_reset = {
> +    .name = "device_reset",
> +    .version_id = 0,
> +    .minimum_version_id = 0,
> +    .needed = device_vmstate_reset_needed,
> +    .post_load = device_vmstate_reset_post_load,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32(resetting, DeviceState),
> +        VMSTATE_BOOL(reset_is_cold, DeviceState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> -

Forgot to ask -- why don't we migrate the hold_needed flags?

thanks
-- PMM
