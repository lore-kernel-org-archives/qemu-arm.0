Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp2888355lfc;
        Mon, 18 Oct 2021 04:22:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZeBW1i+Bf3/5YgtLSLUCW0TOzJI7qpx8oqrpux/2wtmBESvJysJV8WQCYKZEvjn4zMCDy
X-Received: by 2002:a67:c388:: with SMTP id s8mr26308802vsj.23.1634556161449;
        Mon, 18 Oct 2021 04:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634556161; cv=none;
        d=google.com; s=arc-20160816;
        b=qdOKof5ZJHD3SssNF5w+6fdWGfEUlir0RUQNEATXpYxlYojmD1XgicgaKrQIgBErkz
         P3jQlshpWJfZNVWOhDag8d9QCMxEhohUbN5fvPNpO4Pm4+LHmwLoQTnavWxhNQih1P7n
         Sv0zl1SaKVWzjWLJeI9qtgufMLqErKVOC738eYD9+B+g/Wi2TE/gS9XOiijRM3lXIuLm
         zn2++HG0hHePtFvssyjs6c/hTC7Fyw0KesfaXExnufJqpPPheR9+WDgKYvuAaIxCXboL
         5pvAaNOOx/EUIiHb7LbunW0ZKjuDl6krj52L2mcGg1AygvKRAcK8u8yDNAqsfSVRQBwa
         7UHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=HjjkNgUBPAvebyXMymkU/YoB8MOUmEtSjfbAC+nnLnM=;
        b=ADz55XFaMYNZAqGdEEQh8R3R60BC8kwNe6cIXpQ6QvLUWG9EnF67zh1l05GkwYFNy9
         3WAzYqeQPT7grvVrh7J5ZUYZptrUMlMmDoTjdHpn5OJWirnRKrOmdsHEhVwkeH8q/oo1
         knRZVrJFk17hriogdCmdxR26CsD3S/wk873gjLplWv9vF5+mz6GBklVAeUQQcOI60oz9
         VmYqfFMwHs7Ri9ggpibJ/50ReA/rYOT18hYfXRrD4cdCUFC1SP+96KNz5HB/I9GPjA08
         l69TkUrsKyqOOC90Kylti/lPiEOs3iwtDTe1rsEPxPmo/wCBAnh4WFVRxbEkh0dy78V3
         +tvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=R3Bwd3ev;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r5si6911459uan.66.2021.10.18.04.22.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Oct 2021 04:22:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=R3Bwd3ev;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mcQj2-0000HR-PD
	for alex.bennee@linaro.org; Mon, 18 Oct 2021 07:22:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mcQi7-0000H5-Kc; Mon, 18 Oct 2021 07:21:43 -0400
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1mcQi2-0007uI-0Z; Mon, 18 Oct 2021 07:21:41 -0400
Received: by mail-lf1-x12e.google.com with SMTP id n8so66624976lfk.6;
 Mon, 18 Oct 2021 04:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HjjkNgUBPAvebyXMymkU/YoB8MOUmEtSjfbAC+nnLnM=;
 b=R3Bwd3evjuLrG5Wk4UyngBnYWn5FQuOiH5/GR3rTd+gTD8nBHXL1g/CU/97o7hhH82
 nhMB2F3NHBmQCs9qfp/ymoDGYxu9Df7pfOrRZQy5NmUP9zxEULm/MgoC8ZsWM01sovru
 7O+oexFz/cHWYtl/4GGiW1VV1slNUy6CC/7Qc49DZ0/Y7ZmPmQe83EzI56tDkrSLFx1B
 EWW7OVUsjWyvXN33EFFoynieYXJmvNhfOMMIfPZNm6M5l3FpOJpPaJel/1PTmfx2kd8+
 9ES01xG6xK0fAsLjzixFCbZhvTI6IVz56T8XIKSAR/kXfWoEuWdUO3g0baoV7aqBqh29
 sDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HjjkNgUBPAvebyXMymkU/YoB8MOUmEtSjfbAC+nnLnM=;
 b=HzRLnOYmaXUxWsyPloWWHDelBlgk9BsOBc72E2nFfhvbWOpxioBMV2K47aze26y2hq
 Y6N9VXCunxVVobuttUoUFJA0ISEGXrJ8+VzBKfl3FrukPk3Fd59lyKaiJeJt76JGccMU
 CIua4oyf6bmll4MYyNW4wTpGKMlEjQjZgcTTgNW6KYHbD+LJ6yAD8Nuyd5NhdJhUUWaf
 w1/KycmHc5Kx+WnnxamF+/O74JXz8dzIlA5WjjGSOGjN6TZufGN/1UZYwXGbIqBFgmkH
 RU3IPZVjGQl58d4VwgTEIxQatlXhOZmdc+6JaFjVUzWQ3dr1ANUNeSbZ8hjOp3FUfTrr
 gQQw==
X-Gm-Message-State: AOAM530Wy6D5+le4U6nq2Y4E3hUstStGOpaG4Q+JE80dJbKfFx5pRv2k
 bp39ipgC4ixwF31jvOOZk78=
X-Received: by 2002:a05:6512:3191:: with SMTP id
 i17mr28074113lfe.485.1634556093446; 
 Mon, 18 Oct 2021 04:21:33 -0700 (PDT)
Received: from fralle-msi (31-208-27-151.cust.bredband2.com. [31.208.27.151])
 by smtp.gmail.com with ESMTPSA id
 bq8sm384428lfb.32.2021.10.18.04.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 04:21:33 -0700 (PDT)
Date: Mon, 18 Oct 2021 13:21:31 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Tong Ho <tong.ho@xilinx.com>
Subject: Re: [PATCH 1/3] hw/nvram: Fix Memory Leak in Xilinx eFuse QOM
Message-ID: <20211018112130.GC23846@fralle-msi>
References: <20211015203532.2463705-1-tong.ho@xilinx.com>
 <20211015203532.2463705-2-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015203532.2463705-2-tong.ho@xilinx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x12e.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jPQTQEuNqyZ+

On [2021 Oct 15] Fri 13:35:30, Tong Ho wrote:
> Signed-off-by: Tong Ho <tong.ho@xilinx.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/nvram/xlnx-efuse.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
> index ee1caab54c..a0fd77b586 100644
> --- a/hw/nvram/xlnx-efuse.c
> +++ b/hw/nvram/xlnx-efuse.c
> @@ -144,10 +144,11 @@ static bool efuse_ro_bits_find(XlnxEFuse *s, uint32_t k)
>  bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
>  {
>      if (efuse_ro_bits_find(s, bit)) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
>          qemu_log_mask(LOG_GUEST_ERROR, "%s: WARN: "
>                        "Ignored setting of readonly efuse bit<%u,%u>!\n",
> -                      object_get_canonical_path(OBJECT(s)),
> -                      (bit / 32), (bit % 32));
> +                      path, (bit / 32), (bit % 32));
>          return false;
>      }
>  
> @@ -202,9 +203,11 @@ static void efuse_realize(DeviceState *dev, Error **errp)
>      efuse_ro_bits_sort(s);
>  
>      if ((s->efuse_size % 32) != 0) {
> +        g_autofree char *path = object_get_canonical_path(OBJECT(s));
> +
>          error_setg(errp,
>                     "%s.efuse-size: %u: property value not multiple of 32.",
> -                   object_get_canonical_path(OBJECT(dev)), s->efuse_size);
> +                   path, s->efuse_size);
>          return;
>      }
>  
> -- 
> 2.25.1
> 
> 
