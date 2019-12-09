Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4998346lff;
        Mon, 9 Dec 2019 14:25:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqzOkqDJumJjkxHvTGvyDk6xVVBGTivVmsZzOHsseO/ZftNXz+p4SgDqIktW/HkT+xbsQTKd
X-Received: by 2002:aca:c354:: with SMTP id t81mr1255345oif.149.1575930307169;
        Mon, 09 Dec 2019 14:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575930307; cv=none;
        d=google.com; s=arc-20160816;
        b=XEvy0PoovPHdn4OTRwBmKxsErcgJdIVSr0WIlL5HfHsdDDFhSqdDhDjT8kr81AMKfH
         B7MFJ8WIgUlRGTaJlJh1pqwof+E0Ke7hgSFE18Az6V8hhVrg9uQXF0JGIdBgGDPE8BV4
         I9Laa6bHFFKNS5d+qeFWbu57S4SIGCE/VVm4cbENQ/x8fyNOy2l4ialoLbPm20vQYAy3
         VlcdkFpkk61W4ajx3YrwLLPIZGjstufZqr8oB+I/xv0odmxjR4WfvEhi0BsN6K52HK4q
         Ha6mbf6QSoNDCfWiC8VbOAiajXg9fbh2k88XosaVi7mLs1XAzv54/7ayhS9tdY/6+u47
         h0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=ianzxofX1UwQRBrnwc+mhuW0kKW3XYkkz8u7Q0wzBzY=;
        b=oae3X5m6+fPjRTBq55lDri9QxPZnXsot3rbVh++/1c0irGIQwW3LPErPvhIEwWX8Bp
         8LFpmei8MuWmWVmkNGin2PyUarWb/EPisAq8OmZL597C0yviuWw2K/wrP5WrOS84f3Ll
         NgpjRa9tH/fovcxFdm9Jl8nGU/vdQuVHVCUI390a9K1McZ8Vd70ZB+8w4UOrO53bKsze
         GSdrHCYP7dgBS0VV6AJXhIJBWGuseXkXCRdA5KvHN0gS3+DFa/MA9DeFuBVgjbTMoL8F
         ynnPg7WHuv7mVNKoswgFFal1J6Ze3nuR26Z2e9uzoTrOccBU0doP1JQyryXgoJp/ul4z
         pqKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EQs7w4OP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si732111otq.51.2019.12.09.14.25.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 14:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EQs7w4OP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieRSk-0003in-CV
	for alex.bennee@linaro.org; Mon, 09 Dec 2019 17:25:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ieRSb-0003g4-3W
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 17:24:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1ieRSa-0006Ic-4Z
 for qemu-arm@nongnu.org; Mon, 09 Dec 2019 17:24:57 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34126)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1ieRSX-0006Ha-U8; Mon, 09 Dec 2019 17:24:54 -0500
Received: by mail-ot1-x342.google.com with SMTP id a15so13756462otf.1;
 Mon, 09 Dec 2019 14:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=ianzxofX1UwQRBrnwc+mhuW0kKW3XYkkz8u7Q0wzBzY=;
 b=EQs7w4OPWhLV5oTpLg596hXWDUS/z5qT/BqE7P1MhgUfjJ08Y8PWyMBZauXQHnbrUT
 QcPhiaJOh04PLb2IROYHgtwGosXH2tSTrNaiXosme++7JcjZ8HjGke5RGcnq6siSXX0S
 hNCLSOaVvruvohR29lGrW6z6ZKLu6Vq3JnfPH6PhVustU+ps2/Md3BX6JInsJ6VGEgX3
 hoLe7/Xphcd5sRSXgVEHpzqp8caaWBnGGMFshspMhQ6dKhpm4VQZduYYe6PXQsg+LMi6
 ASU0Ch3u7WQ5Du84ST9k7E8omV0leeU0T4qLlC1hdGaOAv4Ttmvpx9cyVuoo0CyY2qXT
 Q9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=ianzxofX1UwQRBrnwc+mhuW0kKW3XYkkz8u7Q0wzBzY=;
 b=Nwxt2TAJ5X/3UfdxEPFlLgKTofjk77GWkMFnK0nUPzNk7bCZQDVhO0OFma9PfPMs/m
 V3nrprBfXrpFUqBY6JB3fp2vwE/+4Zs3jyjXywv8m4afse7X0yuYB6a9ALsXAZ+gfWAi
 zalsaKgR6IPSjkHTR6jIzZmt6UOvQfPjg5lIzyVXIIcx6088mS8gb2Nai1vY1yzFRtBr
 VV46IXEvYdnDI7S/1b2SEiLBh6u4DkVN/SnljdxrqLxwoXUFlL9nkWPOtmpX3sxCz3Y8
 Ciz9c+yuVitJDT2RzVO8VcszIo3MnS5efFUER0KYmlHeeXZMztnLvfuWNsEj0gKpgVyB
 sOzA==
X-Gm-Message-State: APjAAAWxM5KsuDt7jbTFyZXO4yJOD9TTo1GaLQ+iTG3RaG2xh1vEkHex
 5dxPHeE5QEm54tH8LgYYuuceeBF4R2MAuZ9+RaM=
X-Received: by 2002:a9d:58c9:: with SMTP id s9mr22204180oth.121.1575930293084; 
 Mon, 09 Dec 2019 14:24:53 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:d21:0:0:0:0:0 with HTTP;
 Mon, 9 Dec 2019 14:24:52 -0800 (PST)
In-Reply-To: <CAFEAcA-WxMXs=hsV61_dYVxsc963NvWM7QK4hYqkedx4boCAqw@mail.gmail.com>
References: <20191202210947.3603-1-nieklinnenbank@gmail.com>
 <1de57227-8124-4d11-d996-9faf67b3e4f3@redhat.com>
 <CAPan3WrNDoLjmEETAQHa2GmG70yP3TzPnJqzQLK_t+m7CV+ONw@mail.gmail.com>
 <CAFEAcA-WxMXs=hsV61_dYVxsc963NvWM7QK4hYqkedx4boCAqw@mail.gmail.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Mon, 9 Dec 2019 23:24:52 +0100
Message-ID: <CAL1e-=hvwU75H1AmpETcYSFeyAYnztas3t=BHUHZRT6RBTAj7A@mail.gmail.com>
Subject: Re: [PATCH 00/10] Add Allwinner H3 SoC and Orange Pi PC Machine
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000004f686805994cdd01"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: KONRAD Frederic <frederic.konrad@adacore.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Niccol=C3=B2_Izzo?= <izzoniccolo@gmail.com>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2cHRwWQZn+33

--0000000000004f686805994cdd01
Content-Type: text/plain; charset="UTF-8"

On Friday, December 6, 2019, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 3 Dec 2019 at 19:32, Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
> > Indeed that sounds like an interesting combination. Are there plans to
> build a multi-arch/single-binary QEMU?
>
> This is in the category of "it would be nice in theory to
> support multi-arch guest machines, and we've made some
> small steps in that direction and/or tried to keep the
> door open for it when designing things, but it would
> still be a huge amount of work to actually implement,
> so don't hold your breath for it or make anything else
> depend on having it happen first"...
>
>
Peter,

This is one of the longest definitions of a category (in fact, most likely,
the longest) that I have heard in my life. ;))

Aleksandar



> thanks
> -- PMM
>
>

--0000000000004f686805994cdd01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, December 6, 2019, Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">On Tue, 3 Dec 2019 at 19:32, Niek Linnenbank &lt;<a =
href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&gt; w=
rote:<br>
&gt; Indeed that sounds like an interesting combination. Are there plans to=
 build a multi-arch/single-binary QEMU?<br>
<br>
This is in the category of &quot;it would be nice in theory to<br>
support multi-arch guest machines, and we&#39;ve made some<br>
small steps in that direction and/or tried to keep the<br>
door open for it when designing things, but it would<br>
still be a huge amount of work to actually implement,<br>
so don&#39;t hold your breath for it or make anything else<br>
depend on having it happen first&quot;...<br>
<br></blockquote><div><br></div><div>Peter,</div><div><br></div><div>This i=
s one of the longest definitions of a category (in fact, most likely, the l=
ongest) that I have heard in my life. ;))</div><div><br></div><div>Aleksand=
ar</div><div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
thanks<br>
-- PMM<br>
<br>
</blockquote>

--0000000000004f686805994cdd01--
