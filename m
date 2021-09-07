Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp4738773lfb;
        Tue, 7 Sep 2021 06:45:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzx/K/487ESrPnNPcqBQf1/tI/BNeVi2g5/y1vKmQ9y4L4fK8ahcGtdhnWztEovIiLTQshs
X-Received: by 2002:a67:10c1:: with SMTP id 184mr5470144vsq.6.1631022309050;
        Tue, 07 Sep 2021 06:45:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631022309; cv=none;
        d=google.com; s=arc-20160816;
        b=ihSqRQ0AIS+8y0dgfpTQL2EDxMMs77WYBXR2dmrJD+nULutR7xbeOoOi2Qd3PqSUS6
         KxV5p5Np8GsL7ef/VEWLxog7lCKWLL9uHh4bYeC8SlZuP5TzML3T9f2rqzc/zLZPgfMz
         xRJks8PwDqdbAgjfIdn5Vq1LrPsmVeku7IZTEHE6G5Ii71g1il6IfDtLWWPQ6ECHsJ0z
         4I41M2opFRaDreH4KAyC/CvGyDQ0IMqntZOoCd0rfxUAPj9Zb88afwNaDPPFhOGK9Riu
         xIEWh8X0TUNoikJcbZx4UETOaW1Cft/Kp+jt59D/ZKXc/Z/ukP1z8jDvOyqvk418t9Sl
         xUdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=WkJEILKIhdl3VRNi+o6WcfgG/yP64dQ+4mkD99PbiSY=;
        b=A8REKvASh5SyUsFu7RaKMU0Xw7E5+8R0lu6sY/wr0cx9G0Kx03ghVgyJ6BDyjXvUjM
         h8Wf+x4hftoriR23vOqmUdQ3cCAsJCb2/9VEt8LmE6aiemGhC38JNYLeP8Muyaafe4O6
         CxOgnVcw6Bem/qa0krfe9bOjISxRJySsWb+zHNr9D9MPuw7XvzqopNWSz5g3t5kB4HBX
         5muzkmP/C5IM13zggB7vMrEtrtRdKak6CJ7AAD1TaXYEWcnDl45wvFB5lFIcDQtqxW9R
         aXQC2+yeSJAyvMQYWlGvRVRoquyHmvzmqT08EGzrq9m8dcHGsyhwWolQKD7V/N5kVAK3
         P12g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XhJXnn6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c15si2996418uan.258.2021.09.07.06.45.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Sep 2021 06:45:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XhJXnn6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNbPQ-0001E1-9o
	for alex.bennee@linaro.org; Tue, 07 Sep 2021 09:45:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNbOt-0001BL-Sg
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 09:44:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:43562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mNbOr-0004Cu-V6
 for qemu-arm@nongnu.org; Tue, 07 Sep 2021 09:44:35 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so1692513wms.2
 for <qemu-arm@nongnu.org>; Tue, 07 Sep 2021 06:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WkJEILKIhdl3VRNi+o6WcfgG/yP64dQ+4mkD99PbiSY=;
 b=XhJXnn6iv7V1MGRg9ZkLlas1IdzwsXckNYuZK2QugSrgr+IfNKJJ0bjcJUQrbOyr06
 LrfxDlXRmjDHEcq0HrnbYOTSRwoM4wrJZM+Ife7R6e9gh7FUvhrPEb3WftwjnB1PhOH/
 CMO0ofcZwZM6h4zBz0fBtTOJtRddgsWWEmuypIxs17tSO4BiVN97qpK0J877R15g7w8r
 JDwnyFjnqEGDKCPfCv6bPiegXwWT3pNCJfsgQpeCXegUUTW6ZK1CqAAsnCUxN7hVuZwG
 LEJIpqS92a/QTzlmsNdNxmFzQZf2l07YM7a194bNQnqguxs/jRbFHNkgr9Y5jk7ichEl
 AmFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WkJEILKIhdl3VRNi+o6WcfgG/yP64dQ+4mkD99PbiSY=;
 b=A8aE8hoprh/+QY2abiQNITsZY4SHEHe8deWjvD+4AAjvFauEyS1AQReQxmK96ybKdJ
 Sv0MX0NqfWGqWrECLviB29QhZee22sJ9VW29sIfDoqeLKbLxtxM3Z42bRwf06dYXYSMK
 Z+kUXk6+hOdIBRy3mSmCL2/cc107kq6yHczW7oGIQnVW7UYaITwPnqwYTonD3cdw0agU
 wYtdDsMEk5TF+vG9bAds0ut/Kxr0fVRzPQcnugxUyFy5YKoeTEiRVShtLFnsZRVFYlu8
 Lrj5a4ORQuJjGvFAJtkVByCU4KGFFVME69cloSRhR4v1Wk8N61LeXmnULkzbrceKtEzV
 EdnA==
X-Gm-Message-State: AOAM532FggLhBTEjiS36Ip6wchXyU2NutDB6BPWF4KogzKVEji5iuQmW
 F7epv25gTvAWxJFoMHkoPp7JTA==
X-Received: by 2002:a7b:cd92:: with SMTP id y18mr4120310wmj.78.1631022271773; 
 Tue, 07 Sep 2021 06:44:31 -0700 (PDT)
Received: from [192.168.1.165] ([139.47.33.227])
 by smtp.gmail.com with ESMTPSA id r129sm2357134wmr.7.2021.09.07.06.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 06:44:31 -0700 (PDT)
Subject: Re: [PATCH v5 17/31] target/arm: Enforce alignment for LDM/STM
To: Nathan Chancellor <nathan@kernel.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
 <20210419202257.161730-18-richard.henderson@linaro.org>
 <YS19IBEGrIUnUT2p@Ryzen-9-3900X.localdomain>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0699da7b-354f-aecc-a62f-e25693209af4@linaro.org>
Date: Tue, 7 Sep 2021 15:44:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YS19IBEGrIUnUT2p@Ryzen-9-3900X.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.332,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 llvm@lists.linux.dev, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KTf4RI5En+M9

On 8/31/21 2:51 AM, Nathan Chancellor wrote:
> I just bisected a boot hang with an LLVM-built multi_v7_defconfig +
> CONFIG_THUMB2_KERNEL=y kernel down to this commit. I do not see the same
> hang when the kernel is compiled with GCC 11.2.0 and binutils 2.37 nor
> do I see a hang with multi_v7_defconfig by itself. Is there something
> that LLVM is doing wrong when compiling/assembling/linking the kernel or
> is there something wrong/too aggressive with this commit? I can
> reproduce this with current QEMU HEAD (ad22d05833).
> 
> My QEMU invocation is:
> 
> $ qemu-system-arm \
>      -append "console=ttyAMA0 earlycon" \
>      -display none \
>      -initrd rootfs.cpio \
>      -kernel zImage \
>      -M virt \
>      -m 512m \
>      -nodefaults \
>      -no-reboot \
>      -serial mon:stdio
> 
> and the rootfs.cpio and zImage files can be found here:
> 
> https://github.com/nathanchance/bug-files/tree/15c1fd6e44622a3c27823d2c5c3083dfc7246146/qemu-2e1f39e29bf9a6b28eaee9fc0949aab50dbad94a

Hmm.  I see

IN:
0xc13038e2:  e890 008c  ldm.w    r0, {r2, r3, r7}

R00=c13077ca R01=c11a8058 R02=c11a8058 R03=c031737f
R04=48379000 R05=00000024 R06=c031748d R07=c03174bb
R08=412fc0f1 R09=c0ce9308 R10=50c5387d R11=00000000
R12=00000009 R13=c1501f88 R14=c0301739 R15=c13038e2
PSR=200001f3 --C- T svc32
Taking exception 4 [Data Abort]
...from EL1 to EL1
...with ESR 0x25/0x9600003f
...with DFSR 0x1 DFAR 0xc13077ca

So, yes, it's a ldm from an address % 4 = 2, so it is correct that we should trap.  You 
should see the same trap on real hw.


r~
