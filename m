Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBFEF8D76E
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Apr 2026 19:45:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wDSeT-0002f7-QS; Thu, 16 Apr 2026 15:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDSeM-0002bF-6O
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 15:45:19 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wDSeH-000369-V8
 for qemu-arm@nongnu.org; Thu, 16 Apr 2026 15:45:16 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-43d7badbd7dso2417089f8f.2
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2026 12:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1776368711; x=1776973511; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tXGADF0m9fvSVjoVMvi01D2+qEpRcaU0JW8MXDn0hV8=;
 b=Jt39y32EOg2mvB9Q1qMPFktOSkJervuz9Kx+sOUVV/MVi+AzLywc6ognZG10PBrXMR
 qwsn8IiS05kLkVQCZmexs90sD6E5RniEEzlLl4bZnXWWdKJHUBvGYN6XSrWWXobIslu3
 mRpbY3Mwvm7QPNfflRkC45nObBX33f58AiYiDLIM9cr/uPytVw1VbMn1nNWH/2/0uKLq
 q4LatYn+qqBzzKrATtDKeUR7zh3U1pzw4o2XHa1i/nK/u/vuYv32ebKN6hN6jyuvJLbW
 ZuRyN7zh1WwEUu1W/frE1F6dA9U+/BkL2hNDUMVwf/TfBXa68YjNPJD3ydDQRkr7y0nq
 exZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776368711; x=1776973511;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tXGADF0m9fvSVjoVMvi01D2+qEpRcaU0JW8MXDn0hV8=;
 b=kOS4xFUvRtFIa19IyQxcOK24MEVE2iqhfxjOC5BdiIcaWdP53TOqjnQFKfHgNFXaBJ
 qfEPu7FVfmcbLkNYjKktK6MUKKrH/GKGkoUqjIpZl6y254fZoVDmtdS1BgdSWesydV+v
 SbsIi6AUpY61rxgJ5xZkuzrcoCY2wJvauIP6xuJNPMcZtXlXQItkeQBpgCLHVmRBvBDl
 ghxd1TtnZ3W4X3se2YLt0fJgWFaryIgxP6MBxPnlRf3sF/vEZpm56H/rIqYIJGcq2aPu
 lGsSPoCGtvntt7rHCm/0ONqDSs/C4qMgM3s6K0BO3wqA2TVLgslWhHx8zds+snaBxa+d
 U6CA==
X-Forwarded-Encrypted: i=1;
 AFNElJ9J7UjW/HiH68jAQkLSmhCi+6TDQT1uKVvmXRRhKIVbWMoy78PgUfthwYKhX5krmvuHH9DMyKwa2g==@nongnu.org
X-Gm-Message-State: AOJu0YxL12hX7sLyDOa/eVTXfa6EAhnAU0igsmPFoGTE+4F+RtN5u7TG
 Ii8LWsh8WAHTyUwSHOsZ3oxxJdPXzE9NnhBf1JBLZuytCJpXWIBqVkOcyhFedMy96Fk=
X-Gm-Gg: AeBDievSVFGgKwdwhH6Jg868utmD4W0sLWscCq92j1RLbSmCJ4HXTnDAf9vuNGm37wZ
 /cNf8zcGRpe3uSVUGaHJqsLQJCPT/ZZspojKVXfHFaLCondUChiDe7LJfszV6Zv9JhfgP+TjQYw
 E/XYFW7JediqDDZ8V/gdpeJi8zI3losaeC7ry1SDxZftUCQg17rN6AxR80/yGfpT0UKBhHT4aMJ
 ThIiqD6eU+VutKUJ8TjA1+oACp6ij2f1dJw295i7vw4tbaSr+LGqNMMpTIY8+dub7ZZLxhny8jD
 y768fCMcf8kbbp7Gq56u4d7+y9Q3Myf/qPMeVf7ctAu+wFG+l8EyOvRutddsaop47e4WMttWqkO
 TprWMgBW4grau1TBFw49bT150iI56W6hn7d3xGbTPA0C9mSoXpvyYKijE+AG64wbRxWHcgejLp7
 wIxWgkAT+w4k4+MwdNzDAFCFl+sdjEJcpzKtYlRGlcTDPeqGqoKFRx4V1FSGjlxMNBnAUpl38aU
 UXhZ8tSk9t0p3A=
X-Received: by 2002:a05:6000:2586:b0:43d:9bb5:bd97 with SMTP id
 ffacd0b85a97d-43fe0ea3d84mr1039467f8f.8.1776368711464; 
 Thu, 16 Apr 2026 12:45:11 -0700 (PDT)
Received: from [192.168.69.228] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43ead3d5eb4sm16469685f8f.20.2026.04.16.12.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2026 12:45:10 -0700 (PDT)
Message-ID: <da07a012-cbd9-43df-b7ad-e705a67c1c43@linaro.org>
Date: Thu, 16 Apr 2026 21:45:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw: Move ARM_SYSCTL_GPIO definitions to arm sysctl
 specific header
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20260416172627.690396-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Content-Language: en-US
In-Reply-To: <20260416172627.690396-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 16/4/26 19:26, Peter Maydell wrote:
> include/hw/arm/primecell.h used to be more expansive, but now the
> only thing it defines is the ARM_SYSCTL_GPIO_* constants for the GPIO
> lines for the arm-sysctl system-control device used on the Realview,
> Versatile and Versatile Express boards.
> 
> Replace it with a header file specific to that device.
> 
> virt.c and vmapple.c included primecell.h despite not using the
> constants it defined; there we can simply drop the include entirely.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Trivial cleanup; I was trying out emacs eglot and it flagged
> up that virt.c includes primecell.h unnecessarily, which led
> me to this.
> ---
>   MAINTAINERS                  |  2 +-
>   hw/arm/realview.c            |  2 +-
>   hw/arm/vexpress.c            |  2 +-
>   hw/arm/virt.c                |  1 -
>   hw/misc/arm_sysctl.c         |  2 +-
>   hw/vmapple/vmapple.c         |  1 -
>   include/hw/arm/primecell.h   | 12 ------------
>   include/hw/misc/arm_sysctl.h | 16 ++++++++++++++++
>   8 files changed, 20 insertions(+), 18 deletions(-)
>   delete mode 100644 include/hw/arm/primecell.h
>   create mode 100644 include/hw/misc/arm_sysctl.h

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

