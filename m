Received: by 2002:a17:906:5293:b0:9ae:5796:d6c1 with SMTP id c19csp1320218ejm;
        Fri, 22 Sep 2023 06:40:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUEkX3Vc3f7/hNrQbJL5SCDYI2wJHzhx9agdcQAdEfiGip1ul0amy5z9Rwsnb2hjTjuDqC
X-Received: by 2002:a05:622a:190f:b0:417:9238:5a18 with SMTP id w15-20020a05622a190f00b0041792385a18mr9249146qtc.19.1695390015510;
        Fri, 22 Sep 2023 06:40:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695390015; cv=none;
        d=google.com; s=arc-20160816;
        b=XLIgavxXH6HAU0NcxDgmdhjtwf9rLffIl3x+IOGsSgFABuWClWdbBzyafQ97fpmjmO
         ykS2s++SET4smQyCKFNXAYyl37OjBpoZjb5iK4rRQPsHBhDSb4EvLJPR8mxcqci5x7EF
         oFsUMaPBOLI0BEFH1Bb8ttP73CTk4LqzUzhgImLKU0O9doXVsYG0I7jrdMXmZUl+RGbe
         lkf3W3jIQOPRB36dj6d7e0EmvPNQQcbNYdpe787EFpJgiQ+5tKDNHHBZM15IFcmO0lEI
         uPVwXioDtBwpMBav95VrnaG03M9XROoTKf+4me0OVBKQCzkraB5Qk5Y0VUDFPQCBlIG+
         mGng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=F6w4F/anS6cGmb0H1iTqM05n96bG1rTDo9LG/muwD6I=;
        fh=VWuKj5IT3rv5dFF9iSlbu4Bb7v+IVvCNZAx4HyaZ0Tw=;
        b=XCt74+7WanYpJCIkJvd85EZjlZS63bdDnY3bdjccPGAHwaCp80NRSLXJl32VjNa4Ox
         r9EORWF9x8f0blxsB5kCEpfpLzm9+XxRNVazDnAPA3L7GRwhtuYB1xgk4tm1MhbQkAWL
         olckusLPwstIeYv1SCYSLbhM5HdFhz2knyUwPGegjjlCnQbVDtnskm+NLd8juJhs+poN
         /mjbwJtub6EPPSo3vBR1PrlFMi5SV1cbMOhsBhZyVw2M8JI++Hjqp8l0+X6Dq50u+SAG
         9HvgkvNkqQzNcHEcLcUytQN4xYD6QIOfozktA6ir7wZtY4FhWQ4iieTqPI/zmD4K/t3t
         upkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=xKG0aOAu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a15-20020a05622a02cf00b004122a13589csi2245411qtx.506.2023.09.22.06.40.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 22 Sep 2023 06:40:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=xKG0aOAu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qjgNk-0007Rk-SF; Fri, 22 Sep 2023 09:39:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1qjgNh-0007Qq-UI
 for qemu-devel@nongnu.org; Fri, 22 Sep 2023 09:39:43 -0400
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1qjgNg-00019M-8q
 for qemu-devel@nongnu.org; Fri, 22 Sep 2023 09:39:41 -0400
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-53317e29b00so19228a12.0
 for <qemu-devel@nongnu.org>; Fri, 22 Sep 2023 06:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695389978; x=1695994778; darn=nongnu.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F6w4F/anS6cGmb0H1iTqM05n96bG1rTDo9LG/muwD6I=;
 b=xKG0aOAurCzlnDyof3yQ2U5QvXUoUOq9jp/PpNlmNaao8UU1XcSWdCvMyIjQn3sKQ5
 zQicLMUquIwlhgzFModMTSHz+glBGBGzlkVIbhx8wEdltXr6owmd+BKRO7ueYV8NLZiw
 1TPiYLGhH8fp3a8sUdfDUkMQGuFYhKHmyi7C6CGppu211niRwUX+1+PwHEY8V4WDMOAs
 3R26gy+GfUQ+sZlEcm6n3YQNag4lU+QByYk7f4Iay4tlNkDvRkjcEzsuhx21W8639vtL
 EcNOwu7fN+mNHEM71inRA7lEGC+z/0D1VB/LtLcZBDOguyGNKwPjwlaWersniboEGSFX
 BpeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695389978; x=1695994778;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F6w4F/anS6cGmb0H1iTqM05n96bG1rTDo9LG/muwD6I=;
 b=UBXjwfgEba3kueI43o1GQvlI9Z2fPfV3zyQ3WJzA8C0wdgKlkvnK4c2PcV9X+DsODr
 XyHABKrP2pDpNCSlfCWT6YDj1X5q3YU26T/yDmwofiOTJutfGjCK4LaBX0Aa8Z7G3sCj
 16mMkLktn7UjWTT1io6gw7n3a2c+VBVICXRTM79MuX7XGiyB8clpRyA0IIn+UU7dtriY
 EJTRZYjrG2ZQJfzdz3AXt3UbPjiXlVf9V7bebQATqyWC9+FBqtdlOXZTpM4SuCImBAdP
 Q94ZjtnN7JKfKiu+KLdqsDtS9JTx2TGaNVGun7E4nDWh6/c/SZ7cIJy3A5OqdTixcrhL
 5VJQ==
X-Gm-Message-State: AOJu0YyCWggotJ0GDCano0xT68VwuOiRZ1qL6SinQONMcrVvyD1FINWI
 OoIVUOHQDLDD7rgkVcWTa++r6g==
X-Received: by 2002:a50:d79a:0:b0:530:4a6e:25a9 with SMTP id
 w26-20020a50d79a000000b005304a6e25a9mr83128edi.6.1695389978325; 
 Fri, 22 Sep 2023 06:39:38 -0700 (PDT)
Received: from google.com (203.75.199.104.bc.googleusercontent.com.
 [104.199.75.203]) by smtp.gmail.com with ESMTPSA id
 v2-20020adff682000000b0030647449730sm4495954wrp.74.2023.09.22.06.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Sep 2023 06:39:37 -0700 (PDT)
Date: Fri, 22 Sep 2023 13:39:33 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH 3/3] hw/arm/smmuv3: Advertise SMMUv3.1-XNX feature
Message-ID: <ZQ2ZFcDuuYi/t816@google.com>
References: <20230914145705.1648377-1-peter.maydell@linaro.org>
 <20230914145705.1648377-4-peter.maydell@linaro.org>
 <ZQ1tvgUOLga21EkF@google.com>
 <CAFEAcA-uXuU9KGjwrMnppkpnED1XHTsWrz=0gSYvjfFNNpf1eg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-uXuU9KGjwrMnppkpnED1XHTsWrz=0gSYvjfFNNpf1eg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=smostafa@google.com; helo=mail-ed1-x530.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 05gB18P2OciI

Hi Peter,

On Fri, Sep 22, 2023 at 11:54:06AM +0100, Peter Maydell wrote:
> On Fri, 22 Sept 2023 at 11:34, Mostafa Saleh <smostafa@google.com> wrote:
> >
> > Hi Peter,
> >
> > On Thu, Sep 14, 2023 at 03:57:05PM +0100, Peter Maydell wrote:
> > > The SMMUv3.1-XNX feature is mandatory for an SMMUv3.1 if S2P is
> > > supported, so we should theoretically have implemented it as part of
> > > the recent S2P work.  Fortunately, for us the implementation is a
> > > no-op.
> > >
> > > This feature is about interpretation of the stage 2 page table
> > > descriptor XN bits, which control execute permissions.
> > >
> > > For QEMU, the permission bits passed to an IOMMU (via MemTxAttrs and
> > > IOMMUAccessFlags) only indicate read and write; we do not distinguish
> > > data reads from instruction reads outside the CPU proper.  In the
> > > SMMU architecture's terms, our interconnect between the client device
> > > and the SMMU doesn't have the ability to convey the INST attribute,
> > > and we therefore use the default value of "data" for this attribute.
> > >
> > > We also do not support the bits in the Stream Table Entry that can
> > > override the on-the-bus transaction attribute permissions (we do not
> > > set SMMU_IDR1.ATTR_PERMS_OVR=1).
> > >
> > > These two things together mean that for our implementation, it never
> > > has to deal with transactions with the INST attribute, and so it can
> > > correctly ignore the XN bits entirely.  So we already implement
> > > FEAT_XNX's "XN field is now 2 bits, not 1" behaviour to the extent
> > > that we need to.
> > >
> > > Advertise the presence of the feature in SMMU_IDR3.XNX.
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > > ---
> > >  hw/arm/smmuv3.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
> > > index 94d388fc950..d9e639f7c41 100644
> > > --- a/hw/arm/smmuv3.c
> > > +++ b/hw/arm/smmuv3.c
> > > @@ -279,6 +279,7 @@ static void smmuv3_init_regs(SMMUv3State *s)
> > >      s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
> > >
> > >      s->idr[3] = FIELD_DP32(s->idr[3], IDR3, HAD, 1);
> > > +    s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
> > May be this can be guarded when S2P is present? according the UM
> > "In SMMUv3.1 and later, support for this feature is mandatory when
> > stage 2 is supported, that is when SMMU_IDR0.S2P == 1."
> > So I am not sure what it would mean for XNX and S1P only.
> 
> Mmm, I don't suppose it would confuse any guest code, but
> it's probably safest to put in the if():
> 
>    if (FIELD_EX32(s->idr[0], IDR0, S2P) {
>        /* XNX is a stage-2-specific feature */
>        s->idr[3] = FIELD_DP32(s->idr[3], IDR3, XNX, 1);
>    }

I agree that shouldn't confuse guests. I don't have a strong opinion,
both are OK for me.

> thanks
> -- PMM

Thanks
Mostafa
