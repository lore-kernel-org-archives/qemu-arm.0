Received: by 10.25.21.156 with SMTP id 28csp1666168lfv;
        Tue, 26 Jul 2016 04:48:19 -0700 (PDT)
X-Received: by 10.55.150.195 with SMTP id y186mr27440511qkd.7.1469533699409;
        Tue, 26 Jul 2016 04:48:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h19si215455qke.295.2016.07.26.04.48.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jul 2016 04:48:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38983 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bS0qQ-0007nJ-R9
	for alex.bennee@linaro.org; Tue, 26 Jul 2016 07:48:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50901)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS0qK-0007lR-D2
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:48:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS0qI-0004Ch-E6
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:48:11 -0400
Received: from mail-qt0-x233.google.com ([2607:f8b0:400d:c0d::233]:33960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bS0qI-0004CZ-3d
	for qemu-arm@nongnu.org; Tue, 26 Jul 2016 07:48:10 -0400
Received: by mail-qt0-x233.google.com with SMTP id u25so2447504qtb.1
	for <qemu-arm@nongnu.org>; Tue, 26 Jul 2016 04:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S++uy5VdvmFgpNchXQFO4TRqB8CNMDVLw/AS4qqxNd8=;
	b=WrcxN5UTT9FBz6VosEXilSCDR1ADGcUSpl/+LKPmqjiKFb8vCGcruWlGgZky8NyWTb
	50ASs/FNSfEvZp50jiHF900gBLsp0JjGClTcPcjs2Fs18ZlUfnZ2ye/fNl+ROzKfio62
	7vZFCP4W19LKACCYYjclB2W7wkyPeaFcanyC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S++uy5VdvmFgpNchXQFO4TRqB8CNMDVLw/AS4qqxNd8=;
	b=BhB507ecv8CAb6hiiNXOe7SiTTFuTv9MwqDd94S+iSYarIl5GmO2z2u0ZasfUqoYne
	44bDcJsvxt+PShlqdWoFeNLhCCLT0x7ixc/wguSwTJV11w9oT+HRKC5Tqvfyy5moVwR8
	w1g49mNMPmn919vDC8EXIAZpZAVX5ZdBmMhm/PWGiu3epQXZS6ADGqTAOW9vbwlMmQmj
	Xmqu0VF8U1Lqc07Hj5K+9/NCfFaEOoG0dNI4n/j+92HLCNPG6OVNxkvaV2zPJl1SXQYe
	D/dQL7n2l718idd4f1DCGH/8tAddSUj9Zw10MMd0iG41IQBnlhX4CtuGUGHYaOWKXtRk
	bC3Q==
X-Gm-Message-State: AEkooutbcvGlpVZX0xnrB5UDVkeoT8D5eDY/CCosoUw4q1A5MmS/3QN/gs8A3nxGm+ZbX99tY/PCOH+OvZJWrzrx
X-Received: by 10.159.40.67 with SMTP id c61mr10039362uac.82.1469533689611;
	Tue, 26 Jul 2016 04:48:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.137.136 with HTTP; Tue, 26 Jul 2016 04:47:50 -0700 (PDT)
In-Reply-To: <5778bd2c8a0fe59682bf830c2c17ff7207b296d7.1469491920.git.alistair.francis@xilinx.com>
References: <cover.1469491920.git.alistair.francis@xilinx.com>
	<5778bd2c8a0fe59682bf830c2c17ff7207b296d7.1469491920.git.alistair.francis@xilinx.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2016 12:47:50 +0100
Message-ID: <CAFEAcA_1-_+LmbMmZH3F7idZxfTerveUh8bQFHsUivMVP+ggqw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c0d::233
Subject: Re: [Qemu-arm] [PATCH v2 2/6] cadence_gem: Add the
 num-priority-queues property
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
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a3b60Fxtxwo2

On 26 July 2016 at 01:12, Alistair Francis <alistair.francis@xilinx.com> wrote:
> The Cadence GEM hardware supports N number priority queues, this patch is a
> step towards that by adding the property to set the queues. At the moment
> behaviour doesn't change as we only use queue 0.
>
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---

> @@ -1218,7 +1220,7 @@ static void gem_realize(DeviceState *dev, Error **errp)
>  {
>      CadenceGEMState *s = CADENCE_GEM(dev);
>
> -    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq);
> +    sysbus_init_irq(SYS_BUS_DEVICE(dev), &s->irq[0]);
>
>      qemu_macaddr_default_if_unset(&s->conf.macaddr);

At some point realize() needs to error-check the num-priority-queues
property (ie check it isn't >8). Do you do that later in the series?
(if so fine, if not, this patch is as good a place as any to put it.)

> @@ -1243,13 +1245,15 @@ static void gem_init(Object *obj)
>  static const VMStateDescription vmstate_cadence_gem = {
>      .name = "cadence_gem",
>      .version_id = 2,
> -    .minimum_version_id = 2,
> +    .minimum_version_id = 3,

You need to bump .version_id too.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
