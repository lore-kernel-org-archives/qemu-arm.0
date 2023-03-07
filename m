Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5286841ejc;
        Mon, 6 Mar 2023 16:37:57 -0800 (PST)
X-Google-Smtp-Source: AK7set+m2mVlfhMraCQoisBnqJUzd79giUJiH99WvlXTpuAIZ751EsNvznGDCDpQLuR2jQdpQ7Ya
X-Received: by 2002:a05:6214:29ce:b0:56b:fc7c:e57c with SMTP id gh14-20020a05621429ce00b0056bfc7ce57cmr19184253qvb.51.1678149477637;
        Mon, 06 Mar 2023 16:37:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678149477; cv=none;
        d=google.com; s=arc-20160816;
        b=P4oARefh6ffpvS/egrQadcVnR/j4WFp6sa+PHxLz1jYtdJ3orb0i53e0+oLXfAmP0W
         GFcbQMm42ZTnp/GAOcc45iQCV183I0LG+imTsnRltSP5TO39LdtblTO2pwIajj9ZEEpe
         5F7wQc7uxkDkFUfb081U2UQVWgC9B0FXcAlAe9Pfc/rcxxFyLgxHNspduEb69ufoLw7j
         x0rLOFTC5XRwPNgpSw46iTtIEK3AgwzZXDCFU/dnlbh4sdwfHM4TvD5n1ytFzPdWqPJX
         EyRvP/TiIxjr16z65g2c54XS6B2vudzpKRJb2s3efO1/JEpd9nGeUl0hXSRwesrcxiiq
         lQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ICnPhU6cHn0twhF/CUf4hoGgm/p7umHBuM4TowPzpDA=;
        b=oZjTNFe5/2buD4yCCpQHg4nUSZHW7cpKGEU+TB1sJCEhz0qWsEZJQUkVq01zVZjx3X
         x2GyxhWpkkcMq2k3WCm+s9tnJzD/OJxgGj/QT8aFHTzGKdy5Ig+evzMvhBf38nysP5uB
         XY2wEJevYnO9+BM85bcGr7hc4lwT6KWd44aOsk//Kkrg1X0b58DKQcGV4KjtQ4I58+9o
         3At4C00oSvcZYSVs16Z5Dc6pu7EWsgeuHdsaoVpWTkq3hPx5AilR0qwu/ZFwBxUWg05B
         dGmLPunAylka38IVQOwiPVQplkL1Fb4VuV+U/nfv+5Oniz5DF6DMlURhUjJbg2ECNYeS
         VuDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NmvSR9kg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020a0cf412000000b0056ec09e263dsi8539760qvl.92.2023.03.06.16.37.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 16:37:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NmvSR9kg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pZLKW-0001al-AT; Mon, 06 Mar 2023 19:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLKS-0001Y6-K6
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:37:21 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZLKQ-0000IP-EG
 for qemu-arm@nongnu.org; Mon, 06 Mar 2023 19:37:19 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso9412663wmi.4
 for <qemu-arm@nongnu.org>; Mon, 06 Mar 2023 16:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678149436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ICnPhU6cHn0twhF/CUf4hoGgm/p7umHBuM4TowPzpDA=;
 b=NmvSR9kg1zwpXasWQuA4g9cj+Ngm8LW9Kzeuj16zvxhK19LXslMk23ZJ8vfMFEdSo7
 05d+ERCTImX6PkU0M28BPQnEQdpf4E+8eLTmZ2XDRQllfyUlnXfuQp+uklSK3HU4Sc+X
 vPjRarj4K7sCcj8nGH/DuCR46AUhew1DBVaXK78ugKTqt1P1FGWZw8jX8p3YRMmRBg2R
 V5sO6SplFTdOxn47wsxNf/5L553YLk+CeWiRSPJX5uT5hyLWUtcsRBuLrQuUK1brlx20
 KZtm2vtRF44MHU/kC/bZaVBaHjtDAMTcUqThCaXpCUjGck1gjH4rAnNG2cbyfQCumaG8
 oABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678149436;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ICnPhU6cHn0twhF/CUf4hoGgm/p7umHBuM4TowPzpDA=;
 b=cNqT+KKjsiWud54boItsGlpyGVHlNJZ8m9Tsh3X7D144czOxAQ18oc/81n11QbEKNB
 ZW/fetzPdW0wGovA1EFTIU/f2SjI5rpTgvdY6iySO+8sUBFZbbBJsyj1AkvXVoMIwZHz
 eEaoCy2jdrtc4wyxRMxYJiQSubBVlp4+Pwb9eQsOb7Z7R9TIt7KJwqRqIHZW47VBFGy2
 q6CtYC4kcnUqFSn69JGb7cZ/jpIttTMSuBlyr+spmNH67NPW2Z3KDTAlwUkvAsmI5nTD
 ZYi/tifoPfZGhhfp+Nkv6KX1OS4z3Rvt/qmv2hMdjb7vweOjXo7dudhkcYQVFsvn2vq6
 q3bA==
X-Gm-Message-State: AO0yUKXjntsTG2DXC8AVxmBO821XEmPXN8tClzbwK9u0uyacVJ9BB8IC
 Cph/aJs2te/e020QnbHpevxuOg==
X-Received: by 2002:a05:600c:4f15:b0:3eb:3998:36fa with SMTP id
 l21-20020a05600c4f1500b003eb399836famr10927932wmq.29.1678149436676; 
 Mon, 06 Mar 2023 16:37:16 -0800 (PST)
Received: from [192.168.1.115] (138.red-88-29-178.dynamicip.rima-tde.net.
 [88.29.178.138]) by smtp.gmail.com with ESMTPSA id
 r22-20020a05600c435600b003eae73ee4a1sm11439258wme.17.2023.03.06.16.37.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 16:37:16 -0800 (PST)
Message-ID: <0115ca07-70f3-91c7-8d89-c4b51b833428@linaro.org>
Date: Tue, 7 Mar 2023 01:37:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 23/70] target/i386: Avoid use of tcg_const_* throughout
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-24-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-24-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: qGAwYy2vzWZF

On 27/2/23 06:41, Richard Henderson wrote:
> All uses are strictly read-only.  Most of the obviously so,
> as direct arguments to gen_helper_*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/i386/tcg/translate.c | 83 +++++++++++++++++++------------------
>   1 file changed, 42 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

