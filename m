Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83D7CC6B19
	for <qemu-arm@archiver.kernel.org>; Tue, 13 Oct 2026 16:47:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xGfeE-0007UH-QC; Tue, 13 Oct 2026 12:46:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGfeB-0007T6-UE
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 12:46:40 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xGfe9-0008Sq-04
 for qemu-arm@nongnu.org; Tue, 13 Oct 2026 12:46:38 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8b0a921ee46so1201917b3.2
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2026 09:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791909995; cv=none;
 d=google.com; s=arc-20260327;
 b=WtTlDctYTKolbaPaMyYkFwaOnD6/goBMh7JsFKi4j3DDuJrm/bRL4hHMbYLVz+ioDw
 DygTFY+QZIsv0aoN4ArACyuEPXaxKZbyLWc4Or54BxxhYTgxbICZW9Ig42LMGHtKAcHz
 8VQ9gubn12HlBdJXAPgsM04PSkUXbbyXSHiajLhOnLUAk6OwyAkj5t0nRavIw99NVlbx
 8hZJD0kjXq8lZZlwt3hoomzW2wcQlHBwx3+2820dzCL4JQoVuF9iQskjFK+6xKt0QHce
 05rKBqYYDGftSSxDeKMBZpBMvuRMSgOYWGqA35wRRdqpBe7HxwheXn5J4VfLzfnshNUy
 jocA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0xh+kS0SvoInvRUIsUOjK7U33/ie4eIS07y4C4K0t3g=;
 fh=2td4OEraexHdSEqCwD3rKczf7F4DKwkaubI6wsNhLEA=;
 b=n72PSzHwGSUGmWEdIkWkj0aUbIANkNwP3qIEzYrv3xqtD7puweJP1KslPCRc2qYiQL
 fluRmiqtA4qutU6Sr9tAkVAN5ZrGd2CBOk9/uSnQfHGfjmqs6V580jioW00KVUqIbXuk
 vXtsHoHvWFAuYDERGC03+PXxmlFYSEVmiGl3czaEDZMvlkV4aJ359aGqNt0bWV/pwl2T
 pn3Rrz2/LsUb31k1bwAdJ46r5OFxH5FCGRYIRZ1jNnAUia6xZobJgqOqsy80DPLrcZ3R
 fgHfGyMJtb6ZG60anaYuKYWRmYfk+VoUO3icWi11EexDoa8EeDdDX4w/gyEkQw9VGNXT
 R/8Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791909995; x=1792514795; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=0xh+kS0SvoInvRUIsUOjK7U33/ie4eIS07y4C4K0t3g=;
 b=FJYpUcwp+FAyFjCY55DHqHEHTSgJYoR0XJSegfa34kxqNKN7QfqEmTHhsF5AwTMQA+
 LAxnQTu8tPOuwZt9KFM6Rv9mqE1JMkpvZMEQxxYaxgY7jgH+6rnMSmpMCTyBMVDOE4oq
 Sno73duEbNDiTOUM7O0RH1rQQhMilgzfoOZxqS3E3zovHoscHmUJSuO24OA4Qf0WMwGI
 ZWwAnWRpSUwbbQvuYIdy63EWtatBoYxG0v9ej7Ubm5zV89NDmiZL2Wav/xmX7pPPXjTh
 9yXBstpNDUt4IsnjJuqqPUWuUPmVboRt7W45b+eEYWQyaqVeXn95Rwpon4AOFvy+dc2X
 kL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909995; x=1792514795;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=0xh+kS0SvoInvRUIsUOjK7U33/ie4eIS07y4C4K0t3g=;
 b=U0xIzTwBffBwlj+2SvZHB2u43MNPc61R8i3gqMF9gKMEm+dSa90uwrs9+D8OF/p3Mp
 wT1/JJ0E4mibrdq5YDpj8dgPHh6mblbsMK3txZeA/0jxN1ddTVFyHIS50ZWBViZsNzSm
 FOYXwDxTMSqYM9GalgiaxGBK6+8BQK/6f2VQPaDYQaMwaAUthMZFpxCyOz7LkofzVp/i
 zYuaLitmWQ0rcGBfw21CGtjFQDCXbwiu/VwblaNk3yENe8m9JXUzMdowj5kvEonXFKBh
 DPE8oU1BshmvcwAgfjHcsDXni1uMJ0yKCgwzt7b+yd7WgIFwWRjFFbRblN7KwL4GHZmR
 1NMQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzTiTZOZJ1tvNYdz+0ld/dB5ZlEtI3kVYb3Miu4nWQsK8RogcjGChx7ISmWlZ0vCTV2eojMUw1tKg==@nongnu.org
X-Gm-Message-State: AFq9FYJISrPn0O0y0r80Xq0gpKQAjTyHxuz+e/uNt0HvK/JuC4rEDgPW
 yV5F4b0JaKtc/qaPi2qbBZvHgjq8BSMiyl9TP71amJUlevTYReZYoxLwA4vyZLMr8m7VTuZSysQ
 xaJ4b4Njo6dMfSFG+ikFcTjCZJ708hcKNeRyN+gvLaQ==
X-Gm-Gg: AYBFou0Ky0GOCF/IBgervcCAHTFWkYY/EYFADn/9Vu5qHGgm4WGTcOYLDFdvNx0HGAG
 vMfgtUiXQ9kiy4hszz2W3y/UKauHRmH+YxQc0kou0Z0tOZP5/yiQLMwQq1JBIyIf7TqbXeik/k9
 MZO25sHvEfZeOwQMIF7yH7tXwpReK2LbUD4FYqa7HfGN4u4Dyzl2L1rHXJaY5ON6otVTJGkMLaj
 /pIfNeQ51WNI3cMqaBXa0gLYXnwJ8w6o1E3LLTGWg4bdwmnffpRqq83d5gJ3tYA9xmuinDNVp/u
 f8WP/2BqA6cM+uIbZJ8wnqG+8C/66jEDrme6RVyliGruCem3eufwbcu/HiLl1vcgPH1gDD+w0FO
 DGec26B19FgPi0ZS2B+tZo0/TnK3uZr/sVtG7wvg=
X-Received: by 2002:a05:690c:d89:b0:8a7:6a41:12db with SMTP id
 00721157ae682-8b07ebfe3d5mr47459737b3.7.1791909995139; Tue, 13 Oct 2026
 09:46:35 -0700 (PDT)
MIME-Version: 1.0
References: <20261001-mshv_accel_arm64_supp-v6-0-aefe5e76a0e3@linux.microsoft.com>
 <20261001-mshv_accel_arm64_supp-v6-6-aefe5e76a0e3@linux.microsoft.com>
In-Reply-To: <20261001-mshv_accel_arm64_supp-v6-6-aefe5e76a0e3@linux.microsoft.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 13 Oct 2026 17:46:21 +0100
X-Gm-Features: AclHuK_BRDixwbQI8ndxNsGPiTVooqSj1t6ytqm9loLL2ErZqwTEVEMFEDMTFcE
Message-ID: <CAFEAcA_a-y6g=mjXECBUEqqcMWSy1wbNY813=4SgdqKVKh8npA@mail.gmail.com>
Subject: Re: [PATCH v6 06/14] target/arm: convert host CPU feature ifdef
 ladder to runtime checks
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
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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
> Replace the compile-time #if/#elif preprocessor ladder in
> aarch64_host_initfn() with runtime calls and add mshv_enabled() to it.
> This ensures the correct accelerator is selected at runtime when
> multiple accelerators are compiled in.
>
> Add CONFIG_MSHV to the aarch64_cpus[] guard so that mshv accelerator can
> register the "host" CPU type.

Don't do two things in one commit, please.

> Signed-off-by: Aastha Rawat <aastharawat@linux.microsoft.com>
> ---
>  target/arm/cpu64.c | 25 +++++++++++++++----------
>  1 file changed, 15 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index dcd0d698b3..a9e346049d 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -811,17 +811,21 @@ void aarch64_host_initfn(Object *obj)
>      }
>  #endif
>
> +    if (mshv_enabled()) {
> +        mshv_arm_set_cpu_features_from_host(cpu);
> +    } else if (kvm_enabled()) {
>  #if defined(CONFIG_KVM)
> -    kvm_arm_set_cpreg_mig_tolerances(cpu);
> -    kvm_arm_set_cpu_features_from_host(cpu);
> -    aarch64_add_sve_properties(obj);
> -#elif defined(CONFIG_HVF)
> -    hvf_arm_set_cpu_features_from_host(cpu);
> -#elif defined(CONFIG_WHPX)
> -    whpx_arm_set_cpu_features_from_host(cpu);
> -#else
> -    g_assert_not_reached();
> +        kvm_arm_set_cpreg_mig_tolerances(cpu);
>  #endif
> +        kvm_arm_set_cpu_features_from_host(cpu);
> +        aarch64_add_sve_properties(obj);
> +    } else if (hvf_enabled()) {
> +        hvf_arm_set_cpu_features_from_host(cpu);
> +    } else if (whpx_enabled()) {
> +        whpx_arm_set_cpu_features_from_host(cpu);
> +    } else {
> +        g_assert_not_reached();
> +    }

The reason for the ifdefs is that if CONFIG_HVF etc aren't
set then the functions hvf_arm_set_cpu_features_from_host()
don't exist...

thanks
-- PMM

