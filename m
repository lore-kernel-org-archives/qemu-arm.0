Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp790013wrs;
        Fri, 23 Aug 2019 09:30:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzdzHb4L5NRYQYdguU9z3tdoWG8uZwD8V1cK7VWvRAT150JURHk3e9ZpIPCK2axnYylf1lg
X-Received: by 2002:a17:907:423d:: with SMTP id oi21mr5009694ejb.184.1566577842605;
        Fri, 23 Aug 2019 09:30:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566577842; cv=none;
        d=google.com; s=arc-20160816;
        b=TyTiHHZVxtothRAXlnYAB52brXrEqyNYdOU4s/8iEG8mvcAuypkCm9eXT3supgJ4z1
         +jUSdy2vtelEYznHHeX6h/+Tvab2B4kFkBxLT39dpChzBvJc4Qrjq/zuBi6t9sBS7lAF
         4Q+iNGrH2OpHCj8NxJiRfgQDj6XUraic2nUiJoJnnV2iRBCLQVJbqaqBfLcVAOy5oLg/
         kTIK3qTbpD10Kc9CBKHLmvufQfYyG8v00nLxnwGPvPX0vRjP/w8MuNsH0Jq17JsArygL
         mC+IMsegnPZ6S5hwVEGGQkCggB1LUPNZQzwuEfWyQmqfqBUXyOa45t4if4czAGAIQrxo
         B9yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=fdt9EqP0P7b27VUPh4heMoj7hsoyqjVg1Sr8Lx78roo=;
        b=fquBSOHoVWfZWS610Iyrb7GF2rPuNvN5e4bKyPh9mX/Xrc1krAAyB2F3pZPhd5Zgqd
         NzwABWNc1Knn/vvglPSvNGcChmQO600nKclokPYTWNj54vKmXzHk4e33gkfFTN6yhb3l
         xNT+OxSthSQIJK+QiVHgdM0jbFu6sAHSFyBVl6/xXv17E2Fpihpnfh9yL7YAzNmxPkuU
         WjSRQLeHP8VFMYZT7bLou6ULHqmdxXrvOjkUWkpRHu+fkh85XS2sG5xkmq0vWmshC7Fl
         Y5lofSr9tpXtxk3y7CJt9Y9bcM3r8DWNjI00A2kfP3XK8/KjMeD1SMx5MiDPbJ11CvF5
         /4ng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wwlX532c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ks15si1654138ejb.228.2019.08.23.09.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Aug 2019 09:30:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wwlX532c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59271 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i1CSX-0001kh-AP
	for alex.bennee@linaro.org; Fri, 23 Aug 2019 12:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1CSI-0001j3-HB
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:30:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1CSH-00073Z-I5
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:30:26 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:38305)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1CSH-000734-Br
 for qemu-arm@nongnu.org; Fri, 23 Aug 2019 12:30:25 -0400
Received: by mail-pg1-x541.google.com with SMTP id e11so6044742pga.5
 for <qemu-arm@nongnu.org>; Fri, 23 Aug 2019 09:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fdt9EqP0P7b27VUPh4heMoj7hsoyqjVg1Sr8Lx78roo=;
 b=wwlX532cRNzmFiB4nfUNkgs9HBopRBq//n52798k5cXZD2RB1Q+505I+HBsZb/G6mc
 S5ULWY94PX9d+M5b7dzl90H6G1f96BPPjw9IRA6rQog/kLcQP8UtGnYipvDcciPNqnt0
 gTaKtpcGT+vCUI6/JWkV5nZoDNJYh3egVvoaGbUKAUs9+VhqSBiNq63SjbitRCsq80il
 r7NdYUI0ZPw+x6rmDaTbJApSc13R33c2udMuUunmI+Tv/Ad853IpZVrhrHX6VZoJ1B7H
 LZDOI17kvhUNgCKY1lao59kDu7YUW5raUZQ0AsDI/wlC0biyApSKOyfSTa8VUgs9eUWK
 JORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fdt9EqP0P7b27VUPh4heMoj7hsoyqjVg1Sr8Lx78roo=;
 b=a8reWAsCy2pn2m+cXD9+ehaZtbXgcHYIdC4yfSQKektyUbrH+QW5ZO7MDDjM2hU3m2
 6iLy6slL/S1B0B5+9iicrm53IPSbLy+mVA/2DZjHMAtyar+h96qpJQXPHuyC7902Ss1a
 MAj45xeX8LZFR1jgdhAzBUoGrp32DNJ6p0Itk728rntLiPYXemwma4xEdkLkSjmv8jpW
 7sGLM5k2ZoDoG/NYfNU3MVB/WVornWY6vZTWTqaP04mxAT6V0fxqocUfVIM8pu0PaE98
 05JGFvkDCCpTsjvqUtAbiiYZbYbHM6siuwElBRTVJlGy+8Ly+sv9UcWSOGgPcVW5FmGV
 NvOA==
X-Gm-Message-State: APjAAAWUzcUqx2Jj3au2zJUVVDA6XOgk4FIIwTLTkIol4y64/6YbpGPB
 1+Guy2IfNwvieEhTaLdxEjhOx7uF+6w=
X-Received: by 2002:a65:448a:: with SMTP id l10mr4642619pgq.327.1566577823992; 
 Fri, 23 Aug 2019 09:30:23 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id y194sm4213636pfg.116.2019.08.23.09.30.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Aug 2019 09:30:23 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190819213755.26175-1-richard.henderson@linaro.org>
 <20190819213755.26175-23-richard.henderson@linaro.org>
 <CAFEAcA_ctR2KvXkpw=q4mx1aZRzUJFK44kwWUHHe1XN8qsFBLA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3c662805-072b-35ef-dff7-921b37b5fe89@linaro.org>
Date: Fri, 23 Aug 2019 09:30:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_ctR2KvXkpw=q4mx1aZRzUJFK44kwWUHHe1XN8qsFBLA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [PATCH v2 22/68] target/arm: Convert USAD8, USADA8,
 SBFX, UBFX, BFC, BFI, UDF
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: T4138F/6zMvr

On 8/23/19 8:39 AM, Peter Maydell wrote:
>> +static bool op_bfx(DisasContext *s, arg_UBFX *a, bool u)
>> +{
>> +    TCGv_i32 tmp;
>> +    int width = a->widthm1 + 1;
>> +    int shift = a->lsb;
>> +
>> +    if (!ENABLE_ARCH_6T2) {
>> +        return false;
>> +    }
>> +
>> +    tmp = load_reg(s, a->rn);
>> +    if (shift + width > 32) {
>> +        return false;
> 
> This UNDEF check should go before we
> generate any code with the load_reg().

Oops, yep.


r~
