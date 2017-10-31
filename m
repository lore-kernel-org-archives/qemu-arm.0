Received: by 10.223.161.27 with SMTP id o27csp3502012wro;
        Tue, 31 Oct 2017 02:53:51 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+RDgbiZZrB36MyRy3ak13YlD2OdUysSNq00LYkubjcPlRJZlGeNtbtm3pBTMVFhqDjJnZDM
X-Received: by 10.37.216.71 with SMTP id p68mr778583ybg.511.1509443631261;
        Tue, 31 Oct 2017 02:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509443631; cv=none;
        d=google.com; s=arc-20160816;
        b=AWbD6Z4oHVY5VH5mCNLM2ivaY09doQZlES7WNswYCZw/vJLhMps3lujRz2glZEpOqb
         jCeRflk/rTTfd+XVbaciGpKg97gxU9uVSerSiIfdascF6rBTmGKRRzyXLv5b+M6wyMhL
         qTu20ulPSn0ChQRhHDfVsT4KxicAjgm8daysQAMlSb4NWrfgfPv/5+wA/YW9FpvOGdYR
         HDSX8HSNZRzCxwqJPdEIodtSxUAhEVsqz+hu4mv0qeYe79c6fzbCqJ1X448bnuBhyMKC
         UyUof6whQcaQsdaZGt1+gGTiwWaiRqtxaywYdsxmBl6KZMJSoAmVVwSV1BP8WVA4hpLd
         1UIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=FabPcM8ODdR1FeiKRRd/eMOdg7WWsQ/KmL0oLydA6b0=;
        b=YtFjwClKt8c44CGJ+fpKFXDgpyIIApMXadzYCi/DlB7AL3Jjoz1mCc2ytp3SRAtivn
         I2wAsav2hRpC7N3HhZD+hDPcYSo7Ft9jkvVQSn9FfCEs2bA65A/Kdb8snZA0FwRb0+Kq
         s7zmMHKhM2wgF1m5eL1WHqO+atLyiP0kj3vbIDqhFeSeKFZqXGWp1pP7ugeB2D6dYpD0
         F0cQjFmuZtrboqQydtX0IoEGtOdsSwtysNTwnGzVuerkrF3phgn9yJydwrficmeOrPVN
         qNpSLypWYiFCWbZFYwrMQguLzFZZWtKpz2RmggVow5ad4dYgoSCihgdvMgvFMiCKke2c
         hWSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KxHogVYd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p11si305316ybm.596.2017.10.31.02.53.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 31 Oct 2017 02:53:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KxHogVYd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44446 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e9TF0-0001xx-Q8
	for alex.bennee@linaro.org; Tue, 31 Oct 2017 05:53:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9TEu-0001xs-9h
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 05:53:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e9TEt-0000Jd-96
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 05:53:44 -0400
Received: from mail-wm0-x22e.google.com ([2a00:1450:400c:c09::22e]:48285)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e9TEt-0000If-1x
	for qemu-arm@nongnu.org; Tue, 31 Oct 2017 05:53:43 -0400
Received: by mail-wm0-x22e.google.com with SMTP id p75so21188674wmg.3
	for <qemu-arm@nongnu.org>; Tue, 31 Oct 2017 02:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=FabPcM8ODdR1FeiKRRd/eMOdg7WWsQ/KmL0oLydA6b0=;
	b=KxHogVYdHTiPbe0C3LbYZIr3Ce+V3qDxQnEOpNnkninQ3sgY0Ox95yYURa10oW5ZGA
	fhl67zH9WI7SimvJSda9CaZ9/pZ6JnfgL5HJqA4wv7R8B0kOHcYMa6eW2ihMP55uWEZE
	pz+2Gwdlru5dTydyHecWaIARWpOAvzfAsy75M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=FabPcM8ODdR1FeiKRRd/eMOdg7WWsQ/KmL0oLydA6b0=;
	b=c1dhsJKEs+zIR7FMcKLKYr9EWtyTlimwCrl5CHqXQzEsUjjquCwiy0q/FwM8jt3H/z
	nOvQOvXjwGbXv+SN7ejb9gIhD4LD/N2P6wNBaNlR/AAmMeDArIbrZiRavfhYn+CZwYZd
	JXE614mN5cmWDq9BMmfk18zwzu6xLvL4oUJnf3owtNAIn2x2Fi8RzRnaRb9tdYLzkUzE
	teUYFbTK2+Ve4nIBD2+XS3YNQDNcHNHiBcVUfelZZr9VeeQG2g1N1jQSQkiRlYoe83pT
	aCTDWyuHtPyHqUQRqecsWEr8NVK4G5ly3oFWeejRVuKMVwYBrV3+VcYqKcXCe1SN+gE7
	dWFA==
X-Gm-Message-State: AMCzsaU5jrlJ+MNTkdZheINaXpgqyHL/SQzVv9uzzTE81THEKeNpfHBH
	EwufMSFleAXKQOtyfjSWZWMXBn+nXhya0ddvrQkSFLdV
X-Received: by 10.28.10.147 with SMTP id 141mr1209176wmk.40.1509443621912;
	Tue, 31 Oct 2017 02:53:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Tue, 31 Oct 2017 02:53:21 -0700 (PDT)
In-Reply-To: <MWHPR21MB01591265BB44E18E19B910879E5E0@MWHPR21MB0159.namprd21.prod.outlook.com>
References: <20171020214918.18944-1-Andrew.Baumann@microsoft.com>
	<CAFEAcA-bW6CtLTN0omLoL7x7r996rY9BS1MvH4KdfS-2z6g1LQ@mail.gmail.com>
	<MWHPR21MB01591265BB44E18E19B910879E5E0@MWHPR21MB0159.namprd21.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Oct 2017 09:53:21 +0000
Message-ID: <CAFEAcA-oEu+bOHFp_vHKALnnkK=krP_1pMoar5t=MqY24JHRtA@mail.gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22e
Subject: Re: [Qemu-arm] [PATCH v2] arm: implement cache/shareability
 attribute bits for PAR registers
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: quWfllodO+e6

On 31 October 2017 at 01:23, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
>> From: Peter Maydell [mailto:peter.maydell@linaro.org]
>> Hi. This is looking pretty good, but I have a few comments below,
>> and we're pretty much at the softfreeze date (KVM Forum last week
>> meant I didn't get much code review done, unfortunately). Would
>> you be too sad if this missed 2.11 ?
>
> No worries. It would be nice to have a stable release that we can tell pe=
ople supports arm64 Windows, but I recognise that this is a non-trivial cha=
nge, so if we have to wait for 2.12 to get that, then fair enough.

Is this the only missing piece, then? If we squint a bit we can
call it a bug fix as long as we can get it in early in the softfreeze
rather than later...


>> The v8A ARM ARM pseudocode CombineS1S2AttrHints() says that the hint
>> bits always come from s1 regardless of whose attrs won.
>
> Aha, I was wondering about this. Thanks for the pointer to the pseudocode=
... it isn't referenced anywhere in the relevant section! It's reassuring t=
o see that, aside from the hints (where the English was ambiguous IIRC), I =
seem to have got the rest of the translation correct.

I didn't find anything in the English text about hints at all.
(I'll have to go and have another look.)

>> You can play bit games with the format here, because
>> what we're effectively implementing is "whichever is last in
>> the order '0, 3, 2' wins", which is
>>    ret.shareability =3D MIN(s1.shareability ^ 1, s2.shareability ^ 1) ^ =
1;
>> (since the xor with 1 transforms (0,3,2) to (1,2,3) and is self-inverse)=
.
>> Is that better than the if ladder above? Not entirely sure :-)
>
> I've no confidence in my ability to get that bit-logic right, or
> even to check that you did. I'd rather leave it to the compiler to
> figure out how to play those optimisation games :)

Mmm. This isn't on a fast path I think so we may as well write
it clearly.

>> > +    /* Combine memory type and cacheability attributes */
>> > +    if (s1hi =3D=3D 0 || s2hi =3D=3D 0) {
>> > +        /* Device has precedence over normal */
>> > +        if (s1lo =3D=3D 0 || s2lo =3D=3D 0) {
>> > +            /* nGnRnE has precedence over anything */
>> > +            ret.attrs =3D 0;
>> > +        } else if (s1lo =3D=3D 4 || s2lo =3D=3D 4) {
>> > +            /* non-Reordering has precedence over Reordering */
>> > +            ret.attrs =3D 4;  /* nGnRE */
>> > +        } else if (s1lo =3D=3D 8 || s2lo =3D=3D 8) {
>> > +            /* non-Gathering has precedence over Gathering */
>> > +            ret.attrs =3D 8;  /* nGRE */
>> > +        } else {
>> > +            ret.attrs =3D 0xc; /* GRE */
>> > +        }
>>
>> Isn't this if-ladder equivalent to just "ret.attrs =3D MIN(s1lo, s2lo);"=
 ?
>
> Assuming both s1lo and s2lo avoid undefined encodings, yes it is. I tend =
to prefer the if-ladder just because it's a more direct translation of the =
spec (e.g. CombineS1S2Device() pseudocode). But in this case if you prefer =
I could change it to the MIN version for brevity, since it's fairly straigh=
tforward.

Your choice either way, then.

thanks
-- PMM
