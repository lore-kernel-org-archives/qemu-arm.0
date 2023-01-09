Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2434705ejc;
        Mon, 9 Jan 2023 09:10:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtulL1hQb/yu572E6w4OJRbWIaLHMg1p3JEc/0Kmcs2zjSOmW0wwBJXWaVZ4eINFc3QcXdF
X-Received: by 2002:a25:ac6:0:b0:7b7:4a31:5526 with SMTP id 189-20020a250ac6000000b007b74a315526mr12863181ybk.47.1673284212287;
        Mon, 09 Jan 2023 09:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673284212; cv=none;
        d=google.com; s=arc-20160816;
        b=b1TgPxnmYJ3JmSioblLJ8PYVvsP8j0hy3FgYSzCDd5ONB7fzgGUwGw83RmPpjK2BFX
         dXBQBB82ca70o8G4InXLPfO7+viTCJculPvj734TBhQlfx+wqHUaku9Hdy3fkHo+w72r
         lCGnMmi698Qe7WuyJRuKn0w4Aag0IWThgmOtj4W3n0ZWztR7UrGplLiVjqemMsjF8PKE
         7hQhKfHzmxnnnImeieywju14LGyOAS/Puxdp7SuxjVV7l7GQ0F1ZNsUMALUupeqBp0NO
         42bcrswOGth0j1qvVB+1vP4IymgJuakwW/KjC72HofEMrhLINpfaR9m+yMtShwiANlfK
         89ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=m7czFf6qTHWWqZ0ze//gwvBolGhLp8wZtdiv2g3i6ew=;
        b=d5DuWnk7wPnxIXK8jgXEEYQZ7RBXpCeKt4RQsIldrjVYUS34XPB08uNpX8pbkjDR3a
         Il69RvkgUaat7UZ1CSbYyvjJCjS8x9FraOaW1R5r6A9ZSUZ6OD++3N7MEWsTKu0FY3I1
         Fxm2NLuE9fWmSjksw3JvnY7XxaOdm+0+Ul8ARnDbEz/YIMCYDfDN96r0tvGJaTd6bs2l
         HaJlXIooyw+ueA5gTN15T6eB+yemTGfqSHmaTwZFa6MY/pkSsqDtY+U/r0PGx1xhB8Al
         MgXfK2YCCD7YjaYRl8aBZJHYR8LkK4SYGeZgieOT1uYOB9iIun3STsrMp48CvdVdAKJp
         RVfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZZ++uLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4-20020a370404000000b006ff0211b876si4511788qke.158.2023.01.09.09.10.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 09:10:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZZ++uLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEves-0002cl-Fe; Mon, 09 Jan 2023 12:10:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEveo-0002UD-6V
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 12:09:58 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pEvem-0001dz-Pp
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 12:09:57 -0500
Received: by mail-pj1-x1035.google.com with SMTP id dw9so8001179pjb.5
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 09:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m7czFf6qTHWWqZ0ze//gwvBolGhLp8wZtdiv2g3i6ew=;
 b=kZZ++uLDT4EW/iuTJti461qeAW2uKmN67TDV2A1sbGyzvsfdZijWAvfVFLt/vr6XoT
 IFu/gQa/C40HLwMLFSLVlNI/ncC7G4UFKriq0wAs4pevjwFiKLkbeD4bxOdfIBdMZoZe
 z2wNFRACQberM54m94AfxNKMhikM6PlPZ8OvH/fsTUcXh3JhPiWv/ASLk9o7Enn2fxFK
 PfWgWKHycQKKK980R39G1SgIPEgsvCCma8ZuMsvfK5PTF9k9hOBaqCPmxIfpoV8SAeu4
 T8KZjQfWyWLNeV4jeifLC4XYg3i+XObg0RpEE+nytg/v0FkbWrC30Sx8dRh02IBXErBA
 PSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m7czFf6qTHWWqZ0ze//gwvBolGhLp8wZtdiv2g3i6ew=;
 b=YWLVoLBqa4dL2HOhVUjcHRQvN+S/FEQwgUjfSd+ykjswtaUycQgMY1QfwU+1J5Sp4W
 cAK2uC9i/D/bJEO2v5LSVW5zlkY1ZUN6iSJSKqVXOGihDtLNqQm3pozVn9Ae/WtiRkfq
 8UmyMnkOXKeEXMoppWF5YspEafNP3ViJfG2684fbkxlr+fkTCtKA6GAuddkI4YlEkHZa
 ttTfmgX0ZFrDyHBBiw9KCIuMBSwdoTyEKeQSby0tuJFGKst3/OKtlmCaEI7R5Ot1jHTu
 qD7UimxoZnVifPNMkBdg4LzKaOLmXLG7rg4+zL7mLedXqJEjzDwV5n+qoCPq/taAH/kD
 UpQg==
X-Gm-Message-State: AFqh2krDCocjjVQuzn1pBt+oare244xzqoPxi0hA7x+GDozi1r1ciZLM
 9uadX+hgeo6w3zVBH9tFQRcS7/vGtphGAtM5
X-Received: by 2002:a17:902:978f:b0:189:6f76:9b61 with SMTP id
 q15-20020a170902978f00b001896f769b61mr2460795plp.39.1673284195292; 
 Mon, 09 Jan 2023 09:09:55 -0800 (PST)
Received: from ?IPV6:2602:47:d48c:8101:a909:891c:953d:a6b0?
 ([2602:47:d48c:8101:a909:891c:953d:a6b0])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a170902d2ce00b00189c26719cdsm6323957plc.272.2023.01.09.09.09.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 09:09:54 -0800 (PST)
Message-ID: <4aa2d9a7-f1fd-80a7-20df-606044405bd5@linaro.org>
Date: Mon, 9 Jan 2023 09:09:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/5] hw/i2c/versatile_i2c: Replace VersatileI2CState ->
 ArmSbconI2CState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230109091754.79499-1-philmd@linaro.org>
 <20230109091754.79499-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230109091754.79499-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PlODDKT6KG34

On 1/9/23 01:17, Philippe Mathieu-Daudé wrote:
> In order to rename TYPE_VERSATILE_I2C as TYPE_ARM_SBCON_I2C
> (the formal ARM naming), start renaming its state.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/i2c/versatile_i2c.c         | 10 +++++-----
>   include/hw/i2c/arm_sbcon_i2c.h |  3 +--
>   2 files changed, 6 insertions(+), 7 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
