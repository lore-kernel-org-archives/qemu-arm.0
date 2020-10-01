Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp743895lfq;
        Thu, 1 Oct 2020 10:14:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb45mmeeUjDT63LRhYFKf9Ijd6/V1foSnq3rU683fChJaoWmFKA0vl+2nAYhQnB+wwTLRY
X-Received: by 2002:a25:44:: with SMTP id 65mr11698013yba.6.1601572466674;
        Thu, 01 Oct 2020 10:14:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601572466; cv=none;
        d=google.com; s=arc-20160816;
        b=Bx8b8eTkwJCOBrqCWx5NF1Tj5WbMt3SPNP98klWoU+YnVyg83VqFEHrPNVHCqULOta
         /SxRfHETNnU/ww2Hiwxn0QjeHgf3SVPFHaWld1iRGBEDZ00Y1s5/4gfkckcjihDx92IK
         7H5lA1D7SI6cGh+WDvn21FRBQ/1uWdfZHgbhf8XiQRkIme5UUzTybeW8wuypnFqg65FI
         XIIcMi8AcoAXzNLLsZkRdkIYC0NetVzuM6V1RclDFHAkumYkPvIKa3nJSRlywBpu48p4
         Z9NhGEnqAZKMsYzvuvrDK5D3DjWwvw0PqlrVvvwPLqrjU4VbznCOX6lSnAnZjHW1CLKX
         AVXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RQlFEpLKBh5i/mlvWh+6qpQClVJ+XtthGnl3HhZREwI=;
        b=RnRi+f7S1mCu8lsObuOtpflpZC0nbj4ghgHE7tyqPNurpLLHxMvh4sZstKyF/zTTYu
         peR04wboPJW9uqnM1q7cm2zJUgN8YtUgBbGcIgvEF4UkgT7zNxKFWmSF5XfwVshjfWD4
         Lq7Llmmf1YCskOAiPjG71/7+zlQ0MRTcLFS75krEKhO3UgYOwxuSalFDu9cITrf5SVKS
         pkZ7q3VHGGTcmmVGwHdDuxa+dog9h1m5uOJ6s/psYnZsZ/e0XytqRC9fxBvLIajnOQtw
         Qug/SnnRV2NQ3WMgaEBoV6oPwkTKAjXwL6n+fX9cjQ89oysefjATSu0WQ8Oqp5aXOlz1
         r/3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mk7yrgYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 10si5454380ybn.21.2020.10.01.10.14.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Oct 2020 10:14:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mk7yrgYK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kO29y-0001a9-0z
	for alex.bennee@linaro.org; Thu, 01 Oct 2020 13:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO29o-0001Vd-EY
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 13:14:16 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:39414)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO29i-0002Zf-T6
 for qemu-arm@nongnu.org; Thu, 01 Oct 2020 13:14:16 -0400
Received: by mail-ot1-x344.google.com with SMTP id u25so6187955otq.6
 for <qemu-arm@nongnu.org>; Thu, 01 Oct 2020 10:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=RQlFEpLKBh5i/mlvWh+6qpQClVJ+XtthGnl3HhZREwI=;
 b=mk7yrgYKlci+8rw4b9qKiuX45vqgi5zGvpkCeiLoUkn/NUyIZ2tgIuQX9Udx5n1NYV
 3p95n1S9DDfPq5iz7851DbLv+AXJ7JQky5w/VlHZp4H1dCqGpOAZUexI/R0xu2ocC13u
 5c+gGecDs5j4zkYTxB5iBpu+iB1oScaRejPilJHD2hJB50XV1vEFO4wiS/3bREpy9JKI
 BdGRRPracnRQ+IwRYV3Z+s1KY8TbBuOY9KXmSer6sKJImA5ezWeUm2XkF7dYKc13Opm6
 fJtL9DpjKsbZ7dM1pKMcoi2OQF1GtPqIejS1dekQ1931ywn8KO7svA0pJQvKG2CmBk+J
 Xwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RQlFEpLKBh5i/mlvWh+6qpQClVJ+XtthGnl3HhZREwI=;
 b=IjCLl5Xz9+HApn4zjxZQmpFVxp1j7//lRfaB3sXXdvjnvOEIMEmJiM6BZgQo0KvZjz
 S0a/cZ0Ppzd5BlEmsHUynen6NQNeCAGxTIzBiwmbBgXrLnck6RhK1odfxHxGwa5uNO15
 c0vg6UDWISYuV1snI82UeltcWTfGP2qFxjJn8wElMWedoueLBCQdeEeBvsnXNEp0Zk6s
 NVIyAgpYvuHbZXQywJTI0fI+L+lrff57QNkqSFljqk/VuuJtb8LKtolgaQ31510QVDIj
 N3tnK1OJBN3ylMzKKRwSbZzbWTjC+w0fiQIt+v3zbr4SMFbWXhf9EKBOSHJbKau9yX9Z
 heeA==
X-Gm-Message-State: AOAM530f3m2nGgtttt5JLDCo/IZlGvVrAfsv8LzJ0SRRivCWMQlNBK6h
 Ro1oIupE7xkWvNZEd8HEuWw6WQ==
X-Received: by 2002:a05:6830:48:: with SMTP id
 d8mr5360433otp.272.1601572449524; 
 Thu, 01 Oct 2020 10:14:09 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id h204sm234009oib.52.2020.10.01.10.14.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 10:14:08 -0700 (PDT)
Subject: Re: [PATCH] target/arm: Make '-cpu max' have a 48-bit PA
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201001160116.18095-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8f3a88e-2c8d-74c7-4f38-c21629d86cef@linaro.org>
Date: Thu, 1 Oct 2020 12:14:05 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001160116.18095-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::344;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.26,
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
X-TUID: PcOyV/aVHEQV

On 10/1/20 11:01 AM, Peter Maydell wrote:
> QEMU supports a 48-bit physical address range, but we don't currently
> expose it in the '-cpu max' ID registers (you get the same range as
> Cortex-A57, which is 44 bits).
> 
> Set the ID_AA64MMFR0.PARange field to indicate 48 bits.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I forget why I wanted this patch originally, it's been so long
> since I wrote it, but it seems like a useful thing to allow -cpu max
> to have a big PA range...
> ---
>  target/arm/cpu64.c | 4 ++++
>  1 file changed, 4 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Were you by chance looking at some of the optional v8.2 extensions, one of
which is a 52-bit VA, and noticed this nit?


r~
