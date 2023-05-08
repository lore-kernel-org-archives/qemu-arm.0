Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp2083841ejq;
        Mon, 8 May 2023 07:28:39 -0700 (PDT)
X-Received: by 2002:a2e:914a:0:b0:2a8:ffdd:26fa with SMTP id q10-20020a2e914a000000b002a8ffdd26famr2761025ljg.52.1683556118961;
        Mon, 08 May 2023 07:28:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683556118; cv=none;
        d=google.com; s=arc-20160816;
        b=viJq56MP/Ku2MWP/lHQrGepgXKWPZ2JeN61jHLl4pmJLckqTIzTNjahb6z4bKo5X0E
         TTCLXuaWTjlvNIqgAgjub9AjTCQCkEgHaTw70CP8GsusL9Pq3OmAaiP5wYUiMFdSlBlp
         zoXmmR2WiiB4nhbKQoH+G5DpQRhyiqr+GWU+TDood5NoiKz6+c+sLTi6bYHFpAda/uyU
         kGsJVG7OxoGasSiNEshcsyTCwvxOq1WSl8J/KyjSyPuA5E2MyYgE1aXYLlmm0hCAUA5h
         ObhnCBbzc6C6aMSqjTpFT/KPukMNEybDbxhvwnyX9drbviklxfR8grg1TScOcDyOnoAY
         X3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=3KLosyR4nJ1ZTNy2BQ3QB60pm7K3bxYOuITixcV0Juc=;
        b=pzqgPwHqle5U//IjTxkQSFX8fIcwZjjyw7bWOgDTlGJugy0dK9tXrq69Wcc8vhdk53
         fzD/PfAE6Xt03OCcGeicX8E9gD3YSPd5AWPMI1LhP/A/F4wvwf+IHdIhlE9/4s3ASsqe
         0y2QFCPWTcCQceID4kZviOBjUhdiCf7s9pq5U5ec5DtCvv6dSqQ1/sAYpQ20O7ZcoKX7
         a/7siCcyWWVCZUsVulUw33vs3drUci6ii0J5h7WL5CeZr9bCzTmVH8l/XSUJl7PS4vsp
         Cr4mE0/1NBLBZ7P59+VikSxKup6vAXEQPianhXyjIZ50Nm31aNJ6ik1BdswhSDmcxpbq
         DYlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=IT2xJeU4;
       spf=pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=frasse.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <frasse.iglesias@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k15-20020a05651c10af00b002a8d01c3016sor1241729ljn.9.2023.05.08.07.28.38
        (Google Transport Security);
        Mon, 08 May 2023 07:28:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20221208 header.b=IT2xJeU4;
       spf=pass (google.com: domain of frasse.iglesias@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=frasse.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683556118; x=1686148118;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3KLosyR4nJ1ZTNy2BQ3QB60pm7K3bxYOuITixcV0Juc=;
        b=IT2xJeU4GURYGEbglEWjVq9f+oiBjUOOhEmM8qRmOjw53g7OTsvEo0Or7zUPEI4GOm
         9gJe1WwgDT2jwIv97ASYpzskTUbnx5JeDckJ9GD1xsTduZna4RIDysliWm09i7CdzP2k
         8atZGFLkGfya1Beh1KVLjUv2ohjFN1kWzBE6rt+NngiNdOPZkKBbBWM19WLV7mu2heJk
         11Ehysruw9Czoaw3nHgUvFg2p2huu5/KYsvHL4L8ha7a3KuoIabUI62yDAyC8L432pdi
         0lZ5px4l7f9iJYl5r5JpfImtVt4B0Epm4TistV5uz+DyhG/vMmk1qLxx7mwh5ymR7Nlj
         pkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683556118; x=1686148118;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3KLosyR4nJ1ZTNy2BQ3QB60pm7K3bxYOuITixcV0Juc=;
        b=hVmNovwuAs7QOhYxO9570PNMIbh6nw7LFiJT0/IyINKq2H3VpgKlTpv44aWxdyG2fo
         qQD2GRezv6VoQo+jVvkwef89H/mrA77/lckctXMErMgvfjoCFpyNrp1IHHui1zTQmKgr
         sIRfa7+tm89pGxyJcHUhlN/BuOKqHQ3m8KD5STmMTIMTtllRX0G/vHmdNsQW6t/0Q5Q8
         fa60p2iQy35bi0sqUPSeDvq85pCfpCdsX+gmtQklAOd+e714QQuNuTZhvXib8rZnl21C
         G2rOUhquOEtQz1G9oYHos8Jerddk1nC2l98pFGutrdVuwBTPtq1eiHsO8kzVsxxKv7o7
         n11A==
X-Gm-Message-State: AC+VfDwMoDJdGWafkDpvLlh3M8oznZr7z6huLD8EwSz4L/GguVt0w32V
	cPVrOpiHIIWQvfcBm0yUpo3lW20mvCQ=
X-Google-Smtp-Source: ACHHUZ57ijT+8ynN+QKhWSSdgixx6w11JQi3J5UK9WmjD89rcpZAwPSlMvoFqpp0Vf3T1aS4Ek4ApA==
X-Received: by 2002:a2e:9d17:0:b0:2ac:7958:ed34 with SMTP id t23-20020a2e9d17000000b002ac7958ed34mr2601341lji.45.1683556118273;
        Mon, 08 May 2023 07:28:38 -0700 (PDT)
Return-Path: <frasse.iglesias@gmail.com>
Received: from fralle-msi (217-76-87-243.cust.bredband2.com. [217.76.87.243])
        by smtp.gmail.com with ESMTPSA id y12-20020a2e978c000000b002ad95392147sm297901lji.118.2023.05.08.07.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 07:28:37 -0700 (PDT)
Date: Mon, 8 May 2023 16:28:36 +0200
From: Francisco Iglesias <frasse.iglesias@gmail.com>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
	Steven Lee <steven_lee@aspeedtech.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 01/12] aspeed/hace: Initialize g_autofree pointer
Message-ID: <20230508142835.GB6984@fralle-msi>
References: <20230508075859.3326566-1-clg@kaod.org>
 <20230508075859.3326566-2-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230508075859.3326566-2-clg@kaod.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TUID: 8UGo5Aj5kliX

On [2023 May 08] Mon 09:58:48, Cédric Le Goater wrote:
> As mentioned in docs/devel/style.rst "Automatic memory deallocation":
> 
> * Variables declared with g_auto* MUST always be initialized,
>   otherwise the cleanup function will use uninitialized stack memory
> 
> This avoids QEMU to coredump when running the "hash test" command
> under Zephyr.
> 
> Cc: Steven Lee <steven_lee@aspeedtech.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Fixes: c5475b3f9a ("hw: Model ASPEED's Hash and Crypto Engine")
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20230421131547.2177449-1-clg@kaod.org>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>

Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>

> ---
>  hw/misc/aspeed_hace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/misc/aspeed_hace.c b/hw/misc/aspeed_hace.c
> index 12a761f1f5..b07506ec04 100644
> --- a/hw/misc/aspeed_hace.c
> +++ b/hw/misc/aspeed_hace.c
> @@ -189,7 +189,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>                                bool acc_mode)
>  {
>      struct iovec iov[ASPEED_HACE_MAX_SG];
> -    g_autofree uint8_t *digest_buf;
> +    g_autofree uint8_t *digest_buf = NULL;
>      size_t digest_len = 0;
>      int niov = 0;
>      int i;
> -- 
> 2.40.0
> 
> 
