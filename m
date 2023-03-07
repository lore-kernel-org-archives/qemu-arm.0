Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5275723ejc;
        Mon, 6 Mar 2023 16:24:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/zuXxm+zl8rX2u59DUkqRbiqWhVG5XLKcOwPAaYj3WgR7v+fOorcOHl4a2n6YI5LrB8xpG
X-Received: by 2002:ac8:5845:0:b0:3b8:6cb0:8d28 with SMTP id h5-20020ac85845000000b003b86cb08d28mr22960450qth.6.1678148678331;
        Mon, 06 Mar 2023 16:24:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678148678; cv=none;
        d=google.com; s=arc-20160816;
        b=e9DkDtcx5dtHP8xtE0A+Gw7AbjgIJYqefyTsVKlQhuj1ia6xs7USRnRtYN0ztq/ow2
         qz/cvnlxdiW4r9wkTf/spuxX8+d+3BkTjRf4pPDuPib9CBU/SgWUiem1L5RnASjIi08O
         cgNXMqCN1szKh3/VWgFQoQZNLlVNYFz0Ba6fkj7ZtFWi4wCospfMbTwwtACJhXZtbCqb
         aIV4cljmaQD2MmAkQjqdyZu7EPI7o11NdI+FmYcQjGbq2khtZ6Bg8K9DWku+ql0C0xvU
         gP1ugKayPrRSc4BuB1eQcVADOCDy0hXBtrvY51/qZqYQ37C/HWKl+jTicWgFYsfne/IJ
         546A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=uj9VRgb25/XnfVMsMVGES71JmKh3SXUgz9ZkU9WPyOs=;
        b=nnPr4crflI3dHCjMXpFeePztI3h+TLcGwIo+PbezSYVEYOseNmv6CckV8gRLGPfa6U
         Dfk/q7opv0HzRYV1SagCWWjq9rWT/ZSPIpKcfHNM75oXe33u+PwHFXBlxPsal7pQFsV+
         c+HST4scXRDapXgaY4AM0PgDhryVkjSw0zV5wEtoWP6zCcoT2sc/GdeF3UOcecqlISay
         uSIA9eZlPYCjRqnUXGoXfCW3Mg6eXl+CuUFRXlfM2ijW5WBACUdyqHiB7iin5FfdKfq2
         FoxpcUFa1BsNzmxXXu2UvE+GGc+r/Xv2LIQTc8G2yjOvOKDKhHmGzzIVaBCPx9PNq7Pv
         BlTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tv0d1q6Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m6-20020ac85b06000000b003a7eb5c37a7si8717129qtw.314.2023.03.06.16.24.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 16:24:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tv0d1q6Z;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZL87-0003A4-98; Mon, 06 Mar 2023 19:24:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL86-00039K-FE
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:24:34 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZL84-0006Ob-Ri
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 19:24:34 -0500
Received: by mail-wm1-x333.google.com with SMTP id az36so6804855wmb.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 16:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678148671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uj9VRgb25/XnfVMsMVGES71JmKh3SXUgz9ZkU9WPyOs=;
 b=tv0d1q6ZLMtV5BBVIqqpGBoq1Wc/7MRmSXvz/Dhv/b6TgZihzYEVvX+4GeFcwdbQrj
 wFwammZydetUx4jNWLKqWondoYTCUpUgH84fe+VKwRYhqTfSTidksl2UXaK7lWwTCElx
 d1J24+Q8SX3n0fR50we1OITWiyVrBbDTVH1EawGWwAI31oXHihxVfob85BF+j88OG2j7
 FplFOl3+2CpLODwFY3FTxKJNPIIX+loA1y4EfyzEbolghfcjWyad5DPN6eWDGXHh1O5y
 42VxcbBXOiPpBKTabceMyxF7TayAgvHsRN8qsAqUGEZL3FLMyfEdFXNlQccp5+7dkYoc
 Y0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678148671;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uj9VRgb25/XnfVMsMVGES71JmKh3SXUgz9ZkU9WPyOs=;
 b=xs+awMzhbzW/CVNHwobZwU6yIjM1Ewa63QL3rQDSAAmQ3TrzJv1u4yQHWs8o8FMQFr
 Q8w8uMqnO4p2d3VWjzNfQdWeQqzybR6IMYwAD2xkjCfZZyMVyXDwkh00H32s0no7ff0c
 QjJBKzDaTt685Y7XbA3JscB6x3iYvzG2pxlguPXoAdtkuM1d1zXJmrzX3z1IYCMtx5K/
 cHw9mYuyH2Y+W0AGB+MxIMXXYGgDprL/hqx1AwdL0FC8oaWwSbnjtNzC8cgJDKrCSr/O
 hx3g6CtUCx9OaAji9t07Wje05qh7VCZClZLwDjqymEhdCdGUcyaDVXimEcwjTwxgZlO3
 QIjQ==
X-Gm-Message-State: AO0yUKWBIAeKhix2aNv1E0tBbP5hbdHqShFxBd1IjjudsloUdsZ1ZIFp
 LvKSYJfRvudQSyKvP8A3Ydi5qg==
X-Received: by 2002:a05:600c:4e8f:b0:3eb:2da4:f32d with SMTP id
 f15-20020a05600c4e8f00b003eb2da4f32dmr11338351wmq.26.1678148671350; 
 Mon, 06 Mar 2023 16:24:31 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 t10-20020a05600c198a00b003e11f280b8bsm16144764wmq.44.2023.03.06.16.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:24:31 -0800 (PST)
Message-ID: <18126f7c-a6c2-3ae0-697e-c214a1d73082@linaro.org>
Date: Tue, 7 Mar 2023 01:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 63/70] target/xtensa: Tidy translate_clamps
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-64-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-64-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VYZugS+qQxwe

On 27/2/23 06:42, Richard Henderson wrote:
> All writes to arg[0].out; use tcg_constant_i32.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/xtensa/translate.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


