Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4282010lfg;
        Mon, 15 Mar 2021 23:20:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzroRHpYhsCkwcMg1vgU5SyUcY2JLrZFD8ByVv3mcCdIsEKEb71OCcS5tlxSqIjJ6uca4V0
X-Received: by 2002:a25:dccc:: with SMTP id y195mr4816956ybe.182.1615875638335;
        Mon, 15 Mar 2021 23:20:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615875638; cv=none;
        d=google.com; s=arc-20160816;
        b=wEgKyRLDf71M4Bfu5qWLbrnpRMrr3407OJg1iKvSTRVTI+abyCX0ytJPgTmsfuoOUl
         kf+SpGGuYTkp+MjrxEOy6Pfi9n39hoGH7Nq51x5OCnvj3ofjFdr5WUuwUBUBANkzQl1G
         CbIKn8WsXgS/8NCV3xs2nSB/7b1gKOkgzct6iJJgrpn2OC6kxm97YwzCGGp9e/dphJoi
         jO30hhOMJp8wmEEKTyZN6jIvmwJoPcRMEBQ8eeRvYUP2pwyEXC0a3eaYRgFgzlXKpVSW
         1XPKXWoMqSAGo8fwwPTsPgaXNubZPj2/Z6rowR9BqRyhT0mJhkY31U8KKgk7j4s+8+im
         yuUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=xa8lEQsaui5Bd4Q9zs21cUobprOLGQPxtJNVvsraVnQ=;
        b=vfsVP6HaNk6Whvtn+UmhqKg1Ve1fEjkT0/5zfYfRuOPLjtPl6vOrISNtALdTu/+rn1
         5BhTW9xA4jODw0TVWauBema3IB+aVYKVA/MldiSrCqlfo13kSeNmKpZrKWlLsILbySV7
         lp6FlxyX97yxk26jvv9shRhT6K8Hn3uOGUpBmd1NMKemL0phsEvvWzCeZQ18cTDI7TmM
         lNz542D3pKfnWUxHpLiNN8rJafm01JTCNEhB2qlTumd/SebQcsLhK+VS6buYUekt4Muk
         gD+vLAOrzHdpGxQH6SWNehDTCz/u7AEvZFjcajkYtcsh+QTIKyphJrtD036Cgog0G3z8
         ZOJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=T2SP8Pdt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z30si1605694ybi.99.2021.03.15.23.20.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Mar 2021 23:20:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@nuviainc-com.20150623.gappssmtp.com header.s=20150623 header.b=T2SP8Pdt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:45622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lM34H-00064p-N3
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 02:20:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lM33m-00064U-4C
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 02:20:06 -0400
Received: from mail-qk1-x734.google.com ([2607:f8b0:4864:20::734]:43699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rebecca@nuviainc.com>)
 id 1lM33k-0005Br-Du
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 02:20:05 -0400
Received: by mail-qk1-x734.google.com with SMTP id b130so34168198qkc.10
 for <qemu-arm@nongnu.org>; Mon, 15 Mar 2021 23:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xa8lEQsaui5Bd4Q9zs21cUobprOLGQPxtJNVvsraVnQ=;
 b=T2SP8PdtsW3ltkt5air6Ah5igDXXbdjrAXA+5tiLAt5MxILjXFQMuEcw+FFBd6a9vT
 ikhp6M3B/tjPo1OlJm7vc4TKDklwEhJPP8chPdoPK414+J3Rxr0KdQ1LWnnfzHIvDhMs
 ELIzSck4tkegpyaIXV/vwFK1qBfDbT2hpkbPx/zuJoCQo7H5O5VFbeVu1S+0nLxjSFvb
 Zvyrp4ziAOHa14XdkEzwxteoRvl1FNTf/aiQJnEs4pxV4gnXGXPwn7tyba6EQyMdKw+a
 BVSbZqO+evxFvIADeTaubswuyXROXIXeJkwmlI3/3rObTdJoKXX+LUrHSSjZJcbgZoWo
 lGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xa8lEQsaui5Bd4Q9zs21cUobprOLGQPxtJNVvsraVnQ=;
 b=JtQrSDFq74m7dA2TFsU864BfwRG1dIl0odS5iU2H9qvdWEo8iXhM6fGzBqIf3c3vwn
 p0FN9hwpCWjzCO9M/qfMVVMfl+kxxybUwHb0bMgUfGMl8uDN3AYL+9XA1Hkb0FAD22Nk
 VfhkPvHu+rvtdDZZ36ryA0v0jZBR0ETt2wzoUtB82RYZKBruVIXXp2sUAbDmSpHdFV2Z
 GMERIfIisShuHhHz7oOkqMkOBsLrNBpWQ9GVIaAsBI534Z/9w1NzjVuI45gV1IAdye4T
 MTLrqRSg+n+Iq9bcXqquKuF0wlxRKWTZPfUz7eaTFd0M5GaJgk0CEBLGXkUqO45Cpa3V
 A/aw==
X-Gm-Message-State: AOAM532nUrnU37+nwXYGMv6pVzF1Yyc7dEaGApzWBRNVs7MUW2l7S+Hq
 iq/JxRalMXkGsMkcu0+42MoB3g==
X-Received: by 2002:a37:988:: with SMTP id 130mr30406486qkj.120.1615875603279; 
 Mon, 15 Mar 2021 23:20:03 -0700 (PDT)
Received: from [10.0.10.142] (c-174-52-16-57.hsd1.ut.comcast.net.
 [174.52.16.57])
 by smtp.gmail.com with ESMTPSA id z24sm13890387qkz.65.2021.03.15.23.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 23:20:02 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] target/arm: Add support for FEAT_TLBIRANGE
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20210310002917.8876-1-rebecca@nuviainc.com>
 <20210310002917.8876-2-rebecca@nuviainc.com>
 <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
From: Rebecca Cran <rebecca@nuviainc.com>
Message-ID: <970813ec-f190-6faa-e1d6-763ba3a6ed60@nuviainc.com>
Date: Tue, 16 Mar 2021 00:20:00 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <3930c2d8-8972-0acf-7a48-71803072a559@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::734;
 envelope-from=rebecca@nuviainc.com; helo=mail-qk1-x734.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RFrfLYy2G95D

On 3/10/21 12:24 PM, Richard Henderson wrote:
> On 3/9/21 6:29 PM, Rebecca Cran wrote:

>> +    uint64_t addr = (value & 0xFFFFFFFFFUL) << TARGET_PAGE_BITS;
> 
> The manual does not explicitly say, but I'm certain that this should be 
> a signed address, when regime_has_2_ranges().  Otherwise it would be 
> impossible to flush a range of kernel addresses.

I see other functions have

uint64_t pageaddr = sextract(value...);

Would that be sufficient here too, or do we need to check 
regime_has_2_ranges()?

-- 
Rebecca Cran
