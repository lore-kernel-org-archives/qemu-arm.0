Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3297237lfy;
        Tue, 25 Aug 2020 03:08:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjz3M8vmwvVnuOZL8sRVvq3oVCEhiIs4R8FLjDoHOj+5NDjKQ7aLg1r3Xjon7q9SHk9n72
X-Received: by 2002:a25:d347:: with SMTP id e68mr13533707ybf.123.1598350093114;
        Tue, 25 Aug 2020 03:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598350093; cv=none;
        d=google.com; s=arc-20160816;
        b=uKYdFYEhZgn/7L7e/PYs0SY1U8jfRPEP2eJRBbMMHHQVyrsGBnjWBMRp5jSinnA514
         nz8hmIJUeKoGRgKvY1rRosShugyXWC5oMhmy1hw/8yBNBh5PIbz9udSiWenkCjxC51OO
         N2JJ39AeUxcZ8VX5o+yUF1JoEbXV5Zwyg+tZD+eiHv78x/OaD9ba7+GfsDviuV7Mq2Me
         W4qADuctpqj6rYi4Amo/129OcR8H86aTeW46/n2cWmsOwcXOtxC9BH4VsLZK2vdFHoK0
         qEUUZ0GErYyjrTcNuZtI1bSfE4Sl2p/G1WqZEuT66j0/91XQyiZyYdVXeg2yiZ/RYI/u
         boWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=tckjd+QUu/Bv2pA5Uamz22Rt64XOK+nD0dwnQuEvkmU=;
        b=brrTD4+XzB92V5T9sjXap6KqvorNSzAeFJiwsmksXnch3t3F4GlKdYtFrvRjg6wS76
         R7GLhfdgDZpzwAF6HU70nxHhp8nq+lsZJnLsAIPFLoVPQxNbFC+EOQ5LpPlivROGBCyz
         FhhuAARXw87RrKYF4B0OuACjZkqbN/ISKShYTu4f+p7kjY0UDaHs8LIQjyHd28HOc3Jg
         cl99n0KTozwcSfV6tzVDsBKu80EmReE/5+oXCXQACpaL3QHzfHXBwJSTK18o5JBgxV4a
         bociQyaI+J1oPLFgyP85jbMiscgEkKi1PdpMAPw5EnYd4A2U592FaSUQAu/Ul7m1ndaR
         ENFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=H+1jNWzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si14846383ybe.153.2020.08.25.03.08.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 03:08:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=H+1jNWzE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kAVsC-00072s-HS
	for alex.bennee@linaro.org; Tue, 25 Aug 2020 06:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kAVs4-00072V-OQ
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 06:08:04 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:40438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <graeme@nuviainc.com>)
 id 1kAVs2-0003AV-GZ
 for qemu-arm@nongnu.org; Tue, 25 Aug 2020 06:08:04 -0400
Received: by mail-wm1-x344.google.com with SMTP id k20so1555943wmi.5
 for <qemu-arm@nongnu.org>; Tue, 25 Aug 2020 03:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=tckjd+QUu/Bv2pA5Uamz22Rt64XOK+nD0dwnQuEvkmU=;
 b=H+1jNWzEreU1N+Ff12Q4HgwFBm/eHj+lwULnF3muv5UpK98uYM1nhUflWpYEk38RYs
 sdocDZN7dp8mzs/zDtY5J2KJ0uGyUbMy8IUq6j/Y+ZMkgZDgDuGZzGI8dqIMMFNnjDxv
 AjHIwkEdFnXyq+1GkpyI988MyaMJjVgKAb63k1ZjS8diLxs6tQIEk9YJcOl7FhJbZ620
 moTELh1uaKehEJsGrnyF0oV/xFK2usUnl21wWpP/SSJ3C4O8+13d48lFcz/VIlUd4mGX
 CM5oZ4AvnGPBQS1kKgoA6d9GywuR0u90+PBIqHN5cjYRNOREvWc8by4nB4kMgu6/jaeL
 PDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tckjd+QUu/Bv2pA5Uamz22Rt64XOK+nD0dwnQuEvkmU=;
 b=kcUylBM9/obC/gBWz2np8yvlPqG0/9srZhZ18jrBwhGAB2vgD/mwHSnacmnAHwerm4
 V9Oog/x3T5/OR0x857QBPgTYuHIDMoqfBnwPTEgIbl5xjmj2Zq1ZwdKv/OyacTs1l0o4
 uvhWFHktHhHavHxyA4Lx4yMp6bcUl1xXqkJFUrZvx9rBBZEpfAZhUqkEZjqox4gl+Mn8
 4Cx+gZihdoQcIfR6XZkUHkgSRrfQDE16rTfdCMq69jt4zLqelVfFvNDehUw8Z1RcMw36
 UQkJgcUvqwLc7W4fpRimhOcIwGof8CKV2dP0TYc3oS7XEDGA9H/r1Wb/HFRltxXv+a9l
 tSBA==
X-Gm-Message-State: AOAM531mVo8rZisiF2RoQXLz4ytCGFhwipTv4kjVGYo8vgJdvrE0V8xI
 ge9NfQYsen0ikBv1vBQZpjM74g==
X-Received: by 2002:a1c:bac1:: with SMTP id k184mr1394300wmf.10.1598350080468; 
 Tue, 25 Aug 2020 03:08:00 -0700 (PDT)
Received: from xora-monster ([2a02:8010:64d6::1d89])
 by smtp.gmail.com with ESMTPSA id v16sm4971206wmj.14.2020.08.25.03.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 03:07:59 -0700 (PDT)
Date: Tue, 25 Aug 2020 11:07:57 +0100
From: Graeme Gregory <graeme@nuviainc.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [EXTERNAL] Re: [PATCH] hw/arm/sbsa-ref.c : Add a fake embedded
 controller
Message-ID: <20200825100757.r54ba26kmavntqrb@xora-monster>
References: <20200820133201.80577-1-graeme@nuviainc.com>
 <CAFEAcA_9WRk0Dr97wpDHacsjy2qpmBBq=kp6hOQTvUOvpWF0zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_9WRk0Dr97wpDHacsjy2qpmBBq=kp6hOQTvUOvpWF0zw@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=graeme@nuviainc.com; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Leif Lindholm <leif@nuviainc.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, rad@semihalf.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yDvTwFYWfcZ/

On Mon, Aug 24, 2020 at 03:59:38PM +0100, Peter Maydell wrote:
> On Thu, 20 Aug 2020 at 14:32, Graeme Gregory <graeme@nuviainc.com> wrote:
> >
> > A difference between sbsa platform and the virt platform is PSCI is
> > handled by ARM-TF in the sbsa platform. This means that the PSCI code
> > there needs to communicate some of the platform power changes down
> > to the qemu code for things like shutdown/reset control.
> >
> > Space has been left to extend the EC if we find other use cases in
> > future where ARM-TF and qemu need to communicate.
> >
> > Signed-off-by: Graeme Gregory <graeme@nuviainc.com>
> > ---
> >  hw/arm/sbsa-ref.c | 95 +++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >
> > diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
> > index f030a416fd..c8743fc1d0 100644
> > --- a/hw/arm/sbsa-ref.c
> > +++ b/hw/arm/sbsa-ref.c
> > @@ -41,6 +41,7 @@
> >  #include "hw/usb.h"
> >  #include "hw/char/pl011.h"
> >  #include "net/net.h"
> > +#include "migration/vmstate.h"
> >
> >  #define RAMLIMIT_GB 8192
> >  #define RAMLIMIT_BYTES (RAMLIMIT_GB * GiB)
> > @@ -62,6 +63,7 @@ enum {
> >      SBSA_CPUPERIPHS,
> >      SBSA_GIC_DIST,
> >      SBSA_GIC_REDIST,
> > +    SBSA_SECURE_EC,
> >      SBSA_SMMU,
> >      SBSA_UART,
> >      SBSA_RTC,
> > @@ -98,6 +100,14 @@ typedef struct {
> >  #define SBSA_MACHINE(obj) \
> >      OBJECT_CHECK(SBSAMachineState, (obj), TYPE_SBSA_MACHINE)
> >
> > +typedef struct {
> > +    SysBusDevice parent_obj;
> > +    MemoryRegion iomem;
> > +} SECUREECState;
> 
> Could you put the definition of the device in its own .c file,
> please (hw/misc/ seems like the right place). We generally
> prefer to keep the board and individual device models
> separate. (Some older code in the tree still has devices
> lurking in source files, but new stuff generally follows
> the rules.)
> 
Yes, certainly!

> > +enum sbsa_secure_ec_powerstates {
> > +    SBSA_SECURE_EC_CMD_NULL,
> > +    SBSA_SECURE_EC_CMD_POWEROFF,
> > +    SBSA_SECURE_EC_CMD_REBOOT,
> 
> The last two are clear enough, but what's a null power state for?
> 
My personal dislike of sending 0 to hardware as its harder to spot
when using scopes/logic analyzers. I can remove it if you wish and
explicitly number the states.

> > +static uint64_t secure_ec_read(void *opaque, hwaddr offset, unsigned size)
> > +{
> > +    /* No use for this currently */
> > +    return 0;
> > +}
> > +
> > +static void secure_ec_write(void *opaque, hwaddr offset,
> > +                     uint64_t value, unsigned size)
> > +{
> > +    if (offset == 0) { /* PSCI machine power command register */
> > +        switch (value) {
> > +        case SBSA_SECURE_EC_CMD_NULL:
> > +            break;
> > +        case SBSA_SECURE_EC_CMD_POWEROFF:
> > +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> > +            break;
> > +        case SBSA_SECURE_EC_CMD_REBOOT:
> > +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> > +            break;
> > +        default:
> > +            error_report("sbsa-ref: ERROR Unkown power command");
> 
> "unknown".
> 
> We prefer qemu_log_mask(LOG_GUEST_ERROR, ...) for logging this
> kind of "guest code did something wrong" situation.
> (you could also do that for attempting to read this w/o register
> if you liked).
> 
Excellent that is much better, Ill make that change.

> > +        }
> > +    } else {
> > +        error_report("sbsa-ref: unknown EC register");
> 
> similarly here
> 
> > +    }
> > +}
> > +
> > +static const MemoryRegionOps secure_ec_ops = {
> > +    .read = secure_ec_read,
> > +    .write = secure_ec_write,
> > +    .endianness = DEVICE_NATIVE_ENDIAN,
> 
> Consider explicitly specifying the permitted access size
> by setting .valid.min_access_size and .valid.max_access_size
> (restricting guests to only doing 32-bit writes will make
> life easier when you come to add registers later...)
> 
That was my original intent so i will do this.

> > +};
> > +
> > +static void secure_ec_init(Object *obj)
> > +{
> > +    SECUREECState *s = SECURE_EC(obj);
> > +    SysBusDevice *dev = SYS_BUS_DEVICE(obj);
> > +
> > +    memory_region_init_io(&s->iomem, obj, &secure_ec_ops, s, "secure-ec",
> > +                            0x1000);
> 
> Minor indent error here.
> 
Will fix, just FYI checkpatch does not pick this up currently.

> > +    sysbus_init_mmio(dev, &s->iomem);
> > +}
> > +
> > +static void create_secure_ec(MemoryRegion *mem)
> > +{
> > +    hwaddr base = sbsa_ref_memmap[SBSA_SECURE_EC].base;
> > +    DeviceState *dev = qdev_create(NULL, TYPE_SECURE_EC);
> > +    SysBusDevice *s = SYS_BUS_DEVICE(dev);
> > +
> > +    memory_region_add_subregion(mem, base,
> > +                                sysbus_mmio_get_region(s, 0));
> > +}
> > +
> >  static void sbsa_ref_init(MachineState *machine)
> >  {
> >      unsigned int smp_cpus = machine->smp.cpus;
> > @@ -708,6 +778,8 @@ static void sbsa_ref_init(MachineState *machine)
> >
> >      create_pcie(sms);
> >
> > +    create_secure_ec(secure_sysmem);
> > +
> >      sms->bootinfo.ram_size = machine->ram_size;
> >      sms->bootinfo.nb_cpus = smp_cpus;
> >      sms->bootinfo.board_id = -1;
> > @@ -798,8 +870,31 @@ static const TypeInfo sbsa_ref_info = {
> >      .instance_size = sizeof(SBSAMachineState),
> >  };
> >
> > +static const VMStateDescription vmstate_secure_ec_info = {
> > +    .name = "sbsa-secure-ec",
> > +    .version_id = 0,
> > +    .minimum_version_id = 0,
> > +};
> 
> If you don't have any internal state in a device (as in
> this case), then you don't need to set dc->vmsd at all.
> Just have a comment in the class init saying
>     /* No vmstate or reset required: device has no internal state */
> 
Thanks, that is cleaner, Ill do this.

Thanks for the review, Ill get right on v2.

Graeme

