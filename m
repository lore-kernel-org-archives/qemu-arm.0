Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A573A106ACCD
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Mar 2026 18:20:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w0kdc-0000Ku-JO; Thu, 12 Mar 2026 14:20:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w0kdZ-0000IF-2u
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 14:19:57 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1w0kdX-0006PR-Ii
 for qemu-arm@nongnu.org; Thu, 12 Mar 2026 14:19:56 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso1346260f8f.1
 for <qemu-arm@nongnu.org>; Thu, 12 Mar 2026 11:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1773339594; x=1773944394; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8XgqQlLvNNGlBLY4COiKPeshEJmziQwaSuRL7DpVw+Q=;
 b=bU5fC3DtrVJXCqB7SPpajoApaJwIVHSWvzfCz88pb1OTz5m0Ttd4nbsfvrmbKy7YhJ
 PfFaOS+8jk+gEus/pIXB/AHoQIylRwsMp6NL24VBRJRxA2cgLYOhtVVdsaqKlnsXQNey
 3MJOtQqgygFdmSTg/buq9l1GBjSnciHSUgoQLJU6kgwsTUmfxe6XwFqm0qVltqyqabXh
 3PQvtjqGnyp6x98m+8yt5sPGyeYnOi4P8rH46Q32dhNV7GlYduhYRQ9+9X1K5s+aZm+K
 VesI4oFVMhOJ8IoZrPPMWk9l/gMdFQxCAvgwFxUOKHQI1qazmouMoBxzCCks0njLVCdq
 Hj2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773339594; x=1773944394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8XgqQlLvNNGlBLY4COiKPeshEJmziQwaSuRL7DpVw+Q=;
 b=gUGxk5kdXdfH+XvSSGAQ8oJ118jcKWIe0inyKkyF7EWtRbJqbssELJNKQUONL/5XpO
 a8apX/HlQKY1hGIEmhOuH4qMe4ItoQUjNW6o+t1OtcsPdqC6XtUfKdhlIlHNZYzGgm6T
 cnM+L5a7yMEZRJROrSC3AdmTZexrU0HIYSWfjWEKqi1HC3qZ2L3s6bobKiljc/pbtyPI
 5lGL2DrIot0ObcJRqi+d3X1s31psyOMJZrlfkpswJFkdmuil9wlMoOoUJ0mbE/ZXLrMK
 UXHNpCUi462aUUFieD/J7lnuINGDXlEv9pwowKH/axqcy1/LcwdmNKEbxHCXY71CzQ78
 eUKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM44oBH8F/mk6Z+XIidq68v9kNQdOSd07WvtisNAOKRMFT3g+ASessrLPC9amhHOnlehz/bi8Tgg==@nongnu.org
X-Gm-Message-State: AOJu0YzkBFxwWsD9PdbwHPtlb+o01Frv5ng6Kxjm9oX1i1wZe83Qj1l6
 2QITNydqhXaLzbmTvoowg8+JS2qeFdt2qHydcsebEVpdYawSjzft8uB2LEfjaVFiVeQjtDL3cjE
 ii4UxAzI=
X-Gm-Gg: ATEYQzzVRorvRJushBiyMvuZ6o7vB81PyQWizsD9ipNwzfpGnbItYgg+JGRSba51/qH
 dSFVnF+VP5ZMIDpru67OI27jrzsi4kUwpxYRiJZOZBMeCpowmBj5eMwbXW7QLolEu4k9YAXyljG
 P5cMZh/qy3xovjcrkSBpzLbHOQl8jrnabeTJC5QN04C4ervZUTnZh3LyN2N4OH/wHGgcwqNjW/G
 6rLEmEjT6JZt2KeHCACzsoToO/Rnx56xnp8Q5csXXLUIQP8oT6Ksq4sdOdknptxWpRyBUJj6jpZ
 sUiET0Q4ZpUMI9/c/WY5AhlJ0/WEnBtq/vFr8GM4BkCUNAK3nuqFI2QuzuPsA1s5tDnIcq0x6U8
 gcHL1kkuyqWD9RKZ0v8X0rYsjqiOqVezWsjHd8A15u2fQ/amRYL1EWQG+UfmQ8WGFVoQi21bDXi
 lg+DHVk2X+wH6jCECz6vZId+DN/rEdAsZQVIwNoOOSVkakO6v+NzdfWXmDP1vxqqbRhv5IUN7u7
 8Wo
X-Received: by 2002:a5d:5f82:0:b0:439:cb12:9e08 with SMTP id
 ffacd0b85a97d-43a04d7a1cemr1419292f8f.1.1773339593573; 
 Thu, 12 Mar 2026 11:19:53 -0700 (PDT)
Received: from [192.168.69.201] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43a03cfd18fsm2903409f8f.36.2026.03.12.11.19.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Mar 2026 11:19:52 -0700 (PDT)
Message-ID: <c3a46ba7-7f5b-4a4b-8d24-6d78b7c0f5ec@linaro.org>
Date: Thu, 12 Mar 2026 19:19:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] target/arm: cpu: alter error message for host CPU
 type
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org
References: <20260311151014.55915-1-mohamed@unpredictable.fr>
 <20260311151014.55915-6-mohamed@unpredictable.fr>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260311151014.55915-6-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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

On 11/3/26 16:10, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/cpu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 7e3e84b4bb..e73d7eb4fc 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -1629,8 +1629,8 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>        * this is the first point where we can report it.
>        */
>       if (cpu->host_cpu_probe_failed) {
> -        if (!kvm_enabled() && !hvf_enabled()) {
> -            error_setg(errp, "The 'host' CPU type can only be used with KVM or HVF");
> +        if (!kvm_enabled() && !hvf_enabled() && !whpx_enabled()) {
> +            error_setg(errp, "The 'host' CPU type can only be used with KVM, HVF or WHPX");

Squash with patch #1?

>           } else {
>               error_setg(errp, "Failed to retrieve host CPU features");
>           }


