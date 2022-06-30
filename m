Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp84597lft;
        Wed, 29 Jun 2022 23:35:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s4a8nwB9YEvKZsNY66R00x2+Nqm2mk/TXkykrEEAYNsBcsTEKaQyMewK8xUK5XY3fCrBMK
X-Received: by 2002:a05:6214:e4b:b0:470:a060:4536 with SMTP id o11-20020a0562140e4b00b00470a0604536mr11247399qvc.108.1656570915984;
        Wed, 29 Jun 2022 23:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656570915; cv=none;
        d=google.com; s=arc-20160816;
        b=T6TYwR1RfIelajMMFejJaV/Ygss4b8932YM44jYUlbGu5xicv8IHmmoHiHIgV5DbFp
         B4WbX2NY85uSVrf21ygX/S2+xsRCkivIBqpqDfQlWgxDISOlrxlZvdEUehZvl+/Q+hfa
         qS41GP9zlod6AL9Lq2z6NwwD7A0fz1Zk3/1svssqyhRjNpx9t3gfv0s6VYmL5fMe+YHV
         1mYaO1xqgo2mkHtVma7Lx+nf3RbQ4YUA5SRGr1+uC2UXVMztlfy718pKRJkOXyCCHyEs
         teWhW46lUDd5unrDZlhxYqRMpLxf+Az8JbblGN6bdSX+o+SPffuiomkATsqUMM/vemCB
         27QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=bQO+fiOwPTdQk4QamHzlFNePXB70vFloY1jZmkyIJfY=;
        b=XNZgfOpZ0jv95yyKBNfylhZfqTU8Q4MOV99+DQKmtlAogS07ortsqu6evK1z7+ehke
         6VVMEkamiTeekcJsji7HveLk9YY17KX38hueTGemzkNEh7KUHXl7e42UnivKaU4Wcpa2
         j977kSPXuLoGlFwbN6NHEYBwMzYh8zB/RIShy3DIPP3I6V/ZlxA7oUkOP8zVkbaj1H9m
         QRoQWPuGItFcOxlV2kAVPd1NbH29dEG0zgE4jmS/1pEt8TVoHuLVldscaTYsgjDyw2SI
         vbXp3I4789QF+9542iL7OEFgfDfVVt5mIwvq7DV+NhpfSdLNwKivpcwCqiWDKuEZsvSn
         1bhA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b63-20020a376742000000b006a725ec488esi9544907qkc.263.2022.06.29.23.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jun 2022 23:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o6nlj-0001D3-6B
	for alex.bennee@linaro.org; Thu, 30 Jun 2022 02:35:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6nhD-0007S3-Q5
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 02:30:36 -0400
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:39423)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1o6nhA-0003Ba-2O
 for qemu-arm@nongnu.org; Thu, 30 Jun 2022 02:30:35 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.188])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 27E8F112D1564;
 Thu, 30 Jun 2022 08:30:26 +0200 (CEST)
Received: from kaod.org (37.59.142.108) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Thu, 30 Jun
 2022 08:30:26 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-108S002e663bd8b-643d-4c5c-bce4-3ffeff82c086,
 40551C6C823FDDA91B74F5D58A080B55BE22893A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <293da11c-dde2-e646-c754-820720c410de@kaod.org>
Date: Thu, 30 Jun 2022 08:30:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 10/14] hw/sensor: Add Renesas ISL69259 device model
Content-Language: en-US
To: Peter Delevoryas <me@pjd.dev>
CC: <peter.maydell@linaro.org>, <andrew@aj.id.au>, <joel@jms.id.au>,
 <cminyard@mvista.com>, <titusr@google.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <zhdaniel@fb.com>, <pdel@fb.com>
References: <20220630045133.32251-1-me@pjd.dev>
 <20220630045133.32251-11-me@pjd.dev>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220630045133.32251-11-me@pjd.dev>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.108]
X-ClientProxiedBy: DAG5EX2.mxp5.local (172.16.2.42) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 302db3fe-05b8-4f67-839c-1dc1529433cd
X-Ovh-Tracer-Id: 4828421751850830770
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrudehtddguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepkfffgggfuffvvehfhfgjtgfgihesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelleeiiefgkeefiedtvdeigeetueetkeffkeelheeugfetteegvdekgfehgffgkeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdpnhgspghrtghpthhtohepuddprhgtphhtthhopehpuggvlhesfhgsrdgtohhmpdfovfetjfhoshhtpehmohehvdel
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7fGyS819bOUB

On 6/30/22 06:51, Peter Delevoryas wrote:
> From: Peter Delevoryas <pdel@fb.com>
> 
> This adds the ISL69259, using all the same functionality as the existing
> ISL69260 but overriding the IC_DEVICE_ID.
> 
> Signed-off-by: Peter Delevoryas <pdel@fb.com>
> ---
>   hw/sensor/isl_pmbus_vr.c | 28 ++++++++++++++++++++++++++++
>   1 file changed, 28 insertions(+)
> 
> diff --git a/hw/sensor/isl_pmbus_vr.c b/hw/sensor/isl_pmbus_vr.c
> index 799ea9d89e..853d70536f 100644
> --- a/hw/sensor/isl_pmbus_vr.c
> +++ b/hw/sensor/isl_pmbus_vr.c
> @@ -119,6 +119,18 @@ static void raa228000_exit_reset(Object *obj)
>       pmdev->pages[0].read_temperature_3 = 0;
>   }
>   
> +static void isl69259_exit_reset(Object *obj)
> +{
> +    ISLState *s = ISL69260(obj);
> +    static const uint8_t ic_device_id[] = {0x04, 0x00, 0x81, 0xD2, 0x49, 0x3c};

This looks like an ISLClass attribute to me. In which case, you wouldn't need the
reset handler nor the 'ic_device_id_len' field.

Thanks,

C.

> +    g_assert_cmphex(sizeof(ic_device_id), <=, sizeof(s->ic_device_id));
> +
> +    isl_pmbus_vr_exit_reset(obj);
> +
> +    s->ic_device_id_len = sizeof(ic_device_id);
> +    memcpy(s->ic_device_id, ic_device_id, sizeof(ic_device_id));
> +}
> +
>   static void isl_pmbus_vr_add_props(Object *obj, uint64_t *flags, uint8_t pages)
>   {
>       PMBusDevice *pmdev = PMBUS_DEVICE(obj);
> @@ -257,6 +269,21 @@ static void raa229004_class_init(ObjectClass *klass, void *data)
>       isl_pmbus_vr_class_init(klass, data, 2);
>   }
>   
> +static void isl69259_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +    dc->desc = "Renesas ISL69259 Digital Multiphase Voltage Regulator";
> +    rc->phases.exit = isl69259_exit_reset;
> +    isl_pmbus_vr_class_init(klass, data, 2);
> +}
> +
> +static const TypeInfo isl69259_info = {
> +    .name = TYPE_ISL69259,
> +    .parent = TYPE_ISL69260,
> +    .class_init = isl69259_class_init,
> +};
> +
>   static const TypeInfo isl69260_info = {
>       .name = TYPE_ISL69260,
>       .parent = TYPE_PMBUS_DEVICE,
> @@ -283,6 +310,7 @@ static const TypeInfo raa228000_info = {
>   
>   static void isl_pmbus_vr_register_types(void)
>   {
> +    type_register_static(&isl69259_info);
>       type_register_static(&isl69260_info);
>       type_register_static(&raa228000_info);
>       type_register_static(&raa229004_info);

