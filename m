Received: by 10.182.158.201 with SMTP id ww9csp734309obb;
        Thu, 17 Dec 2015 16:21:33 -0800 (PST)
X-Received: by 10.55.76.18 with SMTP id z18mr875822qka.105.1450398093455;
        Thu, 17 Dec 2015 16:21:33 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u83si13778967qka.53.2015.12.17.16.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Dec 2015 16:21:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:57783 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9ind-0000ND-4C
	for alex.bennee@linaro.org; Thu, 17 Dec 2015 19:21:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37426)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9inJ-0008W8-AF
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 19:21:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1a9inI-0001zp-6o
	for qemu-devel@nongnu.org; Thu, 17 Dec 2015 19:21:13 -0500
Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235]:34865)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1a9inI-0001zN-0Y; Thu, 17 Dec 2015 19:21:12 -0500
Received: by mail-oi0-x235.google.com with SMTP id l9so23160286oia.2;
	Thu, 17 Dec 2015 16:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=3Ueq+L0bCDErLP4boK7ZSR1VjRjiYGwhmEJBPfkchG0=;
	b=FV5rWVH3X0UmvAsbdHfspOTcrb80dOInXbF9R37Z+DdW8EyvZXvNx0A7HEVrYjjMbI
	tyTnGi2Y84DUEXhs6+wM/58PJOV0n96Q2tMXp1avamxLAYRzE2NVtJcdIEcwM+UAgbrr
	7VTUJxgkQmTy+0nDmHLrKEeiisltk6OgNNIUTMer0I11ho83kLbwlVT7/DMVOlmd8mao
	nM+jslRSqajGhSSgDYx6gM3QmQ2FgiTiB18y9+rFXudZNxizqVWLqjvpAqaj+zt2K/2R
	3qEI8QR9+BZumvsivhpsaiJFTSxjnSdrktMtCjS6fnIkKAUqE0y76p6de3VEGbrPpw6s
	KMlQ==
X-Received: by 10.202.94.4 with SMTP id s4mr326298oib.8.1450398071521; Thu, 17
	Dec 2015 16:21:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.49.199 with HTTP; Thu, 17 Dec 2015 16:20:42 -0800 (PST)
In-Reply-To: <CAFEAcA8d8HTGqur_eN5KYJP6-SGNTUUygSTzRxnD+==7M9OUqw@mail.gmail.com>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-3-git-send-email-peter.maydell@linaro.org>
	<CAKmqyKOYNfapty-are1iEetrw-1v_Jz_+w69iF5FX9+ZtiDFoA@mail.gmail.com>
	<CAFEAcA8d8HTGqur_eN5KYJP6-SGNTUUygSTzRxnD+==7M9OUqw@mail.gmail.com>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 17 Dec 2015 16:20:42 -0800
X-Google-Sender-Auth: JQp5O35p9N5tlpHzjLild9i8vu8
Message-ID: <CAKmqyKNJHzMQLPpNuSbXXXq1ow8tSxmL5t=q-VHPhQf_D6WKqw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::235
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, Kevin O'Connor <kevin@koconnor.net>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Subject: Re: [Qemu-devel] [PATCH 02/10] hw/sd/sd.c: QOMify
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tP/0ZKuyR4iD

On Thu, Dec 17, 2015 at 2:11 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 17 December 2015 at 21:45, Alistair Francis
> <alistair.francis@xilinx.com> wrote:
>> On Fri, Dec 11, 2015 at 8:37 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> Turn the SD card into a QOM device.
>>> This conversion only changes the device itself; the various
>>> functions which are effectively methods on the device are not
>>> touched at this point.
>>>
>>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
>>> @@ -472,34 +476,26 @@ static const VMStateDescription sd_vmstate = {
>>>      }
>>>  };
>>>
>>> -/* We do not model the chip select pin, so allow the board to select
>>> -   whether card should be in SSI or MMC/SD mode.  It is also up to the
>>> -   board to ensure that ssi transfers only occur when the chip select
>>> -   is asserted.  */
>>> +/* Legacy initialization function for use by non-qdevified callers */
>>>  SDState *sd_init(BlockBackend *blk, bool is_spi)
>>>  {
>>> -    SDState *sd;
>>> +    DeviceState *dev;
>>> +    Error *err = NULL;
>>>
>>> -    if (blk && blk_is_read_only(blk)) {
>>> -        fprintf(stderr, "sd_init: Cannot use read-only drive\n");
>>> +    dev = qdev_create(NULL, TYPE_SD);
>>> +    qdev_prop_set_drive(dev, "drive", blk, &err);
>>> +    if (err) {
>>> +        error_report("sd_init failed: %s", error_get_pretty(err));
>>>          return NULL;
>>>      }
>>> -
>>> -    sd = (SDState *) g_malloc0(sizeof(SDState));
>>> -    sd->buf = blk_blockalign(blk, 512);
>>> -    sd->spi = is_spi;
>>> -    sd->enable = true;
>>> -    sd->blk = blk;
>>> -    sd_reset(sd);
>>> -    if (sd->blk) {
>>> -        /* Attach dev if not already attached.  (This call ignores an
>>> -         * error return code if sd->blk is already attached.) */
>>> -        /* FIXME ignoring blk_attach_dev() failure is dangerously brittle */
>>> -        blk_attach_dev(sd->blk, sd);
>>
>> This functionality is removed with this patch. If the block is not
>> already attached won't this cause errors?
>
> The block backend is attached when we set the "drive" property
> (which we do in this function in the new code just above).
> [the actual call to blk_attach_dev() is in parse_drive() in
> hw/core/qdev-properties-system.c.]
>
> The blk_set_dev_ops() moves in this patch to sd_realize().
>
> There is incidentally no longer any case where the block backend
> could be already attached when we call sd_init(), because the
> only case there was when it had been attached to the sdhci
> controller device because of the x-drive property on that device,
> and we removed the property in the previous patch. It's exactly
> because setting a drive property does an implicit blk_attach_dev
> that this code previously had to have special casing for
> "attach of an already attached blk".

Ok, fair enough, just thought I would check. The rest of the logic
looks good then.

Thanks,

Alistair

>
>>> -        blk_set_dev_ops(sd->blk, &sd_block_ops, sd);
>>> +    qdev_prop_set_bit(dev, "spi", is_spi);
>>> +    object_property_set_bool(OBJECT(dev), true, "realized", &err);
>>> +    if (err) {
>>> +        error_report("sd_init failed: %s", error_get_pretty(err));
>>> +        return NULL;
>>>      }
>>> -    vmstate_register(NULL, -1, &sd_vmstate, sd);
>>> -    return sd;
>>> +
>>> +    return SD(dev);
>>>  }
>>>
>>>  void sd_set_cb(SDState *sd, qemu_irq readonly, qemu_irq insert)
>>> @@ -1765,3 +1761,62 @@ void sd_enable(SDState *sd, bool enable)
>>>  {
>>>      sd->enable = enable;
>>>  }
>>> +
>>> +static void sd_instance_init(Object *obj)
>>> +{
>>> +    SDState *sd = SD(obj);
>>> +
>>> +    sd->enable = true;
>>> +}
>>> +
>>> +static void sd_realize(DeviceState *dev, Error ** errp)
>>
>> You have one too many spaces here.
>
> Yep, will fix.
>
> thanks
> -- PMM
>
