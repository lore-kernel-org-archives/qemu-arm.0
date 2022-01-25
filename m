Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp2924022lfk;
        Tue, 25 Jan 2022 14:09:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwSzhMmZShhFpbFkuMdYyYsF85+d/HN+TraXcaV4kDBPtOBcN8eOyT/qtMLKTiwlEhsA5K+
X-Received: by 2002:a05:6e02:144a:: with SMTP id p10mr13530203ilo.152.1643148594276;
        Tue, 25 Jan 2022 14:09:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643148594; cv=none;
        d=google.com; s=arc-20160816;
        b=guAPYyVqLV9cLG90L5gDRbAT+Bbxvw9Zi9EBHwsFSfhgkaCzQMR9aqJ0CONB4+YzdM
         exMntdpkHqyjFLadG3/H5n4EUxqKuvUPyRZJmp8lN66cW4HirmC5EsuEi+bpO6rDmwrf
         TsdZOZwPbioQfmJF8fa+piwsium/eSJkN9ZJ7Ivi+Fc/KdP8diN6754glgRsUOC4MZBF
         GOrG0y6iHS48M7ibIxjEuytVkLrAjCgzrV7QxvtcOTbP+EeEN9taghnexS10YalI5siZ
         Mn1GAlQCI334oPoFrQvDV/6hIq6Qq3YHxGQV7O/m9HJ/9s75UnpcnTofGADcmkBLOl7G
         Wm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Rsrd/QrYVZeAlMiV47vtxK1cQ5p47qHczminyYgkD4E=;
        b=IQUNKgiN+/V/Ey1xrRA6NnWcf/1PSbfcNKZC0B7mIdSOJYb+pWsAV5mES+Cy/++9wx
         ZaAOPHPrhAOgAIaqFC30LVeVj0rVTUz+vVBp6tcjB8fFXfzXYsM8yvz1oh/lwkdSbE/F
         LJS6M46goKm4eOq+DnyyQ92R8oXiPBXG+XJKL78++oASIl++k0Nxrz0gTWKD0ZaXE31e
         3gkHcEvkT5Jdn6RcZaPQlsJdsqHl/rPRq+TOMgFONdGuSOjWkU6dHa3HO4EBLP+zc3G6
         07AHmCPiHFc0Q5SMnkri99ADPSqaFEyX1ONYfHQt1U0ptzxNDMgoDrm6OJ1YbMX6iKfv
         mAbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CcBzzDA2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 5si9853750ilx.144.2022.01.25.14.09.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jan 2022 14:09:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CcBzzDA2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nCU0f-0006fG-J2
	for alex.bennee@linaro.org; Tue, 25 Jan 2022 17:09:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCTxq-0003c6-An
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 17:06:59 -0500
Received: from [2a00:1450:4864:20::436] (port=40660
 helo=mail-wr1-x436.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nCTxo-0003od-RC
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 17:06:58 -0500
Received: by mail-wr1-x436.google.com with SMTP id s18so22393184wrv.7
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 14:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Rsrd/QrYVZeAlMiV47vtxK1cQ5p47qHczminyYgkD4E=;
 b=CcBzzDA2Qaiom2EbHPmRbw0d1sWdCgrVeT8bq6uzVUNfCYUTqEyMutZ84o/5VEr9ce
 RQyldp64Q6CZT3/kHG0No24EccU0ZIM2J/HzggDH0loW1raXkBcAc0Jh/xuiE66cNQ+G
 fKLtt874wtPbMLMiOldFnWMKKIrS3aQDWbMMn5EZVtBBevg5gQ9hR1oolPczgTRVcSUX
 Z2kVC2VyWNjNOe2ITqyJ/uEtFyf/8wl69x6w37ByP2EfAWJn2036+E8ubpf6aavAwLrn
 Fajo7w4OPaIzWBQiPHop8OC++41iTydM95npkkpv/lZeYB6YunsRBQqb8vcMbA342Nb+
 IpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rsrd/QrYVZeAlMiV47vtxK1cQ5p47qHczminyYgkD4E=;
 b=3MjmvM+rkVQUIWbTsnEiNFYVCVzUR+fKObLbJxzb7pzQdVDYOZoVMIjUxKQaNOgsp7
 bYdaT0ilkdrMdOH3q3FNOXOyW+TxLlqtrehHcAETZTZYCuWCeIUpTl+4B5zSjtKD+coL
 0v29W3DIjvwWqY/F39BJXaZb/5RpvYJNotO+KV+Hy1zqthOsFVfn3PP/xIA2kNOSCZ+s
 zFkO+YcsUpik/TSFJTUqYxZ130N03oSZ3tBjOc/M/I6VNe0GHEtYL8F2lvsGuN3VWMt1
 ihnt7msT59rWieNAbI86hsoaFkU71RNBNS622Tw4WN47BQ7A0vKYu3NpyZjyr+bN2DdQ
 NaPA==
X-Gm-Message-State: AOAM531s5+s70+N22+5RhJm/oS4Ke/UxrFGpbnWg5F2kgggYsEeCsqlO
 e10TJrLPxqR7w6vpM7i4d/Dl/eI23jocHDTa1z+0LA==
X-Received: by 2002:adf:e949:: with SMTP id m9mr20078486wrn.172.1643148400160; 
 Tue, 25 Jan 2022 14:06:40 -0800 (PST)
MIME-Version: 1.0
References: <20220110164754.1066025-1-idan.horowitz@gmail.com>
 <20220110164754.1066025-2-idan.horowitz@gmail.com>
 <0f211c09-4b4d-2c82-cff6-64711563c6d8@linaro.org>
In-Reply-To: <0f211c09-4b4d-2c82-cff6-64711563c6d8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Jan 2022 22:06:29 +0000
Message-ID: <CAFEAcA-VuVPfDaPCZ9ta+vtmj9RUb_BBMCihTGKsEV4SSphaEw@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Bail out early on 0-length tlb range
 invalidate
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::436
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: pbonzini@redhat.com, qemu-arm@nongnu.org,
 Idan Horowitz <idan.horowitz@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5Q15PzzhuExk

On Tue, 25 Jan 2022 at 22:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/11/22 3:47 AM, Idan Horowitz wrote:
> > If the given range specifies no addresses to be flushed there's no reason
> > to schedule a function on all CPUs that does nothing.
> >
> > Signed-off-by: Idan Horowitz <idan.horowitz@gmail.com>
> > ---
> >   target/arm/helper.c | 4 ++++
> >   1 file changed, 4 insertions(+)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index cfca0f5ba6..1e819835c2 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -4564,6 +4564,10 @@ static void do_rvae_write(CPUARMState *env, uint64_t value,
> >       length = tlbi_aa64_range_get_length(env, value);
> >       bits = tlbbits_for_regime(env, one_idx, baseaddr);
> >
> > +    if (length == 0) {
> > +        return;
> > +    }
> > +
> >       if (synced) {
> >           tlb_flush_range_by_mmuidx_all_cpus_synced(env_cpu(env),
> >                                                     baseaddr,
> >
>
> Looks good.  I guess we could sort the extractions above so that we do
>
>      length = ...;
>      if (length == 0) {
>          return;
>      }
>
>      addr = ...
>      bits = ...
>
> Either way,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Should we handle this in the tlb_flush_* functions themselves,
or is it just Arm that has to fix up a special case of "actually
the length is zero" ?

-- PMM
