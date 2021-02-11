Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp2306387lfc;
        Thu, 11 Feb 2021 06:22:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx1qciv8+LWo4RwLdThG+ieUgrEXnGGXc9Pywa03JETrQfv8Zr11teEH4mVhWSwxs61Uzkw
X-Received: by 2002:a25:1984:: with SMTP id 126mr11162429ybz.341.1613053359189;
        Thu, 11 Feb 2021 06:22:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613053359; cv=none;
        d=google.com; s=arc-20160816;
        b=jmkiP0usWs0L5GqVXzSqZHEVJCudFi6qeZmsSCkcWedPOPncoYsfMpeK8fX6Ilm5+B
         04IjWBVvsYFxQVASZQvw3M8YEAHpskMgalFfHdMGZfdeMWIZY5yivy0eWlizDgEP9cwS
         u1V9Xpd+Q2UsJtUE3gOfjU0IU7Ej2YX9Fbn0SSj3YkMDB2AVsDUg8z90JLjBtWYOvth8
         I/Er7CBVpYUlkjsw8qwDK8hTIhtn/UpQ0MHq0aTIuH3wUxng0zTskCxaXVFmw1hVHlFQ
         86Ezsz8rvNXcPvNPD3QElJKVjlF9lf26dLpiCQLwJa8k+Lu7Y0UUf3yJCyL42XhuJIV0
         771w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=8Z+P2uGRNTTkpW4Qu+7hKhfNB2mbjWXAeHY/eUfSzw8=;
        b=mqdgPKYLq+awDQw2x4+wZrtIIiSY27muMGK+TeLX+kbyMXa1qhXBYYLVd57gMq9LpQ
         gTYWw4F738L2ANl0xJrq5OTxSvqqTKafbLk2vHaB0WUJlCxy7Cp6wSoiDwKuoV0FFBVg
         3PMs/pC4AozVzVhyRM8RwclLS71sl+mWpDvX5VE4GiXuw3KywB2bXeKD/KtfOJB17kV8
         gycP2+m0NNIAn95kweLi5XAD09vDifwTzKnqqRxBWU1a5+Y9jXzvCe3qOnuakiJsZgrX
         7Qnavj8ZJAWe3gMKt8xaIJlh0iLp3rN1+WZJqQIKd4zgM2J04SKjR+OOUw8MkT68ARcF
         ZbgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=H3hW9vgo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j139si4943078ybj.305.2021.02.11.06.22.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Feb 2021 06:22:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=H3hW9vgo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lACre-0007Q8-HB
	for alex.bennee@linaro.org; Thu, 11 Feb 2021 09:22:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lAClU-0006vS-Do
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 09:16:16 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40493)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1lAClS-0007Ps-4K
 for qemu-arm@nongnu.org; Thu, 11 Feb 2021 09:16:16 -0500
Received: by mail-wr1-x436.google.com with SMTP id v14so4321324wro.7
 for <qemu-arm@nongnu.org>; Thu, 11 Feb 2021 06:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8Z+P2uGRNTTkpW4Qu+7hKhfNB2mbjWXAeHY/eUfSzw8=;
 b=H3hW9vgo9y42hN4hjoZMuYNjeCYtFdG9gM70mSDG3igGIZR86Dq5Yh8nPN9KW68isw
 Qnom5SxSHJ6ZZJy5vBlu42NWel7mu/649IU3Ssh1RBkHjMrEQNRB8csEB4ch5jX4L6Jm
 JGCibRmYeJkCkzDquV8zBT80scXVD7vKifWXFlRkC1N9WnUPCJDnaduu9ojje0jwdZ/3
 CP30RKLLABDOpImwkssM6+VYLclH0Nd2cgNRkKFDCYn6sQ2QkUWjfDS4TCtgxhwL/okM
 ynjoO8rUeBZUJpyJSg0LD9z/Cv9H1YAUK7fdTJP0/GxZk1SbLkvbgHQMIyNcdXm/yF0B
 7dmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8Z+P2uGRNTTkpW4Qu+7hKhfNB2mbjWXAeHY/eUfSzw8=;
 b=Hg7Z5DiyMPKS0MhXCkLhCEfd4Yy0I2fzXRV8T193ej+3QJV5hInLevX0Q3Y785FX+9
 +gqot90zkli5U6IiG1VyryITcTD9foT5Y5A5CtUI+vSdKpGnyY+ahPe+z9rHi+Xp0gQv
 rY/QatlySkYb4inXc0Cdr//QtUaMRJ71/ChQdGzadcqelXVm2KaZZ2I9C0M4jSWlK4hU
 hAl+9bs5QEjL1w6JQ4Lkim0hABOPlqrUkAmXZ5LunpVFjEHFdpf0/xo64RcrcyM26FWF
 wPpW+TJ9IwJ/qe2fViACL7fwk8GlzerEFcgDZkQWUpyFQfyTChdm2Jcep+Sw4QMXTW/K
 OwIA==
X-Gm-Message-State: AOAM530nvuhPFFIHJ+g43DnIVKR+GT4KNXoJ3bE7Sb+oEnmXw3t2r+w/
 JjN/hlLQx8SRg31G+2jrV5jy/w==
X-Received: by 2002:a05:6000:1ca:: with SMTP id
 t10mr5985392wrx.45.1613052971604; 
 Thu, 11 Feb 2021 06:16:11 -0800 (PST)
Received: from vanye (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net.
 [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id w8sm5097192wrm.21.2021.02.11.06.16.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 06:16:11 -0800 (PST)
Date: Thu, 11 Feb 2021 14:16:09 +0000
From: Leif Lindholm <leif@nuviainc.com>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: Re: [PATCH 2/2] sbsa-ref: add 'max' to list of allowed cpus
Message-ID: <20210211141609.GZ1664@vanye>
References: <20210211122022.1811362-1-marcin.juszkiewicz@linaro.org>
 <20210211123638.1820482-1-marcin.juszkiewicz@linaro.org>
 <20210211123638.1820482-2-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210211123638.1820482-2-marcin.juszkiewicz@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?utf-8?B?UmFkb3PFgmF3?= Biernacki <rad@semihalf.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2ry3buF2NsfA

On Thu, Feb 11, 2021 at 13:36:38 +0100, Marcin Juszkiewicz wrote:
> Let add 'max' cpu while work goes on adding newer CPU types than
> Cortex-A72. This allows us to check SVE etc support.
> 
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Acked-by: Leif Lindholm <leif@nuviainc.com>

> ---
>  hw/arm/sbsa-ref.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
> index 276243d122..88dfb2284c 100644
> --- hw/arm/sbsa-ref.c
> +++ hw/arm/sbsa-ref.c
> @@ -147,6 +147,7 @@ static const int sbsa_ref_irqmap[] = {
>  static const char * const valid_cpus[] = {
>      ARM_CPU_TYPE_NAME("cortex-a57"),
>      ARM_CPU_TYPE_NAME("cortex-a72"),
> +    ARM_CPU_TYPE_NAME("max"),
>  };
>  
>  static bool cpu_type_valid(const char *cpu)
> -- 
> 2.29.2
> 
