Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp64755lfc;
        Mon, 2 Dec 2019 07:18:11 -0800 (PST)
X-Google-Smtp-Source: APXvYqx7QlKH5BzRS8OJyJx5dQNjl3FriZ9ic9QYz+uvv4LKq6IH2GX90nFA0T2DV8Q+qzSn/zsF
X-Received: by 2002:a17:906:c357:: with SMTP id ci23mr7890581ejb.283.1575299891472;
        Mon, 02 Dec 2019 07:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575299891; cv=none;
        d=google.com; s=arc-20160816;
        b=yzoEYHry3S1vW21hzoOkd8FHI6ZFkdwjJG5fQtYLvP/zxnUzI3vgqrQQxVjcNAKb/Y
         /YQ4B89rrS06jDFroj8y4n7GCoHthEet6J6a54SOVzKNqUsUdVyCju8CtJo5408BotyW
         yEmjHRS2BH4GCH/awQbmrDRGm66juoCBrxaMLyevkel0LYPw21knwxA29NYTYSrL102L
         BcE/aWzknphD+DkuxOH9zN1Lz6B1yA/6JdoHvcco2krbjcgUQKeCMPca7OVXDELjTJSS
         wrnJczcdJ/rpVMM9NrbVgMACBCIVm98AtLb6Fk6GsOOQEkEyS8IFOuiZaM4EneoiPE8e
         RPGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AyEE6rm28fohnOjDpM5iW4SydDnsLq70FLgX6leZw3U=;
        b=umQc2ZxNnSPt9W4pBYBEmRC98qImsGmLxEj9TGCBXRox9oTIewa6157JoZLD1GZjXG
         gLs863q9/5Fg0eEwTnoOh6pLAG/i1DY3a1QXAvB663qyd0acdfdp3ndH9lepxNKcVvmr
         Q66mbrZr4p81r5adMOl2iwrOV/lI7wGjTNwVfmYIHN8y9Y53UQWb8lEbfEAZnkDcfQJ1
         /6pRsmXzMSdyi23RCA42ncbGq4DjLea/Vw3dCNprq5W5VUv+18u0RPCfy4/JHEJ3TdRX
         U7rFPLIuQ+XFKvnZNtGSkwtMqvgI0ZngKJj5Uf5sJsZXCJ41lSiHbSaDq3/KnBR0tVLa
         7/Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ASCeWhO/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x12si6956245eds.6.2019.12.02.07.18.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2019 07:18:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ASCeWhO/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ibnSk-0000dO-ET
	for alex.bennee@linaro.org; Mon, 02 Dec 2019 10:18:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45019)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ibnSY-0000cc-3G
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 10:17:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ibnSW-0005uH-NC
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 10:17:57 -0500
Received: from mail-io1-xd43.google.com ([2607:f8b0:4864:20::d43]:38006)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ibnSW-0005tO-Gh
 for qemu-arm@nongnu.org; Mon, 02 Dec 2019 10:17:56 -0500
Received: by mail-io1-xd43.google.com with SMTP id u24so39199959iob.5
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2019 07:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AyEE6rm28fohnOjDpM5iW4SydDnsLq70FLgX6leZw3U=;
 b=ASCeWhO/c0PXzxb1EKZ9JwisA4d7avcb5i9V5AUNEiX3VKJ4JWHl4cFir95re3yO8+
 j7GHk0haozWM7Z0K5TnQ1mjIEcyHnEzpP6gK2b5aeKXKwuUPs+h6Ij9qSzBoo3qFRTAW
 fr6HzKEULDWo6RH/jeRDPITxHpxQKfDuuVAFGvEIzQ96PHw8b1r43vaG/gQQvrnyauTY
 3Jwrgp9XTy5K5w5Npr+cZiLcavABnToS1RXPuLg8A5Q796xBK3Sr/heS6oVbGSSPTM2M
 1sjI59r3B+8hFF+WxS6GyviP1ogc3FlA8UpOWr4fK35JulrW62c/4Z4mTK5542KjiZYi
 Olhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AyEE6rm28fohnOjDpM5iW4SydDnsLq70FLgX6leZw3U=;
 b=T2wO4yNqKwsSlm1vGeD0te0wASM+yo3fzso0cIzVufuZ6FtEjKVfjKvWZqnQ4ojii7
 gfqn7yPH8oEh9N4ceqKJ5dpxqfuQ3H+1RsGoyO/cEg5JjmBoJnL8ntmeH0IC8UPiWwuM
 yUohS2NsxWUpMlkerP/QHZmTEhCzPdKa1xzYnae5hbLH01acD3kdswU6bfAdFCnCVVsu
 bFDOl0SdUDHDsw6OaAX6Njkt/1IvkltUFxUG4ik0sbWaTn9OLxAVcd5VIMWJP6abutAp
 lFW5x9sLvmR2eQ506ErO2DYB3fIBJLGw1FApIWcRPeNCeeyooURTPUd2HLtSHAKMce0q
 kNMA==
X-Gm-Message-State: APjAAAUpQiyfFyV26Og8/PumSzkYGvgRNfwUvrz3toMpeqnC4+Ux9PB4
 JfhfjDrakHXZk3AHr36kv2enUYchFLGhWQRx9rcd+A==
X-Received: by 2002:a02:a148:: with SMTP id m8mr26271758jah.69.1575299875215; 
 Mon, 02 Dec 2019 07:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20190904125531.27545-1-damien.hedde@greensocs.com>
 <20190904125531.27545-7-damien.hedde@greensocs.com>
In-Reply-To: <20190904125531.27545-7-damien.hedde@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Dec 2019 15:17:43 +0000
Message-ID: <CAFEAcA-N=pBSMrALSYTHFFk4K=G+Zv_BO0ytF1FBS_PG6WMr2w@mail.gmail.com>
Subject: Re: [PATCH v6 6/9] docs/clocks: add device's clock documentation
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::d43
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Mark Burton <mark.burton@greensocs.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JRSBTrEb2u/r

On Wed, 4 Sep 2019 at 13:56, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Add the documentation about the clock inputs and outputs in devices.
>
> This is based on the original work of Frederic Konrad.
>
> Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
> ---
>  docs/devel/clock.txt | 246 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 246 insertions(+)
>  create mode 100644 docs/devel/clock.txt

Could you convert this to rst format, please?



> +Changing a clock output
> +=======================
> +
> +A device can change its outputs using the clock_set_frequency function. It
> +will trigger updates on every connected inputs.

"input"

> +
> +For example, let's say that we have an output clock "clkout" and we have a
> +pointer to it in the device state because we did the following in init phase:
> +dev->clkout = qdev_init_clock_out(DEVICE(dev), "clkout");
> +
> +Then at any time (apart from the cases listed below), it is possible to
> +change the clock value by doing:
> +clock_set_frequency(dev->clkout, 1000 * 1000 * 1000); /* 1Ghz */
> +This operation must be done while holding the qemu io lock.
> +
> +One can change clocks only when it is allowed to have side effects on other
> +objects. In consequence, it is forbidden:
> ++ during migration,
> ++ and in the init phase of reset.
> +
> +Forwarding clocks
> +=================
> +
> +Sometimes, one needs to forward, or inherit, a clock from another device.
> +Typically, when doing device composition, a device might expose a sub-device's
> +clock without interfering with it.
> +The function qdev_pass_clock() can be used to achieve this behaviour. Note, that

"Note that"

> +it is possible to expose the clock under a different name. This works for both
> +inputs or outputs.

"inputs and outputs"


> +Migration
> +=========
> +
> +Only the ClockIn object has a state. ClockOut is not concerned by migration.

"has any state".

"ClockOut has no state and does not need special handling for migration."

> +
> +In case the frequency of in input clock is needed for a device's migration,
> +this state must be migrated.

Are you trying to say that if an input clock is known to be a
fixed frequency we don't need to migrate anything? I wonder
if we need to worry about that or if we could/should just say that
input clocks should always be migrated.

> The VMSTATE_CLOCKIN macro defines an entry to
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

thanks
-- PMM
