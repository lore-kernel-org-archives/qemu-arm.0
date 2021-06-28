Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4160229lfg;
        Mon, 28 Jun 2021 09:41:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyO2xkgyOxcEWT682Rfl2hFSrU6iQN8NOYsiXlldD7/Qs6knj8W21DiiqdVVduaQCXmqAgu
X-Received: by 2002:a25:690e:: with SMTP id e14mr13324907ybc.277.1624898467434;
        Mon, 28 Jun 2021 09:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624898467; cv=none;
        d=google.com; s=arc-20160816;
        b=nKJhNCfgor3CKRKQu+Pw4d4RrKkijC7mPUoN+Ie3otdxNVfNrtMJLVSZOL1EmXubmQ
         V4KmwVbKBCKTBMA3AOUmhxsKm7z+xd6XaVNwCYXZRVUoF+AXT70f7/xCYY0R4FU8h3aX
         TWmVnLfJonyCdhXwg7rV2T6YYOd2GE01+Aa86/VOR7c8/fdSUTC5Hpl+8v3aHj99JRwZ
         UUIiJ4YjYTqrpIYc4N1FFTjA2MUskiFCwCW6n++mhyHL/j8uWYKVq7fNW41OxYGXFXnC
         XqpxlpDI1KubEALm1tPbiRRV0Vjg3EZ0abpDDOnNEj8Y4zmwUAtmqVKpSnlejAmEgdBH
         UUHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jbAXlsmNrM/5Cc/UkTJrBYEyQNsn1m43I7U6aORKE6M=;
        b=yVYbqQZfvUHwk/xnq13SS+R7LfVSLkelvmY1w1QTh0WiKsaV2g9gdP3suvqzdJwyUP
         FKD8Mxv20ng4Y3RIIRi3RDh8GHc+N2xQaDJiO5TBa/bf52c4a90gq1qTE5h9YhD+bDsy
         A2uarYBcedkNo3IU9CK2sCNcu3oaq2QVkydG9N3Y5SdX92dsle+WWHrU0r3WutnFK2gJ
         9qakFHRzvjafkjYEDLpU02/6X1G15FwY656au7bp1rGwjRRZX+mjBEXj+PDljRIg50k3
         aY5CFC0X6Buhnq4HGZaUyhCcB4uBQT65riVNOKM5OOSJBSsPEkL7EJ3Ft9MH9wvNP42s
         pBVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQ8q+1IL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s18si15691788ybp.50.2021.06.28.09.41.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 Jun 2021 09:41:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qQ8q+1IL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lxuJm-0005K0-Qj
	for alex.bennee@linaro.org; Mon, 28 Jun 2021 12:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuIe-0003qp-4S
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:39:56 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:33603)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lxuIc-0004O1-K5
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 12:39:55 -0400
Received: by mail-pg1-x52e.google.com with SMTP id e20so15949671pgg.0
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 09:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=jbAXlsmNrM/5Cc/UkTJrBYEyQNsn1m43I7U6aORKE6M=;
 b=qQ8q+1ILOLgyGFoeNVXGugIIb+bSlZaG/CCTIgwLrt7/pcsPnYjYZKMuxVWV4agu3F
 MWXuuR2JquKf1nT4j08uMc8FI6eEODPwVgD/XGhrB0RJGLG14TuR7mLS0T9pS0mEzkzn
 gatvjYghl4/Yr5hnB9Ln+0E7omEvH9PgGxAnrxLSdvuJ1hD0QflBmmEoZxS6nz+JEH5F
 6ie4/fmTNGHQRzs/k+mihl37TjgASDsa2KFYx1USsQsCikAEP/BIEktKkRrOEX4/efIL
 5WB5oY+6Cx1LyTO9onMFpNzec2WRnz1xYpDpZhyLuN7kZBvHM6FFiXXP77qkfWTeTvU/
 9BOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jbAXlsmNrM/5Cc/UkTJrBYEyQNsn1m43I7U6aORKE6M=;
 b=hLOEIcfQXjaAWVGWLaWf1HW251PC5yI60A+eqMKRYR71SznKUXeiCvz4jqSfxwNkVd
 8IpGp7OhdshBdDr/eejx3z6n1kMipEehzpfV+0kTg4Az/FRcDKOIKMiMas1AYGjIg5QX
 v2tsHzudcIOSZl+OK7mvqOKlPfr+py0QqlkaTonFfvktBSg2i4GCdq/DGD+6INdIXHP7
 LEDDfs5RAoOSGapHwt/CJyYf5HJAzZhDrGOodt+cUhiblBchP/4RYlzsNVpJ1y7CMHb8
 rV3nqUY/iSG9rhQ94RND29FyTVzhJUPKrHmLzBZLEOaGcDliZg2Ti0rIyociapXfwEBu
 Syzg==
X-Gm-Message-State: AOAM533nysYE8+UYJRcY1BEpD8JbvYsbqwDCM8TaVs3Ke2nMr16Y5Bce
 6fcXUI8BQ+NJbfbAkcpXSr1h6zTgfribkg==
X-Received: by 2002:aa7:999c:0:b029:308:7e6e:6fbc with SMTP id
 k28-20020aa7999c0000b02903087e6e6fbcmr22849097pfh.10.1624898393139; 
 Mon, 28 Jun 2021 09:39:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id a23sm14964186pfn.117.2021.06.28.09.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 09:39:52 -0700 (PDT)
Subject: Re: [PATCH 13/18] target/arm: Implement MVE VSHLC
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210628135835.6690-1-peter.maydell@linaro.org>
 <20210628135835.6690-14-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <10aa283a-bffc-b333-d7df-754bceda4afb@linaro.org>
Date: Mon, 28 Jun 2021 09:39:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628135835.6690-14-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VaVChztgmWBp

On 6/28/21 6:58 AM, Peter Maydell wrote:
> Implement the MVE VSHLC insn, which performs a shift left of the
> entire vector with carry in bits provided from a general purpose
> register and carry out bits written back to that register.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  2 ++
>   target/arm/mve.decode      |  2 ++
>   target/arm/mve_helper.c    | 38 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 30 ++++++++++++++++++++++++++++++
>   4 files changed, 72 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
