Received: by 2002:a17:906:2317:b0:a3e:79c1:d636 with SMTP id l23csp109431eja;
        Thu, 22 Feb 2024 00:42:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUU5wzRKCBawEcgHdPDhZCZiycrwIyXW19waEN00GjUPYoyyBtGrXgzwx8ihsJYcRpwf/30qunHqOIefLy/Eb30JmK7QR3F
X-Google-Smtp-Source: AGHT+IGpEvjsWup7dj8Y+oG0ZOTshCoYZraV6pWjHQIGuLNnr0YJL0em2PToLGdDVL2jNfsE1zmk
X-Received: by 2002:a05:620a:2947:b0:787:8982:42ab with SMTP id n7-20020a05620a294700b00787898242abmr4862664qkp.69.1708591358047;
        Thu, 22 Feb 2024 00:42:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708591358; cv=none;
        d=google.com; s=arc-20160816;
        b=OA7TzoI+bjq5iXNRiMQmz08pJ7jNlM1lfhAag+eCXX4MvTFNejDfntNPLaywCNvr0k
         eeft+FjsQA+mk3rzeXDQfA5SlE9AxINjYxZnMFIDV7ojNf7JuJNxn9Iw51XLMtOt3ZXr
         gbqH1LOuoVwY2GHIZDiyh65/+qTKciG9vGHEgtoO+Mgfe5INK+vjIC3m4endGydsPqb1
         PLejjLspGc92AbR7tEfOD9J2T2p/gq9Er8jPvfHp6TKuBatxbNiNNs1ad8SPeosQIaMS
         lZDZJwhI71WTM7ebJ2c9boE3/78bUyAy2W7G7GlcrBPcI8fT1iEVo5B24CN97O3NNaQS
         qWAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=XsZ91pRNDs34evTQY9bnQYS/S4Z27OMkdawWuWAV/Og=;
        fh=UZyO7dNmewOZmFjqykLoUQB1603QwSMxEQA3qVdB/fk=;
        b=KRxNz/LzBR4pJ+kgZABMlmXmDVDt2cPOIvx2a64YTtkn4lik3QM0jggaXr2fxirU6+
         uMCGDUN/hAaTGNi8IpGZeUudHAJ8aTH3FVOWVefVT02qxirJ+meCiIj9dy8mhim+jSvA
         8IjCoeJlQvvTsDTQk3jBdtDb1t7KBPf63I+pUuY2jFxcrNqzr8gjAjP0bTW+P4yDsLOK
         f4FlAm70kV0BKiqydNZzXgwdYbG+VIFgKdZTCChr08YqrHuU2Uhqlf7RfP9Nt88IhTVS
         cpGojsO+KKfmtU9R3gNYUyqYYcPayAvvI6nplWlbzE59rAkPA7gNv9N1rB6zW84KJoIW
         gizQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I0M4C+yE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28-20020a05620a14bc00b00787a3eb71e4si241957qkj.766.2024.02.22.00.42.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Feb 2024 00:42:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I0M4C+yE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rd4f1-0004Aq-3z; Thu, 22 Feb 2024 03:42:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rd4ew-00047R-Rr
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 03:42:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1rd4eu-0003jM-1b
 for qemu-arm@nongnu.org; Thu, 22 Feb 2024 03:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1708591342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=XsZ91pRNDs34evTQY9bnQYS/S4Z27OMkdawWuWAV/Og=;
 b=I0M4C+yEb9JrdKyIHyVy2NcORAq3YeaQAzJhUI1ceAbpGME9qGjPL3czFKA6m/t7UPMWm7
 rtcb9RraipE+B6QjMIcUOv4BmY1PlmNjuLS9fGjrLnA/MiOl2hBs9Bwi7dQOcc8KmY24s4
 g/fYpp+RpX10CpryNvp+BE0bmKhWW/w=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-Y6cFiabUO7CW5Vs6bnC-7g-1; Thu, 22 Feb 2024 03:42:20 -0500
X-MC-Unique: Y6cFiabUO7CW5Vs6bnC-7g-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a3ee69976dfso140708466b.3
 for <qemu-arm@nongnu.org>; Thu, 22 Feb 2024 00:42:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708591339; x=1709196139;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XsZ91pRNDs34evTQY9bnQYS/S4Z27OMkdawWuWAV/Og=;
 b=txW/FD+c+KHJmxt0feXYCftxLDv7cm/I9ZDtxZFg3OVoF/VO18pzVRRgfURqW/VfA2
 R1VdQZhbocgrtT+aFC/REt+EQ7ObK/4qCaWj1Wv/DR6qfIjrfoqlGV+0YfdMWAlLdAch
 Pv2yyrw5eKfqb0MOXyMC7eNq+/IIZwfYO/rUvaZPD2sebvw5qvIOWfs8chPKxdIxv4vY
 nA13ZATqf9mcOpUf4e26yg1SpFuA/36FhWMXuQFD03bfhGSqt4Xk53NKnwDAP/TjiP3b
 4IPrHJ6VNcJNsmzoUEzmmY5oj9LyrbWv+adT+OdMKcshILUaS+K6hiSud3c2DKU4NoGk
 DZtQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXJGG1QyMeF4CbDHFWRDBFCiyB1WwdX4/U2x/cTvV3sEI60Kva0cIBO8eA+vGctHUL+oiT88ZkqdM++bVX3DscylGZ
X-Gm-Message-State: AOJu0YzNV54K/V5GXuUtfMTpR9SiXMKi3ViXZhSbnoVuTl5gVPU+CpuZ
 Z0rQklbhjZMWbSJAvemQDlo/cPvW74V2sjL5T82QxH9imieDpUBj8FC00BDRcPg/tfzoeCXMMdt
 HFBpVPZvS79JFGR0PpxFwAwYDtlnG90m10TU0FGUbV5Wdd/uCbg==
X-Received: by 2002:a17:906:c457:b0:a3d:ed30:11c8 with SMTP id
 ck23-20020a170906c45700b00a3ded3011c8mr11912053ejb.15.1708591339733; 
 Thu, 22 Feb 2024 00:42:19 -0800 (PST)
X-Received: by 2002:a17:906:c457:b0:a3d:ed30:11c8 with SMTP id
 ck23-20020a170906c45700b00a3ded3011c8mr11912040ejb.15.1708591339395; 
 Thu, 22 Feb 2024 00:42:19 -0800 (PST)
Received: from [192.168.52.107] ([37.84.174.18])
 by smtp.gmail.com with ESMTPSA id
 u4-20020a1709063b8400b00a3d4dc76454sm5709713ejf.159.2024.02.22.00.42.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 00:42:19 -0800 (PST)
Message-ID: <ced49047-6749-4abe-96fa-06b22099ada9@redhat.com>
Date: Thu, 22 Feb 2024 09:42:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/intc/Kconfig: Fix GIC settings when using
 "--without-default-devices"
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Fabiano Rosas <farosas@suse.de>
References: <20240221110059.152665-1-thuth@redhat.com>
 <a1f44a85-b13e-4ab8-aea6-94200637c836@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <a1f44a85-b13e-4ab8-aea6-94200637c836@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: EXBdGigLt72a

On 22/02/2024 08.57, Philippe Mathieu-Daudé wrote:
> On 21/2/24 12:00, Thomas Huth wrote:
>> When using "--without-default-devices", the ARM_GICV3_TCG and ARM_GIC_KVM
>> settings currently get disabled, though the arm virt machine is only of
>> very limited use in that case. This also causes the migration-test to
>> fail in such builds. Let's make sure that we always keep the GIC switches
>> enabled in the --without-default-devices builds, too.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/intc/Kconfig | 12 ++++++------
>>   1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
>> index 97d550b06b..2b5b2d2301 100644
>> --- a/hw/intc/Kconfig
>> +++ b/hw/intc/Kconfig
>> @@ -12,10 +12,6 @@ config IOAPIC
>>       bool
>>       select I8259
>> -config ARM_GIC
>> -    bool
>> -    select MSI_NONBROKEN
>> -
>>   config OPENPIC
>>       bool
>>       select MSI_NONBROKEN
>> @@ -25,14 +21,18 @@ config APIC
>>       select MSI_NONBROKEN
>>       select I8259
>> +config ARM_GIC
>> +    bool
>> +    select ARM_GICV3_TCG if TCG
>> +    select ARM_GIC_KVM if KVM
> 
> This is odd, we usually 'select' dependencies.

We could also move the two select lines into the VIRT Kconfig switch in 
hw/arm/ ... would that look better?

>> +    select MSI_NONBROKEN
>> +
>>   config ARM_GICV3_TCG
>>       bool
>> -    default y
> 
> Don't we want instead:
> 
>         default y if TCG

No, that won't fix the issue, since such statements will also be set to "no" 
if you run configure --without-default-devices.

  Thomas

