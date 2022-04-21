Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp253961lfk;
        Thu, 21 Apr 2022 03:54:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCdsFPMBo//teM8tRCxjcitbVHHarAtzU8oJEjYLRC3YNbnMG9pgRkNW8GIwkFMvwiNWVr
X-Received: by 2002:a05:620a:c46:b0:67e:1559:559a with SMTP id u6-20020a05620a0c4600b0067e1559559amr14854483qki.437.1650538496941;
        Thu, 21 Apr 2022 03:54:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650538496; cv=none;
        d=google.com; s=arc-20160816;
        b=saCJ/4UPlV6z+58kbbWvnsYusV0BL0lZUOaRMtQwmVuPo62EBdUWWLittlaLk2WYPK
         yMRN7W2liFb9QG4E7oGwMEp9XGltvXVrlAInRYml0K9U0/yoUUeYUA1WOdMMelOk2Uev
         0XE5Mvyy1PnXjJkvBSiljAohTDTlzxkKjaUJCfKb6YK9fmXBS72Bp4hvyg91N2TgDnK3
         5sQaJwxxneq+UD0OrRLZWZs56MlfKQLDrG6UGUHoBKJNykmt2R5Hf2kidiQ4AdJCH0pZ
         Z2vj4oBPu/Upso1A1InrZgsrgdPIk9B+DVoq0ZFyhQH12fOU12iTgfCdsAXGjudYVOBZ
         ZT5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ng+HmJR4YNJXom9+NbV80owzEQyxRDy275hcV3DpIQI=;
        b=lvwq8Ket/WwF0V2Mly6pLvQkNl9KYhyUeNOzwchtWa1qJnBch4SDo23dZuRafEbsx3
         39bGh6GAC8pP6SZgy+DrD/TSeveBx+Ru2jNFwubT34qpsaaAoLmu2BN5giWFE4shUksf
         tns34C+uSkHrYGdSo4vyNa+ZMONA9vbZyMEnk02r+ecy5mBrfaQDjLc2k5OTvxzNwFQo
         ZGi7dgFMFAeTZY9YuKp6DASMmwwQEbsTjzMcqy9j8dRiC7oN2EvVamGcAUqKzWBuWOi2
         OXdQkyOaXkzse5enQoZbhnpV6ZiT0NRxWXz2eMKFyyg+71qt9+JrU/gEOvGSYDORv/2K
         XLLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KYBUb56b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t1-20020ac85881000000b002f205253f19si1300386qta.665.2022.04.21.03.54.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 03:54:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KYBUb56b;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhUSe-00070q-Df
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 06:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUPx-0004Aa-K2
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 06:52:09 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:33707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUPv-0006U2-Ej
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 06:52:09 -0400
Received: by mail-yb1-xb36.google.com with SMTP id j2so8083091ybu.0
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 03:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ng+HmJR4YNJXom9+NbV80owzEQyxRDy275hcV3DpIQI=;
 b=KYBUb56bKWl1AXvjFBnfyT/EPrE9yMHDTd5Q1pexAW9tjWH4qv2xwB9IZx+NugDkab
 zoUekHg1ZwD4qR/uBKL98Naw9Ipi40a8WrPlN+jrx0dOaY8s5nyl7KZLqAM8bjvD6jU4
 o40e5yzoqiYH9hOMWV4O4as1H1QOiySEkdFMDTaeYaM2zhB8vhzK0tYoOuuT3ReJbxaK
 lGNfGkBlmGczjh3e9faw1roxlDnd5ee0MBtCPIRzmWXkmfzgfUzg25PMcPSDdj87n0vx
 0ZDUNAP5fKmJTt9s4P7ZM2LOvkCJ4ErEPfR4S+hL3xgYFsvS3uzM55rWVRaYVZ+njjF/
 DHnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ng+HmJR4YNJXom9+NbV80owzEQyxRDy275hcV3DpIQI=;
 b=Q7841VPnZrz37uvtC6xW9SVw6aR9offK2cnmnZqTIXmBrRCzI+haWXBEincun5r2Hc
 f6KmL3j/yLIPE+pMZCWgtI0j6E+t8AD3ZxOQjQ5I1aUGuHouSD1100uOXNqoUPWhBTKb
 +sBc0ol7K3VLuScRjPxedOEEe/yMjhNdSo0x51rT4lO6lNRdgG69KZae4vcIqbCGjeOn
 lyD3gL2d7QYoPwvF58QNaN5SGV+w1qXMJNkli9GYLvAmwaEsLip8ZlP9ey5m5rzTr4Ck
 0cVokxhjqiTGpvbXTP14xE+PXSkWggmrrAeI7cj6fNCRrpWyDAyyuPRHvv8iJTV3oNOL
 801Q==
X-Gm-Message-State: AOAM531ArGkBbPMLas68w9IRwRdV1+t6cEwFcBWpEolT4cAjo8CCe0aj
 UYnC1dwaJcvxFq+WinjwgtBz7zytIO4ieylcceDfRw==
X-Received: by 2002:a05:6902:34f:b0:645:463a:b824 with SMTP id
 e15-20020a056902034f00b00645463ab824mr10736541ybs.39.1650538326516; Thu, 21
 Apr 2022 03:52:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-4-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-4-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 11:51:55 +0100
Message-ID: <CAFEAcA_0c7Lb1ryT3J+XCvLrSUKXbVkenfRxo2CCV7m1nhJM+Q@mail.gmail.com>
Subject: Re: [PATCH for-7.1 03/11] hw/misc: Support NPCM8XX GCR module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Uri.Trichter@nuvoton.com, titusr@google.com, venture@google.com,
 hskinnemoen@google.com, qemu-devel@nongnu.org, kfting@nuvoton.com,
 qemu-arm@nongnu.org, Avi.Fishman@nuvoton.com, Vishal.Soni@microsoft.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H7oDIDOjiXCa

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> NPCM8XX has a different set of global control registers than 7XX.
> This patch supports that.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviwed-by: Titus Rwantare <titusr@google.com>
> ---


> diff --git a/hw/misc/npcm7xx_gcr.c b/hw/misc/npcm7xx_gcr.c
> deleted file mode 100644
> index eace9e1967..0000000000
> --- a/hw/misc/npcm7xx_gcr.c
> +++ /dev/null
> @@ -1,269 +0,0 @@


> diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
> new file mode 100644
> index 0000000000..2349949599
> --- /dev/null
> +++ b/hw/misc/npcm_gcr.c
> @@ -0,0 +1,413 @@

I'm not reviewing a patch that implements this as "delete 250
lines of the old file and add 400 lines of new file" when
they're clearly very similar. Please split this up in a way
that makes the changes visible and reviewable (probably this
is one patch doing "rename file" and then one or more patches
making the code less 7xx specific and then a patch adding
the 8xx type).

thanks
-- PMM
