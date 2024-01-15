Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp161097ejf;
        Mon, 15 Jan 2024 03:07:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGfO401NYFOIP33zkVa4qeQc4n0zY48ZNNHa+wHM8wZ+Kqw+o3IBjl1HLk/y3cwvHCyZSi1
X-Received: by 2002:a05:6808:3991:b0:3bd:713b:b387 with SMTP id gq17-20020a056808399100b003bd713bb387mr5106995oib.108.1705316872008;
        Mon, 15 Jan 2024 03:07:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705316871; cv=none;
        d=google.com; s=arc-20160816;
        b=YQ4KYG1WlnHFTOIcwPqNx+J7bLRTJwSDWPvnz1hY8pMpfehM+WbDSJODplnLNkDZZ2
         VEy1STXFMnChjwaMt2JPxePe0+2JI11smEK44BMkUPwDgvFQT7fUzJuPBSqPQWz/NT/i
         cWAGjJoxLIYI8h5UnU4QLFcOh7zRsaaIxS7yAEUp8CmgnCJIqh2gVrfQBBM9+ypEfrb5
         X/+D3LgRl60vxpARkogaNFWvKcBzPwlcNlCQXv9rlmY1EpqoQhg/962OzM+VzVFq1UiK
         m/pbBfgqYlb8hT1ziY3jDejzk9nlwPJRLWm0V8E7lejEhiucer2anODxLj+t42OCTU5s
         WRfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=u6cH5JI99j+XuD/mPFxR7acGMdS3HNpIdGevZYpWF68=;
        fh=nLHOhEviyYy6h/2zlCcqpHDfF8ARiK1pd2irIviIf1c=;
        b=SrrugHzwL3l8mmWKUFaa2QZad6KWjeJVz5LI8JwKOrGLgSEjcujhVOzNdf+TwXA/CZ
         1Y/E3+Q1IENc9+FieEs+glBWEUGOnZQR3vaM5GSYLP7y3SRNU5lWRA8/6ocIMOwE32wW
         GP4Bge8vqaLB48byrd6WhqEzVNfOGnU7vsbKlf3qTzn4TSAHM59ZI2+mIX6SDH67r0WG
         jhnxLJn+CH8kTa8iQXw1J2atKL5zqN3ozJjVyukXPAeZ42MvyhEoihCHGL6Jum48iAKg
         ANLbCunuaX0GpsQF3+33VmIsNNa86KYut9eBwnK0zs9TVccqYSXb8SmZ/cTMBcZoAOnA
         Wjug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMTgzKNF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vm3-20020a05620a718300b007830f739e1csi7729491qkn.400.2024.01.15.03.07.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 03:07:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IMTgzKNF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPKoi-0006qm-Re; Mon, 15 Jan 2024 06:07:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rPKoh-0006qM-D6
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 06:07:43 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rPKof-0005QI-Qi
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 06:07:43 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-55818b733f7so7360356a12.3
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 03:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705316860; x=1705921660; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=u6cH5JI99j+XuD/mPFxR7acGMdS3HNpIdGevZYpWF68=;
 b=IMTgzKNFcof6E5z59ZC14JZW6Jrr4b8u8tkQQaHXY+KBNs8NE0a24hr7fFgLkTUOtT
 OMOsMccutYR32U5cK44/VWagiA1m5OM10C9ZbMn7NXZONRHKJnVN4pBHWV6ndAAxyX2z
 EANadr9LLDO6d/Y7rIOcA0c7WpqjUuG9dhN6jQbvelngguIJ2ANVIqs3zj8vwOaAFHoP
 xTgXfVJwp1jdox9RnksSK+LEVKaXrZ0ITkSXkJqZkixnRbCwcwEYVYJzwubrMDnmupl+
 RcH8hcq9tfkoWmr/agNSQXJG3N3FvKOaoAj06jMhgn8ZpuFv1bdFS5j6lu6PgcmvgG8P
 BzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705316860; x=1705921660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=u6cH5JI99j+XuD/mPFxR7acGMdS3HNpIdGevZYpWF68=;
 b=aVlhur/niZGdWJ+GChSVd5bvfttjYwhHtvi0deb4ScFiUbZmGVGlzHvCUoCvGx3+da
 zZHnXjmd2syRB6kGM7WGJ2ie3ZVU+HP51A+g+rMF0/XiLVoaHKh7hXaaOzOO/6vNvEOZ
 WK5qjNIybMYeS/CK+g8pDI8V1b8usGnxlCp7/FwQxi7xYJj3N4zhhwQJNFmiGrHeR8Sn
 uD4VTHi1tkBTiaDNDi4K5ekwOGjR/TYe9NDIoNrtRGPQKoYzTLOj5ra624uxKgS//gOU
 how1sa0L7nVt+Ywga5Br/+6jmP3hBjihgfuiFU5CDjNLuHrIC7U2MrxrOJcO8v3kfoWs
 jDaA==
X-Gm-Message-State: AOJu0YzAtPSJ/BsmT5pYKIHLwgAxXldiyCEClfil5lQ4KyZGQKMsfN25
 lLHuGtSPzFMJlDq6glZJdL6GJZu/XV3lIPLEvPftoc1BS4U=
X-Received: by 2002:a17:907:c71b:b0:a2b:9580:c45d with SMTP id
 ty27-20020a170907c71b00b00a2b9580c45dmr3326110ejc.140.1705316860238; 
 Mon, 15 Jan 2024 03:07:40 -0800 (PST)
Received: from [192.168.1.102] ([176.187.209.30])
 by smtp.gmail.com with ESMTPSA id
 vs7-20020a170907a58700b00a2caa85c0c1sm4253888ejc.30.2024.01.15.03.07.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 03:07:39 -0800 (PST)
Message-ID: <0a9a1ae9-677d-445e-8171-6b3dccb8b25d@linaro.org>
Date: Mon, 15 Jan 2024 12:07:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/qtest/npcm7xx_watchdog_timer: Only test the corner
 cases by default
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org
References: <20240115070223.30178-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240115070223.30178-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: PPe9PAzXY8pI

On 15/1/24 08:02, Thomas Huth wrote:
> The test_prescaler() part in the npcm7xx_watchdog_timer test is quite
> repetive, testing all possible combinations of the WTCLK and WTIS
> bitfields. Since each test spins up a new instance of QEMU, this is
> rather an expensive test, especially on loaded host systems.
> For the normal quick test mode, it should be sufficient to test the
> corner settings of these fields (i.e. 0 and 3), so we can speed up
> this test in the default mode quite a bit.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qtest/npcm7xx_watchdog_timer-test.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Good idea.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


