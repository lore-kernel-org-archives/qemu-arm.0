Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9031EEF30A
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Mar 2026 06:17:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vy21Y-0007zL-17; Thu, 05 Mar 2026 01:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vy21S-0007vj-6P
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 01:17:23 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1vy21Q-0002SQ-Qa
 for qemu-arm@nongnu.org; Thu, 05 Mar 2026 01:17:21 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id
 71dfb90a1353d-56ae58f3fc6so1480840e0c.3
 for <qemu-arm@nongnu.org>; Wed, 04 Mar 2026 22:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772691440; x=1773296240; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=04wSoPvEJvkTAiAgHbyNSYUJJM0mX/HXbO0rUhp706U=;
 b=DBTNqtunWhACZKzgxQzyhaAJPwCJIvBtrAvqjMvHXS7AUuZQ2/YrN0yL3pOYiX7kP4
 Lntrwfsifi0Ot7+XjPt24UyfKgGfkJ906a504I/l+Hwu+qtrv+U2N9Fff2HUOgr3MBcx
 vR7cPfV61keRHWAVZlzn/g45CvNYeiFiGbF7cw2hng8X98xX0HIwdrDbf0n5ahZiisim
 Wv7Oo3msPFgTDiX6Z8Z7xNF6gpmdxSDdn7RUZLV3lRZSRgTmaQu+IyDzLX+4e5dtMcht
 06Grj2Ga5tFLBcAidRaI2ABvRTpz+FbSrdATRCCVU5dy4q393V/Rbo0iewYy3Fri7yj9
 CEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772691440; x=1773296240;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=04wSoPvEJvkTAiAgHbyNSYUJJM0mX/HXbO0rUhp706U=;
 b=OtpQ0wLdiDIweSMFPS+I0bU+J4hRPl8qMQ9jGZqL+ZS4Lia8S0klDDKEpXNLqgwWE9
 9v7YXJM3JqVe9mFZv8lqLqTN+SDp0zvsyzJ+p/QDsTafRbZa9cl2zLFgsiKt+tBHiICo
 a/0AhuTAeHmN8qB6hHF0tlxX6f7jvEQbIKxQnC59ACTF3oofwUhRwEP0H5qxH0YOFgVC
 1h8yiqXKrQWy5ZfrLVMhsvg1X2PyMK9mqDyGZkz7eiZzV2yJ9bEi9sQI965dtwY/hDVg
 3ClDQ2LYP1Ps9c8dOdOJ1NzHthG/YZDybLMl7aVt9I5TdMI4TLvk5PsNTX6WjEyMKqjY
 pGyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtDs81UHLHsbVVex+sC/cFVKL3zEi7EdCrouumCo0LR/uYv7WdSdnSxVcWM6zTs3cEc/dx79sCPA==@nongnu.org
X-Gm-Message-State: AOJu0YzApYrvu7kfnb84Tn7OBVJpm/Bs1mvBUrMr8Qxsyw+jlchdRfTB
 iMFQ50Pb/p9cPURUvyM7lwFfzVLJ5PsBln+ErjdISaGJvv33v8seu7c97xQFcGnj/IA=
X-Gm-Gg: ATEYQzwLWD86m4w7BucBmMmxW1/X9tNUk3sujH8mY1DhRfRg34dlVazL72QMW8oIPni
 dJcNlKA0qOK/f9ULqgaSR5iVZ+GUZD4pm4+X1jUbVhFy8Bc9Ti+qpsm5aERdMVloocgNFWeNFr/
 VBeIXYv0xJy+raif3jBVqZJ1Sklwff57UF1zaCvwEnYKObLrOt25Eoi7XVT74HBJ0Xj+bYcRf+S
 jVXjsLHj1izlCtTCLBi5lqoy93/iBdgUjjrpTy2lEP2Mw+923rzmwxQrceH7r07uWBxzAviwncc
 3KfmyuZLt4OT+KudRJQDL5JDoU/QdMnPULZtUpxd2NVhEqK8MPWf6M63WXgXztOHGbyb1SzQHRI
 e3/RWTfalAbVUApqrgmLaItdMlA6KAVm0oY6ffg56MNb/FJdIEBjRC5LpDkMwBtopxU2XBU79IB
 Pz8obpX9MgeEwK0qMD5efEUHFvJ5/Vz6ER
X-Received: by 2002:a05:6122:3c47:b0:55b:7494:177b with SMTP id
 71dfb90a1353d-56ae7765e96mr2463007e0c.10.1772691439618; 
 Wed, 04 Mar 2026 22:17:19 -0800 (PST)
Received: from [192.168.0.103] ([191.8.216.93])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-94df645b877sm20240098241.8.2026.03.04.22.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 22:17:19 -0800 (PST)
Message-ID: <7575565a-89e1-4ff6-8e05-9c84c8682214@linaro.org>
Date: Thu, 5 Mar 2026 03:17:11 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 4/8] bios-tables-test: prepare to change ARM ACPI virt
 PPTT
To: Alireza Sanaee <alireza.sanaee@huawei.com>, mst@redhat.com,
 qemu-devel@nongnu.org
Cc: anisinha@redhat.com, armbru@redhat.com, berrange@redhat.com,
 dapeng1.mi@linux.intel.com, eric.auger@redhat.com, farman@linux.ibm.com,
 imammedo@redhat.com, jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 linuxarm@huawei.com, maobibo@loongson.cn, mtosatti@redhat.com,
 peter.maydell@linaro.org, philmd@linaro.org, qemu-arm@nongnu.org,
 richard.henderson@linaro.org, shannon.zhaosl@gmail.com, zhao1.liu@intel.com
References: <20260220141128.789-1-alireza.sanaee@huawei.com>
 <20260220141128.789-5-alireza.sanaee@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20260220141128.789-5-alireza.sanaee@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a2c;
 envelope-from=gustavo.romero@linaro.org; helo=mail-vk1-xa2c.google.com
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

Hi Alireza,

On 2/20/26 11:11, Alireza Sanaee wrote:
> Prepare to update `build_pptt` function to add cache description
> functionalities, thus add binaries in this patch.
> 
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>
> Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> ---
>   tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..e84d6c6955 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,4 @@
>   /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/PPTT",
> +"tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt",
> +"tests/data/acpi/aarch64/virt/PPTT.topology",

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

