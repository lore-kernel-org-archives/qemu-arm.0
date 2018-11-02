Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2399738wro;
        Fri, 2 Nov 2018 10:56:27 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dzT4wq8Rcjc0O8vdmRzcXHPAJhGkar1StPGmWSWh4hoiaUrJAsPelxH8BVpzBjGx1Eplvk
X-Received: by 2002:a37:6710:: with SMTP id b16mr11392054qkc.42.1541181387048;
        Fri, 02 Nov 2018 10:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541181387; cv=none;
        d=google.com; s=arc-20160816;
        b=QEl+DLIt0MgZA1JpJ3uSmzJlC2wwg9Dt2rYvQJ10ysdDawmxKtSYNGKnrVqwu39i8l
         6vvLtcqD8HHKLHATBpxV/YJEJpXeE+QADcenOxfO7h5+dxiHRwngoUqRT+F6a/V4IIAq
         wGuplzXXUAYiqeJWggMOEWXqYmXasEuKRnfp10v0v9+0ccV9nlbhxxPknWr69R/qCk6H
         XFNzdHVpXy5xilfkrs0TtGnHPbZ1cPwKdqqo6P6WkLY252UEQO2pWoNQvym1P/HKkDw0
         dhrTNaUPSrYnIcs3VziCcPSF4olyiYNwcG9+K2AzWyV0Z2ym6ovDVS6eE3iLQSw3Eotx
         xSRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=zC75CSxJu3qTMyET4krB+ZrhayajY0oPmyWXpw0rWpo=;
        b=JvteSOCk8HnQNFA94MICLxhhQqpZ5M9C4iCftHAVtg5sm7JfMDB8jmlbioY68B45bs
         8jLKZvqp+vMRPVhwZ2Iucfx7oRydOWause6v4E2RoDEPisTP6J82wLnmuVTYy4fOk8po
         Zv7desFy0358o2YfSzhjDhSDahZqWEvCBv40DSy/GeNvMoCjGIhAFqpo+68YhW/a1oDi
         6h07ilPTia/Am4AAuyQjkIiVRFvwTylZGup7xGNbIpKh3VnUomZC6INnqKD+cTqxej3K
         1FmIhWva2RcNCLRPlGsjAOVVMLeJdFrBdNPJnexycluYix9j1mKx97m3GOG3sl3QJ4Ky
         7UTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jPmQHCdl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si5280755qkj.31.2018.11.02.10.56.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 10:56:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jPmQHCdl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIdgI-0005PA-Gn
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 13:56:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36585)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIdg7-0005Oa-LA
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:56:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gIdg4-0006lE-L2
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:56:13 -0400
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:40069)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gIdg3-0006Rk-JZ
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 13:56:12 -0400
Received: by mail-oi1-x244.google.com with SMTP id u130-v6so2265072oie.7
	for <qemu-arm@nongnu.org>; Fri, 02 Nov 2018 10:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zC75CSxJu3qTMyET4krB+ZrhayajY0oPmyWXpw0rWpo=;
	b=jPmQHCdle+9F4al0Cdati3+N4exDfD9F6sQlz+R5txRyjlcsf3nmKd4/LPeS/5svmW
	ZWUh6nJlIGqQ9zQaq6hfon60z+B0q1eNWQjyaaQrriJi0eKIBH1D59dbVikSlKrYejwv
	Nr65EdLirSeDa3u0mPitTI84lP5aHubodY9O8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zC75CSxJu3qTMyET4krB+ZrhayajY0oPmyWXpw0rWpo=;
	b=DOi19+4552BFqd1q1MR/2tDgLzEW3t3C0mSzH5APZNFijg3kxSZ/d1P0XDfxgwsVDZ
	px8dr1KFehf0fFMUGcukwjmYfb8X/ZydaIIhnPczNJnaFcLc30JkuahBMs0fJn4elx1f
	zbhX4/m8ZhPDt2+s1kvmoq7FxJS8V6CMQo6Zf+JmW1NHul4lmDDW/+jWJuO2S5UREfFF
	EHpDkn2+l7NVT8KhWTUi+BjFvFA/ODIszOXG57D/ov2dIOVjtKzXw0O5veySB7tUahhN
	koEagHgtGrVickxS4dJxB1V1Hxxn5ObleuFQrTZQ9c6F/ar086ufdp+Jjk/d5QBdRuYh
	73Vg==
X-Gm-Message-State: AGRZ1gJXVpTagCldFEEORjSzPW8ycR2lEfAkTZgC+Ha04T4lDtK1pDE7
	SxqSIq7l2XYCb7R4NfgqwVWq8EFcymUFWSE+Srt6Pu3LAsg=
X-Received: by 2002:aca:ef56:: with SMTP id
	n83-v6mr6933356oih.146.1541181347251; 
	Fri, 02 Nov 2018 10:55:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP;
	Fri, 2 Nov 2018 10:55:26 -0700 (PDT)
In-Reply-To: <20181016093703.10637-1-peter.maydell@linaro.org>
References: <20181016093703.10637-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 2 Nov 2018 17:55:26 +0000
Message-ID: <CAFEAcA-sh3mb3prsrvd8J1sVDsmJN7wbsoQtn1CdniRMfzvr4Q@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH 0/2] target/arm: fix some ATS* bugs
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EfPrWzKEmQOc

Ping for code review, please?

thanks
-- PMM

On 16 October 2018 at 10:37, Peter Maydell <peter.maydell@linaro.org> wrote:
> This small patchset fixes a couple of bugs in our ATS insn
> handling:
>  * for faults reported to the 64-bit PAR we were not
>    setting the S and PTW bits to indicate stage 2
>    fault information
>    (NB: stage 2 faults aren't reported with 32-bit
>    PAR formats so there's no need to change the 32-bit
>    code path)
>  * ATS1Hx were implementing the wrong thing (doing a
>    stage 2 lookup rather than an EL2 stage 1 lookup)
>
> The major missing bit of ATS at the moment is that a stage
> 2 fault during execution of an NS-EL1 ATS insn that asks
> for a stage 1 lookup should cause a trap to EL2. I started
> to sketch out some code to do that, but I realised by
> putting an assert() in it that I didn't have any guests
> that actually hit the problem, so put it on the back burner.
> If anybody does hit that missing feature, feel free to send
> me a test case :-)
>
> Based-on: <20181012144235.19646-1-peter.maydell@linaro.org>
> ("[PATCH 00/10] target/arm: more HCR bits, improve syndrome reporting")
> but only to avoid a textual conflict in the patch context.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   target/arm: Set S and PTW in 64-bit PAR format
>   target/arm: Fix ATS1Hx instructions
>
>  target/arm/helper.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
