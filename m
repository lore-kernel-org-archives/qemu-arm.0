Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp4137689lfb;
        Tue, 19 May 2020 08:26:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn6nfsG53hcQjLmxIdzJWpbUP/txV1DPM8rFIJ/q6pu9nwTmITkwMUjyKl9344mofaTYcd
X-Received: by 2002:a37:a2d1:: with SMTP id l200mr21255363qke.236.1589901969516;
        Tue, 19 May 2020 08:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589901969; cv=none;
        d=google.com; s=arc-20160816;
        b=ouKLp/11ULJU7qrAiwquXeF/mOWoAFC+jJs38zevYTshpsS+xwFXFdOBVs7BYc/SoJ
         vHu7BrFxaItRWEthUh0/3f3XT+nIy6dh3c8nVkwKL+8H/gzZNYBa27+cMohCJRjourMu
         VfqyL05O2eBJyadLfMd775IlqHBhEPmcXemAsMoyFtTZVpiLkGWLJD7hcpG0ERxOInqs
         qb5Zyr1eNjsv84ZsSvF4255xfyuitWNLB+FUZ8nMLU6hj9T+ljSk48sFT44FhU0K3j0P
         Ps9t8NNTiaqa8bZA34Y0NL9Jw8IpFzVA4tkpetTpeFNwKd2SB0aHWC6lzPRuIvFu49sh
         obPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=8WpkpWs8V86Gc8gc77N2XQWTpffdKfWcfxHGbhsMmCc=;
        b=BtAdY0C8imIRY+pwcUS1T7U/TN1lnx7qz4Z2vsqrFq9He/wPeSGFpoSv+adLRNI9Zx
         dZLXfvRgIakH5TzqFxsQ9xdOTTbjUjikZlhu1SPvxdUyCzalA+t+BE3rYm55pTPo2mFr
         wp2n0N2EoKolBTvxOyn/y9+NAP8NB4PP72Dn80I9lRKRkI7tPTpkxh4EldwLgF0OWiOI
         lrA8pC8NOdG6QrYc/bEm4go1SkGEDZW2T/wm3ce1y6zVYBKLDZUs43HaDd/cMOvDSvDH
         aQZ/Moa/5oIVEbT697XMe30yqq/57tDSCGCzilJWrlDRHGclDVVvmP61PXq1XvMnt0OM
         xXUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mMRxRrAE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v123si68322qkb.151.2020.05.19.08.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 May 2020 08:26:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mMRxRrAE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jb488-000387-Tm
	for alex.bennee@linaro.org; Tue, 19 May 2020 11:26:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb3kI-0004j4-Aw
 for qemu-arm@nongnu.org; Tue, 19 May 2020 11:01:30 -0400
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:33809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jb3kG-0004Ps-Gr
 for qemu-arm@nongnu.org; Tue, 19 May 2020 11:01:29 -0400
Received: by mail-pl1-x644.google.com with SMTP id d3so1027015pln.1
 for <qemu-arm@nongnu.org>; Tue, 19 May 2020 08:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8WpkpWs8V86Gc8gc77N2XQWTpffdKfWcfxHGbhsMmCc=;
 b=mMRxRrAE4XvnMSqwO2ocdQ1cwhs50eUlpW7oVyzheg9zfDPBBzrIz0xRm5eNNOKkS3
 VledJpczhTgTWGMjo2VMMwC7uoZRgZyDI95WnY+UklkXcPCNM7R7vuNwnVtf7oEeNXqQ
 VaQi/Q71v5qpj48RYWQanQOVwNpjSHBJpsYxdlX5ONy3VqokDx48oePEYfmclBNGNg1f
 vZuyxQ9SJg2SCnP6dCO2Qia18eR47m98EgFQhMY9htjoeglDLUeyR1H4rScs1VUsY3pk
 nIeQd4eSHUatm6R45lJpmYpGjwlaX0IxugTM5aVgNkJPNsqcgTc2y3AJVsiSFuKT+7dF
 ooHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8WpkpWs8V86Gc8gc77N2XQWTpffdKfWcfxHGbhsMmCc=;
 b=Fz8Y0q7+UnEjZAo3yXCbMKKHgPevKiiRQbthfQz8zuT11kPWjcSf887GMvU3K/BX1l
 +uzbKWSbpsHNc7RDlCtyAQz93ZD/6qGZ4+YJ9vT6ZmQ3kFiAqi2XTd089afIJsiGv5d0
 lBuEK9+3uy+hChSk7CabwU+4X3vYqCgLebwa8CfN06iD9jdZJ3UCUeuQ9iRhbHRVR2bc
 WBSFPiMVXrK6f0N5F4zWr3fixaxmPI1V54nQCr364FhKPAMTHH8YBb2v5ZCd3fU7ySPp
 Fu4+4Xa1Bg51r66o8HBmusNQS5bDZRMySz4grzZJBCXnX6z0HkfH29KsrhiKH+cmZh8M
 shWw==
X-Gm-Message-State: AOAM532wPZzNYLv0RBTD4T9I7lgnv9UxdcqAi/tJiHGpg+aac/P8AtqN
 hJrJNcolKXgPCtW3o9842deITA==
X-Received: by 2002:a17:90a:d598:: with SMTP id
 v24mr5095316pju.167.1589900485507; 
 Tue, 19 May 2020 08:01:25 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id b29sm108691pff.176.2020.05.19.08.01.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 May 2020 08:01:23 -0700 (PDT)
Subject: Re: [PATCH v2] target/arm: Allow user-mode code to write CPSR.E via
 MSR
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200518142801.20503-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd4cbf09-8f6d-8034-661b-ffa4195e56d7@linaro.org>
Date: Tue, 19 May 2020 08:01:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200518142801.20503-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Amanieu d'Antras <amanieu@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EBu1fKUIDiVi

On 5/18/20 7:28 AM, Peter Maydell wrote:
> Using the MSR instruction to write to CPSR.E is deprecated, but it is
> required to work from any mode including unprivileged code.  We were
> incorrectly forbidding usermode code from writing it because
> CPSR_USER did not include the CPSR_E bit.
> 
> We use CPSR_USER in only three places:
>  * as the mask of what to allow userspace MSR to write to CPSR
>  * when deciding what bits a linux-user signal-return should be
>    able to write from the sigcontext structure
>  * in target_user_copy_regs() when we set up the initial
>    registers for the linux-user process
> 
> In the first two cases not being able to update CPSR.E is a bug, and
> in the third case it doesn't matter because CPSR.E is always 0 there.
> So we can fix both bugs by adding CPSR_E to CPSR_USER.
> 
> Because the cpsr_write() in restore_sigcontext() is now changing
> a CPSR bit which is cached in hflags, we need to add an
> arm_rebuild_hflags() call there; the callsite in
> target_user_copy_regs() was already rebuilding hflags for other
> reasons.
> 
> (The recommended way to change CPSR.E is to use the 'SETEND'
> instruction, which we do correctly allow from usermode code.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v2 changes:
>  * fixed wrong variable name in commit message
>  * added arm_rebuild_hflags() call in restore_sigcontext()
> ---
>  target/arm/cpu.h        | 2 +-
>  linux-user/arm/signal.c | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
