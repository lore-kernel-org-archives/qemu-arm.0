Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5676592lfm;
        Wed, 26 May 2021 11:21:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy5kRk18QLcJFMsd51Oh6M4PTglq4VZEa/1D/GJOgxuLdNaQ3aE0G/9hUlktsPBd0Fu9gfR
X-Received: by 2002:a02:b718:: with SMTP id g24mr4575848jam.16.1622053289422;
        Wed, 26 May 2021 11:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622053289; cv=none;
        d=google.com; s=arc-20160816;
        b=Yu5ZH6y0TNhg5BX4NGYQseypcXbFW5DnFCnnuUeUtzyw8U93vMxbEOdSrFg0Sdoz2e
         LcRNrLO0Tp2eAq5cwZ2y+OQutBTxNkLYYWP3PNCPVmQ6hj5cRZ6pxoEwx0cULN3a/SEx
         +QZpXnPh1J/uHcSW/QAE/Aro6YGNp63FnWiuwik2KWxmI29EzqXFTlwp2Qutsn++NjzQ
         09nr4Ep4XTEvbFz+bCV/gmw5XCI2va+pr2D4J5RjYyXxEJKUFqc6R7Mzpf6O64btnoyt
         XZkl03PeBlXO5F00SAv9HDFLIda6he4dhVBkIcvx8I0x32NsQIfma2cCsLU3zBU2FoRk
         uYYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=rRju/jjBGwrN1xvcOyDup2sVG0roEKR7mdyoEfLmHKI=;
        b=D7vVw1CHwGDn2qY4Dz2ycDyipkksBxBzhl3SaMLQYv/gj1iCol/zB4uJTYpS66sftH
         jkPThcWIAMvdCVqiw4h+oYgFiLe8hg8c+ErLx1+5bqdW/rx+Y1euVRt/+zNW6R1TWYv0
         kwjneTNgYUoqnh5j9XwlSeVEriGaRRgFaZ05mOqDJH8Z+kF9+M0y/3M22TWbXhga84nv
         /54NIYtmTnj/E1waQ6hLobG+9bXvrEcGHoW7WPFDLWpgwMRJ2nskAIauuh7j/5ligRaa
         fSxoGLEzGnbnlLOzn9hZ69ajDdIV913N1YgbaM4WOceorsyqIepIGYnrUcmOsKBGrU7H
         TzAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dGmD93+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s4si63167jan.21.2021.05.26.11.21.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 May 2021 11:21:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dGmD93+c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lly9o-0001qM-La
	for alex.bennee@linaro.org; Wed, 26 May 2021 14:21:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llxd5-0004Il-Fp
 for qemu-arm@nongnu.org; Wed, 26 May 2021 13:47:41 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1llxd1-0000aj-44
 for qemu-arm@nongnu.org; Wed, 26 May 2021 13:47:39 -0400
Received: by mail-pl1-x629.google.com with SMTP id q16so994025pls.6
 for <qemu-arm@nongnu.org>; Wed, 26 May 2021 10:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rRju/jjBGwrN1xvcOyDup2sVG0roEKR7mdyoEfLmHKI=;
 b=dGmD93+cb3/ZbvKlxKnzI/NwvWQe4TAKedNWgSS/sBrFCXCad5sFoObCjqVNGlRy5P
 C5W/0gC+dgaTfuHwIXELUN+BBIiqAwAExB7m9eZELNqtv5MNFEVOKwRHBs1vo+q9iGgQ
 z8pi03s8LAOES+QuznASx75mHgc+a1sG5YFSLFXbfhYsdFXKlTTD/5HJDs1pnOKpB9X2
 Q9gBQnjyZxXDozdrSlLQAkhrAijji3dbTYxvxfpmJbLe5QKthhTqJNTOAmpjEYQjMGiX
 sNk2KHI/F7HxWxRaWSpP8ePr6RFRhJTlenmw+ND8GDhcO79QyfcVVAGUiBVee3vVYi/j
 COpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rRju/jjBGwrN1xvcOyDup2sVG0roEKR7mdyoEfLmHKI=;
 b=FWw8tmTCDOhN+vplkoxecwjOYSr0x4Pt1+vy6ZKBcpjhyPts1zuQfvbuR62hOuwkM5
 WIdGzrc9qOrwVM7en5JhBrM4QjxCKA48/lAPV1CJQzHMyKFhUFo+BewGSRHqCeHvru7q
 4TodU1DfnmMcLwwE+v/boGyVm+BtOgZFkdCnwRrT7S+cbIZY1hT3lI65jBaqI0njAFCW
 f8aymvA508HdZpPhOE2zSfugef2uRIeeCxgHAQCeX4eB7FPNwNYSZfDsc3elKZzbX+Md
 PnRAPty/XE1M00ssh6EZPq9BHmSpKyd0kIyGhIMxPCg1OqJoL7seS0pr0jm4lOnvCxUq
 rIJw==
X-Gm-Message-State: AOAM533gwGZ9nlnRRj1YzsgBhXrzcX5k1Qqys/4v2aZC2BkZ0v3/e4fy
 ALiYfHMaA1lcPrHT0+EXGQ/NZw==
X-Received: by 2002:a17:902:e850:b029:f0:baa0:19ea with SMTP id
 t16-20020a170902e850b02900f0baa019eamr37145287plg.47.1622051252600; 
 Wed, 26 May 2021 10:47:32 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id k9sm13517pgq.27.2021.05.26.10.47.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 10:47:32 -0700 (PDT)
Subject: Re: [PATCH v7 02/23] cpu: Restrict target cpu_do_transaction_failed()
 handlers to sysemu
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210517105140.1062037-1-f4bug@amsat.org>
 <20210517105140.1062037-3-f4bug@amsat.org>
 <ae262a9c-1ffa-b680-4aa6-d7256fa6947a@linaro.org>
 <5a1389f6-ced6-3b09-ba9b-749e2db2de4b@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8c35d706-be36-1715-2fba-b43bd230d1c5@linaro.org>
Date: Wed, 26 May 2021 10:47:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5a1389f6-ced6-3b09-ba9b-749e2db2de4b@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wBBTYT7nasIf

On 5/26/21 10:22 AM, Philippe Mathieu-Daudé wrote:
>> What do the extra ifdefs buy us? Surely the fact that the symbol is not
>> present in the user-only, and would produce link errors if used, is
>> sufficient?
> 
> Last month on another series you told me we should declare prototypes
> that can't be used :) However I agree we want *less* #ifdef'ry, not
> more.

Should or shouldn't?

Anyway, I don't think any of these declarations belong in cpu.h.  There's no 
reason for any external user to reference them, as they ought to be using the 
hw/core/ cpu_* functions.

In an ideal world, we'd move them into some target/foo/sysemu/internal.h or 
something, which would involve no ifdefs and still give you the isolation.

But for the bulk of the targets, I think it's just easier to leave them alone.


r~
