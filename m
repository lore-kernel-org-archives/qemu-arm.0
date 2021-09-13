Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3683942lfb;
        Mon, 13 Sep 2021 06:42:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyN5Uugm+5/azmYEJg4Ml+WwWENDpnhBW+IbF7KzVrtZG56YF/UfshrebO8um0/FHG66hBr
X-Received: by 2002:a67:d919:: with SMTP id t25mr1743298vsj.7.1631540550150;
        Mon, 13 Sep 2021 06:42:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631540550; cv=none;
        d=google.com; s=arc-20160816;
        b=xTUGKyH/xMF2Tjt9nSxqSSVMGoi/vqagFb7Wrc0/+fpdHCLTEAfwq2L4yO3SpNBA/A
         Jfwdeh+6GU3mkM1Njp10higLIH7gAD83dIj5O+V1zX+9V/QEgta+FOddBPKzzFbiLcE+
         NyQvgf1RKRF6Vmefp0Tk271aGN89Ze7AF4TUOytQnOZxSyQbDXWK5peCEyhdfYrd9+QM
         cZnLORy6SGYNzz3kZ+ulhHztE0aQxW9PRxOoc27OUs6FTw/+xIazINI7yVCyznpeb4k2
         gcd8kV0qtAJzoKhh1B2tmIBekeR932S0faTQuCS7UgOEt3HvcwLiXfqVzphgy/zuxNOx
         ItmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gBU+V941GNQAf18dJ7mCkDzN2l0mM9U0/5to2nvVa+Y=;
        b=JUgDw3/Vdud4PDEkTP1pCeXSDtuADAYwp5TSYqNLQR0I/2BqdjhY8D94dATxWHmYg9
         v+OC1H22CmHSWyxqV8R6N76kEgWk7JnM0xH6kw9PF9XhH6QGIMqsM+0PCPsAdtmKJ3ZG
         6+6CYDwjRuqHGGS8oYmCE5UGdIm4cEF9YQqQf/v+1z8xibwiySwHjWuRjhzr57PrfGKg
         xms3aT3ZiVh8hPBPa8G/Z9GLBNlnULGhnVkQbXda7UBfox3V4PYr6sxdA+zFtbLTuN4p
         +FUSev13ilYji38yIf4XqM+1NvRApifCxaswWLmNtWGIHdoWsjuzVop1o1bPz6rAxPX3
         mSbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uIxf6QmT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si1715703uam.59.2021.09.13.06.42.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 06:42:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uIxf6QmT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPmE9-0000lE-GP
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 09:42:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPm8D-0008Li-4N
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:36:22 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:38700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPm8B-00082u-BY
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 09:36:20 -0400
Received: by mail-pg1-x529.google.com with SMTP id w8so9463329pgf.5
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 06:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gBU+V941GNQAf18dJ7mCkDzN2l0mM9U0/5to2nvVa+Y=;
 b=uIxf6QmTG9tW1AntKd0VPJh/Rw3KBlq4hYy8mdkIFbUc2cffptdMv8EblcN2pvfaf8
 H/g1f4rIkU2hsSXT5QYsAN/8IFgxAmlU3NUs8Ozt+LA6PrDt0lq95Z8/D3fA6bf2gELm
 ev4CwtSBzPkC2oLRJMPUSsB7EmZUX/B5CXTHgtdJW70zgZh55IcoLv4GVFmSz7Mi3Rmi
 UjZ9yyqOyuTZ2L+JpNqR86Mu88QIpfnuSZyuNvnttGMFy1I/Q1R6P62mFwaj94xWKV/j
 52+XPiSLbTxT2pmkkxRtVeHVVFbicOi+FSd8Eo+ljUpmz4eIKGLyqKgzSbbhCzq7io+7
 bl8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gBU+V941GNQAf18dJ7mCkDzN2l0mM9U0/5to2nvVa+Y=;
 b=QVy3/x0nnLQayw/OVDzCknQSAI6dYYhnE9TzPh5vlfEI8Y7dRfQH/MDtbpvEIACdVJ
 br/6R/0zX3jXB6qB4cT08LlNsrVB7SeGdQCbj46cKYZ0Z+lET2ERzlxT+DfAyczNNEpp
 7rkZ+So9ZL20NqjWtTw3E9t9L3EuMiZrge6/FwWZGz+gzjlfdCF8Ub1/pewK4Rgrh5g4
 1BLdhKSqj+rf0dWrSFPdukIEoxx2QnT/xz88xvkilLm5S8yTPwzhD0kPhR6w0epjShL9
 2HApiw7/iQyt21pYvIiJZvU8WDAyvX0sQzAfzUSYGiNyjRHyEBGyxM9R27+A2fB6+Dbg
 WHyA==
X-Gm-Message-State: AOAM532ElAlfAdOVBN2TyXyRMXrA2GAu5CE4EM+94qks3x2jHceUZNdY
 OgtICMCiUnhTwNyxXblZ01lMBg==
X-Received: by 2002:aa7:9542:0:b0:434:5a64:bc8 with SMTP id
 w2-20020aa79542000000b004345a640bc8mr11189919pfq.30.1631540177587; 
 Mon, 13 Sep 2021 06:36:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id b7sm8283268pgs.64.2021.09.13.06.36.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 06:36:17 -0700 (PDT)
Subject: Re: [PATCH v2 01/12] target/arm: Avoid goto_tb if we're trying to
 exit to the main loop
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210913095440.13462-1-peter.maydell@linaro.org>
 <20210913095440.13462-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7ce0600e-d21b-d178-123f-b55929b27142@linaro.org>
Date: Mon, 13 Sep 2021 06:36:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210913095440.13462-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ogJgonOT95o3

On 9/13/21 2:54 AM, Peter Maydell wrote:
> Currently gen_jmp_tb() assumes that if it is called then the jump it
> is handling is the only reason that we might be trying to end the TB,
> so it will use goto_tb if it can.  This is usually the case: mostly
> "we did something that means we must end the TB" happens on a
> non-branch instruction.  However, there are cases where we decide
> early in handling an instruction that we need to end the TB and
> return to the main loop, and then the insn is a complex one that
> involves gen_jmp_tb().  For instance, for M-profile FP instructions,
> in gen_preserve_fp_state() which is called from vfp_access_check() we
> want to force an exit to the main loop if lazy state preservation is
> active and we are in icount mode.
> 
> Make gen_jmp_tb() look at the current value of is_jmp, and only use
> goto_tb if the previous is_jmp was DISAS_NEXT or DISAS_TOO_MANY.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate.c | 34 +++++++++++++++++++++++++++++++++-
>   1 file changed, 33 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
