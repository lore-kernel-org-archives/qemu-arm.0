Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp779154ejc;
        Mon, 31 Oct 2022 01:24:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM43B4m3TzqS+eUhvOGfUQBP1G+C81OytQjGZaLpQCmampALfPQ7EOmo4u1ad+6pLAPEsiZC
X-Received: by 2002:a05:620a:1027:b0:6f9:8ff2:7ea2 with SMTP id a7-20020a05620a102700b006f98ff27ea2mr8455629qkk.652.1667204648642;
        Mon, 31 Oct 2022 01:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667204648; cv=none;
        d=google.com; s=arc-20160816;
        b=bo/qXkLvIxlnUkLCRa+10xKxhM/oIeWtnq9ODormsLm2cfKmfPU0UKur0KhL+rudnX
         Rqjt3Ift+nns0JcfLKmDi0GACX9y6FISt/l6dbg2dYZVEDK+bSU7WupyZ7bbYjie7VsM
         k7gZTnMTQ1Q+ymx4cVBjp5wXzCGvq8wBPOWl1HUxLuABAhEm81nlc59eb0K2E2klGuL3
         hOu2rnZHCORq3PxBBKuW6uTJzrZ1tp4YnVr2/ocTRjvHXvvY8a2omTu4cOkHl5UsCFNi
         6LeesWkl16uQvRwexT7NG/NSxk9owYCRX91Dul9Z8O7Y9JreIZNWnK+uFXdSzHUF3ZD4
         ITKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=islkkldhAl9dT7WoKvtptXgKUBZzZHZxETLs0ckqON4=;
        b=M9eSj2WOrZDn4fqe0rn7IiefhUWiiWLD/neEfAAelpcKCFH9BxuATWCiu4HHtVrcV8
         aCk/NPJ3jbfq1J0W9yYYFNcs7qhryt5+y82DwV+m4q1bX3cREC/0sBQTcdtrt+AcoL1e
         Bz78tW15JH424EAEa25/qd0wIicla7sWyqBPtnLJ1e6j7WQRdb7AC+OFy2zzibQaXRsu
         hzeag4ENUs20L4YphlmjTj2A2VV45JECleOQlddEGQfSgT60YvAFg8iE6xWUKHRvxnZ9
         0ut6S8E42bJETlB3UnNoQI88mHRKm7vd5tUqaASYHTCZWKdjcGvfs89y/IErN3YN7Nzj
         5wLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COGtnS3B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18-20020ac85392000000b003a5167cc31bsi3256401qtp.67.2022.10.31.01.24.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 01:24:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=COGtnS3B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opQ5W-0002GO-Sc; Mon, 31 Oct 2022 04:24:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ5U-0002EO-TP
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 04:24:04 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opQ5R-0001zo-Dw
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 04:24:04 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 c3-20020a1c3503000000b003bd21e3dd7aso10303803wma.1
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=islkkldhAl9dT7WoKvtptXgKUBZzZHZxETLs0ckqON4=;
 b=COGtnS3Bzm09r5OsAlamXI74rGofp0VzaWdQm4Gs9rUZEUx6A61TTJYs9+DXI+fbTK
 hyB+ZdrUVH6185UuGmVTwI3/2RWY8y/iXE7BEPm4ytpf8s2IqsmgurfDKmGwh25WTtJ+
 lL4MFabWQxe6dDTBOPIrhM1t6tgZFa0i/62d+xFeP5fpqf2tOgLteVs98pQJDT3644AH
 drAKIdf388pm4Wgco2SvfKVwZsd8uUBmr7myD0VTd9PcHthSmqRd0ChyChj7qGpTyxeb
 V8eDSzeRUYQtYHX/CjhGwi4bIEMgr1EpwUF3WjrXvmhrS9SKxfnB2rZwdPuk9rp1VgyK
 8uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=islkkldhAl9dT7WoKvtptXgKUBZzZHZxETLs0ckqON4=;
 b=y2SSXRkxmSARmSH5k7DKXNcH5cO4lI8nSFEes6mSjZ2oUxxVUBqvh9vWNd7g78E3cj
 qjvBEc3+A/CYQVOBjl1Pbz3KOFf7sDFuYvgDbT8C7HD7fP02/H+B5qV16kmkNepASTvf
 cGWA45dsmeYqwcajL8kOcDTgx+Uwli4W2pcx/WRimLHC6bg48/qwEFrrTqCUqSJMOjNQ
 HTm/JFHGxEBhzBPRdJJWcTIszbZlPafvhB3aQkbtwXjpPOyBJqGu9a2disXznRr/uXhb
 PmeCLjrjBBtTCkea/UfxUBOdq1TbWe0geGb8UiSKjq/bh9bMn0uqiHJcRjPWdN/zJflT
 L4UA==
X-Gm-Message-State: ACrzQf2or3y4TicGynhWPSnFazfxhJU7I/35uyawaupKJujR0E/uE7/L
 0QcDLnBehBht9BPP3ioFJ8L1vw==
X-Received: by 2002:a05:600c:3849:b0:3cf:4d99:fd1f with SMTP id
 s9-20020a05600c384900b003cf4d99fd1fmr16290081wmr.128.1667204639882; 
 Mon, 31 Oct 2022 01:23:59 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bx10-20020a5d5b0a000000b0022e47b57735sm6448646wrb.97.2022.10.31.01.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Oct 2022 01:23:59 -0700 (PDT)
Message-ID: <20698509-437d-8490-5f9b-7c34542ef0eb@linaro.org>
Date: Mon, 31 Oct 2022 09:23:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH qemu.git 09/11] hw/timer/imx_epit: cleanup CR defines
Content-Language: en-US
To: ~axelheider <axelheider@gmx.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <166718254546.5893.5075929684621857903-9@git.sr.ht>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <166718254546.5893.5075929684621857903-9@git.sr.ht>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3hfrBE2wJ7VV

On 31/10/22 00:59, ~axelheider wrote:
> From: Axel Heider <axel.heider@hensoldt.net>
> 
> remove unused defines, add needed defines
> 
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>
> ---
>   hw/timer/imx_epit.c         | 4 ++--
>   include/hw/timer/imx_epit.h | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

