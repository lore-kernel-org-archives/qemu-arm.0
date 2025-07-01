Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3136967dye;
        Tue, 1 Jul 2025 05:57:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5t7xVyKNQmjShlK3ZF2Xg9NwYBbfOB5TuIMdvpHTwSpmsxU3nkuWJPtQ5nk+KPKEUpVRsN4Gzf167rQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEgEM2qIZKXCvYA+A58zQeK3bm1EtNa12BYY39Qim08EhLSu5xnyODumrsY8pKE1xHCDQpm
X-Received: by 2002:a05:620a:149c:b0:7d2:271d:d395 with SMTP id af79cd13be357-7d443994d1amr2029550185a.37.1751374641496;
        Tue, 01 Jul 2025 05:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751374641; cv=none;
        d=google.com; s=arc-20240605;
        b=No7XPXZuHtyOsUj0h8nhCVlHQM94LUZ1vQn0jB2TGBnn0L0inxIDuKRAre8cSxjulg
         9/aL2MKI+CGwdYK0ILxJoIsQyrZJ5Q94vVpUO56R6SMmo/LtrNhXHGkiwIeFdplTzyqj
         /vHF5vKtw0KPsYwq4b5tbFqg19ukh1tuygd9s5Ezo9wng6NfnMYAks0lEEl0zx/AR5cS
         VkF5VKfFEPnsmtRzyxR/ZoA6b1L/WW9A6R7BB3MX1g9XtCns09URzQ7Gy6XluQ8kaOIv
         k5h63XsOCdd7jw23TGlq4Efd2j4ksMJGy+f06n6MUWjca8oZov6zi+VkuzzqrejYPnfD
         6Z7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Q1wS2L/KM4IhtQPrW9Iuevb5MkghEZ7QX7EPNbtSoRM=;
        fh=rSWSBg6+Dw0XuQu4Tz6WMzKdSOtfSStD2m9ItSBMsTQ=;
        b=hcFD5C15+TOKJfouF8k8TjbDzRnkjOTZa+9Ed6DUBDBigv9X+7YoJho5IGtXu2XpLG
         Z3PzOcvd1rHn3rxaHbjJ98UkU8Q5wDXzYnpHe0RbGlU8WXpPdesXsNpwF2QCTMVzXqsd
         zCRB9+sSeb58YcpMfEaW4Q3ot2hvrxwBc7QA5ZZPKqSUQSJaiYRK7fzlcHwknHOCq0MI
         U91tvVeszowsR8y7azIKAkE2fix9EqATZLS8ad3cwB4GzRTo3HjBWdPleskEO0XOsUf6
         e64wEcKKVf9h20cIW2/EKrwqFTiVkOqMvMuhoNuHZhwBz/I7HpeZve5yTZTaw0UT5lQq
         izMA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EFOJOdey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd773699d0si119996086d6.265.2025.07.01.05.57.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 05:57:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EFOJOdey;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWaXj-0001Xy-ED; Tue, 01 Jul 2025 08:56:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uWaXc-0001X8-Q1
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 08:56:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1uWaXV-0000Q0-6D
 for qemu-arm@nongnu.org; Tue, 01 Jul 2025 08:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751374601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1wS2L/KM4IhtQPrW9Iuevb5MkghEZ7QX7EPNbtSoRM=;
 b=EFOJOdeypUQtxNL1t/NGVF2ZUWqb7qzX5RMf1ql9hhDnlGFhmbPiM+T7Ngb48OE4W0yuxf
 TWr30WV/2hvt6dVQ5O0dXgJiainqulYpxCcbQQuRqo83Bxxk180szU81uUXOxhrOA+ngfI
 cx0cuaqHsUGx8tNvkAt/D9aiqXhnc/I=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-672-6KjrJNfwP8KvdBUmYkQnAw-1; Tue, 01 Jul 2025 08:56:40 -0400
X-MC-Unique: 6KjrJNfwP8KvdBUmYkQnAw-1
X-Mimecast-MFC-AGG-ID: 6KjrJNfwP8KvdBUmYkQnAw_1751374599
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a4f8192e2cso2065519f8f.3
 for <qemu-arm@nongnu.org>; Tue, 01 Jul 2025 05:56:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751374599; x=1751979399;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Q1wS2L/KM4IhtQPrW9Iuevb5MkghEZ7QX7EPNbtSoRM=;
 b=qysF8gNkrfSf0pmVklmrYSHvUDpLbrn0PhsfIDufRVjhmilWcwWTz71I11vtvPjKMG
 YsmZBvRUy7GjrIq0QC/mKK6Ih6XbLR7F5PU+eOrpHq+CGoKydDJcbMLW1Huxb0Tj+r6s
 Av6kEZag8cCYIlIXSmpwNXLIqj0FJnbOrwbNvQSZLLOXrcOQwf8mrRFNhNtGVOdEAcdv
 M9S8F6eUsRRLZSFaOiHPW9oCWeo++J2yeUOOR4mSrhGmb9iP26ScV+2KTqxBnJJN34wI
 XutBBYUCa1PSmV2/uvf+3e0u+T0QHT/km8zfcQTEdZpJAm7/nIO/4H6Zta6eWpKbAK49
 A/bQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG9EskAW2Rrzk6Fr7CLZbZysDwgmBUGPdlvbIn5JIGRpGeCnteBHBflHh0nPXYERAlhJxRrvf0CA==@nongnu.org
X-Gm-Message-State: AOJu0Yw7CExUWTWOGBPkYC4K+qwpGa8LKPkqUu6gyUZtj33dh27PwcQH
 ll0l5NOfh9+8rwlHk9YKgORLwJmdkfuiKI/3n7xJ5YBPkJQDQuXl/K0eFkzk/qjdO7fxFQuEGVq
 E0YG/TkBLR8d3W3XYa0RekH4ixFLKZibc4DPdDaus6BMiVUMaTavjSQ==
X-Gm-Gg: ASbGncvEN5cFfyF1PLbfdaYUo7xQRZhfsmOPYvVVqoOwZmNvC5QDSR0cXDGvrS60orF
 hd8HTJePQC3ZJhJxvH312U3YqPY3V3WS7c0tPLq2awLte59P9eddPPAqADeVAVNotfsIHWi/Tvx
 i9181iipK4bbZLikN0nrHGiLlbNW5GW8szD8RamcBRmEtpRSCyfGHE661DVEZUizHZE+9mwYifq
 Uuez03UXsvZv+7ynbKRlfVjN/HFiT+70vvKdOhUJU7VB0gOKZE53dJOrkG6D3MvOc91So42g9eG
 wdy4kid7C6B8JIqccjfrJ8/QdqSR8ebYNQ7MlFexrx9fZlcyM3y8Xh2IHntQWwhS
X-Received: by 2002:a05:6000:23c4:b0:3a4:f038:af74 with SMTP id
 ffacd0b85a97d-3a8feb70384mr10419141f8f.51.1751374598870; 
 Tue, 01 Jul 2025 05:56:38 -0700 (PDT)
X-Received: by 2002:a05:6000:23c4:b0:3a4:f038:af74 with SMTP id
 ffacd0b85a97d-3a8feb70384mr10419115f8f.51.1751374598346; 
 Tue, 01 Jul 2025 05:56:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e52c23sm13320882f8f.52.2025.07.01.05.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 05:56:37 -0700 (PDT)
Message-ID: <5618feb5-f826-4436-993d-4486465dc877@redhat.com>
Date: Tue, 1 Jul 2025 14:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] hw/i386: Add the ramfb romfile compatatibility
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Shaoqin Huang <shahuang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
References: <20250617030521.2109305-1-shahuang@redhat.com>
 <20250617030521.2109305-3-shahuang@redhat.com>
 <aa4ef145-9e08-4ad9-a152-dd8fa2371436@redhat.com>
 <ba75ac62-db52-491e-8944-2bf27106d0a6@redhat.com>
 <8c3cce88-fab5-4bf1-bc6b-804730e9889d@redhat.com>
 <3s45ekea2lotfcyrldxjmaybxujmfjrxemozoivnc2tq3qxfew@naef2yhuealw>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <3s45ekea2lotfcyrldxjmaybxujmfjrxemozoivnc2tq3qxfew@naef2yhuealw>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JuXRnMUl_i3GrvQydaB9ruD5ErNK_RK_kGv3ETT75D4_1751374599
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5Gk2C4MhPK8O

Hi Gerd,

On 7/1/25 2:04 PM, Gerd Hoffmann wrote:
>   Hi,
> 
>>> If those machine types need to set it to true. I think they can set it
>>> after they have this property.
>> nope it does not work like that. In case we really need to take care of
>> this, this must be handled by compats.
> 
> ramfb is a sysbus device so it can only used for machine types where it
> is explicitly enabled:
> 
>   # git grep machine_class_allow_dynamic_sysbus_dev.*TYPE_RAMFB_DEVICE
>   hw/arm/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>   hw/i386/microvm.c:    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>   hw/i386/pc_piix.c:    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
>   hw/i386/pc_q35.c:    machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
>   hw/loongarch/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
>   hw/riscv/virt.c:    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_RAMFB_DEVICE);
> 
> So these six are the only machine types we have to worry about.
> 
> The three x86 machine types (pc, q35, microvm) will actually use the rom
> (when booting with seabios).
makes total sense. So microvm is needed as well.

Thank you for the confirmation!

Eric
> 
> For arm/riscv/loongarch virt we want disable the rom.
> 
> Everything else doesn't matter much because ramfb can not be used in the
> first place, you'll get an error like this when trying:
> 
>   # qemu-default -M isapc -device ramfb
>   qemu-system-x86_64: -device ramfb: Parameter 'driver' expects a dynamic sysbus device type for the machine
> 
> HTH & take care,
>   Gerd
> 

