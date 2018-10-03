Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6011014wrt;
        Wed, 3 Oct 2018 01:19:02 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62tnKu/8P1bXlhQafJamM+BQ5LEahDbd9w2hJ+ziwH9v/G3Sc0mLSvu3vfnchzLWSZzMgvc
X-Received: by 2002:ac8:592:: with SMTP id a18-v6mr289755qth.184.1538554742195;
        Wed, 03 Oct 2018 01:19:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538554742; cv=none;
        d=google.com; s=arc-20160816;
        b=PYkW1C2mtR3miSsFE3ajcpNq6w7gUkiMNlXBsyUJSyEUTrFjf27Jaln6H7+g5a+5YO
         0GicX/ynjOwF7pKEhw+Mrg97+AxoLsja1EdBVZEsmUtf2AvOx+o+y7MZoLy9R5aeQJ9j
         12aVgHxpZkEYMDuhKWG6yswLtCDj1P0stdhX+sMgZfSANMpDYINuNiA+CFmIECUMGVO7
         lh887Ei25ukERSpLaFB05n/hvTTvCo/7rJItL7XOtzMvPlIDM5RV9WHWgHDPIyOLAukE
         O/In0HPxcfKIegteBXMJ94kdsNEtDgOXSyUvH/EhSO0b1EO+uIBi5K0fvXfAvCeWFpSM
         PuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=6CXXmaZrt5NBuklIS5GuOzJlPzDcDUAsy+8G5kTOP5A=;
        b=iFx8ntflSQztuZZ7Jsc2XtXFw8pkQw1KxF83cBTwWd+43V5G3UiI0JM8zqwFBSenK4
         YRap6pO2YoP+JPgQSfzpq7fzBXjjEn1vLDu5yL3zBCMSpQyEBxiukHY2N8BU4KaHPr6v
         8oi9u61trmGQOrnPW//ooMGuDlEQAoJ0G1Da5u67OcwVoWnyeCmlL/UQbE6W5MXzrs04
         a1L8FyhkaS68VPxl8n8geg8f7jALYtJAsM1sm0I27PB/XskGJzIQw9qMltY+cbfG2G76
         0kEkwR8EtYFHfiaieUG6A3xpovHRc2Y9VPqq2NEVwK1ElC6w4tq8KIp9ab76Q7bxkTYa
         tMVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l78-v6si411473qke.136.2018.10.03.01.19.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 03 Oct 2018 01:19:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47388 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7cN3-0007jh-MR
	for alex.bennee@linaro.org; Wed, 03 Oct 2018 04:19:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39238)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7cMo-0007hF-CN
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 04:18:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1g7cMh-0006S0-Vg
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 04:18:46 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35990)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1g7cMh-0006RU-LM
	for qemu-arm@nongnu.org; Wed, 03 Oct 2018 04:18:39 -0400
Received: by mail-wm1-f68.google.com with SMTP id a8-v6so668830wmf.1
	for <qemu-arm@nongnu.org>; Wed, 03 Oct 2018 01:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=6CXXmaZrt5NBuklIS5GuOzJlPzDcDUAsy+8G5kTOP5A=;
	b=topIM3dAzGjIsYqxmS4gIa7ArY76G+wKyPLC9R1CrJRiXAEjp0xAVs4hzYekD4w8tE
	DV8N7xEhLzAvUghM/XsmJskKqfjW4iUgrg/yl5ku859DzHoa2B8LRHnQkU+2OtabxSLT
	cI82WDJK0QVG5QYBEInrBfjxrSzBWVBuTQ7bwHR5CxWub4cmpBEEo8D3lTQfgThDQPFu
	EDOOqoldS+ly1ZS2GZx8ahEdH3nZxRSRDxVgkl30kJ+EGwyHpVE6JmiHetz5zOPsWKPV
	3IdRZ6mkjfiajY+DTcjKbO08cTmpHQyxilYfgHafC6gQOToQyUzDbG5p1Ovadlg7pXE2
	FVeA==
X-Gm-Message-State: ABuFfoiTLOeDiJl3xwrKyBItYdluuc7y3lx0qZdNB8NH0U5sJPYrNGn2
	GT//1PVowrp8eQszLxePd47A0Q==
X-Received: by 2002:a1c:7dd5:: with SMTP id
	y204-v6mr650899wmc.63.1538554718423; 
	Wed, 03 Oct 2018 01:18:38 -0700 (PDT)
Received: from [192.168.2.33] (26.red-83-32-208.dynamicip.rima-tde.net.
	[83.32.208.26]) by smtp.gmail.com with ESMTPSA id
	s1-v6sm612040wrw.35.2018.10.03.01.18.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Oct 2018 01:18:37 -0700 (PDT)
To: Damien Hedde <damien.hedde@greensocs.com>, qemu-devel@nongnu.org
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
	<20181002142443.30976-6-damien.hedde@greensocs.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1b469486-4807-12af-fd98-40c9d5d7cc7e@redhat.com>
Date: Wed, 3 Oct 2018 10:18:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <20181002142443.30976-6-damien.hedde@greensocs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 5/9] docs/clocks: add
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, pbonzini@redhat.com, konrad@adacore.com,
	luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ohmLwOv7+qFp

Hi Damien,

On 02/10/2018 16:24, Damien Hedde wrote:
> Add the documentation about the clock inputs and outputs in devices.
> 
> This is based on the original work of Frederic Konrad.
> 
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  docs/devel/clock.txt | 163 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 docs/devel/clock.txt
> 
> diff --git a/docs/devel/clock.txt b/docs/devel/clock.txt
> new file mode 100644
> index 0000000000..6dd8abdee6
> --- /dev/null
> +++ b/docs/devel/clock.txt
> @@ -0,0 +1,163 @@
> +
> +What are device's clocks
> +========================
> +
> +Clocks are ports representing input and output clocks of a device. They are QOM
> +objects developed for the purpose of modeling the distribution of clocks in
> +QEMU.
> +
> +This allows us to model the clock distribution of a platform and detect
> +configuration errors in the clock tree such as badly configured PLL, clock
> +source selection or disabled clock.
> +
> +The objects are CLOCK_IN for the input and CLOCK_OUT for the output.
> +
> +The clock value: ClockState
> +===========================
> +
> +The ClockState is the structure carried by the CLOCK_OUT and CLOCK_IN objects.
> +It contains one integer field representing the frequency of the clock in Hertz.
> +
> +It only simulates the clock by transmitting the frequency value and
> +doesn't model the signal itself such as pin toggle or duty cycle.
> +The special value 0 as a frequency is legal and represent the clock being
> +inactive or gated.
> +
> +Adding clocks to a device
> +=========================
> +
> +Adding clocks to a device must be done during the init phase of the Device
> +object.
> +
> +To add an input clock to a device, the function qdev_init_clock_in must be used.
> +It takes the name, a callback, and an opaque parameter for the clock.
> +Output is more simple, only the name is required. Typically:
> +qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback, dev);
> +qdev_init_clock_out(DEVICE(dev), "clk-out");
> +
> +Both functions return the created CLOCK_IN/OUT pointer, which should be saved
> +in the device's state structure.
> +
> +Theses objects will be automatically deleted by the qom reference mechanism.
> +
> +Note that it is possible to create a static array describing clock inputs and
> +outputs. The function qdev_init_clocks must be called with the array as
> +parameters to initialize the clocks: it has the same behaviour as calling the
> +qdev_init_clock/out for each clock in the array.

Can you add a simple example here?

> +
> +Unconnected input clocks
> +========================
> +
> +Unconnected input clocks have a default frequency value of 0. It means the
> +clock will be considered as disabled. If this is not the wanted behaviour,
> +clock_init_frequency should be called on the ClockIn object during device init.
> +For example:
> +clk = qdev_init_clock_in(DEVICE(dev), "clk-in", clk_in_callback, dev);
> +clock_init_frequency(clk, 100 * 1000 * 1000); // init value is 100Mhz
> +
> +Forwarding clocks
> +=================
> +
> +Sometimes, one needs to forward, or inherit, a clock from another device.
> +Typically, when doing device composition, a device might expose a sub-device's
> +clock without interfering with it.
> +The function qdev_pass_clock can be used to achieve this behaviour. Note, that
> +it is possible to expose the clock under a different name. This works for both
> +inputs or outputs.
> +
> +For example, if device B is a child of device A, device_a_instance_init may
> +do something like this:
> +void device_a_instance_init(Object *obj)
> +{
> +    AState *A = DEVICE_A(obj);
> +    BState *B;
> +    [...] /* create B object as child of A */
> +    qdev_pass_clock(A, "b_clk", B, "clk");
> +    /*
> +     * Now A has a clock "b_clk" which forwards to
> +     * the "clk" of its child B.
> +     */
> +}
> +
> +This function does not returns any clock object. It is not possible to add
> +a callback on a forwarded input clock.
> +
> +Connecting two clocks together
> +==============================
> +
> +Let's say we have 2 devices A and B. A has an output clock named "clkout" and B
> +has an input clock named "clkin".
> +
> +The clocks are connected together using the function qdev_connect_clock:
> +qdev_connect_clock(B, "clkin", A, "clkout", &error_abort);
> +The device which has the input must be the first argument.
> +
> +It is possible to connect several input clocks to the same output. Every
> +input callback will be called when the output changes.
> +
> +It is not possible to disconnect a clock or to change the clock connection
> +after it is done.
> +
> +Changing a clock output
> +=======================
> +
> +A device can change its outputs using the clock_set function. It will trigger
> +updates on any connected inputs.
> +
> +For example, let's say that we have an output clock "clkout" and we have a
> +pointer to it in the device state because we did the following in init phase:
> +dev->clkout = qdev_init_clock_out(DEVICE(dev), "clkout");
> +
> +Then at any time, it is possible to change the clock value by doing:
> +clock_set_frequency(dev->clkout, 1000 * 1000 * 1000); /* 1Mhz */
> +
> +Callback on input clock change
> +==============================
> +
> +Here is an example of an input callback:
> +void clock_callback(void *opaque) {
> +    MyDeviceState *s = (MyDeviceState *) opaque;
> +    /*
> +     * opaque may not be the device state pointer, but most probably it is.
> +     * (It depends on what is given to the qdev_init_clock_in function)
> +     */
> +
> +    /* do something with the new frequency */
> +    fprintf(stdout, "device new frequency is %" PRIu64 "Hz\n",
> +                    clock_get_frequency(dev->my_clk_input));
> +}
> +
> +The state argument needs only to be copied if the device needs to use the value
> +later: the state pointer argument of the pointer will not be valid anymore
> +after the end of the function.
> +
> +Migration
> +=========
> +
> +Only the CLOCK_IN object has a state. CLOCK_OUT frequency should not be set
> +in migration post_load.
> +
> +In case the frequency of in input clock is needed for a device's migration,
> +this state must be migrated. The VMSTATE_CLOCKIN macro defines an entry to
> +be added in a vmstate description.
> +
> +For example, if a device has a clock input and the device state looks like:
> +MyDeviceState {
> +    DeviceState parent_obj;
> +    ClockIn *clk;
> +};
> +
> +Then, to add the clock frequency to the device's migrated state, the vmstate
> +description is:
> +VMStateDescription my_device_vmstate = {
> +    .name = "my_device",
> +    .fields = (VMStateField[]) {
> +        VMSTATE_CLOCKIN(clk, MyDeviceState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
> +When adding a input clock support to an existing device, you must care about
> +migration compatibility. To this end, you can use the clock_init_frequency in
> +a pre_load function to setup a default value in case the source vm does not
> +migrate the frequency.
> 
