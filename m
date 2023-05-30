Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2201505ejb;
        Tue, 30 May 2023 07:07:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5e8Xiuinx6+lcP/1C64uo0dXz3VJsTR8bA++ZooNeWR4DpH1H6c+YnjP/UxnsRbs7J5HMQ
X-Received: by 2002:a05:622a:449:b0:3f6:be32:63e8 with SMTP id o9-20020a05622a044900b003f6be3263e8mr1691657qtx.55.1685455623400;
        Tue, 30 May 2023 07:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685455623; cv=none;
        d=google.com; s=arc-20160816;
        b=X1D/K41mAXNuR/89FgPPtnk5i2VtiQTrWUA1z2A7yC3uz3I3gpIzFLgjccsT2vriBl
         gesbOtIJij8WW53iKwghMh4cZZINSF5S3oXKbjLQ1fGsqw98ZSP/tVv/x+ZhZVUghtwJ
         lSXyUa+Vq191uItazU3UoPVpz0aPmMPfdZk/d1EJzPGm6aQmyScnQoANyHgZqbMSz3EZ
         Xhq50aCv2tZE7Vu6o8HTnypbxeHfDGMGSFcz9+2Z6cZLupd3W5S+VOS8OOy4kfHIttr3
         0oDlbHNI3dydYovLqV52NtYIfQJUomZkmb8Hv0uiOybNMYbRZcLBofP5xKsmq/TJDnbo
         DkYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=MwDG1dJ0R+ylczfpb9LgJSGMK+igr+ePmXxrtt0VspM=;
        b=TiS0zXV9LPJsDoGMi4cyrjYMVM5/I+vHTr0YXYSLqFMuxHg+E4ZKid9gs+UMdQef04
         lAby3m9i/s805etSqcSrDO0sM71IiRsz82KDwXZLpn7HXRMOkGBsQmqpfQcZCiZBwlUG
         LYLgWWGql0qvIaWMBVE7JgmgAC8E4Et5Xkl5d5WWlN+6vhdQu/k42sWDLyl58HAYoCUb
         YAlD3PjOlGWOIGZbRMFV3ofvPEwQxAsy57xgyEnqyYwxG8Dv/ukrdE13RlRhEKe8s8xM
         VuzpjYUK+nlr5hgkoVv2cs7nCsDqtpnEhRei9UXVQIfB8ZSXXsNWnnAKkxUnhhcHUefl
         q3Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x6wrvcT+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020ac8598a000000b003f3a4f93e49si6394603qte.548.2023.05.30.07.07.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 07:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x6wrvcT+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q4004-0001C9-AB; Tue, 30 May 2023 10:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zzz-0001BM-Li
 for qemu-arm@nongnu.org; Tue, 30 May 2023 10:06:55 -0400
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q3zzy-0005Ju-0p
 for qemu-arm@nongnu.org; Tue, 30 May 2023 10:06:55 -0400
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4f3bb61f860so5201143e87.3
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 07:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685455612; x=1688047612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MwDG1dJ0R+ylczfpb9LgJSGMK+igr+ePmXxrtt0VspM=;
 b=x6wrvcT+Ic6Q1OwkrIeq+Evd7YCLcMMwoLiORT1vCJ65V44xLwBOll7W7Bn2GUERZd
 9uukfe1VjSZOAYnUiY8h4CmPKTcXp+niTrRC2eZu4F+Qr5iQxoGjMoyM1GwRAt5/g7Fh
 rTi0uzGQTboduhx9P+YHsrmu1RXdD/gpGgdnkMQYnDsFVy46MmEPYBMFoECQwupBV09S
 ZjBH8cyzZ4Cok338Jxa8rXv087VLvLbDAZWDUaxb2la+EUgssvE2ncr021vAnkrN4XBv
 kFUUkHt32Q0iLJLaeqnEqHJ3m0+ixaDctTtmRkUWox/vyn8LVyXfBKFcxr1FSeGL27eV
 bwSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685455612; x=1688047612;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MwDG1dJ0R+ylczfpb9LgJSGMK+igr+ePmXxrtt0VspM=;
 b=DQiXTPBR7wrVRBlCN+uW8u089jFMA3uKqo8jyCcBWuRuvL9MCSnoMXTIn3CAu75kgP
 0n2ySML5Rs+K2m1faP/K+7BtZcJjs/GNyg3UVTS53KAE5Q8G4RDSxTpSbyyA+BQpimJm
 d2hYyn++dla6Molb8vIZsHCvQK5HrT6TGLIBEe7yT30Q512OtuVkQy5B1tp3W9Kcw9zf
 qPWDRVHPIwFQVDOUnoHHbWJmQ1snuXjFG9CxwmI3HnqkeXiXbZqTL3TaEyYDOJ139CHE
 nl/xFPZ78TEtPalDeIj8K7kYy8JaE/cvR5jnFoY3JzGhjJeZnyKEuwldpMpbeAAv4i74
 PIrw==
X-Gm-Message-State: AC+VfDw13KlTlDn8TSs8HsvKnln4i7sWlfGwLlGocaHjQdI7cSdfWcUN
 OhkRynPqQ9bXAKuqmItQKumUtadVA5//vHhLOcZO1A==
X-Received: by 2002:a19:741a:0:b0:4f3:a0f0:7c4e with SMTP id
 v26-20020a19741a000000b004f3a0f07c4emr775418lfe.35.1685455612068; Tue, 30 May
 2023 07:06:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230526002334.1760495-1-richard.henderson@linaro.org>
 <20230526002334.1760495-3-richard.henderson@linaro.org>
 <CAFEAcA8E_wbiL=xxc=qzfbhBjTsGVxpMGYex_Ezsn_=47DJP3w@mail.gmail.com>
 <5192c74b-38fb-7f2e-7b27-58d210c1b087@linaro.org>
In-Reply-To: <5192c74b-38fb-7f2e-7b27-58d210c1b087@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 May 2023 15:06:41 +0100
Message-ID: <CAFEAcA8tPuFMz8BZ5P-SJS42q8E_TZ1_5DJL-0kOvzeT-Fymmw@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] accel/tcg: Fix check for page writeability in
 load_atomic16_or_exit
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6m9gs9r12RUE

On Tue, 30 May 2023 at 14:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 5/30/23 06:44, Peter Maydell wrote:
> > On Fri, 26 May 2023 at 01:24, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> PAGE_WRITE is current writability, as modified by TB protection;
> >> PAGE_WRITE_ORG is the original page writability.
> >>
> >> Fixes: cdfac37be0d ("accel/tcg: Honor atomicity of loads")
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   accel/tcg/ldst_atomicity.c.inc | 2 +-
> >>   1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/accel/tcg/ldst_atomicity.c.inc b/accel/tcg/ldst_atomicity.c.inc
> >> index 0f6b3f8ab6..57163f5ca2 100644
> >> --- a/accel/tcg/ldst_atomicity.c.inc
> >> +++ b/accel/tcg/ldst_atomicity.c.inc
> >> @@ -191,7 +191,7 @@ static Int128 load_atomic16_or_exit(CPUArchState *env, uintptr_t ra, void *pv)
> >>        * another process, because the fallback start_exclusive solution
> >>        * provides no protection across processes.
> >>        */
> >> -    if (!page_check_range(h2g(p), 16, PAGE_WRITE)) {
> >> +    if (!page_check_range(h2g(p), 16, PAGE_WRITE_ORG)) {
> >>           return *p;
> >>       }
> >>   #endif
> >> --
> >> 2.34.1
> >
> > load_atomic8_or_exit() has a similar condition, so
> > we should change either both or neither.
> >
> > So, if I understand this correctly, !PAGE_WRITE_ORG is a
> > stricter test than !PAGE_WRITE, so we're saying "don't
> > do a simple non-atomic load if the page was only read-only
> > because we've translated code out of it". Why is it
> > not OK to do the non-atomic load in that case? I guess
> > because we don't have the mmap lock, so some other thread
> > might nip in and do an access that causes us to invalidate
> > the TBs and move the page back to writeable?
>
> This is about falling through to the cmpxchg below: if !PAGE_WRITE_ORG, then the page is
> really not writable, we will SIGSEGV, and handle_sigsegv_accerr_write will kill the process.

Right, but if !PAGE_WRITE_ORG then that implies also !PAGE_WRITE,
so we do that even without this change ?

-- PMM
