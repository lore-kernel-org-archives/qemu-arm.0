Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp5364800lfc;
        Wed, 28 Jul 2021 23:33:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNXhWTmjzbVDAJhk/7NqP2NJcC/g6Twd2ViQBduvZW1HdDxOKeZjm80F+hx9DnLduAPEyw
X-Received: by 2002:a05:6e02:1a05:: with SMTP id s5mr2530678ild.232.1627540391217;
        Wed, 28 Jul 2021 23:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627540391; cv=none;
        d=google.com; s=arc-20160816;
        b=LdtKV71r/PjWG711Q1SBdJk4LHHboY54XcvVebQJkpDZQJcVVTMO+4roYn5Ip4QuGD
         T06tBDEYXoIzv7mUnATEHHNrqL6KZApfJ9yzA4XNcccg04u1HUHdO3P2NoIBjZBm1+yb
         11UPhxCn9mEJ/iQZ6GZ9uSIQdOxM6lOO/RJK94ofU7xdWHiC0Fh2GM9h9jZgdUeb2P8U
         MkdhSOGrrnXS9WmF2/a0yLH5P8m6v4K7ApzRKBflur9qWnqhLJjvMpJZuCZ8rYMRYHpi
         CEE0H/sFKcpdIK+7p20HGMv1cTGz4KEFXe4P/OilhtnHISRMoiBg5WQnQcNSq63NvZnB
         khIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HCHdsQzanzJy4nKWlivVc4Sng8fP/PG7w5X+Z2gtq4g=;
        b=fOYT9PEm3qSTuSlmAM4Cz49vWcZTV1ugC6bgSev5LzyTrtdLC4DClJWprrpMbomYd6
         AAaybgWRYf/RzTtHkY6aRhbqF//p/drTZzWTuhfL305+mhPD5+9bWdOxwvzmoVnG6AfB
         XFrTfOjmoCIvcGH8w0ym5xu24Fjhn3ddGn7BdxyJ8Kqv8/D24n65k9KN/NOh2ZEoO7dF
         8ubaPFyS8EagC06Sitf63aCyjHYPm9QJouOsIDFQUPtxr68aQASFRMf+nxWCwyEINr4d
         Tiy4QjxOsHU6QmmLfsENWySzSpwp7qxV/op0ph3dc6DzPPXSQsLLx43O1Q2ZTcN5uqkY
         RBFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jMjTGC9a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w4si2305737ioa.95.2021.07.28.23.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Jul 2021 23:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=jMjTGC9a;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m8zbS-0002F2-Ju
	for alex.bennee@linaro.org; Thu, 29 Jul 2021 02:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zbI-0002DS-4i; Thu, 29 Jul 2021 02:33:01 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:42978)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m8zbG-0007nj-NP; Thu, 29 Jul 2021 02:32:59 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso3240933wmp.1; 
 Wed, 28 Jul 2021 23:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HCHdsQzanzJy4nKWlivVc4Sng8fP/PG7w5X+Z2gtq4g=;
 b=jMjTGC9a1vP+m1LXGLp61zv9mBPcp6eytMmeMJHAeh1f1Uv3DwmrkRdpLYuPbfMPPK
 cxwo/We7z233wezwYVOU0nlDrNjgU9mpBgv6/p4CBKXgVoOUdklZMS4tACyd6UMWfrRz
 wrlflNhjn5fMWX+qqjBJrwF5x4DW1KiCJXFG8HTLIuY0MewLCEGe4YGRQgD0uSHaaH2F
 H2UkdCZAj0rSskB9339QSo7ihKO6B/kucDYg5xRiHCNL2OekindMpIRRpo8fPY2SXAQh
 qFg9VO7sYx8TvplT+L7rr8pby1GSusLmpsBVeTfvMrpZkVr1ODuwOAO1Gy8U1AB5Ki+l
 4QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HCHdsQzanzJy4nKWlivVc4Sng8fP/PG7w5X+Z2gtq4g=;
 b=SkJXXNYTIXHGTc8xvHBY+FAAC7p8ffjjQFTTXSVBNwqI0MhmmA33OcgYsvmQIFoQs3
 2BBslG+AzuZy2gmECE69r36WMv+nq3kbk77tJ6HZZc4MBraz/RKMae0zmsIXZwjWOGPz
 r9KiZDsppiLlsk1QYhKNFd7KB6/nXZ13vkk2xiAKngOKk4yyH9ctbXV42ataUrl40BEv
 PmE5oWcNFF25wdfP9fC1ZUE+sC4DoseTahWE/wP3+kptHbw90y20CIR7xEZRuR00pShA
 fRRrZQBGvrTIkgJ3XLvVF0OWnuk6g8/njuaTlezP6M7k+I4NOhYszIbm4KbqT519arsq
 dP3g==
X-Gm-Message-State: AOAM530Fu+ByLpHikXVEBvm3XDIFNWO6OiuSxRNHKZTb/RuZo7cG4njC
 2CPZ0m4KjqplsEI/YNXY9cOEKbwV0ZsM2g==
X-Received: by 2002:a7b:c081:: with SMTP id r1mr12714958wmh.72.1627540376606; 
 Wed, 28 Jul 2021 23:32:56 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id w5sm2636679wro.45.2021.07.28.23.32.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jul 2021 23:32:56 -0700 (PDT)
Subject: Re: [PATCH for-6.2 27/43] target/arm: Use MO_128 for 16 byte atomics
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210729004647.282017-1-richard.henderson@linaro.org>
 <20210729004647.282017-28-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <cf2612dc-57e5-8f32-1dae-d4c8374218d9@amsat.org>
Date: Thu, 29 Jul 2021 08:32:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729004647.282017-28-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.277,
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gsRQnTBf/wds

On 7/29/21 2:46 AM, Richard Henderson wrote:
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
