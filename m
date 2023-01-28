Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp74673ejb;
        Sat, 28 Jan 2023 15:47:32 -0800 (PST)
X-Google-Smtp-Source: AK7set/BxlGPjXGLW8BQrwxSxyX/jFngYitvofZ6qlq8lkRElG38l7345O9V0kyIGCXbrl95BUmX
X-Received: by 2002:a05:6214:194a:b0:537:7061:89d3 with SMTP id q10-20020a056214194a00b00537706189d3mr35524280qvk.4.1674949652439;
        Sat, 28 Jan 2023 15:47:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674949652; cv=none;
        d=google.com; s=arc-20160816;
        b=MEX2pIZ+Ebr5oziueC5Oyri9hvt7H34ZDc5ojkBK/KRUlmsSPHpo6X1CHntOt/5iC+
         Z3425KkFp8ZPlCdjbwmlgaBCMx694ik0Zl4sy3n2VmBj4HA+AjIShjutgKh5YLc+GXu3
         H4/QzO2EkUHdMkEMwWL+A99JNoXGa3pyRJdSVUlig+fn+VszH0TNaNF1OxozoLZJoJQ7
         Ld3GMQdIkT3cNvjroeprbvvqxQZeW3yLNylEn76F4kfaSZVzsIk6/+IfLGC+FM4pGD6O
         qf5DMIBbh3x1rwPhlQtM6Kadi7EapcIt52r4JHdkbMT14dI/manLMv0mhxIogYScoDts
         KuIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6+Wrk14JSwyKsbd9CXQY19oj5ZRI6MlGhTpLd4fjDzw=;
        b=jD67lnSZiBfXyIrTQ//68oQUeTSnngtHg+qo5vzK9UYxWCcb9SE8OINVtl+ZtxIKXu
         yNkCCspwHkxKB1SFJDoqM1sxJN36NYZmYXA+ngtqHvvhjQrEGhOAQlyawmZjXltlu5sH
         AABv7XVYA+iYcM04uACFKlkuj0sgzlUVHGrAzimDkSU9vOyxvvlkqHJNB9DvVHL4fAzu
         9WRTqYtIZnLbvRT/TTrp5vVs6EK2PzRwIk8kSH40Yh8No4zJoOva3J56xC6iDSOFXMoe
         cPYfBetJPgmrMsNtxs1llSVCmsYihMLqev6wsgAEVxBRXyq2wPyXC7teExm4jPa36E3m
         jyGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hAuYyt3E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l1-20020ad44521000000b00535748be2e4si4825979qvu.317.2023.01.28.15.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Jan 2023 15:47:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hAuYyt3E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pLuuc-0007Co-5x; Sat, 28 Jan 2023 18:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuua-0007C7-2E
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 18:47:08 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pLuuY-0006V8-BQ
 for qemu-arm@nongnu.org; Sat, 28 Jan 2023 18:47:07 -0500
Received: by mail-pl1-x62c.google.com with SMTP id v23so8341491plo.1
 for <qemu-arm@nongnu.org>; Sat, 28 Jan 2023 15:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6+Wrk14JSwyKsbd9CXQY19oj5ZRI6MlGhTpLd4fjDzw=;
 b=hAuYyt3ErPo3GeKmw9DFziWJXnruFTBrcbowEw866ILtVNqXN6fUA7ZevqrpvNUvrU
 at6Bwuj3xGQYr2dULUmqWOAZCDmQzWo00d7YLW/em5rfAtsKLcF8QwzSJOWchxRRjKa7
 sE7leryF0g+M4piyH+pymTNfhc7WM1lzb411E44Ltcv3ZcD71SXbG3jHiC2xNxa2++Wf
 jTFHnDwakGLuDJ4iwMFCkpPOTEkBRQ8nqSoQnXXqwBHnhWi5mn7Atw/vcRrj/KBDjK8S
 00cwQ+Pbao5tldki9ABm7x2XBSMZ5MewKxkUsuXbNuQbnm4enRcgn7IacSQBnTZQoHBW
 5i6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6+Wrk14JSwyKsbd9CXQY19oj5ZRI6MlGhTpLd4fjDzw=;
 b=jRKcPxUzPFfv81r5M1P0a11JaEXP8cb37uhSPlpaCLJ4j0p9mZFcvtFRAxC+3BvPnt
 BEjGr/8CMltc1GiRspG8Y8GSq+Vef9XR6zY1RxostnTL3D4qcUqUePW83Q+EFC9CrY2J
 VIQMkIQYU0hxtYt+wCt3haPGBMzAY/nxwCRRrAbpy+22YGDikMED755HcWh/WkNVXJZk
 8G1USjzo+XAyP8z6YpuC7Yg/t1ydRVcI9/tAeKW9Bm7yXqKz34yQTLTs/xl4qI98WbbG
 ww//SBqQqcvJH3FiEqFPn0AJJzVqcsMwLWmD+vKrlXfmXKcRq7PxgL8DfTIQaTUtpHQn
 939g==
X-Gm-Message-State: AO0yUKXnB8t5zM/RL1OIR34j/gT9HIz3cHqIT5wz1yStCbvPy2KEUl/c
 JHypQ2oTKXhPV0SBzTYf3QfxJw==
X-Received: by 2002:a17:90b:1b03:b0:22b:f214:a919 with SMTP id
 nu3-20020a17090b1b0300b0022bf214a919mr18856794pjb.49.1674949624549; 
 Sat, 28 Jan 2023 15:47:04 -0800 (PST)
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com.
 [173.197.98.118]) by smtp.gmail.com with ESMTPSA id
 lj7-20020a17090b344700b0022bb87344a8sm7221691pjb.55.2023.01.28.15.47.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Jan 2023 15:47:03 -0800 (PST)
Message-ID: <660cb057-2ec7-e4a9-30ca-7ad71fe966e4@linaro.org>
Date: Sat, 28 Jan 2023 13:47:00 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 16/23] target/arm: Mark up sysregs for HFGITR bits 0..11
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
 <20230127175507.2895013-17-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127175507.2895013-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 5v0TydLMl7Nn

On 1/27/23 07:55, Peter Maydell wrote:
> Mark up the sysreg definitions for the system instructions
> trapped by HFGITR bits 0..11. These bits cover various
> cache maintenance operations.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h | 14 ++++++++++++++
>   target/arm/helper.c | 28 ++++++++++++++++++++++++++++
>   2 files changed, 42 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
