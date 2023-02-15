Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp801349ejb;
        Wed, 15 Feb 2023 11:47:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+TdOpvqeH/hNSztDl71roHbkabfRQvb/iNCjtxKQqepArLLh1wS99POwWkaJ9BrBUrN4Wn
X-Received: by 2002:a05:6214:2481:b0:56e:a918:a4ed with SMTP id gi1-20020a056214248100b0056ea918a4edmr7323987qvb.1.1676490469879;
        Wed, 15 Feb 2023 11:47:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676490469; cv=none;
        d=google.com; s=arc-20160816;
        b=pD0Fgzu4kRSxmyLf6WvSiqLgrVCR0bF3l41tSxiq8YDvCsEgs647eFNe6lfEJfasHB
         IpDEK08Jaw08SyXDe7RZpKctGlx43OypFCNXAihvQXR93BgBFeb8aG1k8zhmWn1AckHb
         zfdJ9cgYELpoUyNUJq5qx/W4ikbpNX+iKYNk6pZ+SjhcuBQ1AH1APWzz7AtABu7+bXMg
         LDWgMGZxbD/MDDnbX9hhyeSfUkCsLxnSwKMOubqL1dt68EgtkjUVBlR7PqrWJDZSiLHT
         IFb9aYw2bFg+ZswVtT1f6H4rMBFbUNKtmW1q5+SzEvLJwZ6pL4Bb++pOKL2f5aEOtCrI
         43jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=biYTv1KrIOn/rRnd6jYNDAxXi6lHTwPVoYtJhDKMIpw=;
        b=uYUGletkQ1E6bAgFcep5l4yrYG/m/k6EQPzXOz0k0zN66t94TkaeONZYrZ4rXQWUPP
         olCJsVk+b743E4WwxIPqb5UgZpAra3yxVWCbyP4IoxnfbmZPYxf09j5lGq4xO8e+H8L3
         htJ+5IIymeyKOeff0JwwCxoKW2kduYk/mp3cSPxC3OG8PjUedbaP2LE4crkWVgPbPnsv
         xEBift72nYIHzJkZSssMbilx65WxsUC5G5z/9tbh3mycYS0UGLZzmKHKjMH1H/e9hDlo
         kY6iIiacJmLjHe/kN9tOL6UTSa7HOa8DMG1wdA2lBbyXhSmSs0XveHosWWGi1hfo5wu+
         tLBA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJF2YJcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3-20020a0c8e83000000b0056bf9b6b0f5si14516401qvb.251.2023.02.15.11.47.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Feb 2023 11:47:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iJF2YJcR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSNkT-0007O6-UW; Wed, 15 Feb 2023 14:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pSNkR-0007LK-DM
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 14:47:24 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1pSNkP-00059v-Mg
 for qemu-arm@nongnu.org; Wed, 15 Feb 2023 14:47:23 -0500
Received: by mail-wr1-x42f.google.com with SMTP id o15so16986449wrc.9
 for <qemu-arm@nongnu.org>; Wed, 15 Feb 2023 11:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=biYTv1KrIOn/rRnd6jYNDAxXi6lHTwPVoYtJhDKMIpw=;
 b=iJF2YJcR5FO6uIiQtECdmfsf7lsCPg41fUrQTnvWqSyLXfUKj8ejsTS42SH1XFK+Vv
 vJXcDfOTBy+hL8wpSD4WrrOwpUIpby5wUL3I3gS1Ahlg4n/pLx/Eyfqg3k1Rrqa9iA5Y
 o7JCWFuOLZTqu5Y+udqasAlp6egBo1Qgbv/whk0z1JubUr2NXnr1XIO8/xPUnbkSx0JA
 AbWFaYxuca9juYqF/DvNgN9WC4tV+zX23TNXIgPWtLFikDr9mnYgYPW4TgDnTbeh8NAL
 Js/H22rMjCjeyPs+DX+04KIxAS0ZKdczIGsai2CB3QPM258OZTJgNyWhQJoOZGKkEyss
 eENQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=biYTv1KrIOn/rRnd6jYNDAxXi6lHTwPVoYtJhDKMIpw=;
 b=4coNHKbXmhXxRn3M1rowF/6soQgmhI4HpVK3IGrq3gya/V1vja0159Ay/U7iafWy7J
 rachR3meN28xkc+PB+uVEnpih24fhdv2xdV4T8yE/lazRamomzNAlpgcF4p80XMIAxcd
 e1OkftwSLDneg+N4UoHhYrSPqGmOQzguA3o2eTJl8cUZ5gUMulsQxsqhvGTodA8tRt10
 Ep5oIbZssTXgBkYnccSsHs9LBD1SvAemZhS+O6Wt3IWqMsdsQKCxUJiu+MI+oA02uZaK
 GWiNA98dkx/yGijr0aksjdqZbaJ6S6twqYw2CcDBYab72BbSWErwEhc5vm13QDi8ZumM
 IMjQ==
X-Gm-Message-State: AO0yUKX0n4U2snpxnXgKjVNk6rD5iFpYyEd9t+ua5+vkrPb9j7AKBelk
 pNWVpd313RrH8J/ZfZIFYYO1hg==
X-Received: by 2002:a05:6000:1c0c:b0:2c5:4c9f:cf3b with SMTP id
 ba12-20020a0560001c0c00b002c54c9fcf3bmr342407wrb.7.1676490439501; 
 Wed, 15 Feb 2023 11:47:19 -0800 (PST)
Received: from myrica (054592b0.skybroadband.com. [5.69.146.176])
 by smtp.gmail.com with ESMTPSA id
 h10-20020adfe98a000000b002c5501a5803sm11406478wrm.65.2023.02.15.11.47.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:47:18 -0800 (PST)
Date: Wed, 15 Feb 2023 19:47:18 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Mostafa Saleh <smostafa@google.com>
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 12/16] hw/arm/smmuv3: Add VMID to tlb tagging
Message-ID: <Y+02xgL5RhO3vh6S@myrica>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-13-smostafa@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230205094411.793816-13-smostafa@google.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42f.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CzHoEGwbVxNz

Hi Mostafa,

On Sun, Feb 05, 2023 at 09:44:07AM +0000, Mostafa Saleh wrote:
> Allow TLB to be tagged with VMID.
> 
> If stage-1 is only supported, VMID is set to -1 and ignored from STE
> and CMD_TLBI_NH* cmds.
> 
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  hw/arm/smmu-common.c         | 24 +++++++++++++++---------
>  hw/arm/smmu-internal.h       |  2 ++
>  hw/arm/smmuv3.c              | 12 +++++++++---
>  include/hw/arm/smmu-common.h |  5 +++--
>  4 files changed, 29 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 541c427684..028a60949a 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -56,10 +56,11 @@ static gboolean smmu_iotlb_key_equal(gconstpointer v1, gconstpointer v2)
>             (k1->level == k2->level) && (k1->tg == k2->tg);

I'm getting some aliasing in the TLB, because smmu_iotlb_key_equal() is
missing the VMID comparison. With that fixed my handful of tests pass

Thanks,
Jean

