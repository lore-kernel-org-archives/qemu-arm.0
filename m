Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2807358lfm;
        Mon, 29 Jun 2020 02:17:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ5nsuo+Y3J8Cr4AWfkkjEtsJwRyq7p1NCh1jp10hr0ZmQZgZrapQvOooQsRK6QBLz331+
X-Received: by 2002:a25:d08c:: with SMTP id h134mr25665897ybg.513.1593422245719;
        Mon, 29 Jun 2020 02:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593422245; cv=none;
        d=google.com; s=arc-20160816;
        b=jN0eYXrkyZ03TEWcvxmknyVoN+TTadh7dAKdrm7EYJagya0BISvGzpQsdXOt9wSVE0
         zGF29m+aNPJ4o9MzN/Qh2cEMuWPec7CkDb51BEOk3hqHS/8wRhAvjGAmP+iziFskabOt
         gGzkiaW3y1ETOKZmCt0BGQo85WsqM6hJjCQyHyHtXwvZx5hjmPWL4Yb9Rh/b9m9oJJqe
         HRTLmm8+GzUY0C2CNh18I/twQixMQXOilJTdD2M/cAbbelcyPEeHP6XUQRvxDtWsHL0O
         wCkpF81JTCn87kKJ6rYqCvhbButWTguof5igxtm9+WEWeTjQaktzs6hhX7BtHXiqjebE
         qRHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=De32tOa44wWJK+6QZams9i4WwY0Bm0bGrUY1JCdKVvY=;
        b=BVBzR9TaS0p1MMvPi2BIfR0hI0TAk0sEq9BURZMFhAbsE3WmDa5VJd+iD5j5U9IIsU
         8W5uWZnbOu9yoRFeBvmHTmtmKfMEDeBBj2geBMbkkrcwZJqhJr/B/KJF3zQyE3YkBsZK
         U1QYi9quV7EAOsdJHgx/B/lTu9huoy1/JbODXUyiIQgZkcwDsGVA2e/zeUO1zPEfw7HD
         NNvm1ykh5uhh9It3+mCH+zLHpzafn1P37OR2gXqikEB/nwlm+5OvWAt4FDKeZXHa/eP5
         1jgUjRkaZ5YOYE8SerEv54+EFqrbzj06jc09fAnMFlXLcQktfdPL/kMMxUlmFhFLAydi
         l2aw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F6CdPRDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l126si23866621ybc.480.2020.06.29.02.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jun 2020 02:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=F6CdPRDB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:39008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jppun-0005RN-1c
	for alex.bennee@linaro.org; Mon, 29 Jun 2020 05:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jppuc-0005PW-PZ; Mon, 29 Jun 2020 05:17:16 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:53032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jppua-0005Tw-Ir; Mon, 29 Jun 2020 05:17:13 -0400
Received: by mail-wm1-x342.google.com with SMTP id q15so14651302wmj.2;
 Mon, 29 Jun 2020 02:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=De32tOa44wWJK+6QZams9i4WwY0Bm0bGrUY1JCdKVvY=;
 b=F6CdPRDBSKkMxgJ9pBzreSsHubfRLlD8sSEqcl8qbTYqBf2g/2iFPvubAzmmb3aKrG
 hGbrJdU/DxquSMTwRv6pEXrx60DOZAifs068YTFnRbdLKLC5Q+uO5W8FwdA0qLeXt3rc
 vNjCGZo0SFCdb7BFgfh2RMbbv/w86FxXh1PgVrzicXN2zfSV9xAk4BAIvVYgR8rf0Huu
 ZCHDc7IV5flbTGyTo646/aDGFzR2oi2pWuFG18dd2vDTsG0zwBG6PHtqmdbWXF5O/0Tv
 S2qpqO4YZYDvLdJ1sqgOKA3dLYUMiehTVrRyzF3IXR7viZ7GxEWwCyoLOsizpq3xQM8O
 8ylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=De32tOa44wWJK+6QZams9i4WwY0Bm0bGrUY1JCdKVvY=;
 b=JKBo5CK0nUfZYaB1TrrkTRFNRfYBtuvFp/0c9Tn33FJRpLH/eCWpRnduNZRaE9hSas
 Qt0m5egiR5GESPRZZ1+gh69QZeD3QSl1nwL/85dYn1ulOkB/de2Ae6GjOD9TVi8Mk+df
 HKY7ETQIj0UylJzRPoO3er4tUSxDnnWTtiRr4uAojm5omKNypaqcrvJFjelkEpF+HhBM
 uPD8J1FanIWddLTtSs8C92vhGM+0SQHdjb704CF9WmmdW7kjgup6TStlldgtZqapnQL9
 f0UMO+HmHG/A4pqPxQCHbgGVUGdItdb7154d/alnek+D9khPEaTFYT7CyPEgx5KB5coN
 x9Ig==
X-Gm-Message-State: AOAM53099OwzmQUu9xfniTOzOmYDE/GTBErHE3dmGPC4caBhHzV4ysvr
 QlZfIp0Y66LjGGev3iJzVnw=
X-Received: by 2002:a1c:a7c4:: with SMTP id q187mr15372881wme.0.1593422230140; 
 Mon, 29 Jun 2020 02:17:10 -0700 (PDT)
Received: from [192.168.1.37] (1.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.1])
 by smtp.gmail.com with ESMTPSA id f12sm18299887wrj.48.2020.06.29.02.17.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 02:17:09 -0700 (PDT)
Subject: Re: [PATCH 16/17] hw/arm/spitz: Provide usual QOM macros for
 corgi-ssp and spitz-lcdtg
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200628142429.17111-1-peter.maydell@linaro.org>
 <20200628142429.17111-17-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1962ab16-5548-674a-1f76-7b3c265dd09a@amsat.org>
Date: Mon, 29 Jun 2020 11:17:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200628142429.17111-17-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w8bl9YkItqs/

On 6/28/20 4:24 PM, Peter Maydell wrote:
> The QOM types "spitz-lcdtg" and "corgi-ssp" are missing the
> usual QOM TYPE and casting macros; provide and use them.
> 
> In particular, we can safely use the QOM cast macros instead of
> FROM_SSI_SLAVE() because in both cases the 'ssidev' field of
> the instance state struct is the first field in it.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/arm/spitz.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
