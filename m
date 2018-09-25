Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp461813wrt;
        Tue, 25 Sep 2018 02:51:32 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60+BoYosPw7zmmY/WEb5DNSTR0aHO/i7WQ2GtTRLTGVRXeAofaJdL8+LOzx+hox28/a5R2C
X-Received: by 2002:a37:24c9:: with SMTP id k70-v6mr130523qkk.35.1537869091991;
        Tue, 25 Sep 2018 02:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537869091; cv=none;
        d=google.com; s=arc-20160816;
        b=xWjn1DYQJVCe1l4QxMzjYNtTwWSOkD5hzCQgqmcl0X0Z2droa2khqF5ODqkCvqoBwP
         Q6j9L+FwGndDuDVmkcqI0ZLYOnThTdqe9jnbPE4Cz/EJv0j4GFPDypBRHLro9R37BzH2
         DybubbzyaEcKyeom6mK90MpdROAj6NbzXfWWwJpiZb3156FI1AVHNWD43z9BrVMuAw9g
         UWe4lmJKY2t8N7IFzNo3giEPcA28SdwF07vy6kQMXp5LU34X7dzga1A6ZDAHwji7pGmc
         78r+KUusa+B/cQezozV9kiXGIBPo5LE9Eb8/1nfrkYtmm3kgL0UJJYJpEdVbxfzdJD2l
         DRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=7NvOBLQig9Im/AZuKseaNZ8AR4MJOumhsbMJWn73xrE=;
        b=fT/0lp+kXT6bDi45UHrKAX1fpu2A/GaaFM9FbLVB55ox4qQ/QFNJC/3jSv2ssNZ7nU
         bZE5H1Na2Yf4ybwUK57tQnAhVS8XdF9zMj1VJ8cU+wFh+ltcQljZxjLLO8c0zH291gFP
         2H1a5xDP/PCc4INr/v93dvpoTvxaK1kZ9YC63MciNFKs6ycEntHwJdmgIM9DGqJmugjH
         fHlp5IAXcUyIFgq9Ols+pZro/9f0ppAoadQ5JGzdZO4VE9xThme1BXQ94znrPJ6EeTGI
         ZhqwVsXLBdP7AyURANLn8UkZHKQBxTJznlWwiItANjEeJocC9FifVIsNcjE8Cb82HG37
         xO6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I0O0GdFL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w25-v6si1423760qts.389.2018.09.25.02.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 02:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I0O0GdFL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51913 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4k0B-000882-Ax
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 05:51:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58770)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4jza-0007VR-1a
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 05:50:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4jlt-0008GA-LI
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 05:36:48 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46884)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4jlt-0008CF-C4
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 05:36:45 -0400
Received: by mail-ot1-x341.google.com with SMTP id q4-v6so10554859otf.13
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 02:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7NvOBLQig9Im/AZuKseaNZ8AR4MJOumhsbMJWn73xrE=;
	b=I0O0GdFLDrn14E8W15NDz4WzA/L+n5zWoCgbRwszj3hkn0UImPXgZwLwGD9wM+w/mm
	HuLQZNgO4aLXoUy2J2ILHjvAmCAdQcJIECWfWVUuxJsmY0HHfLF3ESA00NpgZNoBWMWu
	dQG8IGD/Mc/gNavbNZl1FdcAeQKOOjQS/ZpnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7NvOBLQig9Im/AZuKseaNZ8AR4MJOumhsbMJWn73xrE=;
	b=mM+qLY3d1uaLnYPNq7bu91qYckNt1KtwSlylm2zeIlR98L5Z8+2QyLPrjEcGYlIV2a
	N51Oa3hlx57tIYrpttMgcaWiVDQYXZW5N396dFvIoVTDyn2TvI8RTr+RzFsoeXofk/gq
	GsQ0EOAZFJjIxX5FxFC4S4+CtREu87SczWmU8qn+R2pVzomNunj/r5X6j0WSufG8gq0o
	u15ka+fzCWO7PAkmaTW7xloHpqIYbaU3R28mTCruuu+2QKVpyFxVKfaELYCh21WkXxkS
	4w07t7VqMARhI/0hrN+4Ib1g23qcPmg+RXFhowQOqu4hnAslkUAl/pF7ZWKKGc+75ITO
	2i0g==
X-Gm-Message-State: ABuFfoiiD7QsHVHaELYnOjIkJNiPoAVq8mC81aO8XfybulObaQOkjc9v
	UvtMEeVnPBrxkoYJDxsquJ1YQWpoN86SfjKyjHnnuA==
X-Received: by 2002:a9d:59c5:: with SMTP id u5-v6mr116827otg.332.1537868203288;
	Tue, 25 Sep 2018 02:36:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 02:36:22
	-0700 (PDT)
In-Reply-To: <20180917084016.12750-6-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
	<20180917084016.12750-6-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 10:36:22 +0100
Message-ID: <CAFEAcA95f0VNWSJf9GFXn791sp3Z5QmYEycm7VUsuwVhSMFPMg@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v4 05/10] docs/clocks: add device's clock
 documentation
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KMZjFS5QIp55

On 17 September 2018 at 09:40,  <damien.hedde@greensocs.com> wrote:
> From: Damien Hedde <damien.hedde@greensocs.com>
>
> Add the documentation about the clock inputs and outputs in devices.
>
> This is based on the original work of Frederic Konrad.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>

I thought I might as well review the docs changes, since they're
a good overview of the API. I have one or two semantic changes
to suggest, a few function name alterations and some minor typo
fixes below.

> ---
>  docs/devel/clock.txt | 144 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 144 insertions(+)
>  create mode 100644 docs/devel/clock.txt
>
> diff --git a/docs/devel/clock.txt b/docs/devel/clock.txt
> new file mode 100644
> index 0000000000..d018fbef90
> --- /dev/null
> +++ b/docs/devel/clock.txt
> @@ -0,0 +1,144 @@
> +
> +What are device's clocks
> +========================
> +
> +Clocks are ports representing input and output clocks of a device. They are QOM
> +objects developed for the purpose of modeling the distribution of clocks in
> +QEMU.
> +
> +It allows to model the clock distribution of a platform and detect configuration

"This allows us to model"

> +errors in the clock tree such as badly configured PLL, clock source selection or
> +disabled clock.
> +
> +The objects are CLOCK_IN for the input and CLOCK_OUT for the output.
> +
> +The clock value: ClockState
> +===========================
> +
> +The ClockState is the structure carried by the CLOCK_OUT and CLOCK_IN objects.
> +
> +It actually contains two fields:
> ++ an integer representing the frequency of the clock in Hertz,
> ++ and a boolean representing the clock domain reset assertion signal.
> +
> +It only simulates the clock by transmitting the frequency value and
> +doesn't model the signal itself such as pin toggle or duty cycle.
> +The special value 0 as a frequency is legal and represent the clock being
> +inactive or gated.
> +
> +Reset is also carried in the structure since both signals are closely related.
> +But they remain value-independent, the frequency can be non-zero and the reset
> +asserted as well as the opposite.
> +
> +Adding clocks to a device
> +=========================
> +
> +Adding clocks to a device must be done during the init phase of the Device
> +object.
> +
> +To add an input clock to a device, the function qdev_init_clock_in must be used.
> +It takes the name, a callback, and an opaque parameter for the clock.
> +output is more simple, only the name is required. Typically:

"Output"

> +qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback, dev);
> +qdev_init_clock_out(DEVICE(dev), "clk-out");
> +
> +Both functions return the created CLOCK_IN/OUT pointer. For an output, it should
> +be saved in the device's state structure in order to be able to change the
> +clock. For an input, it can be saved it one need to change the callback.

I think we should just simplify this to say that "pointer, which should be
saved in the device's state structure."

(Is freeing of the allocated memory handled by the usual
QOM reference-counting ?)

> +
> +Note that it is possible to create a static array describing clock inputs and
> +outputs. The function qdev_init_clocks must be called with the array as
> +parameters to initialize the clocks: it has the same behaviour as calling the
> +qdev_init_clock/out for each clock.
> +
> +Forwarding clocks
> +=================
> +
> +Sometimes, one needs to forward, or inherit, a clock from another device.
> +Typically, when doing device composition, a device might exposes a sub-device's

"expose"

> +clock without interfering with it.
> +The function qdev_init_clock_forward can be used to achieve this behaviour.
> +Note, that it is possible to expose the clock under a different name.
> +This works for both inputs or outputs.
> +
> +For example, if device B is a child of device A, device_a_instance_init may
> +do something like this:
> +void device_a_instance_init(Object *obj)
> +{
> +    AState *A = DEVICE_A(obj);
> +    BState *B;
> +    [...] /* create B object as child of A */
> +    qdev_init_clock_forward(A, "b_clk", B, "clk");
> +    /*
> +     * Now A has a clock "b_clk" which forwards to
> +     * the "clk" of its child B.
> +     */
> +}
> +
> +This function does not returns any clock object. It is not possible to add
> +a callback on a forwarded input clock.

I suggest naming this function qdev_pass_clock():
 * it isn't doing the same thing qdev_init_clock_in/out do (which return
   a clock object)
 * this brings the name into line with the similar qdev_pass_gpios()

> +
> +Connecting two clocks together
> +==============================
> +
> +Let's say we have 2 devices A and B. A has an output clock named "clkout" and B
> +has an input clock named "clkin".
> +
> +The clocks are connected together using the function qdev_clock_connect:
> +qdev_clock_connect(B, "clkin", A, "clkout", &error_abort);

I suggest calling this qdev_connect_clock() (which then parallels
the existing qdev_connect_gpio_out*())

> +The device which has the input must be the first argument.
> +
> +It is possible to connect several input clock to the same output. Every

"clocks"

> +input callback will be called during the output changes.

"when"

> +
> +It is not possible to disconnect a clock neither to change the clock connection

"or", not "neither"

> +after it is done.
> +
> +Changing a clock output
> +=======================
> +
> +A device can change its outputs using the clock_set function. It will trigger
> +updates on any connected inputs.
> +
> +For example, let's say that we have an output clock "clkout" and we have pointer

"a pointer to it"

> +on it in the device state because we did the following in init phase:
> +dev->clkout = qdev_init_clock_out(DEVICE(dev), "clkout");
> +
> +Then at any time, it is possible to change the clock value by doing:
> +ClockState state;
> +state.frequency = 1000 * 1000 * 1000; /* 1MHz */
> +clock_set(dev->clkout, &state);


This seems a bit indirect. Why doesn't clock_set() just take the
frequency as a direct argument ?

> +
> +Outputs must be initialized in the device_reset method to ensure every connected
> +inputs is updated at machine startup.

device_reset should not set outputs.

> +
> +Callback on input clock change
> +==============================
> +
> +Here is an example of an input callback:
> +void clock_callback(void *opaque, ClockState *state) {
> +    MyDeviceState *s = (MyDeviceState *) opaque;
> +    /*
> +     * opaque may not be the device state pointer, but most probably it is.
> +     * (It depends on what is given to the qdev_init_clock_in function)
> +     */
> +
> +    /* do something with the state */
> +    fprintf(stdout, "device new frequency is %" PRIu64 "Hz\n",
> +                    clock_state_get_frequency(state));
> +
> +    /* optionally store the value for later use in our state */
> +    clock_state_copy(&s->clkin_shadow, state);


This seems odd to me. Why do we have a clock_state_copy() at all?
The input end of a device has a pointer to the input end of the
clock, and there should just be a function for "what is the current
frequency of this CLOCK_IN ?".

The callback function should probably be passed a parameter
which is the CLOCK_IN it corresponds to, not an arbitrary
ClockState. (I'm not sure how useful the ClockState struct is.)

> +}
> +
> +The state argument needs only to be copied if the device needs to use the value
> +later: the state pointer argument of the pointer will not be valid anymore
> +after the end of the function.
> +
> +Migration
> +=========
> +
> +State is not stored in clock input or output. A device is responsible for
> +setting its output clock correctly in the post_load function (using clock_set)
> +after its state has been loaded. This way, during the migration process, all
> +clocks will be correctly restored.
> --
> 2.18.0
>

thanks
-- PMM
