Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2498684lfq;
        Fri, 9 Oct 2020 10:57:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNYLszp2+eJ8I1Q6FZbTV8c6ITFz0FdBYBimEw6GGTsBLqMlcpkYb6i7kMuum5C6spGEOq
X-Received: by 2002:a25:e406:: with SMTP id b6mr10583820ybh.322.1602266266759;
        Fri, 09 Oct 2020 10:57:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602266266; cv=none;
        d=google.com; s=arc-20160816;
        b=DB41Vc3Hr6DRbwfH+/gcGbq5znKdKioXchViuvRPTWUyeRpaAdp0EfQJlR2JUx9SmQ
         SEhY/jFIla39/tHlTQR/B3Ng1OkcxgDaRgDsUUwgAlP6bI82EZErFKCyluXOS3idNqRl
         WD36P3U1v5+1c59M+xAzrBtYS4GtVH8rhXZdRJw6O71Qcd2eGItHRYuiaN1g5NmsrR+U
         OShnG27UhJnCGH35w0dj8J7U32wb+L9EDkjq1NcLZOSeGMXzeKS/de0KexPFY1qL7y1m
         tRVXqMVhxBmu/HpzoWhW9iMyRDIn4die8NIBaQfNLtj9fAkV3uBTTUy99+dgQ8NsFdEU
         qNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VWXoUlhrihZHdeYv9Q6pYpDUJLFdpFM3zZJeR3athUQ=;
        b=qmQzlZ+q69YQE1N4SYrGVT3WkI3o9w/Q1OTjZP6ZPtUAKxYkdR6PSUVmm4rElpXjfT
         9F6HPz8I5n9JbYJA4HD2MUfvkNxKle2mkmgySbYw2nL5TKun3wcUKLsTGrnIP1ys3bZ5
         gTN3MtwO34sTbA4WO1P5J3T4GeRAGdnsfm0Ybq/BjGpsiR1N3iZAmo5Xy4ADlWxeNZWY
         AguE+Ew0k6SS1OrM1CMwfE+cgnvpZAi5T/j6yHxWlnPyOzyLispYhkrZt8BKMNZkn9IP
         jgA+HgOSn0jzQvZfylAh/HQICT115vpDBEh3Fcno+M/tpgUNsZ2DHIr54VvOcp9gatJ2
         5UCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pMmU0brW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a10si7892489ybc.35.2020.10.09.10.57.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 10:57:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pMmU0brW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQweI-0006vk-62
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 13:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQwe0-0006tC-FH
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 13:57:28 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:46967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kQwdy-0007xm-MR
 for qemu-arm@nongnu.org; Fri, 09 Oct 2020 13:57:27 -0400
Received: by mail-oi1-x22b.google.com with SMTP id u126so10995448oif.13
 for <qemu-arm@nongnu.org>; Fri, 09 Oct 2020 10:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=VWXoUlhrihZHdeYv9Q6pYpDUJLFdpFM3zZJeR3athUQ=;
 b=pMmU0brWHROdC8egsL7tibGSPKgk9SBqjJODnfpSDaYLOmehA+z30BPNZZrylMUmyO
 aCeQDrhZIp28aolGel/CITVyndtPB6wWHL1/Vpa5uH7b1iG2ZD3CZ2Yz1tiibGYe4pDt
 H6kweI7osq2T1ZZ4mAACyHuR9E3qGpsZSYppXdySYFojdQthhJ0dw1rzxYRoNiMKMqaX
 J5h5LxeSVq+CLi8le7UTc7gyv66DeOgim4B/DXBfNRiHaGVtM+jxH2XZc1FV3/pn+zdo
 iD4nr7A65FLsnSLLcFXWYdlVXXwT+5bwdwND9D8M5RK+RgXCiq4hG//d2dMaBJg3H0Xm
 rVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VWXoUlhrihZHdeYv9Q6pYpDUJLFdpFM3zZJeR3athUQ=;
 b=Bhikbrt25UfOd3UvbzF23YFQ97CZ9n7+N4v/nzdCyhvvGf3VYVEU9bmKPQbU5oBBOB
 ECc/ByKkozRMO+7GAcp3VSXHPh2gu5dpiUSvsNoLvC1WbIC0XKzIiWVd3wdUDI8Ejgja
 el3vHrwOupSDoJwUBCgi9hpE390YHHuFn6tfIAAz+NO03ydRXAQeOM5ucVa2muziIrR1
 K6O1zLAfZg3SuWbilLmhKkB8a3nx0SqAIqdVk6CMpCAHxdtzKTAU6LkFi+VYNCC9+KoT
 IhoodbHt1yRhKg5hMGExERoyyMDpj1NvJ662BOEnX8239BkRX0Xfzjxmv/fgH3CUuUor
 am/g==
X-Gm-Message-State: AOAM531kuaKfWnF4gN+UkoBwLZOvo4ndZxMaQnqW98VFqh+V334WlZVd
 oaV3YAnc+SuZmj1U6IHOFv/39w==
X-Received: by 2002:aca:e0d5:: with SMTP id x204mr3042000oig.160.1602266245219; 
 Fri, 09 Oct 2020 10:57:25 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id d9sm7375737oig.56.2020.10.09.10.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Oct 2020 10:57:24 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Fix SMLAD incorrect setting of Q bit
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201009144712.11187-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9b6bcfac-922d-675c-d7b4-35491a3efe60@linaro.org>
Date: Fri, 9 Oct 2020 12:57:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201009144712.11187-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.208,
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
X-TUID: 9P3Upe57RRbn

On 10/9/20 9:47 AM, Peter Maydell wrote:
> +        /*
> +         * t1 is the low half of the result which goes into Rd.
> +         * We have overflow and must set Q if the high half (t2)
> +         * is different from the sign-extension of t1.
> +         */
> +        t3 = tcg_temp_new_i32();
> +        tcg_gen_sari_i32(t3, t1, 31);
> +        qf = load_cpu_field(QF);
> +        one = tcg_const_i32(1);
> +        tcg_gen_movcond_i32(TCG_COND_NE, qf, t2, t3, one, qf);
> +        store_cpu_field(qf, QF);

This works, however, QF is not restricted to {0,1}.

Perhaps this is simpler?

	qf = load_cpu_field(QF);
	/* t1 is the low half; extract the sign bit */
	tcg_gen_shri_i32(t3, t1, 31);
	/* t2 is the high half; must be 0 or -1,
	   and the extension of the sign bit.  adding them
	   must equal 0 (0 + 0 = 0; -1 + 1 = 0). */
	tcg_gen_add_i32(t3, t3, t2);
	/* Any non-zero result sets QF */
	tcg_gen_or_i32(qf, qf, t3);
	store_cpu_field(qf, QF);

Either way,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
