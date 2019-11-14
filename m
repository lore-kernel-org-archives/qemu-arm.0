Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5296955wrr;
        Thu, 14 Nov 2019 02:43:26 -0800 (PST)
X-Google-Smtp-Source: APXvYqxF1upu8XT+ib1GgvMDsHt9FK/g5bAxTv7CSyFv226mYaJ1LR7UyjILxP3gjB/VJUrt/xwt
X-Received: by 2002:a37:4904:: with SMTP id w4mr6271459qka.119.1573728206506;
        Thu, 14 Nov 2019 02:43:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573728206; cv=none;
        d=google.com; s=arc-20160816;
        b=Qd05ICnam0BBLUjasmBzdUZib8KzBcsblAJ5D8FwfCZ7J20pp0p2Vu2Z8JMeqBUh7z
         FgokD0rFJA2ofhWBt7DOUpa+hfuQRV/47u18F4CCOgFhemDYoO0TzY92DNuQ55Hmqs4U
         5FwCtuy9LVCa4XQItluXrje+tF0/VLP5l9ZCv9lGVsuUTQBM4feQHQnLeI1AmLIhgSq9
         JJC6Ko4pyllm+/aNnZn+OoevuTaSSJ8TFmTOgO71uBF07Fw+IVuXeQVQKPXuPf1mPGTT
         FT8pdmhYdkXJuYAzLqVCPDAWtaeZofWLJ5CUZZzFsHdMARpeoZoJK533b2Vh7dBNNMuH
         5Yaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=va4pPesDb9PMDgaeG55RrXkBjO65aMQh7fOwORt/Wv0=;
        b=Q2r1T99Oal+5wGrTKn1fC7he82U1hMw2Q7xX2pv6O1sEIpNzqW7H3smoqGxG2z/TZ5
         iXpLnZGp/wWtAssA7YxreajOV34FRwaQVl6txXEt+vkq2oMvAvNJd+9imSR9baWMV3nc
         RJ1AwKw9a/B2ywhMsD+EfkxOccfW2ATDsay5E/rBLc9zWEQo78pyAzccw9dZbqwV9Ycj
         4nZ2711qn4TMpHfo8zIn/FI6kMMBAwVGYtu+7tQVExIS4b9oJCXdrZHl2h9uHfkttfBB
         kiBEWKKyKluoWaS9PivjB6N0X/eVaRmUhVXNuZKlJEcriRnvjfnej2MgbGh3++8DCvHV
         3D/A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@vayavyalabs.com header.s=vayavyalabs header.b=jPXnEt77;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a127si2995013qkg.356.2019.11.14.02.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 02:43:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@vayavyalabs.com header.s=vayavyalabs header.b=jPXnEt77;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:55722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iVCaz-00040Q-VM
	for alex.bennee@linaro.org; Thu, 14 Nov 2019 05:43:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51883)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pratikp@vayavyalabs.com>) id 1iVCat-00040I-3Y
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 05:43:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pratikp@vayavyalabs.com>) id 1iVCar-0004kO-Ru
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 05:43:19 -0500
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:38350)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pratikp@vayavyalabs.com>)
 id 1iVCar-0004kB-KA
 for qemu-arm@nongnu.org; Thu, 14 Nov 2019 05:43:17 -0500
Received: by mail-oi1-x22a.google.com with SMTP id a14so4843364oid.5
 for <qemu-arm@nongnu.org>; Thu, 14 Nov 2019 02:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vayavyalabs.com; s=vayavyalabs;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7y5kZHtcjIC0fvKjvhrXfFKm47kF3fxX2x6WjkOLHNQ=;
 b=jPXnEt77Bdi1wfuAQnU2HQs65e0W6IBzX1npO+OjCYUZtmhBf4uMrOEiua5b8pPENn
 qKYBJSdpHOH1cU4T2Jp4A+Ug/xsd3eSzdo9h5tYRc02zP8oiGpb722wt+7Ocv27n2u0h
 hAnRBBBOTvDLZ46je5zftu745vuVJdiZYbGoI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7y5kZHtcjIC0fvKjvhrXfFKm47kF3fxX2x6WjkOLHNQ=;
 b=SwFs+EA133blCYNMPo+RV84iANBZOW6/al9VL7d8Du/XJV6Z3C/HtIcOZb4cBZlZEs
 uOb4s4Y7HUvT4YR8w3Nwr4VLcaT1Re0eFmjv/JkD0VCd+WgiYl9adBHzNvG7Y9NSlR1g
 xPYU0zSBpgwutV6mii1IrxsxbckTDPsZw0+3znhJRwLoHi0v2Dys0sM4H1CQTCyby9mN
 m6duRaEqJw0jRPzHJyaD3gnfqgAmZMYI14t02CdnDCifQU0YgqIQnuYH3Q3Yz4VVf3qQ
 7Jkdee5cyQdsId1h+hAp4Tc+ZZs+Pj+d1UZG19bvVIm0yY5+G8YwV6nJAuEdQD4QSjwV
 0LFw==
X-Gm-Message-State: APjAAAWgpyZkNyxZpl638bhicovJ/ETz4hFBxuZXkTAILyt0UhEMFvVW
 HAmu/D+a7LRtlOXrmcztQDtN54kgBZrbchlYRenvTw==
X-Received: by 2002:aca:450:: with SMTP id 77mr2961336oie.113.1573728196514;
 Thu, 14 Nov 2019 02:43:16 -0800 (PST)
MIME-Version: 1.0
References: <CA+aXn+EtxWUVBBqhtjuY9hyKjtLFiSF=fZ8nSiqZq7+KCJDgfQ@mail.gmail.com>
 <CAFEAcA-hSPZG5sVcnBbHRHwDgc_Qh3wjCsvZ99o6uyTZU-a68A@mail.gmail.com>
In-Reply-To: <CAFEAcA-hSPZG5sVcnBbHRHwDgc_Qh3wjCsvZ99o6uyTZU-a68A@mail.gmail.com>
From: Pratik Parvati <pratikp@vayavyalabs.com>
Date: Thu, 14 Nov 2019 16:13:05 +0530
Message-ID: <CA+aXn+ELraCL77cDQrL6nhCOvtc5f1d0-8hjFw3NbG4ATdAe3Q@mail.gmail.com>
Subject: Re: Qemu support for mcimx6ul-evk machine
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/related; boundary="00000000000020d1f105974c26b6"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22a
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
X-TUID: TSmcwa9CEvw5

--00000000000020d1f105974c26b6
Content-Type: multipart/alternative; boundary="00000000000020d1ee05974c26b5"

--00000000000020d1ee05974c26b5
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Thanks for the reply.

I have run the qemu command with dtb file

$ qemu-system-arm -M mcimx6ul-evk -m 512M -kernel output/images/zImage
-monitor stdio -dtb output/images/imx6ul-14x14-evk.dtb

I am seeing a serial0 console popping up but there is no log on the
console. I see something like this

[image: serial0.png]

There is no rootfs now So, I should at least see logs with a kernel panic
at the end. I wonder why I am not seeing any linux boot logs on the
console. Did I miss anything in the command?

Thanks & Regards,
Pratik


On Thu, Nov 14, 2019 at 3:49 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Thu, 14 Nov 2019 at 05:12, Pratik Parvati <pratikp@vayavyalabs.com>
> wrote:
> >
> > Hi Support team,
>
> There is no 'support team' -- you're just talking to other
> users and to developers on this mailing list :-)
>
> > I am referring this article to replicate the same for mcimx6ul-evk. I
> ran the below command to boot Linux on my target machine
> >
> > $ qemu-system-arm -M mcimx6ul-evk -m 512M -kernel output/images/zImage
> -monitor stdio -drive file=output/images/rootfs.ext2,format=raw
> >
> > I don't see Linux booting on the serial0 console without any logs. can
> someone please help me how to resolve this? Or am I missing something here?
>
> You haven't provided a dtb file to QEMU, which is
> usually needed for the kernel to identify what
> hardware it is running on and to find devices
> like the serial port.
>
> I also suspect that that -drive option is not doing
> anything useful (you haven't specified what it plugs
> into and I don't think the mcimx6ul-evk will assume
> you meant an SD card image by default), but that
> won't prevent initial boot so you can leave that
> problem for later.
>
>
> thanks
> -- PMM
>

--00000000000020d1ee05974c26b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div><br></div><div>Thanks for the reply.</div><d=
iv><br></div><div>I have run the qemu command with dtb file</div><div><br><=
/div><div><font face=3D"monospace">$ qemu-system-arm -M mcimx6ul-evk -m 512=
M -kernel output/images/zImage -monitor stdio -dtb output/images/imx6ul-14x=
14-evk.dtb</font></div><div><font face=3D"monospace"><br></font></div><div>=
<font face=3D"arial, sans-serif">I am seeing a serial0 console popping up b=
ut there is no log on the console. I see something like this</font></div><d=
iv><font face=3D"arial, sans-serif"><br></font></div><div><div><img src=3D"=
cid:ii_k2yl0dou0" alt=3D"serial0.png" width=3D"472" height=3D"304"><br></di=
v></div><div><br></div><div>There is no rootfs now So, I should at least se=
e logs with a kernel panic at the end. I wonder why I am not seeing any lin=
ux boot logs on the console. Did I miss anything in the command?</div><div>=
<font face=3D"monospace"><br clear=3D"all"></font><div><div dir=3D"ltr" cla=
ss=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">=
Thanks &amp; Regards,<div>Pratik</div></div></div></div><br></div></div><br=
><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, N=
ov 14, 2019 at 3:49 PM Peter Maydell &lt;<a href=3D"mailto:peter.maydell@li=
naro.org">peter.maydell@linaro.org</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Thu, 14 Nov 2019 at 05:12, Pratik Parv=
ati &lt;<a href=3D"mailto:pratikp@vayavyalabs.com" target=3D"_blank">pratik=
p@vayavyalabs.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi Support team,<br>
<br>
There is no &#39;support team&#39; -- you&#39;re just talking to other<br>
users and to developers on this mailing list :-)<br>
<br>
&gt; I am referring this article to replicate the same for mcimx6ul-evk. I =
ran the below command to boot Linux on my target machine<br>
&gt;<br>
&gt; $ qemu-system-arm -M mcimx6ul-evk -m 512M -kernel output/images/zImage=
 -monitor stdio -drive file=3Doutput/images/rootfs.ext2,format=3Draw<br>
&gt;<br>
&gt; I don&#39;t see Linux booting on the serial0 console without any logs.=
 can someone please help me how to resolve this? Or am I missing something =
here?<br>
<br>
You haven&#39;t provided a dtb file to QEMU, which is<br>
usually needed for the kernel to identify what<br>
hardware it is running on and to find devices<br>
like the serial port.<br>
<br>
I also suspect that that -drive option is not doing<br>
anything useful (you haven&#39;t specified what it plugs<br>
into and I don&#39;t think the mcimx6ul-evk will assume<br>
you meant an SD card image by default), but that<br>
won&#39;t prevent initial boot so you can leave that<br>
problem for later.<br>
<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--00000000000020d1ee05974c26b5--

--00000000000020d1f105974c26b6
Content-Type: image/png; name="serial0.png"
Content-Disposition: inline; filename="serial0.png"
Content-Transfer-Encoding: base64
Content-ID: <ii_k2yl0dou0>
X-Attachment-Id: ii_k2yl0dou0

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
WHNlHBHtTue/7On9zrbupqii1+/3jtw33J8+FBFRymTd/P09rc5we/lVSp1O+777dj/j/PMapbHm
kUspVV3dd9/u4eGh9Qbu27vv2AeuZ3xoYfIbf/ruD/f/za9cfuYpF778NRcefmP6nk998I/+as98
NXxqPbfm0OZou1GGxjoREb35Xj3anJud+NoH3vvpdqsaG91SpvqDGA9v6gyVhan7PvXv/tOeX/y5
Ky575qnDEf2ph/7uy5/5s5s+N9tpzsaxfLgNwInl6IbVUZdyzdWvWHPXhfnuSb3Zd5w6ubPVHQw9
/EYpEbGr1/7DfeMHh4Y77fbqgf2q3r79rE6ns/w/OXhm1vz8wgMPPNBoxhM4cP2ftkzNR1WPPPOS
F7/pn7/pkrHofufP/v37P31/t/G08VhojtTRnjp4YKG/spcjnRga3TZz4KFelO2by2zzqKdh19Ge
OjSx0KvGh2NkdLyKMtNt9uYme91+HRGljLbLSaOdbmke4zwBOKFUVXXvF+5ZejZ1iVKuvmrtGEdE
r9dfmJ9/UXvm8s7cznZ3U6km68Z9C0N3zg3f1R0d6rSHWms9wSqi1+vPzy+MjY6ObxofGRluNJpV
1Z+ZnZuanJqZmWl3hp7wgRv+zK3p2e7JL3v7f33bszoRMfvI93/ww6/8yf+448H5+dbIYz0aAPyE
qqq694v3lIjG4WdTr/U4zCXNZmNkdPir3aG/nhqvqmpw3Vej0Wi2msMjzVLKemObzcboaGe+uzDz
8CMrBo6MdJ6MgRsopTs20tz3xQ+/c99L3vzayy+9YPuOC6b/amJhvRPpAPCkqut68ISNpcupy5VX
vCx5UgBwIqmqateX7i2llGNZGQMAT7hV5V3r2dQAwJNndXnFGACOq8W/2nTEGs+mBgCePPXSnzJe
/LdE3JQ7pxPD9dkTAOAp5Ont00spjcX7jBvZ8wGAE9ORU9OP+RkaG7vppoiI649tHXjT4pp8xf7r
bX+q+WmZJwBPPXXEkfuMM1fGazZsec5vemqfQddgAB6/ZddsPcExvv76nyhRy0v8U9FjAPgJ1RGt
FbVbSuma25diueYZ2o03xpOzlHyi5v+YjvM45gMAqw3OVDdicTm7PFdL0Vqxfb3vB9YMz+qDHItj
3HO9eT7q/I9x//W2P9b5AMAGWrEYp1j/QqrVjn3Bdzxr9LiXoYO18nq/h8dKgAF4TFpLHYpVEXrU
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
XS/9n8D/B3lIDGX3FXlTAAAAAElFTkSuQmCC
--00000000000020d1f105974c26b6--
