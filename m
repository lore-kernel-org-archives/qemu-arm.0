Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1825326wrp;
        Sun, 22 Sep 2019 10:30:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6pjk6R9izJ2JQS/NPnow3wZ1dmcI+eFqsELPtiREP6J7R5JxKrcdTPC9BUYSJp/AYWvXl
X-Received: by 2002:ac8:3061:: with SMTP id g30mr13368149qte.46.1569173439742;
        Sun, 22 Sep 2019 10:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569173439; cv=none;
        d=google.com; s=arc-20160816;
        b=HFtMAa/FN4Y3Y2+z5mWBnAWdQ8vUQlcu3PXsQf1o4tyjZ80foMOvogaGaWd4AHh6pE
         aOM49ZiSWoME86QHZIUt8FuznJLcSFvZZz8AB0VJoNRetSKTCU4Pq5wQhu6obbwBFRE1
         8YhzL42E9pCt9nQMOWV+QN7Cu1sEvGKUxQ+8Aamz3D8ZdGAJAV/CwkziOZS/9jqCXhEA
         yFjwXfvvKDDbDhvdF5bblkH4uPMKEVM56Qq58mLBMAc0RqVF5e9R7fUXwELRsqblP7V8
         FSK9HPvW+a7FvIepdL1KtLLC3UfjfgJ/UXKoT3Knc2tizyPLtDHho64ghB7gKzmBProT
         DqCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RbOVk5UrMpucRKmsi6SS57WWcwDZiM58T2MvC55VOWQ=;
        b=Nt+zZLlP7ih7HgBulsq0TWkmFeDSSPEcbc55s0kx1GdPSx0tT4Xw2NnGBfR48T5Ynz
         W8hZEX8grjJNyqMXJXaYFchb0DOGQj7cmuclVsjDcYJ6C6yuGFAcvFz8THWyck3NYLEq
         fHygGdwMtV/xp+hXq51SrJWarpYMWnfAzA589IsTSjxVsg/rYf2bag2XPJvO1/0vHf2C
         b+fkLuLwftIm0X9S6Mi12msUaP1z1FoGh6AI3gQcZ+76CwVioYg3WrrEpPLWC6mlI5OM
         MKtJcdsdCbAC98co1qVVRv4WwfuaSIhe4+FNxuXub4/NVVTdqCkDzVaJnboz5ha31Xf4
         qq1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=d4rmFUG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b67si7223241qkd.109.2019.09.22.10.30.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Sep 2019 10:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=d4rmFUG9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iC5h1-00043q-5P
	for alex.bennee@linaro.org; Sun, 22 Sep 2019 13:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60427)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <sherrellbc@gmail.com>) id 1iC5gs-00042y-43
 for qemu-arm@nongnu.org; Sun, 22 Sep 2019 13:30:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sherrellbc@gmail.com>) id 1iC5gq-0006Nb-H6
 for qemu-arm@nongnu.org; Sun, 22 Sep 2019 13:30:30 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:38446)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <sherrellbc@gmail.com>)
 id 1iC5gq-0006MD-Cw
 for qemu-arm@nongnu.org; Sun, 22 Sep 2019 13:30:28 -0400
Received: by mail-qt1-x82e.google.com with SMTP id j31so14569504qta.5
 for <qemu-arm@nongnu.org>; Sun, 22 Sep 2019 10:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RbOVk5UrMpucRKmsi6SS57WWcwDZiM58T2MvC55VOWQ=;
 b=d4rmFUG9lHQbmilIsn3RDZM8wgKj2Z2t3ZQjt+r5IDdbmwMyG9ljHTrUslkq05vlhb
 dHEXviE8taZFSYFyZrgU87sKXeNS5dNlMhhylmxBtCY0uB/vCqKYobzXHXujz2zZOBQX
 Qhz/OlfNJuFzNMs1KZi80I4160J3gauM0gK6OnkT+6tH34e4CcA2Up6sGmbWDMETLJiX
 xxeNbUW1Fi4I8hzE5Miv74U0TqTU/Kpvm57y515K2hC4ZgQ99Iq/Hr/Vp1ytX3XItLvK
 FfJdSnva8hZdsZJeZq7CTHn1iIj1VkgbVqttEgpzNqGQlQKK4ax3U8fOlpsJSMUEn0eB
 Sw6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RbOVk5UrMpucRKmsi6SS57WWcwDZiM58T2MvC55VOWQ=;
 b=lHOM/1JYdgfDQ3w25+wsi0AaDVmUpnij9E0/LQeSiVXru6hNcef88drb1f+DgWycpe
 G0NztnyQMyXLWo4fodpaMXq3InxnDznhg87YOqNZv76iOoyP2kJy+jk3Cdq2LjurkBci
 KcIKsPJ03i5gI1N9iSYz18sU22lK2j2OQVH8ASPGA3k3Gbhh08TPbqDZneZ7UfXcsQ6v
 v13MZl/uk8pgT8sRBDPboZnnmSnFzck2/76TnD+6b8X0KL14PwKdcKEmXZZJBUgzA4t+
 CKxElgOaTKuOJkpJWQwot/H+2z/WrUagtnqXmlyuLEk6zHh9/Kr3yOTNOP/clfIOjiOg
 0V2A==
X-Gm-Message-State: APjAAAWoyabBsLLHMW3KENs/ni3annPx+gNKMR9fqsCxDq+PChWROiHh
 NxgN+hHEA4amz3qmzqELu2fXvucHmdfkTX1xFzE=
X-Received: by 2002:ac8:342a:: with SMTP id u39mr13513712qtb.7.1569173427586; 
 Sun, 22 Sep 2019 10:30:27 -0700 (PDT)
MIME-Version: 1.0
References: <CACkBWHZY72Hd6ekan5yi8RLf69g6Q4zHpuFvARaTOVw-_FjNoA@mail.gmail.com>
 <CAFEAcA-TKso03hq50_2sgFqWeEfMUxqWcxdqjsMhCT-YxP76SQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-TKso03hq50_2sgFqWeEfMUxqWcxdqjsMhCT-YxP76SQ@mail.gmail.com>
From: Branden Sherrell <sherrellbc@gmail.com>
Date: Sun, 22 Sep 2019 13:30:15 -0400
Message-ID: <CACkBWHZO-sRuc6h9eMsH=+XFjhBugFWdfzxs2cO_Xo_1qJnDoA@mail.gmail.com>
Subject: Re: Remapping Flash into VM address space
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000be0a10059327a858"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::82e
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
X-TUID: 8rZRArN24l0J

--000000000000be0a10059327a858
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Thanks for the quick response. That was absolutely the problem. I just
unset NSTable and NS in the block entries and it worked as expected. I did
noticed this in the code but I was unsure of the implications. I am not a
QEMU developer, so sometimes the answer can be right in front of you face
but you do not quite understand it. I should have considered the comment
more closely.
https://github.com/qemu/qemu/blob/master/hw/arm/virt.c#L937-L956

Thanks again.
Branden

On Sun, Sep 22, 2019 at 12:38 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Sat, 21 Sep 2019 at 22:23, Branden Sherrell <sherrellbc@gmail.com>
> wrote:
> >
> > Hi all,
> >
> > I've been prototyping EL3 firmware using the virt device lately. After
> successfully initializing the page tables I was met with a particularly
> strange issue: I am unable to map the Flash memory range into the VM
> address space. At first I was identity mapping everything. I considered it
> might be a strange issue related to using address "zero", so I tried moving
> it above where I mapped RAM. However I'm always met with the same result:
> Data Abort.
> >
> > All other translations work, including the UART and RAM. I've tested my
> translation table configuration in many ways, including several VA mappings
> to the same PA and non-identity mappings. Everything works except those
> destined to hit the emulated Flash hardware. Is this a known issue? Is
> Flash handled differently than other emulated hardware in QEMU?
>
> Not really, at least not for these purposes. The main interesting
> thing about the flash device at address 0 is that it is one of
> the few devices in the 'virt' machine which are mapped only
> into the Secure address space and not the Non-secure
> address space. So if you're not doing the access from
> the Secure world or if your page tables are not correctly
> setting the NS and NSTable bits in the descriptors then
> the CPU will perform the access to the NS address space
> where there is no device (and you get a data abort).
>
> (The other devices which are secure-address-space only
> are the secure-only RAM at 0x0e000000 and the secure-only
> UART at 0x09040000. Everything else is visible to both
> S and NS, including the 2nd bank of flash at 0x08000000.)
>
> > I tried enabling MMU debugging with `-d mmu` but, after looking through
> the code, it appears to not be implemented for this target.
>
> No, it isn't. You could run QEMU under gdb and arrange to
> single-step through the relevant calls to get_phys_addr().
>
> thanks
> -- PMM
>

--000000000000be0a10059327a858
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Peter,</div><div><br></div><div>Thanks for the qui=
ck response. That was absolutely the problem. I just unset NSTable and NS i=
n the block entries and it worked as expected. I did noticed this in the co=
de but I was unsure of the implications. I am not a QEMU developer, so some=
times the answer can be right in front of you face but you do not quite und=
erstand it. I should have considered the comment more closely.<br></div><di=
v><a href=3D"https://github.com/qemu/qemu/blob/master/hw/arm/virt.c#L937-L9=
56">https://github.com/qemu/qemu/blob/master/hw/arm/virt.c#L937-L956</a></d=
iv><div></div><div><br></div><div>Thanks again.<br></div><div>Branden<br></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sun, Sep 22, 2019 at 12:38 PM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">On Sat, 21 Sep 2019 at 22:2=
3, Branden Sherrell &lt;<a href=3D"mailto:sherrellbc@gmail.com" target=3D"_=
blank">sherrellbc@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I&#39;ve been prototyping EL3 firmware using the virt device lately. A=
fter successfully initializing the page tables I was met with a particularl=
y strange issue: I am unable to map the Flash memory range into the VM addr=
ess space. At first I was identity mapping everything. I considered it migh=
t be a strange issue related to using address &quot;zero&quot;, so I tried =
moving it above where I mapped RAM. However I&#39;m always met with the sam=
e result: Data Abort.<br>
&gt;<br>
&gt; All other translations work, including the UART and RAM. I&#39;ve test=
ed my translation table configuration in many ways, including several VA ma=
ppings to the same PA and non-identity mappings. Everything works except th=
ose destined to hit the emulated Flash hardware. Is this a known issue? Is =
Flash handled differently than other emulated hardware in QEMU?<br>
<br>
Not really, at least not for these purposes. The main interesting<br>
thing about the flash device at address 0 is that it is one of<br>
the few devices in the &#39;virt&#39; machine which are mapped only<br>
into the Secure address space and not the Non-secure<br>
address space. So if you&#39;re not doing the access from<br>
the Secure world or if your page tables are not correctly<br>
setting the NS and NSTable bits in the descriptors then<br>
the CPU will perform the access to the NS address space<br>
where there is no device (and you get a data abort).<br>
<br>
(The other devices which are secure-address-space only<br>
are the secure-only RAM at 0x0e000000 and the secure-only<br>
UART at 0x09040000. Everything else is visible to both<br>
S and NS, including the 2nd bank of flash at 0x08000000.)<br>
<br>
&gt; I tried enabling MMU debugging with `-d mmu` but, after looking throug=
h the code, it appears to not be implemented for this target.<br>
<br>
No, it isn&#39;t. You could run QEMU under gdb and arrange to<br>
single-step through the relevant calls to get_phys_addr().<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--000000000000be0a10059327a858--
