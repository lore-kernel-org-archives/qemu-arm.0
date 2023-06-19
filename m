Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2819133ejt;
        Mon, 19 Jun 2023 06:46:02 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5sbxhWpM3LLnq+nY0CQYnCBxK6ZsaFiEslrE63xT/oS6/OOpojJF8fy3IUUY7YNBvkqafG
X-Received: by 2002:a05:620a:3e8b:b0:75b:23a1:8316 with SMTP id tv11-20020a05620a3e8b00b0075b23a18316mr8607995qkn.17.1687182361782;
        Mon, 19 Jun 2023 06:46:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687182361; cv=none;
        d=google.com; s=arc-20160816;
        b=mI1ODivgEkzpgWAVp/fdk73+mqowXHNU6zEov6/tOk1rpMAsAO+AvxvCyH5aZ7qAUT
         5xMzhVr8ayefZaYyrADS0o31+pMfZgnkOwAPS7LdjeKubCARpsOXtRNqgogHhKZ3khud
         e3wanOLPSwzbFdSyJBUAY89u60fKjBrp3mg66FOX8pNZ6sc41vheFdSHM1cqZn3hEJ9Z
         wJqhRW0pZW0f00trLMAbqFtEQnlDUEoHlLG2okP9JiDP/DJjMqO+XP3da0b8yCVKiIE0
         RS3lUnHMiTJqHDRJ+D4sm2agjLEGZ8bmM1oWlDhrag2fGC6weBEIyM/7vun+V+wmT3Du
         3rcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=E5wJmBO5+DR2SHTj2u5rPzmt7ogdWieraXdORYTOYSo=;
        b=gFzE5OuqFPubEMc/2g3fsFMHxFpGxgnnLSQ1SunCSLvB2Dv9FSWuCKOKYwkePQcCSl
         8xGjpp4NRXPtQ0hTmgsHK9PWt+pE21iQ2oeMyXLNRoC98nXZWtUIH3sOe+DO737qsEj6
         HlUDp93aAk3Fuu2fE/o+ate5QMSJqX3J7BxCXgi5nGtRZNN1wq3X6lox3RfXvxqfwZLM
         d6Xd5BMjvc9CSP9ZBdy59BfKOMaxo9oOQiCMk1C7LDwygaHWkJBz47lOMBwtDm/kkZNV
         HRx2WCkLanJp/vLclG4R3Fsn/A5NdYksFh7/6kBLB9Mw+AQ69MAoDRWEAl0yBQFIVcYp
         4x5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CgEQJwT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y11-20020a37e30b000000b0075b1827e151si2116782qki.407.2023.06.19.06.46.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:46:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CgEQJwT6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBFCf-0001Hn-3Z; Mon, 19 Jun 2023 09:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBFCb-0001Eu-Fj
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:45:53 -0400
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qBFCY-00069C-9R
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 09:45:53 -0400
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f87592eccfso683065e87.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 06:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687182345; x=1689774345;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=E5wJmBO5+DR2SHTj2u5rPzmt7ogdWieraXdORYTOYSo=;
 b=CgEQJwT63BL5caiK9PtE/5P7NaObTVFuNvaNlwPPxdB66vZKaWObAU8DwRjdKWIL9k
 3H2KHIE0JS+12jljCWgyJokEoVo9MJhDQkbcFPzxXS4Z/94bhCjFLLOZVsdzKzRJz7WC
 aXpUytZ7xM7w0ieAK2xqZe/Rg+KxdjXlqpjV/aE4G0+lf5+r3JjVbMe1+k9+cV+6NzkY
 aMF+49bsI8XrNeMGtDBFayI3ep9yrt+x27P5dtTezePTICu2GNiJDE8Eip9REwjpFO0o
 zejS2NkApYmAHjKQ/SCqj+/rBH5J9tuXdZaLe0soexRXo0e5z/0JguM0PCEG7OW0di6w
 iA4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687182345; x=1689774345;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E5wJmBO5+DR2SHTj2u5rPzmt7ogdWieraXdORYTOYSo=;
 b=FmZ5xxgU/n4+GXoyi6uthTR1KcpaAmjANTIHOTk75dxaPSkOf+gN5uYBv/jIQIGAU+
 eUhJUQjpzbe4bYAA1xyy247sOSrk8fJsPNps3PhPFqwS0S0qJcd5RJ4oUqJzlH5XPuni
 OjU8rXeywboymUPSSFLD1c9/NCnkLYJp8McAlO3oIy9/0YHbLY2FPzHsWzJHOewAX5/r
 7ZdrTbBjNrC+1oIYsMthWzOs7Lt1zJvyznAGtisYIlL0bf6+UyWVr+jNbb7b5BeNfRZu
 DO6VNp15KNkA3Pbg+GOmxCGMsJ8hj++q8Yl34eKzy5cn096TthtkdYIALeD+buAiZZau
 khYA==
X-Gm-Message-State: AC+VfDxg5FePP2aDYNOVvEvkg6YujdyZeXhDovVjKga8Fluk9Dgw/X0T
 vBriCTHJ6THywSe7f8DkdnY6qw==
X-Received: by 2002:a19:d611:0:b0:4f8:42a9:70b3 with SMTP id
 n17-20020a19d611000000b004f842a970b3mr5202513lfg.58.1687182344940; 
 Mon, 19 Jun 2023 06:45:44 -0700 (PDT)
Received: from [192.168.69.115] (sar95-h02-176-184-10-225.dsl.sta.abo.bbox.fr.
 [176.184.10.225]) by smtp.gmail.com with ESMTPSA id
 j10-20020aa7c40a000000b0051a315d6e1bsm4114446edq.70.2023.06.19.06.45.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 06:45:44 -0700 (PDT)
Message-ID: <84c0f59c-659a-25b5-d2f1-4309be445743@linaro.org>
Date: Mon, 19 Jun 2023 15:45:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 32/38] crypto: Remove AES_shifts, AES_ishifts
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-ppc@nongnu.org,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
References: <20230609022401.684157-1-richard.henderson@linaro.org>
 <20230609022401.684157-33-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230609022401.684157-33-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12c;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
X-TUID: l2ofwRnanPB3

On 9/6/23 04:23, Richard Henderson wrote:
> These arrays are no longer used, replaced by AES_SH_*, AES_ISH_*.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   include/crypto/aes.h |  4 ----
>   crypto/aes.c         | 14 --------------
>   2 files changed, 18 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

