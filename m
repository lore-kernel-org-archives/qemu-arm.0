Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp186394ejv;
        Thu, 11 Apr 2024 14:13:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUCQeXde7e7jSi/ep37jdeii4042vxJh4OQDKJqjlkZHU28YahkJKYlXsAGJzClMHafBc3IT74Teo0TjK/Z4lCQSoz4YDi9
X-Google-Smtp-Source: AGHT+IFhxhe73man7cc8aOZkIPaQVzW3Glc+MfJBdeXcxce/LI25wqB19/CVf/16DpzP9d2KkJxs
X-Received: by 2002:ac8:5982:0:b0:435:ad5a:73a7 with SMTP id e2-20020ac85982000000b00435ad5a73a7mr864867qte.8.1712869996530;
        Thu, 11 Apr 2024 14:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712869996; cv=none;
        d=google.com; s=arc-20160816;
        b=iJ4vsB3CzjxoSfVSxz0mi/BkM7TMojgGNOfPhbAOGm7AGnq8Xj9v5oCixgPsfaEnw7
         T+frdYFuYpD7nFLz+76K8ryaKNst8odUaht2PO6/KXjBGS8ao90IKM58/kI24pGi1MUJ
         jScNLopaBZzwun08/ZwLfLBzQDguvTqU2keM7rFPWXll8BcnsRXp9LwftvX3VXFU02ro
         CJmIQNQBiQzzDS9V8SSyhoFXbwsro5XASePSKSbb5Ue/tc9Ys9rT8UXDriNU4gDmY1pl
         k9iXkcgyy1VQ7014GDu+l/ZlTtRPx8rvJbKNPeBotxoPBroTcMdWVPZUvDrUz3vzQGhT
         k+IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=IO5y9BOeUpOg4opmprf8Wn9TVP+GesVv+Rv2EFnHtxk=;
        fh=rEop8K2G1w45ghgJI3cjy+KZanBRmFC0AmD3MP2pFqc=;
        b=OodYdcw7CT4UDSegJxMOFZoLchtnKCOIK+jN6W14bVsW5i6RXAtJgSP0bs6AtQQLbe
         vv30UDBCpsMN80KlMw6K3O+aCAJL9vhzCKVdpdMuTBoqc7RgO2tABVkmmtq2HRtlNoZ7
         yWeDoqdGcoPaJJHxB9fCgYLVEMtkrmATmDtljuJYDtv9yEidEP9oRlRMiI3YAhxU5psH
         Im6Ypk25PUA25t9SO9rqFXu1NXzlrE2MTbG2OUmLmLgAPXYNDJnq9vYA5rZiBlHka30O
         uc37dZI6ClUmaV+Ya94eoP4qqd5PyZew7R3mMidCxTKj46+nCvNZ8Xe6YlEX+7MYp67r
         UGTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fjCOknDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020a05622a00d500b0043686a93369si367269qtw.234.2024.04.11.14.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Apr 2024 14:13:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fjCOknDD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rv1j5-0004vh-DX; Thu, 11 Apr 2024 17:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1j4-0004vF-Dd
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:12:54 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rv1j1-0000QD-R5
 for qemu-arm@nongnu.org; Thu, 11 Apr 2024 17:12:54 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6ed627829e6so300366b3a.1
 for <qemu-arm@nongnu.org>; Thu, 11 Apr 2024 14:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712869970; x=1713474770; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IO5y9BOeUpOg4opmprf8Wn9TVP+GesVv+Rv2EFnHtxk=;
 b=fjCOknDD4ZqJRoU0VK9WzgFAQ/+C4Jj/JMAg/hhLPbProEzERuS0v8WWMNmdrqK7p6
 tkKrEr2XbNCFhxjiLJn4GDme6SQtoFVUKSESa3H8fflFv9pnFEipD5/P+uGG76e/fiNt
 mcCNFXSGFAgSy/Q2l90MN6qB+G8ZT/9k4YTeHffO0Aez0kmMkmruH9VYX8mejNI04yn/
 fSH8nBvXP9XERxTd94gtmE0kznh/fAtXyk3o6LquJbSs/QvqeUrJ++T+62zWYOPu85P1
 M/rE2Y8XrY3IOKEPljocKWF9Z99fG9w7ai14n0aNMAJaWVXoCdw0Vj6S0NrjTDmTMNDp
 za/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712869970; x=1713474770;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IO5y9BOeUpOg4opmprf8Wn9TVP+GesVv+Rv2EFnHtxk=;
 b=w0eIpX2DbZG4ZcEchHAg3LCCZu33SZX9NenPhhDxsJBhjuTV3iDeWyv+X6KkZv2hvl
 NB9GLXKJUj+4eV7rIAdYuUR5tNHy1Zhhh/0HC4WoJKg3fPTFi/hQHa94mYmC9+J5Mvmm
 oYZ0RjVHix/mnL+jQcvhXHSe5Yv1CpR7UUM2FqQ40V/pyalXx0g3c9sLApg/6jpVG7af
 uQfK24WPQgn++88z8QXhgnZ8EM5lHcTwWWJ5mUuRImAizNPrmdDGdjl1EToRNuU16sLm
 vrg0m7HcxLx8eCUDHHfBzBv3eCLD23Ao7AYfJvqMPXv4Au5yzIlWinU0jStXPS/s+oDq
 68zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVthdXjXoxO5U867pBQMLLdOHSqHPa2/SWcNvn2SNUqDgZwgsEMrB7W1Qd1EfNQQwdFXNIa93NONGaxy/jZd06dIbHm
X-Gm-Message-State: AOJu0YzKeUjQ8Yvmh3pIQwJByJ5rqq3LY39DJeV6YmnBSjcsG1j2qbBQ
 Ic3QzFpy94KLcahA1UET2AMUxB2e3JxY83tV3Fnd/SzvNgVfHSbzGVlwfwSsYw8=
X-Received: by 2002:a05:6a00:399d:b0:6ea:c2c7:5d6a with SMTP id
 fi29-20020a056a00399d00b006eac2c75d6amr1158217pfb.2.1712869970227; 
 Thu, 11 Apr 2024 14:12:50 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
 by smtp.gmail.com with ESMTPSA id
 z128-20020a626586000000b006ed9d839c4csm1677534pfb.4.2024.04.11.14.12.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Apr 2024 14:12:49 -0700 (PDT)
Message-ID: <3b100155-89e7-4229-8c76-4b1b428225f3@linaro.org>
Date: Thu, 11 Apr 2024 14:12:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/9] disas/riscv: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <Alistair.Francis@wdc.com>
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411104340.6617-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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
X-TUID: 8oF96ZpafYZx

On 4/11/24 03:43, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   disas/riscv.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)

Ug.  Repeated strlen+strncat?
All of format_inst should be rewritten, probably using GString.


r~
