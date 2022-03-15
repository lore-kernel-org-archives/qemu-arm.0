Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp3181625lfo;
        Tue, 15 Mar 2022 14:41:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBJArGgNWsY62mje1cBU8ShJjU2U6I/+teXCroco0cvi/tvDX0VXr3ER71Ktf38wbKgj3d
X-Received: by 2002:a0d:cbd5:0:b0:2e5:89fa:918 with SMTP id n204-20020a0dcbd5000000b002e589fa0918mr5543909ywd.38.1647380465456;
        Tue, 15 Mar 2022 14:41:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647380465; cv=none;
        d=google.com; s=arc-20160816;
        b=Sk8LrM6wle887pdMGMx3iVvQuQwawH5Q+r1iOp5ayWN8nsaNQRBtYkMC2g98fRBjhy
         UR9OWoz688MgM7GzagThwce5eNn8oVGynn7hCJKkQkV9DnukqeGa3Ugo/iV0uKk4ReD2
         YjBVfYz+Q0BOJUIkYkmTHQGJfXl5hUODcs+ERdcgux3GAamtKp1aeC0TzXvcA3RIHX1G
         cwLv2Wz2kII+JBxIX8vD15i7Qs+bnlgKpxxVtno1hE/UpKqse9zMFWsxWVkrR1VViYED
         1KdhxywNv2lgqz1/LBNzqa78+0Sn7e8UBPlhYr620q1aYisW/TmNtCwiPoF0kh6xEgBo
         dOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=hjXGVo064wjC8rfuvzgfaCnjYZ+5mWz2t70gVDLXNMQ=;
        b=PfE7o6NZMYe2j+lG/FPcuatlA0IZdRm1SnMXD98AM17dOcM2twWc2S33998cRBcXnq
         +w6OvOaUYCJeE09lb/QkU9IyeWA8hTCkew8/dMbFuZ/zxSgbU/fS9xEbFZsOZjShivGz
         3oY3e0bUmRjb9U/FLPMIjVRqOn1X2+vY/KJl/mVNDPMOCCWDv7VMXr8ZVuC3oG5IwLvt
         l/00XqXGoE868yuL+HQTSUYqyrjbuvs7covdsD/YYZuytc3oaQmr7tEmTJoSCqEIjvpx
         ykT+yd0dL32DZ18ldl58XH5VPNh3RohJUqT/PVXD6LE9VIXIGjubO8g8JEIaDd6e8Jm8
         yQog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWQX0gu2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b8-20020a5b0788000000b006157cf8126asi356464ybq.186.2022.03.15.14.41.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Mar 2022 14:41:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oWQX0gu2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nUEue-0005Jc-Cv
	for alex.bennee@linaro.org; Tue, 15 Mar 2022 17:41:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUEu6-0005JU-EW
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 17:40:30 -0400
Received: from [2607:f8b0:4864:20::1032] (port=51767
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUEu3-0000h7-Kp
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 17:40:30 -0400
Received: by mail-pj1-x1032.google.com with SMTP id gb19so598720pjb.1
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 14:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=hjXGVo064wjC8rfuvzgfaCnjYZ+5mWz2t70gVDLXNMQ=;
 b=oWQX0gu2PiUWxMdgOx+y8q6EGVr1Q1BcOUss3gT61W2FQFtLTtGFudF5s2p1vNREse
 8AAAzgJHDHXJTL2NCKSr+5mQJe9WG0hmUCF0GQHum9lwkCuCVwkvdvaXhQwTEsNhqWTm
 cZdKbukcajgs04sTF3Nlyl8V38iL6T4QlokanFbOvJGMhyOiqQYWyrMoVGCcRzPWC4DO
 0mqWnJ7Q0KSycXDpjfT50Kw84gM/tN3VWoPHt9nPGScBS9O5QvDrHV+kqED8oWAp3Uko
 XR+N3qu9Hwy6xE4+Nmk2+zMuQmAbnAB9rGZqgz/41+BQEmLn/xXmBobPj0VpAj6Ld0f1
 tvEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hjXGVo064wjC8rfuvzgfaCnjYZ+5mWz2t70gVDLXNMQ=;
 b=r/scshZqXRkI4YtFVWjDE16kYJvMbkMRKxpZ/hR3mvRio579TsXWkOH1eNcRLWVyaU
 TvSHS6xQZejEFo9Nes8GPxC63t8uaPo4a/WYzd33T2aIAEgfSIcNP1W+ERdBHSKOB+O0
 jLU56VPbGl2dqmoFpX105Q2k684NPeTqDvy0b6DVrNHKTIdqq0m0AxfiMpZ0QyhEXns1
 atO1FPdjWjEjQQIxbOb3wXYPhfaxLuIQUVz9uMr4btXPGTqx2gfWjVA1CRkkiEnTnw6P
 WelqURFH1wWy1VgyoxvnvcNEnon1fMI8v5dIBQbGc34z3E2fzTF0JKBHMsIkbcgY3SLi
 92fQ==
X-Gm-Message-State: AOAM531cSBibRN/n8mFGHs0WOGwfnrmvA3JZCrlfsj387ODVaXmJLExA
 niSsetBpCtUq5cNTW4x2K+djtw==
X-Received: by 2002:a17:90a:3e42:b0:1bf:53ce:f1ef with SMTP id
 t2-20020a17090a3e4200b001bf53cef1efmr6794382pjm.33.1647380425790; 
 Tue, 15 Mar 2022 14:40:25 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a637a07000000b0037c9268a310sm199135pgc.3.2022.03.15.14.40.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Mar 2022 14:40:25 -0700 (PDT)
Message-ID: <d9d9f8ba-6a8c-972a-ae46-1302ae3d13cb@linaro.org>
Date: Tue, 15 Mar 2022 14:40:23 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] target/arm: Log M-profile vector table accesses
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220315204306.2797684-1-peter.maydell@linaro.org>
 <20220315204306.2797684-2-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220315204306.2797684-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /nw6PCgq6fCs

On 3/15/22 13:43, Peter Maydell wrote:
> Currently the CPU_LOG_INT logging misses some useful information
> about loads from the vector table.  Add logging where we load vector
> table entries.  This is particularly helpful for cases where the user
> has accidentally not put a vector table in their image at all, which
> can result in confusing guest crashes at startup.
> 
> Here's an example of the new logging for a case where
> the vector table contains garbage:
> 
> Loaded reset SP 0x0 PC 0x0 from vector table
> Loaded reset SP 0xd008f8df PC 0xf000bf00 from vector table
> Taking exception 3 [Prefetch Abort] on CPU 0
> ...with CFSR.IACCVIOL
> ...BusFault with BFSR.STKERR
> ...taking pending nonsecure exception 3
> ...loading from element 3 of non-secure vector table at 0xc
> ...loaded new PC 0x20000558
> ----------------
> IN:
> 0x20000558:  08000079  stmdaeq  r0, {r0, r3, r4, r5, r6}
> 
> (The double reset logging is the result of our long-standing
> "CPUs all get reset twice" weirdness; it looks a bit ugly
> but it'll go away if we ever fix that :-))
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpu.c      | 5 +++++
>   target/arm/m_helper.c | 5 +++++
>   2 files changed, 10 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
