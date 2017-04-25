Received: by 10.25.0.144 with SMTP id 138csp1790155lfa;
        Tue, 25 Apr 2017 03:07:12 -0700 (PDT)
X-Received: by 10.55.46.194 with SMTP id u185mr28080591qkh.168.1493114832879;
        Tue, 25 Apr 2017 03:07:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2si21467191qta.102.2017.04.25.03.07.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Apr 2017 03:07:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48125 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d2xNI-0002YR-Aq
	for alex.bennee@linaro.org; Tue, 25 Apr 2017 06:07:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42949)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d2xND-0002Wk-Me
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 06:07:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1d2xNC-0003rT-Js
	for qemu-arm@nongnu.org; Tue, 25 Apr 2017 06:07:07 -0400
Received: from mail-yb0-x22c.google.com ([2607:f8b0:4002:c09::22c]:35364)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1d2xN7-0003qh-EJ; Tue, 25 Apr 2017 06:07:01 -0400
Received: by mail-yb0-x22c.google.com with SMTP id p143so193299yba.2;
	Tue, 25 Apr 2017 03:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=sMYe2qo6crgfUyMJ49DfTS+xpX3oh+2q4wN2c8v/oNA=;
	b=B6UtZCdYCM5q92J7cZmSVzV2ZiIH3rOfKpaueJpZwUV3fUO3wgH9yLsshTjsgTvlU9
	cfRkRH1tKKVkII2pn2gGM/njZSb7Dm54o1nGznmL8ZrraEa6kc6gmGwC8rtPh+OMmknd
	P2bch5N2kN1atzm7C9CR1jymp/m2libyRSKKdtA7Tbk/iv7H0ffXsRiRfPM1BHrPFByy
	IUsxYAdQ3ruFQiUevb4RDLZJH7RBrfM196Be6p7uF8FcbbhTAuqgUynsyoFeGvZUTlBl
	rRV5s4NKuWwoAGq/9v+RokVRYEBE5CfV8HU6oZgk7K9k3Fc8wV8oqu07yjnKvtB0OO13
	/cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=sMYe2qo6crgfUyMJ49DfTS+xpX3oh+2q4wN2c8v/oNA=;
	b=Wgdxgfji2yFZGqlQNa/FjekwW62k6velisS9EVDHgiYNpfm0JGWVFylOF9nfWJlB39
	OBnANB2Vw3PP+JFjuPTjrPafp2DCp/OajsxKSFWEOrc5UKvfG2W8qNRsT3s0d8Y4gnvG
	cbOp42VhOgjqgMWrEHjAVyedxMtgvSpKdjtEXOiuwFLO7K3fO00O4H8jLf03nuS8U1Se
	wzoZlb080M0Q8ViKkNz0E1BjNsotpFSSg/Qkq3HJ/gjqz44rNEDcsu6svvxc8chKnqKz
	RE6jksd5k4wC2BT9SxNuusTCvw81VZsdd3c32bpwa9zKrpYjWO5AgNUNiZSO81YLKsQI
	8H6A==
X-Gm-Message-State: AN3rC/7MUFjCtr4FCt4ujOICeDhZFAOH2umU7uxExxbaSy4W11ExSq/6
	g4C9S+HqKyKrOrs+tjO3MlWrFAW0Ng==
X-Received: by 10.37.10.199 with SMTP id 190mr1814921ybk.142.1493114820806;
	Tue, 25 Apr 2017 03:07:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Tue, 25 Apr 2017 03:07:00 -0700 (PDT)
In-Reply-To: <CAFEAcA_PuC_B6GqL0n==SDZooQj9FtviHK3XixHd=m0Twmfp+A@mail.gmail.com>
References: <1491736758-19540-1-git-send-email-sundeep.lkml@gmail.com>
	<1491736758-19540-2-git-send-email-sundeep.lkml@gmail.com>
	<CAKmqyKMW-aTdzvTH5sir1BPx6U9XtgiZZ7TVigooXLFMY=UEQg@mail.gmail.com>
	<CALHRZuroavWhKmiZEC6eCh0KFif0dWuQWi=QprH122QnAGjnpA@mail.gmail.com>
	<CAKmqyKMT9Bn7OPU+h6o2Xj4DZXrVSBHr=jtR6jMSvhph0koegA@mail.gmail.com>
	<CAFEAcA_PuC_B6GqL0n==SDZooQj9FtviHK3XixHd=m0Twmfp+A@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Tue, 25 Apr 2017 15:37:00 +0530
Message-ID: <CALHRZuqSvd2-XH_QwUT9BRkjXnsu6=HoMB3QJZEkS5DRAjVZ-Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::22c
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel RFC v2 1/4] msf2: Add
 Smartfusion2 System timer
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W07L+R1md5/g

Hi Alistair and Peter,

On Mon, Apr 24, 2017 at 11:28 PM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 24 April 2017 at 18:44, Alistair Francis <alistair23@gmail.com> wrote:
>> Basically the simple explanation is that init is called when the
>> object is created and realize is called when the object is realized.
>>
>> Generally for devices it will go something like this:
>>  1. init
>>  2. Set properties
>>  3. Connect things
>>  4. realize
>>  5. Map to memory
>>
>>> Don't we need to use realize function for new models?
>>
>> AFAIK we still put things like: sysbus_init_irq(),
>> memory_region_init_io() and sysbus_init_mmio() in the init function.
>>
>> I don't think we are at a stage yet to not use init functions.
>
> Two-phase init is here to stay -- some things must be done in
> init, some must be done in realize, and some can be done in
> either. Some simple devices may find they can do everything
> in only one function.
>
> Must be done in init:
>  * creating properties (for the cases where that is done "by hand"
>    by calling object_property_add_*())
>  * calling init on child objects which you want to pass through
>    alias properties for
>
> Must be done in realize:
>  * anything that can fail such that we need to report the
>    error and abandon creation of the device
>  * anything which depends on the values of QOM properties that
>    the caller might have set
>
> We should probably sit down and write up some guidelines for
> how we recommend dealing with the various things that could
> be called in either function -- this is basically a code
> style and consistency question.

Thanks for the brief. It makes sense for me now.
I will make changes and send the patches.

Thanks,
Sundeep

>
> thanks
> -- PMM
