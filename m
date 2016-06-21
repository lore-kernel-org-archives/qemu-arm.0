Received: by 10.25.21.96 with SMTP id l93csp1793123lfi;
        Mon, 20 Jun 2016 23:57:48 -0700 (PDT)
X-Received: by 10.233.239.18 with SMTP id d18mr28418269qkg.41.1466492268653;
        Mon, 20 Jun 2016 23:57:48 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id q40si1885850qkh.175.2016.06.20.23.57.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Jun 2016 23:57:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49226 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFFd6-00014O-8c
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 02:57:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFFcD-0000hV-Pn
	for qemu-devel@nongnu.org; Tue, 21 Jun 2016 02:56:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFFc9-0000j8-EE
	for qemu-devel@nongnu.org; Tue, 21 Jun 2016 02:56:50 -0400
Received: from mail-vk0-x233.google.com ([2607:f8b0:400c:c05::233]:33708)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFFc9-0000j2-0f
	for qemu-devel@nongnu.org; Tue, 21 Jun 2016 02:56:49 -0400
Received: by mail-vk0-x233.google.com with SMTP id d185so8733030vkg.0
	for <qemu-devel@nongnu.org>; Mon, 20 Jun 2016 23:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oc4Imd9lN9Xsa08SirSz1cO6SkpmTSVBOEexqmLFrDo=;
	b=I9r6oVuktUAg7nDa+Q0OvIlJYjZX+te4sbnUUE12X/bWpLXIxKiUcmnLyffEyc+gdw
	9BXwIfyQMFbqSlOYkl9j9f9NPrkcoiE06UpFVTpqBPicQND2i/bnIv0SI7nkOh6tqHfq
	kvJQ/6FbkdZtcCjLt5pkCQaqju6dpwpiMC5QA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oc4Imd9lN9Xsa08SirSz1cO6SkpmTSVBOEexqmLFrDo=;
	b=dAMOlWNOE1gwtGlWkeSuTSD3LEkNen54HnPRw4tk5P4mD+sSY492Ee84wXziNVVtMV
	MJBxxViLVJtv62e/iwYhvrg4y9puBj1unuQYvB9+H9g3dlP507sTFzs4d5o2vmpWs0qE
	kL57SoHn+itiZypiMDX907uULAPDj1zg9AFwOZTHBw40h+jfBJQivNzI/Fnw/49OGxC2
	YdCaQcTFS0AEZhEfryHoEej2eXgUuBNkJ5x2uyAe76F4Yt8mChxywQwlYtbq57/M2gc2
	1oVz2yPISxo8UKpvMBbiflMYA1VEiJRx1mf9Gy0ZCd+W36N0lHUdPXK+CESfHdaxrIjX
	2yTQ==
X-Gm-Message-State: ALyK8tJw/mOFVhaIV5EFrjZAanN4WY/vPdM/dMEsymV4DsC1Qoux9mEGIXblfcW8kYNJjwMe/Awuhl+RPJWaDe2H
X-Received: by 10.31.15.20 with SMTP id 20mr8733999vkp.82.1466492208385; Mon,
	20 Jun 2016 23:56:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.193.141 with HTTP; Mon, 20 Jun 2016 23:56:28 -0700 (PDT)
In-Reply-To: <1466480985.4344.50.camel@aj.id.au>
References: <1466063287-19350-1-git-send-email-andrew@aj.id.au>
	<1466063287-19350-2-git-send-email-andrew@aj.id.au>
	<CAFEAcA_-+nWvAsCLE71d4qb_3eFkF80L-JgZSxwF5L3CH+W_Aw@mail.gmail.com>
	<1466394273.4344.25.camel@aj.id.au>
	<CAFEAcA_=5Dvg9R1o67b-5MuMZWtWbobywA+XzKuR-TeTCWfN0Q@mail.gmail.com>
	<1466480985.4344.50.camel@aj.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2016 07:56:28 +0100
Message-ID: <CAFEAcA85mf8Rr+rKEm4x0aA3r4XNuRFwHEzXsUk4D-EEwO8WbA@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::233
Subject: Re: [Qemu-devel] [PATCH 1/2] hw/misc: Add a model for the ASPEED
 System Control Unit
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pc54+HNzLB/r

On 21 June 2016 at 04:49, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Mon, 2016-06-20 at 14:57 +0100, Peter Maydell wrote:
>> I think there are a couple of plausible ways you might model this:
>>
>> (a) just have a single property for "revision" which corresponds
>> to the revision of this bit of silicon IP within the SoC; the
>> model of the device itself then knows what the reset state is
>> for this revision of the device.
>> (b) ditto, but also have some configurable flags where relevant
>> (ie approximately where it's the same IP rev within the SoC
>> but it's been configured by tying down different config lines;
>> for instance hw/dma/pl330.c has a collection of properties
>> which match the configurable knobs for the hardware.)
>
> Okay. I think (b) is the most appropriate. The board-controllable bits
> are primarily in the hardware strapping register. The register is
> composed of fields of mostly unrelated bits, so we could go two ways
> here:
>
> (1) expose the register through a single 32bit property
> (2) break out a property for each bitfield
>
> Do you have a preference? grepping the tree suggests there isn't a
> precedent for "large" numbers of properties* so maybe (2) is overkill,
> but (1) feels like it might fit into the overly-general-interface
> problem that we're trying to eliminate.
>
> * Seems the microblaze CPU defines the most with 9 properties?

(You forgot '-n' on your sort rune.)
hw/dma/pl330.c has 15.

> Approach (2) will leave us with 21 properties for the SCU.

What would the 21 properties be in this case?

But yes, a single 32 bit property would probably be better.

thanks
-- PMM
