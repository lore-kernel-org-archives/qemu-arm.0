Received: by 10.25.208.211 with SMTP id h202csp2140102lfg;
        Wed, 2 Mar 2016 04:41:23 -0800 (PST)
X-Received: by 10.140.168.85 with SMTP id o82mr35059232qho.10.1456922483437;
        Wed, 02 Mar 2016 04:41:23 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id p64si35853110qgd.28.2016.03.02.04.41.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 02 Mar 2016 04:41:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@linaro.org
Received: from localhost ([::1]:56065 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ab65j-0003u3-1o
	for alex.bennee@linaro.org; Wed, 02 Mar 2016 07:41:23 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ab65g-0003sO-Rg
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 07:41:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ab65g-0004XB-0m
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 07:41:20 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:35198)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ab65f-0004Ww-Sg
	for qemu-arm@nongnu.org; Wed, 02 Mar 2016 07:41:19 -0500
Received: by mail-vk0-x232.google.com with SMTP id e6so199701986vkh.2
	for <qemu-arm@nongnu.org>; Wed, 02 Mar 2016 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2++iNLz2Yt5d9ldr5ZWug2jPugIFv3vRS0GjFoNqAZI=;
	b=WKHzPT7eYZtkCmd8J85xfBN1pf5K6NsY7KbBb6/s8blgJlwNmRHXKUXSczqh7wSLZE
	XHoybKFOmpd214jcx4KNJLiEN1jqglVKYE2/rdFk+BrmN5OSjpto5FjJtMFfxyQjyjFi
	wQHwadgh8MFh9iOxZxcKyOpInEjM4E5lD/guI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2++iNLz2Yt5d9ldr5ZWug2jPugIFv3vRS0GjFoNqAZI=;
	b=BRjtx7kQH6jtENs8JxvqgX5xeZGZ9f2GlD41KL20hmdAM+UJaDRPQWYgiBP6EOZNsa
	4oQoDVzx0v1FlqYgziBuLFMB1ax2lHTNdtOcm0xNthVMTeLCMkvqlksy5yVCDHqSt0SM
	ODbAY5jn4eVb+AwMHC4r3FQ2iX2iPgUu/z5F7xv3MgfZR6wMfQgMvz4Q3Mak7vpYcvlK
	R+x6CyeAw2DWW+MLmhuaF43EuSVzPy3MRUOutg+aynTLQy8G+W+aNgEKDWBitvBZ4+NZ
	NtubJ22r1TJxyZBRK1CSuQoOi6SJRxb+grXn0qxIRWTwcg+JSL5DeRZ+3FP0sxnPdefK
	xBUg==
X-Gm-Message-State: AD7BkJJNFBP/pvT2pe8y38F5TfqYNZZa+AQsyen1cQSukNjT9hyGVUg3RYpQikfofaeD8Zlii7hZNgQGsqsSdaJJ
X-Received: by 10.31.141.2 with SMTP id p2mr20240969vkd.37.1456922479435; Wed,
	02 Mar 2016 04:41:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 2 Mar 2016 04:41:00 -0800 (PST)
In-Reply-To: <1456880983.32556.41.camel@aj.id.au>
References: <1455622497-25966-1-git-send-email-andrew@aj.id.au>
	<1455622497-25966-3-git-send-email-andrew@aj.id.au>
	<CAFEAcA-9BBUuLdKc8--VTw8HXYE=vwZmQSFOz_eqN75n6pNdbA@mail.gmail.com>
	<1456880983.32556.41.camel@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Mar 2016 12:41:00 +0000
Message-ID: <CAFEAcA8g8D1+2c7H1_ciUCg2doxmfxN3jH-k+iidC3JPCQ2QWQ@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: openbmc@lists.ozlabs.org, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 2/3] hw/intc: Add (new) ASPEED AST2400
 AVIC device model
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: /wYSNQnuifGV

On 2 March 2016 at 01:09, Andrew Jeffery <andrew@aj.id.au> wrote:
> Hi Peter,
>
> On Thu, 2016-02-25 at 16:29 +0000, Peter Maydell wrote:
>> On 16 February 2016 at 11:34, Andrew Jeffery <andrew@aj.id.au> wrote:
>> > +#define AVIC_L_MASK 0xFFFFFFFF
>>
>> This needs a 'U' suffix or at least one of the compilers we build
>> with will complain.
>
> Okay. Out of interest, what compiler will complain?

Ancient gcc 4.2. (Actually I've now dropped that from the testing
set, but I still tend to recommend U suffixes in review.)

thanks
-- PMM
