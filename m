Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp404773ejr;
        Tue, 10 Oct 2023 13:41:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQ1VvQ+CvrHxlhYgHK81dxJfXYUoIKhyLrMU+HCS5yZ1GYatL+/6xKuKXMBDJxrgWNE7bN
X-Received: by 2002:ac8:5981:0:b0:418:1194:42f6 with SMTP id e1-20020ac85981000000b00418119442f6mr22830701qte.31.1696970509391;
        Tue, 10 Oct 2023 13:41:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696970509; cv=none;
        d=google.com; s=arc-20160816;
        b=eh5YTNKGE2JnL9UxEGbzoUu2lvg7yYur+5tCbpVFXLQx+sLFQdZKOUdK4Uj6i3PffS
         vPs8jTTsLw6ylF4z10H0pYxy+ZPaEvQXph960PONuY77eH9x4S/y4WwOdg+g/F4jUjGT
         Mmr3cZsP8Fc68v0R7wVDPUMzWFyI2lu1hJZmu7OFbA7PpFhdi05N26CTZD1p5YZaKLs7
         g8OGUDTD76oGVwTVJKLFswZvMozzHOfF2ybKybc/Q+6cc5Va91UG4WS5J9Qc/5WTGwcX
         cutPaAfl//NwpQcD0hhAZHx25rUul00TV6BoBpSOkwE+UPnyaX3pda743FXDXiG328ES
         nSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Mlml52KYEl6hPBbxf5dC0hWl1GcKGoq7JsMQPRCXH6A=;
        fh=obllUwwYlKaweFRjJI5X4dDrMU6xfGW8nM0990wlKoc=;
        b=vTEaT7SPBtvIA5IZpt542SN7iJBBfdXqiQ9A5lf9uZSzDCFiqELTS5S3ERaBQdw8MW
         rhQLC5ZkaG52ajgn5Os160bLgxfX5ZqKYQDIlmvDe1bZP2Xi3OcqBvrOIgqPUJXIAwCA
         YiJeP3msDNxyYyuCn4yN8CTr0YY9LDrirBsmkoTJ3c3kNLh9ZbDOVsD+4TW5703ykRAB
         0jgVgnk06mGckyqVKU/3sJ1xosxbP138K0vwZGROBzm+aGI7/vS7UiRRE++hVtH4vV1K
         2DPKbkWVh1z4850+AMe/pOzb+ubRGfsDYuMLsEsGH1gdswCGeiBLZEzX49ghbiI+5w0U
         VfyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hgqmommZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d2-20020a05622a15c200b004180f8c4f04si8312597qty.571.2023.10.10.13.41.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Oct 2023 13:41:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hgqmommZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qqJXy-0000c4-Ie; Tue, 10 Oct 2023 16:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1qqJXw-0000YA-6t
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 16:41:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clegoate@redhat.com>)
 id 1qqJXt-0006gh-B3
 for qemu-arm@nongnu.org; Tue, 10 Oct 2023 16:41:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696970495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mlml52KYEl6hPBbxf5dC0hWl1GcKGoq7JsMQPRCXH6A=;
 b=hgqmommZ8P3x8+s5mmHUTTYkb91/dJlyNhLFBxzUxjG+haWP9ZASoYL09HXyEigpNW4cZf
 lN3VHD8FR6BguNFUZx2Y0IIkHkz+OHdOg770qyyFWmYKhopKd8NVchROJnjbPWgLKKWmbB
 n4fGD0BW+mK/YR+XFAXH8rZbtFGI4iI=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-100-fOw0ZLyoMsO-FgK_i6ZrUA-1; Tue, 10 Oct 2023 16:41:33 -0400
X-MC-Unique: fOw0ZLyoMsO-FgK_i6ZrUA-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-774105f6fb1so696900385a.3
 for <qemu-arm@nongnu.org>; Tue, 10 Oct 2023 13:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696970492; x=1697575292;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mlml52KYEl6hPBbxf5dC0hWl1GcKGoq7JsMQPRCXH6A=;
 b=ogtA04xZOLF49PhuIHTNXX0xUZ/kSM7A2J5i5xYpkzJ2kEaGjd6B3h7G+VrI5qIPGl
 vGvBMd1cRawWk7uXTpjMU89QplGT2JF1dYazeiqFMBXDrTLiqhMON1RrDYDIs7CKc7Gv
 nubZXPRK6a6PpVgWS5HIHJ1prhXPhDQcwtFp3R0MKWU+iZctctSvh2PuP+kMOv000ryM
 Kv7VL2r5fzqEsXpLvJRIdkHuzj9/7HhieegH/GiSpOvQAdo2efZeJGBgEONjArNuzZRZ
 q9q3R0lkEbT5tZPoFt2EAcCuoW1o0A82dya+6U6Pnb2ugwyewPK8WlPKgVT/zDngkmuF
 gpHw==
X-Gm-Message-State: AOJu0YyAsCDSw1LU3HpYQAyoLwT5YAFU6z+Kkzf+WXInU92PNqpEamfw
 jjXF4oas76o9q1Z9SMdgqq3TZpRtoU5sXH24GiTYz4zZ4SKllJPbCEvsoi8l1OV6U17LewL6k9p
 OxIIljCL0jSNDDP6EiYvm
X-Received: by 2002:a05:620a:2a03:b0:776:5135:d98c with SMTP id
 o3-20020a05620a2a0300b007765135d98cmr20425222qkp.15.1696970492634; 
 Tue, 10 Oct 2023 13:41:32 -0700 (PDT)
X-Received: by 2002:a05:620a:2a03:b0:776:5135:d98c with SMTP id
 o3-20020a05620a2a0300b007765135d98cmr20425209qkp.15.1696970492399; 
 Tue, 10 Oct 2023 13:41:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 m19-20020ae9e013000000b00767dcf6f4adsm4605283qkk.51.2023.10.10.13.41.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Oct 2023 13:41:32 -0700 (PDT)
Message-ID: <4a6e370f-f966-8905-a4ec-338ea42da980@redhat.com>
Date: Tue, 10 Oct 2023 22:41:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v3] misc/pca9552: Fix for pca9552 not getting reset
To: Miles Glenn <milesg@linux.vnet.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, clg@kaod.org, andrew@codeconstruct.com.au,
 joel@jms.id.au
References: <20231010195209.264757-1-milesg@linux.vnet.ibm.com>
 <57112a6f-2624-4bd5-b301-cd28cb197771@ilande.co.uk>
 <1fcb9e1820b2ca5c5e6b84d7186c328c1df426e8.camel@linux.vnet.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clegoate@redhat.com>
In-Reply-To: <1fcb9e1820b2ca5c5e6b84d7186c328c1df426e8.camel@linux.vnet.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clegoate@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.339, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ErL4IKuLCuX0

On 10/10/23 22:35, Miles Glenn wrote:
> On Tue, 2023-10-10 at 21:31 +0100, Mark Cave-Ayland wrote:
>> On 10/10/2023 20:52, Glenn Miles wrote:
>>
>>> Testing of the pca9552 device on the powernv platform
>>> showed that the reset method was not being called when
>>> an instance of the device was realized.  This was causing
>>> the INPUT0/INPUT1 POR values to be incorrect.
>>>
>>> Fixed by overriding the parent pca955x_realize method with a
>>> new pca9552_realize method which first calls
>>> the parent pca955x_realize method followed by the
>>> pca9552_reset function.
>>>
>>> Signed-off-by: Glenn Miles <milesg@linux.vnet.ibm.com>
>>> ---
>>>    hw/misc/pca9552.c | 7 +++++++
>>>    1 file changed, 7 insertions(+)
>>>
>>> diff --git a/hw/misc/pca9552.c b/hw/misc/pca9552.c
>>> index fff19e369a..4e183cc554 100644
>>> --- a/hw/misc/pca9552.c
>>> +++ b/hw/misc/pca9552.c
>>> @@ -384,6 +384,12 @@ static void pca955x_realize(DeviceState *dev,
>>> Error **errp)
>>>        qdev_init_gpio_out(dev, s->gpio, k->pin_count);
>>>    }
>>>    
>>> +static void pca9552_realize(DeviceState *dev, Error **errp)
>>> +{
>>> +    pca955x_realize(dev, errp);
>>> +    pca9552_reset(dev);
>>> +}
>>> +
>>>    static Property pca955x_properties[] = {
>>>        DEFINE_PROP_STRING("description", PCA955xState, description),
>>>        DEFINE_PROP_END_OF_LIST(),
>>> @@ -417,6 +423,7 @@ static void pca9552_class_init(ObjectClass *oc,
>>> void *data)
>>>        PCA955xClass *pc = PCA955X_CLASS(oc);
>>>    
>>>        dc->reset = pca9552_reset;
>>> +    dc->realize = pca9552_realize;
>>>        dc->vmsd = &pca9552_vmstate;
>>>        pc->max_reg = PCA9552_LS3;
>>>        pc->pin_count = 16;
>>
>> The reason that the reset function isn't being called here is because
>> TYPE_I2C_SLAVE
>> is derived from TYPE_DEVICE, and for various historical reasons the
>> DeviceClass reset
>> function is only called for devices that inherit from
>> TYPE_SYS_BUS_DEVICE.
>>
>> Probably the best way to make this work instead of mixing up the
>> reset and realize
>> parts of the object lifecycle is to convert pca9552_reset() to use
>> the new Resettable
>> interface for TYPE_PCA9552: take a look at commit d43e967f69 ("q800-
>> glue.c: convert
>> to Resettable interface") as an example, along with the documentation
>> at
>> https://www.qemu.org/docs/master/devel/reset.html.
>>
> 
> Ahh, that's very helpful.  Thanks, Mark!

yes. My bad, I didn't look close enough. Thanks Mark

C.

