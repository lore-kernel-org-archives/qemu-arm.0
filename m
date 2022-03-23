Received: by 2002:a05:6512:e9d:0:0:0:0 with SMTP id bi29csp1974860lfb;
        Tue, 22 Mar 2022 17:42:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw88eZuq+Ysmn6uEs0HLasr4RfYcwzjvRmw7ma+Vi8bLG3rWD6L69LTJ1heYUPFC9xVroJd
X-Received: by 2002:a05:620a:29d1:b0:67d:551a:f790 with SMTP id s17-20020a05620a29d100b0067d551af790mr17078114qkp.770.1647996175382;
        Tue, 22 Mar 2022 17:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647996175; cv=none;
        d=google.com; s=arc-20160816;
        b=cgw0TtOZ7VvF6oLIP1mQEYkwn8GwV2wShrecDT1XUdUOT5o9KwP9UyQUAvR0LWE53j
         SFx95jypL7Bluhu60BE1szg0tK7Pgbj03+QzKeNWiXatyyyqTmWf09srlMT3sPOnu7NO
         1LNKrDO7JWaOcPhi5qLV8E5efz9Gv/SPpfJ5czYG6NT2qaguWEjEo3vdLH7el9wm++3l
         w0lh1O2PW09jSPB36JXlmCYN5dZfqbrL4ZDvtSn55U9cxXO2vgjLGIYlVoLIUVSkcrj1
         FwEUebMvcJoSVdds1OoemH4PdD3/bgmTRRp3a9FuxPl96DfoCyysm8PS1Hl/NDi7nnO6
         Gp7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=dm+g0HdQXfywzgNjDtGSAtzan4mMlCIj85DWtPLYH5w=;
        b=bIW1mvh4c9MbhczaHRu+Bp84ooqmb4iRNt4xo9xtqt+Tz0RdhzSAOfgPKsC+F+pjrE
         vIQyF5UOZCg0CzBhliqsV/BwfBKTyRB7cnmpp7BGr8obYauLvB285oY3ZqqsB5vFjcIc
         XGBUfuULS9H2iHMg2n+tCpOtBlqngn3UiUK/5rJMlPsfSl+j5/YJo6adCEHopc+X/0Xx
         NLj0syL83puXA2eE2cnXDxEtqlLtTAuFGMHMq3iBiQvND03Dr9hwjqyyLSmfJvV0hXgN
         dIcl19HU7mvPNLbTXKog6BkIduDIPXYStnOfdXDjIaK64K5aQFRNQDoUe4P4M8OiR3UP
         hBuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SVafHEXo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k24-20020ac86058000000b002e2027d0b54si3206045qtm.347.2022.03.22.17.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Mar 2022 17:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SVafHEXo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nWp5S-00035q-Tu
	for alex.bennee@linaro.org; Tue, 22 Mar 2022 20:42:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWp4H-0002KS-Dn
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:41:41 -0400
Received: from [2607:f8b0:4864:20::42a] (port=45691
 helo=mail-pf1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nWp4F-0001Ok-Na
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 20:41:40 -0400
Received: by mail-pf1-x42a.google.com with SMTP id s8so175950pfk.12
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 17:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=dm+g0HdQXfywzgNjDtGSAtzan4mMlCIj85DWtPLYH5w=;
 b=SVafHEXoNHoQTBU+DAidKxjnBj2tkDR/DWCZ3UeKAtgP1CwR3Dr0D8a27xL/PCWwCu
 W77FvZMurPgEr/94AfrPoGOHj26k7E8uyJxFifGxwWTPi6wImWst2ccGLfDHEswzi9I6
 9BNOlozzqFfMhLb4ZYPmAv50XEbb3VkRSMv5VxNWPga49A9MvSE6Kr8YtBknzD9uYCO6
 9k3UNkipPpIOg/r7JoMWbkdWH2B3X0DVyWyODex8K6D4eoRZ0kRSxdiDSMtO0gJc3t5R
 z6Ou28XyFRHgM/7YRlGWcfCBNWscs8kp8dUXVafScvI2Vp8TVbDeqaBGUevHLzZPGOdG
 oQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=dm+g0HdQXfywzgNjDtGSAtzan4mMlCIj85DWtPLYH5w=;
 b=Hy/32U18sWpoCw3RGmszrR9LNz+89t2Yg2W7cwInCqC2BOmsVNn5vmuxeSp2k+STb4
 hZYpjfCxukwfH8ED0PVRaeYE7haXx6XiZXi8rux6zAN56ZdFmmTtzUs/A7SSpRBdrd7b
 dTefJ/yBpvkOPqUgBEuPBk3QcOez6httQD+ey8D27Un5a8LsPJGuJN1t6uBWSVBlSoDn
 VMtn7wyB24EW/fId4JH6xetecRI1Tc62u8KZPOIyolkINqVw0+184SWNJJxpOCF97lGs
 /G4mc8uEeNaO9AfIy1cv9U5wPGhH1prDu5oNS4fSz2Tf0Y6YCQwxKt+IotPRQO9uMVnw
 0kMA==
X-Gm-Message-State: AOAM533E5Vu+o3xurOVC/skrTmQzwlIY7U86pueJPVnHYyFPIZlj8E85
 HEMnwFnkRIbvUDDiivDm7X4a9w==
X-Received: by 2002:a05:6a00:1943:b0:4cb:79c9:fa48 with SMTP id
 s3-20020a056a00194300b004cb79c9fa48mr31564726pfk.47.1647996097834; 
 Tue, 22 Mar 2022 17:41:37 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a62e211000000b004faa5233213sm7434334pfi.101.2022.03.22.17.41.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 17:41:37 -0700 (PDT)
Message-ID: <0e5f2c65-3b34-c162-5f30-b837e3e5876d@linaro.org>
Date: Tue, 22 Mar 2022 17:41:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/3] linux-user/arm: Implement __kernel_cmpxchg with host
 atomics
Content-Language: en-US
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20220314044305.138794-1-richard.henderson@linaro.org>
 <20220314044305.138794-3-richard.henderson@linaro.org>
 <b93a6c01-6153-b9c4-7a7f-db1daed88d9c@vivier.eu>
 <6089ef2d-49e3-04c1-1e0a-e108d7fbd3c3@vivier.eu>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <6089ef2d-49e3-04c1-1e0a-e108d7fbd3c3@vivier.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /cdSedQ+VYwP

On 3/22/22 13:08, Laurent Vivier wrote:
> I have removed this patch and the following one from the branch because it hangs when 
> executed in an armhf/bionic chroot the following example:
> 
> cat > /tmp/hello.go <<EOF
> package main
> 
> import "fmt"
> 
> func main() {
>          fmt.Println("Hello Google!")
> }
> EOF
> 
> go run /tmp/hello.go

I don't see a hang.  I see a SIGBUS, due to a silly typo here:


> +static void arm_kernel_cmpxchg32_helper(CPUARMState *env)
> +{
> +    uint32_t oldval, newval, val, addr, cpsr, *host_addr;
> +
> +    oldval = env->regs[0];
> +    newval = env->regs[1];
> +    addr = env->regs[2];
> +
> +    mmap_lock();
> +    host_addr = atomic_mmu_lookup(env, addr, 8); 

s/8/4/.


r~
