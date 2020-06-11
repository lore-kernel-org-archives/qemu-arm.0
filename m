Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1583128lfc;
        Thu, 11 Jun 2020 09:35:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzMREC8iMZW2Qv874Mnah7g6gVfauoHG+UknN0wcB8mGU/IU20vtluFFiVzq1UIyDlOcU9J
X-Received: by 2002:a05:6902:508:: with SMTP id x8mr14878389ybs.474.1591893337111;
        Thu, 11 Jun 2020 09:35:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591893337; cv=none;
        d=google.com; s=arc-20160816;
        b=zkNiYHHQAkYCZbDTiHfbQmzAokkX8+kdpfLF5cwKMsJ+l7b8R5NpvOMUMdv5ys9YAe
         Ap9KS42V6fQZgtdWVm8nMPRyMyLBsR+TGVCgy0HUh/7soXn8DRqYmwVqkwN0JqQoEgji
         9+k+lGRjlxz5RaLpT+DjJJpaDpg1c3Jv6CVm+/WsVpVNRfZIo19lriwGHDhnOVTTkZtv
         myytyYmMG9jab/P0mF4BxrxfiTHt0UVSUl322qthYPw2WXo90tj90YreletF/O5iEfH3
         Nod7lw3y8+fOAxKxFQrrRLaO/7DsZrjKiRrdIFYOJblyWRrlp5zPDiqZxaThpHZC9R1s
         a+3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Hs7JSY0jzpcwRG5ER1FnBTpvSXdBInSdAVUJLhsMIx4=;
        b=zw7NWAw7Cd19K9ffh6TT4+LDunLjOWb06Aal4p1kT97H3B2euKe2XokExZXJUC1ZkP
         mW2uaUwNi8X/Ls2uvHYqwlDchnxCJ+JHq3R286nR4dRjbO8Qm9bB64CH1QBjOqzHcyg2
         OOdTa5FuI3AhriVmwPcvfd8xRayZfarZWCU1RHZgqwJlCIrpEMLBnAOB9MBFK8E05zjF
         Rl9BCPJU7D6AjVQMHBJmmGzefrEmSvBhXQZm2ULIZFkUbmGPc8EUANzs7rc19PlBGuEQ
         WpwdXjH2g5AGGF45jqkabFSq9hTLvNbzvGrY1aGUDPV55Fbd47zrOr+4zl0hcSb3cAsW
         L35Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oZjSu6Vn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z11si762169ybp.361.2020.06.11.09.35.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 09:35:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oZjSu6Vn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjQAy-0005zB-8r
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 12:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjQ2k-0001ln-Sx
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:27:06 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:34706)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jjQ2j-0006gq-25
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 12:27:06 -0400
Received: by mail-pl1-x643.google.com with SMTP id n9so2521129plk.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 09:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Hs7JSY0jzpcwRG5ER1FnBTpvSXdBInSdAVUJLhsMIx4=;
 b=oZjSu6Vny9PxZR4klZjc8y/l/IxD14IRTVki5n53EtwVfD8b61gdfRNhnJ/3cTM0Q3
 YPjhbH6HaV/W3MqMwFYCdyLLROs0+ooN34qF9YkPQiiiYP8pT5nd8/0RDj9FgJ1Mypny
 4tlFyj3OZHfOtiGMv9LZ1Hd5S40gDKqqp+kWar8lcIKvWxBAkJpNwRxk05ijE0LNwjIw
 jQA1tv1dHLaIruJRLe1D0xUJkIZmK9jbQ3Lkno63NWYM1RUwMFZ/V9sjssc8jUL1wyvC
 JzL4DMwId6JVAeb9LsHT0xL/Di6gTRFKZY9B90Go3h/bljjvLvwhbTf/RL0rttudsgno
 AdbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Hs7JSY0jzpcwRG5ER1FnBTpvSXdBInSdAVUJLhsMIx4=;
 b=ngvRNi00A2B20xXtli99eSW8jHqEV688N+uLT4KxaxYJ5O31PfYockntZJf26qRWnt
 Ua+V1CIMnM7TwDqC8Vgfu98sB5CShqEw8TaIO2Oj+berGuhAG7B8ur7p++EnykNFp/VQ
 XWi30fv4MaNz72h0yeHLeXVLQ3l8XdnpPmASoG7Js3+7R6S6KG5hJiXnT9FlO1Hr7yvQ
 O3d7SnAD3miF/7eGKa4UUhhml5Z58mlbk85heTkAPXMgFOAXUgMSmwdMkd1uV5KRys/2
 O+25j//E3fD9KqF2PuOxP1OiQdANuNTbjAU3DHDlPUJZVU1tWvHpCmpikWOxot9a91Z2
 bn7Q==
X-Gm-Message-State: AOAM531q/ibrIXQIgijxoSjOBlQxPvMw0dxIcsT0gkx/XixJwlidMM2B
 as2Z/Y8Wh9OZeSCGov5g5jptbBEMTUw=
X-Received: by 2002:a17:902:bd0a:: with SMTP id
 p10mr7778219pls.102.1591892815783; 
 Thu, 11 Jun 2020 09:26:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b5sm3670041pfg.191.2020.06.11.09.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Jun 2020 09:26:54 -0700 (PDT)
Subject: Re: [PATCH 08/10] target/arm: Convert Neon VEXT to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200611144529.8873-1-peter.maydell@linaro.org>
 <20200611144529.8873-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22ecaf5a-b770-b7c5-7945-dfa5d8fd91cc@linaro.org>
Date: Thu, 11 Jun 2020 09:26:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200611144529.8873-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 813moGnvepzG

On 6/11/20 7:45 AM, Peter Maydell wrote:
> Convert the Neon VEXT insn to decodetree. Rather than keeping the
> old implementation which used fixed temporaries cpu_V0 and cpu_V1
> and did the extraction with by-hand shift and logic ops, we use
> the TCG extract2 insn.
> 
> We don't need to special case 0 or 8 immediates any more as the
> optimizer is smart enough to throw away the dead code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  8 +++-
>  target/arm/translate-neon.inc.c | 76 +++++++++++++++++++++++++++++++++
>  target/arm/translate.c          | 58 +------------------------
>  3 files changed, 85 insertions(+), 57 deletions(-)

Nice cleanup.
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

