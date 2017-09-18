Received: by 10.223.172.38 with SMTP id v35csp3438754wrc;
        Sun, 17 Sep 2017 23:30:05 -0700 (PDT)
X-Received: by 10.200.17.23 with SMTP id c23mr29410751qtj.74.1505716205630;
        Sun, 17 Sep 2017 23:30:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505716205; cv=none;
        d=google.com; s=arc-20160816;
        b=y7sY7Y4nRkPSW8+khWiMPvs/SQesRp2/GdY1Oo+e+nkVl5MZnjcNTtq6JzFJwkUZZv
         x55F9k+V9iLTUSs5UCa2l2nep8zZDmHVBLTNX2tBAQObyYHSW7wC36vmroxYAPWRzZbw
         kw02TiRHEokSK54+baQiHAc46GwLo/XtB/IYk4fFUwWxn+N9DX5Wpxug61TaZHbmi9Wc
         M4Kje3rAO2s4ve9xgk6mhzKMn3egCo4TjMSIxCuIfAIVsuhM0URLedGpCb5LBOQvzz34
         EA66wmIuamUL4y0eL87hV4ZiqzFG21vp8au2nMTQ+Ps4mWx6Qg9l8GkR1+4PSzaJ6Q7I
         9N4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1v/N5lt5HdqtbkiuQ0E87DvEica8lI5ZK3THdVeUKv8=;
        b=aO5GNB7uiiMd1Xc6/5IwdqT5sgVrmRBjHD8TpkIibZvVXrrMkSEUavcpKrQCoZMmtX
         g7ZEcLx5sNVUwc6DijL7D8mO3ZfUifVXIDi5hmMDE/Kp1TggHimpoVZilW9mEg+vOaG3
         fm1bG+fJ0WMKH9eS3SFQPG0dItwEpIYYxWkGorhzp7sdJV3JNoF6P1nI9tK0n7KmI5RX
         t5lThEgRr8yJFLx/hEJ2HyjSFh/+N4eL1/12bJpb+f1MnVZKokh/u4YSoR/OfeFg/4th
         qZvXBj3n6AEJ8EIJt+WMK18mjnExM4acj8BN6jKNMXxRULTbapRPi0EUzpNhTydXDqaM
         Q3YQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XITxt/JO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p129si1612484qkb.278.2017.09.17.23.30.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 17 Sep 2017 23:30:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=XITxt/JO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34871 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dtpZD-0000Jj-Cj
	for alex.bennee@linaro.org; Mon, 18 Sep 2017 02:30:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45262)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dtpZ2-0000IM-GN
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 02:29:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dtpZ1-0005zQ-JB
	for qemu-arm@nongnu.org; Mon, 18 Sep 2017 02:29:52 -0400
Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241]:38376)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dtpYz-0005yO-14; Mon, 18 Sep 2017 02:29:49 -0400
Received: by mail-ua0-x241.google.com with SMTP id l24so2302749uaa.5;
	Sun, 17 Sep 2017 23:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1v/N5lt5HdqtbkiuQ0E87DvEica8lI5ZK3THdVeUKv8=;
	b=XITxt/JOymtX71OegrwQP5k9PJujw7pVOkj/FogNBZWgDApgFrRpZD82CO3ncKn5K2
	c/Jw9Kcz+kjvWuA8Bv9raPCBqtsI7XZr3kHNqoCCE2f3ZmpNNZb6P7EqFaOdyxGugN9B
	N1t6doFSCUju83HvU9LVT+v3tcSmNrOMbwwyzQ3mrR1LLSkBF0PKBaTB0YPFqxT5jHKK
	KkFYWrYE569/9QHcCm5rUcPaKKcWMFttVSREMGZXeyEwHfQ7ld/Iu1U5EJDCCfL6cowO
	wuNq7tJEU+aMzAW9cnOwiC0h+5SEe8UTVfOqkDhbkQxWKrHvmy4ggyD2JWQ6OtNytPpT
	Au1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1v/N5lt5HdqtbkiuQ0E87DvEica8lI5ZK3THdVeUKv8=;
	b=t2VyzfeEGwWvGJhyydNqDTo8+0EQIrJkPSM8BQlb6yFFxzwbpi1HAlu3purRK9CJLg
	qamcZFg2rU69YPJ+fSSodrvW5iKPDBd4kKkSlSfPJgOkoMe0E973xfuDI+AkTkv+XRGJ
	uJyYvAIr/yU0J7PxjydAf0Ff7VcFyhLfzITtGbpfmnTpjrUxZLWp3c4QPrxoDmBfv4N0
	ABkSDF3Amt3cT/OVn2WvWxuYk+QUKXcnZK3msT4wWeLvstApIaqWalnpglFsF3i5s0d7
	Blfnc4Y8UVAI6PDAHiDEkiqKba1wvuc0n05EnC7YBRKatRTzloih8rbWJuvWtSnW9vBO
	/AaQ==
X-Gm-Message-State: AHPjjUhOvu91AqtTOuWIWrAqLcgcBbdmVTivOypGLwro5O2b4T6JBgOW
	dmUHAcukgTm0SyNMe06F7KW3z/MCvCz7WTkkTIM=
X-Google-Smtp-Source: ADKCNb7h1xaYY0Tak09PalhzmK50aQ8WaSC2nBNetZ/iZbCZhqJ6cIPsAwx+KwbeVe9WCQ40BQZDKjR8sx7PNH2Y2z0=
X-Received: by 10.176.3.51 with SMTP id 48mr29336642uat.67.1505716187202; Sun,
	17 Sep 2017 23:29:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.66.68 with HTTP; Sun, 17 Sep 2017 23:29:46 -0700 (PDT)
In-Reply-To: <3618281c-b4f9-3a1a-8b6f-f87dfeb54e45@amsat.org>
References: <1504812251-23438-1-git-send-email-sundeep.lkml@gmail.com>
	<1504812251-23438-3-git-send-email-sundeep.lkml@gmail.com>
	<a9891f10-9643-96ee-7f99-7a384b9ea302@amsat.org>
	<3618281c-b4f9-3a1a-8b6f-f87dfeb54e45@amsat.org>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Mon, 18 Sep 2017 11:59:46 +0530
Message-ID: <CALHRZuoba-57L-95NrCHBn-+_DUcg9PQTbaOz4ENwPyX+Ysa3w@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: multipart/alternative; boundary="001a11351888788a2b055970de2f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c08::241
Subject: Re: [Qemu-arm] [Qemu devel v8 PATCH 2/5] msf2: Microsemi
 Smartfusion2 System Register block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair23@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: we73MZIoPwde

--001a11351888788a2b055970de2f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe,

On Mon, Sep 18, 2017 at 5:27 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg>
wrote:

> Hi Sundeep,
>
> On 09/14/2017 01:36 AM, Philippe Mathieu-Daud=C3=A9 wrote:
>
>> On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:
>>
> [...]
>
>> +static inline int msf2_divbits(uint32_t div)
>>>
>>
>> Please directly use ctz32() instead of msf2_divbits()
>>
>
> It seems you missed this review comment in your v9.


ctz32(1) =3D 0
ctz32(2) =3D 1
ctz32(4) =3D 2
ctz32(8) =3D 3
ctz32(16) =3D 4
ctz32(32) =3D 5

but for inputs 8,16,32 output should be 4,5,6 so didn't use ctz32().
I replied to this comment in the same mail chain earlier. Please check.

Thanks,
Sundeep

>
>
>
>> +{
>>> +    int ret =3D 0;
>>> +
>>> +    switch (div) {
>>> +    case 1:
>>> +        ret =3D 0;
>>> +        break;
>>> +    case 2:
>>> +        ret =3D 1;
>>> +        break;
>>> +    case 4:
>>> +        ret =3D 2;
>>> +        break;
>>> +    case 8:
>>> +        ret =3D 4;
>>> +        break;
>>> +    case 16:
>>> +        ret =3D 5;
>>> +        break;
>>> +    case 32:
>>> +        ret =3D 6;
>>> +        break;
>>> +    default:
>>> +        break;
>>> +    }
>>> +
>>> +    return ret;
>>> +}
>>>
>>

--001a11351888788a2b055970de2f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe,<div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Mon, Sep 18, 2017 at 5:27 AM, Philippe Mathieu-Daud=C3=A9 <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:f4bug@amsat.org" target=3D"_blank">f4=
bug@amsat.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi Sundeep,<span class=3D"gmail-"><br>
<br>
On 09/14/2017 01:36 AM, Philippe Mathieu-Daud=C3=A9 wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
On 09/07/2017 04:24 PM, Subbaraya Sundeep wrote:<br>
</blockquote></span>
[...]<span class=3D"gmail-"><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex"><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
+static inline int msf2_divbits(uint32_t div)<br>
</blockquote>
<br>
Please directly use ctz32() instead of msf2_divbits()<br>
</blockquote>
<br></span>
It seems you missed this review comment in your v9.</blockquote><div><br></=
div><div>ctz32(1) =3D 0</div><div>ctz32(2) =3D 1</div><div>ctz32(4) =3D 2</=
div><div>ctz32(8) =3D 3</div><div>ctz32(16) =3D 4</div><div>ctz32(32) =3D 5=
</div><div><br></div><div>but for inputs 8,16,32 output should be 4,5,6 so =
didn&#39;t use ctz32().</div><div>I replied to this comment in the same mai=
l chain earlier. Please check.</div><div><br></div><div>Thanks,</div><div>S=
undeep</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=3D=
"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
+{<br>
+=C2=A0=C2=A0=C2=A0 int ret =3D 0;<br>
+<br>
+=C2=A0=C2=A0=C2=A0 switch (div) {<br>
+=C2=A0=C2=A0=C2=A0 case 1:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D 0;<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
+=C2=A0=C2=A0=C2=A0 case 2:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D 1;<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
+=C2=A0=C2=A0=C2=A0 case 4:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D 2;<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
+=C2=A0=C2=A0=C2=A0 case 8:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D 4;<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
+=C2=A0=C2=A0=C2=A0 case 16:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D 5;<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
+=C2=A0=C2=A0=C2=A0 case 32:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D 6;<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
+=C2=A0=C2=A0=C2=A0 default:<br>
+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;<br>
+=C2=A0=C2=A0=C2=A0 }<br>
+<br>
+=C2=A0=C2=A0=C2=A0 return ret;<br>
+}<br>
</blockquote></blockquote>
</div></div></blockquote></div><br></div></div>

--001a11351888788a2b055970de2f--
