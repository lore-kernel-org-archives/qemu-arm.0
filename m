Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp1463043lfb;
        Wed, 2 Dec 2020 12:02:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7hPIvwpfLkZd1FdTuW8cRdF7MFyuv4nBkULIlhUGBMc2ITFdIPgIuQZ6Tk7DZ3044IAoU
X-Received: by 2002:a25:7354:: with SMTP id o81mr4595072ybc.107.1606939346503;
        Wed, 02 Dec 2020 12:02:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606939346; cv=none;
        d=google.com; s=arc-20160816;
        b=htwiqp+/k9ckqc276fqAcLx7+CPthZDIPLGI3RvjZFBHMDeenZUxBL/Gjyb5AH6HsH
         wn3waBGKeC96z9T6gIMVbB9lZ9033lzSETsPDiNSIyaIJb3hA9CY9f+KaSGbCZCfMOx9
         fbm0Nr3rK6jxuG/6MPXJiQ5TrtD2zumlkt8sQYicKjoWZ+hPX2v+DjJeYBkPfVELOKF4
         3l+tgTSMW5sLkSEiDT3mrgLufH7pVEXGX3RbRAJy5FGx5LN87+rbdKgubuK7Zoe/MULw
         O+QEp92jEcuzcozEPF/+YZoI3R6RdR4quDHvjcLt81BwsSa0zxQCRpuQ5zSUXIZg5Xic
         KPcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4Tnx1/g/Fq99lzQzhHiuxAqrwBmkAdDBRHd0RGAObQo=;
        b=Yg/ybWp8rgu70mCrbx1vG+hbpBrQDplhEiJevYsVCUwomCy6r4ztIzGN/VefMem1Wn
         i3dvveYfM4ruliC8VnQOI4ZazJtcq/4JWP0l6hGLw55raRh2loXA8HmFuNeBekdYpFCe
         /E0g7u24Rjc8dfVTjf0LXFyCdbE6BoVFacFxwxugMp1pDOTCTGgZSk/gBj1QRrXKYbyl
         VsTWyKwcRJsais0ZU3NUnRp1LFOZw6ZYsMj94c8jXDL4k0+r/kG0sv5MfdZtYeSKCkim
         0tbCDiu+RKloFiEQ8OzdjSUpMYlKepDxGL7h6B4c0Cu1zS+Ca9WOH216zlXmuTarPO7U
         1PLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=d1sPGZHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si2838161yba.66.2020.12.02.12.02.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Dec 2020 12:02:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=d1sPGZHK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:52834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kkYKX-0001t9-TS
	for alex.bennee@linaro.org; Wed, 02 Dec 2020 15:02:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkYKP-0001rv-0S
 for qemu-arm@nongnu.org; Wed, 02 Dec 2020 15:02:17 -0500
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141]:39323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1kkYKN-0004B0-JY
 for qemu-arm@nongnu.org; Wed, 02 Dec 2020 15:02:16 -0500
Received: by mail-il1-x141.google.com with SMTP id q1so2704009ilt.6
 for <qemu-arm@nongnu.org>; Wed, 02 Dec 2020 12:02:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4Tnx1/g/Fq99lzQzhHiuxAqrwBmkAdDBRHd0RGAObQo=;
 b=d1sPGZHKqba42eW1L2jtTFWkUOZtJ6a1F6rJUEuv3//R28tu9gg0Woap9yfHzQEHCS
 Eih7ldmhdE0aGhMGfuFneJmoY5pJ8hYbWWbJy/PMCoYczTEio4Qd5rZ7hxQIsMMbDmbs
 kN91pf3Dgoe6TODaByKAyeKXmXPramNCaqXNVWYYf9n6/3DAqqf2vSx6yPTSySzOlMDK
 Q/vS/VYJb6irCAgG8NPWQW9wJxsgMBaMegX7PiXUKWwMttHJrRoX87b7sh1TVxtMc5pK
 37JbvBgprw5oihLie5e65Jr29LdhYrGoHTPTuZmwgGAnMpc3rZRI+ztA3bVgUp+zguBO
 /a5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4Tnx1/g/Fq99lzQzhHiuxAqrwBmkAdDBRHd0RGAObQo=;
 b=RvYpQwnZM08IC8HDdrTYBmHoa4mLX06RgBDposHbRyX8j3X+YIvtyyyHA+xqJpTcR1
 c8BIeWDpdRglh2ZWQRscvVAgIQ+G4nexUj3pXkYttJfrUiJ93HWC+HP80AdbIuP0M2e3
 3Nh4aRGOOG86d0BJqhtTCzpLhe8EfkLZCui04siRB/ORqgey4tiRSHAmvcgo/G/hHQPY
 Y1ShkhfaFw5Es7R8n/I7xTIa3hqgWz+bW2ydWfnw5lpVSEKzVnpqao8/K5WIG4lmVRmA
 utbp8EAwk7acWaZ7BKZ2jbGxgYRnqy8ju/NBDmbCSrKN4mS+HtsSNBv6qJpvuQNZJ0vB
 lTtg==
X-Gm-Message-State: AOAM531+K9LRA7IEc5NzNO1xSidL1NNhhhaIzYeOToc6hsjcIyP00u/5
 VrCugkgwbpk5POiWxpDYf2NdoPJitxBciqbHNSoEyA==
X-Received: by 2002:a05:6e02:f86:: with SMTP id
 v6mr2178086ilo.56.1606939333506; 
 Wed, 02 Dec 2020 12:02:13 -0800 (PST)
MIME-Version: 1.0
References: <27f51056925889c41b763b71c992f04d935157c4.1606884132.git.pcc@google.com>
 <f01281f814ceba088595917eb06d4cb21db820f1.1606884132.git.pcc@google.com>
 <23335280-d732-4bf7-af49-068e00601414@csgraf.de>
In-Reply-To: <23335280-d732-4bf7-af49-068e00601414@csgraf.de>
From: Peter Collingbourne <pcc@google.com>
Date: Wed, 2 Dec 2020 12:02:02 -0800
Message-ID: <CAMn1gO4bze4PsU6LbXAGxe3VC2xop-h=xXjdUuv4ZP0P66R01g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm/hvf: Add a WFI handler
To: Alexander Graf <agraf@csgraf.de>
Cc: Frank Yang <lfy@google.com>, Roman Bolshakov <r.bolshakov@yadro.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::141;
 envelope-from=pcc@google.com; helo=mail-il1-x141.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
X-TUID: vK/OFRRErGxo

On Wed, Dec 2, 2020 at 10:49 AM Alexander Graf <agraf@csgraf.de> wrote:
>
>
> On 02.12.20 05:44, Peter Collingbourne wrote:
> > Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> > up on IPI.
> >
> > Signed-off-by: Peter Collingbourne <pcc@google.com>
> > ---
> > v3:
> > - move the simplified locking to a separate patch
> > - spin on sleep <2ms
> >
> > v2:
> > - simplify locking further
> > - wait indefinitely on disabled or masked timers
> >
> >   accel/hvf/hvf-cpus.c     |  4 +--
> >   include/sysemu/hvf_int.h |  1 +
> >   target/arm/hvf/hvf.c     | 56 ++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 59 insertions(+), 2 deletions(-)
> >
> > diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
> > index e613c22ad0..b2c8fb57f6 100644
> > --- a/accel/hvf/hvf-cpus.c
> > +++ b/accel/hvf/hvf-cpus.c
> > @@ -344,8 +344,8 @@ static int hvf_init_vcpu(CPUState *cpu)
> >       sigact.sa_handler = dummy_signal;
> >       sigaction(SIG_IPI, &sigact, NULL);
> >
> > -    pthread_sigmask(SIG_BLOCK, NULL, &set);
> > -    sigdelset(&set, SIG_IPI);
> > +    pthread_sigmask(SIG_BLOCK, NULL, &cpu->hvf->unblock_ipi_mask);
> > +    sigdelset(&cpu->hvf->unblock_ipi_mask, SIG_IPI);
>
>
> That turns set into an unused variable, no? I'll fix it up while
> applying though. The rest looks great, I'll push it as part of my next
> patch set.

Yes, thanks for spotting that, your fixup looks good.

Peter
