Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1594813njf;
        Tue, 3 Sep 2024 14:29:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1v3FrNVou4yRBSjZx1RCt2hJJ5obiB9CaB+KedQaUytS/Z4Z3KMfYiSyE06pOVuX3O9QR7X3kLrdnJg==@linaro.org
X-Google-Smtp-Source: AGHT+IE4joQYUhqL5qfqt5dRjWt6swj82oX7EXuOI3y8MIr0gV/cic04rGXfOA4BS1kmJRB/zBG3
X-Received: by 2002:a05:620a:4409:b0:7a6:4a8b:46f1 with SMTP id af79cd13be357-7a804277c27mr2337722585a.48.1725398988462;
        Tue, 03 Sep 2024 14:29:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725398988; cv=none;
        d=google.com; s=arc-20160816;
        b=xP2db0WwIJlLQlrFUxE9NG9KAnvjJ+ITRMHQChYfWYtx9EYeSCDCTNL3VWp4ZrFnhm
         qzX/MvMM3akuwDa6QV1ITFwhHam4JPZZBkvL9aUpn83jBEixGvTvefh5DZGsKE6u53cy
         gwiqDnaU0WV6UXtgkiYL7MJ2cFTVtcTMhaIEpT9iXW64fZNklsGtg/YLM++60/tBR71g
         wY1LsOKILnujmUnNOH4SdEqB2+oYebu4BgOjS2fCkCHKKARtc2Gb2PUDEt67fxEhDeg0
         jQ8lFYAi8Mcf1RZMamfHUXWChe8lnQ1/rXIrnBmFJL6gTmYvl6eLAHs38Zxp+d/CfZ+Q
         AC0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=imVEL4cgskba59vOS+3eNgoUE+lEXkUrmzqjUrZ3Knw=;
        fh=O5+7AAyyIGSKOPn6vDZO3CKGjnDxZoPudaGCEZmYDTM=;
        b=T1gQRvgZaLe7JBVAIgPx4WaPuNWHcdDC4pM28kAdT+yNjzf/Iik0ZHZQTmOm4HYggM
         fLCkKzPvpGMsKSYmer1NjW+8TMGpKTpOSDF6Ku38kBmnF4PCHwzF2U17YflYpgRWmSj3
         UcT1/yhJrCT+e0biqOchdXLYjnO+YZLz+FU6qKUeqSUFcE7tjahZgiHh/kVPmlq8TAnL
         Gk6fWohaRN1JhutQHzIyjYdo1JRrF0X5tAy6nhWN9LXxa2wdJXYkU217vqmER6dXJ8wD
         FdHht7IvMyNd5+3AWWbxi4fTGX1MgOUJAm0seTtRT8vT6XiP69bjdF8fjNJrmlBvvgs5
         9WGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EClkIK+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a806d85589si1397811285a.481.2024.09.03.14.29.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2024 14:29:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EClkIK+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1slb5p-0005ya-UA; Tue, 03 Sep 2024 17:29:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slb5n-0005x1-Sv
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:29:40 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1slb5l-0007T2-UI
 for qemu-arm@nongnu.org; Tue, 03 Sep 2024 17:29:39 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-374bfc395a5so46542f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Sep 2024 14:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725398976; x=1726003776; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=imVEL4cgskba59vOS+3eNgoUE+lEXkUrmzqjUrZ3Knw=;
 b=EClkIK+clydgUJ34fCxkQp1n40nachRlYtBOyPbyCYhGGWEctQMw4CdYy2YDJYwqNS
 M9vEd4Jp6oyNa21wv9Uz7RtFybc6Gss5Sy8wIo3xj+r9SOw+8FLVtsE940U8lR7llura
 GHFgP1P2y3kyPNhCrH5QlvnSJTrFbUQiITT3TZsUavHgOZGaM+XyxgswB8EUc3g5hV6C
 BL5gilEt9iP+lIjoSwc9EvjaLBP9HLoGKqUQfHd2t+QzDDvpIBXKOzhb4JgAEc9M+Vh2
 /0vc5tlN72F2T4WnbrlJDAxIWuNN6HB8qxHta6SW+ZSsGJjFBIKGA+Z0a7HGPBlutYBi
 N7/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725398976; x=1726003776;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=imVEL4cgskba59vOS+3eNgoUE+lEXkUrmzqjUrZ3Knw=;
 b=vZtlsBhvCSMxvj4/P/8g9Vxi6YNh9s2XX/XpFBphHItLksDuyAKjQ9yzI6lZdVFuRk
 MZoIGnGwu6uRndwwXSuw9Iz7Eh8+dPOlMzZJlwUnxDYBs6O0ukbs0Uvcefk/+3VXH5Vb
 rNkvJDtikxfedMrT4SUV3RCzs+fQHlHeMs1p7LYlBj707vqWKLbq2gmt/5Y6bOdvvn/h
 ZlhyVX9jQKWDvHMJKbYV7t4e+Ow8Wsrfo4j2Xch7imCTrA44ng4RzS7m9vJXOkwBH2Sp
 6jFb7b3wGT514aP2YDF1DOCnN52BfNvAxvalp7UiHbR223KV+61e37drukOXxqrKGwZx
 0ugw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWV4h6sZdE8TfJr6MPuuSytfUPGpaI3Kj9+ansFOF7P8fMZnQp/6nqyps2GeZTIVn4fmibnBzw9PA==@nongnu.org
X-Gm-Message-State: AOJu0YwuhO8YSM3oSDvVlihn+jepVnGnhgvtg1D/QC4oEDVcUsAHL4vi
 sScun7b2vd9vsuOLbYn6wwO+pN7cL9oyqkn8KEdo0OwUFmyMqnKKPKw4XZU7Lz0gRlSM37Nxs0a
 7
X-Received: by 2002:a5d:4646:0:b0:374:c4c2:5ad5 with SMTP id
 ffacd0b85a97d-374c4c25b2bmr5521905f8f.27.1725398975959; 
 Tue, 03 Sep 2024 14:29:35 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-374ba3da654sm11533165f8f.89.2024.09.03.14.29.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 14:29:35 -0700 (PDT)
Message-ID: <98c53272-9590-45b8-97e4-efda29fe987c@linaro.org>
Date: Tue, 3 Sep 2024 23:29:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 01/53] hw/arm: Remove deprecated akita, borzoi,
 spitz, terrier, tosa boards
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-2-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
X-TUID: QW8Lh6VNLG90

On 3/9/24 18:06, Peter Maydell wrote:
> The Sharp XScale-based PDA board models akita, borzoi, spitz,
> terrier, and tosa were all deprecated in 9.0, so our deprecation
> cycle permits removing them for the 9.2 release.
> 
> Remove the source files for the board models themselves, and their
> documentation. There were no tests for these boards.
> 
> We will move the text describing the dropped boards from
> deprecated.rst to removed-features.rst when we've cleaned up all the
> boards it lists.  Device models used only by removed board models
> will be removed in separate commits.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   MAINTAINERS                             |    3 -
>   docs/system/arm/xscale.rst              |   35 -
>   docs/system/target-arm.rst              |    1 -
>   configs/devices/arm-softmmu/default.mak |    2 -
>   hw/arm/spitz.c                          | 1284 -----------------------
>   hw/arm/tosa.c                           |  327 ------
>   hw/arm/Kconfig                          |   23 -
>   hw/arm/meson.build                      |    2 -
>   8 files changed, 1677 deletions(-)
>   delete mode 100644 docs/system/arm/xscale.rst
>   delete mode 100644 hw/arm/spitz.c
>   delete mode 100644 hw/arm/tosa.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

