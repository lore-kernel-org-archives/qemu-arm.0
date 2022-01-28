Received: by 2002:a05:6512:3e12:0:0:0:0 with SMTP id i18csp11277lfv;
        Thu, 27 Jan 2022 16:23:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzv0IsGbINIY4/aka52cgb6rr8RIi8lB4O5CDE8LXUvNn2q7XRELk5XPYxXK0JvcMvg1UsR
X-Received: by 2002:a25:cf4c:: with SMTP id f73mr8716633ybg.236.1643329437339;
        Thu, 27 Jan 2022 16:23:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643329437; cv=none;
        d=google.com; s=arc-20160816;
        b=MpvZJlOi1Ft3omVqT//4bnWOrpCcHrZ0AZaB/6jTdBU0XuuQDEjHw+F1pEsSNKKMJk
         mP4jaV0ujivHAanYgJyhJFX+Ewm8ihV4bG8oRQpNWyO/5ggS4iOyOTZT1AmVVmweQhFX
         Hcdbxt9Ho0bHshVPYdmPel0H2wC3uNe+T+JqOvEgrZLACOmgLUlQU2h46JrHC0FsQFpt
         El7qtn4lyEZSaL7vFjsf833RLAj1Zpf/SUjDoAT/bRIurrKDJx08Vnnwj5Ktdzc/yt37
         YRFsfXCyNeFbMJuUf3ymjm65Dg1NzPmkAyVJ99JjkYOhD6r/uZTMtMBsSHJty6TiJAsj
         U8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=C99+ekTc2ipgBM6O7viaFddYMz+dvpwOInod9Bx8RvM=;
        b=E10fh8bXIfunXkZJEAbaqtljrdxP/90wc11nz9uOuRMHlbpsi2FPN6x9InpQsRiNPh
         +SzLZ17AL6R7UaE8Bgn9FcPjirGUYbgav9x4I0FZfwYUVoCetK/yaDldeVOy7P+a2+NV
         0oX9kdoP2MReFH3HsrradLqGUZSxLAlbDzOMZYuJIUF+CJ4g0+byrp5Qabq5gpL0vDeJ
         A4Z2o0lzv8jYXur+1Kl5+2Vl60MX2VggNntkwUX6s9E4SqIru38qcRaoAAfDeJ13Mcfx
         CPBjfTQYkoXegdPavywO9tAGNqf+WCG1qkmYThBcXKxeMmwaCXJRDm/ZuS41qfw/XtC9
         CI8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDIWq0DC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d189si27284535ybd.456.2022.01.27.16.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 16:23:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uDIWq0DC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDF3U-0001nr-LL
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 19:23:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDF3A-0001nb-QV
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 19:23:36 -0500
Received: from [2607:f8b0:4864:20::436] (port=47068
 helo=mail-pf1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDF39-0000xz-7m
 for qemu-arm@nongnu.org; Thu, 27 Jan 2022 19:23:36 -0500
Received: by mail-pf1-x436.google.com with SMTP id i17so4491353pfq.13
 for <qemu-arm@nongnu.org>; Thu, 27 Jan 2022 16:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=C99+ekTc2ipgBM6O7viaFddYMz+dvpwOInod9Bx8RvM=;
 b=uDIWq0DCPCgkNmgY6vRlnJE6iOwffau6Gwemef2ZPP30LXSBqMSpvVeGVz725NwLss
 /PYhCp631okHRznMlUjkOndg6UXvbgokyHKcVhVslGM6OBCLhm74KEZs+xY7lYqtbxdk
 cZjFM8KGmjIRSIyAIuQtnc1YRIW/avPWTP+45YAq/bWHTsFytACs2zBfV6n/LKBE0gsq
 AtkiCe8M4OFUJh9yo1U9IA4mSfzFMUPMxnSBokNezNMbXj6sgkvMiqfJ9/x1fMgZ92/l
 Z7i2RcQafvLnP9JvnchgXRjgqHzejYeylBLxhSTarUf571YEKbSNEVhVF9v066J6u+vv
 9q4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C99+ekTc2ipgBM6O7viaFddYMz+dvpwOInod9Bx8RvM=;
 b=IsvQ4JMr8V9EJ76GtKDIDyWB7BdVQMqK59ox1AC79+KWmLbugaHey6YxEmulGaL7WX
 7irSnJYuUZ3n7BtLUBelsm161vGxEiQSBHp4xUCXlKlC6Y3t10aZeWAteziPFhusHQ9b
 YziXR/Aqjy6sHtFckpH1P4Jq1aEQHDa2CTF9z+tiTIMBOapIeQQqnvyUMwrKIk8cqIPR
 Xs8wRN5mz3Bojgv+NDC8LPf/dn3RviE8ngbcNoyCAPeGKBqCn+FRwZsyGKuYeYWKqTUI
 fOojaEC0ZqkoH/EjiQSszpvLEaicAN/ps7LLQd6oZRdfnXZQamlHvvngzfMYXK6et9Xf
 J1sw==
X-Gm-Message-State: AOAM530NqUMHMgNWAbWdfive8Eo5RrwK4gWjiPDkJraz68Vz7kvGnk57
 b+jZxTt4D3PuCxqZQnTbEciKFw==
X-Received: by 2002:a05:6a00:16c1:: with SMTP id
 l1mr5697114pfc.52.1643329413653; 
 Thu, 27 Jan 2022 16:23:33 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id 16sm3872351pfl.99.2022.01.27.16.23.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 16:23:33 -0800 (PST)
Message-ID: <e49aaa62-5c98-c930-c6d3-eaaf0f7d492e@linaro.org>
Date: Fri, 28 Jan 2022 11:23:28 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] target/arm: Use correct entrypoint for SVC taken from Hyp
 to Hyp
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220117131953.3936137-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220117131953.3936137-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::436
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HHnURk0Qfm8U

On 1/18/22 00:19, Peter Maydell wrote:
> The exception caused by an SVC instruction may be taken to AArch32
> Hyp mode for two reasons:
>   * HCR.TGE indicates that exceptions from EL0 should trap to EL2
>   * we were already in Hyp mode
> 
> The entrypoint in the vector table to be used differs in these two
> cases: for an exception routed to Hyp mode from EL0, we enter at the
> common 0x14 "hyp trap" entrypoint.  For SVC from Hyp mode to Hyp
> mode, we enter at the 0x08 (svc/hvc trap) entrypoint.
> In the v8A Arm ARM pseudocode this is done in AArch32.TakeSVCException.
> 
> QEMU incorrectly routed both of these exceptions to the 0x14
> entrypoint.  Correct the entrypoint for SVC from Hyp to Hyp by making
> use of the existing logic which handles "normal entrypoint for
> Hyp-to-Hyp, otherwise 0x14" for traps like UNDEF and data/prefetch
> aborts (reproduced here since it's outside the visible context
> in the diff for this commit):
> 
>      if (arm_current_el(env) != 2 && addr < 0x14) {
>          addr = 0x14;
>      }
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
