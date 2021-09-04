Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp2042285lfb;
        Sat, 4 Sep 2021 01:53:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxam5q8cKY4csc3kOrugKXUfRICTZieI+bX25fCXeM7JYSvp6xqjOxmX5n5Es2FtuiLLHry
X-Received: by 2002:a25:2652:: with SMTP id m79mr4198270ybm.444.1630745614546;
        Sat, 04 Sep 2021 01:53:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630745614; cv=none;
        d=google.com; s=arc-20160816;
        b=X4av3ImUstK+vTU8KSnZfhAHS9FBx1DwMjSsKgUtQzjRl1Xr2oC0P7JOOKtAcyR87c
         pnVpGvfxGZ0/URyrUKGQQcoi8jnrkvUQ7SQ5T1OsLyZaUOw4fQ/AOqcZgdCkgGxpeEHN
         veJdN7pArrzyGgqlRPDEOhhqDHPkgKodyQ5X0AeazBaex/v2wSwOD6U1v5HIbX/YUURh
         3g1S57oBH7N7y/gCBxIFqTbb3A6yR1sXdsbdoYYrCQG2lkg/fW8Cd88wmZT4y19843p7
         FNOiA4KZMggAyHs0AoQMzUCIV5FHJ7qVAmClw82k24E1cFv2QasRg2jUeIUey9sP71OH
         GvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Y0uVp1L3jQ7n6OJNPxEBwdSFbEqnx8h8snS6dEp9aog=;
        b=lNE05ZeaINwAF1+MZ96gssYmsQrkK6zofvqUkL6xV31PPLUW5rLbKgN9VXkq1K2VUP
         hbAk+Z1j6zyYR4Z//HtWSfkA+B+mzCZclgfZeJN8lv67W0XGQWzB1tzPe6KHyAWqAvGl
         lqvuAjV52IDMdNHfG5j14xQnyHQV78/rsFoXwPIfmJX4kkNdF9C77ses4agjzN6rGOeH
         O6MbCbSHZwwHsmsI1EGOz3wKq7ls64Wc8uHJqpy0sRSkrz7KK5VwARKjhWCc2djzqjoi
         3tCvNYJ8jfu0lnvJeU6BdmsOpkMgjVEg1zYiMGOGqzDNiRb2Tv505GoceqzBJJCUUDkR
         oi/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UlT4raqM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k16si1836019ybm.275.2021.09.04.01.53.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 04 Sep 2021 01:53:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UlT4raqM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMRQb-0007zN-U9
	for alex.bennee@linaro.org; Sat, 04 Sep 2021 04:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRQA-0007xQ-3e
 for qemu-arm@nongnu.org; Sat, 04 Sep 2021 04:53:06 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:34382)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMRQ7-0008Qu-LM
 for qemu-arm@nongnu.org; Sat, 04 Sep 2021 04:53:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id m9so1975950wrb.1
 for <qemu-arm@nongnu.org>; Sat, 04 Sep 2021 01:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Y0uVp1L3jQ7n6OJNPxEBwdSFbEqnx8h8snS6dEp9aog=;
 b=UlT4raqMQlpxFaOK1Pgwe+0oC+zKMt8PFEPE6kOFooa5QNz2dlCQWRwpzZr/3b3Wsj
 mNyRgOj3pqQzOZXZQ+R/13RE5MmvXsP4eu8WdInpl7QBK+GJBqV3KnhqtXiN3rq+ux8M
 FfNJdQghCjvB+fNN3hXC9+BDy7bGFkY3AOt6TgufaZdKIJxlK3etBWkxg6MoxCptUFNJ
 PcRxk5DYvQzPSKmjlKUqm1Ubs+Q+mwt3SP9foZuC9ZRP0Le0iekjZalDE/+i3o5voduR
 ca2uuP0C03ojvXrFKUYiCA65ncXqE0ch4VI4stwLl5RkHMcq2PzEozZAyF0/iVuf6eqC
 6jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Y0uVp1L3jQ7n6OJNPxEBwdSFbEqnx8h8snS6dEp9aog=;
 b=YfXmwtPYgGDE9JtlGzLuQcvOTbVEUXCn67llWU8/f3HcyBvcXd3rvAyd/CJtuF+TxJ
 jTPEfqeQ6rr+KDAlPZL4k29u9dJWCbPKdNHHlxGPETthDBnrB1uTBwAtHrcrZqzBZiWx
 5+jNXfiZEJgLgkr0yzIO31FEtpiub3ZMSArxWcoo6Z5zHMK/OidxF/sx0T1FICwsPcMS
 uSpM7hxrtGcePGRNEE5fSYQI38r7ucCHpLo7MDS4p1AZP6ka6UsGIycKi6XUo/Knk38u
 4USj/fraTGSt0liWHNqEwXBPr8nMO+c1CWH6LZwY9ilj8UJNBO/AfiaQTTQ0AR6pT2MO
 5HuA==
X-Gm-Message-State: AOAM530gs8OY2923K5E2g3fsv9W+pIqtS1DaJnOEjy57M5KgtZM+qANt
 oUbO79PWsxcx5PZIqA8XMa3dnA==
X-Received: by 2002:adf:80e5:: with SMTP id 92mr3052537wrl.300.1630745581885; 
 Sat, 04 Sep 2021 01:53:01 -0700 (PDT)
Received: from [192.168.8.107] (246.red-2-142-218.dynamicip.rima-tde.net.
 [2.142.218.246])
 by smtp.gmail.com with ESMTPSA id s13sm1543638wmc.47.2021.09.04.01.53.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Sep 2021 01:53:01 -0700 (PDT)
Subject: Re: [PATCH 2/4] hw/arm/mps2-tz.c: Add extra data parameter to
 MakeDevFn
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210903151435.22379-1-peter.maydell@linaro.org>
 <20210903151435.22379-3-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2d19b6d1-b6ca-191c-0c9c-a5b1cf95c75b@linaro.org>
Date: Sat, 4 Sep 2021 10:52:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903151435.22379-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6TDGivtv9rtw

On 9/3/21 5:14 PM, Peter Maydell wrote:
> The mps2-tz boards use a data-driven structure to create the devices
> that sit behind peripheral protection controllers.  Currently the
> functions which create these devices are passed an 'opaque' pointer
> which is always the address within the machine struct of the device
> to create, and some "all devices need this" information like irqs and
> addresses.
> 
> If a specific device needs more information than this, it is
> currently not possible to pass that through from the PPCInfo
> data structure. Add support for passing an extra data parameter,
> so that we can more flexibly handle the needs of specific
> device types. To provide some type-safety we make this extra
> parameter a pointer to a union (which initially has no members).
> 
> In particular, we would like to be able to indicate which of the
> i2c controllers are for on-board devices only and which are
> connected to the external 'shield' expansion port; a subsequent
> patch will use this mechanism for that purpose.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/arm/mps2-tz.c | 35 ++++++++++++++++++++++-------------
>   1 file changed, 22 insertions(+), 13 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
