Received: by 10.25.44.15 with SMTP id s15csp4111587lfs;
        Sun, 16 Jul 2017 21:08:14 -0700 (PDT)
X-Received: by 10.55.141.198 with SMTP id p189mr25543458qkd.97.1500264494215;
        Sun, 16 Jul 2017 21:08:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1500264494; cv=none;
        d=google.com; s=arc-20160816;
        b=05FmfhQL+MW9rHIVXnM0H73PY1faTZa0ngkf1LeX/jZDi8W5emm1bIcko/zB5KhUUy
         gpYB/x78B4LRd9F7CgYmKB1+kjTLty7T47OPZWc9Piu11mXty4ZbHyKxc/8/p8my36wm
         8oUMfR4Tnxf9sXqF7Z9KpQLcZiVYeBvKAa9J6DrTN9c8Go4WvS1ZjADeQSW/U223FBgT
         4yd8w/iAGhJSsMKHMpiTgASCPHrpa9qtFxKz7fhxXz+E31YXoWAwlzVwXuXAJaZxEEXF
         ahP+DqNyJkJ6Ny8sg2pGyG4r1YxE5TQ5H3FIizvw0Lz3PszunumssTJ0xYIJl7Q3hvEZ
         cvFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=BfNTfH7qCkYVt6S2n5SfTJtYhH9VtMqrSMKqwsU46YA=;
        b=cRUo81gjUYbyKSl2//M9Pc1HEmiK/QEoBRhbS8YIvHclM1ICOpQNwMsYH8drbWou5A
         Vh61MgSqxLfR7cJBElVLTpQtOLh5IMHLTJ6+/8A4UsbAVI9JR4+H613yuqHwip+dGkXM
         iIECqNVH20P8oIpni8f1OvodzhLH2Eg5HfKw4dRTsvhCzlCyWpZ7jbelUkKDUlqiScBs
         EbZKd/do1iDyPeutyK3UCvhzhuC2aubG3lvxc4tw8fOLUggpRke7be1tgA4/DI204mPV
         r4Klgug8ay/2YTZogdifzlvCaTnq0HFs+xe6KwAcQUFGYjWVE8wkc136xYSt41b2JHss
         xTRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=GKJxZu4L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c24si14496512qtc.31.2017.07.16.21.08.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Jul 2017 21:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=GKJxZu4L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47827 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dWxKN-0002S4-Gd
	for alex.bennee@linaro.org; Mon, 17 Jul 2017 00:08:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxKK-0002Rz-P2
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:08:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxKF-0007Yy-OW
	for qemu-arm@nongnu.org; Mon, 17 Jul 2017 00:08:08 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34015)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dWxKF-0007XX-If; Mon, 17 Jul 2017 00:08:03 -0400
Received: by mail-qt0-x244.google.com with SMTP id 19so1144372qty.1;
	Sun, 16 Jul 2017 21:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=BfNTfH7qCkYVt6S2n5SfTJtYhH9VtMqrSMKqwsU46YA=;
	b=GKJxZu4L1cfAKQjahE1V7q56/iXRuMxdSADhtScNRFuopnu4P/FnhtL1HUoJ/3kdEM
	o8PHVsMVfwxBaZiC8X3i90KaZ/sQ+QhynNrL+VW1jy4qMy5hnLv9cprL8GY7pR15mkrz
	FB6qwbN0Hz2xulHUNM4Yu8z3MUBK/YaxIhDajdQQKqzWyxdVZzcdNKejGOrELIPZ3Tb/
	GIFnpKzpdEz4IpzZhNX/0Wj8mONzpg6ldbYF06wUShoxWua0x3x5aC77NQF30r8lsY6c
	Z63Gd9E7YlaYgddsiQoToaskx8UhIut3H9SRH2I3kQbrUWTXUuUorQTxIWGBguX/pKuh
	I9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=BfNTfH7qCkYVt6S2n5SfTJtYhH9VtMqrSMKqwsU46YA=;
	b=Qd8Qp3deR+xn59cg023JVYurUKOMFF920DqPiCzFVCNKM+L8X2DeRbqvUKLP53grKB
	FUQ9yhR3Mi9z8huXrhZNJH8kACfwd9e0r+Zi1cWsHuJMkJfK40qKoSZu3AKDtjP5C9ZH
	cXhUsUyhcjrpeO1Ln9rvmvupFQy0RrsEbUFtOzpcjfZyTIpmKoJ+cLxzjGFqldnLWsiX
	UPFuysV6EwpiJcUqr+Bnkgm8i3jDh+fptMEIGPPlP/sXYLouzkgtx1xFSdep3FIM4Lgx
	IvrlRCdDJtERtEDrdBcHAKidyZcdRTc47FcfSBORKCQ8yhfwZ6O+gpUUG98lfkOdbmFu
	VFHw==
X-Gm-Message-State: AIVw110mSMDeS0h+jix3aevMJNIBaA9cMib20LUJmULgAYISi89dBzzz
	1zC4Jw+EHgs59k0vE+U=
X-Received: by 10.237.47.132 with SMTP id m4mr23881710qtd.200.1500264481147;
	Sun, 16 Jul 2017 21:08:01 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	r19sm12518068qkl.15.2017.07.16.21.07.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 16 Jul 2017 21:08:00 -0700 (PDT)
To: Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
References: <20170717023824.18796-1-famz@redhat.com>
	<20170717023824.18796-2-famz@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f15f64a1-f13d-57b5-2d1f-05927519318d@amsat.org>
Date: Mon, 17 Jul 2017 01:07:58 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170717023824.18796-2-famz@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH v5 1/6] armv7m: Convert bitband.source-mamory
 to DEFINE_PROP_LINK
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I+bxR4jiYK0T

On 07/16/2017 11:38 PM, Fam Zheng wrote:
> Signed-off-by: Fam Zheng <famz@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/arm/armv7m.c | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index c8a11f2..8efc4e8 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -97,12 +97,6 @@ static void bitband_init(Object *obj)
>       BitBandState *s = BITBAND(obj);
>       SysBusDevice *dev = SYS_BUS_DEVICE(obj);
>   
> -    object_property_add_link(obj, "source-memory",
> -                             TYPE_MEMORY_REGION,
> -                             (Object **)&s->source_memory,
> -                             qdev_prop_allow_set_link_before_realize,
> -                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> -                             &error_abort);
>       memory_region_init_io(&s->iomem, obj, &bitband_ops, s,
>                             "bitband", 0x02000000);
>       sysbus_init_mmio(dev, &s->iomem);
> @@ -349,6 +343,8 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
>   
>   static Property bitband_properties[] = {
>       DEFINE_PROP_UINT32("base", BitBandState, base, 0),
> +    DEFINE_PROP_LINK("source-memory", BitBandState, source_memory,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> 
