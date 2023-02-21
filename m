Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3009892ejb;
        Mon, 20 Feb 2023 23:24:49 -0800 (PST)
X-Google-Smtp-Source: AK7set9atCicHpP4GH8gfAn0Qks/MYMeVAUnnk3GPzqithU6oR5Nsv3f/Tqg3ZN0KAAI+1eR8UVk
X-Received: by 2002:a05:622a:4105:b0:3b6:33c6:c5ac with SMTP id cc5-20020a05622a410500b003b633c6c5acmr15955141qtb.4.1676964289720;
        Mon, 20 Feb 2023 23:24:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676964289; cv=none;
        d=google.com; s=arc-20160816;
        b=0es4eW6dDcEG/ptbU+hnVGR1rF9/59TANpaJeC5ynpJfG27Zie06VF43MdX8X6WL4i
         GKeJB5K8fHYPsAHjojNEL2tZADRgevMONkNq3Ww+VxvQ1zmfJ17GgG7NtwRlpaTNQuzg
         UVsE1kmCS3zwzMoOBa4vgj0IOU7QSHIDQqTO0DYXI1HyVzQE+uMWX/Ggas7tjPPaZZ5S
         Ob3uCiI5gc1Yygm/X/VC0k8MYuut4ZyRTpWLW6zWCkRY1CvD2NrPnGyxId9sckjwIObe
         0McjIUyWwmRr9T+Lzm3/Fxb/PI+rqLRQMkV+XWEXLHnaHrpxdG1b4pXFtQsSXlG74HM7
         ttIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=Vhzq7b3u6FivoNZ05LRxEpNTz7af4gTcX2/7rcv6GEs=;
        b=k38ocD0YxUF6K9zmSgwxLMCN0wYTznnlYMBU3RoxmDVg9thU8S+2HdnuiE1Ihxxf4M
         o/Kw5uUPqEqH9D3XL3AfvkRodQNq66myqFPZmL2atfCmnwVFpu9LPCNQ2ie2aAVr/SyE
         RqkPEE+701CD0+AV2OvxqSXpSK7ep8GJvf/PjQVgkjNR6ymFsb702n9mbm3CLc4bW3l3
         ldkr9DDOYMXczS/fH2fMEFyz7BzOEvXCkbKxOfHvtJeRec4lkB59hgNZY/5V5tL6xSvR
         MYR0xSeurPuuyvgWbONM1PzaJSkk3tBZFIZg88KxeAdgR4si0B9b1r2YRaxqCX9PQEXq
         87EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HTDag4Ol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o18-20020ac87c52000000b003b68b6de538si11262647qtv.164.2023.02.20.23.24.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 23:24:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HTDag4Ol;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUN0p-0002PE-FA; Tue, 21 Feb 2023 02:24:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUN0n-0002Om-Q6
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:24:29 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUN0m-0004Xn-Ab
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 02:24:29 -0500
Received: by mail-wr1-x42b.google.com with SMTP id l25so2911962wrb.3
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 23:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Vhzq7b3u6FivoNZ05LRxEpNTz7af4gTcX2/7rcv6GEs=;
 b=HTDag4Olq+rhEPwue5z01gQqjvcQe2s8aSYvbUGGPmh1bX3PUlThZ4urUVwC/O7Yg+
 QPH9eOGRpJIN/R41Mc8KtawTOhR4U9xgN/dWwRNEkYd3RByUVF/knjUNndRdlwBpZL+M
 kfd5UGVK9BSSqeWI7uqSf46+35ilHb8t+Fk6nk8Mg+SUup4QnCvDRw/oEHZgaodXWmkG
 cUcsHtzpGr29xQJound7AQIK+yemB07p5pKCmG84X0F3O0wZRaUIkC6Yy/dOdiTvBaZA
 jM6lyqTt0mKNYsipCPJFtYu5IDUJj0MPP7Sxel2Xqv69p1fA+I1HAiffJHXy4D91QRLR
 NDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vhzq7b3u6FivoNZ05LRxEpNTz7af4gTcX2/7rcv6GEs=;
 b=MZRKBi+i/GQWQBdW8GfBewvN5Wma2jxZjxFN5LHv/eKImRRDwwoLwMHtoVHCratyvw
 8meud0dLMwTS2T++Wjwxb5ICLsYMmw5XIgii92JbraEIlWEpKTQXwwdx0AvYqAHvnEwu
 VrSE02s1xFr/Wo0Pte9s3p6hVYl6iO4xuWMyCXo2xDZDO1EzPxpCK0BNTO3z/8ghFWVg
 3ahY3fWcnP3Euz2Zcasn+WfG+8QT/K1SOW2GzQmRA5Xd5LCdpdO/kzjC+/AvsehoPY1f
 3PK8KpdRBzGNgcBQ9u9rGzQMquEPvTajmRPxtz1WhxD+JjPScJBc8fsuFWDQMNAIVG0J
 uF9g==
X-Gm-Message-State: AO0yUKXj9cYtaZe8azcpNNg1DTLi2p7SO0N+uQ7IyvzWZAFEmUwSIzMk
 nKwbu7VmFcsS2gjeXXQyibH+ew==
X-Received: by 2002:a5d:65c1:0:b0:2c5:a15d:8c34 with SMTP id
 e1-20020a5d65c1000000b002c5a15d8c34mr2439417wrw.25.1676964266697; 
 Mon, 20 Feb 2023 23:24:26 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 fm18-20020a05600c0c1200b003dc1d668866sm4088869wmb.10.2023.02.20.23.24.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 23:24:25 -0800 (PST)
Message-ID: <ae6d1223-fd72-66e1-74a9-e4e8205e2783@linaro.org>
Date: Tue, 21 Feb 2023 08:24:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v2 13/14] target/arm: Export arm_v7m_get_sp_ptr
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
 <20230221021951.453601-14-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221021951.453601-14-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: xU9aLlcvDy5F

On 21/2/23 03:19, Richard Henderson wrote:
> From: David Reiss <dreiss@meta.com>
> 
> Allow the function to be used outside of m_helper.c.
> Move to be outside of ifndef CONFIG_USER_ONLY block.
> Rename from get_v7m_sp_ptr.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Split out of a larger patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/internals.h | 10 +++++
>   target/arm/m_helper.c  | 84 +++++++++++++++++++++---------------------
>   2 files changed, 51 insertions(+), 43 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

