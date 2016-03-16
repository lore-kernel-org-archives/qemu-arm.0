Received: by 10.25.208.211 with SMTP id h202csp916960lfg;
        Tue, 15 Mar 2016 19:16:53 -0700 (PDT)
X-Received: by 10.140.101.147 with SMTP id u19mr1739115qge.71.1458094613763;
        Tue, 15 Mar 2016 19:16:53 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 207si1134506qhw.106.2016.03.15.19.16.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 19:16:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@163.com
Received: from localhost ([::1]:52641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag113-0004UH-8j
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 22:16:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43899)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ag110-0004R5-L8
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 22:16:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>) id 1ag10z-0005fd-L1
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 22:16:50 -0400
Received: from m12-18.163.com ([220.181.12.18]:55173)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zxq_yx_007@163.com>)
	id 1ag10t-0005Wd-G7; Tue, 15 Mar 2016 22:16:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=HLShh
	Z61z00wJ0c43QwcmsaggOzqcl27UTVfpBVNfSo=; b=oLX6vui40GDLsFgt1Lz7D
	2UV5fMwZTnKFIXe9tTs3kG4KvuMrz6OodL69Wmuu8hvIlp/bBpgmXHg30yGT5te8
	sVKdvwa+FupNDYx8kpLEnp/ZUKl9LT7CNOvhz/PjLHm8duhLZ45BZDzrS15Civ5s
	pNQH5vpZanb/m01NklmXIc=
Received: from [192.168.31.184] (unknown [118.187.28.42])
	by smtp14 (Coremail) with SMTP id EsCowEDJm0HmwehWiyFKAA--.7523S2;
	Wed, 16 Mar 2016 10:16:08 +0800 (CST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1458061009-7733-1-git-send-email-peter.maydell@linaro.org>
From: hitmoon <zxq_yx_007@163.com>
Message-ID: <56E8C19A.3010002@163.com>
Date: Wed, 16 Mar 2016 10:14:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1458061009-7733-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: EsCowEDJm0HmwehWiyFKAA--.7523S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF45tF17ZryUXr4rZF1fWFg_yoW8Zw4kpa
	yfuanFyrWYyr1xXrsrZ3ZYgF1UGw4Y9ay8Jr9Yy3s7Gr4kZr98Zr47Kws8C3WUua97Zay5
	XF47Wa4qqwn5t3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jpLvtUUUUU=
X-Originating-IP: [118.187.28.42]
X-CM-SenderInfo: 520ts5t0bqili6rwjhhfrp/1tbiOwouxlXlSWtY3wAAsM
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 220.181.12.18
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>, patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH] sd: Fix "info qtree" on boards with SD cards
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
X-TUID: NDwoVM4HTX2M



在 2016年03月16日 00:56, Peter Maydell 写道:
> The SD card object is not a SysBusDevice, so don't create it with
> qdev_create() if we're not assigning it to a specific bus; use
> object_new() instead.
>
> This was causing 'info qtree' to segfault on boards with SD cards,
> because qdev_create(NULL, TYPE_FOO) puts the created object on the
> system bus, and then we may try to run functions like sysbus_dev_print()
> on it, which fail when casting the object to SysBusDevice.
>
> (This is the same mistake that we made with the NAND device
> and fixed in commit 6749695eaaf346c1.)
>
> Reported-by: hitmoon <zxq_yx_007@163.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I assume that using qdev_create() for non-SysBus devices is
> OK if we are passing in a specific bus pointer, because we do
> this already for various things including PCI devices. The
> various "properly QOMified" uses of TYPE_SD_CARD do that; only
> this sd_init() function for the legacy uses doesn't.
> ---
>   hw/sd/sd.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 00c320d..1568057 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -563,17 +563,19 @@ static const VMStateDescription sd_vmstate = {
>   /* Legacy initialization function for use by non-qdevified callers */
>   SDState *sd_init(BlockBackend *blk, bool is_spi)
>   {
> +    Object *obj;
>       DeviceState *dev;
>       Error *err = NULL;
>   
> -    dev = qdev_create(NULL, TYPE_SD_CARD);
> +    obj = object_new(TYPE_SD_CARD);
> +    dev = DEVICE(obj);
>       qdev_prop_set_drive(dev, "drive", blk, &err);
>       if (err) {
>           error_report("sd_init failed: %s", error_get_pretty(err));
>           return NULL;
>       }
>       qdev_prop_set_bit(dev, "spi", is_spi);
> -    object_property_set_bool(OBJECT(dev), true, "realized", &err);
> +    object_property_set_bool(obj, true, "realized", &err);
>       if (err) {
>           error_report("sd_init failed: %s", error_get_pretty(err));
>           return NULL;

Nice patch !

Reviewed-by: xiaoqiang.zhao <zxq_yx_007@163.com>

