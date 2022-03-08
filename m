Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp2547946lfo;
        Tue, 8 Mar 2022 10:08:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYXPhDswM5kxHsSNueFuYu7eyOaSDMzGjdaNJWfOiEBRlJUCKqQcBXVIMKsxYbaSH+k0v7
X-Received: by 2002:a25:2453:0:b0:629:1914:9526 with SMTP id k80-20020a252453000000b0062919149526mr12412801ybk.504.1646762906348;
        Tue, 08 Mar 2022 10:08:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1646762906; cv=none;
        d=google.com; s=arc-20160816;
        b=YSORYo1OXqP+8cu0NggoBVTfDDvgpM+ZS347O777SJyI8rBrCEWD28Ifl7K3wrTpfI
         A7GkiaBZ+wrIP1HKR/vqmc7N/+PsU3j97+bTWDXV75+U5F3yXEZ3J1cQXKQMuMeu0ttz
         tnTk6jCqnN27kY+tOGCKkWwZS/3dn4nMJT1RoqCtsqJO0A0Xl/GhUmtEPEqYJv1QqOr4
         /3eZimSkhlAj0Z2bB+5b6imPOfgeRFadck0fxFgbWM80qNR7z/2bmiRJwQJ+b6U1lfH4
         G13pL21UKRiqejmpZblESUF7MIXnXp9mYMqU6NAZ3I7fi29KOVz/fOdecyqs8/mSOFIp
         tmRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=s178kYbz/1pYxP7yDcXtb3upTerNKtjydWGDzNN6GNc=;
        b=qwGoW7e66VPXdPU9amhr5gWpdcRFBgycPqOwv+s2xfmTaLBdNvtyHKd7qPMN5qFsHB
         0SDuQ09TuS+NxLwJSQ+tZqtHGSUmAPeLJufaBa6w3tAXCM34So6ajFznQE9NAZJXjvRL
         EkFqispK+soMamWaOB7VQ5WA5kYiOuh7jlXQNH2WcRIpePtzighoPJAvSRUTlrmUTmP2
         +2Jfs+H9ViFa+m+muMoyB/rNwcQuNAIoIqLeVTe2XATvpnMAqnBZqQcsFASUNbgZGKLC
         /gLStFhCxNyjo8nbu56cLJXNAq3XJShRcDtZSawALFwbrnwhXU23ibJF+pDlAKmtU5X5
         lBQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KR41liDH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e20-20020a813714000000b002d692364214si11617378ywa.536.2022.03.08.10.08.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Mar 2022 10:08:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KR41liDH;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nReG1-0007cl-Qn
	for alex.bennee@linaro.org; Tue, 08 Mar 2022 13:08:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRdXJ-000771-Je
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:22:13 -0500
Received: from [2607:f8b0:4864:20::535] (port=33676
 helo=mail-pg1-x535.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRdX0-000170-30
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 12:21:55 -0500
Received: by mail-pg1-x535.google.com with SMTP id 6so12501027pgg.0
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=s178kYbz/1pYxP7yDcXtb3upTerNKtjydWGDzNN6GNc=;
 b=KR41liDHUnRevMXk7SQF7tlxftfhnN4WqLyWMRAWEQOp8WE6Xk74BuCTnUE0hPyvZb
 7LjapdI5oX3c/snDTrSmHpxu2j/NrcoAlRZtDkBVa1PWIPVJXS9rEL4DhkDD+xlXAdfG
 YgZ+Acis5xKyML58WKLiD+Ph9Mk8yUht4tp7sh6xJ4tVODac5xI0pEaJqUTti3lv5Rt7
 F95Xyad0rheiitRXDZSiTrzYbVd+D8ES624uFxvTTcD7D8fMnqCQc6C6xzAnv/GaUXfG
 HQ6UHfM7mkJQyFL1zhHBUHLYBL/i4wKQc7DeLWWpLsGl6H17REcegdP+eFFSdqa7FiXu
 5oKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s178kYbz/1pYxP7yDcXtb3upTerNKtjydWGDzNN6GNc=;
 b=0fuF7omgc6YeI6lefKL/hSAvsVnK9kcjYZB+hswshtiRqwW1JNzL01QR2aOEz4poSQ
 TOR4VMBLdclvqDfSt+Z44omc3CW3wOFd+VCmM2AtVDB0RaoxUwZ+NSih8hnx0fK+5sLA
 PyK7f/EjAwBiurrVBB7axU3kPVItVhWMwnWvrW4I6+WoZu6g/d7Ys25znx5OtS5GZvKL
 zRF74Mz1xgObKDrTHJpWshSxn18nAmjESU1ff/mp0REJUiGuhBA3Pj52TiP8h0EERxWj
 U25pfhGPPPdxTHlZiMSXAPLSfj8mpdYFzcWti2CszFXgPJAclVdAES1azk9xklJkzZnB
 4vRA==
X-Gm-Message-State: AOAM533gEBjaEiFpm/Q7W9v5w+n4giTFBPJIt+u5WFZBjexEp2JCQFBT
 1qiI8QnnIeA2RH9wkr3Y0CRgRQ==
X-Received: by 2002:a63:e716:0:b0:380:85d1:656c with SMTP id
 b22-20020a63e716000000b0038085d1656cmr5052333pgi.321.1646760112659; 
 Tue, 08 Mar 2022 09:21:52 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 k21-20020aa788d5000000b004f71bff2893sm5375707pff.67.2022.03.08.09.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 09:21:52 -0800 (PST)
Message-ID: <1293fd43-c952-8c23-a903-485a15ec6366@linaro.org>
Date: Tue, 8 Mar 2022 07:21:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] hw/misc/npcm7xx_clk: Don't leak string in
 npcm7xx_clk_sel_init()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220308170302.2582820-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220308170302.2582820-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::535
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Tyrone Ting <kfting@nuvoton.com>,
 Havard Skinnemoen <hskinnemoen@google.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NgLciAf1bHbc

On 3/8/22 07:03, Peter Maydell wrote:
> In npcm7xx_clk_sel_init() we allocate a string with g_strdup_printf().
> Use g_autofree so we free it rather than leaking it.
> 
> (Detected with the clang leak sanitizer.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/misc/npcm7xx_clk.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
