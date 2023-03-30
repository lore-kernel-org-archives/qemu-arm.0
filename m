Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp1282960ejb;
        Thu, 30 Mar 2023 07:24:25 -0700 (PDT)
X-Google-Smtp-Source: AKy350arvkni8jYGg2Xp11lFx/ZLT96M44zg/H4VD1s1aWEFBTefEWbhSmMvoVXnAZfBTjLroeKG
X-Received: by 2002:a05:622a:48f:b0:3d2:7f3b:c691 with SMTP id p15-20020a05622a048f00b003d27f3bc691mr40907542qtx.47.1680186265079;
        Thu, 30 Mar 2023 07:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680186265; cv=none;
        d=google.com; s=arc-20160816;
        b=iVduxeQHHr1teVwCh7jkXyMz1y7yNpSAMwjYjKv09TDSSYlWeDItLZPvuqNbkyF9iF
         JVy9uTUGpVSwCXIBN4QzViYEkQkjKE9hSfiXtoeglIYgqOqde+v8OqPQKoQGcT9Rnv0c
         e0JBuhbVjIAwn//DkdPiAGe0pHGtSVhJYUIotDdJPOKlb1HHtEJaAnR4de96O19FDEuT
         iAavZm6kOtM1oZnyKXImJ4ptrLX60DZvfyVM9+idmE4x3lnBq0aK6xW8GJ3xG+VUDkvu
         1+S8mnYf9lnboanhP48FI4j58u/X38TRUnRQd6pJQJt2+T7uGlrPNHirjiX5I0K7/wM6
         5cyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zURqt2l9fy6kRbCT8Wa+mX+x92PGUuyTNfoHu4Rf2RA=;
        b=MOuNn9rJXt5rQ5DqVy2jbUJ4PGeFBvFBk2vSmzPvTk+cS9FJncY3v0Q7tLJkfx9W2C
         TPAKAQSTxLGGc1/NpjzMWxsa4Q70YWC/4Dice9kT1dcbdcfomX3C8sLzVV8yWm46alnb
         nL0T1OBQCT8Ky1KlgVzzhFTyFOvZUTkbfk4ThIuzIsKzOwibwRQteHfOxMGjaxESH9k6
         vN9mbhIuCqAlOPlNGHFbQU5yDE9hnanbnBrzKwpsuLgZKXXZG5esujiO0Z3yOpKrfbfi
         pPJakDDRzW707VolB9INXTw83yA3zg2RNg1OFQQPF5WE4IZGJXm8rGoOdxxZ8FGtRdJD
         l6ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZbswCVQY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t5-20020a05622a148500b003e4ee9ab872si6296285qtx.99.2023.03.30.07.24.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Mar 2023 07:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZbswCVQY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phtCJ-0001Yj-Hr; Thu, 30 Mar 2023 10:24:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phtCH-0001YF-PL
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:24:13 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1phtCG-0002rD-84
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 10:24:13 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 bg16-20020a05600c3c9000b003eb34e21bdfso13568913wmb.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 07:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680186251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zURqt2l9fy6kRbCT8Wa+mX+x92PGUuyTNfoHu4Rf2RA=;
 b=ZbswCVQYoDXS1XLyxaybLUYkYWa8IQESja5en1z/XLGkME90ir9C6aAG3CcuqgUKY9
 zFUpts0vVpUdTtNp0MVEMmsscu9hB4wk7Zm3GjBlAf0tOnLHMG/aBvOpe7GJmYkdo05E
 zkwF89dnk9mLPg9D0u/UW3jnT6KGkS7GyjZQTPRbFaNf5yTJ9y9/cBYi+3wKvIrKvza1
 T8pbUXibjWuaTSSqIY83ISRSqNrBlSimt/yHRogRD2TBsJioH4NilJvxpajZGsc42yMQ
 B9LSV9dycYMPocXOhyyttvX8NIEdUwTV3JZOGfYkiROxKEAjxDrwXMk82nawpA2MN7fm
 Gm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680186251;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zURqt2l9fy6kRbCT8Wa+mX+x92PGUuyTNfoHu4Rf2RA=;
 b=0xWcSpQraDie2Y6g8/PyYJtgm1ZuyimkamSBvBPqL6uzCalljpL29tl5s492eT/GSV
 8ICCVuYNf9a9/M49VgbuWNlohH20OL9yOUkCYb7N35JQigB8NrlmTxFiq/o24y1Zd3g3
 LHtIMM3/3p2Ife3niFcIydOi+2BNfL7Qjj2vvsY7XwPT1cih/5joSGHjlw9I0lvHYNhc
 1EXoRz0m8cRl/zvD3H33Erdut3rODvGMjocvZrzIo1C8xuFnsZXtOWn9UU6y1NLfO93K
 wmdx3s4VzKTdUZJpWgCxHisUImeXZ5smrHyc7eF7xpwlBj/CT7LFkvF4nmERCRISAHZa
 /lMg==
X-Gm-Message-State: AO0yUKU7d9u7Twyyvp8Ee2pGcgxi3JoCJJOzKC79L0wJueVE/Jz7SBWz
 7LdlkT2hfdkwUW5m/mpqg2/ubA==
X-Received: by 2002:a05:600c:2118:b0:3eb:39e0:3530 with SMTP id
 u24-20020a05600c211800b003eb39e03530mr16671498wml.41.1680186250976; 
 Thu, 30 Mar 2023 07:24:10 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i22-20020a05600c355600b003ede6540190sm6595300wmq.0.2023.03.30.07.24.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 07:24:10 -0700 (PDT)
Message-ID: <387cca58-710f-f13e-5927-0bf1d716aa9f@linaro.org>
Date: Thu, 30 Mar 2023 16:24:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH 0/5] PMBus fixes and new functions
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, minyard@acm.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20230322175513.1550412-1-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322175513.1550412-1-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cvbORSUzZq/E

On 22/3/23 18:55, Titus Rwantare wrote:
> This patch series contains fixes and improvements to PMBus support in QEMU.

> Fixes:
>     - String read now handles now logs an error when passed an empty string
> 

> Titus Rwantare (5):

>    hw/i2c: pmbus: block uninitialised string reads

Patch #4 queued for 8.0-rc3, thanks.
