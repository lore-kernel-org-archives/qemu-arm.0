Received: by 2002:a05:7022:3c17:b0:97:989a:5032 with SMTP id tu23csp93405dlb;
        Tue, 4 Feb 2025 23:05:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVk88b+aJMglODKy/tVln1uQSLn70/ygsEHa210FlAwfvgxkNDiU2h88fmQgfURjNauE1hF3Q1EV2/pIA==@linaro.org
X-Google-Smtp-Source: AGHT+IEWtbAtv+4UcoaxXucuzTEgcz71h61FQAgsMwuouJ7BgQPZeX04dJ2TN1DSfdojs7hc1Z4R
X-Received: by 2002:a05:620a:25c6:b0:7b6:f143:44e3 with SMTP id af79cd13be357-7c039ff4f48mr236435385a.32.1738739110649;
        Tue, 04 Feb 2025 23:05:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738739110; cv=none;
        d=google.com; s=arc-20240605;
        b=hRUTZ+YNYl/+fn7c4r+y/5zsp5G0QZWDebK10Z3AxVcD/WRBxne0hmjqQm7K0kIh40
         TNQ1ccLenN/CEOEDKGTZfSDZvxCRtmKSEFpEJdn7qMbpaLZvBGqilP+SQAMSwjHmPDYS
         3Mj9pt1R+SBHM+ftQRTFt4fGyKXNWWpOr9W8VZ+4XTYo7woc6qL7J2ic2CGpGpDQbekV
         kOxzFO/qlqWVDa6Ff524bc7UxxXajlfeb954ScX9zbFUdNOi6cm1GyFIorzkNuyYWhYn
         3M4kdKpIXl/UH70e8JnuuujP/kp2kebDG1GJ2n/8yF6g7ZEtBbpUDA5Dn+hU/8watx+g
         o0XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=6bxMKlhHffjQTz89EOv0EvsYh8Ft91YDlOBEi51wUEk=;
        fh=Jn3DqkUMCLOMU9MfquL4DBo8WXHH2mgll7wxNLQAqdg=;
        b=DhdrZFWf7Kb2dKYs8DgnLYt6spZ87sPcPjuGAoy7f2IGd3HwJy+pXCNi3pUQgdHKBf
         vxtSz3RV+Thg9vKDhDeet0WNIwv5jtsZ8H3erYjP2wgyk+pRV81SmC+Mq/clUdGCmFC0
         VH9Ocjhs+vr83Zj0yjoPXECpE9gwfXiKGUse7E5n8l2T7tnnvWYxMPjtojPMHosSTugn
         lc/3wXbDy7McApHTmo9fOhaMBULXn7scgQje4nT90pypO+qahFEZ8UvLN7uYWecfkB1O
         Er2PoneOjt2BH9X+XU6wtnAd1VAyzx8ragfSphVIXxkLXnyP9gK9aE7OMwG35X49whlA
         cG4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OQgXkIDX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c02dbe9301si445134785a.405.2025.02.04.23.05.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Feb 2025 23:05:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OQgXkIDX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tfZSy-0002U1-D0; Wed, 05 Feb 2025 02:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfZSw-0002S5-4x
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 02:04:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tfZSt-00057g-Gz
 for qemu-arm@nongnu.org; Wed, 05 Feb 2025 02:04:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738739090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6bxMKlhHffjQTz89EOv0EvsYh8Ft91YDlOBEi51wUEk=;
 b=OQgXkIDXYBqeEdV4iL9p2DpYwwITEhmPmNtD3StfxCxKuKQz3Dz4E5tPVgERVTLGbi3j1F
 hIoRPxU2aaYAIELQnbLxyGi4ZCOGdZVxVJN4T3yiWwoGPGJkmr6dw2x2u/PAnvKJD297aF
 Vvs0A8au5gr7pRxuFgorjvOciPejaKI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-YrKmAYoVMO2BZVdnOcE92g-1; Wed, 05 Feb 2025 02:04:49 -0500
X-MC-Unique: YrKmAYoVMO2BZVdnOcE92g-1
X-Mimecast-MFC-AGG-ID: YrKmAYoVMO2BZVdnOcE92g
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-ab397fff5a3so63227366b.1
 for <qemu-arm@nongnu.org>; Tue, 04 Feb 2025 23:04:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738739088; x=1739343888;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6bxMKlhHffjQTz89EOv0EvsYh8Ft91YDlOBEi51wUEk=;
 b=DiOn1gXt8or2aFEMjqjmRyJ+ZyccnQoxzz/bj3lst+6D/PZh3UJqiFcGEThQWBIv9k
 Rwzs0uDqYQoV+UNxBAB+3QCXk6d8rZUWvPKLvjd+0ZLvsKbjmcnkv2POvGK5v7DLcsQs
 z8eunVVPIc3CAlznml6i/pUIWUQojTMP/Yqa9R4cLKCdxA71HAuiEih55YO5/1o6VDX5
 KULzKGjBCBXs76RnfR1Sm5L5AOhtKRcQ3qB9LrVjADd/jzCVGDfNx3mArFoEt4ZjtbmT
 JaAfmqI/oUHU5vu40KKSO15ef6s3FTOMyemtr4dy972ncqtQa334HXUAzQ6MvOnWIZNg
 DQJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+IPjGzXOHzGmIlKz5KBgkWgQ8wpJ4+IhB10UW3FnDU805dG3ZgjKPNMC8okOA8hH89JSmJ4XKsA==@nongnu.org
X-Gm-Message-State: AOJu0YyW8WJFhdZavbnAYFppJv8lD8KsniBUbr9XsUDUAjLDgedY0Wj5
 AmO2LF0g5JJxyatejo69xcLb7wLb9BZ+Z8cvQNUwPUVZ0R6RiRVnB1OcCvzdBaSkLamDEN3wkN7
 n+P2rrEKWg8LPFWpxuVNKPPQWSn897YON+YZvbT6aUTmDo6anvnydBV+y4Q==
X-Gm-Gg: ASbGncuNRJlreOgaBVQwgZ29fJIKxvHhyTpHFkj3et7p8OWC1LFnHTRm5seM8zpbTgh
 EjiiHwba2UZI/2RYQzkTgIeEl/PeSExWSKTFMXdUJnVgGSaoTopLlz694VV/J3kcUm8lkqHQf5h
 tAFw2hWPK+dKGfRGux07Aa+AAxoPAlSk5M0TQ4jqsFKDwmcIBk2xBiLjnXMvHCugrYkDk9wNOm9
 kcC1x9uqBDQAr/7DQJuigBN2BgOKzRiHYWFwRJ+E1yUefZMy59flXgrdvip45VvjJfzcnxGyK+W
 57JEGxsuKYXDCjCj0LybMt0LFXrA6P+Je/NW
X-Received: by 2002:a17:906:c14c:b0:ab6:f59c:661d with SMTP id
 a640c23a62f3a-ab75d2a8beamr156192966b.17.1738739088167; 
 Tue, 04 Feb 2025 23:04:48 -0800 (PST)
X-Received: by 2002:a17:906:c14c:b0:ab6:f59c:661d with SMTP id
 a640c23a62f3a-ab75d2a8beamr156190466b.17.1738739087776; 
 Tue, 04 Feb 2025 23:04:47 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-48-132.web.vodafone.de.
 [109.42.48.132]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7e7asm1053735466b.18.2025.02.04.23.04.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 23:04:47 -0800 (PST)
Message-ID: <c3fe91f8-4a4f-41cc-aacc-d76ea33ade52@redhat.com>
Date: Wed, 5 Feb 2025 08:04:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/7] hw/boards: Rename no_sdcard -> auto_create_sdcard
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org
References: <20250204200934.65279-1-philmd@linaro.org>
 <20250204200934.65279-4-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20250204200934.65279-4-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1wO5S2sPOhtin7ZjjNILksqwE2TUqRLz0Pb8amtgrIs_1738739088
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: 8ud2XNiKB5KF

On 04/02/2025 21.09, Philippe Mathieu-Daudé wrote:
> Invert the 'no_sdcard' logic, renaming it as the more explicit
> "auto_create_sdcard". Machines are supposed to create a SD Card
> drive when this flag is set. In many cases it doesn't make much
> sense (as boards don't expose SD Card host controller), but this
> is patch only aims to expose that nonsense; so no logical change
> intended (mechanical patch using gsed).
> 
> Most of the changes are:
> 
>    -    mc->no_sdcard = ON_OFF_AUTO_OFF;
>    +    mc->auto_create_sdcard = true;
> 
> Except in
>   . hw/core/null-machine.c
>   . hw/arm/xilinx_zynq.c
>   . hw/s390x/s390-virtio-ccw.c
> where the disabled option is manually removed (since default):
> 
>    -    mc->no_sdcard = ON_OFF_AUTO_ON;
>    +    mc->auto_create_sdcard = false;

You might want to remove that "+" line now, since you remove the setting now 
instead of setting it to "false"

Anyway:
Reviewed-by: Thomas Huth <thuth@redhat.com>

