Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3024198dye;
        Tue, 1 Jul 2025 02:27:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMFn5i1oVtMTrLTIebtwNIY3FmYLDUQU2TJQPjCSWH0J9lCflaZ4Tzmp4B9B4C3t/xgb/6f5nt1anNCw==@linaro.org
X-Google-Smtp-Source: AGHT+IHtBcZec4pkYUZYgoU157ZqS7pSS5TYYNSgFD9KlaVMlNk94OzUWLtwHOdSRVdXZUyTOFe8
X-Received: by 2002:a05:620a:472b:b0:7cc:8a39:29df with SMTP id af79cd13be357-7d44392155cmr2243134385a.9.1751362061299;
        Tue, 01 Jul 2025 02:27:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751362061; cv=none;
        d=google.com; s=arc-20240605;
        b=CcRJwoHBbPMBicgZ96VcmtkdigSataVnYbSMB8456kQJDferiXR7NzkuyVG6nvU6/v
         SzZOY8sQS6iJRZ49zSfO6tQHLHBltJ78lw279ePo0J/qYxgkRkLvEAykFu5OUb89kGkH
         WP5TQSfVLKzSnBScYo3LTzli9XMUc995MJpBZe0vPUcOR85kF7Ta07kVUpUv2fMa8obp
         sttD/8eWcrmdz4UQvEfq6B2MvMqbVi15or3h6xv5FSrOzWMAc6zxvvI+1HNfRXbdGK/L
         EWg21Xz+6BV5cHd911nEc965u4d4hO3KQVEh61oLbZ/FYsD2ogSsiwTt+U3lI+aXrapo
         WKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=Kxdm+rVFS0UrnkJ5BCZrJx8tPFVIpspNyPDUVBvVyZ4=;
        fh=trNXcVxGa4y4WsRgebsCzbVCt9hai4eIY2jyA4XQu8o=;
        b=Z9QmmuQxe+X1iNCczEzx7Vz7V7kDP2sm9plWkEQLR6MXm4X+Id5a3IY5TctEpGlYlk
         dWLRMmYd3pfHcYZLa2eY3+g4XfPNgrCSm2IyfrNTifTZCxZDkqElfp4cMXC7n0RYmqCo
         dDs8WM0S3Did0ASSepwuOi8wWvz588GfuCAytlRs2UnaoPPn/gfEn1aCJgCkYdc7uAC5
         lX9qyH0LBLEddnz1jOlWRj/IQfybXDi/eQJyO33oAlqXcEbU8bV1dTn/oexjn2zt7e+u
         qldTrqIb42EA+GuqWld8yUFxMIWMfDBmTKDzvwaMreqwqkCgZ2oh0Sh3+RPGFZBl622q
         jbjg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TB7qiCRc;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d4432723c5si952890985a.447.2025.07.01.02.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 02:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TB7qiCRc;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751362060;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kxdm+rVFS0UrnkJ5BCZrJx8tPFVIpspNyPDUVBvVyZ4=;
	b=TB7qiCRc+WXNiRN1qDiNBbZkb0ZHTtk7ENsAbCaWk1BBztVbJ44KyZqa6a6hP6jjyGlh7x
	4qYWXcBUmVR8SFLpv6s2B5PIAnEqIlKfIag+KMewK3fWW/iL093z7t8pMZhpqJF7G4RQRk
	tUuHVGKMI45JClZKW9vkPn4ZOFeJVt0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-z7XYmWwFOnG33j2-PIBYpw-1; Tue, 01 Jul 2025 05:27:37 -0400
X-MC-Unique: z7XYmWwFOnG33j2-PIBYpw-1
X-Mimecast-MFC-AGG-ID: z7XYmWwFOnG33j2-PIBYpw_1751362057
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a6d90929d6so1174119f8f.2
        for <alex.bennee@linaro.org>; Tue, 01 Jul 2025 02:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751362057; x=1751966857;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kxdm+rVFS0UrnkJ5BCZrJx8tPFVIpspNyPDUVBvVyZ4=;
        b=podrhnSPYC4gwPhCn7YQN9lwdKYRVtxf4jb6yhfUeT/4w6ZpXM1ETwtbOn1+rpV9jg
         Jzz8OEbpyKPrHQedkp1983aOKjAbQYcPuBgxQwHYukXBut+HyROp/uqpx2VG/Ndjacku
         u2zJN9QAjYou5lag+3eHjbwL4Y3rLur1N6SI+aHqVuSJ1qxpJtJmLudnacyMIgQBIW6j
         s8WFk3vWyk0CppRiBtjd+64PdU4je+9liVIkd2Hg0m2pB5QHn5X8OgnVcOFDfZCkGAeH
         XqpBa/NLaYJY7KHXV0gauf0m4GnVDL+H3Pl2sm6+0RJmVy44cbGVg7vwbQFmNyKiY6ks
         EmsA==
X-Forwarded-Encrypted: i=1; AJvYcCXbywtS77bI4kZ9Bl+J+jI/3vlgcfodwoWYpExQeqk0J8ZXR+IFWsnQALjxy3V0SQuxxf/lC+eWaK7ivQ==@linaro.org
X-Gm-Message-State: AOJu0Yx8RhzDS1tveBv7bij3in+9dXJbx2CaiM1U+f3nKafFsI9ntUtM
	fs1C5on2CHJoVOm82UP7ZTAYZ9teLw/1w7mwKUH7/jjXvpfbaauXbxXP2jxpW8KiNs2Qoy5sZ5o
	Gy6ZcNFleLTc39rNddxvNBxuuesx2CcqwdLxywEJRbEEnHkcFbXx0lFZZeQ==
X-Gm-Gg: ASbGncvnrbIrWe1OlBeMGfGEd7pFDHbLu+PnlXMjsfYaEd8fQmIgiKDQKRv9LN7AYl5
	Oc+uQJdsW0lQ/xI+I4pULyj1b9VyOHxUpzSjNAkj8lzul4TYb5nbHwBqsE/OLPuM1itMbJeTYha
	iEhPfLzwNGB9fpXmG1i0OOkV0RQhFuwUMEqpmRqPBC4l1Up27ojDYd1RvXxlsaSDwn0TKv/ZvWn
	RDbF7xfFNhJ34TAHrcRtb5ESTuOkrdQDJHp3mhQhnarKxaUmwiuB+xUMVhZnob2jw0AS8xSMz0+
	5Bkn176vu/xOOGUcEVpMMQYCG6zvqAuS1CRETbG99krha/8ogVG59c7NpJ8QxCcIAiEvRg==
X-Received: by 2002:a05:6000:65a:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a8f587414emr14393440f8f.9.1751362056531;
        Tue, 01 Jul 2025 02:27:36 -0700 (PDT)
X-Received: by 2002:a05:6000:65a:b0:3a4:dfaa:df8d with SMTP id ffacd0b85a97d-3a8f587414emr14393404f8f.9.1751362056079;
        Tue, 01 Jul 2025 02:27:36 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e598d2sm12622240f8f.76.2025.07.01.02.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:27:35 -0700 (PDT)
Message-ID: <cbfc1237-fd08-4c68-a327-fd83a4de00dd@redhat.com>
Date: Tue, 1 Jul 2025 11:27:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v4 25/32] hw/acpi/ged: Prepare the device to react to PCI
 hotplug events
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250627095620.3300028-1-eric.auger@redhat.com>
 <20250627095620.3300028-26-eric.auger@redhat.com>
 <20250630134957.00006326@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250630134957.00006326@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BDWHT2R_EhR1t8D4d_7wmRy27sBwRJUkmFtZZwGQoAk_1751362057
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 0KInnWFvjBOz

Hi Jonathan,

On 6/30/25 2:49 PM, Jonathan Cameron wrote:
> On Fri, 27 Jun 2025 11:55:14 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> QEMU will notify the OS about PCI hotplug/hotunplug events through
>> GED interrupts. Let the GED device handle a new PCI hotplug event.
>> On its occurrence it calls the \\_SB.PCI0.PCNT method with the BLCK
>> mutex held.
>>
>> The GED device uses a dedicated MMIO region that will be mapped
>> by the machine code.
>>
>> At this point the GED still does not support PCI device hotplug in
>> its TYPE_HOTPLUG_HANDLER implementation. This will come in a
>> subsequent patch.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Maybe call out why you aren't following the advice in the
> docs for device_class_set_legacy_reset() to use the resettable API. 
Good point. I think I shall migrate to the new API.
>
> One other question inline about setting of the event bitmap in
> ged_realize rather than create_acpi_ged() in virt.c
>
> There is not obviously right answer to where that should be but
> what you have here seems inconsistent with existing code s
> a comment may makes sense if you leave it as it stands.
>
>> ---
>> v3 -> v4:
>> - add qbus_set_hotplug_handler
>> - root bus is not passed in acpi_pcihp_init arg
>>
>> v2 -> v3:
>> - pcihp_init and reset are put in ged code instead of machine code
>>   (Igor)
>> - Add ACPI_GED_PCI_HOTPLUG_EVT event depending on use_acpi_hotplug_bridge
>>   (Igor)
>>
>> v1 -> v2:
>> - Introduce ACPI_PCIHP_REGION_NAME
>> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
>> index 92b931758f..fc84bfb34e 100644
>> --- a/hw/acpi/generic_event_device.c
>> +++ b/hw/acpi/generic_event_device.c
>> @@ -427,9 +437,13 @@ static void acpi_ged_realize(DeviceState *dev, Error **errp)
>>  {
>>      SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
>>      AcpiGedState *s = ACPI_GED(dev);
>> +    AcpiPciHpState *pcihp_state = &s->pcihp_state;
>>      uint32_t ged_events;
>>      int i;
>>  
>> +    if (pcihp_state->use_acpi_hotplug_bridge) {
>> +        s->ged_event_bitmap |= ACPI_GED_PCI_HOTPLUG_EVT;
>> +    }
> Maybe a comment on why this belongs insider the GED code rather
> than being provided in the event_bitmap from virt.c or similar
> as is done for all the over elements of ged_event_bitmap.
>
> Particularly as you get the acpi_pcihp property in create_acpi_ged()
> in patch 29.
Actually Igor suggested to put this setting in the realize()
https://lore.kernel.org/all/20250620150648.09dab163@fedora/
instead of in create_acpi_ged(), as it was done in v3 So I followed his
guidance Eric
>
>
>>      ged_events = ctpop32(s->ged_event_bitmap);
>>  
>
