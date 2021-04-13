Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp5060137lfr;
        Tue, 13 Apr 2021 10:07:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx98CSudZ4Du0yNIc7fZSYL0WE2dvvTu6GRF6EcwiUD++VBslZXXJTeekkMB8A8WylwQ/yx
X-Received: by 2002:a05:6602:1da:: with SMTP id w26mr27919155iot.170.1618333631150;
        Tue, 13 Apr 2021 10:07:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618333631; cv=none;
        d=google.com; s=arc-20160816;
        b=MMdjdkN0FsV29RH3DWl+YxqD/dyaBaOnArh5ehS5OeDC+Y+e7CEUqnUsqqHkgPn+//
         sOz3b/GPPEu4KbxQp+UZRttLvvqjUwMkWxcudKtywEsneq7VVVNyLPUOj4bIXoDrDkQB
         C58513yOIXYeIbVs7gQdS0tMXPeKa4H8FSERvuT6A9OxFjEvGQQE7Xu2cEwEuacjW3e6
         n2eJw1BRvpMM09I8R5gEw5fL8xytR//P715qdo0/mUEGSIi6bFWfWj92ThG5VLYuHSow
         C/5wr8xGOr+9bcJa3EeULe98Ka5Os1ayjiNRMPLUHeEqmlZjKQveXzqmMTYmVQjV5xsb
         k5XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CKab1OeHMfAJeU/EsGt0YFVRl2woEZULiNYV2Vd3DHs=;
        b=X+71Lky7mKpHstewc3hnLSn8dw4FYn0SV0R+oItwKHpcLSjvZY8Trr1aDmsPPJrYWZ
         79HHN3WqTRhiTvkwE5bhYc0B4F2Ak6Z6dhPIyYkjACJR4TMcZa0H9fjAi6OOi5qMDQhx
         pXxJLmzuVSbM2hiGxCLvnLpvAfbmwgbIWTD2A0CJKKoH9wU5+V1eNhyH274u3n7br1Hx
         hLbzTn0D5mk5GnGN6KtSFuuRjmQMJAcm/jqA/BzbskF350YHX4/ZLvDgk2vO+l6jS1GS
         s7H7PTp72Mtp8FOgyDdOF6XAhvwU6zuoKkoNEo7qErxN7VIuI8+lwH6BaPwVKhyzRdCy
         FJxQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UVR2Qdpb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v23si15917522jao.12.2021.04.13.10.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Apr 2021 10:07:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=UVR2Qdpb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lWMVH-0003X7-7Q
	for alex.bennee@linaro.org; Tue, 13 Apr 2021 13:07:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55878)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMT5-0002Dl-VL; Tue, 13 Apr 2021 13:04:51 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lWMT4-00081S-H6; Tue, 13 Apr 2021 13:04:51 -0400
Received: by mail-wr1-x429.google.com with SMTP id m9so4442748wrx.3;
 Tue, 13 Apr 2021 10:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CKab1OeHMfAJeU/EsGt0YFVRl2woEZULiNYV2Vd3DHs=;
 b=UVR2QdpbahhOapaQUMRsBIdw+o6vJBW7VYq9dqmtztY7VKgpf/xWgnhz5i+nSbgPga
 GMhppFZxHBG6u7dFFTETMyNq3YTc/0Yz7lbhq/Bd8E+ERittwjVr4CzBrZXwhuQ4rZA+
 6vVkOQaGQEz1DVKPZdcXEjXGYu+XHNZOuahcF+pOrG+aDnNOzG+KcQ43eKRBswZqtXoN
 p1mFTtJCJgWAKyN7drrakzILZd6X8+DrnbzrQrRadiIkTWTQM7YF+K6cef8gAwtDX8ka
 zTlQ4j7v0WC3wHKRPCZ4gyQH24bXGICTL9mOo+aeICyXQtGQrsacXAzYI75MPIvVYLHp
 z8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CKab1OeHMfAJeU/EsGt0YFVRl2woEZULiNYV2Vd3DHs=;
 b=TKAQ+9lstOQoFHN/Fi/rUmz8z6xghK4Ky2387U+if2wwQLlnwgcXFVorUms5WkVupR
 MRL8mdj27tc1c3RWFIk0NjKC3jxQpRNZzHhjYzIDi5S2s5zMHByEtmJqEiRoDKEjKTzv
 duuGz7DyLD8OvRVb5UZWoBGUIa3WbIrOkbua8BM4lwdL2ipbL67D2F8wQLLwxGUo3Jkb
 NC2wURJpjSLtURgmZUbyuMzbcVYQmP84EI5+vl8bL6OeTGaSJXGeG84EZE6lFpEUmYfR
 +lQyKZttCYwQczcnb+ph+SXKhBHIjWiBWaOjb1qFTkg2Gj1ZhfCZOziBW8+QhDyqbf0f
 fI/A==
X-Gm-Message-State: AOAM530G5iNI9KmCw4CD5woxW7RjpYfySFu7xjcTusT/14hUZoxPzsAs
 fmUGUUDXmzpQwUhg48wj4ZLmzDwLL94=
X-Received: by 2002:a05:6000:544:: with SMTP id
 b4mr38838372wrf.352.1618333488537; 
 Tue, 13 Apr 2021 10:04:48 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id b206sm2984155wmc.15.2021.04.13.10.04.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Apr 2021 10:04:47 -0700 (PDT)
Subject: Re: [PATCH 13/13] target/arm: Make translate-neon.c.inc its own
 compilation unit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210413160759.5917-1-peter.maydell@linaro.org>
 <20210413160759.5917-14-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <ed9cc659-f6f4-c89f-a1da-294903430fee@amsat.org>
Date: Tue, 13 Apr 2021 19:04:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413160759.5917-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-TUID: WRr7yGPCpOuP

On 4/13/21 6:07 PM, Peter Maydell wrote:
> Switch translate-neon.c.inc from being #included into translate.c
> to being its own compilation unit.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-a32.h                           |  3 +++
>  .../arm/{translate-neon.c.inc => translate-neon.c}   | 12 +++++++-----
>  target/arm/translate.c                               |  3 ---
>  target/arm/meson.build                               |  7 ++++---
>  4 files changed, 14 insertions(+), 11 deletions(-)
>  rename target/arm/{translate-neon.c.inc => translate-neon.c} (99%)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
