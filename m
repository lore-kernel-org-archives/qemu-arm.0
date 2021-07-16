Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1463807lfc;
        Fri, 16 Jul 2021 09:45:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7c2JXstG0L4GbPS7DOqPPYrUxL4Au54fjPjFiQfyAl1W5G1AHFvhhSpbazdWoR6y2+nJv
X-Received: by 2002:a05:600c:1d23:: with SMTP id l35mr18044991wms.134.1626453948358;
        Fri, 16 Jul 2021 09:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626453948; cv=none;
        d=google.com; s=arc-20160816;
        b=RrQa1izAynWdNJ0u9JiHK/HjXrMYvb2fo10sPlJxv50FnZOpOQ0dHxTeo6DR33IRZT
         R1Yw2wCV4TM9J8CC86KJCuFzZAVM1M/digX7faQdiLsqGew+0wh3d63OTHaohOnvJT1q
         Z0temBTEWR9cYNQtRyTgU8jPriT3o36A4RIlylST+k1l+BWyyx0aAQA3icT/XypK6OMb
         9tjoBciwqhjrvkB7iNtn/hph1Egi8nNeD5/gCnkneWyS/j4yFvQ4KyW5XS+vjbBgLdh8
         OMBaMLdC7F3mFMlVObg+zpL6BsnCltbkE1Uh8aJuonefRtnHnUba2NVcFDRNJZAjPjLy
         HAiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=RcV4rLuNkbviju7dg+ADGg3WyxdJ+JoU/srtBet1GI8=;
        b=LP+Lb1jitDpLTOWXxYFS6Gj3sHuACh71tyM5c3OO00mlnFwZX3cpgiqtBFz1sAH/ee
         dpBtewSbg5KFHvEQEltI8xGt6X197pwYee7KvvaHmlIgBWmRwb4rEMReQADK7AA3fB5f
         vsoBrrKj+8mlYpC3uaGqVCusSqSSpGlmC0gLcU2RL9UFx3VQt2thCHeDWLjKhuRj3QZl
         6jds0n0fglmnqKvf7FtP69LuoKkD+YjcKRmbsgh2AtSw7VUj8S2zKU2gF7fKG97ZLkIY
         O47L1cCDRaLV+OQJPPEK6SMFusPNxl+dzYJPW03yPKU9LThv9/hi72DVL9BwByNyliKT
         6i4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0eH0+yi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si12048556wmh.44.2021.07.16.09.45.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Jul 2021 09:45:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U0eH0+yi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m4QyB-00062e-Fe
	for alex.bennee@linaro.org; Fri, 16 Jul 2021 12:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qwz-0004d0-DA
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:44:33 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:40824)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4Qwy-0006SU-0B
 for qemu-arm@nongnu.org; Fri, 16 Jul 2021 12:44:33 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 g4-20020a17090ace84b029017554809f35so9085553pju.5
 for <qemu-arm@nongnu.org>; Fri, 16 Jul 2021 09:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=RcV4rLuNkbviju7dg+ADGg3WyxdJ+JoU/srtBet1GI8=;
 b=U0eH0+yioLtK66J4lumaZ5Qhrq4lQT+BWFxzCU5K+kiyDTk9Q5l5c6cPKgLGfmGcu6
 gFDjUAk9i4RxrW/nqxB93mwp8hODVK9+POoWjAx+J6jHZW5OsWiXHF42aqz2+T8BdTc+
 o0XSIiofDSNY7G+Jsg28/0gh74Kykd5pnYibF5fvCHOiZ1ejcjfJqZWag7ym1XD051dZ
 WWD+6kaLeoQZQVEUAzyDPizxEKR8nhiYbYIBRsINMWBN24cEWXVwOSR1j5Fkyehe2nd9
 GW7QaDV7di5a57QfvyV4Or+uPo3XPyqEOx26e0L4QaDftjGUxyvaOZFGTnJGLQumBnn2
 iSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RcV4rLuNkbviju7dg+ADGg3WyxdJ+JoU/srtBet1GI8=;
 b=BN3vG8cSiz/h5VVm0A9HmYg4GpzklsWFB4loXrnnm1Elun/rmPNy88oN71bUq8M18W
 dWmMx5qwZdzw2L6PkNNtER61dFr86kNsJrvxwJnHxNE9jJB7WFAZPNZ/nZX0DfofXSxJ
 lyPPgx4A7SoRyYsMpD3P4IZxL9J11oakh1BnUc8eSvt9Xb2X65lY/EmUtJAKJWjs70Nx
 9bKX+WMaDNmqIKUT8bjIe6ECYCzr/wYdnwife42WkC+uWOsfkg8JLln8YE1SL9F2rIMM
 R6mk5fMuDDzP/PT6uLdgw9TiCIztMdtk0VX67zU+h9LrN+Nyd/re9wQgxutSW1NYRe6i
 P1bw==
X-Gm-Message-State: AOAM533gCwR5BKnhr204JcNIJlxeiO8w3Z28ZnHuS8nrrcUxLB4taWeq
 650ljFC9iHoPnBfp7B51Rr1byg==
X-Received: by 2002:a17:90a:88f:: with SMTP id
 v15mr15753540pjc.150.1626453870651; 
 Fri, 16 Jul 2021 09:44:30 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id z6sm12203969pjn.12.2021.07.16.09.44.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 09:44:30 -0700 (PDT)
Subject: Re: [PATCH for-6.2 08/34] target/arm: Fix VPT advance when ECI is
 non-zero
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210713133726.26842-1-peter.maydell@linaro.org>
 <20210713133726.26842-9-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <02981d66-72d6-c233-1a51-94743ac29fa1@linaro.org>
Date: Fri, 16 Jul 2021 09:44:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210713133726.26842-9-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
X-TUID: lJC3T7wWWOHz

On 7/13/21 6:37 AM, Peter Maydell wrote:
> We were not paying attention to the ECI state when advancing the VPT
> state.  Architecturally, VPT state advance happens for every beat
> (see the pseudocode VPTAdvance()), so on every beat the 4 bits of
> VPR.P0 corresponding to the current beat are inverted if required,
> and at the end of beats 1 and 3 the VPR MASK fields are updated.
> This means that if the ECI state says we should not be executing all
> 4 beats then we need to skip some of the updating of the VPR that we
> currently do in mve_advance_vpt().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/mve_helper.c | 29 +++++++++++++++++++++++------
>   1 file changed, 23 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
