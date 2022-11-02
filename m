Received: by 2002:a05:7022:458e:b0:46:22f1:8c13 with SMTP id cf14csp4956481dlb;
        Wed, 2 Nov 2022 02:04:37 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7XPBeojJtdwmOGdxf9VhI6pI664fEtBb3/FNr0SavM9w1105m2rZZutlNRNF+rwTJNu6RL
X-Received: by 2002:a05:622a:14cb:b0:39a:7194:7de1 with SMTP id u11-20020a05622a14cb00b0039a71947de1mr19045824qtx.91.1667379877578;
        Wed, 02 Nov 2022 02:04:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667379877; cv=none;
        d=google.com; s=arc-20160816;
        b=rnBLUgDPtG3DGrhFcFWX5J/gkVXMz/aAw+ipJjAgcUT/GRmwz+fxj5vaPJW7b5gXk1
         eXW3a5rK2N7LaGQ1pfmkee9C9HPp8vSKiT1EEe6LpN9JqKgyj3bzmsWerGODpd+rlkRj
         Dp3RRKACiRXn97HIt4yszrfpIEwjOoUG3teaDXkQZC21TU6Pg9LaNF58qBzLROxqqM4n
         sOTbmKUx8vE2orN1Msakt2IspUSjqdhnTPO8F6l/WqISifNMCAW1CRO10z/IC3sjOpTw
         +JIPTDEtunC8Q+L5blnxEjEZ1M3vqbdfsbJnDMlOgAAlXY7CSwsZjCajm2O1+64McE1i
         d0Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=49vzAuNmzCnLd9fj1v+rwJf8rf2ZljpTmV7zL3vZmUg=;
        b=v/LbuDiTuDBFrqmW8CyAujwnE+gmLJCOIN8MgXzuPeXBpQfMQ459M2AR8M3jFoNdYO
         Z1Gai/rWlaB+Mqu3Wv71fzpE12aAFvpjKb8JM61g14JHQGS7Q9oafuru7E+XW1sjwwHY
         pZfmH1a3Dj1Kmh/Ux6CC59z3AN9HYZ46WISwUmwUGkc5ZVGof5Xl2dvDZE838P55fIxr
         WPUfyHf+q4kTp+lsjNG8hK8FVNDUStqYoEWGKmovwv7Ph7O/ebqlIIi63sTHnwDFCPjc
         5bDx3oMIGKpMSwPfxG3vWs5VCQ0Q/IQdREl+vpjlYLa5dEMl0p7y2FcyKct9xQkTWQh8
         8goQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZjQc/hyq";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5-20020a05620a0f0500b006f9720b5fcbsi8057505qkl.79.2022.11.02.02.04.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Nov 2022 02:04:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ZjQc/hyq";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oq9e5-00054m-QL; Wed, 02 Nov 2022 05:02:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oq9dj-00052f-AX
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:02:34 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oq9df-0004Wh-Uf
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 05:02:26 -0400
Received: by mail-wr1-x42a.google.com with SMTP id g12so23481203wrs.10
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 02:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=49vzAuNmzCnLd9fj1v+rwJf8rf2ZljpTmV7zL3vZmUg=;
 b=ZjQc/hyq/8upX9SMH+FSVsbeF56KHb264MdtfAIGOQ4ZcclyFS17BEQsi8VdncTpTd
 ljC3Prir8w5VZeUvkbp0uJj5lNJKG74I05Sgz3j/UFzhSG/fWZP05Yp9gooUp7WqJOqp
 yeAo3ISwg3JC3L01UbSeBDSyaWiBpY+Ohl5y+r6xsNK4iKn+pCAftXcUXFmR1mU2f387
 V6bJ52IR/AWbIOZh85rTY/waRW8OG5W7arW27fwERZFXSxBTL98BepHHZytsaE2LNj27
 5mwDZTiDoueetfNjpuyrdqEc+wHJkYJY/SURwBBC3RqoXPdPRF63OCjvkbS7fDoT7MmO
 beoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=49vzAuNmzCnLd9fj1v+rwJf8rf2ZljpTmV7zL3vZmUg=;
 b=IbyCoBVEOlmypHyyuB8pDBVTUwwCVItjCUUInWRX7zaG1gEMCplb3JTZR4MIhgd6Eg
 gEQP2bWaPyz8tPoGsjgKab956AKH9nVLW/iWWdG6p+fsVcBfgBzRZoH1Ml4j6A2ND1pH
 ymwR4q3pq2S6DB/XIizpfA/5NXe18Ob13DGpfuoT779PlcPnuKDYV80O8hNPftg2wNls
 5c9VlkIoTnDNo8Mt8EP9ZuL3VGPB7FpRCgRquy/q1l4BaLvWXQ1joiR+0tvaOgtYMGo7
 RWjigq6cE7ZstCN2TSvrbCdpcGyTeEicp97R0XMDF+yVkqfcO9UZ68XLRw//Cj5c3PPo
 2Ulg==
X-Gm-Message-State: ACrzQf26WrOSanlIg6NmHNSVpsxbNrOjlm8uRvPTaZMNpWTbobeFqi2P
 7E+HkXWHLxDsjGTldwgPWjACXw==
X-Received: by 2002:adf:e44f:0:b0:236:59a3:c5a8 with SMTP id
 t15-20020adfe44f000000b0023659a3c5a8mr14647867wrm.396.1667379741024; 
 Wed, 02 Nov 2022 02:02:21 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bp7-20020a5d5a87000000b00236545edc91sm12442272wrb.76.2022.11.02.02.02.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Nov 2022 02:02:20 -0700 (PDT)
Message-ID: <0e715e53-6221-3431-c6a0-1c3e2a187014@linaro.org>
Date: Wed, 2 Nov 2022 10:02:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH] target/arm: Two fixes for secure ptw
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20221102054706.1015830-1-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221102054706.1015830-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: eW+v7Oz0n/ts

On 2/11/22 06:47, Richard Henderson wrote:
> Reversed the sense of non-secure in get_phys_addr_lpae,
> and failed to initialize attrs.secure for ARMMMUIdx_Phys_S.
> 
> Fixes: 48da29e4 ("target/arm: Add ptw_idx to S1Translate")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1293

Thanks!

Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)

