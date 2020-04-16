Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1994521lfm;
        Thu, 16 Apr 2020 09:15:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypLTU1T5s5SuA9jd6zRfOymN3ACVC08gW3F9bQdcHffHJHfTh4lrqgLyRArP+Rh01F2GolYb
X-Received: by 2002:a37:48a:: with SMTP id 132mr33032314qke.390.1587053703295;
        Thu, 16 Apr 2020 09:15:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587053703; cv=none;
        d=google.com; s=arc-20160816;
        b=TEmagRxf7FyB1qtw/UTunf/I5VRXVMMgytgQKX79E6g2vO9z841/KqDWwcFOAycyuu
         /+7o0Ax78DJXP1Ufu3rwAYjvwDsW3YGJTzLTrBoww3o4b2XaQo1r91ijIw9LHPP0oGRF
         S9c/pdX2FkC1xZqIKdAIHGQgP/MhkavOQY+TUJ7KlYOQwaXXqEp5YJUm2xqPXAN0OqyM
         NpqHawgTnPZ48DrGa/Kb9Dnnl6x0SG0GlmpmleNmuqQZoFa9rZWi8bS3gTnEUuT34XBb
         kwc+nGIhTIVd6oAR4DcrW/9KY3w5dLGhUvlF7ninrUcYrC3ShbXkq0Fqrmw9AjJ5rvOf
         umyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=LHCr2VVYRgfUJp+jaFj5bq6dPDH1Ejyrha/BnN4ckXc=;
        b=TreWStxfxS31hXD6wygRFnnIURgtvRo0ogHdm5urYFjd3cYZBSnSVu/E1vWB8NA62p
         U8zJzqUQ6hX1D4vzW+84jZ4DB4TkFrCnKD9TtgXrnCkCn007i7Ux7O1dHIiev7XDBzKy
         Krpo05zSrNo8BGzZnDP8pF6zE6HGtH/CMBLzTwgr5BVqM25nVcSSC8lmA5pMozbYYTYU
         kXY82RHrD3jXN/8mmf0f9OSo4tPU7f1sONwx8YFpEeZZ4F4TNn6/uK2HQbNb7YMpaDQs
         HJmdEr3uKHqT7jcbwzsFs6kZht3/wt+G9Uv5RJV5Y9LEkhkHGoThuuyQTG+9bX1m2iPO
         VK5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Mmh/lUQg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h83si11005587qke.367.2020.04.16.09.15.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Apr 2020 09:15:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Mmh/lUQg";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jP7AM-0000CU-L5
	for alex.bennee@linaro.org; Thu, 16 Apr 2020 12:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55815)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jP79K-0007hk-Mm
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 12:13:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jP79J-0002Dm-Bu
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 12:13:58 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:53691)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jP79J-0002D0-5W
 for qemu-arm@nongnu.org; Thu, 16 Apr 2020 12:13:57 -0400
Received: by mail-pj1-x1044.google.com with SMTP id cl8so1593427pjb.3
 for <qemu-arm@nongnu.org>; Thu, 16 Apr 2020 09:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=LHCr2VVYRgfUJp+jaFj5bq6dPDH1Ejyrha/BnN4ckXc=;
 b=Mmh/lUQgH0XYjZ1Z+Ao3kIimgsfVGXoGASomwZU7iShdmYrE/+ukW72CWOTEKqRZhC
 qERkdWQr2bCzHcAPJA8C/CYRcsHDGYiAUuT6Hc3NvXQIHUXC7yUErI7NoFhFvtRBmaZo
 1U0QSoUBm8QECXaVbv2rbclnZ9V1wnOZazoiywHOZruF+5sA3uWswEicJEbCZXQ2qnx+
 S62UIVzMalAmVzg0vwdX+lRgAJllGp9KdQshdb7bKJJH1lhGfNYcDIgyNE/bCW6sy81j
 Fm3zb0iA6Mjki4W49/ebUG2T9++6DRAX4oVQaloZSg6YTh55AElQ6pm0VR5cVLYoeQ28
 jbWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LHCr2VVYRgfUJp+jaFj5bq6dPDH1Ejyrha/BnN4ckXc=;
 b=PLGxHmgXgAgKTRanm+YOnA9sMVGwn/jthd18ksGnV+zrOC3NSVq8pKpERPE37M7W8y
 shJm4g5YZ6NV9QfPqXeYROcupyHsb8BtIjuQ9YN+m6ZGRxzBoiT5/Z4g07LB6RESrMo6
 UwJHIA7F2cG2+bj8u3zxFRHW0eLhHcSDKuJJ915PyoVHwd49sFWZYz5bKPxxrta1EU6E
 yA3doCsMYRdZ12thh2KFm19xMNeni+bIECprHr4TL6Y2AxMrSsiqnj739hAK++Qb4UrE
 A6TD+bzoAiuEIZXPdgkexeC+pw4FEntu8zs5wr7Bn2lq/SAws58WDKVFfT3mi2eBEObS
 6L7A==
X-Gm-Message-State: AGi0PuYf+TAaMKeQA5w7SttKTDCz9MRVeXZpTDMsko2IkUA7f1USLed6
 jWVs5AHt1BbGapz31A30y28zog==
X-Received: by 2002:a17:90a:d3ca:: with SMTP id
 d10mr6294345pjw.24.1587053635867; 
 Thu, 16 Apr 2020 09:13:55 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id x12sm9670464pfq.209.2020.04.16.09.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Apr 2020 09:13:55 -0700 (PDT)
Subject: Re: [PATCH RFC v4] target/arm: Implement SVE2 HISTCNT, HISTSEG
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200416144212.4898-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8dfe7862-5842-c356-0b59-7531dbc25fe9@linaro.org>
Date: Thu, 16 Apr 2020 09:13:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416144212.4898-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1044
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ju69LLe/r0O/

On 4/16/20 7:42 AM, Stephen Long wrote:
> +static inline uint8_t do_histseg_cnt(uint8_t n, uint64_t m0, uint64_t m1)
> +{
> +    int esz = 0;

Clearer to use MO_8.

> +    int bits = 8 << esz;
> +    uint64_t ones = dup_const(esz, 1);
> +    uint64_t signs = ones << (bits - 1);
> +    uint64_t cmp0, cmp1;
> +
> +    cmp1 = dup_const(1, n);

Error in the esz argument here.

> +    cmp0 = cmp1 ^ m0;
> +    cmp1 = cmp1 ^ m1;
> +    cmp0 = (cmp0 - ones) & ~cmp0;
> +    cmp1 = (cmp1 - ones) & ~cmp1;
> +    return ctpop64((cmp0 | cmp1) & signs);
> +}

Ah, well, I may have been too brief in my suggestion before.  I encourage you
to have a look at the bithacks patch and understand the algorithm here -- it's
quite clever.

We cannot simply OR the two halves together, since 8 | 8 == 8 loses one from
the count of bits.  So:

  cmp0 = (cmp0 - ones) & ~cmp0 & signs;
  cmp1 = (cmp1 - ones) & ~cmp1 & signs;

  /*
   * Combine the two compares in a way that the bits do
   * not overlap, and so preserves the count of set bits.
   * If the host has a efficient instruction for ctpop,
   * then ctpop(x) + ctpop(y) has the same number of
   * operations as ctpop(x | (y >> 1)).  If the host does
   * not have an efficient ctpop, then we only want to
   * use it once.
   */
  return ctpop64(cmp0 | (cmp1 >> 1));

> +        for (j = 0; j < 64; j += 8) {
> +            uint8_t count0 = do_histseg_cnt(n0 >> j, m0, m1);
> +            out0 |= count0 << j;
> +
> +            uint8_t count1 = do_histseg_cnt(n1 >> j, m0, m1);
> +            out1 |= count1 << j;
> +        }

Wrong type for count0/count1 for shifting by e.g. 56.

You might as well just use uint64_t as the return value from do_histseg_cnt()
so that we don't get unnecessary zero-extensions from the compiler.


r~
