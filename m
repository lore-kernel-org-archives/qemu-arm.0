Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1148356wrm;
        Fri, 18 Oct 2019 09:35:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEC6AuAoSAkpdOX8+B6L/k3QniM/hvqGoQGaBDtbHfzCeGNjCtvH6ApoRkHfOhodf0D9Dr
X-Received: by 2002:ae9:f204:: with SMTP id m4mr9787034qkg.105.1571416500432;
        Fri, 18 Oct 2019 09:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571416500; cv=none;
        d=google.com; s=arc-20160816;
        b=Q/TFX6S/F7Ienj/6UDgM3RhcQ5wckDa6LrzZ6Nz51s6lOYS5a1RfZghV4/N+rrZ5T2
         qMuN5cdY3DqK9GWLLKCCIaCAsbvx5BL6r90sOdS4NmC43Kw3lxOynmKbtjz6pxO468ZN
         igfc3LDonnfYnYmRxK3R6KwXmi3czIK/Uf8Vy1kmbpmuv7/w9Aq5iHxaJpPb5muaAiye
         5JBjGFw0HE/yknggSy2e8QRHvBn4cUdu1CcCQLBLrn5/OXQil7Msh9dPn9GED3jIPd7b
         53qws5FvgzkF8EGDX0T0AJ2MRw9NAmc7gdDLjvXgPdYVL/Yb5T8ykfTtvwsdXkeTmVKv
         YjkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=MQDgG+VSoz7w0pvjeuYNnntQyuijU7xkSpl329/x290=;
        b=I/gnzGdn56RsuYAeIWiAodCSBYikbPCT3HQp+J5DcbvGmp8eJ2TBrpmCQa1TGhV3h7
         o75jxRotlRZ2w78yaI/1PF5Fnl9WMQgleVwAbwKMI88ZUQo8apb7mSM51QGdYY3cBZad
         eHm+BsT9RcWwsi/LsqjNxrF5KWLJE+bamzR9MyQrfWUMdXIF/zYNH+JfrQOkMWN/wWVK
         5HfZXMIs1NI6h8W9O9yCfZuvADsulmPKuxrZ/qkbGGS2qRddYwv279xh3fW/jBJwWRKC
         hPSnjvv1UgK6fsdkiwwK1U4wLq+uAJFyGvUdsoK85UxR0+zHeTdTPbfThjmgOnTHcp3V
         QF6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OgIOkOSi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h5si5369135qkm.101.2019.10.18.09.35.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 09:35:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=OgIOkOSi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLVDP-0001PN-AQ
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 12:34:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51897)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVDA-0001OJ-08
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:34:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLVD8-0002Uq-M4
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:34:43 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:38843)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLVD8-0002UH-E4
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 12:34:42 -0400
Received: by mail-ot1-x344.google.com with SMTP id e11so5485353otl.5
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 09:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MQDgG+VSoz7w0pvjeuYNnntQyuijU7xkSpl329/x290=;
 b=OgIOkOSi+iyFO2vxzwq/U3ZHFOe4/f96QtXsVoYbxC1S+5kynZFEVlnlxxMw9l+IAq
 f3gdLJYsyZfyoMOzpTS4Bv6tjFREe6Tp++VzaWKKEyuuWou3flAlhu8zSTOA38l++KsI
 +gtLdOCCkkHMf5eVvVzEi3J3e+a3taSTArjCO7/ZGsos6RSaG1R2itcnho1JWv7jLoSh
 aEPfJc34gNdtLYiYC0nFT+xop42Fz0ZcxFvl5dfTxDvljrekZbmnQwtrgRVej2vi9AJN
 g2Uq5++FUE00PtW5Z92MQLpQKOJCqDi8NgO1fEV224rzlVK62UxPH/tjp9vV745e5Ion
 cjpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MQDgG+VSoz7w0pvjeuYNnntQyuijU7xkSpl329/x290=;
 b=BiX89wPZz+vI//XTvfqvoZWwBouOkm+080hJK0EVL64MkNm6SIRtyZ2vC0STzy3ZGt
 SblDKei2hHtBpQO256etzS4wQbHfEa3F9c9ne0bXJphMt5ozHkgZFu2EPL7Yc2pjedw+
 EwMW1gKGH4v3Ar1pVG52dm2At0fbl9DEAI8iutmu53GDWrHnDkDFFFbePL69tHpm2/Yp
 JqCan7nKLHaS/PonGsb8IpPAwtfUjHl+oCMi/UXdPy7x9Zg5Owv4fIJR68H7gZt576y1
 szpIziL/xa8Cp3lFOTIYm/U3wqDHwvmVGh4kEpNFopc5Lqw8/d9BvkRXFFVpdQQNeq+A
 4CqA==
X-Gm-Message-State: APjAAAUVYd5K7xArSYom5Uz6TDDaAxcI7jmTi1VNVbiSOgKjRc8l0z1I
 /foRur5IDv8dB7IhFvAEkv8CV3fvg/RYCqvfu7iGGQ==
X-Received: by 2002:a05:6830:4c1:: with SMTP id
 s1mr8722180otd.232.1571416481493; 
 Fri, 18 Oct 2019 09:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20191018154212.13458-1-marcandre.lureau@redhat.com>
 <20191018154212.13458-5-marcandre.lureau@redhat.com>
 <CAFEAcA-Qaq0W-4kpRGSQTxzH1LZ3znoxZo6Fnd4NmnnE4O_G9w@mail.gmail.com>
 <CAJ+F1CL8AdRv8ktb8V0Ox7XZEO7GOXqPjVd=_CsZ=oSmHxtP_Q@mail.gmail.com>
In-Reply-To: <CAJ+F1CL8AdRv8ktb8V0Ox7XZEO7GOXqPjVd=_CsZ=oSmHxtP_Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 17:34:30 +0100
Message-ID: <CAFEAcA8+ZegXJRKTJ7pKLFZ6DdeP2VFxnRz5q21Z7tDt_mUpqQ@mail.gmail.com>
Subject: Re: [PATCH 04/14] etraxfs: remove PROP_PTR usage
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-ppc <qemu-ppc@nongnu.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: BdlwTWslAg/p

On Fri, 18 Oct 2019 at 17:11, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
> Is there really much difference between:
>
> dev =3D qdev_create()
> qdev_prop_set_ptr(dev, "prop", ptr);
> qdev_init_nofail()
>
> and
>
> dev =3D qdev_create(MYDEV)
> MYDEV(dev)->prop =3D ptr;
> qdev_init_nofail()

One is easier to grep for than the other if you're
looking for things we need to fix :-)

I've just replied to patch 1 of this set with a reply that
gives my general objections which are the same for this patch
as that one; it's probably less confusing if we keep the
conversation in that thread rather than conducting it along
two parallel tracks (my fault for not reading the whole
series first; I should probably have replied to the cover
letter).

thanks
-- PMM
