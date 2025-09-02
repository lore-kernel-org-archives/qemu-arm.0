Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C23F5CA0FFE
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 13:26:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utR1l-0002cH-5w; Tue, 02 Sep 2025 09:26:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utR1i-0002XZ-RV
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 09:26:23 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1utR1e-0006td-PY
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 09:26:21 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-45b869d3560so26789265e9.1
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 06:26:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756819576; x=1757424376; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jpw7O1hvdgg3zkQ+ExyEAJ/cdv77jV29nWmWeROzU08=;
 b=AhGQZQBV8w4bvakHPLlnXIWwjh+XzROqxmu3/jBMMChoWsbEoSLNVJFSKWm99jAg9J
 Drfpgap5raoHwHwIGMp2Cc+NUHUXQXZpa8j593LI1yO8dNlonUkhUop9NroZ6RXP1cal
 p8r/S7fwwmLMskRRpmx5VsnkbDb/W8RbAhpgscj3LG2YuvhuFaoeMOLLUvErZc+OonjZ
 SE06Mgye9kws2bArWrkKzyxYbYuQ/nM3w+VkVWNm5cabKjvkS1MOhV+ZvAB0DXu2RCOg
 2/qdJAcqj6W2ltOeUkN6RYUk0HXTc4Wwp5xgMRqV37JY5WpCQ0YGLaWDEm6OTOfTkLFO
 k2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756819576; x=1757424376;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jpw7O1hvdgg3zkQ+ExyEAJ/cdv77jV29nWmWeROzU08=;
 b=JC0jya9sY5LN7v3M7gH/lpqg7Mb3q4IudtxPpY2/h31VMb5vctpKZjFpIAzg8DvBbu
 xrO87dJD4Ndv49LCRLCmEZ9Wup3ByoRLQchllhD9Vzfwo45+ZnUgqbnYTT9J5cQlH7At
 6gTFQshO77HDEkYe8KHWP8dvG9x54hy+nKy8qYyGW5rlHMzHZ0O+MzcSgFq3xvB3U3yz
 gva1+Lpgs6HezCj2YAn9LykwRG/WH8Y7vnor/4Uik5JtyL0oe7sTCcih75SJUczND6PV
 r9swO5nJ7zao5e6h2qLUyTHc/CLK0NIMLBidwYAlWSkTLislmg4ZlhsAl3ghEb7uYI2m
 xxqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGXwAiSpdynq1M/ir4DWDt0JbePZQt/5u8h943JsgyFMRMN9mJ8llcFUaccgfQcg4jCc5R4ovFUw==@nongnu.org
X-Gm-Message-State: AOJu0YyxFdC7XMwvuqSjqm/P+1B+qe+tkwNBPpEpW+HPRQcvKC1NC1mn
 dASbc52AUT95KZufog6ey57h2YT78yXEn9u1Pzw6vTiiOIrck8umRREDsj50h+x4D50=
X-Gm-Gg: ASbGncs3ZHKBsZOhttIaRab7hgVQ5NJ3WwskQyDqxRyUqNmfIMddPpz2bfKcMcnkDz0
 kP8zmwlm2wi56yoxbVb/ilkDyk9nh4FR0egqDtxhUfpzXVn10fR1nwBA+PVA8t5uqKul7zADgmJ
 p3LJoAZQknLxQeCos4bQW/TIaQ1X0fYJTjVR7K5ZqJnNeNQLQmS6Bu0cbqsjRLTkqN1nkD1INM8
 919i1T3mfQDT0cgQot16jIjg0sXCUx3e9JkTLhlJMzuetkVDKhdIE+fIjK5jIGpQynO0cDAMFXR
 5XU+blqdRD5ErjXCjmC9GpnfC/oigq6rRhlKuESRhhFBDPW9MXsn7fxUl36/VYFzpanBtEmqW9B
 0OEKDuVjxVfupxlz89valJbNJfpgdrSx9waXA6/y6rxzng91DJjjnTprKnHfp+sZQiwf9EVqou7
 Lv
X-Google-Smtp-Source: AGHT+IGdcmJ0xcrZ/PpCUNKK5qT5M62HF4dE794Hkisv+n4418KZbBk0qjBu7Nl1u2oeREPbt8SnAw==
X-Received: by 2002:a05:6000:230c:b0:3d5:a6a9:7d38 with SMTP id
 ffacd0b85a97d-3d5a6a98bd0mr6337929f8f.59.1756819575729; 
 Tue, 02 Sep 2025 06:26:15 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3d540843a2csm11255089f8f.22.2025.09.02.06.26.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 06:26:15 -0700 (PDT)
Message-ID: <9fbbe9fe-1067-4273-8c4c-645c2c1084a7@linaro.org>
Date: Tue, 2 Sep 2025 15:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V5 11/30] arm/virt: Init PMU at host for all possible
 vCPUs
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, peterx@redhat.com, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 gshan@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com, linuxarm@huawei.com,
 gustavo.romero@linaro.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20241015100012.254223-1-salil.mehta@huawei.com>
 <20241015100012.254223-12-salil.mehta@huawei.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241015100012.254223-12-salil.mehta@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Salil,

On 15/10/24 11:59, Salil Mehta wrote:
> The PMU for all possible vCPUs must be initialized during VM initialization.
> Refactor the existing code to accommodate possible vCPUs. This assumes that all
> processors being used are identical. It is an architectural constraint of ARM
> CPUs that all vCPUs MUST have identical feature sets, at least until the ARM
> specification is updated to allow otherwise.
> 
> Past discussion for reference:
> Link: https://lists.gnu.org/archive/html/qemu-devel/2020-06/msg00131.html
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/arm/virt.c         | 9 +++++----
>   include/hw/arm/virt.h | 1 +
>   include/hw/core/cpu.h | 5 +++++
>   3 files changed, 11 insertions(+), 4 deletions(-)


> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 0be1984698..4a74c383ab 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -618,6 +618,11 @@ extern CPUTailQ cpus_queue;
>   #define CPU_FOREACH_SAFE(cpu, next_cpu) \
>       QTAILQ_FOREACH_SAFE_RCU(cpu, &cpus_queue, node, next_cpu)
>   
> +#define CPU_FOREACH_POSSIBLE(cpu, poslist) \
> +    for (int iter = 0; \
> +         iter < (poslist)->len && ((cpu) = (poslist)->cpus[iter].cpu, 1); \
> +         iter++)
> +
>   extern __thread CPUState *current_cpu;

Please add this macro in a distinct patch, and add a @docstring
explaining how to use it.

Thanks,

Phil.

