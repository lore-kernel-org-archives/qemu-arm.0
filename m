Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp619663lfg;
        Thu, 25 Mar 2021 10:25:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTPKgHKfDpibTvfBGnE6QpP/d+i0HN/MJak5nlGiGAGOiGUEPZjxeNsBdcnLkmRGPOn1RL
X-Received: by 2002:a92:3003:: with SMTP id x3mr7521076ile.124.1616693112626;
        Thu, 25 Mar 2021 10:25:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616693112; cv=none;
        d=google.com; s=arc-20160816;
        b=q+fDVMOKK0Fh0vW4Kjia2sso7YqpVeD+XznovssO7LOHFRzJFngbyg7sjBpBfVZQ+c
         4TNq4sUyH8a6FbhM1hCynZ7TtdHqDHOllpOsA6K0a1+5GRHZLOMy+zKPJ/U/pOrEtZc9
         HxXCSx0fcU4GmMa7EbVdklhFJMCy+jVMbzRa/oJXG/wjzrVv1QITuBrzUL4MNwlmzISH
         eehvVvqGP4jEKeMzNaWnXayp8eFQFgPClfd+/Xtcv+k8ujtKsIkLgn8P9x/8yXsVfsuL
         EQ2L/WYDHj7NqZ6ctbvBO+GsDdmFg40O1gKEXYDEz0LZMcz9g3QsjVa51sSh6gqCEOmB
         6Q7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ru5PzNr2MjMlIEGAQZefHTXR7pnRnJs108TQosZ5raM=;
        b=S84XWyqVFAw0QC63d/zhjCNvcIJE5O0HuCXX3W15aSE8Zcs2rfbVq4og+zq5Fx2HU1
         7fUAMANr14KxuubjH2vL1NM9nkInE6TZvCMFNol3dm/dK9rZeI9eT4R1htCTK9gK/Djy
         HZkcY9njJ5YWkov+3LXB6P4yMi5C5Es7+UH6P5UVFwSrNw38SpgKwEtlurnaxcKBIKLX
         4Xt+gRSGel3+GFV5SXP2KsR7Kd9i60L4SlN3NaE4GuBLJOW77tvxj2MzwuNA9MeuimhI
         H8HThb5FwFMTqP+rBbYDaDiBQ1Wz/LYugxv+kDFBkePBJztdpMOWZrXZ4NP/rZfERvG/
         u5NA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Dz/m+1vh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q12si2102332ior.61.2021.03.25.10.25.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Mar 2021 10:25:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Dz/m+1vh";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lPTjL-0002Z5-NT
	for alex.bennee@linaro.org; Thu, 25 Mar 2021 13:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTiE-0001z4-CU
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 13:24:02 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236]:38806)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lPTiB-0007gp-UL
 for qemu-arm@nongnu.org; Thu, 25 Mar 2021 13:24:01 -0400
Received: by mail-oi1-x236.google.com with SMTP id f9so2891070oiw.5
 for <qemu-arm@nongnu.org>; Thu, 25 Mar 2021 10:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ru5PzNr2MjMlIEGAQZefHTXR7pnRnJs108TQosZ5raM=;
 b=Dz/m+1vh0HyS90DNJ1fHg+dPL/87QdJEQ5+n3nFXV+f2UT7oJYi0Ex0wPjybxBjA2g
 fGX1uNG94/WwDokLAZiGFKphXYrisqMezJWRJxxBNejCApEyuGDbKGFcv5k88+ixYMB+
 4trqmGZv1/O3KaDsnsw98Q0OxkatBLq39uYpRm+30sI1LangfiyeP/Nww2Pr9bwAq/KL
 K/jOd3TqRIwOK3TOko0CI7qA0Tq/Lb6OCr+8UaOjXZKvHXfpSt9Hp7dYRXbzmf0CBatP
 nOHWItxDXeuV4xsKpZTeGgeWVzvPU1ojQ9h2GH5Kik594yhWAGr/v7hegiBRGtgMAQdW
 1uWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ru5PzNr2MjMlIEGAQZefHTXR7pnRnJs108TQosZ5raM=;
 b=JRd/+B7R9Bd8bfXLVjZ7mxJv9/Z5q9e5WwWC+sbSOJHpV2YyM49ubsWootYMCDY9G6
 UOOrGL4/94buvy1vTAcuAv1jYaGjyWaA6cAHUrw9uPvc+GU4pJ2B3yLx5EDlqQ9QHHre
 ua/8z8Pdnag0TF4OKVJ3LksKXvKiUWdcYAXnWBZbNf63iglYTexOUc3A0H6z/PlHScsY
 vCWYUe+uZo6dNMd2ruwxkMdddjQMRLawCWLEWmQMN0vbvlHBxpVPQieAxBvtKYyx4lYK
 7zDO8cCrgtWF7ZNJER8xBsGW4YbxVnF0Am4/V6vttcG5wsgZJqfabaEvYnKe7jg61cVC
 KodQ==
X-Gm-Message-State: AOAM533FNarvsue30dx2LXH5cqaKgMlyH/mPCdEbJwqHW4hHTDB4wbX6
 87SZ6XXh8OQE9E3Vko5K+A3mWQ==
X-Received: by 2002:a54:4703:: with SMTP id k3mr6969458oik.26.1616693038198;
 Thu, 25 Mar 2021 10:23:58 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id o64sm1182013oif.50.2021.03.25.10.23.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 10:23:57 -0700 (PDT)
Subject: Re: [PATCH for-6.0 0/4] Don't treat all sysbus devices as hotpluggable
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210325153310.9131-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dbe71306-a4d9-c2a2-095b-e9d538810518@linaro.org>
Date: Thu, 25 Mar 2021 11:23:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210325153310.9131-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x236.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 85dUjUX88Nyh

On 3/25/21 9:33 AM, Peter Maydell wrote:
> On the two machines which have the "platform bus" (ppc e500 and arm
> virt) we currently treat all TYPE_SYS_BUS_DEVICE devices as being
> hotpluggable in the device callbacks, and try to plug those devices
> into the platform bus.  This is far too broad, because only a handful
> of devices are actually valid to plug into the platform bus.
> Moreover, if a device which is pluggable for some other reason (like
> a PCI device) happens to use a sysbus device internally as part of
> its implementation, the hotplug callback will incorrectly grab that
> sysbus device, probably resulting in an assertion failure.
> 
> Mostly PCI devices don't use sysbus devices internally, so the only
> case we've encountered so far is the not-valid-anyway
>   qemu-system-ppc64 -M ppce500 -device macio-oldworld
> but we might create more in future.
> 
> This series restricts hotpluggability of sysbus devices on these
> platforms to those devices which are on the dynamic sysbus whitelist

s/whitelist/allowlist/g ?

>    include/hw/boards.h: Document machine_class_allow_dynamic_sysbus_dev()
>    machine: Provide a function to check the dynamic sysbus whitelist
>    hw/arm/virt: Only try to add valid dynamic sysbus devices to platform
>      bus
>    hw/ppc/e500plat: Only try to add valid dynamic sysbus devices to
>      platform bus

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
