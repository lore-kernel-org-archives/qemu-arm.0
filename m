Received: by 2002:a19:fc0b:0:0:0:0:0 with SMTP id a11csp113730lfi;
        Mon, 18 Nov 2019 06:29:19 -0800 (PST)
X-Google-Smtp-Source: APXvYqwQQqvGRl9y6fVKOw9Zh7UKJVCw/YGpMHUaWjw36obaDz0+CLJUrE1HrcCjjXUpQnPBaOVu
X-Received: by 2002:a05:600c:23ce:: with SMTP id p14mr29386087wmb.176.1574087359668;
        Mon, 18 Nov 2019 06:29:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574087359; cv=none;
        d=google.com; s=arc-20160816;
        b=qO85X6UlTmNA8FVODdnxMbcRW6uQy7h4geOwDt5KdgTY6CdfII3vEFia5+TXXuEFfJ
         ZOs11Q0fzwzH/i5bpmrp4PErVvRBXl70Ha2LgNhQNEyA1l86RzTjCdAVMVZQ2UK0b/qw
         +iFDR11+bzuU/GLwFo3Vk28sOINiOo9fLKzixg8VEyoVpLrSLvZH9DUJapD1p5xzQtor
         vCKHucJINnuLxi+DM3qsbxfaOroS5SwzvRAGydIJNaNhNwdpe21yY7cHVL79zi4nREbh
         LshVEdTfAqBCWnDTxq53ajnvkgTYo2tkJmjO167nJXxxyoFuiryDwhoRwVi5s3eySRMX
         JCww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=vgskwxw+LqJM6cnrPXHkSxNn1ol2Fqt80rUQHhilL7s=;
        b=fOFqK+QLlu119SC0wR+FwpUeBQgH0a1fdTI3XCSiJ7lT642aH8Hx/Hb24vN4QdR9OR
         bbVbGepD0Xuu2NZcTjFQhZeuSfW9nY9JM7yFrZ0LZobNQUNCSOncaJIS6KzqeiQaKsiD
         nrHnEa++Wen/wgmhm6WuxVJXAnM3CsOptf2t68PXXp+sq1mqomjR4vMX6DT9NALW3O4T
         1iGpufuYN3PpHptFE38jZBrYEWAcuk/Red5FmpkJZrPIj6Ljx55nvQuNwen2VpwB3L6I
         fWalCxKtFrCUhxxnYOArPCcHfk+CxVZfQ82yjjZ0MS+ejhFCMYvBBiEf49b1q4gjaz5d
         BtxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JIOKLDgd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i12si11958413edr.198.2019.11.18.06.29.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Nov 2019 06:29:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JIOKLDgd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iWi1m-0000fI-MO
	for alex.bennee@linaro.org; Mon, 18 Nov 2019 09:29:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55768)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhzY-0007Zm-LB
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 09:27:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iWhzX-0006Do-FL
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 09:27:00 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:33926)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iWhzX-0006CM-AL
 for qemu-devel@nongnu.org; Mon, 18 Nov 2019 09:26:59 -0500
Received: by mail-oi1-x241.google.com with SMTP id l202so15488222oig.1
 for <qemu-devel@nongnu.org>; Mon, 18 Nov 2019 06:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vgskwxw+LqJM6cnrPXHkSxNn1ol2Fqt80rUQHhilL7s=;
 b=JIOKLDgdZZebn677ja9hpVxl52Y17xtbOj5RIlt1+/TaK960XkfgSPdaZItcVsskc3
 lwrlXTIUNryuSRa8T8q0YUABXiQPdt14sQ6BnoszKhNGU81wdXR2pi2a7Qdv2o1KzoMD
 ebFoZV3qpnrC44DohAmEm+bDomgTDN0oOtvZw1rq9z2OuiLTbYygTqM2+g5P5E1QC6tf
 m7c4uMzNYcjpENIOQ85brIJJMZZ9TFbZem2HMdQzRy3fMjn/H/bIQAIrsEWaLvDpmPa9
 1jHtxlKPXtxLqv3yqy5w3ZcaFuuU4K/nUSRDobwoOoxLCWMtOm/VVOY6wRmTOvMaf9hs
 rqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vgskwxw+LqJM6cnrPXHkSxNn1ol2Fqt80rUQHhilL7s=;
 b=fra4H/OUTup3P7HLdQY71iRn2thnXHLbjpOSzfTkiILZfDWvQZ+BVwcEe0cPqarPJZ
 KU5YHgjvycQWC5czDZagywuYGqEHV0YVKNN88zjVsH+e1n34rCrxZk0dY3hRSnh9ALh5
 1quXT2wmdpH2EjDc6hwOZLxEvyxFwTbxvYq+snbXIHdxurF0kaufu6hnywucARQl+zSS
 CJJ//pX99AxO+AbI2LWNhVgpYWRJ4kceyZwxHULCD/QOQz907mS3gdUq3+6UZ1Voff3s
 6sAqMRWJO9H3pZ9D/VdXftk2UlfnLB4xgDFd2nrp7GTCxE1guwgRUOckppLmR2MjmRcv
 EEXQ==
X-Gm-Message-State: APjAAAVPyGmFo4l8Don4KGXg8gK35Ik3M2U9GoffULJKx4jEUvTWpoc6
 zTFca3IkYPj1ZdB1DJ8nVwlB/Enl1yGEOUTmg+NYtw==
X-Received: by 2002:aca:cf12:: with SMTP id f18mr19429618oig.48.1574087216027; 
 Mon, 18 Nov 2019 06:26:56 -0800 (PST)
MIME-Version: 1.0
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-10-marcandre.lureau@redhat.com>
In-Reply-To: <20191023173154.30051-10-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Nov 2019 14:26:44 +0000
Message-ID: <CAFEAcA9H3bx93XbCytcZ2UwvHfGzM0KcttrEvEBHAhPm6KhfPQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/33] serial: add "baudbase" property
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paul Burton <pburton@wavecomp.com>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SeERIbr23eK+

On Wed, 23 Oct 2019 at 18:33, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  hw/char/serial.c         | 5 +++--
>  include/hw/char/serial.h | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)


> +    DEFINE_PROP_UINT32("baudbase", SerialState, baudbase, 115200),

You could also remove the explicit setting of s->baudbase =3D 115200
in serial-isa.c/serial-pci-multi.c/serial-pci.c, I think? (or maybe
you do that in a later patch).

Anyway
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
