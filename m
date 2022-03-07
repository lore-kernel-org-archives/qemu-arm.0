Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1407266lfo;
        Mon, 7 Mar 2022 03:18:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwBnxepqIbjA5uLAeZrjtFr/6/yMLyfi7gwuMbN7tNjSKMhIWvailrDqyvpayZL9KI6eMk7
X-Received: by 2002:a81:410c:0:b0:2d0:c3ba:c799 with SMTP id o12-20020a81410c000000b002d0c3bac799mr8058499ywa.193.1646651930036;
        Mon, 07 Mar 2022 03:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646651930; cv=none;
        d=google.com; s=arc-20160816;
        b=bXsacIvAKEbgcBdCvZ/OKIIhXjdUC1FRnouDhUbceQT4NpDGZoA7C/VNTuRjE0XjpP
         reknWpoKPMeyl00yF/owMA6osodo31RebtzzeINGvk47UBlswxNwfiG5pFw8Oz98V5nq
         mXlmbEZqgFtdutln7N/aERRM68rHdoWZePp8rNCYNUFN+4bPLXcPz9EYe6p6kZ1+3m0x
         Q2mclTX8dUsN2IBQWSJJB1XqvdEmTR8/X1p6scffvBL6B7MSrBWCpF0XeFwIiVPJN4xN
         btu9DPCh3J/XfTS/NfOXs8HhWKXrSctkmPYE6MiElQfFhqDe25myJ6eGEkCRJGSKCdUC
         mcYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=dNpfhumn0Dc6jxdcMXYsNb6R54SUHbRQ9h2w39lLTBw=;
        b=HsNCEecM+dq1Kh5ACi7798ri+FIM3rjQFuOqELlERAhA12wPFqjAxlfw7DOr/g1/ls
         MWBkz2EgvSD+5eJfPy1d9LCaMGKtwzdQ0+fIcEHirOVb1xGnMXev276i15A5EYJGNhyr
         nFekt7kXFrBz2BD96egRHl8AEDEeXWtmu4pU6D7nb55k2ENsuROEHkcV3HkN99/Wvpda
         uibNTu0AkRRLbsaRvMRioM30VMAWycnkAKSWAR9DDcC0pNSeOrjEg7pY8ywsmCyVy/of
         XTDHP5gNNzHxYtDBfWOqaoQV+WjqeWpBF/04hSHa7cdyhQv/LqrbqUWR5VE7GqYfYyzU
         Ur9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CzDxUvKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m187-20020a2526c4000000b00628e50438cdsi5818279ybm.494.2022.03.07.03.18.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Mar 2022 03:18:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=CzDxUvKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:51946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nRBO2-00014A-Ge
	for alex.bennee@linaro.org; Mon, 07 Mar 2022 06:18:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAYf-0002el-Ln; Mon, 07 Mar 2022 05:25:42 -0500
Received: from [2a00:1450:4864:20::32f] (port=33240
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nRAYe-0006TM-9x; Mon, 07 Mar 2022 05:25:41 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 n33-20020a05600c3ba100b003832caf7f3aso6367326wms.0; 
 Mon, 07 Mar 2022 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dNpfhumn0Dc6jxdcMXYsNb6R54SUHbRQ9h2w39lLTBw=;
 b=CzDxUvKUbch/gCT3BTyVziT7fjfF7nJkGGRF0hD5C+c5it+6ePgTJUIGFiW8GpnOXA
 4zGxzpgf8KnN2ujCIBzeUZwWfLALr5LJJcY9cc8o/tc7aihZLcdlXYww/fcaCaH2cbvL
 nsvUShnmccFbLI3P8ismUI6AElPvpZ9K0Vf9v0XG9AEefRYV3wBf0VChICndqDfuymSi
 ium6WMOCdS92/QTb+FcGydLtxjFT6hgEHDt0mJ+9JfwKGFXP1Vgy4gp10ArOr4FovIvf
 ZgmwRiZmsQ434xRC799NBN9RI1e/knWWAJG0rtXrFJAgSy+dy9hYrsiwVzTh+rISLfa3
 jNHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dNpfhumn0Dc6jxdcMXYsNb6R54SUHbRQ9h2w39lLTBw=;
 b=2DVc9eNLLnHQt+Hu43Q0kVY9DNscMCZ9iYBQ1Q8QGMOUiBiOM/sWNbWyAJdSqB1ukH
 2Y9kDxI2lxl+t4+nQJGsZNTQWp8JyH84I/SjPmvAdPcpVtu7wM6D1w5TGzSvpFylYS1P
 XyCKkj0grlZQrWW/Qvvvp3gH8Bq2r3PrU+xBiLLhswNM89pdWTjQw2R7HfVObll7w94A
 9r6GUXVlztoQAXhkKSJO/InY8yVh+r6KANH86iAf95bM3/ITOAFj/lZVPPo2EVjS5lul
 8DIzl7ir16dxByz4gz5DL5C9AMdfhyY+NaFdkh7+1/ghNVEEes45RHBKnH+BRIg/qeUs
 h2AA==
X-Gm-Message-State: AOAM531kfo32/3UxepEZLkx2J44hLCSjTj4EJq2pCJnuKP1ohuBoIat5
 ndgbsy93pMBsRxsymT4xqSo=
X-Received: by 2002:a7b:c381:0:b0:37b:e01f:c1c0 with SMTP id
 s1-20020a7bc381000000b0037be01fc1c0mr17647373wmj.98.1646648738666; 
 Mon, 07 Mar 2022 02:25:38 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c4e9400b003898e252cd4sm7883810wmq.12.2022.03.07.02.25.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Mar 2022 02:25:38 -0800 (PST)
Message-ID: <ab0657d6-c841-d72d-8073-b58dabe36a65@gmail.com>
Date: Mon, 7 Mar 2022 11:25:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 5/6] aspeed/smc: Let the SSI core layer define the bus name
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220307071856.1410731-1-clg@kaod.org>
 <20220307071856.1410731-6-clg@kaod.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220307071856.1410731-6-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yrRvtXwjZRV8

On 7/3/22 08:18, Cédric Le Goater wrote:
> If no id is provided, qdev automatically assigns a unique ename with

"an unique name"?

> the following pattern "<type>.<index>".

Maybe complete with smth like:

"which avoid bus name collision when using multiple buses."

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/ssi/aspeed_smc.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
