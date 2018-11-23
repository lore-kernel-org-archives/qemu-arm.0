Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1740611wrt;
        Fri, 23 Nov 2018 01:09:25 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XeWT4HphdZTHZ0M4Zdj50OdX7pCC0xpPPdngynWUgwDi14rRmD56rjx7kcrLak+0Aiz+Xr
X-Received: by 2002:a25:a349:: with SMTP id d67-v6mr14196595ybi.334.1542964165406;
        Fri, 23 Nov 2018 01:09:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542964165; cv=none;
        d=google.com; s=arc-20160816;
        b=Dk0G+dcFaDT24eE+7Pk0P8X/gSirc9+trEDzOwIg0GFmOBG7sLQ4KE/Z0G2XNVuxDN
         Rph/Ow/oRGfK6jyYz9vJQ+W7aK9KAne8PjDDYup+1htHZZFKfYJvsHiDA019WzCgP0uv
         qE3XuiOJ9xV6JdQcf4Fz08EWWWLSaZDgZWrTIHvk32rzBnUi0djdoU+QCC5t6JHnhWm2
         /XSTJ55CcyztEcNjvEIrvpYTmUIMeCRUx3eBHtfQIsFUw+7ty06G6LuzzdD6xa4vwQy1
         pxyA0UsGZKds821jDQH7ikMbzDGRmxyHGh9+ZH7xANBC8wSZnDkegeyuR5Kv1+JwOWut
         j2GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=6mvGMuB8rW2MUEA91DdZY4P6+AwCRFm9m3fOz/rfR/E=;
        b=aZuL76Z/ICpZtDiIRAzUcevkKBKOOI33u3AJJu0z6ojKEFE0O7TG2VXsqZcsUol3Ek
         2juH4RaCdtGwJBQ0XnjngBlXN1BqbExtvJqxIxCwBefnhI0gOdevj4nu/95k9wJaCiHO
         VBVD/YiOfGP0xb9lSc0KMt27gSa3pRlhskFJJghMeKNIY1QtFsNXkPgI6snF9Bbjx268
         LBxkT55yvehDyOj8wnNGMiAzDx5BBqRSIPbCN1Cw71/B8yUSHGVfLWwY78RhueoDC9xn
         ahvKKgB0KmQiRWafRpHQGwRGySL8gxCP/lxilkbMZ/TUbGiSkuttfrILWfFvuL58tUTN
         zr9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LTmvcx8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l136-v6si31882772ywl.243.2018.11.23.01.09.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Nov 2018 01:09:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LTmvcx8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51111 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gQ7Sm-0004Wt-Ha
	for alex.bennee@linaro.org; Fri, 23 Nov 2018 04:09:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54617)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gQ7SX-0004Um-Cl
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:09:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gQ7SV-0001Rm-R9
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:09:09 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42972)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gQ7SV-0001Py-Cx
	for qemu-arm@nongnu.org; Fri, 23 Nov 2018 04:09:07 -0500
Received: by mail-ot1-x343.google.com with SMTP id v23so4653503otk.9
	for <qemu-arm@nongnu.org>; Fri, 23 Nov 2018 01:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6mvGMuB8rW2MUEA91DdZY4P6+AwCRFm9m3fOz/rfR/E=;
	b=LTmvcx8QjNBxw7zVwDkQ7ubYMFkefGynHXDDFDf7ANfaRtFVc9d8kwxlgVKKVHdYQL
	ZPT7POdENPvE3W7a1CSeCSoDXAb+ZLJoL71g4iLXg2F7aucg1vn/FMMTN78cxWWRPWlS
	DtFpKvrfmf6IVmKoexI6xIdAv3jhGF6npU42Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6mvGMuB8rW2MUEA91DdZY4P6+AwCRFm9m3fOz/rfR/E=;
	b=SAPoq8lrvSqPMuqUp6/90bvZNJEuUhKGLAex8DPmor+66aF5/xdQxwVXIU7g81Bb57
	jTnCfKUWo1LkSTgcJGxa1PJRe5D+Yf/6btfLxVvaMLhcrVVISvYvGT0Z6J9/LZMilSBb
	GzJnTxfE7CXnJF5nd2IdFQNz3Eiw1LBtXyQpx5MkrqBD0rigXmXyElsud4HKy2AujzFf
	I4mRrFfFlqnVmYGKbE9HaayfUNrBlMyQqY7GxbCC5ja8oSTsG1C4LJVeuYUn/3RaRwG8
	lmJk/x3BJdejPUB3mWo6E1/F/fpXUHM/L9l9rPrrh9UwNGMN9HONRm+ZLqQXRngNNkb9
	md1A==
X-Gm-Message-State: AGRZ1gI9NKtXUDEYI5FQL7PpIeG95YoNihYzQmqHGpRaoWMi+LTg7zi0
	1zItmGfkBzcXJDPpuxTy2b9xNxF9Ifqs5tCY24zt1w==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr8007913otq.316.1542964145966; 
	Fri, 23 Nov 2018 01:09:05 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Fri, 23 Nov 2018 01:08:45
	-0800 (PST)
In-Reply-To: <43381cce-1af0-8613-edf3-c216afdbe142@redhat.com>
References: <20181122180143.14237-1-eric.auger@redhat.com>
	<1259e457-6cb8-3b1e-853f-53f1e47cac63@redhat.com>
	<43381cce-1af0-8613-edf3-c216afdbe142@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Nov 2018 09:08:45 +0000
Message-ID: <CAFEAcA_s50WTbdJ9QWPjmXw0Xo=RpkAFPQJjzwSc3pQXL5neaA@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-3.1] MAINTAINERS: Add an ARM
 SMMU section
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JcPB+8L6DU/r

On 23 November 2018 at 08:04, Auger Eric <eric.auger@redhat.com> wrote:
> On 11/22/18 11:33 PM, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 22/11/18 19:01, Eric Auger wrote:
>>> +ARM SMMU
>>> +M: Eric Auger <eric.auger@redhat.com>
>>> +L: qemu-arm@nongnu.org
>>> +S: Maintained
>>
>> Shouldn't you use 'Supported': "Someone is actually paid to look after
>> this."?
> Not sure this is really important as long as get_maintainer.pl returns
> the right contacts. Many ARM sections do not feature the "Supported"
> tag. I will follow Peter's guidance though.

I don't really understand the purpose of the Supported vs
Maintained distinction. Mostly I list stuff as just
Maintained when I am dealing with it.

I think in particular that if a part of QEMU is just one
of a whole set of things that you are doing as part of
your job then Supported is a bit overstating things.

thanks
-- PMM
