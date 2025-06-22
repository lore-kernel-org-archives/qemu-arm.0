Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp1916803dyb;
        Sun, 22 Jun 2025 01:57:27 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU9qqSoqlspPJokEo9s8MJP1IFExi0xf3vxB181PgSP5jjulAB2o6iLysoDokZGbN1bsNFE/+Z9GJqWvg==@linaro.org
X-Google-Smtp-Source: AGHT+IEbdt6za9uEifXeXtjUfLbZjcUYbEzOl5sASdJn26MRVyZky+npo6u3L7O8c2woZiPUalOo
X-Received: by 2002:a05:6214:3c9f:b0:6f8:ae25:b717 with SMTP id 6a1803df08f44-6fd0a572e66mr136588606d6.34.1750582647593;
        Sun, 22 Jun 2025 01:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750582647; cv=none;
        d=google.com; s=arc-20240605;
        b=AnWalSQt8oNrOI6ERbSR2knt3BohmaA60bpqKYOkYACymCvSQ7+8pchc3+9NglGclU
         cZrOXSernixmob/Ts5S/1cLVIFDlhGtDjqiuk141W2KRkcQzpAN3fc16JTtXI67LA5Zu
         V8gLzckaI2V/byfgGmn6GvjCqsPGMZICcWN27uQsIUvlv1OJBhJj1ikLHPMFslzewq6g
         /P20dKCZ0mWZm6G1DnpBOPDYLh0cj7aYoz5Hna2cE2X2SzVE2bTBD1ZhpZUpmpeLVd9B
         L9OSOkKQNji4Tnri1qmdw2Aa8GINqeQdJh6RD9tPlUwZslJeImSQgUND6FesCqIM9Skw
         bwlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :mime-version:date:dkim-signature:message-id;
        bh=I5+wsnavqjrNt65TA2neNKeG2mkyqrA9F4stbFQXeNQ=;
        fh=gVUeIve6vpVB8wQo2LTV7udIiz34kFojxeEWmQLFOzY=;
        b=k+v2zdcyr/luuYIthPqlgwceKs5Dw1nBfu3ohEUOPSaQg2MJ4b5Fy4+JN+HIE0v/sT
         cBAMpqDyN9t1UZ3UuPIQUBr2YaJO3i1Oq9GiUF1DfiKXG5PI0adl+aNnLutGbR86yed4
         42bKRgLCQD9XIp3+UKzGEV4dD2/wEjT5s8ZzVmAJ7/iYAZRwDkZ3FTOTNaXA72ibAWid
         Ev103gOntKdeDE0nOsU3x6hnhRIiVSrgMolz75psXV9ACFlrHoaPhkp5RpsVk0grUPqq
         v7JjGGwwfe6Q3C0+IQlQwxl5YcM4Je0fffF4O647CujkSfX1ZfeMjSgK7kZNtFp+mkD5
         sTzA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=ppO4HumK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d3f99a9354si579016285a.133.2025.06.22.01.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 22 Jun 2025 01:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=ppO4HumK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uTGVM-0005wA-Dk; Sun, 22 Jun 2025 04:56:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1uTGVL-0005w1-BH
 for qemu-arm@nongnu.org; Sun, 22 Jun 2025 04:56:47 -0400
Received: from out-176.mta1.migadu.com ([95.215.58.176])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zenghui.yu@linux.dev>)
 id 1uTGVJ-0007pF-Ji
 for qemu-arm@nongnu.org; Sun, 22 Jun 2025 04:56:47 -0400
Message-ID: <816aeea6-34c3-461c-b596-f8701a9d1557@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1750582594;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I5+wsnavqjrNt65TA2neNKeG2mkyqrA9F4stbFQXeNQ=;
 b=ppO4HumKtmF+/3pfesOhkTQhbwGUzUx5gXbHFKbXMXbHkiz8goZwK0YkYfTLw49jCNheaN
 HWErfSsDYuADtvoNzfpea50bWaXF3gTbnCmPCaKuRq7uFUtVskbGXi/8Rm0AlDnvKOQUIN
 E2G/2VHLPIWkLNGD+KXv0MmbWAanUqo=
Date: Sun, 22 Jun 2025 16:56:27 +0800
MIME-Version: 1.0
Subject: Re: [PATCH] hvf: arm: Emulate ICC_RPR_EL1 accesses properly
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Zenghui Yu <zenghui.yu@linux.dev>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, agraf@csgraf.de
References: <20250315132030.95209-1-zenghui.yu@linux.dev>
 <CAFEAcA9YUmXA=bA4FERwqSEP86RFUhUKUcLvVVSV64p_QJKnbA@mail.gmail.com>
 <d9c8d200-4453-48d7-b14a-8e15a7cf6602@linux.dev>
Content-Language: en-US
In-Reply-To: <d9c8d200-4453-48d7-b14a-8e15a7cf6602@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=95.215.58.176; envelope-from=zenghui.yu@linux.dev;
 helo=out-176.mta1.migadu.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: xO8pVmFuPsl2

Hi Peter,

Sorry for the long delay..

On 2025/3/21 00:55, Zenghui Yu wrote:
> On 2025/3/19 00:56, Peter Maydell wrote:
> >
> > ICC_RPR_EL1 is a read-only register.
> 
> Yup! Writes to it should result in an UNDEFINED exception. I completely
> missed that point..
> 
> > But hvf_sysreg_read_cp()
> > and hvf_sysreg_write_cp() do not check the .access field of the
> > ARMCPRegInfo to ensure that they forbid writes to registers that
> > are marked with a .access field that says they're read-only
> > (and ditto reads to write-only registers). So either we should
> > not list ICC_RPR_EL1 in this list in hvf_sysreg_write(), or
> > else we should add the .access checks to hvf_sysreg_read_cp()
> > and hvf_sysreg_write_cp().
> >
> > I would favour the second of those two options, because it's
> > more robust and means we only need to care about the access
> > permissions of a register in one place. Plus we already get
> > this wrong for some registers: for instance ICC_SGI1R_EL1
> > is write-only but we will permit the guest to read it.
> >
> > So I suggest a 2-patch series:
> >  * patch 1: add the checks on .access to hvf_sysreg_read_cp()
> >    and hvf_sysreg_write_cp(): they need to call
> >    cp_access_ok() to check this
> 
> Thanks for your detailed suggestion Peter! I come up with something like
> 
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 650b7f4256..a7ca7975e0 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1264,6 +1264,9 @@ static bool hvf_sysreg_read_cp(CPUState *cpu, uint32_t reg, uint64_t *val)
> 
>      ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
>      if (ri) {
> +        if (!cp_access_ok(arm_current_el(env), ri, true)) {

I wonder if arm_current_el() can be used at it to determine the current
exception EL.

|static inline int arm_current_el(CPUARMState *env)
|{
|    // ...
|
|    if (is_a64(env)) {
|        return extract32(env->pstate, 2, 2);
|    }

I failed to find where env->pstate gets updated on vcpu exit. Please fix
me up if I've missed any obvious points.

> +            return false;
> +        }
>          if (ri->accessfn) {
>              if (ri->accessfn(env, ri, true) != CP_ACCESS_OK) {
>                  return false;
> @@ -1545,6 +1548,9 @@ static bool hvf_sysreg_write_cp(CPUState *cpu, uint32_t reg, uint64_t val)
>      ri = get_arm_cp_reginfo(arm_cpu->cp_regs, hvf_reg2cp_reg(reg));
> 
>      if (ri) {
> +        if (!cp_access_ok(arm_current_el(env), ri, false)) {
> +            return false;
> +        }
>          if (ri->accessfn) {
>              if (ri->accessfn(env, ri, false) != CP_ACCESS_OK) {
>                  return false;

Thanks,
Zenghui
