Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6FECC6B0E
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 16:50:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGfhk-0000rl-Px; Tue, 13 Oct 2026 12:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGfhi-0000qm-AI
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 12:50:18 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGfhg-0000YS-MA
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 12:50:18 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-8ab38a051aaso25482187b3.3
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 09:50:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791910215; cv=none;
 d=google.com; s=arc-20260327;
 b=oDRoDXICs6Exxf6YIeyho8gUH6M6l93b4LLJBNZYx7VOk0tbcEljKAUkAyRmPqQDRg
 WELqbEIzElAHW6u/ORo7g6c0xXcwWRyLVFsJ7hnEVskaZbbvP0DmL/oDzjHYXHFHqcZM
 0nwb3bCZ2bXZzaFoqSC4agpxm5sQDhUZw2RA50hJWd6PJe66TbEXilxArwRPdB+orRNm
 tjqe7WjCBbedeGaSEaWXLEbDK3kBWtmMdx30DAc2cKZg98vpv2vpiQSsKULQKuc9hJeT
 uW5NfXmutsiYsRkhgXpwaS88A2r0wOELwstRj5PB4s3YMQ3DMHkgWE6aX69NftIdWP2w
 hVxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=PIzUdYY4W2ouyygmVnyaVLbSOVBNraxuMdBlCjFXaJU=;
 fh=cxhT5a3TbBh0lQhAqt0el1phznTU5Y/nGyOTFZZ4FEc=;
 b=byfp2D5/NKPlXWlah97t7YcupAEAhVfK035JJIrVGeS43phhxpAYidyKdKS1G0m/gJ
 7AlyqnOy18XkFUPP4U5615esodsj4lShCiT5SAbvpHaAIJyh5jSyBd89gFIsMRcrbGIf
 MIW8rirRJvVNF+RFvlbwBuWc+55cAr8Mo0dbkpyPxeV98ZSHFbR1cMNnE4aGf7OoJNmQ
 sSkmcDMqreoblDcWa5WF7CwHhuaNOhy4qX5ckv0JJeRx4cUf8Wb2SIeL3ex55vfGNk6q
 pEzEJGTlHDRq1VfCHwsxOlMPRqzJ9UFtoP8mnsjKdvdc9i06UhOsvtI1h9cPOTETv8EU
 uFWg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791910215; x=1792515015; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PIzUdYY4W2ouyygmVnyaVLbSOVBNraxuMdBlCjFXaJU=;
 b=tNhEyeUM1DAo10GdiRYeOXQargNxQl7YZe4uWUeHcx8RxAPyiDrorz+Zdnz4CnrffP
 +3FLyOwrOcrlL5jpAl7rB0A7Be2X4G910aHo0W842IooRVFtnZSsb9KxoruAekNFvrDU
 P2JXTQADWc/qvnNTZAfwl8v4lliRMvNSobodsiIyHajT6nuQi5eNXR9bY3m+y4EDDPNd
 2Kgj4ngx8b2QVDRwfWA+GhEa/fDieGx9p67giCNoWDeS+Edy+EgKn9p9tHUcr2Q83VoL
 z3tOMbzQAZueCBtltLnu0zOw2Mp+uV8LXDn29cl+do2rg5DAGEx/mTTlW5aox0UcYYJi
 8PNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791910215; x=1792515015;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=PIzUdYY4W2ouyygmVnyaVLbSOVBNraxuMdBlCjFXaJU=;
 b=PiFm09DRcDBfOnW9gZr6JIbjevcQKmyQJwPVPXzvFxlm7Tp8jpIgkX2e9Tlu5aJUty
 /ts107AwVNs/x5Jr93c3lJS4O5WJgFrZR2frALXNr2CLrswM4TKacw+kDeQQ3Ld33/R6
 YlVY5V3u0hZwE9IRZZAug3kJ9nZ1U+hFd1mxTmPYv5Q50FTf9MaxYYRlK/0ISN64x2PI
 of5/oVMbv22IOhfIZQ29Xjw4hnNVR4LgCV6C+AsUqwA7zUUDZTXV/9npR3vgFtgvvdJd
 hyQZBLnDYIp5HkmYQuiO5lj0I2GuxJli9FdH+1FAIws2bidVFE5NWs/eTeiCe+MIk8TM
 tVIQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByILCQqF34BMgcRvYMetxTcojbE7snWTMEmq8XEO2VN2xR6s1OgepijVpPvlgpwPIIp+x5dS4oltA==@nongnu.org
X-Gm-Message-State: AFq9FYIyMZCJ/KKeVBTHNilfH24hKyBJVtQk4JiP7NDJxwLwLMgcZ64j
 GtcM4fCrlzRl6KfmCXfI9LvMXdG5Tu5kOU61hG85n4SXYaomb2D8RHvbOZD3uvcPvz0cj7bNdQx
 KmExOf+fSuT2qWjUUx0jam2Qa/ehvXECxSBbzhif8qQ==
X-Gm-Gg: AYBFou0ATnj0DBFo5HRH9mfErj57MDIkF6JswxBFcd24c8m43x9zbZRlyxY/r8TqmNZ
 /Ju+J9nVWQiejU/M1LzZlvcVsUv7jVDkORYTJiPWNU6cdwTV6cbEyUK2qmkrsqM3R7y/obg8CFQ
 xAnKAQlUCeIuN8/O7pHJeqMqXRh7La6mUDY4KpuHTaIUEAwoQwlt+gtuHpmfqHaOMrc6JnRwwPT
 zrkiqy9U2VmzVZ+d12TaKPLCjBp8HKdZuJFyo3BMRmd6W4xIs2R9ASDAKooSIysCIAyvw9TiIkH
 9K+QQCiv/2ccuzC2pL1KcN/fqlyPahwTCQKWks2MAgdL5eNNbZFj2/WwKB0uGgCk3241g1ERs6K
 B+TLmirIH0sJv9dOlKstwRfYWCF286fnzOApyZ3Q=
X-Received: by 2002:a05:690c:4d81:b0:8aa:fbe8:8926 with SMTP id
 00721157ae682-8b07eebd73cmr52433707b3.69.1791910214804; Tue, 13 Oct 2026
 09:50:14 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-mshv_accel_arm64_supp-v6-0-aefe5e76a0e3@linux.microsoft.com>
 <20261001-mshv_accel_arm64_supp-v6-11-aefe5e76a0e3@linux.microsoft.com>
In-Reply-To: <20261001-mshv_accel_arm64_supp-v6-11-aefe5e76a0e3@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:50:03 +0100
X-Gm-Features: AclHuK_Io2BTarONqqWtYxaBJWwxe3rnQ5jHfWC3nmKtuvEs7aIE4FfWSMISC1g
Message-ID: <CAFEAcA9xPn2MRjC_d9Gdb=d4-GHmcXPpsLP+WUOgCUhaPbZ2BQ@mail.gmail.com>
Subject: Re: [PATCH v6 11/14] target/arm/mshv: add vCPU run loop
To: Aastha Rawat <aastharawat@linux.microsoft.com>
Cc: qemu-devel@nongnu.org, Magnus Kulke <magnuskulke@linux.microsoft.com>, 
 Wei Liu <wei.liu@kernel.org>,
 =?UTF-8?Q?Doru_Bl=C3=A2nzeanu?= <dblanzeanu@linux.microsoft.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Anirudh Rayabharam <anirudh@anirudhrb.com>, qemu-arm@nongnu.org, 
 Alexander Graf <agraf@csgraf.de>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Thu, 1 Oct 2026 at 11:52, Aastha Rawat
<aastharawat@linux.microsoft.com> wrote:
>
> From: "Anirudh Rayabharam (Microsoft)" <anirudh@anirudhrb.com>
>
> Add the main vCPU run loop for MSHV using the MSHV_RUN_VP_IOCTL.
>
> Handle MMIO exits by emulating the instruction using the syndrome
> information from ESR_EL2.
>
> Signed-off-by: Anirudh Rayabharam (Microsoft) <anirudh@anirudhrb.com>
> ---
>  include/hw/hyperv/hvgdk_mini.h |  44 +++++++++++++++++
>  target/arm/mshv/mshv-all.c     | 107 +++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 151 insertions(+)
>
> diff --git a/include/hw/hyperv/hvgdk_mini.h b/include/hw/hyperv/hvgdk_mini.h
> index 33c9e4f3e0..53dc58813e 100644
> --- a/include/hw/hyperv/hvgdk_mini.h
> +++ b/include/hw/hyperv/hvgdk_mini.h
> @@ -896,6 +896,50 @@ struct hv_x64_memory_intercept_message {
>      uint8_t instruction_bytes[16];
>  } QEMU_PACKED;
>
> +union hv_arm64_vp_execution_state {
> +    uint16_t as_uint16;
> +    struct {
> +        uint16_t cpl:2;
> +        uint16_t debug_active:1;
> +        uint16_t interruption_pending:1;
> +        uint16_t vtl:4;
> +        uint16_t virtualization_fault_active:1;
> +        uint16_t reserved:7;
> +    };
> +};

This is an mshv specific file, but I would still recommend against
bitfields-in-a-union as generally bad style.

thanks
-- PMM

