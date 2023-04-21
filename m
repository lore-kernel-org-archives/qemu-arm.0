Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp1440448ejm;
        Fri, 21 Apr 2023 15:11:54 -0700 (PDT)
X-Google-Smtp-Source: AKy350aMv925g1MXgQdpMkMNjzlNGBqbM9SDG0/Im0lhZTRLmP82LV9x1tJh6XntFHO/Y2B8h2mH
X-Received: by 2002:ac8:7dca:0:b0:3ef:50c7:4e7c with SMTP id c10-20020ac87dca000000b003ef50c74e7cmr11273444qte.45.1682115114283;
        Fri, 21 Apr 2023 15:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682115114; cv=none;
        d=google.com; s=arc-20160816;
        b=KkFiJS24CWrNECT45jUnHCkN9DD8CAUQUQazpK5Oy60gJMLIVlzLUVX6KWOvhur7M5
         lWy8ssCD8VE4UIjai1wcGCJfHx0r8J+1s2RLW0o9GswXv5+x+UrkLea7lNZEVIAt71OG
         3aYCDlDYqOuTkROKnbvzcyGdVYs0H+QlVeayivYLnk+IxMtTRPO18g4Kd3PAO7aqXSZb
         YkRI97AKJLb/f0eBXoR7/wZRdIOq0NWUk0fd9zjq8RjQhGlTX7GRS0/EA4alXZcPSkjM
         4dCaDQfw1NzKsxupbp5jlzbjYiZ3s0/hI6GIWUaZUMj7gRdzaau9lhq7LCDFzjbWkR3f
         iatA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+54Bo7jCCAHW4aZ3qLnEV1hE6b/zaJjg8XM25Mmt6ko=;
        b=mCcevVli1f7Ugy2HF8zxhwBHkQKgAE8+yLPRhqhSXF7lKtG2Lklwb8HFi/7awDWQ+5
         P1CWXnipd7yxd8as7/Suysp0jV7vZK8G/DrOxqLGKjNiob2gVtrlESH643nM8aklPnpb
         wQ9xQXJmdsXM2W0WvbNYOCiT71PqdFoKOAtVXLH/18eCbNyx6GsqbE1d1EFe6ZOEWAAY
         K2ivtIi9XChRO+dCEZKoJsNAeHw9duWrWGm1cc7uKK2HRN65t4Cp/7cE/sI2mjNKnumg
         DSCrBXq/U00T++6ijddPyoPNe8D7IYJCiUUCHyxw5zLCb4KU7XzsutpQ06gTAVFr3X+8
         vQtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hHWlTyvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h9-20020a05620a400900b00723b9fa217bsi4030315qko.490.2023.04.21.15.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Apr 2023 15:11:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hHWlTyvQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ppyyO-0007N5-Bz; Fri, 21 Apr 2023 18:11:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyyN-0007MP-9t
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:11:19 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppyyL-0001qE-7Y
 for qemu-arm@nongnu.org; Fri, 21 Apr 2023 18:11:18 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-2f46348728eso1370949f8f.3
 for <qemu-arm@nongnu.org>; Fri, 21 Apr 2023 15:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682115075; x=1684707075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+54Bo7jCCAHW4aZ3qLnEV1hE6b/zaJjg8XM25Mmt6ko=;
 b=hHWlTyvQ1TVtktYCEtpreo8O0z8m+GFndI8VXI3yuJOI5IEjpUpfi+HPSY6d89rG5r
 riH6tl/XCvDsrMgtXyWTm/8maO/CW7O9b37bMENLmGivleXnsEQ/8QQ2Xja7JNPopqve
 aJ8qDW5sAKeKE6qqNf5qwPg0da1A5FgOH8xR8iyLEeUPSxbjcjOY9oDsX1v/BEz1PEFO
 CTYCi+cgvsBVg8LcfRdTqFjmlDEHDUF2N9qOVgUOOxzlG+MCrN6Qy7CvY+NXqzWpgOmf
 dTjbeTNpZ4/1y+QNbXPeMFh/7oHR/dwRZN8hqEJP42wZTj31P0wyNHskZp3DU47n3B0b
 eh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682115075; x=1684707075;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+54Bo7jCCAHW4aZ3qLnEV1hE6b/zaJjg8XM25Mmt6ko=;
 b=AOmdY3z8TowN7sFrOtzHaJctIcSYsUkRDIl1nxRCYwr8XsKRui4TD3W+8E8EMaXn3q
 vu1ORana35S5xHPTpmY0IrjX9q93/vXFMJo2c1CrHhMPooZ4C54JxNMYmPTBeeULMK1T
 I7Dbe+VDXuk6lRg0ivrwLY2CpU0U2de1UZTMMchyn8g3nZ+E5zvY+8xDxHUUhX2OzGmK
 0sXq17mIwSEss/m7dkDrwxwzGdbc0n7Gp4OyT4JsWaxrjGE77kscws5TTghG/D9fjnUt
 LIBwFD2CHkZFq4sF/+Qjb0tlQ96ygEC1WN6kWX5S3a8R4S8OdY0DBhT6u+idwNscgJcw
 4xwQ==
X-Gm-Message-State: AAQBX9cuvV1dCnh0/zz1QBDQXBXuA0aprbNqbYyDyYJX+0QNB1K5U5jL
 FJOpEy0wFhObfiYul7ORVmbLOCBy9O5RB+B6zhc=
X-Received: by 2002:adf:fe49:0:b0:2fa:631a:9f38 with SMTP id
 m9-20020adffe49000000b002fa631a9f38mr5063058wrs.2.1682115075267; 
 Fri, 21 Apr 2023 15:11:15 -0700 (PDT)
Received: from [192.168.69.115] (uni14-h01-176-184-39-152.dsl.sta.abo.bbox.fr.
 [176.184.39.152]) by smtp.gmail.com with ESMTPSA id
 z14-20020a5d4d0e000000b002efb4f2d240sm5250076wrt.87.2023.04.21.15.11.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Apr 2023 15:11:14 -0700 (PDT)
Message-ID: <a92d2457-34eb-cec0-ac4c-4d0f2e633e7c@linaro.org>
Date: Sat, 22 Apr 2023 00:11:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/54] tcg: Replace if + tcg_abort with tcg_debug_assert
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230411010512.5375-1-richard.henderson@linaro.org>
 <20230411010512.5375-2-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230411010512.5375-2-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.297,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51,
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
X-TUID: JXaPN8D/R87l

On 11/4/23 03:04, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/tcg.c                 | 4 +---
>   tcg/i386/tcg-target.c.inc | 8 +++-----
>   2 files changed, 4 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

