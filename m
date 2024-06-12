Received: by 2002:a17:906:6a09:b0:a6f:1bf6:7fc1 with SMTP id qw9csp548300ejc;
        Wed, 12 Jun 2024 10:49:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlwjmlxv6xUzDe5l6vD5Dlf55982BRndz4kYx/YxafQiPZvHvhyyESp5cQLQ84Xl23bYZoIf6T7n2a8VnWDQgf4dtVigEh
X-Google-Smtp-Source: AGHT+IEqBKKwjjKa4OqfH6pVqn3vXJ4ZDZ0PTTFxkACgHj88hIU0JNbUwzjE7lXROcB53jn8HSB+
X-Received: by 2002:a05:6808:19a4:b0:3d2:292e:1a3b with SMTP id 5614622812f47-3d23def2205mr3119351b6e.0.1718214548555;
        Wed, 12 Jun 2024 10:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718214548; cv=none;
        d=google.com; s=arc-20160816;
        b=1KEv3Iiqo2axAqKAKFozXcVf6JrRkLik3wrcHOUv9pM2F1qIpuMsSYoQtaJGEPh/O3
         +/M5DrBLRsccc7SHMi0hIWgr1Uav5ZuutC1nWY0TZzoR1/81v/D+meYrXAk89SujM2G+
         NRLKmOZ93wnzOo5wQEBIeFIPqmtFuAZPB+qAj1bdICfDCOO9ybd5SakEQGUsqmomgMov
         gZk7X9Hwgn8opZT7bVTMO39OT8H3FwMpHLaUFaMBEygxNXZUdoEXMenMLLuVs+BtO/Uh
         nE2nvPqNBvwDlem/2dX4yVEurWTut1m+L6wzs0GkttZApd5JmKVjMZgZc33m7Nf0ibCp
         iPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id;
        bh=HnkDIWqZIipOGvSDfo6qkVDpiLozIgsdK3LlWH0V91I=;
        fh=o3f0g7NcSssgs+pGlqihYrs67/HvYxYHX6ncd7oZTQg=;
        b=Ml8aA9AHuNIpqYan3Fh5eESpEBT5Vtu0O355/7O8AXmm2Ok11mn9Ad0wqhqplLgK82
         0HOFPeoxiarmqdgKmAvfindpH7IgzgioUfhxBlmuhzlC1lbubp+xuXsWMh+p2b1nvJQd
         tX8l2GCWUNEQj3hsMMt904CGzMgapvPhH1gyaxh9u/C7BULiNNfZNG+VoRbgqyKXvkwG
         VT+kB5ApHfche/8qRjIgepkMyhkEq3ogFKSkieIifMM6Qky7ezKB5CW4R8R2H2FNPuYh
         K8s7+VTJnAKZt/7PLJdpN3D4+LKJ/hY8xAEd5AE7oCxkFnNnT3ptG11QNLfbNI0V8tm6
         r29g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=arm.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44109fdc7b7si63344271cf.331.2024.06.12.10.49.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jun 2024 10:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=arm.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sHS5I-0004NP-5e; Wed, 12 Jun 2024 13:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <robin.murphy@arm.com>)
 id 1sHS5H-0004N2-8r; Wed, 12 Jun 2024 13:48:31 -0400
Received: from foss.arm.com ([217.140.110.172])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <robin.murphy@arm.com>)
 id 1sHS5F-0004mq-3z; Wed, 12 Jun 2024 13:48:31 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E7DD1042;
 Wed, 12 Jun 2024 10:48:49 -0700 (PDT)
Received: from [10.1.27.52] (010265703453.arm.com [10.1.27.52])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C8A5D3F64C;
 Wed, 12 Jun 2024 10:48:22 -0700 (PDT)
Message-ID: <ed3df37e-fddd-465c-8ae9-1c5791966995@arm.com>
Date: Wed, 12 Jun 2024 18:48:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hw/arm/virt: Avoid unexpected warning from Linux guest
 on host with Fujitsu CPUs
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Zhenyu Zhang <zhenyzha@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Jonathan.Cameron@huawei.com, gshan@redhat.com,
 eauger@redhat.com, sebott@redhat.com, cohuck@redhat.com, ddutile@redhat.com,
 shahuang@redhat.com, qemu-riscv <qemu-riscv@nongnu.org>,
 qemu-ppc <qemu-ppc@nongnu.org>, Song Gao <gaosong@loongson.cn>
References: <20240612020506.307793-1-zhenyzha@redhat.com>
 <69649622-e52c-4d24-809b-3d8a97786a69@linaro.org>
 <CAFEAcA9wEjONgLfTObNYwJbwn5Gs1BDJiDivc9PEwmfOeZW6ww@mail.gmail.com>
 <8d7e111b-4f74-4a67-b01b-2af5ce009a06@linaro.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <8d7e111b-4f74-4a67-b01b-2af5ce009a06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=217.140.110.172;
 envelope-from=robin.murphy@arm.com; helo=foss.arm.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: e2pXczthRwrM

On 2024-06-12 1:50 pm, Philippe Mathieu-Daudé wrote:
> On 12/6/24 14:48, Peter Maydell wrote:
>> On Wed, 12 Jun 2024 at 13:33, Philippe Mathieu-Daudé 
>> <philmd@linaro.org> wrote:
>>>
>>> Hi Zhenyu,
>>>
>>> On 12/6/24 04:05, Zhenyu Zhang wrote:
>>>> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
>>>> index 3c93c0c0a6..3cefac6d43 100644
>>>> --- a/hw/arm/virt.c
>>>> +++ b/hw/arm/virt.c
>>>> @@ -271,6 +271,17 @@ static void create_fdt(VirtMachineState *vms)
>>>>        qemu_fdt_setprop_cell(fdt, "/", "#size-cells", 0x2);
>>>>        qemu_fdt_setprop_string(fdt, "/", "model", "linux,dummy-virt");
>>>>
>>>> +    /*
>>>> +     * For QEMU, all DMA is coherent. Advertising this in the root 
>>>> node
>>>> +     * has two benefits:
>>>> +     *
>>>> +     * - It avoids potential bugs where we forget to mark a DMA
>>>> +     *   capable device as being dma-coherent
>>>> +     * - It avoids spurious warnings from the Linux kernel about
>>>> +     *   devices which can't do DMA at all
>>>> +     */
>>>> +    qemu_fdt_setprop(fdt, "/", "dma-coherent", NULL, 0);
>>>
>>> OK, but why restrict that to the Aarch64 virt machine?
>>> Shouldn't advertise this generically in create_device_tree()?
>>> Or otherwise at least in the other virt machines?
>>
>> create_device_tree() creates an empty device tree, not one
>> with stuff in it. It seems reasonable to me for this property
>> on the root to be set in the same place we set other properties
>> of the root node.
> 
> OK. Still the question about other virt machines remains
> unanswered :)

 From the DT consumer point of view, the interpretation and assumptions 
around coherency *are* generally architecture- or platform-specific. For 
instance on RISC-V, many platforms want to assume coherency by default 
(and potentially use "dma-noncoherent" to mark individual devices that 
aren't), while others may still want to do the opposite and use 
"dma-coherent" in the same manner as Arm and AArch64. Neither property 
existed back in ePAPR, so typical PowerPC systems wouldn't even be 
looking and will just make their own assumptions by other means.

Thanks,
Robin.
