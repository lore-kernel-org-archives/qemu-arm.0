Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp609029ejb;
        Sun, 21 May 2023 03:45:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7+IfTaPwhQtAim70NVOOh8KEKW85ynKnAWPIZLbP6NVNhEcY+1wdXAaII7YKzHOMgp3/hc
X-Received: by 2002:ac8:5b4f:0:b0:3f3:8dff:68fc with SMTP id n15-20020ac85b4f000000b003f38dff68fcmr13895450qtw.22.1684665936171;
        Sun, 21 May 2023 03:45:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684665936; cv=none;
        d=google.com; s=arc-20160816;
        b=SV+2G/Z4nW212Lv8u55AThjIHJhzq1jTV3cH8uM132dDNelOUE0M7HHAXYRK7UIet7
         zUVZpRt5OXHNauSxw2IXOM2m7ty0kPp2xiMEhMsJamBSXnJuzV0iutRSwuosT/ob4gob
         Ku696rQcywVI9nIpTC0TcxQZEkZbXvDdL+t2CqPhmbllGouHeXSl7rRq3FK6hQW1iXI/
         hHmqmx5A0gHL53fiC8DsExkgGrElzpS2d8yKCMz62LOfvDMjb12MRxdA/9i6ToML21j/
         A5e6j/7mgSdubMjSCv3axzyOFrdrsa8PTejOvngBJmlHKfbrlLiNEUvjOytVZyU9ioDn
         o80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=nCN+5sKSFUxbOOonFCNh9PYrfwPB8kflQdSqCBv+5qU=;
        b=RHbDVnlxkEfwEQA7VHese/qBUVQQkiG8nWpRNsPfxYdizEDJ5Sl6e9ZAe+yuUlPsVR
         /kXFNe4nnN7FqNmBXCz7XAo/6YMrfBInn1OFUyLCWV8aSHhz2e7aAVtXXbs5428fyNOm
         9CzzjN+PaZ1W4K7gQVnz/o6hAQK0qLp67Y3kgZSnM6aRDdjwKQKTU2VGVQg3ueBlgQiV
         1jqsl7776HUPxKmU2whFBPRxVUuO0vVJUbFSVBLrsEiu/Gj2cDdId9VSPKwcwQhmm6zO
         lp5MR2ku1YjFre3+IhVqDpTljmJ1yMR3sRLZCxz/AA8rh97g3RE7xyOAD/UTRFEUgNZW
         Mu1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PPTPcF+m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w16-20020ac87e90000000b003f6aa12a73asi694282qtj.696.2023.05.21.03.45.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 21 May 2023 03:45:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PPTPcF+m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q0gYL-00011a-Ft; Sun, 21 May 2023 06:44:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0gYI-00010v-AL
 for qemu-arm@nongnu.org; Sun, 21 May 2023 06:44:38 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q0gYG-0007Aw-PB
 for qemu-arm@nongnu.org; Sun, 21 May 2023 06:44:38 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f41dceb93bso31535375e9.1
 for <qemu-arm@nongnu.org>; Sun, 21 May 2023 03:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684665875; x=1687257875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nCN+5sKSFUxbOOonFCNh9PYrfwPB8kflQdSqCBv+5qU=;
 b=PPTPcF+meoDUtiGTPHpEP8KtMme08p71hEZ5dmzwMAPQSanI6OLSmft9RdiRYseLSS
 TYzPjGFuep06lFP94YbjsHwr/E4l30xPqWSI1P9TH424HLMeIq0/oGdm9FoEooUGkIem
 xXpR0/6PuRYQuGwWUT/lqdz0pdudMo3MjPcyVAj2GloomEX7CTL+fMmMFJITAfhPduwz
 /PKapB+H/7NKhU2Ba2JhfuuhIXYD28d1jET+6/TEtpCuTVKw9l6EgBeOakJm45uh2kXk
 6f+kRQeK2UKISZqena1ei4xKV0JHVAnhPRSJRX6m1JmWcHTxd3ORK90O0nY5s/GvykDX
 JjVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684665875; x=1687257875;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nCN+5sKSFUxbOOonFCNh9PYrfwPB8kflQdSqCBv+5qU=;
 b=VIBr8Quioe+9dvtoZ4KQdm9+9vBfEICo18rcdUmJ+j31bjNwvOex0odiBj0A3qEGJw
 7GomupSSOQ8RM/8L8iTJ+V+WZW9bRFR+62wgHGqfTRdVy4ZAC61shC5P/vQfosoCvsgU
 5Qt0f7EPa0m8lDiFreLprhjxbyfxvVazeXa5gEraYuu+jgmntalj3HlyYC+W0B6xPlLw
 xZAAhqSrA7SfSX3bz3/FueR6BXOr6eMYGuLw65uA+yBL5VtLsAkRbdSqyMe5t4HqWx5D
 Xi+sywMyKy5B7MtDhqDeFLnM9M83UWOqTKeFuXh2gVSGS8KYtukcoOTMhVHvjoEX3fL1
 s6EQ==
X-Gm-Message-State: AC+VfDxzmMS8LsI25MounwcWl/1meH4yuMbBT3v/DHETr2tRHmRN7nqZ
 WtYnWTt1F2xqxgRtq/WH8+BUzg==
X-Received: by 2002:a7b:cb96:0:b0:3f4:1a97:ab09 with SMTP id
 m22-20020a7bcb96000000b003f41a97ab09mr5758272wmi.25.1684665874861; 
 Sun, 21 May 2023 03:44:34 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.152.177])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a7bc4c3000000b003f427687ba7sm4779974wmk.41.2023.05.21.03.44.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 21 May 2023 03:44:34 -0700 (PDT)
Message-ID: <ca4a56fc-83b6-0892-45b5-d95406b1dab2@linaro.org>
Date: Sun, 21 May 2023 12:44:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 10/27] include/host: Split out atomic128-cas.h
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230520162634.3991009-1-richard.henderson@linaro.org>
 <20230520162634.3991009-11-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230520162634.3991009-11-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: EsGT0KXkfKs7

On 20/5/23 18:26, Richard Henderson wrote:
> Separates the aarch64-specific portion into its own file.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   host/include/aarch64/host/atomic128-cas.h | 43 ++++++++++++++++++
>   host/include/generic/host/atomic128-cas.h | 43 ++++++++++++++++++
>   include/qemu/atomic128.h                  | 55 +----------------------
>   3 files changed, 87 insertions(+), 54 deletions(-)
>   create mode 100644 host/include/aarch64/host/atomic128-cas.h
>   create mode 100644 host/include/generic/host/atomic128-cas.h
> 
> diff --git a/host/include/aarch64/host/atomic128-cas.h b/host/include/aarch64/host/atomic128-cas.h
> new file mode 100644
> index 0000000000..1247995419
> --- /dev/null
> +++ b/host/include/aarch64/host/atomic128-cas.h
> @@ -0,0 +1,43 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Compare-and-swap for 128-bit atomic operations, generic version.

"Aarch64 specific"

> + *
> + * Copyright (C) 2018, 2023 Linaro, Ltd.
> + *
> + * See docs/devel/atomics.rst for discussion about the guarantees each
> + * atomic primitive is meant to provide.
> + */
> +
> +#ifndef AARCH64_ATOMIC128_CAS_H
> +#define AARCH64_ATOMIC128_CAS_H
> +
> +/* Through gcc 10, aarch64 has no support for 128-bit atomics.  */

