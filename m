Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2012575ejb;
        Sat, 3 Jun 2023 16:35:46 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ69h9HaIBWQZb4U1tLEox887V8sobUMkUgR8JoBNIi7oj7DkS3kSpVMmJBDhjL5WYFvThc6
X-Received: by 2002:a05:622a:346:b0:3f3:9509:c9e5 with SMTP id r6-20020a05622a034600b003f39509c9e5mr2967130qtw.22.1685835345844;
        Sat, 03 Jun 2023 16:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685835345; cv=none;
        d=google.com; s=arc-20160816;
        b=jbZ31NAuKC6HjVpJEa+tWya3tPzIeUzDCvRCQsU5sIz4xTEehCJvAX/b1kz8YzX8/9
         tgudL45DLz3vp7fF/yyoA7vz65iV+HZH2h/qhvbLoFHqrphdQgdI/S9hw+hLHW3KfZby
         vChVB/NY+9a/1hJA0rt+sA50JXaLRQz/0WxgPRvzXS+FwFZXmWrCPNGXkQ+ccT9CJw8J
         H/wqE2vpWcWRPXYtCEe528DZWkoIFZGuaSWm0DRXBSCELBN5+6iF063TB5xSLXxAPKIj
         EFGlyCebKnxjfRspn4joNoH2Un868E9gdv2ZvPnMIA6+wqyh0ToZ3Vg1XlqyhFk+gN81
         aQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=G5YYAThVQnWNgL/97RYmH7/U3pDBhvSHlATExlmn2to=;
        b=CGgzibIr7rbXt2oZ2lAG8U8gTiWrj8qPcCrGvQXu59BHaufI4rjfHeJPivF3SZvlNd
         10zNyCRIouzf3TzdARF9MDvAd70MLGbcfSUBxzpDLi1FC6eIgOZ6FhvzHagezi3JN6vh
         jgMKB84cyp398suONo5gj+LagLpDH0ZLVK66fSS8Brf7Zt0eLBnRSaa8IQ5My8k24jr0
         xDJ0Hucfm+fBuzlJSvIPB67QxguzTuJ6ImGfKd3ikiwgu4ecm0LBfL1cxMljONNBUeip
         YVKj9qo5bsqr5izh8GWrrC3QisXFn4bZuQ91/Kaaf6udmJNacQTA8awjl2FWLMxalO++
         ae8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R19mS4Ac;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5-20020a05622a134500b003f38a88e82dsi2878475qtk.295.2023.06.03.16.35.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 03 Jun 2023 16:35:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=R19mS4Ac;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5amC-0004hX-Qb; Sat, 03 Jun 2023 19:35:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5amB-0004hD-Fr
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:35:15 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5am9-0003Fb-Kr
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 19:35:15 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-1b04949e5baso30423275ad.0
 for <qemu-arm@nongnu.org>; Sat, 03 Jun 2023 16:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685835312; x=1688427312;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G5YYAThVQnWNgL/97RYmH7/U3pDBhvSHlATExlmn2to=;
 b=R19mS4AcAtZHAQUrslY+sp1ZgecBD2Oqm7mNQLyxJL3sTGNYTnUKLYMOc5QYai5Frs
 0sOsKVj526pCyko+AoIYjKZIb4OrX9F2XiBbtridtpv/Twou2Eloh3fNKLENEa0JsnFY
 o6dC+gbx5jrDWnQBBt5OXgpPmtRkcer0Hpg/rdpj1s1k7ytoR+FwM2Qv6nPktAC5KLG2
 ZWXhfom1b+Bd3xvQqowPoXRZOQ7X57hmHvQ19CMuyTmlwWCR27TdifPNmWhNAnwFS4KF
 O4eEdmO4yzm8zG8J1XbI5mxTuhKUav1AIxX0G0jL0zgjYeDm6SidkdifX3mWQ8u0SaEp
 ju1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685835312; x=1688427312;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G5YYAThVQnWNgL/97RYmH7/U3pDBhvSHlATExlmn2to=;
 b=bno6N0lbNdw3uwRVyIDvC26O4dcIvuk1e3N9w+5LWoUC1c95AZtLeVAUpHyzD6NmNV
 yUoCkhlMsKwHSnWPz12YL0mTXR+xnwf2s3y0qCPazmRzeSGT82OzJAcbQ0VzW1dojjbK
 pOdiIvJB+jax29luzKFawm0eIOL9vfx26FIdpUWZLXZs7x03aMo/TNNVAcO7cDMveL49
 oK03hb9oxC1lF9XTnX8Mj3mGK/+q2bhphlyO4pgswIBW3lLj47pKcfzzS0VEYDZ/oG7E
 QydzlBFzkkIuxS4HOn33mPXpi/N7DELnkk8whoAy9w7WzJbJoaHWlKKBJfO4ZGZpLNiw
 rt4w==
X-Gm-Message-State: AC+VfDx1+QCIhrEYBbDTScsaz9g6qsJKl/See+aYpGGYkpmRxHfxsWgU
 tcFvW1sHqIuvHrI6AXj0F0n0ig==
X-Received: by 2002:a17:902:cec9:b0:1ac:84dd:6d1f with SMTP id
 d9-20020a170902cec900b001ac84dd6d1fmr4906579plg.1.1685835312157; 
 Sat, 03 Jun 2023 16:35:12 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:9a37:84b6:b3f0:f301?
 ([2602:ae:1598:4c01:9a37:84b6:b3f0:f301])
 by smtp.gmail.com with ESMTPSA id
 s10-20020a170903200a00b001acad024c8asm3722599pla.40.2023.06.03.16.35.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 03 Jun 2023 16:35:11 -0700 (PDT)
Message-ID: <8a2f965e-435a-bfac-5599-b0efab83bc36@linaro.org>
Date: Sat, 3 Jun 2023 16:35:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 15/20] target/arm: Convert atomic memory ops to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-16-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-16-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: SuaeX7iOwsbe

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the insns in the atomic memory operations group to
> decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  15 ++++
>   target/arm/tcg/translate-a64.c | 148 ++++++++++++---------------------
>   2 files changed, 67 insertions(+), 96 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
