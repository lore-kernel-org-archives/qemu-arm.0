Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2854490njk;
        Mon, 2 Dec 2024 06:09:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUmACpfINfnO5q1sL+LxZN+OLE+xWDdqslmAGDhTGh21CJQlTlVdRdoIvQKHkY7enJraHiINKGcVyIWMw==@linaro.org
X-Google-Smtp-Source: AGHT+IHY/ISQUUNQ1TH3ybcVqpISz7d+81IQyEsX/yuGMqmnruURdQ1efLVf/qlt3jbMI4PMMHUF
X-Received: by 2002:ad4:5aa9:0:b0:6d8:9062:6614 with SMTP id 6a1803df08f44-6d890626c53mr215073246d6.5.1733148549065;
        Mon, 02 Dec 2024 06:09:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733148549; cv=none;
        d=google.com; s=arc-20240605;
        b=ZcvqaUC/uXldWj0UUB66njeqlyA6zWGOuJVuo4nuhjhs5wPbjzM3/seK5mzkkNftLI
         OYmWFC3GvAt6xZlkFSyKlNEvwSZuoOg3SznwF8uVleEDa7u789+5LlxnoTSvDiffBjvq
         Pw6iZWbi8jl42XLRgQp2RwBT+FkOqAz+thg2x967WR1trpK5qqrdIlKxRCmqwt3GvpCa
         yXhOoSuC774rOBGtxk/jGrVEgVTfsGOmGdfEmu5mEj+WdgS7XgDJoAG0YrrLpY1/S4LP
         eZfO7GsZgce4piz+9j55HDWGpOkmUxpApCsoeTsXhogodHLIMVJAdhKvH0d+1jz9PoUE
         VFNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=sJsbVBbT7C9ttAMdgNcbdkObeksp2o8Bm42drA4g7zs=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=JzYhI4egc2P+dzWclQGZOUQl0S1XjfeCX2+nDBpELby1B/eYGZmoGMnRiVTGb0QFOm
         hqdDOnz2M3I7zoHTaxhmI/4Psewen5435oiO0rueCXERfltLy5A7li9AH19JkrQvb4yz
         kdr/kgfewAMJImscmm+sZhv38z6I/d6jFe5idC2KKa65T1LY/r5zfPI7UVw1FBgUY3+6
         HpHp75V2aNGsgrRGmVfIZMjU1YHbaJTCurBmAcqU3Nwy6lPlriUV+HChXh9qjR1uM4au
         uxmXh62I++tdsuDcrGAsg8oEuPplr/8EuX3djnKLc6sMAjR99jbuCzxYrgMPdpR6SdHS
         k1Pg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QU6MkLc3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d875579e3dsi129947116d6.414.2024.12.02.06.09.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 06:09:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QU6MkLc3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI76U-000517-Db; Mon, 02 Dec 2024 09:08:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI76T-00050e-Gw
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:08:45 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI76S-0004u4-3x
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:08:45 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-434a852bb6eso39567455e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 06:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733148522; x=1733753322; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sJsbVBbT7C9ttAMdgNcbdkObeksp2o8Bm42drA4g7zs=;
 b=QU6MkLc3EsNGjesM5Pez44jqfzGkTr+m4e04t9R6LQIDUPI/rb8dJZEa5F9ohKcdhd
 sIb3fD90x1fY1IK03lDg0UY+HCMWPuWfUp3Lph1CYlZWrb43yfhuv+Eql8AWFF3icL/n
 RVjn04fj4x8/kerDzONL/vkUvhWP4S3OZskJfvIt2PmLwt0hSOIcQhG4O+dwXB/uV432
 VQ1rNfYhLX/91/16FHuAfpvVQo4lwh15KPSO/jWIk1gEcn6pnz5UNJ8hBOYBlbR7jvXi
 8QsApDltLRHSapjMZtWz4CBu/xSt6p0l5uDTvIwL2ngiiSAh5O7ApPPGyF1E3eSDiWXX
 QKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733148522; x=1733753322;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sJsbVBbT7C9ttAMdgNcbdkObeksp2o8Bm42drA4g7zs=;
 b=ajFGrPv3tsKyRVwCvnRb+LR05b0O9KVURtkRL0nAOTEOj9NNt/Gq7WQ9c3ruPknjbB
 vUMXpHNp4g0Wr57DsGQB1SIv4Vf0f39fvw5YJSF9kG8BiGKwBpGtelCmp2fH9Kh3vmUt
 XSbna2QzviRPKwdMXjM3Bc6RvzPX5fD7awzx1SbcxmQFxi0GdQipz7s5Pjxj28hhNkNf
 SEN2jwSwUDcbqTqZzHqknDjfydB4q74qOjai1zInWWkcJ8ePVUsryZaTCkoQNlE2Dzpx
 ukLxUCuNGewpJUhMP1OFytcTA35hAAYCo44yZemDRWnaZqtKO4jZa+UAYESHeBPy2f39
 7h7g==
X-Gm-Message-State: AOJu0YyJqDzqRLryibVfSHzFhBBjTucYDAluZUJmHAP3/hQL+6vdwJrh
 N4p5/w0cz6Dj1qjj+F/iwkbSV6Jm8j9KOPfI+3HdvlnXpm2CJgjrYGN8Q/B0/RwOBja6MZbAOX3
 CMZI=
X-Gm-Gg: ASbGncu0WsplIk1ToB/yg8ZLA0Z4B96unwEN63vkPww7dbZpAo5nh6TIRuwk8TUhZYe
 +enhrmPCwO0Nj+QQxfmNsFLdWPOPBtFjpBRCX4z0OngIQ8PFAyz0tvFxWl5qPgGiklzdj8/DVXO
 lnhmYV0y+vDdWaNqxWUfru/Jpukc5FB3SBHwGEOt78ofczGQ7Go2d7OwZm5ffR4Rl+qnHta3Sua
 OvIFXzas6R8d0oSdAv9oWiZ9UIGHzeFw5/kgSeQ88YtwL1kKKsyPgR0Lg1tYMtjoq6EKrOlkog+
 fItHkjod9rUAzyGFr9LzMy1hpjcrmQ==
X-Received: by 2002:a05:600c:3596:b0:434:a386:6cf with SMTP id
 5b1f17b1804b1-434a9dbbc00mr203939275e9.2.1733148522354; 
 Mon, 02 Dec 2024 06:08:42 -0800 (PST)
Received: from [192.168.68.213] (72.red-95-127-54.dynamicip.rima-tde.net.
 [95.127.54.72]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0dbf9f5sm151960665e9.16.2024.12.02.06.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 06:08:41 -0800 (PST)
Message-ID: <85d253c5-3d25-41c9-a6bf-ea6ecb6b2049@linaro.org>
Date: Mon, 2 Dec 2024 15:08:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/67] target/arm: Convert CLZ, CLS to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-9-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241201150607.12812-9-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: KUkwlJzgXmNo

On 1/12/24 16:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 72 ++++++++++++++--------------------
>   target/arm/tcg/a64.decode      |  3 ++
>   2 files changed, 33 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

