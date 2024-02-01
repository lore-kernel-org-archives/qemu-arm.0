Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp83701ejb;
        Thu, 1 Feb 2024 00:33:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGdaAf52b2K4VoahCgjKrt9jgB1l3TlMLOnAacpJ6lewCrfHoihH+iARFz6XwTOhEnwqISD
X-Received: by 2002:ae9:c105:0:b0:783:4dfb:11ae with SMTP id z5-20020ae9c105000000b007834dfb11aemr1767398qki.63.1706776389339;
        Thu, 01 Feb 2024 00:33:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706776389; cv=none;
        d=google.com; s=arc-20160816;
        b=ccd3InDQHCpv38I4l0WRBwJO6gQOTpDFqYriE0FyNzvtuYQ5UNhtfSler90YO7/2qW
         W95WGrcQMFKcd0CdLnSYd1Q0V9/bx4KlhgAmMyt8lF938IR25K1z7b6NAWZE/eiZYFlq
         s81VN6D5DbgewfW9nBRQ8afOKAJb9Ji2cbI0fQBlNsCNfyNVGSL14FGzCWzl3hly7Yrc
         nnqGtLXsyci16IrwImdKzNWRGQuNkViy5v1VNUjEPUm3EIXuFsUDV7uRhqPU2u0Sxzx9
         s65wG8go2pl0/dTtkYzAyctZ/2N0t/8XFWf+LCEIprLkmiPlyYebCG8PT0onZQ6GB1vD
         YmDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=w7ot/Y+WNmzsaSXxKZWZhGhJPimy0UW3mXSyOPRlXG8=;
        fh=utNSU90eVUFL42+1xw0xkL8RpVqta8yvEz/u+pzNx88=;
        b=c3S3lT64KuSAVGmD5gSmWe4HeON2Y8mH3ECPxHNiLXEj6yOIpDEfhMBOvUy+4J97i1
         ikUqTZqWEindhqypEEOoxHJJ5sU0PQShkc9hpsvHAoSrj9CMEABefPkyE8GOynxZWO87
         8c+0dPeU2vkVyyFU7vzuT46+ObHHmxnUTtPM3hAYvBsE+EvzPwteKi0Eim6thJpwu937
         OvUWCSHpJy5KsSKIJFsANwjUvGeEyiG39ILdOBrmhC7iqkJqGcnxqIQiOW5KPUoDmtFA
         cklopgm7e51BflNAAICcrinYIRkYxPeaJmmpGScmeGPG2q3B/iL8l7bu1S2i4qfHEoWc
         eKnw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=feZvPzJN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCVrJSCvVxt5kpldQRMizRBTSvM787kYZHxFx/YVzKoYxWGTh0z4vqJs+N/KobrcxOav/t5UJoQhhvDesBjJXZ4ybZSbdk9g
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g10-20020a05620a13ca00b0078409f76822si5758018qkl.105.2024.02.01.00.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Feb 2024 00:33:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=feZvPzJN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVSV5-0002WN-0y; Thu, 01 Feb 2024 03:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVSV2-0002Ub-9F
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 03:32:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rVSV0-0006mK-Qs
 for qemu-arm@nongnu.org; Thu, 01 Feb 2024 03:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706776361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=w7ot/Y+WNmzsaSXxKZWZhGhJPimy0UW3mXSyOPRlXG8=;
 b=feZvPzJNsAQ5+Q7jUL5yyi5tm3f8/oyg5FR9yy27ZO2e03/aNaa2f+zUmUav1AmhfJT6Wr
 LJm/2mPVERL9vm/cV9PCe0bIEgRnSCkBlE/AnXrmK/E9z9v70fB5PbSkIdqN1E/sw5b2+Q
 0kyqEVJl8dXi6ozAxSMp0Y+7NoUX1GU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-_aFoxPdbMxu4fcFEoA2CHQ-1; Thu, 01 Feb 2024 03:32:38 -0500
X-MC-Unique: _aFoxPdbMxu4fcFEoA2CHQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-40e53200380so3752625e9.3
 for <qemu-arm@nongnu.org>; Thu, 01 Feb 2024 00:32:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706776357; x=1707381157;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=w7ot/Y+WNmzsaSXxKZWZhGhJPimy0UW3mXSyOPRlXG8=;
 b=IImQLY4D8sLBLuB9FzKL/Rt3qgWQEmz/xE9r/71qXVMqwhMAKjXxTBs2IgNUYcVKgL
 iVF1xxuFRmYFTsCiW9g5RCGsJyEX6GM8dyxxLfcmZRPrG883hLnFRSmliF9Fy89yvf9f
 W3KgPgyQIOH9Wv3pUw6FtK21HaRkeKDzcnefeujCiuhKKzIuIegLlTpy/0Ozz5dfpdtb
 XCPLcAeAHe3F2zd1m3JMXemwmJtz8Nkj8LR0nq/224aOzszkRfZklaeOt+FOHlL0eEwE
 ckEkcPk8Er4DrumMHIbOV2Aogo1W8hTdUjE4vtj33Ye1kY+8GAcVNaHMBxJs/flBKjue
 lffg==
X-Gm-Message-State: AOJu0YxHVanVWjFPKdNPMA6/ikSZERqa423mVd17jmi4Sn9fO/QdNH2C
 jWRt4sn1ZiXsxygYCM+VIQgmtEhqvT8aqkB1xhooPgTpjq2SLvfB668ZfIijbtKXB4igpqt2niP
 ldr11GJhaNZ8QGFOHiG4u2Vld8avp+YJ/enSCLQb3SijnHGk/Sw==
X-Received: by 2002:a05:600c:1da4:b0:40f:c231:324b with SMTP id
 p36-20020a05600c1da400b0040fc231324bmr79264wms.7.1706776357512; 
 Thu, 01 Feb 2024 00:32:37 -0800 (PST)
X-Received: by 2002:a05:600c:1da4:b0:40f:c231:324b with SMTP id
 p36-20020a05600c1da400b0040fc231324bmr79251wms.7.1706776357192; 
 Thu, 01 Feb 2024 00:32:37 -0800 (PST)
Received: from [192.168.0.9] (ip-109-43-177-196.web.vodafone.de.
 [109.43.177.196]) by smtp.gmail.com with ESMTPSA id
 h9-20020a05600016c900b0033aedb71269sm10265216wrf.88.2024.02.01.00.32.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 00:32:36 -0800 (PST)
Message-ID: <e580a8a3-47cd-43c7-afb1-58af1f4b0d17@redhat.com>
Date: Thu, 1 Feb 2024 09:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] hw/intc/s390_flic: Consolidate the use of
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
 <20240201084027.345459-4-zhao1.liu@linux.intel.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240201084027.345459-4-zhao1.liu@linux.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.292,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: +bpiLUmScuGK

On 01/02/2024 09.40, Zhao Liu wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Use device_class_set_parent_realize() to set parent realize() directly.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> ---
>   hw/intc/s390_flic_kvm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/intc/s390_flic_kvm.c b/hw/intc/s390_flic_kvm.c
> index 4d5cbb2a2fb6..baaa30dcb734 100644
> --- a/hw/intc/s390_flic_kvm.c
> +++ b/hw/intc/s390_flic_kvm.c
> @@ -646,9 +646,10 @@ static void kvm_s390_flic_class_init(ObjectClass *oc, void *data)
>   {
>       DeviceClass *dc = DEVICE_CLASS(oc);
>       S390FLICStateClass *fsc = S390_FLIC_COMMON_CLASS(oc);
> +    KVMS390FLICStateClass *kfsc = KVM_S390_FLIC_CLASS(oc);
>   
> -    KVM_S390_FLIC_CLASS(oc)->parent_realize = dc->realize;
> -    dc->realize = kvm_s390_flic_realize;
> +    device_class_set_parent_realize(dc, kvm_s390_flic_realize,
> +                                    &kfsc->parent_realize);
>       dc->vmsd = &kvm_s390_flic_vmstate;
>       dc->reset = kvm_s390_flic_reset;
>       fsc->register_io_adapter = kvm_s390_register_io_adapter;

Reviewed-by: Thomas Huth <thuth@redhat.com>

