Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0CF5C5DF97
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 16:41:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxSJ6-0006OF-NZ; Fri, 21 Aug 2026 12:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSJ2-0006MY-3a
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 12:41:25 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxSJ0-0008UP-Dx
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 12:41:23 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-84f3ab8750cso872079b3a.0
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787330480; x=1787935280; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=o5Px8COhkGLvlJ0eaDBwZqzFKsB9CXZit19dsF07AGc=;
 b=aQahwhY70torV5LD6vkWzGoEvJhaHj2zqXfV3W+7Mxlm8BQFVMRPVq+PSv5UgwlBhf
 hTjYUpLLLXNeO5DHycDi/xPeqO4iDiwN78jLf+RvcFsgEQS372fS/ZWBGd8f+pvXWkjS
 Tw9yYuD+acloUX5GtH/xAeI2csUmwXSvopCz25ooB21JP0MkySY3hg6nzZF7Wy/cIFbF
 Iq2cRnhw7tYiIA9IOAePpZn9vgYH9Sxuv9ZmZWomj0aam3/oP3lQO/pauN2yXpSGk8e8
 dmn2YPtQP4BWunOcR2qcvfBZN7JvCrU3vCuBkVdj4Qzqu3WFukWnoRMDZdZZuF9gQOsC
 5aOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787330480; x=1787935280;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=o5Px8COhkGLvlJ0eaDBwZqzFKsB9CXZit19dsF07AGc=;
 b=oHTidvMOiRhCEQoZs3OryW2zbm7zHygAUlsln7FnWnH6tFAqAeDSNF17lqDYyGGF1p
 cEKVq3oB0GgnDKhGdGowkMGZJYh2/5BmazuuLgdzQyANor2cRlDNis1sw4GH1bQZ/T+Q
 eE8qbbpFKb7CHIYAL+b5UYoIjcHeA7C4wAKlBc2QYmKaKauGKEcRfW2j3PO68/djQert
 pd28RVO3uRpff7HkcW5JZ6RmUpQyde5P08RACpAwvHGNtblNhaKwbZQJ3mvsiaWZUajA
 FepP+NpBArcIqAlNF3t/Lupza7TrWoLXc8NwqgN402m7j61soSEFRJAfmMGG4JlecCKb
 IXiQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoVFbEe3oDWEWk4ry/RJ95IEmX5VjqEXcHi87su+ZNtoKvErhpQASMcmB8j6DrYrVGnHrdIWEd1gw==@nongnu.org
X-Gm-Message-State: AFuF++nb/LRu8NEalJfKuyRgRS9w8dfiP4sFk9rn8hjyT2UoQ+M5l/9a
 euhfmbe+ZuV1hVku6MipPagNWGqHcr0Ib9CtbxGNsfFbOO0R8CUoR9jNCY1Y88FPlwc=
X-Gm-Gg: AR+sD10E9rnUnN0ei8P/msrJZWulTauhH2oZcYYjnYJERD5Lvcg6hzMZrmNBpCKdZUs
 9FgOMfRhMpqIKJdJkgjPiBxiK+4WJ+gGWgH1rYNIRFjiv3i+R5uGunMSGXcxtK33rjekezBkFde
 5Mpi9MzceP/EQSuInmtbS4Jf1fCINv+gx6rxGI2+T1yTXPj3KOTRBqHLNRfwVrQR63igBXjNzWW
 ChlbO+v4ls6VDrIZ8qfusjbbq6mQklwNDuiVdJDMSxqeTCLhMqnlcjQdXsA6mukYWqigJeqiSVN
 2qh2Y3bfxe9xg/Y/uq7+tuBNMZOMs1pPglx6qjisNMzZ+atZZ6ZJlyoD6HQr5Ok6vkuF/VmQqRI
 rL0nWjkrJfglrgXJxPzf+gjiYf1DXTDzgeZclNTGIjl+8k6y1tBrPdJJnW2InDHfwxUkvGF+RSo
 Q1yy4sFOVx5LvNYHsbWWLuNaFjZiBsm+t4NFCefavYSTEzMNcQQ2W6mh9l7RGecejwOxHpsx5Ks
 l8Y0lFGa+WRzZQ=
X-Received: by 2002:a05:6a00:4c98:b0:851:8baf:5b29 with SMTP id
 d2e1a72fcca58-851f9f7c38emr13055634b3a.10.1787330480361; 
 Fri, 21 Aug 2026 09:41:20 -0700 (PDT)
Received: from [172.20.6.168] ([108.174.179.84])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-851d3362b34sm3183343b3a.6.2026.08.21.09.41.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 09:41:19 -0700 (PDT)
Message-ID: <82632207-7db4-4c37-8ad1-84694e578d4f@linaro.org>
Date: Fri, 21 Aug 2026 09:41:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/15] system/cpus: Constify various CPUState arguments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Zhao Liu <zhao1.liu@intel.com>
References: <20260821104950.32108-1-philmd@oss.qualcomm.com>
 <20260821104950.32108-5-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260821104950.32108-5-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 8/21/26 03:49, Philippe Mathieu-Daudé wrote:
> Mark the CPUState structure const when it is only accessed read-only.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@oss.qualcomm.com>
> ---
>   include/hw/core/cpu.h | 4 ++--
>   include/system/cpus.h | 4 ++--
>   system/cpus.c         | 6 +++---
>   3 files changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

