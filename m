Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24493464lff;
        Tue, 7 Jan 2020 03:02:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqylvx9ePqMppi9qEv7v2eVuMQg2NrQzov/BnoIETmKD1NlNKm+iW7ebhVhmCtLJJxOSdzfc
X-Received: by 2002:a37:6c6:: with SMTP id 189mr82700514qkg.179.1578394957815;
        Tue, 07 Jan 2020 03:02:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578394957; cv=none;
        d=google.com; s=arc-20160816;
        b=ChONSZdgilaikgBMrimb5wp/Hcr/4YDFBwfsrFNXbBAGbRGAcnTAkwK1F8xSmOF1fj
         OIApqOEGPsH2FoKhF9rzSHHHZnwrjxGLg+GnejZ9/gZSNePS7frOACboNgCMCmYUhep7
         Pu+lKOLcI9+g2eX9iWpt2GvfBEfakOsCGqckEui3pBfTeFVq4JYEqC6MvZgbPfctzjEb
         8Bifw+ji9k/ee0hc42QIR+i5GaPLioyuc+A91fHTgjttaqyCJVf6m653JA72XK2tzQoO
         9lByNtyGqbx/YA+I1TKNmoDFJewkrJhxFZplacvzgoyQingWobAEW43n/5n+Nao9ET35
         vOTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=hhXZK6waXiBnmr0odxU7NgxYYfDC6HfydIaPIS8FwCc=;
        b=0vqXVgK3BrTURZC0sJzVZpMaBt1mti3TSG5eMc4+wnnKSoew0neT6VaXNUYOpRZDQF
         B47FeDN2oxbBna88hFGYyAu1wPn2IyLRlaqSod8g0PfxgSmH9ioKMObPIMeuOI27rkRO
         MKwZ2LOxrtjChc1h7A6WrREL7sQxyGAA4mW+bT6sTYgKLA+MjozmarHb3dQcN9VkrcwJ
         7E8Nev6v1xzUlIo0U2dyEG0C7P3fdL/kk1F6YLlAoJpmaSW1epbZ++tUPVTjUe2J3Nkg
         Q9uCJbLaqrLRO2ATlgc05DvBY6GQz3OlozWKgMnd0DLBrzfO02QEgeBglIp/BLl8azm6
         oAAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EJQ5yZP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si28890731qvw.187.2020.01.07.03.02.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jan 2020 03:02:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=EJQ5yZP5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iomd9-00010i-8s
	for alex.bennee@linaro.org; Tue, 07 Jan 2020 06:02:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1iomW7-0006Zs-MH
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 05:55:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1iomW6-0007b5-6c
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 05:55:19 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31206
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1iomW6-0007as-3D
 for qemu-arm@nongnu.org; Tue, 07 Jan 2020 05:55:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578394517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhXZK6waXiBnmr0odxU7NgxYYfDC6HfydIaPIS8FwCc=;
 b=EJQ5yZP5cVWQVf0e5Io6PahcfyeykXfvuooe58ZDbEH3J64zikTsbNCSmuSfJhL81qeTcE
 chyOpfZxATOTG3xmjqIwSmhqom4rSIjHxvsWdxa3xa9PyxTnptMga3FWaML4o3P4tyBWKY
 7Un+9IrKeEjyUWOIeJIwviD53CcrxT4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-uKr3G535Mp26rkbPaYbg2w-1; Tue, 07 Jan 2020 05:55:14 -0500
Received: by mail-wm1-f71.google.com with SMTP id g26so1829058wmk.6
 for <qemu-arm@nongnu.org>; Tue, 07 Jan 2020 02:55:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Os9CxIhXNJ0oXSGR+KwiDvplTNsja19E/C5m6OPss7M=;
 b=t0C+MCrTyX5PlY4Ic56gOFr9nXCJ+wUdsbZgMAP2MCkTbJL3q19JhV9Ld+SR0uDsG+
 +i5jB+ofr9ZNRxOxqcJrj8hxuaLja2Xiu4YKEhtnP2mgCRtesHknWnefF57TmJE0ylfG
 wRP5clep4FU7sWP1CVLlVORDpvXXEmWXb/8uafCLqeiBSNn7wNOV4NqmMMqWBZEFipvB
 RzNY0bnyAcgzRbCJIgbjXMQ8QsyR+4RaAnGBHozlrvp9+ObzZkkZC/nx+IoKTa+uDF6J
 IQ7xKZxA2YSzHZeoEDBC0egJa7GlNmhuXjC5NSVYuFdHIRhMLWH9Q/xVxPkPCwNFVGYh
 u7QA==
X-Gm-Message-State: APjAAAWpJ3SLA0Ie6T7jhbmjAWsh8be+rjKStI3SIcvhZYZ0JTEv4ztk
 Hcb/UVdtgYEwFDdR7Ves7uWv0vbg+VN/mVhovzjfR24LXpVWSXJYaaG73ST0hyX2sJwoRHF6iZJ
 5C0xmSwgM8ZRS
X-Received: by 2002:adf:eb51:: with SMTP id u17mr108866058wrn.29.1578394513131; 
 Tue, 07 Jan 2020 02:55:13 -0800 (PST)
X-Received: by 2002:adf:eb51:: with SMTP id u17mr108866018wrn.29.1578394512923; 
 Tue, 07 Jan 2020 02:55:12 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c6d:4079:b74c:e329?
 ([2001:b07:6468:f312:c6d:4079:b74c:e329])
 by smtp.gmail.com with ESMTPSA id t1sm26610479wma.43.2020.01.07.02.55.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2020 02:55:12 -0800 (PST)
Subject: Re: [PATCH v2 0/4] tcg: Include tcg files using tcg/ dirname, reduce
 cpp search path list
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20200101112303.20724-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ddded8a0-0df1-7408-b8c3-6a8ae1a5f438@redhat.com>
Date: Tue, 7 Jan 2020 11:55:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20200101112303.20724-1-philmd@redhat.com>
Content-Language: en-US
X-MC-Unique: uKr3G535Mp26rkbPaYbg2w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <Alistair.Francis@wdc.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Andrzej Zaborowski <balrogg@gmail.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Riku Voipio <riku.voipio@iki.fi>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NFkuHAosViHl

On 01/01/20 12:22, Philippe Mathieu-Daud=C3=A9 wrote:
> Noticed we could clean this while reviewing Richard patch last night:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg667606.html
>=20
> Since v1:
> - moved headers to include/tcg/ (Paolo)
> - include in .inc.c relative to parent (Stefan)
>=20
> v1: https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg05356.html


Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

but I'll let Richad pick it up.

Paolo

