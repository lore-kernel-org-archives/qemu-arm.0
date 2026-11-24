Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2B6606A321
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Nov 2026 09:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=rbEkfW65
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xVmP1-0005Bt-RC; Tue, 24 Nov 2026 04:01:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVmOj-00057y-CZ
 for qemu-arm@nongnu.org; Tue, 24 Nov 2026 04:01:09 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xVmOf-0002BL-PN
 for qemu-arm@nongnu.org; Tue, 24 Nov 2026 04:01:07 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-6767d92cde6so4586809d50.0
 for <qemu-arm@nongnu.org>; Tue, 24 Nov 2026 01:01:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795510862; cv=none;
 d=google.com; s=arc-20260327;
 b=kkZSJfYb0TqEWp1pIOuiEoCOmNxfpZB1hbYJQgJchx/Ooe8r9LPMhYE07Zp8xTf50x
 n6WkgX7QMC7zgcg5kw8nRV/CRedOuMWB81a+cJ2EJ1m8/znJsr7Op/o5BTeFdtNyuxSl
 FCiYObEyoIJ1G5H9sNcv4s3KNL3uxAWt3QWFJkIYZcR9oUpsDfTZ42BtBusxd4vYfZb2
 WTfsEDR3gHzAIHd6asr150xNykzrwAshMM10efJlb34hf995VMCUx4b4JqgaEHxyd02w
 r4f17GG1RVlW0ubquUQck+VEr0YS+x7S8Nw6V6Juomed/u8qe7u/0mXPp3SuEInssjq5
 5kFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=f7J2Bb6ofoI2IDgrYAe7OxCTHbHfMsQPF/z0Y+0Aw3M=;
 fh=AmFKx/kz3ED4pX6GaJjNUjwNCMHB9GC8hJ6HvGdBJmk=;
 b=k+2TxvI850eURjO35qH1KGkDiUygK6wim4flQ2+FOjD0kaeOSDlNpe6o70/qwURtsT
 2eAJlBytsMDjQ+mfw9KuwvM+IsIXlwhj7GhX5HborEG9MBEWOUhM7RLuPgMywkWfWkQJ
 FAyFnwXryo7iTCOw2qDm9Ew137Bw16IZFs5EP0j3RLqBIcnoqsdiTbbkvL2K1r6Oy6db
 WiKA1DxSgEDjHLdIN1iQOJWdlKNEXQwoaDAz8X1Oet4Mc0+B5dNiVJQLmfKpdKGOvMPU
 Q1FCgexnc6b/y0KRmCdYyXlKMjs0DRd++n1hPMYe6ayhmxAUtXAY+EjFOjWSKMnOiWj2
 TBlQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795510862; x=1796115662; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=f7J2Bb6ofoI2IDgrYAe7OxCTHbHfMsQPF/z0Y+0Aw3M=;
 b=rbEkfW65WACfabb7fdiesT78yRXBPzjhn9mIZMSDd/v1HfsAjWTtRSqGWAxw2LW44p
 Ls+CgAUWZ+02BwglGsdhR+HimM4/UJxpT0QYQvojPZDL6e6jJkZfK5Vulk8bjG99532T
 3Vj6QQd6NS/HNf3yb0Lc26CHDWQkLXPe137arTGBRm4/+lrqrGhIeh+EuZdtbqBOD4n2
 oR08k082hvnMv1Y5T1jeGc5B1PReuJFSA/5WKSfFsgWJ01sLbmpykGBm9w6++Me/SLmW
 CIdPvIjM44jUzdFL27iMG+gGarIQ0AZASPCDaTWM4W446P3sSPHKAGwlhInUuJmWQH43
 K5PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795510862; x=1796115662;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=f7J2Bb6ofoI2IDgrYAe7OxCTHbHfMsQPF/z0Y+0Aw3M=;
 b=gKkadP4wnrYSkYVz2QdZGuU1fuGDpOLOOl2x2o69ennMDkREw1AiPkDzkPCybcv9xp
 JJQD6XalYXHsXjxppk5UQ4fbXRwfda6fIz5y4L3IYer6GxSV0AckKus2z1Vilx0+Gpcp
 nrQ5369w64Maqa1Yp3WRRC5/SLFfZMjUNxKdyBuA1yylLHrizeGF/47RfEFTTCl/1ZEF
 j0Lb7AbifB6lUL0pz/SKOdYjWA8FNRnzs0E2ia/PpodXFfaWhvLnj0EMEMvnOp1NAONM
 jka87um/PEswtNLSlbEz9/uaZcQ+BQPhmVSjq38Nq8IZnD7gWhLrS2SCRcd9J2gURf8r
 mwzA==
X-Gm-Message-State: APuU4Z857iPOZ2p0I6CG+sWK/6PZ6y0kM7oGtYhax/QFcEaeXfTPSuf0
 DMTBd7drwnYOxNDdElfjwjybDXK98iL02ANjZb6/JCQK6sK38EDwSXap6Fona1XMLmoxzaz8PvB
 43dDp/kW3mj0COoAhcX3SXZUjD6QpSxnbLHd4hdMrdcZnMv3VY8Dv
X-Gm-Gg: AZFdTZcscFvzy3Vi8Qh+kCCbre+vdt5rpXoK2mZJzlN21YMAVtCeTueTCi93/XVwkje
 /ty/ABWW+0yy6pXQsKI5+yBK2jMXsdMSiiMOcqMRIO58eIEGnEWAPO/G+6d5vU1SWbUeI9TmVqP
 8RFURLpi1pva6VBBQGH87k6zf9bRpHn+zuHxxS1RdJRB8xPilv68mwiFKhn6hrVftLJNU0WXk4S
 TBCs3JqWyGk2xfG0OshweUDMyd63P1yNzgBexKNwBEFNOU8xyW0TVw/Mnwj5rw06EMJdaE484OP
 nqAejTRZAxM9w7/55mKFD33/BDguPXv4xjpcj19m38dQsWmKBx4pkRtq3wR8pGp+kv8FjzcWidf
 c9Kl+EsWAK7LdSqNtAMZGKXuQxREAy4bmampB942GsgxPXS9bcm3PS8jP8VC6xiruHd/Qr08yP5
 21lxRK3ybSkvSHwCKI+2aW
X-Received: by 2002:a05:690e:1185:b0:67d:e36c:6beb with SMTP id
 956f58d0204a3-67e03d05eebmr4224825d50.96.1795510861655; Tue, 24 Nov 2026
 01:01:01 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261119165546.3050013-1-peter.maydell@linaro.org>
 <20261124062150.75285-1-kmehltretter@gmail.com>
In-Reply-To: <20261124062150.75285-1-kmehltretter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Nov 2026 09:00:49 +0000
X-Gm-Features: Aa3M54rAY9w6g9b6dmqzSs9hdoXVXBEQZ3JVccFVLHYCk5KFRo1jd4ymZ5s5qZE
Message-ID: <CAFEAcA8kLHD9MXqYVma8mpHNL4eN2DoizXJtuYiSb638XNLtaQ@mail.gmail.com>
Subject: Re: [PATCH for-11.2] target/arm: Handle "PMU disabled" in migration
 validate functions
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, 
 Jim MacArthur <jim.macarthur@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 24 Nov 2026 at 06:21, Karl Mehltretter <kmehltretter@gmail.com> wrote:
>
> On Thu, 19 Nov 2026 at 16:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> > @@ -693,14 +694,16 @@ static bool s_rnr_vmstate_validate(void *opaque, int version_id)
> >  {
> >      ARMCPU *cpu = opaque;
> >
> > -    return cpu->env.pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion;
> > +    return cpu->env.pmsav7.rnr[M_REG_S] < cpu->pmsav7_dregion ||
> > +        (cpu->pmsav7_dregion == 0 && cpu->env.pmsav7.rnr[M_REG_NS] == 0);
> >  }
>
> the second clause checks rnr[M_REG_NS] == 0. Should this be M_REG_S too ?

Yikes, thanks for catching that cut-and-paste error.

-- PMM

