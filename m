Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp264638lfc;
        Wed, 10 Jun 2020 00:35:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzrCn7WO8jYqKbL6xtgzu64jFMqirfgddrgJP21aenB1zrwvayhGb7oMW7ThVfZcayA3pJR
X-Received: by 2002:a25:c5c3:: with SMTP id v186mr3161074ybe.233.1591774506470;
        Wed, 10 Jun 2020 00:35:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591774506; cv=none;
        d=google.com; s=arc-20160816;
        b=WmMqfa415KJ6wJNwbTLuJyfDTsoMEAkCvsyrj8Sy5JePeOH1Ll7ecrNLtlUGTvVdAz
         dlhUqSZ/VCqkxM3s3Lsiio11CuoAHApeuX7j04zqeq+Fy9fIwUDRjZu36Oa/jaBJ1JyN
         VNz1pNoER2/dJLtWQe20EUzCV2Q8nInTIXBSX2v3rbx8qEK3A1+btk0Me8ZBk93xT9sE
         vZnpzPwOmj/JiP05avbQNLzjsvSB1mIsOlZfpQhqDK2KaFRHYQZPX0zb8DGvgYIViQjR
         q/OnRZiaUxBZ57dpomTS0yqGLScV+pQD0+OY9LLDthIdl3CRLQrt1vZ9kJh+JDEm+jB0
         VLyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dcRIs1CHwGioZTibo8sJvnFHbc926IVBpeMkqzH+5/s=;
        b=t/RsOh8t4ac+/44tE3u0FuKlx9e8k3U+3FB2z48z6LxXB6Qxz81tfhffy9P6C3t06U
         pEPyKhh6Wv/asFWEy12dE2/JJ6ANeZ1cdM/SKE/zNAlTGJWeh8aIxjazNrEocqLOR+jX
         gWfBAPs/LiYTNT0KDgt0r6J8csyi+BKW2OB0ThqQgZaDbo/U3nY0dZ36Mcb2dy1t+O8I
         l/JL0+NuR5/v7oEwSyGstCvR43LpZVh1tbP8KxP+/RXIXj48Z0dJGZ6oJAA4VnhjC0qZ
         LH89NwYlaMQrI6BJCSQeBqORexRRfxqYRohi74QjJuhmB7/oBOWnP84k796sWYRE5Q01
         paag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H+QdMBPb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f62si4528593ybc.205.2020.06.10.00.35.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Jun 2020 00:35:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=H+QdMBPb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:41400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jivGL-0006t5-R5
	for alex.bennee@linaro.org; Wed, 10 Jun 2020 03:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jivGC-0006rx-1E; Wed, 10 Jun 2020 03:34:56 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37751)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1jivGA-0001pP-Hk; Wed, 10 Jun 2020 03:34:55 -0400
Received: by mail-wm1-x344.google.com with SMTP id y20so825980wmi.2;
 Wed, 10 Jun 2020 00:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=dcRIs1CHwGioZTibo8sJvnFHbc926IVBpeMkqzH+5/s=;
 b=H+QdMBPbsfP42rQBaCLrEwF37qx5q5v8mHpv3Bswr3NwYeK3DNjyAJ53KxMvWJmonA
 GLwYgtN65vMxeSCjA7Ajj1ocB6Fj/2eIW27AMqNXlTB4WqEicXuP0WR7Y4UaLc7Dp625
 CwikqVUwgMy7ENYCSc3uE1DL6K1x6xdY66UuYG6XwCZllpBGDQQlc13oewqR5VxFaEXA
 4U/t/o67VHs7XKQb0bNSpa6VUV8sLf5lZ+7jcC6JnRrI2yhDq7HVbyoNWIcPj3uRsXXs
 lwcZXeUBxVT525dPVEhWRgQm0QiI+l+V7N5XayCIujw5MfagcgOZ+zt6UQKRCFeFBiai
 r0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dcRIs1CHwGioZTibo8sJvnFHbc926IVBpeMkqzH+5/s=;
 b=mRr5aeDA1Ldbj4xiw1LZPSgf0GMEEWJ4nQeCoxcLgqY3QhjMLoaP4EcIsD/je4AykI
 6OEYU5/c4C+mLPvChoT9mPwVH4XYPA6UH5GWNCaZWhCg+hkUgpSuh2P9FyUvUN5uVwCr
 MthoGS7Jg0HV2OByC1VY2OmJ3ceefS5Q6m+HHo+4NnG5juq2aRKgG8tlT0YipMD3CQ36
 8GbH13+M+2D7+R6BEgPSMldVK9e0UbjMW07nWGby3o+YbHH11nSm1R1fieqLy/lgmf+W
 p0SZJ0G2R2hW35f602ny4PmuNRXOKGHfyXMDBq5XeSFizoVI1PA128OovRHV4njyJZNJ
 W9fQ==
X-Gm-Message-State: AOAM530UZ4VOBF2XBfIZXnKfV/eYLuvYDP+klkPBZEXKu4yBvPR/XJhd
 luMiP8TBSo3YuvWPihLoWJ11CjrS
X-Received: by 2002:a1c:bc0a:: with SMTP id m10mr1733113wmf.173.1591774481098; 
 Wed, 10 Jun 2020 00:34:41 -0700 (PDT)
Received: from [192.168.1.38] (181.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id c6sm5732767wma.15.2020.06.10.00.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jun 2020 00:34:40 -0700 (PDT)
Subject: Re: [PATCH 1/7] target/arm: Fix missing temp frees in do_vshll_2sh
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200609160209.29960-1-peter.maydell@linaro.org>
 <20200609160209.29960-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7f575d04-1294-cb2a-ea4b-2b8f20b15a93@amsat.org>
Date: Wed, 10 Jun 2020 09:34:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200609160209.29960-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GncPHAl6kMss

On 6/9/20 6:02 PM, Peter Maydell wrote:
> The widenfn() in do_vshll_2sh() does not free the input 32-bit
> TCGv, so we need to do this in the calling code.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/translate-neon.inc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
> index 664d3612607..299a61f067b 100644
> --- a/target/arm/translate-neon.inc.c
> +++ b/target/arm/translate-neon.inc.c
> @@ -1624,6 +1624,7 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
>      tmp = tcg_temp_new_i64();
>  
>      widenfn(tmp, rm0);
> +    tcg_temp_free_i32(rm0);
>      if (a->shift != 0) {
>          tcg_gen_shli_i64(tmp, tmp, a->shift);
>          tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
> @@ -1631,6 +1632,7 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
>      neon_store_reg64(tmp, a->vd);
>  
>      widenfn(tmp, rm1);
> +    tcg_temp_free_i32(rm1);
>      if (a->shift != 0) {
>          tcg_gen_shli_i64(tmp, tmp, a->shift);
>          tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
> 

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

