Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp649554njb;
        Wed, 27 Nov 2024 01:37:30 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXAw5j2qDyFtonW9DeAQz1jaCdDVDHRJ11n0PaZl4jHVjCIL1lEz59D3vI7n67OpJ5b3LpoYokcgACZ/Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGpmAjXlYPsQmm9BRBz1Nq3nR07BN1hOLX8QhpZB5xVgKNGGmPc6UIill56tEXWDpPWDo6C
X-Received: by 2002:a05:622a:14cb:b0:466:8cc1:623b with SMTP id d75a77b69052e-466b3546f1bmr28149611cf.28.1732700250250;
        Wed, 27 Nov 2024 01:37:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732700250; cv=none;
        d=google.com; s=arc-20240605;
        b=KpKjC103ByOeHgegmWgwsUl3gOPlcEal0lYM84QhHctkwa+i88khoM+P/Lx+R2AcNq
         aqxXRmnamCxJs9dcl1frqQIP9oDyA9TW3IbYDhOnKSvgeMKKZCOzuk7W8BbTQi1kWsJx
         ew+UC9Vq2hv1wJPFnpBqsqPWgCxN7pzH05/Sg6VHJxBQ1qjSyYC+8TyhRyNCi7l5OUxL
         XwmeKB7xdje9dX6i6VACgq08oxnQFVYnFP60MAl6RCKY4UP55jd5jO+BCPubqCHBJZsX
         NUCla9oN5EG2gz2GTnOwvmoF3qop++cbwNY234otLl8zedQSlISd2YgBTzufdX/05/SV
         Iplg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=p5t1nm3lrboc04MW5xLqPV5c3uzCGvTHQy7ci+25SCc=;
        fh=fnYgLzqRN1LtZALqvaRMqs8lW0bcWkq3JbH/7W2AV1w=;
        b=e5lR6UAwtmqcCyh/CudlG0+HaiZMmZGzkN3MitoLZlJl2j+ASOR0Umuozx0teWHBp+
         G8lMycN2b2nkvUEs9xQrS/OpDmrRqk7gMBZhBwJGII06NqeRz2OHUt3sEwsFBey6PWux
         vwfZFmaf1/2bqCC6nKvW+nY+ImIaWtlj3sPmXLlsgEY1Xzr75+Y9vAkr6/5RuJyi2rgR
         QrjJrEZOxHChk+98BvG+8TczQo12q3h4ahChJzDao2QMRXolhN7x2nhKAkNA7es7mEMF
         ElXvwOK7UVPHg4ppEwwxpt/Az5CiNms83bGLHys3zfOwVgM/dJv2V6l4Vl0Iar2OXfBq
         JnfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I1aqNsUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466a0bb3c14si46769891cf.299.2024.11.27.01.37.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Nov 2024 01:37:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=I1aqNsUm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tGEU0-0004cy-Iw; Wed, 27 Nov 2024 04:37:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tGETy-0004by-Ge
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 04:37:14 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tGETw-0003f6-VL
 for qemu-arm@nongnu.org; Wed, 27 Nov 2024 04:37:14 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53df1d1b6f8so279723e87.3
 for <qemu-arm@nongnu.org>; Wed, 27 Nov 2024 01:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732700231; x=1733305031; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=p5t1nm3lrboc04MW5xLqPV5c3uzCGvTHQy7ci+25SCc=;
 b=I1aqNsUmreOdK3Djahrh73uvBKMfu1IiyBZYB3SngX2Ec267DM6dt3FUBiOQyNCV1n
 FcVzyfRo27+IwlWzghaBGrB9I37KVtZCA8qc/yJijMd2qc+bPMB4OerREx+O0VGVOEOO
 n4h8XwxZ57NXDe+kfwE7OKRTxZfK+aHefn0s/TbQxpBfhmkQbqBjmkEca0+3/ykeA92f
 rXI8aUZeQBcS4qZVVXHgwsWpZC18SafDc7fsO+dxUi4J9yetJ1Msc7wHD5Kfzu5rVidu
 aMZJ3PVYcX1sBgZxhs6+l57YvO0NgZnNz2y8AzKlZ4dAxV0f4RBe3OGKkRtaH2xwhayb
 yVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732700231; x=1733305031;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=p5t1nm3lrboc04MW5xLqPV5c3uzCGvTHQy7ci+25SCc=;
 b=pyDU54w03fpqK/Q0Onu+NKa0TWLvQYKqtzSOt/rn+qZcEJ6WEhCoUduP4VyC10IBl6
 855RH7GoDv++OwBZDdN8h2BxW5bRKLd07A/VIOnK5RFjyFmTNoafSCdkct943rJX4C4L
 q7IhGNpTI7aFbOQIfUbYECER0yqQpqb0ekKVC5Ec0uVokHJsGCA79b0v9fdUXeL6ykQl
 jHutNKdu6As6uvgd6Ylwmr5BtMyx5C0oiw34ctWye6mdLnhpQXf8bgIZLAoG9KPGvpNv
 1vyZwTjiIlt4a2ljp2NUyI+n33sZCAqfIRTtVmibTErAc9twt4rFFn2vkNeWK4vckh3w
 ON8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtf8plRTpmbBUd77x3QxOldwdsmblzWqbwtEQ60Hitjubli66+DuTqSr3IEnU9T2w6VjvfwCfmkA==@nongnu.org
X-Gm-Message-State: AOJu0YzSvsZZ+YXvC7GHc9kdi3ps/BtC5GO4R7nitWDUEIjk2AZ+PVGg
 kQUO6yiw4TFzSx87RZDrNY5Wh7OiZq19OMX/xH8TEmn1oghbVoHQqGuouogNm/U=
X-Gm-Gg: ASbGncuJBkfeYmrkT5nKZ4sQo71NV0uBCZTW3XLTrqAjxyl/3n9472SmCQs78c8GSTM
 q1cophDDywdA43sJix6SAUyvWXzCnU82hRj9qngWXDGOaWkcTpf4oTEjBZez2JmOEKqtJCGgHxR
 eFoAW5vYxRTAGt1qSPla3rcnjw1jDZ5C9InefsXnJmSLX+fY0LJE5ef1jP6vYfu3qVsFGHJYYQU
 YuqD/yqzr5R5MQw8/v5oJ1Ob1DEdeLL6mOYRgqZP07FW/YcTIuVBJFcVmyNVu6qudE0VhjQ8oFc
 oZrd27Tk/YEvA1ZqIUcWJnWZt9TvXxyakRax
X-Received: by 2002:a05:6512:3b12:b0:53d:a4d7:1a8b with SMTP id
 2adb3069b0e04-53df00d3db0mr1249244e87.24.1732700230736; 
 Wed, 27 Nov 2024 01:37:10 -0800 (PST)
Received: from [192.168.69.146] (plb95-h02-176-184-14-96.dsl.sta.abo.bbox.fr.
 [176.184.14.96]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fbc38afsm15730751f8f.67.2024.11.27.01.37.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Nov 2024 01:37:09 -0800 (PST)
Message-ID: <ab884d96-6648-4888-962c-35a6b1d90857@linaro.org>
Date: Wed, 27 Nov 2024 10:37:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-10.0 v2 01/13] hw/pci: Do not declare PCIBus::flags
 mask as enum
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth
 <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-riscv@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20241126112212.64524-1-philmd@linaro.org>
 <20241126112212.64524-2-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241126112212.64524-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mN6L7ev6xlRJ

On 26/11/24 12:22, Philippe Mathieu-Daudé wrote:
> We use PCIBus::flags to mask various flags. It is not
> an enum, and doing so confuses static analyzers. Rename
> the enum as singular. Use a generic unsigned type for
> the mask.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/pci/pci_bus.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/pci/pci_bus.h b/include/hw/pci/pci_bus.h
> index 22613125462..6ecfe2e06d5 100644
> --- a/include/hw/pci/pci_bus.h
> +++ b/include/hw/pci/pci_bus.h
> @@ -19,7 +19,7 @@ struct PCIBusClass {
>       uint16_t (*numa_node)(PCIBus *bus);
>   };
>   
> -enum PCIBusFlags {
> +enum PCIBusFlag {
>       /* This bus is the root of a PCI domain */
>       PCI_BUS_IS_ROOT                                         = 0x0001,
>       /* PCIe extended configuration space is accessible on this bus */

(more diff context:)

         PCI_BUS_EXTENDED_CONFIG_SPACE                           = 0x0002,
        /* This is a CXL Type BUS */
        PCI_BUS_CXL                                          = 0x0004,

Enum would be the [0, 1, 2] bits. Since we define bitmask and use
bitmask arguments in the code, shouldn't we simply replace that
enum by #define?

> @@ -32,7 +32,7 @@ enum PCIBusFlags {
>   
>   struct PCIBus {
>       BusState qbus;
> -    enum PCIBusFlags flags;
> +    unsigned flags;
>       const PCIIOMMUOps *iommu_ops;
>       void *iommu_opaque;
>       uint8_t devfn_min;

