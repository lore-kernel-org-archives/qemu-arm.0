Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1264567wrs;
        Sat, 17 Aug 2019 23:12:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwUEFMf+2/nqpoKztSt83QeN4FqjW9z4DVvMgDXCjzCym2k3FdZxto/IHe6/qsaFw/zoR6u
X-Received: by 2002:ac8:368a:: with SMTP id a10mr15841576qtc.143.1566108744356;
        Sat, 17 Aug 2019 23:12:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566108744; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0lP1dlt1/tSj3Ue1JatJU0QT8jMxEUtayBKn/5RHIUj+DEcJhr6rWwYNlakVrgJq5
         csiVNW/D+SVM3ZVVwoGLK+M8MXDDHKsyvQ/44mlolGxvMgho5GQMjOOtNtC5RLAAIt+L
         1dTyY7P2bu/leUlP1qHhVRrnihl5jW80ZEYtUuO0fa0RjgLLN8yuScaxauagzwSpu12k
         HSrCax/6pg9Dh4njDWAoP8Opx71dk3aflZI58R7wfvq2R2ZS1WE1tWEdNvNLxH0pW91A
         VzINgwdrnQvIdv2AX1pqUJ+D7NrDAIdfGWO4KqPDwKed/I2Di+gAB9VbKZ2LYQofnwEv
         Mo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=h3y0DxyZCwedth1gLqUH8RWTXa+YqOagrUSupMHXTBA=;
        b=lyLJ4yrxwkrVzOqLbPyNRj/STykuQCR61GYGGPQnDn1DnoMSaQRtH39I7Iq1m1eG2D
         USpSLleSZwl5vDY3SsHO1JUKKai+9hUMsydTytFusHcuJUCbkiYwaqVLyjpOHQefmjVx
         4qPDNA6YrFJF9NTCtGFJwsjxh1cdY1HkA2PgL1ZBpjJSas2xC9oOey73ZGmcHWzcQbAM
         7duPkR469sudSJLZasDe0dx390jvHFpS30Vbn1e4Tvz2p1X0maomDSNfGNW4smDDM8ZJ
         /s2KCouJjNKnnNEnjrJY/pJdkMzcKpLpXHy1u6oWSwfS0tOALNi2LR2Ma31oiSKkk7j0
         s8tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JlZhK7lR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b62si6802830qkd.94.2019.08.17.23.12.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 17 Aug 2019 23:12:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JlZhK7lR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hzEQR-00083S-Om
	for alex.bennee@linaro.org; Sun, 18 Aug 2019 02:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33993)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1hzEQI-00082W-7z
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 02:12:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hzEQH-00060F-5M
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 02:12:14 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35311)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hzEQG-0005z6-TG
 for qemu-arm@nongnu.org; Sun, 18 Aug 2019 02:12:13 -0400
Received: by mail-wm1-x342.google.com with SMTP id l2so315154wmg.0
 for <qemu-arm@nongnu.org>; Sat, 17 Aug 2019 23:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h3y0DxyZCwedth1gLqUH8RWTXa+YqOagrUSupMHXTBA=;
 b=JlZhK7lRBpCxl1eyDDxpTQX7KWNeixGrOUuJSaaAnhucCUDrKM1l0167mVNhviLz+9
 ++VIZrdBEIUXrtl5y1Pu4GREJeFKv2/XsGYHxyRLmCBUA4pvdjzs19AobHLRUUcwa3ir
 I1uWPAXSQHqawRDwtvYprOVbErIGLNqOJSONsthI0XBcV43NtXEDF9qJUGjI/oXjwMvm
 P19wI1gJOvwKWCpKPNx8QX1G6wna6U4dvtWkxyEFXE2aqPcaWjF6/bg/lsaO+y9IaFV5
 cN0gCY5Q26qxZdzzLietm932wKr6FIku81r++fwnIkWc/UHigVZnLyaeRY2QO1OdEY3w
 f79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h3y0DxyZCwedth1gLqUH8RWTXa+YqOagrUSupMHXTBA=;
 b=lHeYVhSLc9lxecOEZ4CfI73aV2Iho4VcW+4tpZbN0WeoQ7tSLJK7ttMPJm6LKT/+ze
 IDMKS2x1+ctaUQkv/YoBYiPzyKo0mPYtoMeZkBHuWxjnK425OWKwMed0E1hucSAlV6X/
 qp/AuCXpQ1PMYZX5xmcasoSYRVt8a34KcqEdbCZccfEi5FZCiurh9fNSdB61reOTRtjF
 Xe3FuLs6cqmjcdWeflY4fqnKiBoeOQ1tNJFEjL/vMe5iiPszU03Xin8U15oFEIYSKMFx
 bXTdH6X/L5mZ69mtDbyEK2vvPowcogQwNixxXhEOxvu8cyX64olaUP3YXphWOpnzhWWZ
 LG+A==
X-Gm-Message-State: APjAAAVkeKQgvMMv0qs4gC6zB/L93v/mOYy/f5kjQniZKLJ/aKEAUK/Y
 bugPcG3lL3s6Hy6zGC8I8hgyLg==
X-Received: by 2002:a1c:2015:: with SMTP id g21mr13755308wmg.33.1566108730558; 
 Sat, 17 Aug 2019 23:12:10 -0700 (PDT)
Received: from ?IPv6:2a02:c7f:a69:1700:8897:9507:94c2:b98d?
 ([2a02:c7f:a69:1700:8897:9507:94c2:b98d])
 by smtp.gmail.com with ESMTPSA id 6sm8915257wmf.23.2019.08.17.23.12.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 17 Aug 2019 23:12:09 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190816125802.25877-1-peter.maydell@linaro.org>
 <20190816125802.25877-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <750250d4-e4a0-43de-add5-24488b87cfea@linaro.org>
Date: Sun, 18 Aug 2019 07:12:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190816125802.25877-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] target/arm: Allow
 ARMCPRegInfo read/write functions to throw exceptions
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
X-TUID: aNOjJSBBF4f4

On 8/16/19 1:58 PM, Peter Maydell wrote:
> @@ -1729,6 +1729,12 @@ static void handle_sys(DisasContext *s, uint32_t insn, bool isread,
>          tcg_temp_free_ptr(tmpptr);
>          tcg_temp_free_i32(tcg_syn);
>          tcg_temp_free_i32(tcg_isread);
> +    } else if (ri->type & ARM_CP_RAISES_EXC) {
> +        /*
> +         * The readfn or writefn might raise an exception;
> +         * synchronize the CPU state in case it does.
> +         */
> +        gen_a64_set_pc_im(s->pc - 4);

This will now need an update for master, but otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
