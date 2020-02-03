Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3742799lfp;
        Mon, 3 Feb 2020 01:59:37 -0800 (PST)
X-Google-Smtp-Source: APXvYqzvHD6LHcwBD1Dw4x+GudrAtq9hxHp4c4gh4pYvotGPAegDvmL/6fMYcqQZbVjcNERr92P0
X-Received: by 2002:a05:620a:1324:: with SMTP id p4mr22845699qkj.497.1580723977013;
        Mon, 03 Feb 2020 01:59:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580723977; cv=none;
        d=google.com; s=arc-20160816;
        b=vk4LzX7P9ANZJvRrvngBZzzEW/RLZ8NzAqimFCG6ca1K5eIWkBKrRAKkrlVWai5qHF
         WOFma5mNW+gaQ7zONPR7GMZX67Jz47eiwGSJ2/0hLsRujvpvkR8YeLi1L8VzRi+SDPhJ
         JYv6ggnMTcMhM6vY+uCduXS0CEvRTklgrA9Ehw2m5TSlhu1VvXzq0ZmxpWYXjbdbGZma
         hpWpE1lbBxBxGdq/9H8lrMfLTkbGyc/lwXG0UjIlBchV30gL743lyF+W/C8w/7Q3WwoY
         /pLW3hF2nQbZKqhw7HAJC3CCy8Pq84eB2vTvluxE4ACZb3FuzehyYxxrpC53DkDgXk0h
         rARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2EQPOQX2t0Vz3rtvJuEbNRbtemaZYoymM7OD4ZlI5XA=;
        b=D9MRxTXQgExltG0JRLa0RlYVAgvm16z+WEPga9Zkf/oRRLFeBnUXzkJOUpKwYxxiu1
         UcpemfXzm03SSQotjtcq73thFgoj9kMEIeHl33R4dJ3zsxiP0tLKW/2kvvEswUD+qDZv
         EtdleMBTS9U5CVdLFGD0HchXeCrejXTdiSpGbGeFWjk+M1kyLKV8kBF75iZtXw62suxz
         cynEnBA654U6nb4QrmeMvI5yjH9FcyrhuLcl1UV8lyU6zF110xc1qI/FjHrfF0HaiL55
         OJWxN9YkqdyWxHiYhpZYdpy7Rcd/INWgCKUBatLk6e1D5//XqTfCwRJdxVGz6fHO0myJ
         NYrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PhdDOUa2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o15si11080772qkh.96.2020.02.03.01.59.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 01:59:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PhdDOUa2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iyYW0-0002Tl-Fy
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 04:59:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33273)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iyYVK-0001SB-NQ
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 04:58:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iyYVI-0003q8-AJ
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 04:58:54 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42055)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iyYVI-0003oT-3q
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 04:58:52 -0500
Received: by mail-ot1-x341.google.com with SMTP id 66so13040761otd.9
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 01:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2EQPOQX2t0Vz3rtvJuEbNRbtemaZYoymM7OD4ZlI5XA=;
 b=PhdDOUa2D5W4KPIKPfkQJU7RzCP+Tj4a3stgdSnSuw/fahpNrneMJKS1JICq4uyTHw
 BksTGg2qWyxhDp8Cf3ulsDkpJb3Hj89+RF94Vwn2TJ5KynGA2JUW27nhqdZNNxqjODej
 mMWAI2/T9CLojxznV9+jJebPWmhikzyEA6Oj9QAS4+gBCjxnvZy10ID5lMCodaErw+fq
 tFCitgY/MWLwVfb9CsGpOnTy8Hu2nIC1+y3uGtxCH/ROHaMwWz/85cYIxpwhIRCMMHlR
 qPm5giMVdmrJEHsJaWQVWt2HGwf3rcCoBl7a/D9MM0uYrpHJKHvrrCvnQhv/F1CYDbiL
 5MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2EQPOQX2t0Vz3rtvJuEbNRbtemaZYoymM7OD4ZlI5XA=;
 b=GrBE/Td+NgCLQsNd2WdHz40qOIQ080Ni3XpjRcRDqh5HF0wKYumXbnEPItZqRXVAKA
 sKhY/VKLioic1BfaaPd52J39R8dR/MvWwRTGthAonMshm3F3VslqJ6oFbnGphuVIA32n
 el4V/1DAM8vqmTLwN6AhGpLWy8Xnu1zOOB4ZwsqgmJnHScOWwROAag23lhHeUAOMcyC/
 FR1e1DHqT5Wa6LAAQEY0hEy6H9is3XH/Jj1WG4xrID2BSX62IlxiBhMBNTEgAIUTUqos
 3w/dGAFjgeLiK9STm5RXwaioim0FMxYGLLuOqk0F1CHzvuLJRXNDSpT/ljKH7sJoZPu2
 X+0Q==
X-Gm-Message-State: APjAAAVMeQSVy+xkCTKXsN9sr27GJIkZxrpUbFe8tFK4E1wDPhDYkNRF
 EfPWBbAKXFkKYRK825eB1r81LjY7JyRpBI6GBoF2OA==
X-Received: by 2002:a05:6830:184:: with SMTP id
 q4mr17375146ota.232.1580723930947; 
 Mon, 03 Feb 2020 01:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20200203074718.37252-1-pannengyuan@huawei.com>
In-Reply-To: <20200203074718.37252-1-pannengyuan@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Feb 2020 09:58:39 +0000
Message-ID: <CAFEAcA_2XthfkcyNgQqoxo+Zt66pf7Te56nB8ZAQL948D=kqVw@mail.gmail.com>
Subject: Re: [PATCH] pl031: add finalize function to avoid memleaks
To: pannengyuan@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: xuding42@huawei.com, Euler Robot <euler.robot@huawei.com>,
 qemu-arm <qemu-arm@nongnu.org>, zhanghailiang <zhang.zhanghailiang@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5FHEwklcZUgi

On Mon, 3 Feb 2020 at 07:47, <pannengyuan@huawei.com> wrote:
>
> From: Pan Nengyuan <pannengyuan@huawei.com>
>
> There is a memory leak when we call 'device_list_properties' with
> typename = pl031. It's easy to reproduce as follow:
>
>   virsh qemu-monitor-command vm1 --pretty '{"execute": "device-list-properties", "arguments": {"typename": "pl031"}}'
>
> The memory leak stack:
>   Direct leak of 48 byte(s) in 1 object(s) allocated from:
>     #0 0x7f6e0925a970 in __interceptor_calloc (/lib64/libasan.so.5+0xef970)
>     #1 0x7f6e06f4d49d in g_malloc0 (/lib64/libglib-2.0.so.0+0x5249d)
>     #2 0x564a0f7654ea in timer_new_full /mnt/sdb/qemu/include/qemu/timer.h:530
>     #3 0x564a0f76555d in timer_new /mnt/sdb/qemu/include/qemu/timer.h:551
>     #4 0x564a0f765589 in timer_new_ns /mnt/sdb/qemu/include/qemu/timer.h:569
>     #5 0x564a0f76747d in pl031_init /mnt/sdb/qemu/hw/rtc/pl031.c:198
>     #6 0x564a0fd4a19d in object_init_with_type /mnt/sdb/qemu/qom/object.c:360
>     #7 0x564a0fd4b166 in object_initialize_with_type /mnt/sdb/qemu/qom/object.c:467
>     #8 0x564a0fd4c8e6 in object_new_with_type /mnt/sdb/qemu/qom/object.c:636
>     #9 0x564a0fd4c98e in object_new /mnt/sdb/qemu/qom/object.c:646
>     #10 0x564a0fc69d43 in qmp_device_list_properties /mnt/sdb/qemu/qom/qom-qmp-cmds.c:204
>     #11 0x564a0ef18e64 in qdev_device_help /mnt/sdb/qemu/qdev-monitor.c:278
>
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
> ---
>  hw/rtc/pl031.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/hw/rtc/pl031.c b/hw/rtc/pl031.c
> index ae47f09635..50664ca000 100644
> --- a/hw/rtc/pl031.c
> +++ b/hw/rtc/pl031.c
> @@ -194,6 +194,15 @@ static void pl031_init(Object *obj)
>      s->timer = timer_new_ns(rtc_clock, pl031_interrupt, s);
>  }
>
> +static void pl031_finalize(Object *obj)
> +{
> +    PL031State *s = PL031(obj);
> +    if (s->timer) {
> +        timer_del(s->timer);
> +        timer_free(s->timer);
> +    }
> +}
> +
>  static int pl031_pre_save(void *opaque)
>  {
>      PL031State *s = opaque;
> @@ -329,6 +338,7 @@ static const TypeInfo pl031_info = {
>      .parent        = TYPE_SYS_BUS_DEVICE,
>      .instance_size = sizeof(PL031State),
>      .instance_init = pl031_init,
> +    .instance_finalize = pl031_finalize,
>      .class_init    = pl031_class_init,
>  };

The more usual way to fix this I think is to delay
the timer_new until realize rather than putting it
into instance_init, since the pl031 can't be
hotplugged.

thanks
-- PMM
