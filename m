Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp2228244lfm;
        Thu, 30 Apr 2020 11:44:21 -0700 (PDT)
X-Google-Smtp-Source: APiQypL52JS8FRR2G0jKbthuYMmN7plC314Bu6aB4Fsa1iFbOmDyC7r6TWh3EyGmSanbRija0Dgw
X-Received: by 2002:ad4:45ac:: with SMTP id y12mr233356qvu.227.1588272261362;
        Thu, 30 Apr 2020 11:44:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588272261; cv=none;
        d=google.com; s=arc-20160816;
        b=idwQ088tOsdEOBAUuVeDHAiaWGbmNeeeGLg281/m767o/Z+BxG9DzFSap7yQBlAtqt
         nyAr4++eF2eI7qAtrjo4XpvdUJgmIWHfdzNjI91BHfslE2Hu2kBzFDyb/OHIbbLpTbkq
         aPzKMg59auJhBXTqxazfXUZVvTvY8QJ16hT2m5c8OQqyNJG1QZmeiGcwRDouirJ/AO/P
         xVQ9zSBHAq6/8fVNT1kRuon4hKmDpWELjmqIhjvqJMKiiKOOZe6I9jwAR/tyZ1Xml/MB
         vjr4EUv6b/RSW//2PWQLP2EIQ+/dN+RZn02WcE/svUPDnZ8a00EFjUaapCAHBWVJUsAQ
         Jjug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=L5jdqP3nOkRKrOSceDd/G4FGfjto9mJjy8zkhK2QHSU=;
        b=de/60/SFnODSRvmTngRzHXjvrNDi8fokKyOhve84dPLJvbWXjw2da1bRmrmaus8r0o
         JjsRAQqPbN52r6bopf9FCtrjhlGpjtAG/+FjGSmcLkw/NVEexDuWKhOooseUwzeV+bqi
         d8OAoRkiC4UCPyj+lDLyeKrUAeu0suBdRprQlQGa8f/15L1EMbgYqFkxE+scGBpxbdaf
         HM4S+PE2S7eh5G0bp+rbNdi+vcTiaYy7HugKDHK6PHEYoCmpSfMf3yKaRac+DTwiOsG0
         D6hoW0+bwq9Asx2zYa9fpnemR/X6vX/84HchTE15UrTgNNvsvBXPs97Pr96oLAqPgM+U
         4hyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W1rnXekc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id w92si300648qtd.274.2020.04.30.11.44.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Apr 2020 11:44:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W1rnXekc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUEAW-00057L-Mi
	for alex.bennee@linaro.org; Thu, 30 Apr 2020 14:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUDwo-00070j-HO
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:30:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1jUDwm-00050l-HV
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:30:10 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jUDwm-0004wd-1b
 for qemu-arm@nongnu.org; Thu, 30 Apr 2020 14:30:08 -0400
Received: by mail-pl1-x641.google.com with SMTP id w3so2574649plz.5
 for <qemu-arm@nongnu.org>; Thu, 30 Apr 2020 11:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=L5jdqP3nOkRKrOSceDd/G4FGfjto9mJjy8zkhK2QHSU=;
 b=W1rnXekcKUNYSDzepkfU4jYUx9+6kzFG7m4B6WVYq6FHCCMx9MI/yTao9GcBpMFYoV
 2yxNetacs9RZsa8dI0Tb9KA7O2EYzeJLauLqA/N8QPILHz271BIicatvtopdO8W4cDYf
 Kn+gndwXjdmjQijlCQiLW81qzJyW0npz4PqIB1ZbZUjKJehrt9ASYkL8W/KzKzvhk8OK
 t1r3KqGVvhcsgU3putfj4ZrFO3n/ZPcJpq8M2GgtVqtUXTsn1y9U9+5V1L+pozyeXfkF
 n+mgt6u1Aw1iA+pcbAtJvSxCzRO6ENf1+cUyjeB0rBw8CoiBEGCMGoAhWFWB5jeEMmXy
 86aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=L5jdqP3nOkRKrOSceDd/G4FGfjto9mJjy8zkhK2QHSU=;
 b=ZCWgJ1ZCt2qToRLX1SJFEgYuflYLzRWs8f7traMvsFRO8jjc2aY3dlQsqOIM1vUiq8
 2eNNgizn1grrUe/ZPjYfuFGTlgjhUGuaiZIiWJpalmL+wcdu4nZ9kpwyfLrE8ENygz8G
 rXaxhTbIWox04KYoWdS7uwZ0G7GnaLYYuRMR9KItEAk0xpm0eApBKoIh6c5N7cts32VQ
 CsBWShWTlxuI2B0vDcdiDZnvWoATph9YuJ0kTyncTHgNngXSpcOzCn6ehfA+ZlEzBOdw
 j0n1Pqdqd3RLHcuOP5N7IsA6RA83dbgJGRMevy2i5SRL4hh9qyivY5uyUEnvHeWlmUnh
 W/ZQ==
X-Gm-Message-State: AGi0PuYafgt1cCQ+e+R0ZlwF75gTWYDZe8SamJUc5lfRRACfDrJUtO1H
 V74rBQxnjgghF6y13G9HQ2JSeQ==
X-Received: by 2002:a17:90a:1b4c:: with SMTP id q70mr90801pjq.55.1588271406456; 
 Thu, 30 Apr 2020 11:30:06 -0700 (PDT)
Received: from [192.168.1.11] (174-21-149-226.tukw.qwest.net. [174.21.149.226])
 by smtp.gmail.com with ESMTPSA id d203sm419462pfd.79.2020.04.30.11.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 11:30:05 -0700 (PDT)
Subject: Re: [PATCH 03/36] target/arm: Add stubs for AArch32 Neon decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9fc66f0b-d818-c4e3-db06-5776f97184e6@linaro.org>
Date: Thu, 30 Apr 2020 11:30:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430181003.21682-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::641;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x641.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::641
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
X-TUID: 7sj7Pd3qZUji

On 4/30/20 11:09 AM, Peter Maydell wrote:
> Add the infrastructure for building and invoking a decodetree decoder
> for the AArch32 Neon encodings.  At the moment the new decoder covers
> nothing, so we always fall back to the existing hand-written decode.
> 
> We follow the same pattern we did for the VFP decodetree conversion
> (commit 78e138bc1f672c145ef6ace74617d and following): code that deals
> with Neon will be moving gradually out to translate-neon.vfp.inc,
> which we #include into translate.c.
> 
> In order to share the decode files between A32 and T32, we
> split Neon into 3 parts:
>  * data-processing
>  * load-store
>  * 'shared' encodings
> 
> The first two groups of instructions have similar but not identical
> A32 and T32 encodings, so we need to manually transform the T32
> encoding into the A32 one before calling the decoder; the third group
> covers the Neon instructions which are identical in A32 and T32.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/Makefile.objs        | 18 +++++++++++++++++
>  target/arm/translate-neon.inc.c | 32 +++++++++++++++++++++++++++++
>  target/arm/translate.c          | 36 +++++++++++++++++++++++++++++++--
>  target/arm/neon-dp.decode       | 29 ++++++++++++++++++++++++++
>  target/arm/neon-ls.decode       | 29 ++++++++++++++++++++++++++
>  target/arm/neon-shared.decode   | 27 +++++++++++++++++++++++++
>  6 files changed, 169 insertions(+), 2 deletions(-)
>  create mode 100644 target/arm/translate-neon.inc.c
>  create mode 100644 target/arm/neon-dp.decode
>  create mode 100644 target/arm/neon-ls.decode
>  create mode 100644 target/arm/neon-shared.decode

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
