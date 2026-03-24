Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADA8BF54AB9
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Mar 2026 13:38:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w51xj-0000hK-5Y; Tue, 24 Mar 2026 09:38:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w51xg-0000ge-NZ
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 09:38:24 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w51xe-00049V-OG
 for qemu-arm@nongnu.org; Tue, 24 Mar 2026 09:38:24 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-79a2ee65171so38931787b3.2
 for <qemu-arm@nongnu.org>; Tue, 24 Mar 2026 06:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774359500; cv=none;
 d=google.com; s=arc-20240605;
 b=G+rdNWIJW2UAiHkxvIna8oDeJtF7FU1L+ElHd/L8J1KPG2NvjIFclNZ+hyUcXGBHom
 CQOmOOPx37I95f8/64G6J2qcgxlnbzJP2J6ZDeoN9XAzvwvnfuluqZILIlY2HTPyX+U9
 I8ns+I70F853BxMgL2P2WCIgXc39IpXDX5F1uMRoHGrqPKoF3O/XU1wlqr7ngK3CrfiU
 0YtEdn8Vpr8vy8x4TAUjg1lFcqgSumNAPQgnZpIDmO6IR1c1gqASPtiOGCVtujh/RDYq
 M9ozUZoAwlZqa16PUU5Kb2G5ls0NFmexPuv/uekSqIsIhoq8jhoKn+1h3Wku9M/4zSzq
 4Q2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=TPOzL2/PxgXplEfzLP4gJiOQHyowhZVV0LiuIEGPfxk=;
 fh=y/6p8HSQVKmUOwjHSMO28jU0rx498PPD4OxiJ4HXU5s=;
 b=VclD7KAlApH+xzfqiSfPvTOiLDoTHPWN5Voc3anYVR1rrffoJaeu55va6n7Q0V1AUR
 8Mv8JUUurxuHtz3scsS91ELNTmAxhxtvnEQQMJ3ZxTNWH5AAqLf8mQwyRyIeh5goiuIK
 /qO7h4sc7u2OYlXSCjwF0e40TBsH9qc+f22T3tyd5PNRcEI2F8ZeEdkuNVEi0+s5IjPZ
 xp/igmbJ84AiVxjrLBYIwJTrSHGx2RovJ3kz/IfkwuPrD0sCbYRzKplDIquq/zgD/Ioj
 GA7I1fPoLsbnd/+XRfnM9INBLss0UbrRjSiblNXzxH/yWc+xwR0Jfpr3Nmea+x+btUAS
 PIKw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774359500; x=1774964300; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TPOzL2/PxgXplEfzLP4gJiOQHyowhZVV0LiuIEGPfxk=;
 b=NNabnAgSN7+91VJ2m6Cf/HTC/MccxnwPPJcm23fbz4alk1K9RoZt6L9TtoZK0HrcGw
 /BgZ0uDUGvqy0zoyxAOPgQGlmybGL+M8cWwK2vYISxGbxq4iVKGc26n+UfmHeqUVCLWI
 U8NgIZEqc3hpDsS0bIMNpJDCgqS6fUMA9abpljMl7TT67Ue6xTD6/w/Wg0/OB2ZpNqCX
 Z6lwwX6UIy4IkCN/ItJ/WwxynSKTvDPyGqsZMQeBLU9vxDKB1mX+v6XeNtRyHZnIb3UR
 kWTjs3hiM3iBhCdo+2Gz8SXhx+9tPELU5yIhV4Z3CxaAImtE+6SSIzWeJKH0EXKTFuaF
 juug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774359500; x=1774964300;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TPOzL2/PxgXplEfzLP4gJiOQHyowhZVV0LiuIEGPfxk=;
 b=s9du1QzlZUR3uQnwPRQ5NXER6hkjd/o4rhcNW7oL1RwLOvZTZJ++WR6wl/7nDiL+WX
 /LvVIAgpbvYbT8daqfOFEj4FtP1KX2Q6GSyK8ZQ7cDbDG7+u2j14dqzg3aflMjfB659I
 jdckp7tryDMoj19DGBONW5AusM6IaWu4pkpr5QcVUs5UgnPOlcqzxcLDbIkz6HXamcPL
 n2kEHNo76HAgalgdCv89LfrAirJpaG1pQGrwYwqjFhvGhRcKHVSgXa+BfgnyfoS4vlJm
 Y8bFT4F9lmbrR2tx72eCWgyiz5vibNQIowpR8cUAv9e4Mx0dei2avNffI4GFrnnT4sDe
 nQYA==
X-Gm-Message-State: AOJu0Yz762bKiPwprLXidZUlDjI7fk1x+kRUBquSSnlPfJQ1mBW0ppbQ
 br8XjEdtddTdlyeRvxOl6mvjmZuuvfjCCUyq1XpdSTlfVEqqpYTWRv0D8y8KCdAcpD26gU0kNq+
 lZCO6CW0sqSsczV0T0AOMud2OJMDWgGTPGwXZu4wMmn8W5VvkpuOJer4=
X-Gm-Gg: ATEYQzwFXf3+t+o55yH1GG9/nPIIMaPwvvSLyD7hFX1zgnHnAsOePU/JnD9LCsjk4QR
 W1cwyp9mTwUW+Qf39a3vlKnZb8a9xRVriDm9hyK1hdUf5PolaWV39ZrF0jtZfkZgJSBRgsZ/+BW
 BQmW2A7w/JtTfD0wVQYVJA1RYeO2DBwvX5YwDGwm4KgFGG/ed66ZcZ+6iRuT+o+setCSUHKZm78
 Kalg/U+vhVdbqlCyJslFSsrP6SvQhb6KsUGs7od7Jp0qRWniSdg+YTa3t++7WtpAr5OIFDcRi+B
 uZN9gRRNZKBsz8wE5+bteiDbvjvH19N2OMt0c7f7BvJb/Tf8MwJVV5pMiohO3o7Q8Jqh6/Sb6Zu
 Zsw==
X-Received: by 2002:a0d:e705:0:b0:79a:c28b:b077 with SMTP id
 00721157ae682-79ac28bce8fmr29452717b3.37.1774359500050; Tue, 24 Mar 2026
 06:38:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260317122517.47627-1-zenghui.yu@linux.dev>
 <CAFEAcA9bGVuWXAPA0=EaAWXhSigm_yf5OYfnYoTjaQ8x1qXKYg@mail.gmail.com>
In-Reply-To: <CAFEAcA9bGVuWXAPA0=EaAWXhSigm_yf5OYfnYoTjaQ8x1qXKYg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Mar 2026 13:38:08 +0000
X-Gm-Features: AaiRm50FE7_OIbx50eS9N4iPq-PfmnGcL4qMWUg1G44_vZig7hi2R-ol00aaJQs
Message-ID: <CAFEAcA9sovFYwoF1Jk6sN7Aheh1WXj+imAVhJ7ifpvTu7PHuFg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Don't skip access flag fault for AccessType_AT
To: Zenghui Yu <zenghui.yu@linux.dev>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 19 Mar 2026 at 17:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 17 Mar 2026 at 12:25, Zenghui Yu <zenghui.yu@linux.dev> wrote:
> >
> > As per the pseudo code from DDI0487 M.a.a (on J1-16021) AArch64.S1Walk():
> >
> >   // Check descriptor AF bit
> >   elsif (descriptor<10> == '0' && walkparams.ha == '0' &&
> >           (!accdesc.acctype IN {AccessType_DC, AccessType_IC} ||
> >            boolean IMPLEMENTATION_DEFINED "Generate access flag fault on IC/DC operations")) then
> >       fault.statuscode = Fault_AccessFlag;
> >
> > an access flag fault should be generated for AccessType_AT, if the AF bit
> > is 0 and !param.ha.
>
> Did you find this by code inspection, or because it caused
> a guest to go wrong?
>
> We should probably
>
> Cc: qemu-stable@nongnu.org
>
> > Fixes: efebeec13d07 ("target/arm: Skip AF and DB updates for AccessType_AT")
> > Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> > ---
> >  target/arm/ptw.c | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> > index 8b8dc09e72..572048d560 100644
> > --- a/target/arm/ptw.c
> > +++ b/target/arm/ptw.c
> > @@ -2118,6 +2118,12 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> >      descaddr &= ~(hwaddr)(page_size - 1);
> >      descaddr |= (address & (page_size - 1));
> >
> > +    /* Check descriptor AF bit */
> > +    if (!(descriptor & (1 << 10)) && !param.ha) {
> > +        fi->type = ARMFault_AccessFlag;
> > +        goto do_fault;
> > +    }
> > +
> >      /*
> >       * For AccessType_AT, DB is not updated (AArch64.SetDirtyFlag),
> >       * and it is IMPLEMENTATION DEFINED whether AF is updated
> > @@ -2127,15 +2133,9 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> >          /*
> >           * Access flag.
> >           * If HA is enabled, prepare to update the descriptor below.
> > -         * Otherwise, pass the access fault on to software.
> >           */
> > -        if (!(descriptor & (1 << 10))) {
> > -            if (param.ha) {
> > -                new_descriptor |= 1 << 10; /* AF */
> > -            } else {
> > -                fi->type = ARMFault_AccessFlag;
> > -                goto do_fault;
> > -            }
> > +        if (!(descriptor & (1 << 10)) && param.ha) {
> > +            new_descriptor |= 1 << 10; /* AF */
> >          }
>
> This is definitely correct behaviour for AT insns. The only
> thing I'm wondering about is what we should do for the
> ptw->in_debug == true case. Before commit efebeec13d07 we
> were checking !ptw->in_debug to skip both the testing and
> the updating of the access flag; now we will skip the update
> (definitely correct) but will fail debug accesses if the
> access flag is not set.
>
> There's an argument that if you're doing a debugger access
> it's not very helpful for it to not work just because the OS
> happens to have cleared the access flag on the page table entry
> (we also ignore permissions on debug accesses, though there
> are some code paths where we do enforce permissions, not
> really intentionally).
>
> On the other hand, we don't and I think have never suppressed
> AccessFlag faults for the get_phys_addr_v6 short-descriptor
> tables, so honouring them here too is at least consistent.

Having thought about this a little more, I think we should
continue to not raise the AccessFlag fault for in_debug = true:
it is what we've been doing previously for LPAE, at least, and
it is what intention of the debugger access codepath is.

Could you do a v2 of this patch that handles in_debug = true, please?

thanks
-- PMM

