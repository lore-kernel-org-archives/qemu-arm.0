Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp199734ejm;
        Wed, 26 Apr 2023 23:39:22 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4cdEDFKn5cGeoIrBV2XBkY3qHh+g1CpfEZA+/wlW2jZ6m99hWsmUSK/tLP/hxoVdKMjIve
X-Received: by 2002:ad4:4ee9:0:b0:616:773d:e26f with SMTP id dv9-20020ad44ee9000000b00616773de26fmr347650qvb.49.1682577561938;
        Wed, 26 Apr 2023 23:39:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682577561; cv=none;
        d=google.com; s=arc-20160816;
        b=hsjv4ToB1vPii9Czettcxo6xH0F9UGgaTVlQDKKlBvX7fNyDX28qJABdgr62beNiz5
         rtU+T4ISSJyr61b6rXqrV/OUmzFY6RZ5BCJX1vTiyQXOjTbXYlP6NtFyUdqFBVL/gn4u
         jaS770STSgch7cKEA8kXiSlUxcnlj/LIxIOgn3qfidXtal+Wo4xbddyMI87COWs7VQf5
         1Ky1e8Cri7sr1CGS5xHBZGoq69wJyf5zBNCIjLg+e2LtAtLtwWHU+xRWQFAPu1nhgfiw
         OTLUNvsa39nGybMd1VltpPFC21vCPmKFodOgNe3A8XR/V7Q1rGOo9O+XBaDCH5LKIx9M
         Ftcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=R0Eg+Phx3jScS7HnUgDmf2NBR9psdWE4ikBaBcKUjmE=;
        b=k8Pd0Q6yOZ8EfwJ7gY+AyQUSsNpD2hNh7d9pARwTuZFdGQlFLMxZkYgJ3VCaM791c5
         csFN7HRkR61Gzk3n8ah0UAfBlmfndxJWxE+F+FtM7B4ewS2BKTvAHDdXNOy6j0l9xKtw
         YWL06GSINm+71m8P17WiRCmmjcvkxLxUyLo1tkOMM+wprLlJl3ayVfS8WMs8xd7vsElc
         B6oIzr/zVvo+Z8sceD3xIxt23AVZbUmt7N98JYrPoFuLiwcKjyVviWMvxNb/VQeN2AKk
         PH6MFJWfi1MX1xwiWjQdYdb+w8CMZ7CaPMzWnTSXEY5uSe6rbG+nly6H8Mih0VJYgeFa
         PUIQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=cqLDDtv0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22-20020ac85fd6000000b003a4f25fcd18si11585062qta.27.2023.04.26.23.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Apr 2023 23:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=cqLDDtv0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1prvHX-00042r-0z; Thu, 27 Apr 2023 02:39:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1prvHS-00041y-G2; Thu, 27 Apr 2023 02:39:05 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frasse.iglesias@gmail.com>)
 id 1prvHQ-0008Kq-Js; Thu, 27 Apr 2023 02:39:02 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4ec8eca56cfso8956664e87.0; 
 Wed, 26 Apr 2023 23:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682577537; x=1685169537;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R0Eg+Phx3jScS7HnUgDmf2NBR9psdWE4ikBaBcKUjmE=;
 b=cqLDDtv0425EYKetX1cuJvaijFFPeVbLRKm9TtFYhAnl3Etn83BsXPziJp7z0U5J4M
 jlueaeiZORfdm3fBMNaHLyuRG0CJe+lGtYhqk8xqC4JPG/m3V8jUB06tDwBNo+i/I1/Z
 +z7oLNy8ibbOkqZ3N4O2C8ukrUXUJlA8w+TtZat/8d1Yz8ezqjGti8rtkjckPmdQARk2
 EEbpL8/V59u5XW3Oewd5mptkPD4leRQnArzGv3HaRznr79dbzgLvTVS+j/HNzTzIWYHt
 6BFIgJbzlhw/th1iu8MEcK3ELk/RmpErI+KRY9o+4bOxH20+Apr+GnqXYeE1kZfzHMdr
 uIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682577537; x=1685169537;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R0Eg+Phx3jScS7HnUgDmf2NBR9psdWE4ikBaBcKUjmE=;
 b=WpNnlWxTF2hLk2L+mGyFi0L7Hkyzfm7L0YtfYLbVGUxWnYw5kojLwj5uf9h2RZAYLE
 pM0kKpWx8p9ONShAzMFzC+RCeywoRkmNVoQxGbEZFHpm5HwI40lVSUB+z+ozEVrZvm7h
 yV6wUNVdGDeURHLvuVFn5MNAVhJ8a9oVgGe09VYkOHIFgYjFCjBQ1J7Pnqyjx+d4Z4gq
 ZusFfrm6Q3MdXK1zC4KpP4I3s38cgqqxPdS7wlgRMXwgKmpIFZ8VmO+UIVSKyNfDkdf9
 HcZ8862zG46Y45bA0QAowde+3uu1ftqzNIR8ew54mg8ov+ldeCnR1tgyWy9wTS8+ty+m
 e1MA==
X-Gm-Message-State: AC+VfDzfJv2QyroFrLtxvjYyJEnpaJhAMUXoge3i9NXEaWK6P32uiChH
 HrCM+4pw+iDrCw1qxpezBwI=
X-Received: by 2002:ac2:5dd8:0:b0:4e9:813e:409c with SMTP id
 x24-20020ac25dd8000000b004e9813e409cmr230174lfq.28.1682577537352; 
 Wed, 26 Apr 2023 23:38:57 -0700 (PDT)
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
 by smtp.gmail.com with ESMTPSA id
 r26-20020ac24d1a000000b004efecbf5768sm1842889lfi.264.2023.04.26.23.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 23:38:56 -0700 (PDT)
Date: Thu, 27 Apr 2023 08:38:55 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: Tong Ho <tong.ho@amd.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, alistair@alistair23.me,
 edgar.iglesias@gmail.comi, peter.maydell@linaro.org
Subject: Re: [PATCH] hw/nvram: Avoid unnecessary Xilinx eFuse backstore write
Message-ID: <20230427063854.GA6030@fralle-msi>
References: <20230426211607.2054776-1-tong.ho@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426211607.2054776-1-tong.ho@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=frasse.iglesias@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -1020
X-Spam_score: -102.1
X-Spam_bar: ---------------------------------------------------
X-Spam_report: (-102.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_WELCOMELIST=-0.01,
 USER_IN_WHITELIST=-100 autolearn=ham autolearn_force=no
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
X-TUID: fiQxu9T630op

On [2023 Apr 26] Wed 14:16:07, Tong Ho wrote:
> Add a check in the bit-set operation to write the backstore
> only if the affected bit is 0 before.
> 
> With this in place, there will be no need for callers to
> do the checking in order to avoid unnecessary writes.
> 
> Signed-off-by: Tong Ho <tong.ho@amd.com>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/nvram/xlnx-efuse.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/nvram/xlnx-efuse.c b/hw/nvram/xlnx-efuse.c
> index fdfffaab99..655c40b8d1 100644
> --- a/hw/nvram/xlnx-efuse.c
> +++ b/hw/nvram/xlnx-efuse.c
> @@ -143,6 +143,8 @@ static bool efuse_ro_bits_find(XlnxEFuse *s, uint32_t k)
>  
>  bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
>  {
> +    uint32_t set, *row;
> +
>      if (efuse_ro_bits_find(s, bit)) {
>          g_autofree char *path = object_get_canonical_path(OBJECT(s));
>  
> @@ -152,8 +154,13 @@ bool xlnx_efuse_set_bit(XlnxEFuse *s, unsigned int bit)
>          return false;
>      }
>  
> -    s->fuse32[bit / 32] |= 1 << (bit % 32);
> -    efuse_bdrv_sync(s, bit);
> +    /* Avoid back-end write unless there is a real update */
> +    row = &s->fuse32[bit / 32];
> +    set = 1 << (bit % 32);
> +    if (!(set & *row)) {
> +        *row |= set;
> +        efuse_bdrv_sync(s, bit);
> +    }
>      return true;
>  }
>  
> -- 
> 2.25.1
> 
