Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp668917ejf;
        Thu, 11 Aug 2022 10:56:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR45XUKoTnl+XuG+4Q0QgMvJXAVqcaAdKdeWmzL7RYde7mY+2Gfw3j1RL6k+ATqvKvHBgUFT
X-Received: by 2002:a05:620a:4010:b0:6b9:74da:d1df with SMTP id h16-20020a05620a401000b006b974dad1dfmr84138qko.491.1660240566233;
        Thu, 11 Aug 2022 10:56:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660240566; cv=none;
        d=google.com; s=arc-20160816;
        b=FDfOQCNqsv/yDKJKobez3oSlVePpzmBmKKmjNjhFT5x1qlqKUmkdcd0A/vh3s+iXJ5
         whT+UP22aKDwNNYx9+Tua2hxfhQM7NuEwJwCQGHFmEpb2nqJLYN30+XNmi49BI2pOa0V
         6/qRsFLz2HJVaBv4bzKo6Okhe32UCl16c3x5xXketTnUAIYncI4PXwlLAkxwv2ngj8ro
         MpwnNfEPYxbsmwjqOFZ3MXLO/7ZQaX4CRYYxOhHG9D0spsx+rvkrpeaFNFvV7WifdgVK
         KVEaaqEFjlsMd1ELrwrDZnncR1x2nWtvnDBB6pX8b0X3yvFleH2DOldk8qy5N+DP842/
         xegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=uXsmILYWWCujC2FYPWyfVVar+tVdo3bcysHpdD+gV+I=;
        b=fBMAOrIM2ajP7hNnM11IoIAJT+GiS7xUK62VRTueL0EdVudFsDT2z9igtDt6GHOAUV
         fHpk5k9bQ1dDHMax1Kj38PzH4nGPRyaz8ZVXKPcVfmkyXi9z/els9MINFSsxZTaUW+gt
         2wRSb/p4KdfezL0/4DI9b7+slFhDhOe1V7aXp3K7lMKdY7V0HjC1VpHNe49i1/5I3u6A
         kxcF0vPJ7rfBgv1GeYu5Feb0j6rBKsljeA1xpiTc190RYXORvABr5EAZVUmUgtSb7+jh
         iBGNU2Go5fTdQzf8WQuaPdrtEcqsUDP1p5S+rB37TqR3oKeW6ph9XfAsc6kYXqa/uCgU
         pBIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CSxHs7uv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bz15-20020a05622a1e8f00b0034366c9cd42si60309qtb.463.2022.08.11.10.56.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:56:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CSxHs7uv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMCPd-0007PQ-Oc
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:56:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCNN-0003a8-8x
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:53:45 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:37541)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oMCNL-0006T4-JW
 for qemu-arm@nongnu.org; Thu, 11 Aug 2022 13:53:44 -0400
Received: by mail-pl1-x62c.google.com with SMTP id m2so17558241pls.4
 for <qemu-arm@nongnu.org>; Thu, 11 Aug 2022 10:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=uXsmILYWWCujC2FYPWyfVVar+tVdo3bcysHpdD+gV+I=;
 b=CSxHs7uvcWB44LUe7IYg0TDkwbqghwhPCPB4ikwN2VqR+DyNVGw3EIyvPagKMj/5aT
 BagT3T8b4sytzuBG6Ny6+Ko1DtYzYu9VFvAasp9mBnxlHThrVg9rYsc+v9e9axz3lXjH
 D3/gB6jxesNFHTCctRBnxOL//XF7ZSKyKtkG2Kwsg0WpzvpXbFjFcFZC46i8LUbq9MVG
 npr6WU46b7OjeHuhrMMOMjZdG1k1wzHYpJNeHjydu0FHquDBJYeX1914OAZzB8EAcJ2a
 PDDbji9dn/Od34xfOF4mBsp81qYPUP8gwSxrdP+W1XBzp/Z667Cz0hRM2wVkamGNoTs6
 kmfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=uXsmILYWWCujC2FYPWyfVVar+tVdo3bcysHpdD+gV+I=;
 b=Dikh+BQRbC4NsFcrbhfls+uNjKBWJb8KknXNyMaEyFytvqLobknh/YbUjw3k4IKo1s
 lcQveLi9lIxvV38jxjSFFPHl6KolGTipX8ufA93+ADBu8GT44N6Vs3VQu/mmBuD2DU0B
 t6/5IQYqWaIGkeNdci8guxFcqYsQ+So2CxYDIvFierzXlF1S0tdmi+VBIUgP9eEiVvaq
 uexnagPNZ6/QBDDNsQWRWVokSq5MWvpFm67jYKA5SaMSCYw1cDR1PzD1/nLr0R3MH6yn
 08ncMBjz8ViGIcBcVryj8gUEFM/pISuGtzkvAINq8uDNAWWJ4S/4+TmKraJEJEEj0sMV
 pULg==
X-Gm-Message-State: ACgBeo2qWxNFLvC9MolOQWxYbK2KfLBbOqbFWU0PGVQWHjnUWbwP/Zf3
 yVagd5P/UqKGukCVKpuIxuPSKg==
X-Received: by 2002:a17:90b:1c0d:b0:1f5:7bda:1447 with SMTP id
 oc13-20020a17090b1c0d00b001f57bda1447mr187920pjb.88.1660240421721; 
 Thu, 11 Aug 2022 10:53:41 -0700 (PDT)
Received: from ?IPV6:2602:ae:154e:e201:72e2:2d06:c2b1:b106?
 ([2602:ae:154e:e201:72e2:2d06:c2b1:b106])
 by smtp.gmail.com with ESMTPSA id
 19-20020a170902c21300b0016be368fb30sm14958044pll.212.2022.08.11.10.53.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 10:53:41 -0700 (PDT)
Message-ID: <c971fef6-57c3-f498-1552-3cacad037783@linaro.org>
Date: Thu, 11 Aug 2022 10:53:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 07/10] target/arm: Rename pmu_8_n feature test functions
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220811171619.1154755-1-peter.maydell@linaro.org>
 <20220811171619.1154755-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220811171619.1154755-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZsppWOGYUA7R

On 8/11/22 10:16, Peter Maydell wrote:
> Our feature test functions that check the PMU version are named
> isar_feature_{aa32,aa64,any}_pmu_8_{1,4}.  This doesn't match the
> current Arm ARM official feature names, which are FEAT_PMUv3p1 and
> FEAT_PMUv3p4.  Rename these functions to _pmuv3p1 and _pmuv3p4.
> 
> This commit was created with:
>    sed -i -e 's/pmu_8_/pmuv3p/g' target/arm/*.[ch]
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.h    | 16 ++++++++--------
>   target/arm/helper.c | 18 +++++++++---------
>   2 files changed, 17 insertions(+), 17 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
