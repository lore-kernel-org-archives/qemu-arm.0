Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp140474ejb;
        Wed, 31 May 2023 20:04:47 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ58PvnRGuu7g8siBdVywOBsE2zhk06gnk0w/WZVsZBmtG0k/1FX73UcEORTJk0Wh//37fW8
X-Received: by 2002:ac8:7f8e:0:b0:3f6:b713:f3cd with SMTP id z14-20020ac87f8e000000b003f6b713f3cdmr9050020qtj.0.1685588686857;
        Wed, 31 May 2023 20:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685588686; cv=none;
        d=google.com; s=arc-20160816;
        b=TE1oRLqadMpDNPphd4T7XGb6xLQQAlf1hASOJ9MvnNO7L2oU3z/bN85Rce6desAFyj
         ieaQ6b/1Dh5tvz39QtqtrrFqaeWR4vX4W8Tb8oRfgwi8L0smx9OAkmT/twXhq9Vb0RLW
         LJImF/5t3xfTHAKPIya939Z5stWWnrD5WmqSeso5BAtvb7rXC3y9b3AL2t2Ci5vDyjg9
         FJK2UmWLKqiLo7n3Ko0v0aoYjirPHbgnDjZM0MLlRk/jo4SCC6v2NbPNUr5Lsf0j9Dmq
         o5/N09sQSINKlCsYweBTQClBaxwQG9pk46bgMgRCHb0NepAdMkwvrwFt50Ey56nN/bbO
         v4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7szh9ZkK/SuBJMEe86phz7KAJaLuOJSwuSDGWVladXo=;
        b=F5nj0+qmx/zBlt4bGpnPL05Lxast4hTzIECrvCtYicvcnjS1drBeQLMMTbhsP/2Vf6
         FC2r3rdcfP33KuWezmzB1k8SM+orAJ7jPJ7Oh+Bn4A3QYXlii3i/ajr7C9u2peCEFGx/
         JLM4In1jrEi1MPvsKU3m78sqtN2Dk7NBH+L67aSdp5Y5qwRT6YFGG2yeIncStlAOfdO0
         oAZNfRew+vcupVJRl0o+Mtx6j1CLs4Sy7S1vvZWoDpT9HgLYU5X76NemGRU/xEYkokM/
         oW6k14DuvuzW3/A1anJ/OQgZ63BGEJ7USACPNqqreen50oFCubQqJ1+WRoYMrXK6zCJd
         UzUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i951p6Ag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z13-20020ac87f8d000000b003f541337f13si9271981qtj.689.2023.05.31.20.04.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 31 May 2023 20:04:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i951p6Ag;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4YcB-0006Wq-Pq; Wed, 31 May 2023 23:04:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4Yc9-0006Nl-Vj
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:04:37 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q4Yc7-0000Uy-Cg
 for qemu-arm@nongnu.org; Wed, 31 May 2023 23:04:36 -0400
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-64d3fbb8c1cso489885b3a.3
 for <qemu-arm@nongnu.org>; Wed, 31 May 2023 20:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685588674; x=1688180674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7szh9ZkK/SuBJMEe86phz7KAJaLuOJSwuSDGWVladXo=;
 b=i951p6AgMhxtHRF0nEamN7vKKL7UXSRFHQvmzL6mCmGdXowUOtSGRb8zneLkF6xns7
 4EDCCp0RFyzJu24BUlB278SVL7/vPBRp0vwsrm7ED+49i59Pt6QcK3G/MFRa6TY5BvhY
 Wn3sx2pzPy7yZH2JAeRWitIH+gQH0vEaKS2wUz5HTAHjzIcrpVML8D4S+7FrDQzem9G+
 XOc6h+eENlNNxvHbWQ3soVJdlUWXraOsR++Yp2MGSy4GOB4Nbacij/IgPEQ15OCi94rZ
 QptkZksRllUUM1hi506x13fGU2j4UGClrdTtyqhTx3AJqbb3ovS9fQMk1hAp4cAJZtqS
 q2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685588674; x=1688180674;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7szh9ZkK/SuBJMEe86phz7KAJaLuOJSwuSDGWVladXo=;
 b=PlkOLxHhsmPWhXdS4jY5TLwCilv8MN+Au9CA1bn+YL60QzXiAGw/murnAp96v9IawU
 0lpFxYwachPOmX3vnBdl1uBKF1pOWZFrbMT20k1ThnYsRjg5yHodYgKKWMyYouXsfK8e
 MYbSiffPBfKzrjNrzObTTIgzK3QKF261qjpP376rNgg8/VsQwurs+QR/KqR2tIsobqNU
 GwNNlDIeJ5Ox2T4YTvDbfjdpNPIqy0Emv9UhHWi5e/zjNiKq+TsZZQw5t0W8lYJ/whdM
 m6OWjs4sCcWciJWYIwc2kRY34CMqgg1NQYjIalP5hgfokT1iQuDBWd3S1igqn80ZaFBt
 zy/w==
X-Gm-Message-State: AC+VfDwRXNszOjB9brn4EStFxKHDtKT65t+o2O+/pJL+ABKXdWk0bA27
 yJpqFpSJZMWQivZGXHyWjsH3jchi36HUG2BkkU0=
X-Received: by 2002:a05:6a00:23c8:b0:64c:c5f9:152a with SMTP id
 g8-20020a056a0023c800b0064cc5f9152amr9529035pfc.23.1685588673973; 
 Wed, 31 May 2023 20:04:33 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:3019:d9fa:8bb1:50d7?
 ([2602:ae:1598:4c01:3019:d9fa:8bb1:50d7])
 by smtp.gmail.com with ESMTPSA id
 s26-20020aa78d5a000000b0063b5776b073sm3971905pfe.117.2023.05.31.20.04.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 31 May 2023 20:04:33 -0700 (PDT)
Message-ID: <69c37e57-dcca-3d35-a538-7fdf674ff000@linaro.org>
Date: Wed, 31 May 2023 20:04:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/7] hw/usb/xlnx: Do not open-code sysbus_pass_irq()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>, Markus Armbruster
 <armbru@redhat.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230531223341.34827-1-philmd@linaro.org>
 <20230531223341.34827-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230531223341.34827-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.091,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: S8HeZQ8iiMLe

On 5/31/23 15:33, Philippe Mathieu-Daudé wrote:
> The SYSBUS_DEVICE_GPIO_IRQ definition should be internal to
> the SysBus API. Here we simply open-coded sysbus_pass_irq().
> Replace to use the proper API.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/usb/xlnx-usb-subsystem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
