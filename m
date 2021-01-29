Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp1149080lfo;
        Fri, 29 Jan 2021 06:01:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzgccmdV7JdmyGFC/gSJUKmpzWe//fumWdpZR9wW/euDPXaO5XvdAB3oKkH4Mt2FM/+XDdT
X-Received: by 2002:a25:af8c:: with SMTP id g12mr6427899ybh.33.1611928893634;
        Fri, 29 Jan 2021 06:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611928893; cv=none;
        d=google.com; s=arc-20160816;
        b=oLoTTK3Eso2cZixgH8JsMimhO1UAP4DNJ7PXcGp4L8ocpRUuG9UGAQIl4URXCJXQ9i
         DP6K1w3OhkuHishEaANRyDx1iObgU9HWZs/5UVA7Lr99RHRpVIm3l8iM7HuR8kNKqUW7
         wvk5naxrT6YdJk/HvnVTWD4fyAwmXHOcpCchReAxV0+qWwI14nDEr5Pg1JTNVcoY5sph
         8AEIinik6Ixiu5R6c7xZNRhQV2dxT5S6tR+zUR1OkCdA1/O5TeSHup/EKMqhtIwqDshK
         OpeYkWH3n7xVaryNRU/2YQUwMBM0Nf/xMRNEFE9o/5dIomEewe6HfaBFcm8RIgSfxKi6
         GamQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=FsYRMw7HnPkgsBv9hTLxfyNAV9cuANyRlDNn45uUqXA=;
        b=ut7E3l7a9Rdv9bfFXNBw99EMcVGGsvXC0PF4OSJE97cMFkH1vAYoeharA3M+GXmcwT
         4P1iVwvPd59/iQN9QMXvVVGFR5PJDUCIKNmsDIDa/0ftnPmEvouESiwS1+pmTnJfraw1
         Nqq0yXTC8KgD0QvF615K0GMMrBtB3IW98Iqa91fciTc693pf4YBacDF1Pd4FcjhFOZGS
         gveslo9b2O0xvc1+0eA6wNVK26UUx2QmCkEagcgaFHjmVGSqlJ0DbwpfbG2F1yyT8YgC
         xhHttVoU1jSUwTjLCaNs+Z9v5sDPpUvmXbC/hoLicgSZkH5MwXKvCq9ADFZr/bvzUgWw
         dVyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fHTJYtLy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h39si8810368ybj.129.2021.01.29.06.01.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Jan 2021 06:01:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fHTJYtLy;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:44648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l5UL7-0008LP-1M
	for alex.bennee@linaro.org; Fri, 29 Jan 2021 09:01:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5UKE-0008J0-Ky; Fri, 29 Jan 2021 09:00:39 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:45548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l5UK8-00074b-7P; Fri, 29 Jan 2021 09:00:38 -0500
Received: by mail-wr1-x433.google.com with SMTP id m13so8930311wro.12;
 Fri, 29 Jan 2021 06:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FsYRMw7HnPkgsBv9hTLxfyNAV9cuANyRlDNn45uUqXA=;
 b=fHTJYtLygz88onu++lPFn68/a7K4vMa8o9DJFPLl8x6ke2UcjiX9YspAF+mlxilmWN
 wEfyUuvicQ8ByGkK6eifKpmeV9iMuj67NoUqla5mBIv0I579J417t3FFKJXVuqp1PMyg
 o8nd0YJFDOuV/3x0YHvhrMj2TBi4+FfT53gaF/bVG1L14MXlaJCiE5JKjQrujz/1NGUI
 iPSLIuM99gKDs4nMdSR51J1edIz+zPDR2zkX9uBcviCWQjz23DOXgVIcRaeumlbvN0v2
 Fpkrf1a1C0jBraC4Tk25V+DKUHWWfBV/kIc9xLMjnRldCY57PGkWxXgL1pOHFgnNqTZv
 UZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FsYRMw7HnPkgsBv9hTLxfyNAV9cuANyRlDNn45uUqXA=;
 b=a9T+TPzcqERecwzHdfvj/BZq0gSQhDOlUSTytXK5svF4TzBkUxzHa2Ztkkk+kw9b9N
 ooHOyAMmU0hsNTqnp2uzpq0jhPQT7MfV5ySRPwc7F4UB0qvKjeD675X+dnMVm0tHkVzm
 +5zSj0YQMg6tDk8o/w7LzpjHJYS2KVLTFmJznNkKJwiiJwcjJXSAglAdmY+03VpsRi3j
 1XZT9trfGHS+AKtjvY6NETN69iJY08MfEPDfXLWg/uZWDw30sWbVwIa/UpICYRPL8U4S
 BWywuj4Gmv4t0iXR39shBvvffHuqhjjEi0/s9JSroVg2Qqh+n20x2PphZXiPapZEdj+L
 Cu4Q==
X-Gm-Message-State: AOAM532O5lv2QflbGizKPwXM5FRPphiZdfDJpq+QouvjgoSX3nzeEMDx
 ai7HtAPrvi0Bwg21u60oJpA=
X-Received: by 2002:a5d:4c84:: with SMTP id z4mr4525140wrs.289.1611928830596; 
 Fri, 29 Jan 2021 06:00:30 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id p17sm10251524wmg.46.2021.01.29.06.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Jan 2021 06:00:29 -0800 (PST)
Subject: Re: [PATCH v9 04/10] hw/ssi: imx_spi: Rework imx_spi_reset() to keep
 CONREG register value
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210129132323.30946-1-bmeng.cn@gmail.com>
 <20210129132323.30946-5-bmeng.cn@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <26c7af92-ae7f-a522-b27c-854575a5b078@amsat.org>
Date: Fri, 29 Jan 2021 15:00:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210129132323.30946-5-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nWn7uPVN30cj

On 1/29/21 2:23 PM, Bin Meng wrote:
> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> When the block is disabled, all registers are reset with the
> exception of the ECSPI_CONREG. It is initialized to zero
> when the instance is created.
> 
> Ref: i.MX 6DQ Applications Processor Reference Manual (IMX6DQRM),
>      chapter 21.7.3: Control Register (ECSPIx_CONREG)
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> [bmeng: add a 'common_reset' function that does most of reset operation]
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> 
> ---
> 
> Changes in v9:
> - Add a 'common_reset' function that does most of reset operation,
>   leaving ECSPI_CONREG clear in imx_spi_reset().
> 
> Changes in v7:
> - remove the RFC tag
> 
> Changes in v6:
> - new patch: [RFC] rework imx_spi_reset() to keep CONREG register value
> 
>  hw/ssi/imx_spi.c | 32 ++++++++++++++++++++++++--------
>  1 file changed, 24 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
