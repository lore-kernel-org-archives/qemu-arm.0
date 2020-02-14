Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp1973346lfp;
        Fri, 14 Feb 2020 06:27:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqy5l6Lm7auN+n3d1PRcTyvKnzh6yS1ArlsMH/Z5NAcIblwI3/ueFHhY0gUXJ10xX8Pp4E3V
X-Received: by 2002:a0c:fec3:: with SMTP id z3mr2286579qvs.111.1581690420139;
        Fri, 14 Feb 2020 06:27:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581690420; cv=none;
        d=google.com; s=arc-20160816;
        b=E7bmJALVbpXpv6t81IQKQe2Ly9FV2PGEsb5K7xKc/UKxRJ5UL6GjL6x2zZMF6t07K9
         xcZ/kBrEGU0EgiTdWs9CAnZS3K/rzMLAx5r8zyfvuDdeXUE4G0t2wLCkfms6YtIS9HJe
         t82yVmjsJ247R9I4YVs8v95tc/Oo3uKzLy0GuOs/6SlAY0XzE9l1vpPvQujx5WE9Y56j
         67PCs5alR1bveaAX8U9bYGJyFQkVRH9i4HVVhNjSoxQBfKm7q61Nl1DMjSqCOs5Pu4pQ
         IftEenta/VxKULlmI9M25buD1amLHlTZW4dCpMmU0vhYD6dBIOe8H9b+qrsDKzd0Qy3f
         CpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=eY3vOUcsAaeAD2/crVnO3Sv19z9so2Ylgmn74tRhRJY=;
        b=ysojvwFNmqnx/J3kZySQ+1nty7OeSEzoLTBIP7uDH7OSImdItXqiLT588uwhsjgbkH
         kKD+E4ziersDzfduU6AzBBcuPutWNIfAIcsSJXhD8/rgR7DT7DzQIq+0chvaq4cMJAVp
         RaVRvxRxLPkSEaWnY/SR5Erg7YiaETLLeE7kuF6F+hCGux6dSAIW99QpvAu8YqHXzWd4
         zhreYN69RJ9ZDu+AsZGSmdchzzw9qzbftltr991HPw9BenJKwFI8XGh8Ft1vXTkELEqn
         MmEkQ5UcAMeFZ2CXgHUbFMET0c4HlfcktKTwA6B5Ox7EMAcEhxSB5a4f1XAPGFchI/mf
         dPww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gSKJueX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17si2749850qtm.13.2020.02.14.06.26.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2020 06:27:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=gSKJueX3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2bvn-0001Qy-IH
	for alex.bennee@linaro.org; Fri, 14 Feb 2020 09:26:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groeck7@gmail.com>) id 1j2bvS-0001Oy-H7
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 09:26:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groeck7@gmail.com>) id 1j2bvR-0006RB-1V
 for qemu-arm@nongnu.org; Fri, 14 Feb 2020 09:26:38 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:37558)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <groeck7@gmail.com>)
 id 1j2bvN-0006Jm-6a; Fri, 14 Feb 2020 09:26:33 -0500
Received: by mail-pl1-x644.google.com with SMTP id c23so3800031plz.4;
 Fri, 14 Feb 2020 06:26:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=eY3vOUcsAaeAD2/crVnO3Sv19z9so2Ylgmn74tRhRJY=;
 b=gSKJueX3l3dr2qZdd+ylScIdzAymHKUVG7Iv3uTlVnuksvx7uhSdzcqhGjewDMEkyE
 Bq3s8bnLV1ELoO2FpdK5DPuMe/beQFvsn68LWMOUM69zGi1gB5SMooVxCoR/6Z4e6K9E
 wktfj69BscRhb9+1OwnrlvpVdtCfPkgALOWabglkWyOLhRNnGzy5g5QooEAvIrm0WHfu
 NPzh6RRwZzwwnAJZf519PsJ86eQzXs/WYzvmjMN9XzMZ9K98hZdzW+KKnQSigrUnh3jn
 tHR0yYTcHaupAdT7ZrW1QHdFd7R/W5monjFNbrDbUe8MiJkLtIW7arMZCs5dwqemCoks
 mS4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=eY3vOUcsAaeAD2/crVnO3Sv19z9so2Ylgmn74tRhRJY=;
 b=L0xR7ICID/0UCIeL0CDzvuZLaMzEmTGbVpzgefUxI9mT0SqbiQAUmqjEcoAhAqM3QR
 8T6akk/CIk+Sg/zfl85aSCuAivHcJZ0bcA2Z2f4NPnyU2PXby+eB1IEJ0oTb0sSqBhhK
 KlQs39dqsknkGAlOQBSBVzQgYiCQux0cuUxuGr+QDOO7RDlIfRleaN1gH+AOgB2zpWBQ
 ji5txOX+lETtud1t/jqzqKPWMQqO/sUWhRtNymbBGHdY5YlgIZkemdxpddW+s3ds9+Xd
 fTbukiZux86RdOtf/CDpic4UjYAPMfVXvDQrbwD4iPKMA7O65YbOza+WPXao3iPj/QI0
 S3vg==
X-Gm-Message-State: APjAAAXxXc4ueCchpiloFEwdXJmoE5b6dx1FhZRPAaYO+nOmkxy+OwG9
 84DF6FYtXXVhHgwuggQ3TJQ76/Zk
X-Received: by 2002:a17:90b:97:: with SMTP id
 bb23mr3709789pjb.53.1581690391132; 
 Fri, 14 Feb 2020 06:26:31 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t65sm7171884pfd.178.2020.02.14.06.26.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Feb 2020 06:26:30 -0800 (PST)
Subject: Re: [PATCH 3/3] arm: allwinner: Wire up USB EHCI
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20200214062109.24494-1-linux@roeck-us.net>
 <20200214062109.24494-3-linux@roeck-us.net>
 <20200214100837.lv2cok5he7epmu7i@sirius.home.kraxel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <db087bc9-eb23-0b6e-b3aa-5309d824f6ef@roeck-us.net>
Date: Fri, 14 Feb 2020 06:26:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200214100837.lv2cok5he7epmu7i@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SVgviH2iZMC+

On 2/14/20 2:08 AM, Gerd Hoffmann wrote:
>> ehci-platform 1c1c000.usb: new USB bus registered, assigned bus number 2
>> ehci-platform 1c1c000.usb: irq 31, io mem 0x01c1c000
>> ehci-platform 1c1c000.usb: USB 2.0 started, EHCI 1.00
> 
>> +        for (i = 0; i < ARRAY_SIZE(s->ehci); i++) {
>> +            object_property_set_bool(OBJECT(&s->ehci[i]), true, "realized",
>> +                                     &err);
> 
> I suspect the ohci controllers are ehci companions, i.e. they handle a
> single usb bus, with ehci handling usb2 and ohci handling usb1 devices?
> 
> If so then you should initialize ehci first, explicitly assign bus
> names and set the masterbus property for the ohci controllers.
> 
> See also docs/usb2.txt
> 

Thanks for the references. Makes sense; I'll give it a try.

Guenter
