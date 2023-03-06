Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4759978ejc;
        Mon, 6 Mar 2023 07:12:00 -0800 (PST)
X-Google-Smtp-Source: AK7set8YuNESWdeHPWjz+teZUjKzeTA3rhbJDEHtWX+1I4+uSHj0sA+OewldBiXM577Qe5/BFNMW
X-Received: by 2002:ac8:5cc5:0:b0:3bf:c849:4971 with SMTP id s5-20020ac85cc5000000b003bfc8494971mr16492014qta.62.1678115519796;
        Mon, 06 Mar 2023 07:11:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678115519; cv=none;
        d=google.com; s=arc-20160816;
        b=PvLwnF/qGEdinrKz77fB/wjXi/kdrQfcDp9jT0vEg3vHDWbCR659QToMB1bwi7iRpz
         i185SG5U3Bxy867oP0KeOSlEF7WEZRB7VbfdfJgG+BL0uz4ZyNgNf0y/c1KnsY+VQsX2
         VLs+G8dH8U/N8hoRhznGJmNJpjwLT6jqRiTR5VTfmHEq3JfRmDKR0D2SSWEi54vTDzi4
         /5pB9iSoC9j88liUG4eFnXOkoVVsa6WL84jHWspk3a2QY0AaoQotIoN3cHZcATv/5qnr
         wPCc/dOJVqGsQqj+492VHifrvD+RoFr87EVHVpgb90Xgzy6pdRu1euB7jxPySYw/bvRx
         efyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0iGp6eWIWKQY1G+0TGzecouw3K5qJlpjkc5PIM+WKW0=;
        b=e7R+drH71qVIsIK/plE0Jbcs6taZDAqnAAtCA9yxpNrXVTQPWlt0RePnJ+5rl4UMVV
         ToyTvKm/hheQlT2/cgmEx7gJyiaWxdWBtnT58Lc1wq1rJs/Z0hLdYkvUFdANZgnpWPLm
         XYhU9cEYoBc2fEx3/K8yDj/PS0yrDhdocHKhgXPyzbt9JgMkZGZi0OLTLjGbq3Y580Zd
         1X7Q65Onuhygf23yAOyfQU1PAMDGZPFyXKg1FD74mTcKZ3k1A5if3nJEohOWnveBRUnr
         tN588K17ih2v4qNvXkGD9zJbM9BfxRfLxSz6+A71qmdhxXvCIWp12z1mujHdcCnFliCW
         cPuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mrncd2Tz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b1-20020ac85bc1000000b003bccff19a53si7716705qtb.686.2023.03.06.07.11.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Mar 2023 07:11:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mrncd2Tz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCUy-0003LZ-VT; Mon, 06 Mar 2023 10:11:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCUx-0003KP-8t
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:11:35 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZCUv-0005Jh-Ot
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:11:35 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 o38-20020a05600c512600b003e8320d1c11so5688450wms.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:11:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678115492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0iGp6eWIWKQY1G+0TGzecouw3K5qJlpjkc5PIM+WKW0=;
 b=Mrncd2TzPEZdVpgOBxL9rQJSSukbYOqWpPVs54eOkGKaPmfSzz0TwpV1Gx99qFv1Ab
 l33Gf1NM/hZfXnn+uhkANPAg7CQSdKn640+GKm+1hC4XgQBl2yE6H76pLFZzb8CoemXU
 E5rVHHj0CsvNVy32sNv15XzHVTiUuH1k7xHwc9DddrIRGo/1OhKyHrLD+z7NXW9B0Wbr
 u2PpdPf9Ri4Uxc7n1JkfirFhAtz01c3OWrOJx3P3Xo46S9qGOE0+HQnKCY2lzPY4RyoI
 kW8QWNpj/nFDjxCPeiJ9LY/BcDpQCFBdI03wFO1OIPKkdFP03SklmKqxwpTcXyzB+YYT
 KA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678115492;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0iGp6eWIWKQY1G+0TGzecouw3K5qJlpjkc5PIM+WKW0=;
 b=NggGwzHMGatYbhoLCJXCNU/UZmhj/n5qXUkBLHnYgp7YNc+oS211LHRwNiRS/imGzn
 CerOYNKHUYpSgaFwpiPHWhgGNf2PO/Psl9mZzmJTWkk+bzrbSyGticUI0XuLfRnOiRkt
 QV0jAXaz5RtEgDkWxkPbALDcnbDYwKNtLzKGvyoN+F0ap0crbgieb1koNo4g1hpMArwf
 3K2Tv508AdoHpPvf8+gmBEFux2dzzMEhz7cuEFv32rZ1nv8av0J7pqQJkwoJn/2h+Z5S
 ZVK4RU4va2I7yxb8HX/zkp7oY0fcVPhqVoMO7tnOCdrvBv1Rc/xfN/KaVYxOpfEfh3e/
 kRqw==
X-Gm-Message-State: AO0yUKWdpZfUGsTsvvILdPfjjUfeTt7TxsQto4PUqsmHiLZf6REMqVFj
 8SQzs1rgFqFsD1uuyI3h0dzYnQ==
X-Received: by 2002:a05:600c:46c6:b0:3e2:1368:e395 with SMTP id
 q6-20020a05600c46c600b003e21368e395mr9524886wmo.33.1678115492126; 
 Mon, 06 Mar 2023 07:11:32 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05600c468e00b003eb369abd92sm15792213wmo.2.2023.03.06.07.11.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 07:11:31 -0800 (PST)
Message-ID: <1e005b5b-cdb0-0b96-1d4e-9de2d133630d@linaro.org>
Date: Mon, 6 Mar 2023 16:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 07/70] target/arm: Avoid tcg_const_ptr in gen_sve_{ldr,str}
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-8-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230227054233.390271-8-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uALOkUZHzcvK

On 27/2/23 06:41, Richard Henderson wrote:
> This hides the implicit initialization of a variable.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/translate-sve.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


