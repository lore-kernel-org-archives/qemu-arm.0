Received: by 2002:a0c:ec8e:0:0:0:0:0 with SMTP id u14csp748592qvo;
        Fri, 3 Sep 2021 08:19:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBCuffbpsOx5sUdh3m5lDviJRHBXXpuqhYWdIT5hWJSH2cdBlf4bUBiU99VTEgkzFrejAp
X-Received: by 2002:a05:6102:ac6:: with SMTP id m6mr3086039vsh.55.1630682361115;
        Fri, 03 Sep 2021 08:19:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630682361; cv=none;
        d=google.com; s=arc-20160816;
        b=etN6k7xIdnB5YYaq8aph6n7gBy682Lhy5AT6fARSNCX+QDYb+BCnR1AbiU+lPkktem
         5nS07kKNb2askgRs+NG33R1OtekhWpwtupkQGHR3nk9Sl8hp4gYNpBFV55/FPURK0hsI
         DMVeaezIwtbMa1BFc22sHDVih0Ik8+yjb3qnUp05A4/aWP+HDcCaiUkCdxCe5U4bO/42
         1m+isjp+1de/9QUEN7lUMzvDSJO0Z1t94KzHdZYisr19sHj2E5q8qhU2vMQfZIMQG5Qa
         vnQtP/W5HVnj15J98ywm8a9Ja7EvisuFZlsgzUjd08Qg/aCad1T9YbdJgGYp+Ki+qv1a
         tccA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=HAxg8r9lLgPDGj5LAMgAQU9YS3InbbswD60+0+aY/Fo=;
        b=SmSPqYdQ/Dm3rTQVnmcbpG7oe6PktwryYe4PFXOIt/PP4BIakdcw7B4NMTmzIm+QYb
         +ANisvzi/mjKhiTeAD9JSlZhDRylTXZ2q41hsvVNi8czR8pP1O2bggm9kIFql40iLik8
         x9OyNljbpMXj3ivOnQlMns3n2HP0a2w6cY2Jv2yAHE6H7w3NhVnykkXyeE2VbCHzEKXL
         lUZCsYbmFz9jt1ZJNoGNJeQiSF2empNIbNUJ+tCuun8HqB6H0FSHQUtauF0KLg1th1qn
         Nol5v0PIQU4dwVuUGwvJ1Sw0sp7dz0CjM9dRIMI+Uh7N6Q0XGbK5XA3oOa/6Ci+RblZK
         IewA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PkwQi4uc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j191si2799465vkc.34.2021.09.03.08.19.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 08:19:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PkwQi4uc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMAyO-0004D6-Dr
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 11:19:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMAuE-0005Zd-Fo
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 11:15:02 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:42946)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMAuC-0007fm-QP
 for qemu-arm@nongnu.org; Fri, 03 Sep 2021 11:15:02 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 k20-20020a05600c0b5400b002e87ad6956eso3811543wmr.1
 for <qemu-arm@nongnu.org>; Fri, 03 Sep 2021 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=HAxg8r9lLgPDGj5LAMgAQU9YS3InbbswD60+0+aY/Fo=;
 b=PkwQi4uch0nS6r2jmWvHF7dsb9B9pkAGYUDlJ0kk73u6pgTAD8EWx7GA6KJ9FkvPuq
 BMZddtaTD4eMBGVqzgUnVkXhhn0kpp7SXLYL/FDBsRVdmCLFpxmUPj5YrG/Tr/1HUtd3
 B46Mn75hxPGKBs7nQLjf482INoPDccnOEY3xKBPn0VobJbhKqdD0SnXh+QUswRRBsTMB
 ILQDL0Z+arb7i9+rnlxJBXZwqTzu9ozdGX1JFU1FWZd5ht35EHoGeZRM/436cLI5tSo2
 fD86ASMR1J2Y7INpihJArJCuQTNSS2UeNAYes9Oxf3/VaF/uAcfRwJij46b1zviUFQoP
 /dyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HAxg8r9lLgPDGj5LAMgAQU9YS3InbbswD60+0+aY/Fo=;
 b=oFpppiLTOwxtBL7Ag9aSfcq2UJw/OZn8yId2kJwB7xuNKSoS80VPCz+QATdATB7ckF
 h0Q7YUFxRIjFuBb6D09OQP+Fytskb2BvQ2emkW30NqZU2LZLYNQm4wyLavX7SDagINNK
 6ejsuXY2Zkaud9laL/lEGV5lRv/ZZkFJvpn2ZACmD+Ust0OsJjWaMZ+2mxB0Q/FhPuUC
 FH1kYJWwRtr/Db4AJM9HgJVfXMZdLhU3SoXhz2O/NnakJPBMe+vQT/UO4rDLN6UWObp3
 U8dqwfZqEjr1tesFZBxlRRAtvyYHjv5RK01sYFMIaIaOyz5MXBUutUPmqvQc4qGWJMtW
 qaDQ==
X-Gm-Message-State: AOAM533zrCOFQuMFxkK5/Py5pJLS0nV/jx/kURoOb5agz9Rnd4q9YhTa
 y9c7lUfrZLg7g2yIDwFmGB2JYA==
X-Received: by 2002:a05:600c:b4e:: with SMTP id
 k14mr8868900wmr.139.1630682099362; 
 Fri, 03 Sep 2021 08:14:59 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id f5sm4545465wmb.47.2021.09.03.08.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:14:58 -0700 (PDT)
Subject: Re: [PATCH 0/4] target/arm: Use TCG vector ops for MVE
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210902150910.15748-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3209af2a-7611-b385-aa7c-6203f442d05b@linaro.org>
Date: Fri, 3 Sep 2021 17:14:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210902150910.15748-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32b.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CLGkx2D4b8tF

On 9/2/21 5:09 PM, Peter Maydell wrote:
> Richard: if you have time to scan through the MVE insns
> and suggest which ones would benefit from a vectorized
> version that would be very helpful...

VDUP
VMOVL (into shifts or and)
VMVN (which seems to have gotten separated from the rest of the do_1op)
VSHL
VSHR
VSLI
VSRI

I think that's about all.


r~
