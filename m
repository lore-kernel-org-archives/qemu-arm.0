Received: by 10.182.158.201 with SMTP id ww9csp2298681obb;
        Sun, 20 Dec 2015 09:17:48 -0800 (PST)
X-Received: by 10.140.253.3 with SMTP id y3mr20731133qhc.39.1450631868451;
        Sun, 20 Dec 2015 09:17:48 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 16si25999588qho.16.2015.12.20.09.17.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 20 Dec 2015 09:17:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:41430 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAhcC-0000DU-3A
	for alex.bennee@linaro.org; Sun, 20 Dec 2015 12:17:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44085)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhcA-0000DA-3f
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:17:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhc9-0006in-A1
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:17:46 -0500
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:34422)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aAhc9-0006ih-6Z
	for qemu-arm@nongnu.org; Sun, 20 Dec 2015 12:17:45 -0500
Received: by mail-vk0-x234.google.com with SMTP id j66so89879542vkg.1
	for <qemu-arm@nongnu.org>; Sun, 20 Dec 2015 09:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eAu7lA0N0FyL6TxXQdRXgXw+UP3hVs1a18tMNwjJalA=;
	b=ZYAesB+Cg2uAUj/QWcPbVhv28R2KpsuUmAZyDQs7c9cPddZmqtyiPK+uLq27Agya+p
	MKr34GO1aQcNfZyL/UfMUQbB96VYSzcOc07FEfBjXDqUStLwrDHC0wxYPJVkATjobVzm
	ZEfl+p9j90Touy+gnidmV2yhgGKAVE5hMiSZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=eAu7lA0N0FyL6TxXQdRXgXw+UP3hVs1a18tMNwjJalA=;
	b=fOZPttEfA+F4JKFYLHh350v/3aUvcoVLrONQZRcA7zelspIVpQBHhzw7Q16ZxqmAqh
	clRI2aW58fRykM+W5SHGozmYWkahHsKk84F15eNZnhUyTLbkCHE82AVypYky/kiJkJQB
	AkMSuOcsdxYDS8w6R+W1D5YV87zMHDRYdgdslGoLmyrEmYmRh4xQwjMEFrGRJDNP24JZ
	LgD6yI/HSns/ShPrcVNRvyi8/cJvfopZcIY3TUU/EI+j+bGaM05HJsoatws7Xemj9D6v
	RiWhZqdOtuodIaD4V5/ePMWywUp0+x1BphehQFUCfSy0P/ynZwyPpNF5Eh4xauuOPYH0
	ICVw==
X-Gm-Message-State: ALoCoQktbSLC3juM0sYuGU0lQ9HzPq2KU630urt6gzVb/u2iZ2w4uhmJGCtoEGQtEiJWsGdNx2EYQBwp93OOKGVduyT+NWtDsZjPMOEDnLzFELRxL4H7ick=
X-Received: by 10.31.180.145 with SMTP id d139mr8480122vkf.83.1450631864819;
	Sun, 20 Dec 2015 09:17:44 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Sun, 20 Dec 2015 09:17:25 -0800 (PST)
In-Reply-To: <20151219214518.GJ4164@pcrost-box>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-10-git-send-email-peter.maydell@linaro.org>
	<20151219214518.GJ4164@pcrost-box>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 20 Dec 2015 17:17:25 +0000
Message-ID: <CAFEAcA-LPL90XNzQ8Ee+8FAsG1LkEjSCOfcvE_UbfOF4w-mLJA@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::234
Cc: Kevin O'Connor <kevin@koconnor.net>, Markus Armbruster <armbru@redhat.com>,
	Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH 09/10] hw/sd/pxa2xx_mmci: Convert to
	VMStateDescription
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HcbYlfK1WcTY

On 19 December 2015 at 21:45, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Fri, Dec 11, 2015 at 04:37:10PM +0000, Peter Maydell wrote:
>> Convert the pxa2xx_mmci device from manual save/load
>> functions to a VMStateDescription structure.
>>
>> This is a migration compatibility break.

>> +static bool pxa2xx_mmci_vmstate_validate(void *opaque, int version_id)
>> +{
>> +    PXA2xxMMCIState *s = opaque;
>> +
>> +    return s->tx_start < sizeof(s->tx_fifo)
>> +        && s->rx_start < sizeof(s->rx_fifo)
>> +        && s->tx_len <= sizeof(s->tx_fifo)
>> +        && s->rx_len <= sizeof(s->rx_fifo)
>> +        && s->resp_len <= sizeof(s->resp_fifo);
>
>
> A nit, but I wonder if ARRAY_SIZE should be generally used in this case, as
> it is a little more self documenting and would make code identical to
> non-byte FIFOs.

Yes. In particular ARRAY_SIZE(s->resp_fifo) is correct
and sizeof(s->resp_fifo) is wrong because that array is uint16_t...

>> +}
>> +
>
> Extra blank.
>
>> +
>> +static const VMStateDescription vmstate_pxa2xx_mmci = {
>
> Is the registration in class_init missing?

Does seem to be...

thanks
-- PMM
