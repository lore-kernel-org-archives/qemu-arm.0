Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2953178njc;
        Wed, 24 Jul 2024 01:56:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVlwXITA/Qh4Jz4eSbDGmb7USbIWsVIui/n9Oz9CKf98pzGDGQknl04VgdkLZDldkG45s3vLTdXwUHa29W3RkU7fHR2z+vN
X-Google-Smtp-Source: AGHT+IE1FPIzBM3PRh4EXDs4aPCGgAJYUMNYqug8QaDN5hNnOV3ZNFIIbwGS4X/8gHOk1EP9xgNB
X-Received: by 2002:a05:6102:5682:b0:48f:eb7f:24ab with SMTP id ada2fe7eead31-49283faea83mr8199923137.30.1721811391717;
        Wed, 24 Jul 2024 01:56:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721811391; cv=none;
        d=google.com; s=arc-20160816;
        b=H21GuYt6V9OyFMHVOvNgpch01QDjui1s7srRki/iXUmEJ2yMVzf1Y4/GIqSErOE5Ul
         kNfh9C9l4IPZ/Y+19nlzJUrgrDYHORWMkydrxopfzLQwsU/c3WvIXlOHGChiFn28ol37
         YM8hgXOMVtIcAQqJMfZE1zCOaaQGAIvVlsVDmiv0s+F5YfH/a8lO3h1G+G7/jptkc5Zk
         kNWAah+ZJza2taRU3+b9cCHfiTGodugboUjzc/6MIo/8NE0uuy9zIIbg5RGgObuCE5Hj
         yaq3GuCXzCOGc7aiGGPCk7LA4dugTVYb4q7PqBqCNctQbmk5OoqY8+s4ijgLF3QPoL67
         PbOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=akgZQgA7uUR9t3bj6RrulV+rKA+8OE70vYfcmBymVA0=;
        fh=kleuIYwpJ+4ea0owIDYY0LN7C7eepvKPNX4qrfsJFLg=;
        b=uy9WBlATXJfAaMO3Oz9mKaS+pIZy25+5dh6qETnZrgZHrbrmGRpXkKyt5YHryrvUiV
         JTC73THVMY3puE7JC1J6uwE25XQOHf85Y7Ih/nLzdIwwf8SNnHqF0N9XmdDY3BC6zVz/
         FWt3rgWUPYu15iey8EEjUycmtocneuuHJ9mRnJA13lufcwUs4B6L8JZQDqwgjiMECzAS
         QPZaoaFGD57T2u5orwhJT0hQSLOHH6hVoU86pg3NGfusaCtmNIYyAWVyn/YCiS/cYbup
         Xr0chNfZzYuRGCHafzScpRCbAlN6b4BngD5KsJ5LYtilJkduxxFPC5mqSLCeugXNWErM
         MYdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VlfUIIsw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1990925d1si1200956985a.569.2024.07.24.01.56.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 01:56:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VlfUIIsw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWXmv-0004hc-8I; Wed, 24 Jul 2024 04:55:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sWXmt-0004dw-T0
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 04:55:55 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sWXmr-00049R-Ty
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 04:55:55 -0400
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-70d2e68f5a8so2010374b3a.3
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 01:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721811352; x=1722416152; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=akgZQgA7uUR9t3bj6RrulV+rKA+8OE70vYfcmBymVA0=;
 b=VlfUIIswE0HPyEZC90KkC2ztoiVfmmXNhfGbWrNZ11UtRb8g4phQNUdZVC0ORXZNKY
 Q4fJs9wX01mNBn+zVWIVHX4mXz8y6lpqfLuKIwebTfRDqG78JgubmkhFRxaFpG+8Yhow
 dmK2h28chqOqlpEt3oJsDF4itvcCOKbK52uhr+SBhLteeIcovnhqABdkIlIDcjomD2Su
 1pAjeljM0xX1qAJt8IhOmkX4DBSMM2N4l/2+j6tKCQtvwleCVQHwNZXrvac0QszHsMPG
 D9NivVyATjU8hF2KqHXsGkqKn37oAtL74BfNaE+5ybq2BplSoFLeBVzoyKecU/5BB/9Q
 De/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721811352; x=1722416152;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=akgZQgA7uUR9t3bj6RrulV+rKA+8OE70vYfcmBymVA0=;
 b=jUcwPFLa2/tSqgEXLXjmIQ8K2OrrDlQ2zVS/j1VEIJP22pNchUW4St0yxaO1JWYcr2
 k1wfotfQd+ojiDV674v0HMsa2JPgzMTjTlWdYPX2M0gS+mnO+r+6yHJb/9Iw2vFDqepP
 EqW6ZEgbVMPxXAwDA9blrO3itXyt9wnhWBf27FcKuepJttOoWZ4YVdQjprVQYwx9/9iG
 Bo0OIS+sUDoHIu+QloQ40lVqJ+UifGkqdWTzruXWomYkm8jb+NSWr/8GvRNqwmJxYWSG
 4oPVGuBS5cf9VoehNqfyOG6mISpWx9h/z3I52trqGO1204c/QS68ISnGohgKJO+UFqUs
 k0ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRgnvUKgMQlRc8y2I7G+28kqUgVW8CqkHkgtt4tsYmZjbDUZoUr60E2ZNgpma8bG9TakFww91gEvL6Hy90BXvPr4xJ
X-Gm-Message-State: AOJu0YySeiaUKgZpotrVMXtSdBtU2Jty0l9PtXmD07tImb7OwsicLHmq
 sV4l0ryWNph+pEi+TEJoOoiyXeuyfYRuQdkZAlBk5kd+ZqiUQZa0fpbZswbDmjk=
X-Received: by 2002:a05:6a00:1885:b0:70d:1dcf:e2a5 with SMTP id
 d2e1a72fcca58-70d1dcff066mr14222851b3a.3.1721811351847; 
 Wed, 24 Jul 2024 01:55:51 -0700 (PDT)
Received: from [192.168.1.113] ([203.56.128.103])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70d270cab28sm4719985b3a.115.2024.07.24.01.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 01:55:51 -0700 (PDT)
Message-ID: <d76f7003-e36e-4b9f-a7db-7e8e962b446d@linaro.org>
Date: Wed, 24 Jul 2024 18:55:43 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/14] Bsd user for 9.1 patches
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans
 <kevans@freebsd.org>, qemu-arm@nongnu.org
References: <20240723180725.99114-1-imp@bsdimp.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240723180725.99114-1-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: PLdRcJZ9niGp

On 7/24/24 04:07, Warner Losh wrote:
> The following changes since commit 3cce8bd4d737f2ca688bbdcb92cd5cc683245bbd:
> 
>    Merge tag 'ui-pull-request' ofhttps://gitlab.com/marcandre.lureau/qemu into staging (2024-07-23 15:23:05 +1000)
> 
> are available in the Git repository at:
> 
>    git@gitlab.com:bsdimp/qemu.git tags/bsd-user-for-9.1-pull-request
> 
> for you to fetch changes up to afdb6be1bd8528395af65a087bd668bf7a42ab99:
> 
>    bsd-user: Add aarch64 build to tree (2024-07-23 10:56:30 -0600)
> 
> ----------------------------------------------------------------
> bsd-user: Misc changes for 9.1 (I hope)
> 
> This patch series includes two main sets of patches. To make it simple to
> review, I've included the changes from my student which the later changes depend
> on. I've included a change from Jessica and Doug as well. I've reviewed them,
> but more eyes never hurt.
> 
> I've also included a number of 'touch up' patches needed either to get the
> aarch64 building, or to implmement suggestions from prior review cycles. The
> main one is what's charitably described as a kludge: force aarch64 to use 4k
> pages. The qemu-project (and blitz branch) hasn't had the necessary changes to
> bsd-user needed to support variable page size.
> 
> Sorry this is so late... Live has conspired to delay me.

Something didn't get committed properly, as it doesn't build:

$ ninja
[343/1144] Compiling C object 
libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o
FAILED: libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o
cc -m64 -Ilibqemu-aarch64-bsd-user.a.p -I. -I../src -Itarget/arm -I../src/target/arm 
-I../src/common-user/host/x86_64 -I../src/bsd-user/include -Ibsd-user/freebsd 
-I../src/bsd-user/freebsd -I../src/bsd-user/host/x86_64 -Ibsd-user -I../src/bsd-user 
-I../src/bsd-user/aarch64 -Iqapi -Itrace -Iui/shader -I/usr/local/include/capstone 
-I/usr/local/include/glib-2.0 -I/usr/local/lib/glib-2.0/include -I/usr/local/include 
-fdiagnostics-color=auto -Wall -Winvalid-pch -std=gnu11 -O2 -g -fstack-protector-strong 
-Wempty-body -Wendif-labels -Wexpansion-to-defined -Wformat-security -Wformat-y2k 
-Wignored-qualifiers -Winit-self -Wmissing-format-attribute -Wmissing-prototypes 
-Wnested-externs -Wold-style-definition -Wredundant-decls -Wstrict-prototypes 
-Wtype-limits -Wundef -Wvla -Wwrite-strings -Wno-gnu-variable-sized-type-not-at-end 
-Wno-initializer-overrides -Wno-missing-include-dirs -Wno-psabi -Wno-shift-negative-value 
-Wno-string-plus-int -Wno-tautological-type-limit-compare -Wno-typedef-redefinition 
-Wthread-safety -iquote . -iquote /home/rth/qemu/src -iquote /home/rth/qemu/src/include 
-iquote /home/rth/qemu/src/host/include/x86_64 -iquote 
/home/rth/qemu/src/host/include/generic -iquote /home/rth/qemu/src/tcg/i386 -pthread 
-msse2 -mcx16 -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE 
-fno-strict-aliasing -fno-common -fwrapv -ftrivial-auto-var-init=zero 
-fzero-call-used-regs=used-gpr -fPIE -DCOMPILING_PER_TARGET 
'-DCONFIG_TARGET="aarch64-bsd-user-config-target.h"' 
'-DCONFIG_DEVICES="aarch64-bsd-user-config-devices.h"' -MD -MQ 
libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o -MF 
libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o.d -o 
libqemu-aarch64-bsd-user.a.p/bsd-user_aarch64_target_arch_cpu.c.o -c 
../src/bsd-user/aarch64/target_arch_cpu.c
In file included from ../src/bsd-user/aarch64/target_arch_cpu.c:20:
In file included from ../src/bsd-user/aarch64/target_arch.h:23:
../src/bsd-user/qemu.h:38:10: fatal error: 'target.h' file not found
    38 | #include "target.h"
       |          ^~~~~~~~~~
1 error generated.


r~
