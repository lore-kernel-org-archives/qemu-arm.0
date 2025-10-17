Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78A9CCD199
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 13:40:17 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9kgM-0008LW-LA; Fri, 17 Oct 2025 09:39:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kgH-0008KX-7K
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:39:41 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v9kgA-0001I3-TE
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 09:39:40 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4710683a644so18330165e9.0
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 06:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760708367; x=1761313167; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hiw8AqTYPLPN8XKgHaspY50210Hhswn7lmt4oFiM1+0=;
 b=pSqGOj2JHLVGuqvQaaiITDt5JjN7XecutcBajY3GiyZ5b+lzDVwh0KjlVHQyfP2wVx
 czN5rkcqrFF8dIk80FBFCIZGV6qkx1M5E5LqP6EWyMrsn/zQUQ+WtzlBkNZ6F+f5pVl9
 kTwuvNeGxiRKTH7tZsShi1YaNJzgwNMDI24wU5lF33FVd5cfvZD6/VUZ4pvj5RqZhZEN
 lULvxEzpJBuz4HLuAkeNJr+sEtwEe7/Fa7k0FnaALaug3z70vAMJ8l9kgvg2SVJ9ozt2
 VNoMxnMj/8jM3UwXS9NHRzKQQeEzyuxqbNrxdWtBbnCMQpC3y3A+e+mPjSjK7O3gngEI
 0gVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760708367; x=1761313167;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hiw8AqTYPLPN8XKgHaspY50210Hhswn7lmt4oFiM1+0=;
 b=IKjW/Q7e+GrIu2auIOPJDdMIWRT9lJBtS4ovk/QrdStrwXMfSsxvDY011JilCIapTn
 +pAEnjcf+8gjJxtmtka5ZD4nj8IjiTFHMEd90gL6LAOyPtmmnM2R7aQAh+uWI+v0FYhQ
 Ixm08noFtM2IuYw50T0Nblp7FBt8MDHaL1hGJvHJBOaZOVR13wcx9+r55OoYtoF2d5O8
 olQqzXO+yCe1YvKn/HAgyJAaYePqI/LcRrhHViB98CSI08zqj895JhE5Q8QncZDtvOjq
 n+1hQ4ykvqZEPlATetyPfZmwD+N7iImS3hldiWvMbm4NEe3UTjjDj3yiURot/MtYuFg4
 jOdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2+dCGlFSBPvB8l3eQrHiMsjdS4O9XkMAi2QLuDHkL4pHukTyAVG5oALpgaXQ1DnImNSBUZDYhvA==@nongnu.org
X-Gm-Message-State: AOJu0YxQkW0RpnVqR6ke6K+h2y9pnUWcDEqaieHeO/yftBYP0NS5V9RO
 zIX63Q/N7tZ7IYjzlLUrDfydTV3dMgati3y63nKhPgP7Gz7y7gLjw/2WaAqn5VDQ6fM=
X-Gm-Gg: ASbGncvMxldPgVPYWJMh/w7AkZblC6VBYUhBQ/GxGzex43cz7NVvlvAlTms09XJLWTS
 0NuSo6LzwpPVoFA1adi5yrUu1KhsMA9Q/EDlKWJ/TiXa9bqNPz6eEoR7dNLvTge+aIvuOeJwUEA
 gVFujlylcJVLo210b7oz3Sq9FI5EptcDVTZ+4HheU4+k0WCzKfoGgZmHfRBqfplBVXdw2c3JU7j
 +EogOLB4rfLxTxGT6lxvvtkwOSrrNfSq63FSul72JAw2bvG4QWICi3j7yr80k8fzWIe2gISqfkK
 LOJNULiYC+jZOO0rUlqpKkMOHOg0CnYbgIfUIHCiNoMyQuUxHqs0A5zziz6+kTsQhWFZ/0pioml
 W14pI+/79tygpIp5fzSK1Li0bZXCjmDe5aJzWyq8vOr+X5eO59vMn+bEeNhxqqCbzTbiJ93jw8K
 BSCFUGa6FbiAlgdg2XVMxGuwKf2fXFtWlhFj5P62b+5co=
X-Google-Smtp-Source: AGHT+IGyND4O1opYO4UraWj/w9AlCZnGpdS9sMZ513alkMTwPqWLsimqDWDMUD7ykFkIefOkICk+nQ==
X-Received: by 2002:a05:600c:8284:b0:46e:5302:7751 with SMTP id
 5b1f17b1804b1-4711726487cmr35072495e9.9.1760708367103; 
 Fri, 17 Oct 2025 06:39:27 -0700 (PDT)
Received: from [192.168.69.221] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47114460fe1sm88373735e9.17.2025.10.17.06.39.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 06:39:26 -0700 (PDT)
Message-ID: <85e8841f-a08d-4d00-9dcc-dc1d231c93ea@linaro.org>
Date: Fri, 17 Oct 2025 15:39:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/20] hw/arm/virt: Remove virt-4.1 -> virt-7.2 machines
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <ajones@ventanamicro.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20251017130821.58388-1-philmd@linaro.org>
 <aPJCIuoL2_C2wrv2@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <aPJCIuoL2_C2wrv2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 17/10/25 15:18, Daniel P. Berrangé wrote:
> On Fri, Oct 17, 2025 at 03:07:59PM +0200, Philippe Mathieu-Daudé wrote:
>> Remove the deprecated virt-4.1 up to virt-7.2 machines,
>> which are older than 6 years. Remove resulting dead code.
> 
> Nope, that's too aggressive here too. Only the 4.1/4.2 machines
> can be removed. The others are all still reported as being valid
> machines with '-machine help' - they'll be automatically removed
> from that list once their expiry release cycle is started.

Right :/

>>
>> Philippe Mathieu-Daudé (20):
>>    hw/arm/virt: Remove deprecated virt-4.1 machine
>>    hw/arm/virt: Remove VirtMachineClass::no_ged field
>>    hw/arm/virt: Remove deprecated virt-4.2 machine
>>    hw/arm/virt: Remove VirtMachineClass::kvm_no_adjvtime field

So please only consider these 4 patches to review then.

Thanks,

Phil.

