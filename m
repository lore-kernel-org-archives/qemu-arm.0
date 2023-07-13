Received: by 2002:a05:7022:629e:b0:68:46be:293d with SMTP id e30csp2850099dle;
        Thu, 13 Jul 2023 11:31:40 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEm4AygyazUQ/UDai9JuFVDp2Y3v3M9YvyBRnYa95iGlvyjqvcW8lS8bmKgFm6E+WL6yFCw
X-Received: by 2002:a37:ab02:0:b0:75b:23a1:366f with SMTP id u2-20020a37ab02000000b0075b23a1366fmr1929614qke.48.1689273099792;
        Thu, 13 Jul 2023 11:31:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689273099; cv=none;
        d=google.com; s=arc-20160816;
        b=kDVgVLM5Pxd5mHb4d7oeH31u1hy3PINanrKbM320w1gUF28eW5uWbPC6LaC05RPoY5
         +Ymfrydx0GHLVkmUZuma4m0x+GZxj0p+mBGrq60VeIMtHGgh21sWP1r10FasqxFZPzav
         HjxYLwN6DWLBg+8I5UlEb1PvsBUHwy8IOjROFa51AAGxJfmzjP3I27Tfqqam6wlukog7
         auqikSFAPVFLqT7EZ7IlrmSsxJPJraAZySyj7DCgVq1p1ib7CwuXyOZ2vvwumg7DAtdW
         bA5cQ63TrexUUs4ri8O9v6dcbSiTGyv2Yxi3U09AnNIloEShPuWCY2Okw75gkv4RI8va
         o9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=iM6iGb0VSXlSYidrU73fgZKyui1oYUgUqirpIs+TBmY=;
        fh=8BOuv7eAieu8uJPT09bTs8lQLOGBrEJe6CvImfJ4rQ0=;
        b=S2j1Y6yMoVjr3vQF2iwijCj7T4uDcY9H/M2/WyyvYTKPS9boZYaeGzZl6hlpt6meUs
         Ept8PMxlSz5B/xLCruUe+GjChpSQ4erTSbBGaLiEZT4jtVXw3hRRCAQtmRQ/hXC+63yI
         IIzXVIUnkkWWcsrl/o7ZEf0i7vggO/hGKgqnK+axoCC+LwrXh6vy5R5KQG9fhoSzcbE9
         irNc42Yrto6ayhKQOjLUA0RhcPdiZH9wMj3mF1rJg4OPZpDgD6xKOAASHlG5tN6wc+E1
         FtkrH3a/A5Fk3CrIFJgHjXqSGVxKGSs7eXQoKeVc70iQqzOynlfUq1EbAqBK0dMqRVjb
         yobg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEzmKowv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9-20020ae9f449000000b0075eb8ba0abfsi3345741qkl.584.2023.07.13.11.31.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jul 2023 11:31:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EEzmKowv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qK16B-0000Pm-Sz; Thu, 13 Jul 2023 14:31:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qK169-0000PV-PB
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 14:31:29 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qK167-0007wf-9L
 for qemu-arm@nongnu.org; Thu, 13 Jul 2023 14:31:28 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-5776312eaddso9860917b3.3
 for <qemu-arm@nongnu.org>; Thu, 13 Jul 2023 11:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689273085; x=1691865085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iM6iGb0VSXlSYidrU73fgZKyui1oYUgUqirpIs+TBmY=;
 b=EEzmKowvzYAU7uJ+ZjUyLexY90DCdQubm2uhbpxl9CJy4TgATy7mlkTGcGfGwAzFTY
 SfOhhmY6ili3HQirmSfvZggPVpxZ5f2sXn+uX4Vhuxsc1m/AxN66KMdWMrC0ApkZuNwF
 Ew21LyK4HG7P9hc0yv17OMiJpNt8Azqfxg9f6eGxig/pnPpEnw6Y92C3SGjFCy7rfJY5
 qjMC99eHdQJA5UqLAxMqHrZXZMgcbt+8mZqWKNdCSE0QL+EFwnH/C5gcCAAW3ThuOfKD
 b9J0htEuP4p5dkmBp2qhaJ2fiQ8bLOaWLkBivQwc8sEYUTp1Gc8wxmeFTrwGo2C2cztt
 0avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689273085; x=1691865085;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iM6iGb0VSXlSYidrU73fgZKyui1oYUgUqirpIs+TBmY=;
 b=XY8b+dQpa4HQk79nZhkAryrgwipooRolz10qGOFY9wul1P4FTaY87sM1JLpLmcXLU3
 PVa4C4J5D4yKE0mg9YhBqGPll9UUe5ZkU4eoL2P8Fpaa9uFo/EAMOvaREnt7X00LL06J
 KeFCxbl8RYDLvD1FLLwbapJo2Dm3pH7WT0Gflvo2+kbMAwxi2ER3EvZKcJxVDAWFXfB3
 7qy+ZPhbtLWmqnMSGCA+hBjtqRjmF211cXq1SI4WyQUUEwH5jk4LzPCc1Bq1AAI5QO/2
 2j+Ia8wF6gozSeYd1rGjQuywTut6laVsFIRlTgYlzVYjEa9ZHDAFx94hZ3yZhZ0tSt+M
 o+BA==
X-Gm-Message-State: ABy/qLYdkysY9T45ye2YU9KCih3oyww1T2iNfpOV4bejmmIYA7QsH2R7
 oN8b06PDusmXsp0TwwXAqv20Cg==
X-Received: by 2002:a0d:c1c2:0:b0:577:bc0:2d55 with SMTP id
 c185-20020a0dc1c2000000b005770bc02d55mr2846453ywd.33.1689273084971; 
 Thu, 13 Jul 2023 11:31:24 -0700 (PDT)
Received: from [192.168.88.227] ([172.58.139.107])
 by smtp.gmail.com with ESMTPSA id
 v72-20020a81484b000000b00569ff2d94f6sm1891030ywa.19.2023.07.13.11.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 11:31:24 -0700 (PDT)
Message-ID: <fa2d89b7-8bfa-997a-dcf3-75fdb2ad3b46@linaro.org>
Date: Thu, 13 Jul 2023 19:31:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH for-8.1 3/3] target/arm/ptw.c: Account for FEAT_RME when
 applying {N}SW,SA bits
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20230710152130.3928330-1-peter.maydell@linaro.org>
 <20230710152130.3928330-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230710152130.3928330-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=richard.henderson@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.096,
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uwVEOZy4R1xO

On 7/10/23 16:21, Peter Maydell wrote:
> In get_phys_addr_twostage() the code that applies the effects of
> VSTCR.{SA,SW} and VTCR.{NSA,NSW} only updates result->f.attrs.secure.
> Now we also have f.attrs.space for FEAT_RME, we need to keep the two
> in sync.
> 
> These bits only have an effect for Secure space translations, not
> for Root, so use the input in_space field to determine whether to
> apply them rather than the input is_secure. This doesn't actually
> make a difference because Root translations are never two-stage,
> but it's a little clearer.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I noticed this while reading through the ptw code...
> ---
>   target/arm/ptw.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
