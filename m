Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1797094njk;
        Thu, 19 Dec 2024 09:10:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVLs5IW1Ib3CWGOA43hQBUZE8NY6C+OOqBfinFLS0MSr/gFxEMR78yZ8jss3E+tBzzc4261HgbW8OXMEA==@linaro.org
X-Google-Smtp-Source: AGHT+IFeHabeklEtQ83LX0lurmBWfWs6yIhNZ9fbCr0U/nRmvh1JAPvgtWq9aU8SFypvyLrhfUkx
X-Received: by 2002:a05:6000:1faa:b0:385:f138:97ac with SMTP id ffacd0b85a97d-38a1a1f9e0emr3403012f8f.1.1734628250069;
        Thu, 19 Dec 2024 09:10:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734628250; cv=none;
        d=google.com; s=arc-20240605;
        b=Q92LMG3WtZodRNVNgupZ3Z9pBxqgvyuS5yRQUvG1IgQlKWdC8CEpJwGoF/i/e+VBsY
         cWZUKmv7eQPBjHUo9tNaHG2kpMg0oTjB0i10DxOwBwrTR9k7bkSK6siAkCeJwqZr1tw+
         MdN7fiBBA1uih9Gr4lBP+pWTwMe+JCr32gnCihcrYg+K6ImyEWyhQDSYTvhCs3SZFo1p
         Jv7X3+pudZiTYAumQQIv9Sz3dwsvihAvvd5ldIzYQz5yjtzWjMQFSWmPZPHpIpVwIbHD
         chqz4abKuLExF++DJMihx+zaMJD+C8QPVkIn08Z1BLLnmaOWJaAGw0mRkRB6eEKm34wu
         8u2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+TYAukc6iRRNb5sOg0qlc1adS4Tt4NhRkMzPKG6l1i8=;
        fh=TODwp5qsgFVu2hEbO98dN3OfvKuRWQ38Ctt+yTnXdr4=;
        b=XG+buHd/qpOpG49BRfrzTk3Pgu7ZJkwq01wxAIQWx5chMyHGArrS1fq531Wkr12N8W
         bz5Hk57fvKtN9I6Z73QgxrEMyIptqB0v8SWpb6Bgkl6T0oZfPuNFRBBbFIO8PO1izmIf
         af17FZmxchI6H4IvrgoDU6X3eTbHiMTcTTir/JMVYZHWrupHozqQrfuy3aV3IAlO8fwN
         SB9F7DK8J4Bs31X538zToRPdn/xPu3/iE4U9G9n2wV62SM2hjnID0qk/W1WqHGCOAP/D
         7rugI/3CBhWmKSxTDKVBPLtF3gTzEXfzEqHihL21KHlkKRFyqFeoYhOdd07qL8OXnqS1
         oGdQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tJvbTP/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38a1c828eb2si1239470f8f.189.2024.12.19.09.10.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2024 09:10:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="tJvbTP/g";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tOK2l-0006PS-PB; Thu, 19 Dec 2024 12:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOK2k-0006P9-Lc
 for qemu-arm@nongnu.org; Thu, 19 Dec 2024 12:10:34 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tOK2j-0005TJ-3M
 for qemu-arm@nongnu.org; Thu, 19 Dec 2024 12:10:34 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43626213fffso13763935e9.1
 for <qemu-arm@nongnu.org>; Thu, 19 Dec 2024 09:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734628231; x=1735233031; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+TYAukc6iRRNb5sOg0qlc1adS4Tt4NhRkMzPKG6l1i8=;
 b=tJvbTP/gbQwHQrVxMGkLL18egxo/sNN8EMz7F5gWuo3zvuYUTTMtIbGrP0ae6WRZAi
 v5kZD9+14k21STd3GJCmdXRFw28qJ4AJ+WHLD2tEVAe+1RJ2v9OhV8ztf4fntLiblmbJ
 +znnUpDnX6c0eqhcMX5XVtj9t3/Th3tKfBsN8wXA4UiBAbiZYMLYE5hL5tRRYYW3Oxu7
 Ll2mclkZNSpPn6CPPHtVAcZc5S7nXcT+dExxsn8J4Lm6WOkkPO8QiA/O2MKFiwWIQ7bl
 bHrg9CeCwcBSxk75/P8uDOe6QUlOB8yLFhBwRTRGiXED8DrwTtePzawlB64KwNaqogWM
 F9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734628231; x=1735233031;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+TYAukc6iRRNb5sOg0qlc1adS4Tt4NhRkMzPKG6l1i8=;
 b=tWXdyGbYtpUNCLYTyYb36EvAAaUm/7BRZKiIf+79lcS12/29kz7Iz+Iac7SHAv/hal
 CU5WjsrqmRf6UyT9yWBWbUJiA2kqhrF7b9B9NbZbf63mMHe8vd9pOn1Y7D/7LY+EZXIJ
 hzCqRz0p3Bc+gvHTCKDGuntp2U8ajnZR3jotNMYvjBlrGLpZB0MburJXesjzw9GMyDe7
 JXWNAocqRm5gT/gaT3tgYD4veTZEYCeA9I0kvYKibmNhCV1O2MRA/6JxYvTC8wV66b+m
 UuiCUb8dykv+25ueidF+/4ePgi/2ISBESgiL6WXfxhhC19EQDx28mvFUV/f5RhVpzBPc
 5bcA==
X-Gm-Message-State: AOJu0YxRwvGgAraLN5CBRRlEa8IhnWgiLxnV5bhSkH+yo9jdi8o/wNYa
 PAp0Tc/kl4+RoOdQszRC2tzj1FrffxwsiVVehjUp98Ay8jC6ci9E+rmNpRUZ91w=
X-Gm-Gg: ASbGncsQrfIjd4un2ZZCbUFNrG4FzEF7Y61w8XN6ssRWMARXeNG70Kc3Dqi4sjvYJdk
 f7xVGqZFaanqJ2049y2HtK6BaWWH1B5r2Zmzw8TrLIYzup4lhS+o802ezaPkJ44r/FjP9SlOWci
 UP2iDif28V6v79wHT5BiFk4KNES50PrDh/J89zHXC9rBFBgx8SMVNXqoBKb3p/ByPr/5f3h+6mf
 fv9wn4zC3W0XQdgtl7OlKTXywaxWSoEmMZTQ6Vq+A2yvbzjQbKKqjfDOdi/mUQh9mbL5Nc=
X-Received: by 2002:adf:9783:0:b0:385:fa30:4f87 with SMTP id
 ffacd0b85a97d-38a1a184845mr3257070f8f.0.1734628231449; 
 Thu, 19 Dec 2024 09:10:31 -0800 (PST)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c89e140sm2006748f8f.79.2024.12.19.09.10.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 09:10:30 -0800 (PST)
Message-ID: <bcb5e1b3-dccc-41a7-ae50-ba7ef6a302a8@linaro.org>
Date: Thu, 19 Dec 2024 18:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/tcg: Declare cpu_loop_exit_requested() in
 'exec/cpu-common.h'
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>
References: <20241217140648.98538-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241217140648.98538-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: DPfmStk/I/SQ

On 17/12/24 15:06, Philippe Mathieu-Daudé wrote:
> Move cpu_loop_exit_requested() declaration to "exec/cpu-common.h",
> along with the related cpu_loop_exit_noexc(), cpu_loop_exit(),
> cpu_loop_exit_atomic() and cpu_loop_exit_restore() methods.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Based-on: <20241212185341.2857-19-philmd@linaro.org>
> ---
>   include/exec/cpu-common.h     | 18 ++++++++++++++++++
>   include/exec/exec-all.h       | 17 -----------------
>   accel/tcg/cpu-exec.c          |  2 +-
>   target/arm/tcg/helper-a64.c   |  1 +
>   target/s390x/tcg/mem_helper.c |  1 +
>   5 files changed, 21 insertions(+), 18 deletions(-)

Patch queued.

