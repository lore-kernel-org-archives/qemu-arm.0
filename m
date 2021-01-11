Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2862981lfq;
        Mon, 11 Jan 2021 09:37:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJze8NSaLSP93TlSSO6i5/CnpASG5o7E1uIOpP9Azi7rHfc23cU8dBg6SIZ92yvapV+uTitA
X-Received: by 2002:a25:843:: with SMTP id 64mr1111001ybi.421.1610386660547;
        Mon, 11 Jan 2021 09:37:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610386660; cv=none;
        d=google.com; s=arc-20160816;
        b=lCNV1P7NxmR62qiK+gZr8gd+wKbQ6hFGptQshSDk9CIqITqUY7jIeG+DJCJbj7BawE
         mVEj+MOB5w5lePEftKEfQlRg1R+NHwYrqJlaflY1G+v5mHmZZaZInuPQzsx69QHH/wPO
         HMEhCN5D+URtDP+N8z2beK7WKByTNVtaIy8dXDv4MWw7xewHgWBXsmRbKQmnQ2dUf6rS
         Q26HBUqxB0R0nhi8tu6UrtqvYjQcqx6bCzXEA5uOjl7a+u6RaHiRwcljYCEpSK3v9FlP
         bjJ6eQB7qN+rKn1HnxV9SwR5ajz+bvIknhrxOgDiUtcvVVykOYkqRRi9LRaHkK/8ZGbH
         Y2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KcBBYyRIsubFJ5K7YVoag2+OIR54LyMij+S3tqSg3SU=;
        b=0X3V2IZg26q4A06IVjpdB0MCxxRpjrbJwy2Q3875nKKPVegBOAZYHrP4CzF8VwP90I
         Ut4HS+z2yTFBCGPTcjZG7koOXn1Jw1LfX8W5v5CNBaz4Na4A65qXHefjZxUBxOX1rdwv
         vVmchh9mz3eFuMTB9N6rSYIJrIgjriIogmK9tqeepqvTk1IhpIwcFqE1NJaP0z0zMGzj
         KM1pvo+mydTeC4ck+G5S3XT+DY2n6ZumR3noVgl89EzuBW3zFlWdR+kN4ThDAGadq9di
         rrKSs34OrX0aL9DX9ei8fkmaL5l2hrF5tpiRj+/yDmYUHpiGyXVOYHTYWPNHZzn4wF2k
         CM8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ass7ItIg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f8si401300ybp.195.2021.01.11.09.37.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 09:37:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ass7ItIg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kz18N-00031W-Ti
	for alex.bennee@linaro.org; Mon, 11 Jan 2021 12:37:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0uE-00056b-C9
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 12:23:02 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:41821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0uB-0000nx-LE
 for qemu-arm@nongnu.org; Mon, 11 Jan 2021 12:23:01 -0500
Received: by mail-pf1-x42b.google.com with SMTP id q20so314635pfu.8
 for <qemu-arm@nongnu.org>; Mon, 11 Jan 2021 09:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KcBBYyRIsubFJ5K7YVoag2+OIR54LyMij+S3tqSg3SU=;
 b=Ass7ItIgdyqkDHQpekFD7Pdvu8l5Lc8O3Aj7ZjiXf8uVKZQhMM+311Wx84fd7Mm5rY
 VWSJBdvVkvg9ZpXQIIOSTngKPOwdyFUR17oWDe1hDYEF59L291wQ3sZ4eN6fil+N5V03
 xqMTjozaCEWuKyqTYmJGsL8rl9OnY1oBG4ugG3ku17Sj5XlRL/fRP64xvfrj3myHZ0z3
 cSMnycpq+XOyuYWmFPtsL78SfefCn9Bh6wykm/r3fY8YNsPFFBMoK6RT1D5YFZS/TbrZ
 t5MlNk5zKBvYkfBs+X+ByPuzoq+/FX0bVC2TG5NAFJ2tekOJrSzbYSv3Kh9NrUO8r54+
 PE/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KcBBYyRIsubFJ5K7YVoag2+OIR54LyMij+S3tqSg3SU=;
 b=m/Re5ySnjFOo64PLl/TTAT5X61J2dPUAfTvv9VQs6SAS8ArDAopqT43Ylgykac98Qe
 lnNoCtGY+koEpAXtNbMTQawlveZ83ZQD5H87bP3N055QR2aaNo8sE0LeuUI/4m9gWQ/E
 F9f6/Kr144P9T+VPBMVpFsqjCsBNMPw98U1z+VZDIkprSCMBMhXDji8Aa9dH8UnhAZu/
 7BKdMM5ymlyyzv7eW7QF6dd/TMUVyNcJDnBaYQtES+gzcNmQG3OxSFjv9tF/GSCwsb+y
 HiR2Oyy7hyIqec3jXF33XxJRwhOOEiZt2pbijrpz8LKr/ktaeIpyXgX3aAj75ti6Ix1B
 w2xA==
X-Gm-Message-State: AOAM531gYiOB5KVgBIugR9/yzx4Q7F37wyurMgsyK/XjnBS73JPiTmub
 r0PbqnsIK1cWcwUKrXGElNm/MQ==
X-Received: by 2002:aa7:95a4:0:b029:19e:abd2:4a88 with SMTP id
 a4-20020aa795a40000b029019eabd24a88mr432060pfk.2.1610385778087; 
 Mon, 11 Jan 2021 09:22:58 -0800 (PST)
Received: from [10.25.18.119] (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v19sm86080pjg.50.2021.01.11.09.22.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 09:22:56 -0800 (PST)
Subject: Re: [PATCH 0/5] tcg: Restrict tcg_out_op() to arrays of
 TCG_MAX_OP_ARGS elements
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210111150114.1415930-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <43f360be-af44-27ce-619b-7a2ad169aa2f@linaro.org>
Date: Mon, 11 Jan 2021 07:22:52 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210111150114.1415930-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-riscv@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Huacai Chen <chenhuacai@kernel.org>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrzej Zaborowski <balrogg@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EFhZhkhLvD7v

On 1/11/21 5:01 AM, Philippe Mathieu-Daudé wrote:
> Attempt to fix the warning reported by Miroslav using GCC 10:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg771520.html
> 
> Philippe Mathieu-Daudé (5):
>   tcg/arm: Hoist common argument loads in tcg_out_op()
>   tcg/ppc: Hoist common argument loads in tcg_out_op()
>   tcg/s390: Hoist common argument loads in tcg_out_op()
>   tcg: Restrict tcg_out_op() to arrays of TCG_MAX_OP_ARGS elements
>   tcg: Restrict tcg_out_vec_op() to arrays of TCG_MAX_OP_ARGS elements

I've been trying to figure out a cleaner way to handle these, but this is
certainly ok for now, and avoids the Werror.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Will queue to tcg-next.

r~
