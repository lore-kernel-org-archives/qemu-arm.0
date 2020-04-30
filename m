Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2168199lfm;
        Thu, 30 Apr 2020 10:46:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypLjXfKjauvx3ZqryItx0jzmZgYuE86qABNvSYIHF4TxKxrFGsagaX3FXhavhfgKxCqVc4+U
X-Received: by 2002:ac8:19dd:: with SMTP id s29mr5001606qtk.164.1588268797161;
        Thu, 30 Apr 2020 10:46:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588268797; cv=none;
        d=google.com; s=arc-20160816;
        b=jBABuf/P8C2dqAbj2DDTOK0LRhuvKMFYyKsYiA8xnG/mqUQe/69ZCkjvbh9MAB4D58
         EcRp+ZRnJQc0JBODwd7SvBvUF65zKXyds2xNSDTOQNxltZ4/OeppYE4p3/YSqQhboA3V
         smBDUwz/gG+jYpikT0hsZrX3AtNwwQnesN1pu7bb/D9CA2JdHVZ19bh8rk/Y6kgIbBa1
         o9n5Pb9A4Wi1pIOrpZ6BZJhiar8fks8mTkEFa9ETpqKFHAzniRIrD7OjTV0h0ex/fr1N
         xmW8r6oM6GEzO9co0kxgqi+rQ+aJ16R6nY0SxGOm6FwpX6YQmEqqV3ZBrV2UPGiTBWwR
         gkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=I2U3wHVE5lkKMOVtyo3V9KEuLLw9EuJ+JZ1crcPLWn4=;
        b=lOROoC/6c1a2fbcje4NAMQt3Se4X0PVFBY6Ww7gRu1Fcya8U37k4hg4jBn7UkSiuKA
         6/KvTWyUweWyUMpvyYgec83BKsW1ykbFndi9zzgzfZEiHEw2jJO1x1a9iVbHwDtUpDJJ
         fsNIIyd9NqzE7oognoeGDDruwtupAgxP2BfUjR2PduPmb/d5/zs2BPzZN5I+GMUiF3t6
         xqi+pJb4uO30nhaw1ruQPRCRrr9/oITnoI33CWUYOqtzgd31DXUMcHGe0imQny8WK6im
         8yhLK9Veb0I01w7/RG6RzNo2v6V6av2TpwaX8iFnT1FMhad5QvbIDu8eD4z9NTlbnaV0
         pjcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y0vGAns1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id h13si273423qvm.6.2020.04.30.10.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 10:46:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y0vGAns1;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUDGe-0005Kc-Jw
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 13:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32902)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUDE2-0003If-7Z
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 13:43:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUDDx-0001yt-5M
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 13:43:53 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:51491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUDDw-0001yg-O4
 for qemu-devel@nongnu.org; Thu, 30 Apr 2020 13:43:48 -0400
Received: by mail-pj1-x1041.google.com with SMTP id mq3so1001988pjb.1
 for <qemu-devel@nongnu.org>; Thu, 30 Apr 2020 10:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=I2U3wHVE5lkKMOVtyo3V9KEuLLw9EuJ+JZ1crcPLWn4=;
 b=Y0vGAns1oh+bK+XgJ6GbYGq4dke0zfMwXYclbtW+srabBmyeu5MVCEaG3w8r8m4Gpd
 Qqy2SZt29cMb/LHBZ/TLkbG3sJsX5j+YFf4QLbaXJKs9QWO6aYrTnXBv5tvBa28GDUOX
 3Wp+LBLw1m/rDxQCceELbDuPHA28/iNLqWpQ7K6k750lGeZFQ+ffzvXnp11GfnWh1QTu
 y5MJxagYBrVnXi2X+sqDocSXW3igo8OkYlH0gGLTU4PLkZ5sfMedrnH2Y6+qZbbMq0dE
 KibAYVpKHBPPkPiszq4mp0EDFkDkcrhjcxh+HTgluVdzRarRMjmTwmtuzUC0T60cw+cD
 2K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I2U3wHVE5lkKMOVtyo3V9KEuLLw9EuJ+JZ1crcPLWn4=;
 b=XQR1Nbbk2wle6usF4DRaoKXeMMUaZSWUGPzqgC87k9cuVgKn/GDn7+aBVL4zknxoVt
 KmQjgiYxPKXPdt1F5q6nDTXjopJkmdNU1cQN/ZOPiaqQ3hLuaXdhFmkwpRjJOSoGJcXm
 tdnUGPzV2G+kIC2L0g3WEa77g0bO3bD6gqNqvLOUiIq2BykXru6USokk73f0JKHy3yrD
 fIUXmn5Uvoy+t1XCoi5t1DUaMxZMEExsS36vGmWrWC/YLUpsfqyEQYSdzMEajUp4dWMa
 6wQd8hj9NiNoBIOv49btRLFKwyJpWGVAnGO9NQBzJ8A9GuLuimM776Leor+AhjyL/2fY
 fPcg==
X-Gm-Message-State: AGi0Pua2xNuGNahnEzEufwvGy+EnPML6gxVSz3+HzQhbWTMrbMBIFodT
 UosyMCKDKqUhCpoU6uXbqwbh0A==
X-Received: by 2002:a17:90a:290f:: with SMTP id
 g15mr4269535pjd.93.1588268626909; 
 Thu, 30 Apr 2020 10:43:46 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id g10sm347782pfk.103.2020.04.30.10.43.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 10:43:46 -0700 (PDT)
Subject: Re: [PATCH RFC] target/arm: Implement SVE2 FLOGB
To: Stephen Long <steplong@quicinc.com>, qemu-devel@nongnu.org
References: <20200430172022.14886-1-steplong@quicinc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <b2e2f389-163c-e117-1b3e-aa57820e9e0a@linaro.org>
Date: Thu, 30 Apr 2020 10:43:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430172022.14886-1-steplong@quicinc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::1041
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
Cc: qemu-arm@nongnu.org, apazos@quicinc.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yGd0Z5XBrs7P

On 4/30/20 10:20 AM, Stephen Long wrote:
> +DO_ZPZ_FP(flogb_s, float32, H1_4, float32_log2)
> +DO_ZPZ_FP(flogb_d, float64,     , float64_log2)

Please read the instruction description more carefully.  The result is not the
full log2 of the input:


> This instruction returns the signed integer base 2 logarithm of each floating-point input element | X | after normalization.  This is the unbiased exponent of X used in the representation of the floating-point value, such that, for positive X , X = significand × 2 exponent.

Please look at Library pseudocode for aarch64/functions/sve/FPLogB in the manual.

You then use the helpers from softfloat.h like so

    if (float32_is_normal(x)) {
        // extract exponent and remove bias
        return extract32(x, 23, 8) - 127;
    } else if (float32_is_infinity(x)) {
        return INT32_MAX;
    } else if (float32_is_any_nan(x) || float32_is_zero(x)) {
        return INT32_MIN;
    } else {
        // denormal
        // extract fraction, normalize vs 2**-127.
        int shift = 9 - clz32(extract32(0, 23));
        return -127 - shift + 1;
    }


r~
