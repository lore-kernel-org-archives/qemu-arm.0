Received: by 10.223.172.38 with SMTP id v35csp344994wrc;
        Thu, 14 Sep 2017 23:31:51 -0700 (PDT)
X-Received: by 10.55.75.11 with SMTP id y11mr6154510qka.96.1505457110993;
        Thu, 14 Sep 2017 23:31:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505457110; cv=none;
        d=google.com; s=arc-20160816;
        b=WMZT2MlxtJQZMImk5gn8fMJ1YoJ45ZzZD1dteleML8+gWSswJ8B08qw8Werjw9xoFm
         PHXfyfSnguOC6wriiaaMsbIcYMSMOdJPc8qqklZrXbXR/80jcY6U43wFCsIsraBprLWt
         q5w/k+LWTz2u2ZgIzUbph5IPKMSTR7Rgr9MMXXqqRMO7mPGCdyhBmd1hEG1ixonfjcNM
         JOGfyl/Ej3QyOwK2RoPmJ8uwwzLxTeeKbBECOa5RwWppFcKsXPbwajnP82p8h9NE/Ix5
         DS+2Z7e9jgnr+bPJHVQ2PE7+FyR79Z6ji3uNeJIcfDqf/Zsn6naFXjKn/61HyiN/eOD4
         KKNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=sX0eqCHU1joHRIpmkEEodvvF2uJDIoMJkagmscqWRtw=;
        b=huLXclCmaZnzOOvUSUDOnyhYRlUoXs0yqLfGJ63IGOEqhNzRn+PhqFjvhMsVt4S5gG
         3yxsTpGFKm3yklVwIjmCzcAbkSV7X4OHbFBUxg/gur8kFAHRDlCCw79DtechmXUTwbaW
         BaqixpXzOh9sNdIez/SRJ9TMceH7SlWlTR50K5X9v2sUKDnPbmG1h/nKG/7W0nofj9iM
         iYYuO3EfPV6jirIwA4yVAfy1Ih5z6jhaBl09qBW8LCkf9Scz+GBGpWQ/ejD0HsaIohZv
         JYtYRiJvzv3XNnV+KOs4MAf/ggo8bNcPtc9sYdTMSKBAwWSw2gil/glfpECFpl/i1CNB
         rrdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bksKvdBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r200si222303qke.224.2017.09.14.23.31.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Sep 2017 23:31:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=bksKvdBE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51551 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dskAG-0007tW-Ln
	for alex.bennee@linaro.org; Fri, 15 Sep 2017 02:31:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59977)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dskA5-0007rP-TO
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 02:31:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dskA5-0003hu-0K
	for qemu-arm@nongnu.org; Fri, 15 Sep 2017 02:31:37 -0400
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:38138)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dskA2-0003f6-7v; Fri, 15 Sep 2017 02:31:34 -0400
Received: by mail-vk0-x243.google.com with SMTP id o22so359766vke.5;
	Thu, 14 Sep 2017 23:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sX0eqCHU1joHRIpmkEEodvvF2uJDIoMJkagmscqWRtw=;
	b=bksKvdBEdkpcEgxzbpCVw/+SyjlndGrxjwQ4AiS2TCGSOVH1Sz8NmRiW6g62i2/VMc
	/q3Z1+UbV3G5MLg1FDXiuzuIvmY5LcwHAX2o4nVRjTrnKRmF+mlam+8jRvffUh2eOs9m
	pjZPHrePS95KEF1KAStDN/mD2usmpGyukSYHbJqb18ZUV0m1Nl4ZTcd6N3aDwQtdW/rw
	QiYckF1dFSDOEkj6oChL7t3WsxPlh0ZBZ0Pq8t1rrAO4v0ZQgQ9quNOE+pbOAVVd6pIJ
	VrscY7kbExjBhs2X5HEYNS03uoFjVSRlqIK1aqvh7h5TPMc2phAF9DXr2Vu6KVmykE6E
	2+TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sX0eqCHU1joHRIpmkEEodvvF2uJDIoMJkagmscqWRtw=;
	b=tkIgvaE8ZdKR+63un3Onb+eMNWYnwFbQ61Z+2UlQfUuisJ12f347S1iaA/KZQ382ng
	n4UQFHufgA52yY3Ubrr+3Q4Ypxm3Ia/j4kxbT3ndEYhCpTOjv+N18zmUqOkCwO3M/4Ej
	wIlFpCii0gkWXq//DveVqCPL2tYlfJSSiRdx6z++AqdlPuGSYQivyPbCnKmx84e7crf6
	GAhcVAWAhkmXa2tHLUVMvSfTS3OKz3MiXPPkpQHG38hi9LcwMcOb9tGSKZyWnaE8qi2K
	M2fQFCocccCyWOMb6IpaA7GsZSBH93Eg9FM2oNfOVi/7Ho3uS7T5Qrbt+VrQUjSn2C3U
	anTQ==
X-Gm-Message-State: AHPjjUgwIsbaIvwBbN7/FgZ0PsrXhJ64I4N2MO9F6zbyw4p85KHuX4Ro
	8DiEwoYieQE0d61EmZwlACZrwjXuXTlk5kmrTzw=
X-Google-Smtp-Source: AOwi7QBUsMg8PCDNrK/xBVKMIGr5KzyVpH6dZ7rRGFccF9Epgc3NFNyPz1l3DuzYyXoErAcYOnTMIp1lULUHPYZlgW4=
X-Received: by 10.31.181.200 with SMTP id e191mr14981350vkf.55.1505457093508; 
	Thu, 14 Sep 2017 23:31:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Thu, 14 Sep 2017 23:31:33 -0700 (PDT)
In-Reply-To: <CAFEAcA_D=4M2vyo4m2xPi_hFDCmoKHk5kLY3s1ota602ywgHTQ@mail.gmail.com>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-6-git-send-email-sundeep.lkml@gmail.com>
	<CAFEAcA_D=4M2vyo4m2xPi_hFDCmoKHk5kLY3s1ota602ywgHTQ@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Fri, 15 Sep 2017 12:01:33 +0530
Message-ID: <CALHRZuoviT4xbYLVWPybVTkASZquxhcQU=h4+YC1KK=1SW=VWQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a114398c04882aa0559348bdd"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::243
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 5/5] msf2: Add Emcraft's
 Smartfusion2 SOM kit
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair23@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v86VC/A4oH66

--001a114398c04882aa0559348bdd
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

On Thu, Sep 14, 2017 at 10:44 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 7 September 2017 at 20:24, Subbaraya Sundeep <sundeep.lkml@gmail.com>
> wrote:
> > Emulated Emcraft's Smartfusion2 System On Module starter
> > kit.
> > +static void emcraft_sf2_machine_init(MachineClass *mc)
> > +{
> > +    mc->desc = "SmartFusion2 SOM kit from Emcraft (M2S010)";
> > +    mc->init = emcraft_sf2_s2s010_init;
> > +    mc->ignore_memory_transaction_failures = true;
>
> Please don't set ignore_memory_transaction_failures in new boards.
> This is a legacy-old-code-only flag.
>
> New boards should define enough devices, either properly
> or using create_unimplemented_device(), to make whatever code
> they're being tested against run.
>
> This is a firm requirement for this code to go into master,
> because once we let a board in with the flag set it's almost
> impossible to clear it because we don't know what guest
> code that previously worked on the board will now break.
>

Ok. I am working on it and will send next spin with this fix.

Thanks,
Sundeep


> thanks
> -- PMM
>

--001a114398c04882aa0559348bdd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div class=3D"gmail_extra"><br><div class=3D"gmai=
l_quote">On Thu, Sep 14, 2017 at 10:44 PM, Peter Maydell <span dir=3D"ltr">=
&lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.may=
dell@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On 7 September 2017 at 20:24, Subbaraya Sundeep &lt;<a href=
=3D"mailto:sundeep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt; wrote:<br=
>
&gt; Emulated Emcraft&#39;s Smartfusion2 System On Module starter<br>
&gt; kit.<br>
</span><span class=3D"">&gt; +static void emcraft_sf2_machine_init(<wbr>Mac=
hineClass *mc)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;desc =3D &quot;SmartFusion2 SOM kit from Emcraft=
 (M2S010)&quot;;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;init =3D emcraft_sf2_s2s010_init;<br>
&gt; +=C2=A0 =C2=A0 mc-&gt;ignore_memory_transaction_<wbr>failures =3D true=
;<br>
<br>
</span>Please don&#39;t set ignore_memory_transaction_<wbr>failures in new =
boards.<br>
This is a legacy-old-code-only flag.<br>
<br>
New boards should define enough devices, either properly<br>
or using create_unimplemented_device(), to make whatever code<br>
they&#39;re being tested against run.<br>
<br>
This is a firm requirement for this code to go into master,<br>
because once we let a board in with the flag set it&#39;s almost<br>
impossible to clear it because we don&#39;t know what guest<br>
code that previously worked on the board will now break.<br></blockquote><d=
iv><br></div><div>Ok. I am working on it and will send next spin with this =
fix.</div><div>=C2=A0</div><div>Thanks,</div><div>Sundeep</div><div><br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div></div>

--001a114398c04882aa0559348bdd--
