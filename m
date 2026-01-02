Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFA0FA3727
	for <qemu-arm@archiver.kernel.org>; Fri,  2 Jan 2026 09:07:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vbb7k-00069G-Ii; Fri, 02 Jan 2026 04:07:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vbb7j-000689-0k
 for qemu-arm@nongnu.org; Fri, 02 Jan 2026 04:07:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1vbb7h-0003i8-NK
 for qemu-arm@nongnu.org; Fri, 02 Jan 2026 04:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1767344824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=vEFMmNVwYXNq2YtMkBLuu0wmQ5SWNCghCHFruACUfoY=;
 b=C4PGmErNJPOUs8AzkmcUVYTw8T9KLkDNnJibWF+VIm+3PvzA5Dku586qeotB1HXZZ2+l6O
 jc2+wAQy9pAdY2x0KOJSl0o/+gEoO3p3iqrcP3Hbeb+guUbBhnLFgQuaWoX2IPcMybGlBn
 l6SkBLr3XG2IbNOPFumaiteJC8xwOCY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-XwN7N6XsNtG9KXqa9EBSDw-1; Fri, 02 Jan 2026 04:07:03 -0500
X-MC-Unique: XwN7N6XsNtG9KXqa9EBSDw-1
X-Mimecast-MFC-AGG-ID: XwN7N6XsNtG9KXqa9EBSDw_1767344822
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4779b3749a8so84203125e9.1
 for <qemu-arm@nongnu.org>; Fri, 02 Jan 2026 01:07:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767344822; x=1767949622;
 h=content-transfer-encoding:in-reply-to:autocrypt:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vEFMmNVwYXNq2YtMkBLuu0wmQ5SWNCghCHFruACUfoY=;
 b=uEZB88YpXK/HNq60YIXKujBKe53bZtmooK0202umZjdaKubO+EfRdibsh5UDjKXyrd
 Pz/9KSwVZ8+WmpVNuKuhcHXSIz+TiS4xGvhjY7Yha/YRwqFue6k2Y9lxPsuQkWfNthYS
 DUAwGmptkoob02vkMcYt/eMim+I0pwL5SHE0DxejdZayP09GZQx8CFINthCtRYYkM7ur
 o92yw3eDa93P7fr9LiEGGUY6Je17BDf3NHn5ouoSPbd+Q3uaf6sCvJOWeLodny3dLe1F
 9OoJpQV0ftKQ09eF8PG6i3fcuBW0WF8PanhNooicb7X6BPvQ5smrOqLyu8u0OZRuokcW
 Zfww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX12xvTWqfJKtq7gOPzxQZGTBWE0v/G0iTnoPBDCUh04wTvmWFS05N6PcB0snPL1juA43C7u3Yfg==@nongnu.org
X-Gm-Message-State: AOJu0YwokTN23jaBS7R1dkSEFNiQwmsx2vI+JBPz0YauHaJpYq2KxC5x
 QITijI2TioyzrhBipgtPIWDoAELYDAF0/ZyL3IEn8s/sJwd2rUvDYyB+Lrf3zDQecNe3RqXnydv
 8N/nCH+jN/edfFKKqeflmrlOdCXDi7znZmgQwnaBXzKefKmyilrLK0g==
X-Gm-Gg: AY/fxX5i+MWIewcrNaBn7OtDxJtPBY2fWpel5DiMUX/+bN4+PGeCHupgxsmUrbuyJ2H
 cUbKOJSnmkfqLBtgKw9c4lDmI3ilImMoKrr3LV+ks7FrMQmxXvc41ro4sCgOgs/qQHpMyxpJj+w
 zfCX7FzUePojM3RUtZfvlG7LV8Io8dDJOSt1XSn5lPaY8pOB74CJtJEPsPsTsTvvTJzNoDi1ajo
 UjPgptPojlFW4PTCkOvtsyGkcMPlAqH7wOMMX85oU80CLAR7OO66tLesxPsipaWiIWzNxqJnNSt
 vF7eiYw1fm86smj3YF5upI13M7DwQlcQsdNsmDTJ23+2w+xlbhBoXVNiDZls654RNUsS6oH+1M/
 VWk1cgTM=
X-Received: by 2002:a05:600c:458f:b0:46f:b32e:5094 with SMTP id
 5b1f17b1804b1-47d19592a3dmr477669785e9.32.1767344822212; 
 Fri, 02 Jan 2026 01:07:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+W1bpv/CicLFRZ3DDJQPUzPn0+fraZHM3/ps/PMtyUvODFfWs+Ss2hSG9gvwcGG4YlVkSTw==
X-Received: by 2002:a05:600c:458f:b0:46f:b32e:5094 with SMTP id
 5b1f17b1804b1-47d19592a3dmr477669485e9.32.1767344821798; 
 Fri, 02 Jan 2026 01:07:01 -0800 (PST)
Received: from [192.168.0.8] ([47.64.114.140])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3a3ec73sm305363885e9.5.2026.01.02.01.07.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jan 2026 01:07:01 -0800 (PST)
Message-ID: <5cb2ccfd-4c5f-45dc-bd15-cb64995f2074@redhat.com>
Date: Fri, 2 Jan 2026 10:06:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] MAINTAINERS: Add MAX78000FTHR section as orphan
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: berrange@redhat.com, alex.bennee@linaro.org,
 Jackson Donaldson <jackson88044@gmail.com>, qemu-arm@nongnu.org
References: <20251220173336.3781377-1-armbru@redhat.com>
 <20251220173336.3781377-5-armbru@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20251220173336.3781377-5-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8cL2fGpIrNr7YEcTnaVNXFo6SLHEIi-bVJVKB6KSU2g_1767344822
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 20/12/2025 18.33, Markus Armbruster wrote:
> This machine was contributed by Jackson Donaldson a couple of months
> ago.  Its RISC-V core is not implemented.  Unfortunately, Jackson
> isn't able to serve as maintainer at this time, so add it as orphan.
> 
> Cc: Jackson Donaldson <jackson88044@gmail.com>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>   MAINTAINERS | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3efc943c9b..e91f9c4361 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -871,6 +871,14 @@ F: include/hw/misc/arm_integrator_debug.h
>   F: tests/functional/arm/test_integratorcp.py
>   F: docs/system/arm/integratorcp.rst
>   
> +MAX78000FTHR
> +L: qemu-arm@nongnu.org
> +S: Orphan
> +F: docs/system/arm/max78000.rst
> +F: hw/*/max78000*
> +F: include/hw/*/max78000*
> +F: tests/functional/arm/test_max78000fthr.py
> +
>   MCIMX6UL EVK / i.MX6ul
>   M: Peter Maydell <peter.maydell@linaro.org>
>   R: Jean-Christophe Dubois <jcd@tribudubois.net>

Reviewed-by: Thomas Huth <thuth@redhat.com>


