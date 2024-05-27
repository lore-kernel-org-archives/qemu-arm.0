Received: by 2002:a17:906:d149:b0:a5d:17e5:aef9 with SMTP id br9csp3257915ejb;
        Mon, 27 May 2024 08:58:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMLXiFDgln4z04hEj+iCssN0U3Yq15+O2aB7bAV5K56UNS96TNaESLS9oQ6J3lAozprcEJdaB741PXcPiH7KZIosY6peYS
X-Google-Smtp-Source: AGHT+IEWbXeea09kd6pj8txXNuhLoXie1qBTp4Fgd4iOHazFU0jrRmHKRHmh1tLwmfGtLNbOJyGO
X-Received: by 2002:a05:6214:3d97:b0:6ab:8d18:6fa0 with SMTP id 6a1803df08f44-6abbbcc9340mr123469236d6.19.1716825527861;
        Mon, 27 May 2024 08:58:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716825527; cv=none;
        d=google.com; s=arc-20160816;
        b=zTHZrgRYnEd/NJ9kl3mSqUyDtN7T2UV3RAvR/8MDj7+5pe0fnrwQqxNU3iQpWDuqZd
         bZL1uM4Dq2zaBRQqrIVF/giK96WTyNjL1HtLq6jgMPLrlAVF460MORGBthsQOiTRZRB+
         k8d+bem3KPcO2joVURfCDmNmWz92HWNM+UmNyKK1meCFZMRdWCyOIigpI6f0UdnCJ0IT
         dzeOenis6acxuEWlqIEAAdVdGgliK0uSJXPYM4O5m3tGfg1U39CegRkueUy4Fl5vmZFk
         du6Pl5xWi2PhVCqABeK2JG6BIV11sVsCxK9E9dsXNkf0Ise+uuETHVLsdT7/yy8ggvQK
         NHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=3y+qiQqx+Yu806+NVMklywnrg25mrY4P+ljDt/5rfZ8=;
        fh=AAY88NR938nrPxhobpDe89mgK0XaegzoP55TYadGi5Y=;
        b=WL58TZiNGCdSqngsnSU7q6ti1T0NHDi1qQNmAk1kK+TUptX7fDo6ZQ4DQ0un88jnYE
         Y/0jo9VJcxarMZ5aCRAU02dShvNr+yDadAjw3loICJdKe4vr7dTfGwhTMG1PezK1baEp
         dHexeidx9lLc0BOGGFjblbReKEQRThK8LK3QR5mGd5NrHocnEpMMTD8PmF4XwLu8CDf5
         jdRY7KLTyZlJUWXsAMyOJnxjQyitUwPcZn0z8yZr9QTmsI9tS37rL1TvV3UCSjWLAFwj
         J+tS8f1Yt6DmQylt/Sgqm5A5sSxp1F2wnpNOmnp4al89a7fUWxj8F8cQKuRghPZ/E6Qq
         sPJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ETMNydH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ac0708b327si86719236d6.189.2024.05.27.08.58.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 May 2024 08:58:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ETMNydH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sBcjr-0005SQ-OP; Mon, 27 May 2024 11:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBcjq-0005Rm-JI
 for qemu-arm@nongnu.org; Mon, 27 May 2024 11:58:18 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sBcjo-0007T1-Np
 for qemu-arm@nongnu.org; Mon, 27 May 2024 11:58:18 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-420180b5838so59016805e9.2
 for <qemu-arm@nongnu.org>; Mon, 27 May 2024 08:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716825494; x=1717430294; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3y+qiQqx+Yu806+NVMklywnrg25mrY4P+ljDt/5rfZ8=;
 b=ETMNydH1BCLmuu/nHZ4wnU/6gFfgUakBRjHn807q0UELhvCWPotWZuoGr84A8V5cnh
 eH6YpmFjDGaB956DILvjuIlqeAUBTgtJgQHHLcBNDkVtFk5dkTogsDcpTW9rk+/cSuuu
 AIvKDOFoTb6W/+/GRYwTA194O38LFPH4Ef0PDHgPa5J2lRZPamf+cpflzK8yT58aX9jo
 W/i8ZS3wHE5TVKKoC3YISnoWAUP/opVKSr3ALYAnItyv7O2xkmOMjOppm3CJrExjuF6G
 /dD7rJ4fYVTlL86jWcir5lVyigRpPjk8A7DdxfaTSkmhMiPtjvp7grPqDhxPQbf2M+s3
 q+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716825494; x=1717430294;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3y+qiQqx+Yu806+NVMklywnrg25mrY4P+ljDt/5rfZ8=;
 b=VLH7UdpwtCjmIGiGp+Upz/weEAGX0Qo0IYp2UI3Qlo8e8esdp7zKAnKCcQxntctKEp
 PBzDIzqXu8W5kUfYlnF0KveKCIyTqOutFsZdWxU5LsqweBWEB54DoN23V7uKKSqdMcXA
 iWqBH7iWD3JqhxbjWUoeFEHFAS7I3sjK7yMSgzXoW0E2jym8XGypmkf0w7mPbj4eMtLY
 u88/5UAY4064wX0RBGDXrllurCO+bgobjt2DMmziQbQlT0GBQhcB84NOxYnOlfePahfe
 P9YJMMcjKt9dJQVNb+Wf3mvAmbx7MpY9M2faq7XlWBB6jmERpekYd9A7lFlmXk24Drhc
 Raiw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeJhW8y/gV93s9pHKR2e3HG2s+zNuZIV5LxcoSQyuV0tvnBqO++HNTm/MPNeN5KyFH5md9CfzZ+35KJ/dV+hSo6HPR
X-Gm-Message-State: AOJu0Yxm4RGoOoANVNG0zG/wMcwBxdXN/PGBRYZLdrxGxduAn0UbV5NW
 +Ridu7hDef6dH03k+VRPdeZmaPAhsJUFyz7IUGnLeBo326iexxtLTxDpzljFCyQ=
X-Received: by 2002:a05:600c:4589:b0:420:29dd:84e3 with SMTP id
 5b1f17b1804b1-42108a0d355mr94825445e9.26.1716825494386; 
 Mon, 27 May 2024 08:58:14 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42100fbb140sm146356945e9.44.2024.05.27.08.58.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 08:58:13 -0700 (PDT)
Message-ID: <b641018c-e906-452b-8072-1b46f141808b@linaro.org>
Date: Mon, 27 May 2024 17:58:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/16] aspeed/smc: Add AST2700 support
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Alistair Francis <alistair@alistair23.me>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, "open list:ASPEED BMCs"
 <qemu-arm@nongnu.org>, "open list:All patches CC here"
 <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com, yunlin.tang@aspeedtech.com
References: <20240527080231.1576609-1-jamin_lin@aspeedtech.com>
 <20240527080231.1576609-10-jamin_lin@aspeedtech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240527080231.1576609-10-jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: +LPdYyWYeY9R

Hi,

On 27/5/24 10:02, Jamin Lin wrote:
> AST2700 fmc/spi controller's address decoding unit is 64KB
> and only bits [31:16] are used for decoding. Introduce seg_to_reg
> and reg_to_seg handlers for ast2700 fmc/spi controller.
> In addition, adds ast2700 fmc, spi0, spi1, and spi2 class init handler.
> 
> Signed-off-by: Troy Lee <troy_lee@aspeedtech.com>
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> Reviewed-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/ssi/aspeed_smc.c | 222 +++++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 220 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/ssi/aspeed_smc.c b/hw/ssi/aspeed_smc.c
> index df0c63469c..b4006c8339 100644
> --- a/hw/ssi/aspeed_smc.c
> +++ b/hw/ssi/aspeed_smc.c
> @@ -185,7 +185,7 @@
>    *   0: 4 bytes
>    *   0x1FFFFFC: 32M bytes
>    *
> - * DMA length is from 1 byte to 32MB (AST2600, AST10x0)
> + * DMA length is from 1 byte to 32MB (AST2600, AST10x0 and AST2700)
>    *   0: 1 byte
>    *   0x1FFFFFF: 32M bytes
>    */
> @@ -670,7 +670,7 @@ static const MemoryRegionOps aspeed_smc_flash_ops = {
>       .endianness = DEVICE_LITTLE_ENDIAN,
>       .valid = {
>           .min_access_size = 1,
> -        .max_access_size = 4,
> +        .max_access_size = 8,

Is this a bugfix? If so, please use a separate patch. Otherwise
please mention why it is OK to widen access for AST2600 & AST10x0.

Thanks,

Phil.

>       },
>   };

