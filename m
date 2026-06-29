Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0FDC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 12:01:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weAfM-0006q1-U6; Mon, 29 Jun 2026 08:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1weAf0-0006mF-8s
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 08:00:27 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1weAex-0006se-18
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 08:00:20 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-664e3ed58bcso532129d50.1
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 05:00:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782734417; cv=none;
 d=google.com; s=arc-20260327;
 b=mcuwJXF6WN/6VstjJBa/RAxVcwaGrEyJHmHfbXhzVtrLrkakwJO4GZ7n+ubzGtj9pQ
 duGmeuw5Ymd/vuxwJ/X3L3kSgPNyaH8ieEdumjgTDzmq4bturRdCe0wmPnfMW9PSC892
 eZW4CGY9M8nBfah5814zaaIjytYjcwb9O3kcmpQP7KtkVFGOYW2/UJKT0QeLwCj9+mC4
 u6zyOwbtAEaZNhqWJuBjk4K69nYnGSy4VWOBwsqLo0Lfafz10/UZbNDwmATXTR+BlkQX
 mREPGEHru4IlBF2+f10ZWg36+khe489v5p+Vk5zh0m6ch1uU72RRnF/5TLFQsG2VH0i0
 dQbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gNj4QCOANvhWx9qKYTXiXz06nNeGz0TLkUw63txWXos=;
 fh=zW/RJ8jxeMJrGauA+qqdPw6NkZuNgh1Bho+ic6f9zJs=;
 b=DQhmZ0KR2qDaLLlxBdatOY96N5UmjZ1XXPwULjgF6yRZ5kpLIAvfScm58xmvFZskgy
 xbUjoFFZ946e+ZXWxuM7zTUcbONj/AtPAm6Ia0hwveyAsFmRkjWVLMYEKVBafpxNCrYo
 U3pFUGStQoMGdxLCE/ZOnZWu822oh188ByBZYk2UuA7Negk6kGq6yU2PBB7xzoaziNwP
 oWWG8IVT/eFFGIsaH+Oi8crpvifWpwJSkMk/h1Tlrqik0yUcJa90kXXv0a3nY+6EKQAg
 ye7jS9Cj0s37Bqj+jpiipJ6/dzuL85EdbqJc+EWLWtZtmoSbPAqPkqXGn5lF5izt7YBt
 67yg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782734417; x=1783339217; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gNj4QCOANvhWx9qKYTXiXz06nNeGz0TLkUw63txWXos=;
 b=Qi3V57pauWu+0BOGY8TXtth3rl66W1EODe+kO51KIRSoKByOgvlkmbWSjZN0amcltb
 /gZ1b7fpzHSao4HPHRGb2OvPPQ6rxiRj5PQVmvEsakv1s7VrXU5zdihOJyLZbL4PL/bH
 1aDxtl/XQL3dDP3cvL/Lhio/LLjOmXel8Lz2li9qA3MWdWnKCsCL4TK+qaU5ES8k4nJZ
 CnqEIfnKtSxqToo8s/KHPfkAX8k6LWEtBUOIhEODx8SsK/mlHSYPHEEqhjnYdhVzvHLA
 SOjH3yhuN0/KhrWvupUNmCntx3bmYoqEkdX0PDiWGypfTZBopb/CJaFjrBVEpKhiOjJX
 nGGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782734417; x=1783339217;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gNj4QCOANvhWx9qKYTXiXz06nNeGz0TLkUw63txWXos=;
 b=oXPCnNNCjJIsP+PW8+mS8TIQ0hV+UUuHq2YZbdhVaZzzOIwuL7oJ2Muz2nG1ShNj3C
 PUuYjh+w5iTFz1nejaJRJ5oTJahrVAIBx2X1WlXWu/6qHb7+KsHiEyz2WfiOcVGky11g
 OXDAybnyRjpikinpYZ6iI5JsHOgS2s7bXJQhTTua1/n/HwB2+iXmP0fTUJJs03YCoCIa
 nDz3aP7p+VbVUbcKlIaEoa8LxEPoBHsc1J1yFI6IekQn0xp8G8tri+Z2t7Nbygxvt3DB
 KWtO48qthKJGDUp8pNYkaLGfYYTcAsVu29iTUVxnJJP0W25fermYYlVudtu8YIxgFI0Y
 7B9g==
X-Forwarded-Encrypted: i=1;
 AHgh+RqNj2slZqfajPspGf1m5cxLG7rXEGxRYF1MysF7ZwXK7RwikR3yiJ2A0hszqai6GNrW3qNCaO+I+g==@nongnu.org
X-Gm-Message-State: AOJu0Yz4UQub7sgEOXfNfevI238pfGrNWY1vlqLqSLxjilc3aHTCHVoR
 sITS/iVySHBJW75zxPnWCIQ5sPLRIsgacOJ1Edg9VLvp2EO5nTCUaBR3ybYPZgHSXtOT9g3g1Tn
 iFlyvXguS6n0YOaRRkeV8U3Rt9wpE5EcIRWcLS19H8A==
X-Gm-Gg: AfdE7cm3zLwZsGxtZLDWcuTvVF+7IecbYav6Q2rQq3nU6CEf+Q+DDACZO3+XYUJsiAO
 EgF3S0ohUrpO+/4G6D3R2aWOPr2uXFyhqzzI6l7rIdksGOpSZAwsjsPRz/FYzAtTs66du6mAwyn
 vXx5OuHR7+8r1MIPzUB9IeYP0qo3V91FWRd37gsqRZjo13HXvGJ0rQCm7Q72f5xBHDlbWvW6qca
 r+RKiyZBVpeZssfOBZNSeFJn/Uu72bAqt3Xih+PLnMeKY22hxvPzDl6qkaHmgJfvM0erXFHM/CQ
 G9Npb2Ke8sryazXW8iMt9XkjpenPPqlccqcB/KCFS7bxe0XZtaMe88I5
X-Received: by 2002:a05:690e:1343:b0:660:3a72:87da with SMTP id
 956f58d0204a3-66487968786mr12267308d50.22.1782734417263; Mon, 29 Jun 2026
 05:00:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-jmac-gpc3b-v3-0-353e546067e7@linaro.org>
 <20260618-jmac-gpc3b-v3-4-353e546067e7@linaro.org>
In-Reply-To: <20260618-jmac-gpc3b-v3-4-353e546067e7@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jun 2026 13:00:05 +0100
X-Gm-Features: AVVi8Cec08Nts62OHgkdJ2sEo2sOfahiQ5FJk6HaxvArMuLH8YdaSS2yah15vr8
Message-ID: <CAFEAcA_M0Z770FApDyhNcYaP89JP3Q8MDj5bMjYKSpmONYrr7A@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] target/arm/cpu-features.h: x-rme now means GPC3
To: Jim MacArthur <jim.macarthur@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
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

On Thu, 18 Jun 2026 at 17:33, Jim MacArthur <jim.macarthur@linaro.org> wrote:
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Jim MacArthur <jim.macarthur@linaro.org>
> ---
>  target/arm/tcg/cpu64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index f7a920a202..75c2027900 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -159,8 +159,8 @@ static void cpu_arm_set_rme(Object *obj, bool value, Error **errp)
>  {
>      ARMCPU *cpu = ARM_CPU(obj);
>
> -    /* Enable FEAT_RME_GPC2 */
> -    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value ? 2 : 0);
> +    /* Enable FEAT_RME_GPC3 */
> +    FIELD_DP64_IDREG(&cpu->isar, ID_AA64PFR0, RME, value ? 3 : 0);
>  }

Just noticed this, but does this mean we should now list
FEAT_RME_GPC3 in docs/system/arm/emulation.rst ?
(If so, we can fix that as a followup patch.)

thanks
-- PMM

