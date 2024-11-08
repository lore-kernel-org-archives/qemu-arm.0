Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp4953471njc;
        Fri, 8 Nov 2024 06:30:17 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWrHhKZajjjUsXWpnH48fw0cfPCaMLR3AMgEPQ1+1/N5Xc9NCjX5k4JcAjn2EMiUWz73G54EFyNFH5uvA==@linaro.org
X-Google-Smtp-Source: AGHT+IHFAr1yR8lKwKxmWKaNAS7QGE3u1OuNTBEg84jaBj7WPtbC2cY5lpITLGzhGlwudakmsfmK
X-Received: by 2002:a05:6214:570a:b0:6cb:ec7e:4fba with SMTP id 6a1803df08f44-6d39e19782emr40131176d6.25.1731076217480;
        Fri, 08 Nov 2024 06:30:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731076217; cv=none;
        d=google.com; s=arc-20240605;
        b=lNYTgSw/wygv68sEDUP34yNPOAMcKtT8htFkDVqHpw0IQkHfhGaRQeeS0lhS30ZzFt
         GuiWXuRK2hzzB7CgJzy2jriiO0tpdT5USRfbMkQDEUv2sCL/jNtPbwwvZz6567GJxyJy
         a0wWxwBkwcMtgUZbKa+PQEIuEy5m81nW8ktgCSwuCgWsoGt8voLjwV3PKmsG1O+1XylB
         0OtRk79ilMb1nNRtiTTPe2cejLmgwM2xfrUn9xFzliPcdiTxDGjPHbEMn/pn5vDcmflr
         ySRp3kcO5vtA6WWywa4Wj2J0omYuE7e6NAzoRiNLDkwPGRCE0LM0Z7NF6zHNOKQUei9g
         TMAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JIyOpWsIdv8kFRBEg5bjtZkiQ9mzRA39tcgchUTXeJk=;
        fh=GpHOVS52f1bY6gf8ki+zAWkvg+dnBBUPDot2VBCIzFM=;
        b=f+mDJMePaPH/eXZsAU39iqVoOYiqw+xS+R+s/7htrcLsPTyDH4AoudNJkEaG4X3dI1
         WGwfCutMt3knfVnhU9JHjYPhJNaNRH5T2PgX2CBNTw/iDhtBgwvOA38OX/JWmDrBbOao
         AOFOUrC2xAXoH5hIzPxSU0ProJMjSj7jpvMvZbXD9GfWRkLadnlZcXKWOvxBT0z4ICy3
         OXJ5nyP8ckMyY6z63WJr4zZxClwK8xgz9YUzLhEQ2dxi4f97VAJexawam5nZjo1ynanr
         7vLAMHCsr280Ev1tAi8vlDwowyrhfoqfe/gLHBjuo0Wq4l3S7lZsa7Kqe5s2iwNXyLio
         jd4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tayyO1/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d3966b4e56si43000526d6.496.2024.11.08.06.30.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 06:30:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tayyO1/z";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9Pzw-00063t-TY; Fri, 08 Nov 2024 09:30:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9Pzt-00061g-Sb
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:30:01 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9Pzs-0002Yc-Ae
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 09:30:01 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4314c4cb752so19051445e9.2
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 06:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731076198; x=1731680998; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JIyOpWsIdv8kFRBEg5bjtZkiQ9mzRA39tcgchUTXeJk=;
 b=tayyO1/zy/mVeBbd6ZCfMeupCMEisUpcERba6WhNYf9oCOcgJNw0H7y7RlHJsCcxjZ
 NSTM3RauSmS1WSs+IK2bbD3B52oDeVGKNrnxXNs+TrMbSONWQ+Jcx6ygr/j4WkGdDgkU
 6rg3/yqKoYKb36XywK/EU9SEc+5+kMzKYR8v26LFj0mCub7Ilw7DtARER9yn/OBd5Qov
 kmzMi0laIa7zY4TgANgwkhJMOe4RISZbaAPIG87uonPUK+aj4CM6HxxtuTnaU4CnCoKW
 A8NhS2lKjXvKALPXUxt1x0jd4/yND3d+RqM+o+cmHWo6ngX0k3U+2MC8RddkCWY25x2S
 G2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731076198; x=1731680998;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JIyOpWsIdv8kFRBEg5bjtZkiQ9mzRA39tcgchUTXeJk=;
 b=Y1YK335G+S8+LhQ1A+0MLVGBYeot+S8ZXFmZuZXsE2CnuNTcvy4uknBakN8vaJLAZv
 J1rtpuzWzSJMNILdOWjxfR4MPyu8L71d+PBGtJMbd56lI4n+MKjpZEOgrc4DpdXXR9tB
 sdtM7rVU9bgN0leeoP70vxwQlV2Q8xCQoXjVko0GErJwr3J20s0VICHJvCMs+2TviYnG
 MNtNFPp3giMJeqN49NmksVapCXTR2lRCSufjIjG1FnZ7WCb3WjVHL5WS0+7cMZCz7oRQ
 vysyeh8J5fs69nVFDqd1gMNjsGyMR2VoXIiP0mDMGZ/JARJaD2lpIF78fs+Vmuh6ucaS
 /egQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgiiikVgZF6bQj4jf7jiVj6n4sIMxvPY/YcTh/P7Pgp8HJxUb1rjWv+Fh4vzJcG9rOjSDJEv8leA==@nongnu.org
X-Gm-Message-State: AOJu0Yynv0TxU4ix4VFuyC5yHMxykeCNF890bnxIUtHirE6K7XkMZJyU
 A8GjEVI5StLk6502qw5qbMFfoCuMb7GFWqKmaswfgKVHTj7cI0uQUpCWmAhfe10=
X-Received: by 2002:a5d:64c7:0:b0:381:d890:b4b6 with SMTP id
 ffacd0b85a97d-381f1834e6fmr2485287f8f.48.1731076197664; 
 Fri, 08 Nov 2024 06:29:57 -0800 (PST)
Received: from [172.16.22.241] ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432a26a7508sm106380205e9.0.2024.11.08.06.29.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Nov 2024 06:29:57 -0800 (PST)
Message-ID: <51f753df-3d7d-4f85-8a63-88714e9117b6@linaro.org>
Date: Fri, 8 Nov 2024 14:29:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/misc/nrf51_rng: Don't use BIT_MASK() when we mean BIT()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>
References: <20241108135644.4007151-1-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241108135644.4007151-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: ra7+wVavWg5Z

On 8/11/24 13:56, Peter Maydell wrote:
> The BIT_MASK() macro from bitops.h provides the mask of a bit
> within a particular word of a multi-word bit array; it is intended
> to be used with its counterpart BIT_WORD() that gives the index
> of the word in the array.
> 
> In nrf51_rng we are using it for cases where we have a bit number
> that we know is the index of a bit within a single word (in fact, it
> happens that all the bit numbers we pass to it are zero). This
> happens to give the right answer, but the macro that actually
> does the job we want here is BIT().
> 
> Use BIT() instead of BIT_MASK().
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/nrf51_rng.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

