Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3815241wru;
        Mon, 30 Jul 2018 07:03:43 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcjflYWNgTivRrNbxAnpYoByoIv2dNlXXMVhSm5d+hVNe9ScSCBgpVfEjPnmvhJAmYmy4Xi
X-Received: by 2002:a0c:f411:: with SMTP id h17-v6mr15279888qvl.25.1532959423783;
        Mon, 30 Jul 2018 07:03:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532959423; cv=none;
        d=google.com; s=arc-20160816;
        b=KOVy5Ci3Mi73YY9n1mTM1gqLS7zwSGIlvkc2sv8NizF5KXtM0nV8QjOpbyl/zUrADx
         ZymIQOt2mJbtnXFrb+GMkWNtG2xXTXxJ92EkV9+l5Ou/SuFWbvWVtdyvvycyGLr7QLnJ
         ogmT6gax5JiXoCQEuDKr44aNLwYMBuuCIUJA43AH0o9CZMask51XOxnIZ8YlZI5BMUnk
         NWoibNJwrZnJFKTtOKVqyt7IF4p7ScGJOXY9uRyACOwau/Esz/4h2HlfjiOAHdI6NhIn
         RiPNOfF9LziKqYrZ/HaeLTCqyuDGll80TZgAl3hc8nAJUTx6RbFPsKhMtWzYB36jsa+j
         r4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature:dkim-signature
         :arc-authentication-results;
        bh=Ane8f9Z9yFKKeClPlC/QBR0jNIgyQSmqBIv2i+pFAm0=;
        b=XcmFty7DWgrbN8YnyOOK0F2DY6cHlOlbP7RTCulhQlFvfrzSoIPwqKesGJiKGZy65K
         2VWkVapK68XwWuTZyB6IWX+os7dw7YGRvsTWd8vTgDILNtGdHEhYbcHVtE0G2h1ZA9nC
         2zHS/StSlfdXfFjclSOAHghOaiQVQO1kfDZyKKN4u+alZZvB8xZDCRZYQBu0z4eAXDpn
         qyGrDm/5MPlzrtW4MNo7GTjNqFf5MmQgQOTIyaCu2ryD407+2GMFIBCA3QCHv4PEIC30
         gWScifQ88s6+z4dsee8xxiZ71UgDdgnOQouQFTbY4Nj/CgqlAwCi98RpJo8ckzrkW0Mm
         NHsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dbFM4aws;
       dkim=fail header.i=@jms.id.au header.s=google header.b=U3Ke3+K6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d17-v6si2602063qvo.36.2018.07.30.07.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Jul 2018 07:03:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=dbFM4aws;
       dkim=fail header.i=@jms.id.au header.s=google header.b=U3Ke3+K6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52810 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fk8lz-0000zv-21
	for alex.bennee@linaro.org; Mon, 30 Jul 2018 10:03:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54918)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fk8lj-0000yM-Kf
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 10:03:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fk8li-00088A-Qb
	for qemu-arm@nongnu.org; Mon, 30 Jul 2018 10:03:27 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:39249)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fk8lY-000836-Ki; Mon, 30 Jul 2018 10:03:16 -0400
Received: by mail-qt0-x241.google.com with SMTP id q12-v6so12129667qtp.6;
	Mon, 30 Jul 2018 07:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Ane8f9Z9yFKKeClPlC/QBR0jNIgyQSmqBIv2i+pFAm0=;
	b=dbFM4awsKMMaiKlNpXImqBKyjLe5KK7Qel0QoR8SQwIYHI/D6xYsyTIqP819FYq2zG
	SSEtbHrR/VFkDHdHm016CV56AQewwovYTc29WsHKYLT9B0ixhJrAdztHM8Qd2k3pz0vt
	iyIHCZczmr6gONn9s/A3nJ84SVhkBYI5dBhh+TXsvOP7zP/Lf3tTjAMIRDIkhrLELrYQ
	gqsx+ePo1usrtwfbeWscxGsFLhJDMhVs3f6BpLsvD1n37Tly+lB85f9yU/ckYhsNapNH
	7+b0WoJ9bTPAYAhj4xiMP0qch/eLn7TrnDkGoZD0zJl37jU30PnuEiZbUtS3VaOCkFl5
	9VNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Ane8f9Z9yFKKeClPlC/QBR0jNIgyQSmqBIv2i+pFAm0=;
	b=U3Ke3+K6zuXo280o+iBCW3nhrzNcXfazh17QVMSQxKR0r7g0EeKsj4WtOS7eTcLAQ+
	sEfvjZOZfwcKTQXv5YuJ96E29w5JAKGp/Smfs2pTEiu1TMAJKJs8CvC1v2TzrP/DPIWu
	EGjx07eE2l1qtjZMFHhuljZMBsdmt5tVCVmy8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Ane8f9Z9yFKKeClPlC/QBR0jNIgyQSmqBIv2i+pFAm0=;
	b=CuWq65d8fdIpoCjL5kYhNfydHLjTbx2Qluu5iiKJ1YoH3sepNByo8foKqKeyLB8A4B
	QQ0nXE3gL8Ay/8tLWa9npfojl9Z7CwAG1e3eWFgKLQ/UNFcKIUaAjph1Dls1TxZXbxBI
	8/xr+5EVA8eZaMGvD8vbUS32x7ARKMX/YnSMwPTz3rbuV2nESeJodW1xky7RyqeoxpGY
	JQqdjIHhI0vL06Ff7dSKZ8QfSo/fOOk2YUHysBTPbT3DExY1taNtpOCkePzv4UAS/jK2
	9SoTTLYW/BaAso897SV5fY/QjDEsDBlEYBuii8jYDV7g86vNtC7QSoSo0weQ4y9FFt2V
	i1Uw==
X-Gm-Message-State: AOUpUlHpm0zCSBxuoacemCZ/wu2y+23zpFikgtABe9z3/E1lR3dO+8hd
	fh7NqRjXv/gGeIcs4+lgGKl9ADw8XwprHNzVmew=
X-Received: by 2002:ac8:679a:: with SMTP id
	b26-v6mr17272835qtp.347.1532959395780; 
	Mon, 30 Jul 2018 07:03:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac8:169d:0:0:0:0:0 with HTTP; Mon, 30 Jul 2018 07:02:55
	-0700 (PDT)
In-Reply-To: <94bc2d11-7916-bc4e-02d8-da62e3ed303b@mail.ru>
References: <20180726023645.13927-1-joel@jms.id.au>
	<20180726023645.13927-3-joel@jms.id.au>
	<94bc2d11-7916-bc4e-02d8-da62e3ed303b@mail.ru>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 30 Jul 2018 23:32:55 +0930
X-Google-Sender-Auth: LAGc5LX_Q9e7QBW-TO4ZLGhonWA
Message-ID: <CACPK8XfYvU8+0s+FBGe7NuAst38ska0vpS8HVPWkM8OHyLFpdQ@mail.gmail.com>
To: Julia Suvorova <jusual@mail.ru>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH v3 2/3] arm: Add Nordic Semiconductor nRF51
 SoC
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?Q?Steffen_G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Jim Mussared <jim.mussared@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mQWlghyiZIu6

On 26 July 2018 at 20:31, Julia Suvorova <jusual@mail.ru> wrote:

>> +++ b/hw/arm/nrf51_soc.c

>> +static void nrf51_soc_init(Object *obj)
>> +{
>> +    NRF51State *s = NRF51_SOC(obj);
>> +
>> +    memory_region_init(&s->container, obj, "nrf51-container",
>> UINT64_MAX);
>> +
>> +    object_initialize(&s->cpu, sizeof(s->cpu), TYPE_ARM_M_PROFILE);
>> +    object_property_add_child(OBJECT(s), "armv6m", OBJECT(&s->cpu),
>> &error_abort);
>> +    qdev_set_parent_bus(DEVICE(&s->cpu), sysbus_get_default());
>> +    qdev_prop_set_string(DEVICE(&s->cpu), "cpu-type",
>> ARM_CPU_TYPE_NAME("cortex-m0"));
>> +    qdev_prop_set_uint32(DEVICE(&s->cpu), "num-irq", 96);
>
>
> Where did this number come from? ARMv6-M NVIC supports only 32 interrupts.

I think this was left over from when I was first creating a m0 based
system (efm32hg) over a year ago. Good catch.

I couldn't see a table of valid interrupts in the nrf51 datasheet. Are
you able to find this information?

If not, I will re-spin with the number of irqs set to 32.

Cheers,

Joel
