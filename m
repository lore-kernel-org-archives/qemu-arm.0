Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2239401lfc;
        Fri, 13 Mar 2020 07:54:38 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvXvVIXsohOYt9n3YdH334IINOtbI723A6w2R9EHQtqlCR2pO/LOq2rf09gG9qoa9iEeyHN
X-Received: by 2002:a0c:9b96:: with SMTP id o22mr12232340qve.169.1584111278176;
        Fri, 13 Mar 2020 07:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584111278; cv=none;
        d=google.com; s=arc-20160816;
        b=LiSxyKLpH10lnbpkMu8aoEDo096GcLiPsPwdzfszg0yq6/VoIim3SxD5RiD/F/LFIv
         3R0/gW5z0HxKm4NWieJnL3O8mGgZWTo/OZqgTawIOTtb2SE8yS19RsttYKtD+9aLEJhV
         YdRMlCtBGveoLPe/5dYv52Yy1mxtrD5naC1H4hOKQCQjbCZPDltLdRKNdHogd5x6PFc5
         eGGv7+BTNlL34sWrjYAGPEq1+o93k1ueqKE/nRKGvbCF+V3j4x+tPUdVsqNEH/iTitaj
         aT+PiQK2bnNnkKIoXTc6DKwX8HtuWDSruLJzGx48OecKoTaGfOhrdEDggI2RXwEtHm5J
         F3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6FsArFb4Vrvq32VdMV4+A17UUaORsh925W18m3nZ+bU=;
        b=DFBB7DCdyh4L1B45wmSZzXO9fxR3HdCJWJA9QV9syY7/rT96EkczDkYsR3e4q/jP9a
         ax0f2+Xu64mKDUjwAppzbypGz4W31hDwOlZAiXaDnaYYecxzEEJ7nNJ7R7VlFfaemUVn
         QFjj/oqpJ7VEP7k/c8rh4fKrynPotOh5plNgJRMYWkvl1RRkJFkbczq7FRCzE3j8xikm
         H4XVuasZSfe1+IxRNTznXfnOCJyKax0DXrrYs3h68iA+rPkPRUKAxxvLf191Usd0U4ga
         V0sf6sbBORn+pPV1uofY9RoPzBOHC1/JAqIqzTijHvfdh+8DisOHvOif0ukcAo11rRkH
         7mog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HR+CBC7V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7si4534177qvq.177.2020.03.13.07.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Mar 2020 07:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HR+CBC7V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jClhs-0001th-JI
	for alex.bennee@linaro.org; Fri, 13 Mar 2020 10:54:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46763)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jClhj-0001sD-QD
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:54:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1jClhi-0004iG-AR
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:54:27 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45835)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1jClhi-0004gR-3h
 for qemu-arm@nongnu.org; Fri, 13 Mar 2020 10:54:26 -0400
Received: by mail-pf1-x433.google.com with SMTP id 2so5338882pfg.12
 for <qemu-arm@nongnu.org>; Fri, 13 Mar 2020 07:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6FsArFb4Vrvq32VdMV4+A17UUaORsh925W18m3nZ+bU=;
 b=HR+CBC7Vfu4Qw17TRM3f6/XXRv245HdJPQp80GnOqzWDZ7VG4wwtoyfXthZ2PepS8f
 GXNKiNRJuRRSNR74TKbHIk2KQgUKuk3OP3z2dCEzM+z3shP6bwjH1rysjEzU77BHFcLY
 9D2SFn2z06fb9g9pberks7T7IbDlSoq1YdO01uYYiDqmV0Pkk39uQpoLhHgZwoyXDIWF
 GoVkE11L2zVtflDdXvhSwehJpmjh4LC3z8A1/hLXuThHtNSwtoy0yzXzeq8MLz6Q0AcW
 JKLGGaz9PQz62JTT0VoNbcdLNUL9eQEkOkftMZ9VWAymGkp9icA1pkDwRhiWW+O2666c
 U1sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6FsArFb4Vrvq32VdMV4+A17UUaORsh925W18m3nZ+bU=;
 b=tQKU+QSxAwy2Flq3RCmgjQwJfyjy+5S6s66NqYOcHFs74qDtAr7Gvg1No3ieRNXANX
 le/CiDIWfTgVTQtPS+HjEYv1PG8c0e5GEw1duAKmq1FLNU0SiQHtSdSmkBxyEpBF4ZWI
 JOCoOiIdo2AqhNy93hvQFzECu/tl72SVi7P8GxV0EuIx0FA7mzgs+FB32et79keSSTdj
 +6bjKW1va5/pMVvdxWYgB6xoH53bn/TekS7wWE/MRW3Z/4gFvaBfEZe+5FdnE3NeZQFF
 Kk8mmzG0dswmakvzBzi/ZgcxJm+/SMNHwfwP2ikZxAWAAjrDdNo7hXuMsWePoy8ngIE3
 Long==
X-Gm-Message-State: ANhLgQ1i/vKCne2lu4F9wGLnpYSR2g3M0WUa5baZM4u1BGrPNguNVn0a
 kYwqi4vwSaf/JXFksO7mvwDm5UOMj3A=
X-Received: by 2002:a62:3487:: with SMTP id b129mr3098727pfa.150.1584111264817; 
 Fri, 13 Mar 2020 07:54:24 -0700 (PDT)
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id
 x190sm59562722pfb.96.2020.03.13.07.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Mar 2020 07:54:24 -0700 (PDT)
Subject: Re: [PATCH 2/5] target/arm: MTE user mode disassembly
To: =?UTF-8?Q?R=c3=a9mi_Denis-Courmont?= <remi@remlab.net>, qemu-arm@nongnu.org
References: <20200313140023.83844-2-remi@remlab.net>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b72a1acc-eec1-376a-0fef-caa55799d517@linaro.org>
Date: Fri, 13 Mar 2020 07:54:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313140023.83844-2-remi@remlab.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::433
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
X-TUID: RKWtY6DRfb15

On 3/13/20 7:00 AM, Rémi Denis-Courmont wrote:
> +/* Extract an Allocation Tag from an address */
> +static void gen_extract_tag(TCGv_i64 dest, TCGv_i64 source)
> +{
> +    TCGv_i64 sign = tcg_temp_new_i64();
> +
> +    /* See ARMv8.5-A AllocationTagFromAddress pseudocode */
> +    tcg_gen_extract_i64(sign, source, 55, 1);
> +    tcg_gen_extract_i64(dest, source, 56, 4);
> +    tcg_gen_add_i64(dest, dest, sign);
> +    tcg_gen_andi_i64(dest, dest, 0xf);
> +    tcg_temp_free_i64(sign);
> +}

In addition to everything else, I see that you're working from quite an old
beta version of the memtag spec.

Please grab the most recent Arm ARM, F.a:
https://developer.arm.com/docs/ddi0487/latest

The current version does not really distinguish between logical and physical
tags, so there is no add:

bits(4) AArch64.AllocationTagFromAddress(bits(64) tagged_address)
    return tagged_address<59:56>;


r~
