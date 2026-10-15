Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAF1CC6B3A
	for <qemu-arm@archiver.kernel.org>; Thu, 15 Oct 2026 14:02:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xHM1s-0005Jp-7z; Thu, 15 Oct 2026 10:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHM1q-0005JU-IP
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 10:01:54 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xHM1n-0001wy-Sn
 for qemu-arm@nongnu.org; Thu, 15 Oct 2026 10:01:53 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-8a83d2706fdso21023397b3.0
 for <qemu-arm@nongnu.org>; Thu, 15 Oct 2026 07:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792072910; cv=none;
 d=google.com; s=arc-20260327;
 b=VKZt2cSuyQfUk06NGTQCyVSg7/XCtIJHPaNipy9jR4dc7qAYCei2OF3FJvYbELk1kj
 S5v8OndQAzxBRVYRivhUkyOLPLITojyQ8AP7l/quHvp6OVTJnAmkdN4Aq83qXztt/KW5
 ZI4Sl2OEPfJS2x4WjvnoRMvrS+ghfeuy+GKnElWoPxTdvHsT6GlGq3gAwSHZeDgTuE8j
 h5VrwJ9zaQltcXdhTyVL3Yyp5s/C+jhksnG6qGOEr6AMKVx/HQNT1nHzZzNsnuEEHwyJ
 O4ZTtn4GQPRn7uBfn5FJRihFxuNCtCSMSYNRI1YaLcjYrj+shzhPbDBN74ji4Re1ZcaK
 7mxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=7oNQfHG6Y05NR+ProUSz8aihaiu4aa6Lf03BAJlyuYg=;
 fh=kGvGFvaY2MjY10de3CFpiXszMVc9c/ZxXkuWpnaGUko=;
 b=L/LMTwBVdcy76eyjqk0VfySMPgMkbjyQWkME5pD8S7jzobb7i5cEORrs8Nryl638gb
 KArk0tsIIuhqgx14B7wspgz4h5wdCBwALqvDbkjCh/OE0gYcEVaCYVoxPEPQB2l7lcLe
 b0CfrBBbYZTTqdmOdlFLYDZpbzeU9ZiXOvgk11qv43JK3iWv93//pKq4Gp0XGkV6EFVR
 4oPhnHBjEiO+8T3FlFSSH5BaUZS23u+ErcAVS/TLeWHMAG7eT8x8aEfpYyr6hnoD/O1w
 unXAUmO9Chr2VmpoTR+MvX4pTyUtNsOCbdsh1lS4nrAhvtfvIefhFtRhOWari/cRxpWy
 ccYg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792072910; x=1792677710; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=7oNQfHG6Y05NR+ProUSz8aihaiu4aa6Lf03BAJlyuYg=;
 b=kfvi7/2kL1PKAA2mxWp4T9DzkrHYoVAygIKsbGkuR2cDfgpQ2ws0RG319NtHdWZdKR
 YKIk22RpBeXCNpmxY2ph8Kz8UJ/GusCt69A1i56BmQm9kPahfFM5YFMO4kw/E/wxpF5N
 NcBVYNIhZZA76aE/6n/AP5qVw9GbipzULH7L5Y+Hu8kTZEWjulohHQ5NHDQP3fSRdmEj
 hlPCkBNlc2ZxiQwhygj4XZhgTyjI4Py8wEcZc9a0/Uw0t04iH4mHXWsyzKlve3Mn9EbO
 Zst0ppxVLaUxPMmOxUURKz8juTZ7RqOcmScbFOh3Q0PS969nBKNEFJv1hFiBRtqfRaZW
 02tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792072910; x=1792677710;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=7oNQfHG6Y05NR+ProUSz8aihaiu4aa6Lf03BAJlyuYg=;
 b=SicyfYdb4oddySf12HfgaYUXbY0hlBNL9m+xrkyFiQkqbVI4C6jDrK7nNHzVrsUHt1
 AQ89xLZI5ypLU/UTlYfbo9nGJlJBw/edvgUmhvDOWUneA6DxSvS1Ea7u19UbF6w/Emft
 xtI5LOwvKaKD37wERUb1kbapwd9lPwueoO/stEKOCRQjPWKbrZDUIFm9sb+LkYENXOde
 gscEV7vCBD7BTKSFYT50XkOou+uHgFDyrfXvLxS7hKwK/RFodQ5Efpm5TUvvJ/ESREfX
 toAOBmxJapISejen2YeQ2Jwot+9bHhywunKu8UhhtzTfaiN8C7mNGBmGp5r434rwo5ge
 1VOg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxe5b3GICO2/giXc4QuOJdYwbq+lR6Hl9gy8YGbyqT+nZ8r40GgvjfVN0DO6Fc8BN4WhGHgGdAXYw==@nongnu.org
X-Gm-Message-State: AFq9FYJiZirVzK5rQ06LXNHypQDE1U3CYQlXK/L7O22M0GHeLXovLLM+
 q3hBiQwekDSH/63QLNGIvv+U74yG/fY/ouLqdbuJkXtZp3NRTjuXmYDkh5j9grvzETecy4+rhyI
 NOnN0/ozU+KgE3JiNR4qvNfthoAFPXPYE8EoBnT+XzNbt7dUb+lO2xkM=
X-Gm-Gg: AYBFou3H5OWOWuWtzlqN6JyTLCmncMjdBbMRxsEXVOBDHoIydnG2eweJHImW++X1m8v
 bwodNrQDQ5uRQ4phwKzMvzT1nqL9wpWx5zXuH+5KaODMq8bznIgBG/q7mC6sayt+t+1paGCUQIR
 L+N+4ecBrBdhPxScSj3+baPczgP3NlQEc6CBGHruGhRIs4da779nyIcrH6xSKdy/hi+Sqz04kJt
 ADBQ5pOYW4vuAzC0t8oluBIJq1Qa2ltjh9rcO7gSU8lWmsKSF4RiDwl8BQAw+FZ2kpMAOyDD2HP
 bpUSaqjAcDL16BwptQmbIzJ9KxYkOexJKutjro+1M8sdrOGV7p3vvM72L5NDFBrs7QLiGumtfgH
 Iv+EsJxzoTUOOUS0ctpG+QzXKagZuEj8gBVvzvIY=
X-Received: by 2002:a05:690c:e1cf:10b0:8ab:3246:4abd with SMTP id
 00721157ae682-8b07ee00c32mr45113657b3.57.1792072908857; Thu, 15 Oct 2026
 07:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261014045605.399684-1-bin.meng@processmission.com>
 <20261014045605.399684-2-bin.meng@processmission.com>
In-Reply-To: <20261014045605.399684-2-bin.meng@processmission.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Oct 2026 15:01:37 +0100
X-Gm-Features: AclHuK8O0VgXq5DeTKRBO1XxrYp12VcAG0ZgJ-ioRxFsP-v4hCjkf2-e1cxUVt0
Message-ID: <CAFEAcA8vYgmm+8YZtcAHccP9KUt8oJjc2WAS9OgEHAsa9fMTBw@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] hw/cpu: a15mpcore: Model the reserved page as
 RAZ/WI
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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

On Wed, 14 Oct 2026 at 05:56, Bin Meng <bin.meng@processmission.com> wrote:
>
> U-Boot's shared i.MX6 identification code reads PERIPHBASE + 0x4 on
> MCIMX6UL-EVK. The first private peripheral page is currently unmapped,
> so that access causes a data abort before the console is ready.
>
> The Cortex-A15 and Cortex-A7 TRMs describe errors for reserved
> accesses, while the related GIC-400 TRM documents RAZ/WI. Follow
> the behaviour relied on by existing U-Boot on i.MX6 boards and
> log these accesses as guest errors. Keep the reserved page in the
> private peripheral device.
>
> A U-Boot fix has been posted:
> <20261013232700.289717-1-bin.meng@processmission.com>
>
> Reference: GIC-400 TRM (ARM DDI 0471B), section 3.1 and 3.2
> https://documentation-service.arm.com/static/5e8f15e27100066a414f7424
>
> Signed-off-by: Bin Meng <bin.meng@processmission.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

