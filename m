Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3928453ejc;
        Tue, 29 Aug 2023 14:09:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFeTZxGus1LNzsWYmM7lm+ggxTX2VjGThhDAOgC2bBdxCOgUJNSPDGbGH0yD1RFkVbfe3RQ
X-Received: by 2002:a05:6214:5ec2:b0:64f:4c7c:2e13 with SMTP id mn2-20020a0562145ec200b0064f4c7c2e13mr161373qvb.9.1693343396532;
        Tue, 29 Aug 2023 14:09:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693343396; cv=none;
        d=google.com; s=arc-20160816;
        b=M5XYGOCsfB0ClrSrfmYOn9Bw0kft1XjIeOx9LaStYjRqPUjr19riJbe2/HHo5aZqDr
         EaxQppSY9ZztL/ZoHP8SDZINwoNXApJLqCCKX2oc0k9mlB320YGPOX8bePlPaqfJoBc1
         4pof0JDfP331viice31fnURDZpX4cZima1TsYpavwiTHhU5sXsvNbrjAw9G4WcLF1COM
         3J3VbENmFvl4PGCy8B7F+VvVvjz202rHCTy6XxbXAdqMPq0fWGlrzsA3wKaPAtl49pwG
         /VZ6LG1RulbwQW4whiPa9YDYYH/ne6WMMPJQ7A8ZmEgZxxNOTxd5wiOZxX7L9t/OlN3q
         nCjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TUBYDfeffd8w/OzIb2alHZzc9ZHNtW1AXt2YRq5/ccA=;
        fh=VQUMc85x8ANizanga/Uk0eVpSOWbPwTPWK+d/C2OKHM=;
        b=LgDSF1iL3qlGaRsBaXt3Cw3rjocvoejhFZV5AM9i357jRW8L/lOkDEt/YjHNWXpEza
         7fGmWD5cqU1s4ysIaENlTx1oYSpWW9982xUES1/ViYQuAsrQv5J/Cc7b2jDLcw+Eg8F8
         FFZJj3PgTolhGtZ51gTcAPhFUiv3MK5lCXxi6+ihz56JRKwViFfSj+obyvv/nP+FQALE
         JDJaIxfW2NslbDxbiNgbUcFi7WvR08ghga9jdZo4EqEPmWfB5/vXB8VNMnNTtnSyMaP1
         jDuv5BIrhBJo+nlJ/6MAtcCr/VYku15Yq+PFPIdxsmA3AhGpeUL9+KkYaBWtZCx0h/19
         wU3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X8C/Pm2v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h18-20020a0cf212000000b0062614d80f5fsi6377949qvk.313.2023.08.29.14.09.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 14:09:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X8C/Pm2v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb5xi-0006gJ-24; Tue, 29 Aug 2023 17:09:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb5sG-0005ds-FL
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 17:03:45 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb5sC-00020r-JY
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 17:03:44 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-68c0d886ea0so3409943b3a.2
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 14:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693343019; x=1693947819; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TUBYDfeffd8w/OzIb2alHZzc9ZHNtW1AXt2YRq5/ccA=;
 b=X8C/Pm2vt1pG8H+fdy3aTXqCpvn9FLR4FqwDhBeIbS407eRizKZolxDwJuK87jBrVr
 gLBzA7eqC66o6kZDiSTKgnc7bdNtLha13Ff30Jvru5QDhLbI1wHsG3rzejp7OfdTyAB8
 cSyp+1r+tz8QWZdhz1Fg16KsBiOFAB5ApSuWe9xA2n6kVRklJgSPYzXf72qZyArq21TG
 k4QmjxTembT2SuaB5rIC3Aa9PQZfCRVFB1AVeqbAvO5pGN7trnGYTaiYTPtYiv5AIB8u
 9koo4mbR62fip087LjuuwwcCZRZTM4nl0KJFJbzQX0MPfIEPGLX4/6JFEx7UVDJtTxnK
 yVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693343019; x=1693947819;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TUBYDfeffd8w/OzIb2alHZzc9ZHNtW1AXt2YRq5/ccA=;
 b=GxMRFuW6yUWIbb4RdNrlVrj3O3G0lGtuYgx6B06hVzm8oGDg7KhpDKQSlUQ71w6/Dx
 Stlf7HPY88KKUmLaFHllW7ScWbaOjlYBipbyx8QRQPmYb8UBvc45wAhghMZX4kw6fWO1
 5/QzbARf2a3mVzR4jpOxY07EKTrPMJbIfk0x0bqNZlwREsBO6ybF7mDBkaw0b/HMvbYE
 GxUTqrjMq2mYsYFYT+FPJrWW16AweoiRlRw6O1IhmsU+8LbJNqoJ858sjZ4e8pwcgn2t
 ZlB8RA9N5V2VrDx4evGY0wCisCLOd89MeN0Zlve8UsArt6TsK5+xOVna5t/FBSUV6lQR
 +ZBw==
X-Gm-Message-State: AOJu0YzWd6iOQMSYGvDQPxiHHMR2b8Y9fZ2p9VQVCDhImiDK3eW8lbxO
 pNdgQUgjGVk5LQ2i3jAnQggTZA==
X-Received: by 2002:a05:6a20:12ca:b0:138:2fb8:6a14 with SMTP id
 v10-20020a056a2012ca00b001382fb86a14mr510854pzg.3.1693343019019; 
 Tue, 29 Aug 2023 14:03:39 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 y10-20020a17090322ca00b001bb9bc8d232sm9829043plg.61.2023.08.29.14.03.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 14:03:38 -0700 (PDT)
Message-ID: <d6851f26-c241-15b5-39b0-59025380445d@linaro.org>
Date: Tue, 29 Aug 2023 14:03:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] linux-user/aarch64: Add ESR signal frame for SIGSEGV, 
 SIGBUS
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20230822170209.1130173-1-richard.henderson@linaro.org>
 <20230822170209.1130173-2-richard.henderson@linaro.org>
 <CAFEAcA8vCKZetufuysbsvSPo8xZaVHMa5n-mNrc2wUztD+Mfyg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA8vCKZetufuysbsvSPo8xZaVHMa5n-mNrc2wUztD+Mfyg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CHDZif4wbucq

On 8/29/23 07:35, Peter Maydell wrote:
>> +    /* See arch/arm64/mm/fault.c, set_thread_esr. */
>> +    if (sig == TARGET_SIGSEGV || sig == TARGET_SIGBUS) {
>> +        return true;
>> +    }
> 
> It's possible to get here without env->exception.syndrome
> being set correctly, I think, if we take a host
> SIGSEGV or SIGBUS and host_signal_handler() calls either
> cpu_loop_exit_sigsegv() or cpu_loop_exit_sigbus(). Can also
> happen for other places that call one of those two functions,
> like allocation_tag_mem(). At least, I can't see where we
> would be setting syndrome in that code path.

cpu_loop_exit_sig* go through arm_cpu_record_sigsegv and arm_cpu_record_sigbus, which use 
the normal fault processing paths to populate FAR_EL1 and ESR_EL1.

> Maybe we should do the "sanitize ESR for fault addresses in
> the upper half of guest address space" logic that the kernel
> set_thread_esr() does?

I guess we could, though I'm not sure how such an address could occur.


r~
