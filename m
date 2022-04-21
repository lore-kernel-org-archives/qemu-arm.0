Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp261225lfk;
        Thu, 21 Apr 2022 04:05:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy655DF17DkrInkdyqYLu+zI73nO1gA/j0dU0cTVWWxQnBzmxnnlOBAiylA1yZTOb8SN7+u
X-Received: by 2002:a05:6214:20eb:b0:446:6ffe:7237 with SMTP id 11-20020a05621420eb00b004466ffe7237mr9902195qvk.29.1650539147268;
        Thu, 21 Apr 2022 04:05:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650539147; cv=none;
        d=google.com; s=arc-20160816;
        b=ifhOEEy1Y9o8fBMRWTpl+JdWo1LEX63ln8xVZ8LneUSqsCTRDNMn/2lz1XjpKIezph
         j7z70Qq0Okq1rkEkgWT9K8Fnm8/g+KrszznG8hzFy9+d9TiVHzolbLSzbk2FXJkcYQE0
         ImZHg/HlYERl6XWVF0m65fkWWavazbeEYWM5TYG/TVx3W4jxmHBOd9weY8YaJl8h6Enb
         Srnt34BGYo9so3pWxxJ2VZvXVFUXPdlsmVwq5BEJv9WqqTqjbwhzuEU86/8ftR7Ko76Q
         TNrF1io4gvnc58cWKrxRimmY+qyBA04rCtiMHXRpInrN3bZ/iTvrX+EpZ5GMYpnw7oRK
         yx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5hgpWLWmdwANyTD1HAR+waBtcTBUdinJUaIUV+UMDkU=;
        b=isZ3VSCDECsd2Uu7CnFlJA8b9M4UpeFaaJKeGsyylNC/Wyic+rRNJccMTgAF/iJEse
         kp8Q0Fnhq3Q9CP4eUg5o3Jk4qyyjH1ybDFKaf0HzTGo1/fLzed8+gRQbpHAvOpISvUTc
         YGcEUwUSkhOiqRy3P551axmn1jnuQL0WdRjeQrzLKBM5+3PK8YA1Cx13L4T3SS374pBN
         kYw3CCQgOAydizLO0p6y+EddEjgwrqjClaintAZnXQ7Xbm4wo6JjfQnwQtT1+3XdxeB1
         N2jaMSvSeKk7mh38BPhxM2/OBcFjnjY/3BICu/QCdGgHYMJuwMk2fEKFuyzdJHDBsAMG
         AyMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="hFkN9T/s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d65-20020a379b44000000b0069a0ddf2192si1217262qke.658.2022.04.21.04.05.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 04:05:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="hFkN9T/s";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhUd8-0004p7-IM
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 07:05:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUc5-000443-UY
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 07:04:44 -0400
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34]:44747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUc4-0000AL-8u
 for qemu-arm@nongnu.org; Thu, 21 Apr 2022 07:04:41 -0400
Received: by mail-yb1-xb34.google.com with SMTP id x9so978523ybe.11
 for <qemu-arm@nongnu.org>; Thu, 21 Apr 2022 04:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5hgpWLWmdwANyTD1HAR+waBtcTBUdinJUaIUV+UMDkU=;
 b=hFkN9T/sZhfllUH3P/xdHkqEC1EGUfzqlHajM5BBVTMlsPumLKrlZvgoTwc0gWNoUq
 2TyAEMqfmE+bCbf+2dIpA41r63mMNxSCZO3vqpG+QB7Qa82W561ab1bRTO+gtxFXS3nd
 E5wjECf+nuT3+9DlsqdXi5W9WS7tEkCSTSk+tX0vVCKN8yr0rfcwocn/3UPvpMl1UbXl
 iJKkoE0osp+6+8y/1ATuXk1/L29elLqXH658sx9bHVbNM2NeXIJCGOBJ1wDqNvPlg27A
 IVeBZKgRL9RapLCU3BYscJ3h87UtT5Sj9sHiPilN21005fPOYT3fii+ZlYGgHJJiGfUZ
 pIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5hgpWLWmdwANyTD1HAR+waBtcTBUdinJUaIUV+UMDkU=;
 b=F9CGV2BOGOc5y1VRo+CHRGIVkGLUIMXDwSOGXLgskUYLk5Jyu2Q9LGBohvXjegtLxX
 MAzQBcor4LtWVYEhQQj3jWV4BJARbmvV/3fLf73FrojqRGAVp8e11MpzbmM87cjuUX5S
 D5XfESwxdr+NrgHziSlgORf+ru1QOBt0jHE281KqogvACGCyTQ7G9zPNG804QFrL/cTv
 LX3zNYrqlDtZnyjW+2L4zZWey8jyo2W4Lz3YScfl8f15HNZbX90BLXV4MWexSE77Za+K
 UMfvSmv8ytvqdo7kQ7uSJ6blTAPN4OhHto58iB9mSKPYl3dEMrjsG1E2HphZHpOPeGFY
 TE7A==
X-Gm-Message-State: AOAM530pln+kIPdQYtCYGvYwth/o5/FedMOU6oSuib9W7QnFSyMAtk7A
 ZGNNl69vMVsexMmiva1mh1xjPHse9AjFkoOQw8jfxQ==
X-Received: by 2002:a25:ccd7:0:b0:641:7c61:de91 with SMTP id
 l206-20020a25ccd7000000b006417c61de91mr23793108ybf.288.1650539079400; Thu, 21
 Apr 2022 04:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220405223640.2595730-1-wuhaotsh@google.com>
 <20220405223640.2595730-8-wuhaotsh@google.com>
In-Reply-To: <20220405223640.2595730-8-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 12:04:28 +0100
Message-ID: <CAFEAcA-muDgih2vboh8JRt5U+nYJKtY3H9Um5UBLsB-rdj5AFQ@mail.gmail.com>
Subject: Re: [PATCH for-7.1 07/11] hw/misc: Support 8-bytes memop in NPCM GCR
 module
To: Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b34;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb34.google.com
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
X-TUID: vHBnssz9ZqJi

On Tue, 5 Apr 2022 at 23:38, Hao Wu <wuhaotsh@google.com> wrote:
>
> The NPCM8xx GCR device can be accessed with 64-bit memory operations.
> This patch supports that.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Patrick Venture <venture@google.com>
> ---
>  hw/misc/npcm_gcr.c   | 98 +++++++++++++++++++++++++++++++++-----------
>  hw/misc/trace-events |  4 +-
>  2 files changed, 77 insertions(+), 25 deletions(-)
>
> diff --git a/hw/misc/npcm_gcr.c b/hw/misc/npcm_gcr.c
> index 14c298602a..aa81db23d7 100644
> --- a/hw/misc/npcm_gcr.c
> +++ b/hw/misc/npcm_gcr.c
> @@ -201,6 +201,7 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
>      uint32_t reg = offset / sizeof(uint32_t);
>      NPCMGCRState *s = opaque;
>      NPCMGCRClass *c = NPCM_GCR_GET_CLASS(s);
> +    uint64_t value;
>
>      if (reg >= c->nr_regs) {
>          qemu_log_mask(LOG_GUEST_ERROR,
> @@ -209,9 +210,23 @@ static uint64_t npcm_gcr_read(void *opaque, hwaddr offset, unsigned size)
>          return 0;
>      }
>
> -    trace_npcm_gcr_read(offset, s->regs[reg]);
> +    switch (size) {
> +    case 4:
> +        value = s->regs[reg];
> +        break;
> +
> +    case 8:
> +        value = s->regs[reg] + (((uint64_t)s->regs[reg + 1]) << 32);
> +        break;
> +
> +    default:
> +        g_assert_not_reached();
> +    }
>
> -    return s->regs[reg];
> +    if (s->regs[reg] != 0) {

Why are we now only tracing the read if it's not 0 ?

> +        trace_npcm_gcr_read(offset, value);
> +    }
> +    return value;
>  }

-- PMM
