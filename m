Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1010688lfm;
        Fri, 19 Jun 2020 15:42:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOqKQ1QBJVYC0jM/isp4uEJzSPJtt9uq2ESaCJRQzMJPED6d+Em/19vz4a/0ous2vzYTg1
X-Received: by 2002:a25:7ac5:: with SMTP id v188mr9945085ybc.237.1592606568612;
        Fri, 19 Jun 2020 15:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592606568; cv=none;
        d=google.com; s=arc-20160816;
        b=LtsUe58J41WcWOq+IF6gFfds5TYyta1eU7Tuh8htJL9OlpRomcNdfzh7Yq3p87AAHt
         6P8ek3VGnTKDS9AQ4hf4a1V7uH6E8aM1ZpyENdPV/GXPO/xWW+7UlBJzE8WdXmiPSf+i
         a4E8M1V7Ku2mzoGaBo5p+nopNfPQ6AaTSAFWJXlwQAqv2JmGNHiZ771xaeuv0HQKI53D
         obTvNjaO8gV4YYOclrPHcGanRo9CHjjsBrJsq6ZVs+a4M2nbMqC8SZxrbbazgVu3hJBT
         CH0aF9e5JKegDHxY1SKzYXTE24tzgFFOX19uQKFLUdGVQXwwHJqreVTGaEkpYR2yVnCV
         MvxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=OZkbslW/VWfc47vVxvNtc4rLvveYgyUlE6+otFgqMDQ=;
        b=BHOqU8kUOyieiCp+fjSo99sL425VfYfjROWrWst99S5vSKJA95FxLvDLDMMjxjjCvx
         A4ZzuiqZbgD/edcmG7yowqB2ytQvCkTCsRg8s7RYAxUxilyroHFqQ7GyT8JhjutnCz3A
         E0dZWZQtYeglEilXMPLtCh7xoDXJID0q4Y8Pn6V69abiVXbrKmFAIXMXDjPzxkR/dHJF
         pDVOABZU2OMxJ7P8g5szqV94AQfYWcipv9tXQ3zrftER1NQFbbJs60txCZ6wJr+qy3yT
         qFFRTM8lZd9Ij5HLFSAQ6KplCG9PPZLAb4aM3gooqFA2TFVqKUMDGN85cLmGwPUtP5gW
         KvdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=un3NuQLF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a9si6257522ybo.146.2020.06.19.15.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 15:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=un3NuQLF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmPii-0001PU-0X
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 18:42:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPia-0001PH-5h
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 18:42:40 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:44327)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jmPiY-0001Li-EU
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 18:42:39 -0400
Received: by mail-pf1-x443.google.com with SMTP id 64so5069437pfv.11
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 15:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=OZkbslW/VWfc47vVxvNtc4rLvveYgyUlE6+otFgqMDQ=;
 b=un3NuQLFhgTKB5/hzHU3YHyCCj2u0oiT8bKg9Hsly2WIB3qYdyFymAEAUD/DYfkVxD
 D7SAb/Fxo+oW1gcbxtnASDr6e8XjWLtFGWI/Xdi/yq7KtWz1ACV8WM2UNtB9m4Pd0kmy
 cYj6nngfyHYJoyU0D5j2EdpMpgPJ8ZO/AG4KwASwb0dTsuu0d+poIUdjBJptaBNpQdQW
 xvOjXVz69F7ULOrJTNlehb1emPIgjvkg0FP+6v9xk6EZOS0GVvTRgFdfyPKy8JZSxbSh
 xNCOcHrV9bmc0QU3/xstOFHySY5nj86zNWfabHpJELGn0RtPAOwNSdywUyJK8gtL9abH
 HZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=OZkbslW/VWfc47vVxvNtc4rLvveYgyUlE6+otFgqMDQ=;
 b=MCxsYVCTiYgRQKBAkmP7gXCVORkcwnI1N96BQtNlrdk/jI8gM11Ty3mZaTzbz7HbY3
 HhDT2gn/t4Liu2iV96bdG2hCFFMZ3UmROWFNWWsyMXoD41e9U+JWo3HcYPKDSS7e6RT4
 k2URwZLPpgcQmVFkU+zVCLQn8Hka40y/CfbUZF1DbX89KKhvjiqgqGTQvPSCyUSv0D3A
 6Of3ODhxrTDwkf209ks0hoiCYj9slurLwHnBXgUPee8Z2Jo2PkLJdu3PLA0hMglrTRKF
 fHHpMxdsLcRN1XwerYNZr+OCXB0TUV5KM4fgAKJSMQFj5udc01VqV1kbQaOXN2e+PNVQ
 cXNw==
X-Gm-Message-State: AOAM533FmErFkCMX6NyEVPXNb2M2aW7lAhORvWEhcsT4WnQNwjdTwSAH
 iLvFKzeuZh2Q2Gv/0Tdjqi9JCQ==
X-Received: by 2002:a63:ca4a:: with SMTP id o10mr4609035pgi.182.1592606556828; 
 Fri, 19 Jun 2020 15:42:36 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id n9sm6257402pjj.23.2020.06.19.15.42.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jun 2020 15:42:36 -0700 (PDT)
Subject: Re: [PATCH 02/21] target/arm: Convert Neon 2-reg-misc pairwise ops to
 decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200616170844.13318-1-peter.maydell@linaro.org>
 <20200616170844.13318-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <acea6be7-496d-846a-01c4-49348d73a179@linaro.org>
Date: Fri, 19 Jun 2020 15:42:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200616170844.13318-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::443;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x443.google.com
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
X-TUID: alrqcsnSOFa7

On 6/16/20 10:08 AM, Peter Maydell wrote:
> Convert the pairwise ops VPADDL and VPADAL in the 2-reg-misc grouping
> to decodetree.
> 
> At this point we can get rid of the weird CPU_V001 #define that was
> used to avoid having to explicitly list all the arguments being
> passed to some TCG gen/helper functions.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |   6 ++
>  target/arm/translate-neon.inc.c | 149 ++++++++++++++++++++++++++++++++
>  target/arm/translate.c          |  35 +-------
>  3 files changed, 157 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

