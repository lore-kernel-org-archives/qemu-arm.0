Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2395739ejm;
        Sun, 23 Apr 2023 12:03:15 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZNDS7bgQoMwjAKU/uTcrumUyhECJ/QEXEnSYCIUGAFrcprATJca3rsflIIicsuQixeQfEw
X-Received: by 2002:a05:622a:178e:b0:3ed:a811:23d0 with SMTP id s14-20020a05622a178e00b003eda81123d0mr21784370qtk.41.1682276595663;
        Sun, 23 Apr 2023 12:03:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682276595; cv=none;
        d=google.com; s=arc-20160816;
        b=ed+yhOr5DzdctthatymCKPhi6wYbfZNN5iqndXKAg1/8YmNn+hs7OTSRZZ6rofZwCi
         lEiE2L3oY8ki4UCDuxUfd0r2Uh8VJu9HnkxA4a0zyx+cM1ziAjHxM8r0oI0xN5JC6b6L
         cmd1o7fhPqWhaRC6U2L2b8m8jNskepzV9J3WFcEQ22rGDVo4q71dH4CtUCzrZwlpv4jU
         xxJmQ1wo/c0pdZMwE5vqOhrlNmkTfo1eAwzxmdJQ4MeHkMsWduONJF58jihpwqRHUPrx
         hfcAz4RlJYJ+ZTC6MaYNoteg6UDwZ1BX4GTnMZEEF32x/megujKhLhyZj5QPaaUISWhq
         Mc8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=hmvK9R9E09Fx6OSvVbAGm4GEl0DxBx1emhyImrOKsZI=;
        b=unlBaNUKcE2Sjj2+YuQdgppi7C0zNVDAuY7HODi1SI8Gqk7S4visnXtry+OYE5UToA
         FmIwHGVCm1i8QULYNrA2VzJwsP/mPnWLiwS3ahsTMAPuSOiPFoO59LG0D2Bv58kjoeY+
         Imx7qj+9GzGFftCf5qR4Wpl29n9v9WbJc/6snYYHJu4AJuuuFo8mrJ30YxpPHs0+ivu5
         p7Ot8xpmBWSqgWX7ajP2DtWEcR/4gmjKcszEg7bkKKTNarVSkkylTgJi/UtKbTPKNFx3
         QTjjs7/u4kc1SG1lTqiPrhqG/dinfzU5T1BplCN11wmzVLcRzaNYwLUQVmoPUR/LsQ7m
         AMUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KTDR+Jhr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bk30-20020a05620a1a1e00b0074e2c7ca9besi5816212qkb.432.2023.04.23.12.03.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Apr 2023 12:03:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KTDR+Jhr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pqex4-00009P-SQ; Sun, 23 Apr 2023 15:00:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewp-0008SS-E9
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:35 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pqewm-0004Lv-S0
 for qemu-arm@nongnu.org; Sun, 23 Apr 2023 15:00:31 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-3f178da21b2so37711695e9.1
 for <qemu-arm@nongnu.org>; Sun, 23 Apr 2023 12:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682276427; x=1684868427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hmvK9R9E09Fx6OSvVbAGm4GEl0DxBx1emhyImrOKsZI=;
 b=KTDR+JhrpvxrK8r0lzdey+EheYvaA4v69+tzGboeLsxwPfqWwMKh16EkM8Q9kSnJA4
 0Al57bx2cgiSDxfxxdBKRooMATTWatnHoZsE3axZ/wI+4TM3+Ra3K2b5UCBf3M4ixwJ6
 wAmBPxLki4koNi7LF4uC+Oh2h41TTJUqjutSTH3AruEpNlGU/bZvOJu4IWiJYFFtvmrE
 IWV7m/w+IuA+6AwO6ljy1wZXlN+zFxvM3dPOavAg0RA+2D62vB/rffv90VI6Li62jk+f
 uKHW6Bojo3Y2nXN9hynlAFIuP2kF3FHM0R+/H4S+qUJhn5qW6+bDY0HpnlNA6dsZkGAu
 /vCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682276427; x=1684868427;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hmvK9R9E09Fx6OSvVbAGm4GEl0DxBx1emhyImrOKsZI=;
 b=MCQ44z/Fuy5g91C67+04PaqCe92qAJtK114whdhw+/ROarH6z49xxhNqlh4EQpeo1F
 RIh/OGlcCnh09PRBUuXWUBLxMP2qcQlVn4S8Uh2eaU9yUn/9M/OgALJpAeEsli1/4VYV
 KgSQJHO/00+nUuJrgr72wgrpB+bklRnquEy8aJ4j7pRTYhMI+6W8bv9daJ33VJK4DOJG
 aIdqFI+DocrUgSXHIRu4YekFN55Ys/OillM+X6JIgcwvsDON1aETlJ+yqz7Tes67AscU
 ph5Sp4Xhq7yC+rxjYI7K2SjcHZMD5qsWxbhnBr6GVd3aArdS7V3Kn51gkicN29U/jXO/
 DMbw==
X-Gm-Message-State: AAQBX9cl8R+A1O6LpwyxqiLxIxHoq+h6/76LgYnpk+S92r40ZrgnXpz+
 y+hijWXu9/auVLigft/xU70W7g==
X-Received: by 2002:a7b:c3d2:0:b0:3f0:8034:f77e with SMTP id
 t18-20020a7bc3d2000000b003f08034f77emr6137048wmj.20.1682276426998; 
 Sun, 23 Apr 2023 12:00:26 -0700 (PDT)
Received: from [192.168.109.175] (119.red-88-28-13.dynamicip.rima-tde.net.
 [88.28.13.119]) by smtp.gmail.com with ESMTPSA id
 i40-20020a05600c4b2800b003ee6aa4e6a9sm13572503wmp.5.2023.04.23.12.00.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Apr 2023 12:00:26 -0700 (PDT)
Message-ID: <16091804-4074-698a-3ee1-9c3ba09b6729@linaro.org>
Date: Sun, 23 Apr 2023 20:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 28/54] tcg/riscv: Rationalize args to
 tcg_out_qemu_{ld,st}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-29-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-29-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.143,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: EqCp7+J6j93b

On 11/4/23 03:04, Richard Henderson wrote:
> Interpret the variable argument placement in the caller.
> Mark the argument registers const, because they must be passed to
> add_qemu_ldst_label unmodified.
> 
> Pass data_type instead of is64 -- there are several places where
> we already convert back from bool to type.  Clean things up by
> using type throughout.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/riscv/tcg-target.c.inc | 68 +++++++++++++++-----------------------
>   1 file changed, 26 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

