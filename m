Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp1824330pjl;
        Sun, 22 Sep 2019 09:39:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx89DNJv6IoYH4moY2AykVA5X/8qhSBWVyPyuCRNegHvSiuqO8xOHz2aRDegWsTuSA9XVpM
X-Received: by 2002:a37:8182:: with SMTP id c124mr13555969qkd.399.1569170346908;
        Sun, 22 Sep 2019 09:39:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569170346; cv=none;
        d=google.com; s=arc-20160816;
        b=S0Qro4z+y8/15AaE8xKgzSaGF1YT8zhgmqQTv0gBjqEn0Vj8hzp6L1bLI+M/iLStUI
         8tQqufnBJrdVp741bxHUjQuzBPMZQlFaHR2JSC/X/Af9YH0809B13BxBEvj70JqB3oM0
         deDi75idgM5iWGhuLDkEuiKGualHMM42kv59YAFGE6xhaWujZCOxaD7AFfjydWKlYNWB
         MhFMJYk9eVnaLFydT8TKaXlnxcdtscsZbUX9T77vGZhKzIhlU6QkMlMBbTinc7JPYpZ/
         BX5ld/P/C+sB5lEkQZiCDTgb+KupmXrIYtY0bbiAOScDcuEh8h824W9MuQwvucC0szgP
         ok+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=x/Z9SBnuHeHkqNLXIXzZby6IPpWYIhKq1ThBPPhZqNY=;
        b=YOYfO4RaVomeYOew+2HfvGEy5ITx2JU+NO88X9cmUu19bgfp0adDS0X7M6SzTJI1yL
         e5XS3k/ZmFA+AbN2ss9Yad9W9ozAQ/nohUeLTPOVV0RzFrXuHXKLUW1c1rIYtTjMstFq
         1DPvDR97h1YHmO0k08khTaKffB7+Asy3b8AAvwnvN4CrBxrl17g2moyZO+t5rP1QEPew
         0MPSkJ5yTIYBaFCxSv06rA+Jm8uU7K2+g4EHIPWFO8nM39ju0oJ02//kO8A+pAcPyfaM
         XWyV521WDp4BKr5H19HAtqMimLd4PNMExtI/F5NnTqiw+bCt5UPbMYV+zVXW7u+t03ek
         pxFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nzVkvBoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z42si6936656qvg.83.2019.09.22.09.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2019 09:39:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nzVkvBoN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iC4t8-0006Hy-DL
	for alex.bennee@linaro.org; Sun, 22 Sep 2019 12:39:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55589)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iC4sz-0006HX-C4
 for qemu-arm@nongnu.org; Sun, 22 Sep 2019 12:38:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iC4sx-00011k-Vw
 for qemu-arm@nongnu.org; Sun, 22 Sep 2019 12:38:57 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:36548)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iC4sx-00011G-Q2
 for qemu-arm@nongnu.org; Sun, 22 Sep 2019 12:38:55 -0400
Received: by mail-oi1-x236.google.com with SMTP id k20so5680351oih.3
 for <qemu-arm@nongnu.org>; Sun, 22 Sep 2019 09:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=x/Z9SBnuHeHkqNLXIXzZby6IPpWYIhKq1ThBPPhZqNY=;
 b=nzVkvBoNaGW9Virq1rPJRjtDsp1/J9wSVDIamseHk7Kpvmu9V8NkWu1lfAlj2L0zHr
 9LRHNU363D/Jj5NyWKK2WlYbzfmIcAvOosYY8APGPaJmmrwXexvvUPuXi0G7PSuO/+LM
 m3Es1Wvc15qxHbTlPu3nApu4basGI1Rw/ZPHDIdUrou6DwQS5Fc0lmeQh0rBx1T9e7z5
 8kpt6t5vTr6VZjuv6R79ul9pVF9DPsxdw+9ZyX3YvW6J+i5onmz+WgAm3N7Yn+XSIe9+
 /Kl8M28t/m91ALPx11PFgCmAUMVuI+3zjtv8IaCoVBUV8HGiOY01Jr/SZdDbe1ZIz5Fg
 rB4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=x/Z9SBnuHeHkqNLXIXzZby6IPpWYIhKq1ThBPPhZqNY=;
 b=ChhuvDvVWI6XsrFmX+ngTFnwe5PXx+LlQuqD9wXkUjhqzIXMdwR8kDF+3ujkdpqqQZ
 5S+X48d62xJbBrT+a5gjxhkctzEBz719VzPTzCVEe7FkseP8SAq8vTozYnjpdEoendqC
 hTgFjwiVUtRzd1eCGXm2QnDJjr1/lbJIDvn/1bXibSm1cm1uBNsO9VdGziD/lTu9jmbw
 j/vPGWl+sGOE5M7mj65ZYIonHYg95TfhqhFKeWY3ZdFcFJEKsyJFWatguVV5TtFu5KFC
 OFvI7qpjF0iFPm629agBFpH15gXTvUQWd9K+bHRJKeZdIHn7XWASHyNiQ9L0BjoX61w/
 0ezw==
X-Gm-Message-State: APjAAAXdoJL9o1ERxgUOpK82ZG2Tfu/unuVFlmgyA4g7nr5whsjLjZRk
 CfO2jfX+5nx231+X2PU3js7zUR2JsyeaF/W07Xfd3w==
X-Received: by 2002:aca:53d4:: with SMTP id
 h203mr10190741oib.146.1569170333876; 
 Sun, 22 Sep 2019 09:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <CACkBWHZY72Hd6ekan5yi8RLf69g6Q4zHpuFvARaTOVw-_FjNoA@mail.gmail.com>
In-Reply-To: <CACkBWHZY72Hd6ekan5yi8RLf69g6Q4zHpuFvARaTOVw-_FjNoA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 22 Sep 2019 17:38:42 +0100
Message-ID: <CAFEAcA-TKso03hq50_2sgFqWeEfMUxqWcxdqjsMhCT-YxP76SQ@mail.gmail.com>
Subject: Re: Remapping Flash into VM address space
To: Branden Sherrell <sherrellbc@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::236
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RJuoY14Bx0Av

On Sat, 21 Sep 2019 at 22:23, Branden Sherrell <sherrellbc@gmail.com> wrote=
:
>
> Hi all,
>
> I've been prototyping EL3 firmware using the virt device lately. After su=
ccessfully initializing the page tables I was met with a particularly stran=
ge issue: I am unable to map the Flash memory range into the VM address spa=
ce. At first I was identity mapping everything. I considered it might be a =
strange issue related to using address "zero", so I tried moving it above w=
here I mapped RAM. However I'm always met with the same result: Data Abort.
>
> All other translations work, including the UART and RAM. I've tested my t=
ranslation table configuration in many ways, including several VA mappings =
to the same PA and non-identity mappings. Everything works except those des=
tined to hit the emulated Flash hardware. Is this a known issue? Is Flash h=
andled differently than other emulated hardware in QEMU?

Not really, at least not for these purposes. The main interesting
thing about the flash device at address 0 is that it is one of
the few devices in the 'virt' machine which are mapped only
into the Secure address space and not the Non-secure
address space. So if you're not doing the access from
the Secure world or if your page tables are not correctly
setting the NS and NSTable bits in the descriptors then
the CPU will perform the access to the NS address space
where there is no device (and you get a data abort).

(The other devices which are secure-address-space only
are the secure-only RAM at 0x0e000000 and the secure-only
UART at 0x09040000. Everything else is visible to both
S and NS, including the 2nd bank of flash at 0x08000000.)

> I tried enabling MMU debugging with `-d mmu` but, after looking through t=
he code, it appears to not be implemented for this target.

No, it isn't. You could run QEMU under gdb and arrange to
single-step through the relevant calls to get_phys_addr().

thanks
-- PMM
