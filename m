Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp1644588lfg;
        Fri, 2 Apr 2021 11:45:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDZ1w3iQwH1T4re0WMr2In9RYYQZD5iUb2qYAIS4c6JcNUGwml1tpSK7JluO2aaLiJXkOq
X-Received: by 2002:a5d:88c1:: with SMTP id i1mr11787963iol.115.1617389149767;
        Fri, 02 Apr 2021 11:45:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617389149; cv=none;
        d=google.com; s=arc-20160816;
        b=nGJuytt6gjqlO+1cK5XTQyZ+lOVSLvLwahn46FgHS7m0ZVd09kGg3ZQWs5Me3SI4qm
         CiKo4aTpVjh5pIKvmDT2hl2PV7spR0S/18WBl+DNZNR7lV+W6XFLQFfg5f+foeNPpTkG
         iSBEA710TCHQDKViLvmA4wOZEJWXFb0legqpdc2fvOEhCCHa/MuIRXglPsMpVsMqaAVD
         UvJBpXJuUZLf7CChn37Jp8v9WNuDRswNgp2dT7s3nemZ4H5cnkXoepkGR9alZjV0lANB
         IVxDHIRTJPKEIRtVl96KgTJZEll4vkTMtdKpfxrTEwQyF4Xxnk3D5d94KSIycPFkCG45
         KHOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=gzqCIvOq8GrMORdKvB10npTgKYbTdzFUJvcQ1yK8B1E=;
        b=ZGCSqsafxiYmHGTA4olCaRcUxkbps6RG3K4S+lCKJ8V1/yAjCghDqdSMC9oMphgIUL
         Zbrj7h/aaY1EQqQuWbF0ktYX5XISHLyH1FQYhNBRz0nCkxDQmhN/1XZfX9mk76KfW5JT
         F8REKLs70e/m4VMWXim9RjEVjNs3je65Usuw0DCL8FP9F2IvgVw9TjzHp/0wp7Ldy+jz
         A9Qfe2WAT4RebUX5ZcYWaufCbTTu+8fgthpQkCVlOPPfabtRsvwrIaIm+aT4ejPP+pXv
         uKeoj6cIOQdcCqT8KEyiVO8n2Kxiusf7TyJsN5ahG9c9CrXPtkgqJaBtulC95/ECa+17
         z3sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K//U607X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h2si8482246iov.19.2021.04.02.11.45.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Apr 2021 11:45:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="K//U607X";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lSOnl-0003hO-2v
	for alex.bennee@linaro.org; Fri, 02 Apr 2021 14:45:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSOn4-0003gR-Vb
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 14:45:06 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:52927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lSOn0-0007xC-KA
 for qemu-arm@nongnu.org; Fri, 02 Apr 2021 14:45:06 -0400
Received: by mail-pj1-x1030.google.com with SMTP id ha17so3079016pjb.2
 for <qemu-arm@nongnu.org>; Fri, 02 Apr 2021 11:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gzqCIvOq8GrMORdKvB10npTgKYbTdzFUJvcQ1yK8B1E=;
 b=K//U607XYx7Esi6PknfYhmTYpqD4Qii4EQKvfayrTKLh2OhBRAnTs0gt0xqlOg+l/u
 B2H4Sa+t0mJIAp9o9mgt7V4hYeLzupeF1/y9F4wZQv0M3IgEPvp4HlU8YRPz321cWWc1
 kKT0HYYAxenf1FC6kkJWJrL17jmPNUXCjtsO2BGIqgSPW3p+vuxsYpmoME+diseEHpVh
 phOfeDy1mF256wIF4muL8zZmbpXD8JTXWd8soFrfPhkyyVzJCqGFlNH/0AO+lbWfDpo6
 SWjuNiaHW12gNDIzGf1SKKJ9jZCEAC9Jd6LMyS+3styR92wYF1yg64me5aWMAdaO1r5F
 /YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gzqCIvOq8GrMORdKvB10npTgKYbTdzFUJvcQ1yK8B1E=;
 b=ujQf3m6iipbuaGNwTgh0AVC7PCROjc5V8KtBGzdPukZpDvmjpoHRXTXxEff+R0PUAi
 YJ411gCeZmaFz5cSFlfUPDtEN6/UdsIOgHnoBTk2ePTxr14a2bsem0Hp+lW1VoMU/gVV
 y1xyBabInoAtalMRhn1Ohy2cNPSUyoR1baseYycYSsPgiHH2PzASvbVgDXDNL8wnUyq6
 I5IJwF3Xx1fMuYOLgDN86OuX5ROawxULM5K8seITz2xSdeeRtDVx1G4+oNQVk1IkiR8B
 XlEju3cH5sS1oqCTafkKE1Hl3wpnq+V3FO9Ix1Ixa9RFIEUfaa1drTDMIMfrbu9q13oU
 eXOA==
X-Gm-Message-State: AOAM533FbXbS9DcA8AzAY2KfUCm8mQXO8xHBq4vb0uLwLGcH955TO+Uk
 sbxA6PmcIxT6hSeidzv3aQczcyco7MDWdA==
X-Received: by 2002:a17:90a:1696:: with SMTP id
 o22mr14653000pja.0.1617389100819; 
 Fri, 02 Apr 2021 11:45:00 -0700 (PDT)
Received: from [192.168.51.152]
 (h216-228-167-147.bendor.dedicated.static.tds.net. [216.228.167.147])
 by smtp.gmail.com with ESMTPSA id s76sm8982779pfc.110.2021.04.02.11.44.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Apr 2021 11:45:00 -0700 (PDT)
Subject: Re: [PATCH 2/2] target/arm: Fix unaligned mte checks
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210402053728.265173-1-richard.henderson@linaro.org>
 <20210402053728.265173-3-richard.henderson@linaro.org>
 <CAFEAcA-jky04K9d3WFxj+JU31mP_NS+yrEDXzXaffYC7CRTFLQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <09b35fc8-89c3-0440-40ea-6f58561b1dce@linaro.org>
Date: Fri, 2 Apr 2021 11:44:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-jky04K9d3WFxj+JU31mP_NS+yrEDXzXaffYC7CRTFLQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jajb8yQMyKHF

On 4/2/21 11:35 AM, Peter Maydell wrote:
> On Fri, 2 Apr 2021 at 06:42, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> We were incorrectly assuming that only the first byte of an MTE access
>> is checked against the tags.  But per the ARM, unaligned accesses are
>> pre-decomposed into single-byte accesses.  So by the time we reach the
>> actual MTE check in the ARM pseudocode, all accesses are aligned.
>>
>> Therefore, drop mte_check1, since we cannot know a priori that an
>> access is aligned.  Rename mte_checkN to mte_check, which now handles
>> all accesses.  Rename mte_probe1 to mte_probe, and use a common helper.
>>
>> Drop the computation of the faulting nth element, since all accesses
>> can be considered to devolve to bytes, and simply compute the faulting
>> address.
>>
>> Buglink: https://bugs.launchpad.net/bugs/1921948
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> 
> This is a pretty chunky patch for this point in the release cycle.
> I don't suppose there's a way to make it more digestible for review?

Hmm.  I guess I could split it into more pieces...

I had thought one of the intermediary steps was larger than the result, simply 
because one of the interfaces was adjusted instead of simply being removed.

I'll see what I can come up with.


r~
