Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp5623624lfm;
        Tue, 28 Apr 2020 08:06:34 -0700 (PDT)
X-Google-Smtp-Source: APiQypJjcjrx1vU9C9f2Lkaq+rBtCp49V87gs6GnLi3kq/wUVcEHvqam4vEtBm4T8USVaYxo/d57
X-Received: by 2002:a37:b587:: with SMTP id e129mr27698836qkf.226.1588086393763;
        Tue, 28 Apr 2020 08:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588086393; cv=none;
        d=google.com; s=arc-20160816;
        b=Nt7GbjOBpx1AimxnxuJYEONiJLXh/XoCrTZlJQRDFwiWaHwPJ9MmwgleTRuZ6x7EUE
         haxciT4R9n47OKrvwX3DTCjpcI055Mt0UNytD2zs7ueggyS8j5RqMwemnFB/Fm47zkGP
         ndsOE4ILpWYqfc5PIskNlN0srBSv7lxRup3SGg4KXpYWBxQSyJtv7STSlE5Y67h2nuhc
         6UnjEbqqucJS9YfAfQixlqbRAQBuayyeYUhdq83DRrwY0yOFE5uNXOtlFvHKTG2TyYnq
         mACQxWWeC6T4ereDxmN7cm3i7sz485bY2RHWSlEfusaIJ6FzKjaYam2C/hlmgsxq20Ih
         lOaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=51pRypiGFKSGI4pYYYy/oWUaBflFIbs/RrLf++hBG20=;
        b=Ot3C3KKgVp/zfdf3ksuboEMA9EWgMXZoFZxySoFS3kw6J+gRecKF/YTYsqsxlHyIkh
         3i7YIscRcvmGVD58tJJPHPXela9eGlNaQPAAmfafdgln9Juj4WW391a9HKcuMYMZNpiy
         +i4g9g9wglrtI0j/14ow7SGIXNf/Usbf7Gh9zhwQq0ZRsSQwqjKcfYt+wAnYOKsqEqDf
         S+U5Bkym3VJTPKYLE6xhVuSiz2Vu5jL+h01jrsgJZjKuUTl73xH0A7DxhR3CYNlImDc2
         o3rmzwi/ZOVdCAsW+QPaMBdKVktJi4JeMLMNPwcDbV3kAFuVXm+F76NSx7lUUQUuWK7A
         Ng9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SNGb0Vyu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p58si11394746qta.269.2020.04.28.08.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Apr 2020 08:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SNGb0Vyu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jTRof-0006lf-2a
	for alex.bennee@linaro.org; Tue, 28 Apr 2020 11:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49458)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jTRmP-0005l9-Sn
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 11:05:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jTRkN-0007D1-52
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 11:04:13 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:39967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jTRkM-0007Bg-LP
 for qemu-devel@nongnu.org; Tue, 28 Apr 2020 11:02:06 -0400
Received: by mail-pl1-x643.google.com with SMTP id t16so8465301plo.7
 for <qemu-devel@nongnu.org>; Tue, 28 Apr 2020 08:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=51pRypiGFKSGI4pYYYy/oWUaBflFIbs/RrLf++hBG20=;
 b=SNGb0VyuRnRh3WVgHha7whyhblwGUKS5Ilsatd6ThWGikhGmviLo1J0B6KbcRSfvXs
 caT2RF2ykTsjZS0CMMnwpYNONjvAIlouYmJkwuWNfg9THyPDPyC9JlzmDFiMLSTkIfBG
 loIhFtwnuxK8CRfkxYfRvzZfFPCCARAAQzvxW05Efhv/FK6q4g3klXI1JVMhTIwO7uSC
 bllBRnCQQCOm2kmP5ql6svaV1njZbjaAm+D91fvxOIC8FeSF1YyQ0vwVHwaerLKip3DB
 cEqAs290R1eNKStR05RQYO4gTo6BsUKDLioazCXtlcCksr0/kbsbp97P3fhyKbkS/mFl
 lovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=51pRypiGFKSGI4pYYYy/oWUaBflFIbs/RrLf++hBG20=;
 b=b7CupncQ2sj0bFjutewS9oKhl2QnDKQ0o36OrQwjIKiWiFaaJ4TzahumsrvYjggB8q
 KN5u7gblkjuR6xsgsRS9sC6Csr2mWfKnalWMRJ01lLRFKz8FrYCjOSjh5iD2j6jsmpCS
 t9l01jTn9Vftxjwt/ASy44To+HiRdjWPpdB5BZnqjCyAZOz98EgJqa2/b9FzzDw1hWRw
 xZH8/Bd/FAMXOOkNxWgpAJnEVQnYKZNwhq2uDKBClcoQWPc8SUUmsePX9ia9jROM01l1
 JzvH2OGHQKdEr88swoChQ/dRR8EpXFNaV5sxsFQr4tA0QiDrtwQBnZ8bK6VxdPf647fJ
 rKDg==
X-Gm-Message-State: AGi0PuZ/uDMFHjA5qPzfQ1q7bhlP+7M5AYeB+o77AHFKO2B6Lse9WPeO
 led96pG+ZSHfWMekf/pohl44Lw==
X-Received: by 2002:a17:902:5a03:: with SMTP id
 q3mr11264040pli.45.1588086124325; 
 Tue, 28 Apr 2020 08:02:04 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id w66sm15307675pfw.50.2020.04.28.08.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Apr 2020 08:02:03 -0700 (PDT)
Subject: Re: [PATCH v3 13/18] target/arm: Update contiguous first-fault and
 no-fault loads
To: Peter Maydell <peter.maydell@linaro.org>
References: <20200422043309.18430-1-richard.henderson@linaro.org>
 <20200422043309.18430-14-richard.henderson@linaro.org>
 <CAFEAcA8oWP9XGzD+pb_VhDth8zx8j1Gz4vwiK+dArpw8x1BmqA@mail.gmail.com>
 <22c1fd55-7cd3-6320-1f90-40d1bd2cc883@linaro.org>
 <CAFEAcA-iqrEi_wQ+mBN1NtrEKq3uDYPoDunqW5e9KV6ivz3-SQ@mail.gmail.com>
 <d148806b-c7f1-fefc-bfb4-fcefb81ab509@linaro.org>
 <CAFEAcA-iJWqPQ-SwukaBcxgNFppAmeZNUR2doz6sgV6RduC32A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <df19b271-55ad-9071-2790-d0d4991fe831@linaro.org>
Date: Tue, 28 Apr 2020 08:02:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-iJWqPQ-SwukaBcxgNFppAmeZNUR2doz6sgV6RduC32A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::643
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v25OkUozKWxO

On 4/27/20 11:38 AM, Peter Maydell wrote:
> I would suggest something like:
> 
> +     * From this point on, all memory operations are MemSingleNF.
> +     *
> +     * Per the MemSingleNF pseudocode, a no-fault load from Device memory
> +     * must not actually hit the bus -- it returns (UNKNOWN, FAULT) instead.
> +     *
> +     * Unfortuately we do not have access to the memory attributes from the PTE
> +     * to tell Device memory from Normal memory. So we make a mostly
> +     * correct check, and indicate (UNKNOWN, FAULT) for any MMIO.
> +     * This gives the right answer for the common cases of "Normal memory,
> +     * backed by host RAM" and "Device memory, backed by MMIO".
> +     * The architecture allows us to suppress an NF load and return
> +     * (UNKNOWN, FAULT) for any reason), so our behaviour (indicate
> +     * fault) for the corner case of "Normal memory, backed by MMIO" is
> +     * permitted. The case we get wrong is "Device memory, backed by
> +     * host RAM", which we should return (UNKNOWN, FAULT) for but do not.
> +     *
> +     * Similarly, CPU_BP breakpoints would raise exceptions, and so
> +     * return (UNKNOWN, FAULT).  For simplicity, we consider gdb and
> +     * architectural breakpoints the same.
> 
> assuming my understanding is correct...

Yep, thanks.  I'll merge this text.


r~
