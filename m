Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp570663wrt;
        Tue, 25 Sep 2018 04:48:15 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62iiUBSbAm26+1ngZ79Qps2zJNhPgp/7yCfxQSMHHrhFq+b8219EBWT0Pr5YbO2S5YYeISW
X-Received: by 2002:ac8:2ea1:: with SMTP id h30-v6mr409126qta.135.1537876095840;
        Tue, 25 Sep 2018 04:48:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537876095; cv=none;
        d=google.com; s=arc-20160816;
        b=Nv9an5Uv1Nu6PyojPc9F1Ph5zGntoFQWiIDnKgexDOw/v1FivAgyKVaDTjIHNizwxW
         +HhG6W6R8cV4nhiE01Cjn2dyAdxP7ul4kZyaISSY5+RBBmbe2OCWpDKVHf37gBF5iBLp
         XQo10Gz+a8XDaaI67cko/8Ar0ScM0mwaGjy4mdrgNlJBcophRkcVdOrnNnNjH1mAjCl8
         +iyHZQeJpjTReuodq/8a3xBwYULfiZTT0+xRI3ZrjK8T2j/sytdOX8Uv4FoMqcMzRP1P
         hGs/twSGfPCFPb4FlXSu2G+plfiUq3vh30xS7hajDSzw6IC82j8QRUvmBtlCBconaD2r
         pHZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :dkim-signature:dkim-signature;
        bh=poc1u9/zxrKP6SDsGFdDwpBkvKrMqpZkuCmgOn5Agws=;
        b=0Vw7Yj5Hyku3NkmEFw4lstztZ44ZFBrP6R0tP6oo2e+aGuw9Zr9zURR1vqkOZ38ybJ
         RBeUDUDJfciodtGFR2Tbrm9phsgyxB2OC56HPbEP0fKM34MM5eVfXwY1J5eO5l401s3B
         77YGXE2tEMQdpTY+wy4apVZ3O5mNhszwALid6oAMBaBgk2jrmCIc0UgQoCPV7LS6GCn/
         jdDMEHk/ZQbQTXmQFSt8cBJEiqf91YC6emAyjqvFCDcokdYKo3bawv3Nru7go1+VSYxf
         +H1DL99t5fjgWxfAr8yK+07YxSWNnosHItE2kZdi38JsanKB/RPUFMdSNYsYIMreQ9QI
         zebA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="syS/Gewr";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=EpqUDjYo;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=EpqUDjYo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7-v6si1584718qvi.101.2018.09.25.04.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 04:48:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b="syS/Gewr";
       dkim=fail header.i=@greensocs.com header.s=mail header.b=EpqUDjYo;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=EpqUDjYo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52401 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4lp9-0003pP-Cy
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 07:48:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g4lp2-0003dH-BP
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 07:48:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g4loz-00051B-04
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 07:48:08 -0400
Received: from greensocs.com ([193.104.36.180]:38104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g4loy-0004zr-Fx; Tue, 25 Sep 2018 07:48:04 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B2E3D443555;
	Tue, 25 Sep 2018 13:47:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537876076;
	bh=JGPPrTIG+5GM7YY0Hhd/IIfT4ZVW9hrHgrJXFU0fDzM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=syS/Gewrx9kybuTDiE1wEAL6HDTEcQMWWNMmqt83vA3uRZlyhICoRwhKiTaxvJ5jz
	1xkovvij7AQL96GNvfwpdavTneFfXFlZ2H823uEl7qhE/nZbrQc1KWU+Cw0gLd0bom
	yIE+8aOfaHnJy9Ilnxl8C5A+XJfSvg+Z2i7TjDbc=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=EpqUDjYo;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=EpqUDjYo
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhvhBngHFbRs; Tue, 25 Sep 2018 13:47:55 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id CE545238705; Tue, 25 Sep 2018 13:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537876075;
	bh=JGPPrTIG+5GM7YY0Hhd/IIfT4ZVW9hrHgrJXFU0fDzM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=EpqUDjYo8FuSaxKnjD9iumuEcik0cASyZA7Xz7eiqQplZFjdlMcnh8Cqs9OAAsDwd
	Cdoc45RmPol35NKRwm8Ze41Mn+Jkf5TOjk0nk4b+SHfW64fW+pty7Rl7Jnty/KDX5n
	X0AXUOU84f/lCmKSOWXktk6RHztYW82iftwQTOfA=
Received: from [172.16.10.171] (antfield.tima.u-ga.fr [147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 696F8E0878;
	Tue, 25 Sep 2018 13:47:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537876075;
	bh=JGPPrTIG+5GM7YY0Hhd/IIfT4ZVW9hrHgrJXFU0fDzM=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To;
	b=EpqUDjYo8FuSaxKnjD9iumuEcik0cASyZA7Xz7eiqQplZFjdlMcnh8Cqs9OAAsDwd
	Cdoc45RmPol35NKRwm8Ze41Mn+Jkf5TOjk0nk4b+SHfW64fW+pty7Rl7Jnty/KDX5n
	X0AXUOU84f/lCmKSOWXktk6RHztYW82iftwQTOfA=
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
	<20180917084016.12750-6-damien.hedde@greensocs.com>
	<CAFEAcA95f0VNWSJf9GFXn791sp3Z5QmYEycm7VUsuwVhSMFPMg@mail.gmail.com>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <19d468c3-0f28-c178-1f5e-ac547bee02bf@greensocs.com>
Date: Tue, 25 Sep 2018 13:47:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA95f0VNWSJf9GFXn791sp3Z5QmYEycm7VUsuwVhSMFPMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 05/10] docs/clocks: add
 device's clock documentation
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bZsiKzVmsbJi



On 9/25/18 11:36 AM, Peter Maydell wrote:
> On 17 September 2018 at 09:40,  <damien.hedde@greensocs.com> wrote:
>> From: Damien Hedde <damien.hedde@greensocs.com>
>>
>> Add the documentation about the clock inputs and outputs in devices.
>>
>> This is based on the original work of Frederic Konrad.
>>
>> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> 
> I thought I might as well review the docs changes, since they're
> a good overview of the API. I have one or two semantic changes
> to suggest, a few function name alterations and some minor typo
> fixes below.

I've only kept the parts I'm responding to. I'll do the suggested name
changes.

> 
>> ---
>>  docs/devel/clock.txt | 144 +++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 144 insertions(+)
>>  create mode 100644 docs/devel/clock.txt
>>
>> diff --git a/docs/devel/clock.txt b/docs/devel/clock.txt
>> new file mode 100644
>> index 0000000000..d018fbef90
>> --- /dev/null
>> +++ b/docs/devel/clock.txt
>> @@ -0,0 +1,144 @@
>> +
>> +Adding clocks to a device
>> +=========================
>> +
>> +Adding clocks to a device must be done during the init phase of the Device
>> +object.
>> +
>> +To add an input clock to a device, the function qdev_init_clock_in must be used.
>> +It takes the name, a callback, and an opaque parameter for the clock.
>> +output is more simple, only the name is required. Typically:
> 
> "Output"
> 
>> +qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback, dev);
>> +qdev_init_clock_out(DEVICE(dev), "clk-out");
>> +
>> +Both functions return the created CLOCK_IN/OUT pointer. For an output, it should
>> +be saved in the device's state structure in order to be able to change the
>> +clock. For an input, it can be saved it one need to change the callback.
> 
> I think we should just simplify this to say that "pointer, which should be
> saved in the device's state structure."
> 
> (Is freeing of the allocated memory handled by the usual
> QOM reference-counting ?)

Yes. I will add a note to signal not to worry about that.

> 
>> +
>> +Changing a clock output
>> +=======================
>> +
>> +A device can change its outputs using the clock_set function. It will trigger
>> +updates on any connected inputs.
>> +
>> +For example, let's say that we have an output clock "clkout" and we have pointer
> 
> "a pointer to it"
> 
>> +on it in the device state because we did the following in init phase:
>> +dev->clkout = qdev_init_clock_out(DEVICE(dev), "clkout");
>> +
>> +Then at any time, it is possible to change the clock value by doing:
>> +ClockState state;
>> +state.frequency = 1000 * 1000 * 1000; /* 1MHz */
>> +clock_set(dev->clkout, &state);
> 
> 
> This seems a bit indirect. Why doesn't clock_set() just take the
> frequency as a direct argument ?

The structure ClockState is here because it contains 2 fields (frequency
value and reset flag).
Since I am removing the reset, I can replace ClockState pointer by the
frequency integer as you say.

> 
>> +
>> +Outputs must be initialized in the device_reset method to ensure every connected
>> +inputs is updated at machine startup.
> 
> device_reset should not set outputs.

How do the initialization then ?
Only alternative I see is to initialize a clock input when it is
connected to an output.

If device_reset does not set outputs (which are a direct consequence of
a internal device state being reset). It means calling device_reset at
any other point than simulation startup will break things. Is that the
semantic behind device_reset ?

> 
>> +
>> +Callback on input clock change
>> +==============================
>> +
>> +Here is an example of an input callback:
>> +void clock_callback(void *opaque, ClockState *state) {
>> +    MyDeviceState *s = (MyDeviceState *) opaque;
>> +    /*
>> +     * opaque may not be the device state pointer, but most probably it is.
>> +     * (It depends on what is given to the qdev_init_clock_in function)
>> +     */
>> +
>> +    /* do something with the state */
>> +    fprintf(stdout, "device new frequency is %" PRIu64 "Hz\n",
>> +                    clock_state_get_frequency(state));
>> +
>> +    /* optionally store the value for later use in our state */
>> +    clock_state_copy(&s->clkin_shadow, state);
> 
> 
> This seems odd to me. Why do we have a clock_state_copy() at all?
> The input end of a device has a pointer to the input end of the
> clock, and there should just be a function for "what is the current
> frequency of this CLOCK_IN ?".
> 
> The callback function should probably be passed a parameter
> which is the CLOCK_IN it corresponds to, not an arbitrary
> ClockState. (I'm not sure how useful the ClockState struct is.)
> 

Right now, there is no clock state in the input end and in consequence
no way to have current frequency. Hence, if one wants to access the
frequency later on, he has to save it himself.

Since we're talking to add the state in the clock object to handle the
migration, the copy function become useless too and we may also drop the
ClockState pointer argument because we will be able to request the
current frequency.

Thanks
--
Damien
