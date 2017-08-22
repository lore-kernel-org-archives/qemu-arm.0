Received: by 10.223.188.70 with SMTP id a6csp5140757wrh;
        Tue, 22 Aug 2017 09:16:30 -0700 (PDT)
X-Received: by 10.55.78.23 with SMTP id c23mr1626693qkb.323.1503418590840;
        Tue, 22 Aug 2017 09:16:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503418590; cv=none;
        d=google.com; s=arc-20160816;
        b=d7YqyMeAtbuWJrq3noRwx2a198ssvOURydLKHVrIkkiD83zKmu5RUOLdUJv84l8CHH
         LpycfVxi0pvxH1JXF95JFQ4OVxfVtjjzEXAD8QruAE62TWXi1PyyxjSWbnclQUK0P5gw
         KKpLUJv9yDjbWupLECq+HHn/3EigYck4UVh+vF4OuOQwCK8H757ceIYNztBaWoKGc+SJ
         ZbUnbMRVGp/hULzKPXCJtNUQF0s3oB+MTRkqK5wApnaK0Ha8V7CtRXBALJ4YA0yW/fWS
         g5enCjQh7U6+vC+FZ+vYBZ8m6+v5skRzYVd2cyZu+Mc6AfuFkuzYg74I+f5wZkzDUnWV
         so9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=PYKdjk/4qP94bgsbUz0gGB53KNSF1nXEATAQQuLXYJs=;
        b=A1pUphniNQFNC7Rzn1Zc9fA6v3RdCzGi1tTKWc3uc4VrCHdpY2oDvowhTWmWhnCbMH
         iYaPFZYhafghwrl1Px7SZOCEKqHBLLuwwJdB6ae7WXsnRklqOtVXEQ15woz7J7Kdy/Nf
         iBg7vT2XbzAxiicOPojw4ltpi/Rk/ZkniJ+GsdtCDGjS2P82wTdLbxUtUAUEPau7hvgS
         uCSlpxL5StAVdEetDq4upsYnRK0WvdJNsh1h2b2SYcOX8CfkQqhUrPeHejJ8ahAgG6us
         cp001sLsZZfW93TKxLaISJFV72iZsY05y5xq5hljuZec0mAmOvUiRbI2hJPOqSimvWYE
         5KVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VO5r4Lkv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j88si13478625qtb.197.2017.08.22.09.16.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Aug 2017 09:16:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=VO5r4Lkv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58969 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkBqu-0000rh-FT
	for alex.bennee@linaro.org; Tue, 22 Aug 2017 12:16:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55004)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkArd-0001sl-0u
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:13:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkArZ-0007wG-6b
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:13:09 -0400
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:37870)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dkArY-0007vL-UC
	for qemu-arm@nongnu.org; Tue, 22 Aug 2017 11:13:05 -0400
Received: by mail-wm0-x22d.google.com with SMTP id b189so207661wmd.0
	for <qemu-arm@nongnu.org>; Tue, 22 Aug 2017 08:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PYKdjk/4qP94bgsbUz0gGB53KNSF1nXEATAQQuLXYJs=;
	b=VO5r4LkvmWbPEXpYagnBbI2h5jbFZichfuAG79ZHsF397QpGnJM0fNdM4BdebEnENm
	w3l6YVhjaVORKJkT7i4/hlZvZ0PDfg5c0BSwI+qI3hHVjXX//IfyLMHeT2oeSMd0Pa3j
	Q4ojIt8AuvisPASK0IZdc8kQEKEy2JVWUj6JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PYKdjk/4qP94bgsbUz0gGB53KNSF1nXEATAQQuLXYJs=;
	b=qt0CvqK3P6TRWQMtQ5wdoEqKv8g++bTuS3ztap7ue9ssTMyya+R/BCRL13XnAf3Bqg
	X4AZ876f0mPqDPB0d9VrdSqtfX2iZInt6o3Jm+BoWwNqc4+IeYs9zKwQEHJ8O49LU64+
	nvtiKjTDnEcHliKPWInMBQW07XDAfPAEROLCitPD+C9RHTEsDIi76Vm/Nqk89hROxIO7
	80SdQpzGXTudMGycv4H3nQqL2myvgpmeFH31MWFpirB6kSQWQJbGks5XKtJHMdEzFUI3
	ev3dnNimWPvGh0yOO115kVk6dKC9twp4QtsNKz2ZeZcekyke/bOHBFqR777iUFeC5TbW
	6Zrg==
X-Gm-Message-State: AHYfb5h6iAdyf60AH41I91NgN8umgZpPgH2fcmv9CEQZCsBYx2lc9T1V
	a38fs8Eofcai+ZvtHzwFSKJTViejndyT
X-Received: by 10.28.134.201 with SMTP id i192mr4366wmd.124.1503414783874;
	Tue, 22 Aug 2017 08:13:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Tue, 22 Aug 2017 08:12:43 -0700 (PDT)
In-Reply-To: <1503414375-21009-1-git-send-email-thuth@redhat.com>
References: <1503414375-21009-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Aug 2017 16:12:43 +0100
Message-ID: <CAFEAcA-92Jjz2uCC387oX2u0NWfijPwB_8zGaagC1m=sKD8zhQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22d
Subject: Re: [Qemu-arm] [PATCH] hw/misc/auxbus.c: Mark the aux-to-i2c-bridge
 device as non-hotpluggable
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HjACe9NH+EJR

On 22 August 2017 at 16:06, Thomas Huth <thuth@redhat.com> wrote:
> QEMU currently aborts if the user tries to do something like this:
>
> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
> QEMU 2.9.93 monitor - type 'help' for more information
> (qemu) device_add aux-to-i2c-bridge,id=x
> (qemu) device_del x
> **
> ERROR:qemu/qdev-monitor.c:872:qdev_unplug: assertion failed: (hotplug_ctrl)
> Aborted (core dumped)
>
> Looks like the device is not hot-pluggable, so let's mark it
> accordingly.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/misc/auxbus.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/misc/auxbus.c b/hw/misc/auxbus.c
> index 8a90ddd..2c62515 100644
> --- a/hw/misc/auxbus.c
> +++ b/hw/misc/auxbus.c
> @@ -222,9 +222,17 @@ static inline I2CBus *aux_bridge_get_i2c_bus(AUXTOI2CState *bridge)
>      return bridge->i2c_bus;
>  }
>
> +static void aux_bridge_class_init(ObjectClass *oc, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(oc);
> +
> +    dc->hotpluggable = false;
> +}

Why is our default "hotpluggable" rather than "not hotpluggable" ?
We must have way more non-hotpluggable devices than hotpluggable
ones, and it takes active effort to make a hotpluggable device
model, so it seems like it would be much less bug-prone to
require hotpluggable devices to set dc->hotpluggable true
rather than all the non-hotpluggable ones to set it false...

thanks
-- PMM
