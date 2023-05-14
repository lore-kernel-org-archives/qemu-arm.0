Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5835267ejq;
        Sun, 14 May 2023 02:39:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6r5eFVJVfmERPG+MuyeMyWq2VFqMiegfDqNKihOfW1/i1BstgUSgTuGLHdkwp3dkryt/1x
X-Received: by 2002:ac8:5e50:0:b0:3ef:37d5:49e0 with SMTP id i16-20020ac85e50000000b003ef37d549e0mr47083038qtx.21.1684057154103;
        Sun, 14 May 2023 02:39:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684057154; cv=none;
        d=google.com; s=arc-20160816;
        b=WmHdsAC/mFkeIdoN+rFE5FiQMgsBfIqOXXbaKxehYJUPkjIji0PuTkpEtV87pZ5xWl
         zTPlhnRkPiVdzPhqZ6z8CRIW8554prfv2c9nr8OOv8KtdRVXXGPjWcoHfkcp9rlbsDdy
         aXWm0+yBug0HNiMTX58ND3tzKm9A+7N/sMk2xjlqhaTTf4llE1H3HNgPnwCe7OAnlKNx
         qDtLYZPc+WbrNmW7aiQ/Y+DRvqeO4SxT6jSpdyKivNQO0L600U8ptqDi/CuRwUn/ubXW
         H4HW36rlkL5ewWqY3uYPb5CzPEdYin9xpE4387IANaPLrhQWjdOB53sAHaZgvrSlu1nA
         L1kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=r2g5PXOwr40p6HO+Bm2Oq9nKiLzZ2rVVlujSultU7uI=;
        b=EIFPlnvL9NrVkmrM2xxTs82CYdyZwZPFjgfR/9E0gi72zt6q/OQvcywz35Cx8SRvFY
         BK+zy+x4OopupVhoRDP18ZMfu9gFNU+A9GmzQF+7aRAvnHuiB7vyWkvZAmU08wWZsnz6
         z4NVZ1yOBclep0NGb9kKpITcyaHj9+xH6nDeOgXqbfAYw2YZXCrFhWxAnF3B3tqxt8S4
         WBHKp54KqMA6+a8BaXzfup+TqPWAFGfpGo0QDkKiGV+wC5UDt+hUGBvRuhhYYSqJjhK6
         /Sdt7NFgNZvYTZY9vUgEcf5PLs6lNvX2sN9DI+GZnCu7O4lgbisx1WsiqZCMLY0/xHEa
         Y40A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c++rcWCk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t28-20020a05622a181c00b003f4ec6276aasi5216500qtc.136.2023.05.14.02.39.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 14 May 2023 02:39:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c++rcWCk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1py8C4-0000fU-NP; Sun, 14 May 2023 05:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1py8By-0000cX-9s
 for qemu-arm@nongnu.org; Sun, 14 May 2023 05:39:04 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1py8Bt-0006Tk-Fi
 for qemu-arm@nongnu.org; Sun, 14 May 2023 05:39:02 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6439f186366so7334614b3a.2
 for <qemu-arm@nongnu.org>; Sun, 14 May 2023 02:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684057136; x=1686649136;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=r2g5PXOwr40p6HO+Bm2Oq9nKiLzZ2rVVlujSultU7uI=;
 b=c++rcWCk+f9T3ZAUNdgPXGVcTQ1lCM1tBR1/w0Iz8uPzQDVfL6CTMWWoIeihHnu75v
 0tUlPVUtllGvVkWyJzDo7PPgKZ9xZEZfohnveFSIOpAowLRNyqW7OxbjlMkntFZn4GEZ
 y8IN85Ry99oRKMiGdN0hA7x+r7wrvD0PzZeAyiL91WFoVOohH8Kw1NpTBlVPhlXut5MY
 2eNPofycSeudTpXSKnvwhPk9WlIkrG1CsjcuCCEN9CsezImmfXEUAjfYuc2h8X6SfXoA
 rGcVe1f/sV5GwBtLJwWJieMng8UXEzdO/JNKJ2uP65i0JvnKPk+EJcqJu0xloOkwpI5O
 IKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684057136; x=1686649136;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=r2g5PXOwr40p6HO+Bm2Oq9nKiLzZ2rVVlujSultU7uI=;
 b=CaLqcv1CP+1tQ5vCLS5xXmnFwN5YFRU/kkK5cpMqNCnHKhkImb3Xs4uwan2JIfPd9W
 FXgfrk2TD7Y8aq5aWSnLiQs6Ia28ncigiIwsMZksv4VkgeGiFosTTnEWNQPoMZ2CUL9R
 g4BxjoHQIniUx3t64+P8PIupBbxo7Yjt+7jTBCecQRdnMabnFFe0Y9qPY2xuMs9n8MlN
 XhFsLuqfUrekyAQLN2JGx6Wqm/JRjcuC6TsgECybEAxXBh5tEfKWgh9FYcCivxNmue22
 HvXTt03eKGp8L6nXVATVf1D4w5vmpwpbEQ5/0EL1mMzqxLuJAgxUxhuJwF6+NppaLp7h
 pgFw==
X-Gm-Message-State: AC+VfDyKB98QNi6MPQpo9AmNxUMSE+t/SEvx6PVhD6F0FbFV8fx6ndMC
 tN3w91B6NyxcSMOH2BxhCL1b4Q==
X-Received: by 2002:a05:6a20:158a:b0:105:66d3:8538 with SMTP id
 h10-20020a056a20158a00b0010566d38538mr3397502pzj.8.1684057135889; 
 Sun, 14 May 2023 02:38:55 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:1836:b4ca:fe24:b474?
 ([2602:ae:1598:4c01:1836:b4ca:fe24:b474])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a62ed11000000b00649ac17779csm5618870pfh.160.2023.05.14.02.38.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 14 May 2023 02:38:55 -0700 (PDT)
Message-ID: <45ca2fa9-3d72-e0c4-aecb-10849c5c90d2@linaro.org>
Date: Sun, 14 May 2023 02:38:53 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] hw/arm/vexpress: Avoid trivial memory leak of
 'flashalias'
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512170223.3801643-1-peter.maydell@linaro.org>
 <20230512170223.3801643-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512170223.3801643-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
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
X-TUID: glPmLyaG2Xs5

On 5/12/23 10:02, Peter Maydell wrote:
> In the vexpress board code, we allocate a new MemoryRegion at the top
> of vexpress_common_init() but only set it up and use it inside the
> "if (map[VE_NORFLASHALIAS] != -1)" conditional, so we leak it if not.
> This isn't a very interesting leak as it's a tiny amount of memory
> once at startup, but it's easy to fix.
> 
> We could silence Coverity simply by moving the g_new() into the
> if() block, but this use of g_new(MemoryRegion, 1) is a legacy from
> when this board model was originally written; we wouldn't do that
> if we wrote it today. The MemoryRegions are conceptually a part of
> the board and must not go away until the whole board is done with
> (at the end of the simulation), so they belong in its state struct.
> 
> This machine already has a VexpressMachineState struct that extends
> MachineState, so statically put the MemoryRegions in there instead of
> dynamically allocating them separately at runtime.
> 
> Spotted by Coverity (CID 1509083).
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/vexpress.c | 40 ++++++++++++++++++++--------------------
>   1 file changed, 20 insertions(+), 20 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
