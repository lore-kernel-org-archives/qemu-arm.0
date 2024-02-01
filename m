Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp84106ejb;
        Thu, 1 Feb 2024 00:34:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/D1NOhR0ODPj2ZCiRho6zgaW7nodNlx3kB6qDiX0bR7XyrbzQC39Sx5xmTdS2TycpJqht
X-Received: by 2002:a67:ee13:0:b0:469:c0aa:73ef with SMTP id f19-20020a67ee13000000b00469c0aa73efmr4425594vsp.19.1706776443253;
        Thu, 01 Feb 2024 00:34:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706776443; cv=none;
        d=google.com; s=arc-20160816;
        b=ghGG17nzBKHeVwJqrnhx8yRB7HvjvZo/Bt6wV9Z+3WnV+UXPUf0eZYKF/AwBECzl4C
         UV8oKDkxWJh+K/VB9GMSYIhqatQcqiRc7K+eDpMZ4oU6dux5YcCoTISne9nPIrunIwBL
         JbjoasBb3QlwpN1AFJ9CiSIv/L3cjADcrrVFu1GrY/M83lAjrkWqs/rlRYlQgGp4FPM7
         ueM5MYHTSt5iBr5Qia6Ql7RAumapANqTA9nzP1QZRtE66+YCC3UacWm8jUBkGFrmBHWe
         VlzyxRAM/UC+1xlLhPRPGuYNolOvJ8LWQM6NiIaxnO8hD13rSN2L4p6C9z6wzNdibw7s
         ArNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=kN88OiUwlfiz9QVAM5hctUirK570ivcJojG41q0xe9c=;
        fh=XGrCT7vkgrABcrf6s3gbgQLYNee3z07CW+P95EOR6p0=;
        b=JcoY0mHEXJdiE3q4bVgyU/VIqGv3s00rZP+ztETJHiTJjZ+kwdNrv0frMVTmubbYIn
         +qKu0gL2vRfOMz23tTUnROMJGpapkLkiibjgkFIIKDiylQrMsTCNvnrCE8e3mygs5W/e
         9SESHYc4+JAwiPIipxUcneCre7f8LIICyx5fkB+dF2aEzt/MOTUt4zQfMuoBKik2L0EC
         nqwSxWsnwqgZ+tyJsOLDfbsyuTsDtoh7O70g0LlEXABTr2yRTIbLwn3CPbNOjeunLe4f
         VfbTfJijPLzhNa355/Sd+UAgdmdaE9PZdfMnti/+wZz+4qvAHk3KUqvmNGM4I9GML325
         gN8g==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eY3Uq5ym;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCX5MWdYM3+AUH9+2ESuN7RFs4UGJFeqnPOwI4h0MCf1v7Px45SWk+XAgaCkReSScNI5tfYiVhQSObvT+ldh5nMkB6/fXP1M
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j11-20020a05621419cb00b006819a69240dsi13970385qvc.334.2024.02.01.00.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 00:34:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eY3Uq5ym;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVSVx-0003UI-M4; Thu, 01 Feb 2024 03:33:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVSVm-0003BE-TG
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 03:33:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVSVl-0006tG-3v
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 03:33:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706776408;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=kN88OiUwlfiz9QVAM5hctUirK570ivcJojG41q0xe9c=;
 b=eY3Uq5ymSXHOU3UOzqbtWVX+OAxhEL7tmmv8/oHb4K5TGXKYZtySG1WqTGKvBmw3Sx4XIn
 YC7mjS0ecgzR+GRXk+C1eIBKu2nCYjyL1NEMzkLUaqCZsLN8CTd01kywXuG9pNa944mEgv
 5rnaVk0vG+te7a4rmOXwOk1zJiyeqHY=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-_rCmb4CzOrKxwkqCO1E_-A-1; Thu, 01 Feb 2024 03:33:26 -0500
X-MC-Unique: _rCmb4CzOrKxwkqCO1E_-A-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2d07c21f732so1072481fa.3
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 00:33:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706776405; x=1707381205;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kN88OiUwlfiz9QVAM5hctUirK570ivcJojG41q0xe9c=;
 b=bvHxjV5M7lWTlrdvCl8P7kUq4sfdPsAfrRXrcoCCeYh/31eYr1ZFf8xzOjIHf1xZfb
 TOotBSdCmbHsF2qL2wFLfJ5esz5jdF0hX/htaYkEogPiFx2fO1fYr3hEMcE4jBpTepFy
 L6TrFyX4zzLa1T/XFrBEB8IQ99wa+BxuCeiiYOY9Ut2GQQTq6oJshJs5/JNS/uIwZEPa
 eomDqtnmLBfLAFJcb9qj7e+uIK1BujO11add94USYEk5MLmV+Jiv34K44wVt/KYjypNV
 ei6mH60bASdGYEjSPFZurqvkuOLj+dWIEUhUkxAoG9zf9VjD9cK9gPHuwqlu7in5s1jY
 oQxA==
X-Gm-Message-State: AOJu0Yxb7cdjcXweCXNbiZS/TunL1bh8g/y8pSHkeopVYDo4RxpU97x3
 nAEYpblbzTXcTlc4ZPf5pO4AVWhJHOR7/TKGLT7U5xs9vUElWB7OVYaOELpPcHWuCO9s7AOExFb
 1/Daq1fIZ6l3jVefkjCAG03GqYWvkqhA5FNzrCn7cJ07xFq1AhQ==
X-Received: by 2002:a2e:958d:0:b0:2d0:60f0:ce7f with SMTP id
 w13-20020a2e958d000000b002d060f0ce7fmr2510956ljh.26.1706776405409; 
 Thu, 01 Feb 2024 00:33:25 -0800 (PST)
X-Received: by 2002:a2e:958d:0:b0:2d0:60f0:ce7f with SMTP id
 w13-20020a2e958d000000b002d060f0ce7fmr2510942ljh.26.1706776405231; 
 Thu, 01 Feb 2024 00:33:25 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de.
 [109.43.177.196]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600016c900b0033aedb71269sm10265216wrf.88.2024.02.01.00.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 00:33:24 -0800 (PST)
Message-ID: <9007b675-1f23-4b2a-96d5-d19d8f2874e6@redhat.com>
Date: Thu, 1 Feb 2024 09:33:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/isa/pc87312: Consolidate the use of
 device_class_set_parent_realize()
To: Zhao Liu <zhao1.liu@linux.intel.com>, Eric Auger <eric.auger@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-trivial@nongnu.org, Zhao Liu <zhao1.liu@intel.com>
References: <20240201084027.345459-1-zhao1.liu@linux.intel.com>
 <20240201084027.345459-3-zhao1.liu@linux.intel.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240201084027.345459-3-zhao1.liu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL_CSS=3.335,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: jd390gifWGGD

On 01/02/2024 09.40, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Use device_class_set_parent_realize() to set parent realize() directly.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/isa/pc87312.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/isa/pc87312.c b/hw/isa/pc87312.c
> index ee23f3e164df..64dd17b537f2 100644
> --- a/hw/isa/pc87312.c
> +++ b/hw/isa/pc87312.c
> @@ -338,10 +338,10 @@ static void pc87312_class_init(ObjectClass *klass, void *data)
>       DeviceClass *dc = DEVICE_CLASS(klass);
>       ISASuperIOClass *sc = ISA_SUPERIO_CLASS(klass);
>   
> -    sc->parent_realize = dc->realize;
> -    dc->realize = pc87312_realize;
>       dc->reset = pc87312_reset;
>       dc->vmsd = &vmstate_pc87312;
> +    device_class_set_parent_realize(dc, pc87312_realize,
> +                                    &sc->parent_realize);
>       device_class_set_props(dc, pc87312_properties);
>   
>       sc->parallel = (ISASuperIOFuncs){

Reviewed-by: Thomas Huth <thuth@redhat.com>

