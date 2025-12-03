Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CCFD1268E
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Dec 2025 07:02:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vQgs6-0002Op-AG; Wed, 03 Dec 2025 02:01:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQgrv-0002KD-Km
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 02:01:46 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vQgrt-0001oC-7J
 for qemu-arm@nongnu.org; Wed, 03 Dec 2025 02:01:43 -0500
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-42e2d44c727so1727091f8f.0
 for <qemu-arm@nongnu.org>; Tue, 02 Dec 2025 23:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764745299; x=1765350099; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iLegxef/YiqYKWzWPFEOA2BIUc7KYmVqjzdVrXKPuiA=;
 b=FCzkrSu+hSxXFItoXRLA0vw2PD2AWFL/QusmA2ZFGCqpSccfUA21tarLME28MaXxYK
 Ip3TsvXzIWzR6FQ9o7dI6sHeqNC6pFe7sEGla7bUZ5PHNYmksOqAsbZ2CrZ1YNe3YZWn
 S8dylEV3P3DOg0+2mt6SxI5h/4oVGufnDN1mgcaJqTL6cJ60BCuOfXzsOQwtJcNIu2An
 VueCv+SFYj9baUFqamxpa51Cm2Eh5wVqcPXkp25o4KzUJeLMl2AavAyBoAXgHt9RW90C
 BA3rewq61YWkZq70jTrVFToRulrODYimHuY3DAlxJmb1GOV+myXqth8yaICSmh/ZrmHA
 Ms6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764745299; x=1765350099;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iLegxef/YiqYKWzWPFEOA2BIUc7KYmVqjzdVrXKPuiA=;
 b=my/NuzjOQPcFbWSadxKEcaa/HaBCxumhoxa9bIq8RDm0QksFiGOIjVGbUMEUm+znA7
 zJpAtuhzopMpu6m59iusjxD23gRlRp7h2ecqeyDN5CLg6VkY1ynehl7gYAOH0zuIRGo6
 i+XFd09DXS2egupNyfok02W/wqJVowHBkTvfGgVn9ZMKs/mrtGNvAS1340YvvttL+iWX
 Ghs9mGWoshL6kpiNfeh0496N45WX98zgVrTC8/cUnGeat5iVmp6GTT2/ozX7EqwL4YEN
 SXskiaD0GVQiuSFli0rhS91kmjD2UY5q/E66UokY0gLksEri1jWQWqUK8pzA5jjHXY2O
 zk2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsuYt/wR3sGjerNyKnl1wsEWUs6rmuju7njsRSaSLk/4jVPaJLDsZ6BN0xFO/r9hvbgyqWtKRlFw==@nongnu.org
X-Gm-Message-State: AOJu0YyF+FEhQ8GXbtbhTmVZd0ysUH1VRShix86mQ9BSqABNlU6d3WyQ
 dXy5SVGFkd02orzS9+0nnxwqVd73hu8NWX1rEuhoPa/8m+DngQXznDOP688/1B3Ye5o=
X-Gm-Gg: ASbGncvQxoFXUTArlBVoy3Oe2+QoIsj/jT3MmYRocebezxX6vSpYpymAmsYsLPBHRDb
 zRbTm0TI+/P0YfD8JrlNTmJB0fB384sr1fHeTIB0RC2Ox94IjjctGrMKPKD8ph1dGR/WQo6VGqg
 fOGuPo8o/+OCzQwlh/gyeY8ea1HRyVsgVEQmTT0qKlU5z9mZ6kygRqOtcrqZesr2GryUxXkoPbr
 Hu/F4t3g9+3KrSMZfbiItpS8mr9MsoyYCgcCNInSNS8/k3V0wUpVH1YGX3HLPAkuWC2PVb4IB2Y
 X7rrOQqk9PFKnU8l8GLVG6bBhuA1O1pXy4ABjC1iF+yX0JTL9+Z7kb2hBsUa/Lq51AufwzZvUZc
 q62tmql5NeK8SyTeAyGvQiist3N7/IJa9jZ9Dxe6kwF/N8XIsNy3J4XbvdI0nnju/scMdeLJKni
 io63Xbq7j9SQoCcjBfjWElLeOsmvdlRjTMqEkzl5Hvpu6BFXWNQcSC4g==
X-Google-Smtp-Source: AGHT+IFWayL7dZkqCSl/nVOxv4Bv/f6eF21QUbKlrnYnU7+tA8VCf5qu+N8vib84rXuH2Fw2mN1z9g==
X-Received: by 2002:a05:6000:428a:b0:42b:2f79:755e with SMTP id
 ffacd0b85a97d-42f7319051fmr900134f8f.3.1764745299574; 
 Tue, 02 Dec 2025 23:01:39 -0800 (PST)
Received: from [192.168.69.213] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42e1ca1a3e4sm37760730f8f.25.2025.12.02.23.01.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Dec 2025 23:01:39 -0800 (PST)
Message-ID: <74013c3c-c8c3-482e-8811-265dfc557fb5@linaro.org>
Date: Wed, 3 Dec 2025 08:01:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-11.0 v6 12/13] hw/i386: Assume fw_cfg DMA is always
 enabled
Content-Language: en-US
To: Zhao Liu <zhao1.liu@intel.com>, qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
References: <20251203060942.57851-1-philmd@linaro.org>
 <20251203060942.57851-13-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20251203060942.57851-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
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

On 3/12/25 07:09, Philippe Mathieu-Daudé wrote:
> From: Zhao Liu <zhao1.liu@intel.com>
> 
> Now all calls of x86 machines to fw_cfg_init_io_dma() pass DMA
> arguments, so the FWCfgState (FWCfgIoState) created by x86 machines
> enables DMA by default.
> 
> Then 'linuxboot.bin' isn't used anymore, and it will be removed in the
> next commit.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/i386/fw_cfg.c     | 1 +
>   hw/i386/x86-common.c | 6 ++----
>   2 files changed, 3 insertions(+), 4 deletions(-)


