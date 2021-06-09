Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp5705819lfa;
        Wed, 9 Jun 2021 13:06:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy83Su+Arth9LXAobmVicgAKtD5R0O26mAv2+1sp7GMJ/BE1eQNBuAGTokj0JhV0yUoCJk6
X-Received: by 2002:a05:600c:5122:: with SMTP id o34mr1528472wms.168.1623269203010;
        Wed, 09 Jun 2021 13:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623269203; cv=none;
        d=google.com; s=arc-20160816;
        b=Bj5oD5VZZk9FPrl6bSyKVy9TzihCZdjxgYA/gEMyRbj3cYbLHSdwglpDdw5aRJg724
         1M3mUSqSpDISIkjB9hokCgkMPzalEiL/K6IEmCrZzLlPQeEmuJ654CD6wm/U+cZBhkYZ
         kOEsut+UyVCAqDMLf7shV5Nhze8562NDyw8UZ20yKERyT1VyVL5WTsSkqc86X6Cm01i/
         Fx6VWIafZFv4fAVGPMybhnC7swvGPGfXh/bcPrBsq/clOcm5t6YLG1ux1+rG+TeIDcCJ
         VupiF/xTFHe6LqBPtTxAea79/NKlcyyuaNkfSZEWWHiaoWAejZcrbXjUaHYyLhd2FWtZ
         iF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=t/GcnXkt0B1zDhtD0NhFS2xFgiEOdnKcD5sSNab1NCI=;
        b=SZGDSqSFqWoIJptpd0BvNXtRjN0zG2yPpnLFvXWrcdLeqy1RZlMrNs60V1ceE1XV/3
         EEMPsZY7NTKujKdcqXw+mjV9CtzcWsIoaxq2EpakjqdH+OwwipEJ2esdBFOxX1HaksFM
         E+WhbD1R1j3215F1lICt14HpgatmEsjg3j7/fJ9hlMro9M6xqVJYOjLO9Ow6GDAJs93H
         n1uPiw18VIKCVjDYg2Pil5c1fupC63+OybdfSzljjJblfwWf7m7CmX7X6ErKNOR2m6Pj
         MNQpVtCjvMNFS13t53OG6yBFT0d/XuKpbIt8FnUhQ3G/xPwE168EpKTeVhDYijkHgNt2
         hFOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jr+ewOns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o22si895828wmq.179.2021.06.09.13.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Jun 2021 13:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jr+ewOns;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lr4TK-0005OB-5A
	for alex.bennee@linaro.org; Wed, 09 Jun 2021 16:06:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4SP-0003rM-Sq
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 16:05:47 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:53997)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lr4SO-0002SN-75
 for qemu-arm@nongnu.org; Wed, 09 Jun 2021 16:05:45 -0400
Received: by mail-pj1-x1036.google.com with SMTP id ei4so2160755pjb.3
 for <qemu-arm@nongnu.org>; Wed, 09 Jun 2021 13:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=t/GcnXkt0B1zDhtD0NhFS2xFgiEOdnKcD5sSNab1NCI=;
 b=jr+ewOnscH9behmtwWQwgePBlr+vXWl9ANPIvp6weQUXwsn50EgtMnKmveH+fR1T7M
 6ph3XkoxltUMQpV+RG0t2uZcNttbb2KysL1Xib5n9bP/ZHa4UD4BHPIeLIAuJ0W/vOS8
 gj8NkfZswY5272liAhYQqagn7vcAoS3CW4YVHl6+jy3vNCKp+u4AsrUWiMFZ6Fn7uFtj
 uT2wySY/8B8nwoPJn6nxwTdO1VPauvdwRwJAz1YYEudCOl4ehMGq4u2M8lNJmIMZfAea
 AvlKu2n6/Belu9nossmwx2M+D2CZjJBJEziV+dMhtjBNVcANyLGTeZO0wxMaLyUTZVrY
 RRrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=t/GcnXkt0B1zDhtD0NhFS2xFgiEOdnKcD5sSNab1NCI=;
 b=sijbpMKSQKpq+rJVwA9rylomsdqdqfZpK15myVF2iPaHEAf6WnQk6l23IF7Ki+x0S6
 4Ce3siwK8K8RQTcNroGFvK1CJpgEMaKu8saJYSvuWM8USz8hQpgQH7wOmXGdypQbMsH/
 y345OpTTcmA8Ih51xiw1vhxi1RgcqLXy968c+2kEf7mA3BawcGc8V0hRgnNlQLu9vTyd
 Yw9Q5AyznzVZQLJ6vsIgY9UaDGnjBivwVJyRFiQLnZ4Xrf3RIxe2jvYO0wirag25vVSM
 fxTQ3CeN1s5Ia7wFGASDS668rhyapzb9sHk5uM+uxTy2ZLX+wLq4AFpBNtjAfoJfAzvZ
 rcxw==
X-Gm-Message-State: AOAM5307Z9DlPhXtW+m03t1xC37CtAqWyyl+qyvKJV78h9InsNAxbqG9
 Y4ck9INFg6IkkKp/v/d5GbtpiA==
X-Received: by 2002:a17:90b:1113:: with SMTP id
 gi19mr11974837pjb.96.1623269142518; 
 Wed, 09 Jun 2021 13:05:42 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 k136sm362881pfd.87.2021.06.09.13.05.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 13:05:42 -0700 (PDT)
Subject: Re: [PATCH 47/55] target/arm: Implement MVE VQDMLADH and VQRDMLADH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-48-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91f3abe8-f3b9-5401-10fd-e9f01dd0d319@linaro.org>
Date: Wed, 9 Jun 2021 13:05:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-48-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1036.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: XKYYbIMABcCJ

On 6/7/21 9:58 AM, Peter Maydell wrote:
> +static int32_t do_vqdmladh_w(int32_t a, int32_t b, int32_t c, int32_t d,
> +                             int round, bool *sat)
> +{
> +    int64_t m1 = (int64_t)a * b;
> +    int64_t m2 = (int64_t)c * d;
> +    int64_t r;
> +    /*
> +     * Architecturally we should do the entire add, double, round
> +     * and then check for saturation. We do three saturating adds,
> +     * but we need to be careful about the order. If the first
> +     * m1 + m2 saturates then it's impossible for the *2+rc to
> +     * bring it back into the non-saturated range. However, if
> +     * m1 + m2 is negative then it's possible that doing the doubling
> +     * would take the intermediate result below INT64_MAX and the
> +     * addition of the rounding constant then brings it back in range.
> +     * So we add half the rounding constant before doubling rather
> +     * than adding the rounding constant after the doubling.
> +     */
> +    if (sadd64_overflow(m1, m2, &r) ||
> +        sadd64_overflow(r, (round << 30), &r) ||
> +        sadd64_overflow(r, r, &r)) {

Ooh, ahh, an operation that doesn't even exist in SVE2.
Nice use of the new interface, btw.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
