Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3964759wrv;
        Mon, 15 Jul 2019 03:19:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzYzXsh6hxkvd3awabEbjRvxjnbtxRx7NvTHL/Qe5Ksr6cl/KZLQG5BQLTRNRJBdbYDkpme
X-Received: by 2002:a50:9947:: with SMTP id l7mr22655187edb.305.1563185993025;
        Mon, 15 Jul 2019 03:19:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563185993; cv=none;
        d=google.com; s=arc-20160816;
        b=IvAWFNyBBPsa9o5IaOolaFKN+4O0er1NfEkt69dRhov4DFIUGcQzvdc2LFHi0TJv0I
         bqRoZR8/TxKiH0JutLo4JzQR9N52u15PHmR9d91dhsA3hVmuCBRgIa3O1OycWFvQJ5lq
         4D7O71s7EBjNgtS0z5CJaMgC7Z0jA3Ml3ps167Iu/dT803CA6z+Bb0PRzaCXt3+DtSaW
         TPW8mC97kiH6t+qrwPDADsP8vcoKae4G6+2IqYflfv6wDdfpPIID06K+7q5EiT1twauV
         FOvCIaFCK2UF2GCYKnqQisE+o5nbPJMIQNtwsj2gxIS0h35No+4r0uHFWMZhq52U1lLK
         OSyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=lIY1LG0oQiWA/CK7da0hwk56l330aVFg5UDC40kBwXQ=;
        b=pKnPmM/P/NIoy9CTppVVc6HyvV4tGprAfKEc2tDavp96aZpunfBbmD31n5qERRdRR4
         Oufum30rTYq50wPX9lOOZgq8PAMwinA0H61WVO8TP+YkFfqG1HhOEFjvGo82myfls0V0
         WH5ZMUbQgqtTBKTTvtZtFOQ3oJZ5H9UQSSLkRZN6FdhPV4lmZVCuhTJ4njaa5SFRFig8
         gvfcEjUqgDYB21nTuKUE6vbQzltjmFmPJbcz3F9rDtexONuhPQJpUB9jaVnNubrZD3oQ
         bXCjSVmJaGv/tsNM9Ch501hYIWbrdg0RD6+UwwrgH1V1LDV6v2/2K8vpIK4E+driMijL
         g2Dw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NJaxPXR7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g14si9706666edy.420.2019.07.15.03.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 03:19:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NJaxPXR7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmy5H-0006Hn-KO
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 06:19:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34099)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hmy5D-0006FT-9Q
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 06:19:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hmy5C-0004ws-8I
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 06:19:47 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33607)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hmy5C-0004wB-1h
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 06:19:46 -0400
Received: by mail-ot1-x343.google.com with SMTP id q20so16367319otl.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jul 2019 03:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lIY1LG0oQiWA/CK7da0hwk56l330aVFg5UDC40kBwXQ=;
 b=NJaxPXR7Jxrl287frgOPqUvn3TPAGVR8D51mxlNs4wgqa9WpgxvFK8ZBEC6fIl+NC6
 I2fp5C0ZBV2mjBtqlf8ZbeLgHO9v8InYaR/XrVnMCDaCDkn6wTO7TftqhWeH5eaKBlwW
 0pl68SOIoc5Q5sttFlzXlwrOHDUbYFcw8j85xotZ+eG4iP8gtWxP5nSX4qIXdSiOxtjN
 zwrqlsLcBV3Jkh3uTBLPstjqKp3tXJ2j4Xm+D2YfB6GjE1bEgF+wqXLAV4rHrkZL4znH
 ffufe8v+PsSRimk6XO9RWMDDATh8LAlMspwMZVUF7WFu1KCPmn9H6Lbo8aWjmadLpvD4
 UewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lIY1LG0oQiWA/CK7da0hwk56l330aVFg5UDC40kBwXQ=;
 b=gVz2Tvg0NRSesiqdmt5FUjZF4alJNEKVanQqn71Y11onOiSqWncbWLm4GZHLVNyx47
 sMIK9ji9QU9wMbIa3bll5BVZV/cX/X8Tg0mcyhFnRuewEWQUtgwXRX7C+kiMn3RkXR1V
 Gp/GxN3XCFTpXtFq99i2zYkIY4wPZAYF9WnATteUA2ir/kGPeCMJz/x5OX4uvEUUwH5h
 YafOzrS3FXM2kkwNmU9vO95leF8mNqeQpm3JGRVJCBPECBwJ7Ku5l7MOMivgQgoQE7Sx
 L+opQq2S0QuRzA7NM+ZBubAjXw2tINxZT6rjrS9U01UA+03/dvkFaiQL4kTuMc+C00cm
 vLJQ==
X-Gm-Message-State: APjAAAWmK6ccKE6rCCai1CEWXFcWuBFnBo510VMgM5o9NhRuamEFkcqU
 ceINynxY4r6922K4ChVkVkigyF2gk9q5R+euE/ZXgQ==
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr14428381otn.135.1563185985085; 
 Mon, 15 Jul 2019 03:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-2-philmd@redhat.com>
 <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
In-Reply-To: <ca528cdc-6118-0b2f-c1b8-30b06875dde8@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jul 2019 11:19:34 +0100
Message-ID: <CAFEAcA-wgTVfj0TUJ=piP0wEgLGiNpOYia5DK2GQAO4Q7gNaWg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [RFC PATCH 1/3] hw/Kconfig: PCI bus implies
 PCI_DEVICES
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, "open list:RISC-V" <qemu-riscv@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Helge Deller <deller@gmx.de>,
 Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "open list:S390" <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nMy209laR2hb

On Mon, 15 Jul 2019 at 11:15, Thomas Huth <thuth@redhat.com> wrote:
>
> On 15/07/2019 11.55, Philippe Mathieu-Daud=C3=A9 wrote:
> > If a controller device provides a PCI bus, we can plug any PCI
> > daughter card on it.
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> > ---

> > diff --git a/hw/pci/Kconfig b/hw/pci/Kconfig
> > index 77f8b005ff..0f7267db35 100644
> > --- a/hw/pci/Kconfig
> > +++ b/hw/pci/Kconfig
> > @@ -1,5 +1,6 @@
> >  config PCI
> >      bool
> > +    imply PCI_DEVICES
>
> No, please don't change this. This was done on purpose, since almost all
> PCI_DEVICES do not work on s390x (so s390x does *not* imply PCI_DEVICES).

But that means that every board that provides PCI has to have an
"imply PCI_DEVICES" line, which is pretty clunky just to work
around an s390x limitation.

Is there some way in the Kconfig syntax for s390x to say
"no PCI_DEVICES" so we can have the corner-case be handled
by the s390x Kconfig in one place rather than in 20 places
affecting everywhere except s390x?

thanks
-- PMM
