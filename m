Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1542631ejc;
        Mon, 31 Oct 2022 21:47:07 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7xY0WLjmeOrexfrCryv9e7lSnRp0Tbt4prFSLGYYrx9vKMltI3sxKIrXKS7BBnT4qzVvm4
X-Received: by 2002:a05:620a:cec:b0:6fa:a3d:dda5 with SMTP id c12-20020a05620a0cec00b006fa0a3ddda5mr12060693qkj.564.1667278027550;
        Mon, 31 Oct 2022 21:47:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667278027; cv=none;
        d=google.com; s=arc-20160816;
        b=TR44wj4jFH9NUH9dGfLLLTJqVt3xqNSBiJp4old2acovEEMjGpvasTCgk6165Gu/SR
         Ril94gQZHJfaIO5uzm9RrnAm5W8Kb6ux1nV4zkzWcL4ZQ82Qo6gbLC2mODmNNkxMyZhL
         NBSVAnebroICUyBE+Trcl1AdTBieqAV/LB7wt5EcOuM8oFOJTtsvdiftVtxbrXd9n4TL
         dQKejeHqYKGjbPD1Bf/Y6UQGMBfbZBfp0B9pw6ZTUdx911HZCZaP5spbbu1cXVvdPe4W
         utTWVYmYHK0O+M1Bzp7nW2QHLvrE1sGzJN+10nfGBisJE/NIGGdVWcQMPQ9N0oZ3Y2EV
         YBGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=F+mfPV3qHYsPWbb4jil5DssIm5iiXUo3d+plbLB2MmA=;
        b=BgAwBW+k/LwNX+IPZTZuwSOI8GyVc7SH6ksWOvJtlyyoFWm5BivD9M8bJk8nwNXUnd
         yRq1k3L6WCLgi4uHBiJqdDG+KOVJksQ+vubaJdRgg22hgW85KphgbaCTqBgQNI9Ig2Ig
         YzhMuyzx2Pv7UFTcFrTf/iE5bLHaiFDI+DfPwIi+Xp+it9B4AT/PQEM8zcM+Ja1psQuE
         7JledYaUekUjNubhkJtJKe/78rE9J/R1atmBY3UPp9tYmykkaAZMfQTmT9uSz7xz7VJN
         X0hgMOF8OzOsikdo4BzM/DYTBfKiH28kImoPX3K8H1Ey7TDRONQTa8uBpzBbTZ40h7aj
         XE6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SJNfRloY;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if12-20020a0562141c4c00b004bb56b0497fsi5552964qvb.169.2022.10.31.21.47.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 21:47:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SJNfRloY;
       spf=pass (google.com: domain of qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opjAp-0003gX-OK; Tue, 01 Nov 2022 00:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opjAo-0003gA-1R
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 00:46:50 -0400
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opjAl-0005ly-9B
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 00:46:49 -0400
Received: by mail-pf1-x42d.google.com with SMTP id i3so12465814pfc.11
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 21:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=F+mfPV3qHYsPWbb4jil5DssIm5iiXUo3d+plbLB2MmA=;
 b=SJNfRloYlVuCQcSj5nwgzVh+27pV7aLuk5VRkVX4XJkxJpt1/U8DP6PjrkB+WgXSY5
 Wwc3H0/Q8Es/JYfgMTjrUO/0F+tkEI+0FIPHlZTD6VnmcdI9Ofrn5Cjcn9r52/zrUmcK
 gC9v8A5WaWv4R1bibxalIlCFk/M2PtrF7BMRnXufVz+2rEVVMgWPJ0winwfasmd+4izt
 DlKmklgErBdN43634/c1u5dAIHWCjzP9B7X4dfy+vMsBEUUPtklJewUbZk2kf8AvQb7M
 g6RY/gPUXu3dz2lJOjIK1LecyR5sLzQe7vuIfLkTn4L+ILNL0w45m/yblo9dJ+4JmIup
 ySWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=F+mfPV3qHYsPWbb4jil5DssIm5iiXUo3d+plbLB2MmA=;
 b=bpkIbAmceOMODNPdcNTWvEfugoonzGSzhOGTdLn0IyYui2+/ZNIPF7fO9WrNFVOh2Z
 d/SeKUHXAViFOIC4VS0TUeMBUybyxn9mDU7+K893l+0GblPPRVGo4Tr9t2CYmeqeuan8
 eB8JC7VI6JHsCk5coK4x/ouqFgYg+ALuNXT0QCCc3R4ELJidlGBlnGQvdzcTU2velWOf
 +itfRff5eqrJCaniqHbQ6AKgypkzgYM05yXfshbLld5Xs8N9wDbmBTc8fUNahY6v+/m/
 A80Vp6nzUKHh745nSTn9mIbSLaMO/aXlTLH1s0yTuvvTcuW0qN3yEGKQuNd1iBD1RgU0
 VIdw==
X-Gm-Message-State: ACrzQf1cs/ouYh/UOGKGZNxDVt6cFmrWeHi8bqkKL3kxU2HKLYyrUmYr
 +wSwQSaaTVPvuAI+sPhNMJcuDg==
X-Received: by 2002:a63:d66:0:b0:46f:8979:30e2 with SMTP id
 38-20020a630d66000000b0046f897930e2mr12861450pgn.348.1667278004983; 
 Mon, 31 Oct 2022 21:46:44 -0700 (PDT)
Received: from [192.168.229.227] ([172.58.27.227])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a1709026f1600b001708c4ebbaesm5178023plk.309.2022.10.31.21.46.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 21:46:44 -0700 (PDT)
Message-ID: <b923ecf1-0a77-d724-b962-e8d789c8158a@linaro.org>
Date: Tue, 1 Nov 2022 11:00:11 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2] target/arm: honor HCR_E2H and HCR_TGE in ats_write64()
Content-Language: en-US
To: Ake Koomsin <ake@igel.co.jp>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20221031084324.844220-1-ake@igel.co.jp>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20221031084324.844220-1-ake@igel.co.jp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+thiago.bauermann=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: O+Jpl8wtMVHs

On 10/31/22 19:43, Ake Koomsin wrote:
> We need to check HCR_E2H and HCR_TGE to select the right MMU index for
> the correct translation regime.
> 
> To check for EL2&0 translation regime:
> - For S1E0*, S1E1* and S12E* ops, check both HCR_E2H and HCR_TGE
> - For S1E2* ops, check only HCR_E2H
> 
> Signed-off-by: Ake Koomsin <ake@igel.co.jp>
> ---
> 
> v2:
> - Rebase with the latest upstream
> - It turns out that we need to check both HCR_E2H and HCR_TGE for
>    S1E0*, S1E1* and S12E* address translation as well according to the
>    Architecture Manual.
> 
> v1:
> https://lists.gnu.org/archive/html/qemu-devel/2022-10/msg02627.html
> 
>   target/arm/helper.c | 38 ++++++++++++++++++++++++++++++++------
>   1 file changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b070a20f1a..f7b988395a 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -3501,19 +3501,33 @@ static void ats_write64(CPUARMState *env, const ARMCPRegInfo *ri,
>       MMUAccessType access_type = ri->opc2 & 1 ? MMU_DATA_STORE : MMU_DATA_LOAD;
>       ARMMMUIdx mmu_idx;
>       int secure = arm_is_secure_below_el3(env);
> +    bool regime_e20 = (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) ==
> +                      (HCR_E2H | HCR_TGE);

Record arm_hcr_el2_eff in a local here...

>           case 4: /* AT S1E2R, AT S1E2W */
> -            mmu_idx = ARMMMUIdx_E2;
> +            if ((arm_hcr_el2_eff(env) & HCR_E2H) == HCR_E2H) {

... so you don't need to recompute it here.
Also, you can drop the "==" since HCR_E2H is a single bit.

The rest could perhaps be more compact with "?:", but is ok.


r~
