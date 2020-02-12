Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6260271lfp;
        Wed, 12 Feb 2020 03:32:31 -0800 (PST)
X-Google-Smtp-Source: APXvYqxEShSuIETPErdQHQq0+EUvCUuLV7BFW8Nw36TCvLU2nqN1VdXt31SYP3NA9fmwkqrvcmS0
X-Received: by 2002:ac8:4b7c:: with SMTP id g28mr18827444qts.180.1581507151189;
        Wed, 12 Feb 2020 03:32:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581507151; cv=none;
        d=google.com; s=arc-20160816;
        b=BIrGm4+/wtm2iFMOgzxJ6rZdRaGJi0onmpyk43iH8QAQpTYfVICiq7eXHJjPN1Ezuo
         vs9wTzvNMENTa7mMTpNIu1RQ0udHazTXtm0JSqPR2aQnjC3O/hVLRFzOtLGCxk8hf6ZY
         gn3Pk3czHBMIlKyB+krbIjmfq0mMphQzzqTLDQdyUDL4m5Mp1NEOsKmDbpBSph3SypoR
         46t46XXuf6TbEyBG4zBklenlRpsBHEouC9A+4MIqcSYxNRTue8ozNnbivlyaCHBtGVF1
         icvwLKASJS/hfqyeNmYtjpbWAAfkjHKrnHjVLkf5Xkpt8ReHT/YvkmOBsF2AP9385aFJ
         1/TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=80zw9xdMPv9hJqgXoS8wWF3chba21JG7tFTCZZ/Txps=;
        b=MDxQjxP/GZd5hY3y/OAyHbl0Vm/fVoducS99vX8eVYota6L6RkXX/3jOwh+rSGb1ji
         MC8n6oVfZM4O27iHFreocWK0705ruYx21EoejhoEbJZx6JVAMm7akpkmrKQ4oe/bL8t3
         YICJPbQl1qIDvBPugxTNI03RVmkdilAkCpl8+im+Az12Pc+9DqKgBE+30PDJXgooO8YH
         FGjxsDx0MK6mCbtUTRGsyx8+9+ZzrwTZgRwB0l94OAtMDrwvV/hGIzFRXHmr+Vx6bH03
         wIzGsRQQ1CuRwRnfu9wXMuJOhC9H7qlgj8PcXpW0eWrcx07FTCtla7qrzjXLn8eeyBVq
         GzWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YtwIrci4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v15si16793qkv.16.2020.02.12.03.32.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 03:32:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YtwIrci4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1qFq-0001le-L2
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 06:32:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46590)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j1qFg-0001lN-8b
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 06:32:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j1qFf-0000TZ-5Q
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 06:32:20 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38322)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j1qFe-0000RV-Sy
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 06:32:19 -0500
Received: by mail-oi1-x243.google.com with SMTP id l9so1687758oii.5
 for <qemu-arm@nongnu.org>; Wed, 12 Feb 2020 03:32:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=80zw9xdMPv9hJqgXoS8wWF3chba21JG7tFTCZZ/Txps=;
 b=YtwIrci42SNkejdNjYyIDd+f3rho0WhmwsrHGjifiSRIXjQrU67J7pq63Xb4WtOFib
 +ofqEpwmTh2g0g2YgAe9KvaL4CDaaPgCHhyPZa8ZL2aiQyH2bgBEvk8OtFcoz0f2WVFp
 mpQyBzVCYvtMm6VqvYVMSbaS93qMccpZO21MBBQZ6kzowtyuG4EH4QLDlh024s7jE0Sl
 Q2fJLMsKjRSn6G818oSvs3PlG7L9TxKGACkBWZzdKOkQLJTH0bHBDZnjhwP7RScIRv+0
 UoTieBuV4s3FWsszkqW5bxNGU1aFKQLxhn5IUl4Z1ashVmE9mMUGc2SeAGrIQpZTE/2B
 5OXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=80zw9xdMPv9hJqgXoS8wWF3chba21JG7tFTCZZ/Txps=;
 b=NczA3bnQce3XKc/wBZJ8nfSFngldY3EmUn2ATy0KMhih7LcwyEcPGLmYnfaTcRWL+6
 VkSZvw8gODkVrM/bqrfiVYqGNvB95/5APjO+q+QY6s7nkjo61UsxEbtbpRudLqMCse70
 vA/obwOk3oXXZsWjjobkRYUQfxx9DSJ4vC1T9Vlh+X/Mn9Bwl1jYlIyZ2l6vIMNZsjL6
 smjTDZOb8HwlIVsQNUydBWe7sqgZUiCN2G6peC8MBMdILrXQdAnLGG+cfqWa+SOxlWQH
 M/Hw9GUk4GXM/rEoxhsVIzcdcONxZSZc/X2NRVtd39zrF1A8mFtdVAnvLLEIOrIisEbX
 DdBQ==
X-Gm-Message-State: APjAAAWxcSAhrKN2va1NjC8H5HkNK77gtCQN7jZng+CrOK5dO4jxLTaT
 kq8NcJp22TOwfjIr9InYbDmAZizdS/H1g2pduoogDg==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr5713362oic.48.1581507137915; 
 Wed, 12 Feb 2020 03:32:17 -0800 (PST)
MIME-Version: 1.0
References: <20200211173726.22541-1-peter.maydell@linaro.org>
 <20200211173726.22541-3-peter.maydell@linaro.org>
 <a29a217b-f602-8925-4265-9a78030b6d73@redhat.com>
In-Reply-To: <a29a217b-f602-8925-4265-9a78030b6d73@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Feb 2020 11:32:06 +0000
Message-ID: <CAFEAcA-0_=T4paML4SN6uBYXnE-5-dpExrcdWUhyxVz7_C4yYg@mail.gmail.com>
Subject: Re: [PATCH 02/13] target/arm: Add isar_feature_any_fp16 and document
 naming/usage conventions
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Eric Auger <eric.auger@redhat.com>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VFPdBLFLtPkc

On Wed, 12 Feb 2020 at 06:24, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 2/11/20 6:37 PM, Peter Maydell wrote:
> > @@ -185,7 +185,7 @@ uint32_t vfp_get_fpscr(CPUARMState *env)
> >   void HELPER(vfp_set_fpscr)(CPUARMState *env, uint32_t val)
> >   {
> >       /* When ARMv8.2-FP16 is not supported, FZ16 is RES0.  */
> > -    if (!cpu_isar_feature(aa64_fp16, env_archcpu(env))) {
> > +    if (!cpu_isar_feature(any_fp16, env_archcpu(env))) {
>
> So we had a potential bug on aa32?

No, because right now we don't support AA32 FP16 yet (so
the aa32_fp16_arith check is temporarily testing an AA64
ID reg, as noted in a TODO comment in that function), and
anyway all our CPUs which have ARMv8 features also mandatorily
have AArch64 currently. This is mainly tidyup so we are in
a position to add a new v8-32-bit-only CPU if we want to.

thanks
--- PMM
