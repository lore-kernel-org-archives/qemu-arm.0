Received: by 10.223.161.27 with SMTP id o27csp893915wro;
        Thu, 26 Oct 2017 09:35:32 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+REggrh0G213j2m04cdhMAB8uFWIrdj0I8vKWf2EoG7M5wCOGlRUChR0sa18cv50mWMvIRL
X-Received: by 10.37.104.130 with SMTP id d124mr1466389ybc.229.1509035732386;
        Thu, 26 Oct 2017 09:35:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509035732; cv=none;
        d=google.com; s=arc-20160816;
        b=xiSn0uYVtPX3bGAXeaTbuU9Zvbg7HXrwo1FWbH4H3Lzl80Xj6J/adde8XFXDxauQ8z
         DAZbCbQvFErheUi4cnI75XFZTGAGXfMVyBYO8LqFpAwGFVs7WPxsvzWowcWrFTKfS9Kj
         nAjedGPSrwMVGCa5NIPsmp7sL5kMW6Q7SHEfBMBlmd/zYR2yl41peUzWWWfFK/pP7C8U
         wjVySWFTjY4STCzXQfrF7bBNy6jGgPu5owrCD1buk6zAy0GkLFMA2ctOaxmJiMYxglp1
         x1KJA6nUCgGPy5XrXOdmM1mu2TUKgrqMlJjnPJ1qicchM2Yzrf9jnTpJbWTQPOWn17oa
         3VHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=QZTJK7TfbYuvKld1o+yGxkB31wZhunK1/oJtp4gaTlY=;
        b=S23GdbdpmP0jnK31Cwz5rWT5wu7QvR9Gsld+vZj/oRkICSWYwx4MyxHjwQuzzowgnI
         t8gS8yABiMVSqWwBoqAIaeZj7ifBlCJa9EPgczTR8i92P0NCtv23Y8rwSPfv40oKh0qA
         WTtAmMth8HjCsirvpOJX4N+maWVZXJkeoP1i9d6Xo8wLey/1rzTL+NzTFHUTQR2UCROs
         6EdOb75haMj1u1oNBvsvf+HSq+bhaJmVYTo3Z4dCxZVjY8IkWuSEv5hqbfoaPo4db5nC
         EE+6foBDYLqL3tMIOXSDUSYN1FRQq9PGJUfRKSLcfygKknGsvOg/5mnHD13oK0OfjC3U
         BUTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c0B+qO6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g193si891538ybf.443.2017.10.26.09.35.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Oct 2017 09:35:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c0B+qO6a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7l7z-0003tk-OW
	for alex.bennee@linaro.org; Thu, 26 Oct 2017 12:35:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7l7o-0003sE-2s
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 12:35:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e7l7n-00063T-BA
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 12:35:20 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:48214)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e7l7m-00062e-Ql
	for qemu-arm@nongnu.org; Thu, 26 Oct 2017 12:35:19 -0400
Received: by mail-wm0-x244.google.com with SMTP id p75so9117381wmg.3
	for <qemu-arm@nongnu.org>; Thu, 26 Oct 2017 09:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QZTJK7TfbYuvKld1o+yGxkB31wZhunK1/oJtp4gaTlY=;
	b=c0B+qO6aftcKE5onaaHkDk9h8K1qXMnlghMyiW9R3E7TqmxmfFCzftdYUaOyT/ZZGM
	zVMrWDgFSpkMCv96Xn743ZEVSdFh1LcaPfIeUGd6dEaGcAh912h4CP6s58fFWMw5ge//
	XS1SoPhlOqvC93zl70IC1mv7OLyCyVIfDexsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QZTJK7TfbYuvKld1o+yGxkB31wZhunK1/oJtp4gaTlY=;
	b=hZqp1iPkd9C0eI4zb0Db9mz982kL1YiSHaoC5UOAyfXX5MVVGX7OIA79gKS6hSL40l
	JWuz1Bz2T2S8Pcng0NhXXpaOobPth4AuI2OWvvueEoQJvSvXZYK1rdPPh6iB00ZW7jX3
	FVd4sRJ7CKJOVbZ95yTd6ezRlDJfYxIv1Bb796vCXtxbke1FbVTNo69A9rQcwbHNObwM
	6i1yjfXmYqQEBX3Tr/QxNhopfO/iMw3IpV0gTv0XenyOyLAJA+v2vlaftb19/0vuP/7I
	C7ukIBzomUG4/dvIFyn/Rm8JQMYRoTzmkn7DKilmwcILB9GAiGsPSsUDmOQ4zNLxMHqJ
	3dvA==
X-Gm-Message-State: AMCzsaXHmzjzoGnk8LEimLgdhLhwO7oki8VUc+5ov7QXp/5hrk88Pmb6
	EA+siwyDqHfKq1pgYlEAv1KUqXGDgXQskNCBDHoITw==
X-Received: by 10.28.10.195 with SMTP id 186mr1958599wmk.136.1509035717591;
	Thu, 26 Oct 2017 09:35:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Thu, 26 Oct 2017 09:34:56 -0700 (PDT)
In-Reply-To: <CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Oct 2017 17:34:56 +0100
Message-ID: <CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: support 4 serial
 ports
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ERHGaxtabAjL

On 26 October 2017 at 17:15, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Thu, Oct 26, 2017 at 4:36 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> I'm still thinking about this. (You definitely can't have four,
>> though, because we already have 2 in the trustzone-enabled
>> config, so we can only add another 2.)
>
> The trustzone one could be the 5th? Since it's only useful for trustzone.

Reordering it would break existing users of the trustzone uart,
whose command lines would stop working.

thanks
-- PMM
