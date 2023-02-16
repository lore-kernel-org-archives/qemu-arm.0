Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp484659ejb;
        Thu, 16 Feb 2023 05:17:28 -0800 (PST)
X-Google-Smtp-Source: AK7set/yNQYrbD6EUii2kqk/OyvaiFGYt028je2n0Pi8QpZa3CafgCmzIX738mFOhwUr2Vs0/PvZ
X-Received: by 2002:ac8:7e84:0:b0:3b6:2f3f:2713 with SMTP id w4-20020ac87e84000000b003b62f3f2713mr10191626qtj.25.1676553448278;
        Thu, 16 Feb 2023 05:17:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676553448; cv=none;
        d=google.com; s=arc-20160816;
        b=AO57uTq7W4/0rbo5qERcqvCKpnx7pKsTa6mzibXU4Xbb6FT6WO46eeSzvZtEKEzuk1
         JfiGYXujFL+YuCarDJakhIj7bmi0p8yUBdecMLOqUS120E6JK1mS9r7FankCAgqKlzBM
         N4ITv6vEVg0v+LaV6LsePY+juX1UEr8cm5lG2EXSlyIhyueuJ5WVFooG1Ugu98jM7Qvz
         tqZWPH7/UMb7fClBOUggKJWMYwC4Bn5Lo6qy6TEXXwGpQlSEAr2U0V3wISOaG4bQt1l4
         xJg6drEUHcePQ1P06CAILWXd/G5sY5JB0rzs1S05Fcm4KKCO2VNLra4CmNjFXx84/kFJ
         94Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=aajx42+edRFDRtjphwx6vIDAqm2MFL4c2Qd6sf5sRp4=;
        b=Dj6imAmYXFkwOIZcRHqvBp1bOP2mKRD8aKwqTi/pT1WQPckjGz32rLA68xViZ51rFg
         2X1EC5nRzRULmPpq5rj0e7zFRHbYPt4NkBa2G/0Uqs1jpbM1kbet9+ECTtUzAx8TO5he
         opGemM9U28WbKFmWa2FjZWZ5xQXF1E1noyPJLvPQIhc9F4MCEp8mx+6sEmdOnoM3M9Ys
         A51FnCXEGahFxB+NWNSWuAAmWdHNNSax8AHmCJdVDfMXO1a3aEXpHeO+2XiyC06xvDgl
         PqDWUDGaN3um/+fjQV6tYo1E3x7/I6ClaTe/ZLq8ADr4D7V8ARvQL8V7NIZUEqkL6YMJ
         Yrvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Ggqzx+ac;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05620a268600b006ec5f9983a0si1560004qkp.398.2023.02.16.05.17.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 05:17:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Ggqzx+ac;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSe8N-0002Nm-4n; Thu, 16 Feb 2023 08:17:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSe8L-0002Nc-V6
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:17:09 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSe8K-0002ky-BA
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 08:17:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso4162567wms.2
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 05:17:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=aajx42+edRFDRtjphwx6vIDAqm2MFL4c2Qd6sf5sRp4=;
 b=Ggqzx+acWzK+DKeqehUK3SWwxkSlqL7S5waLXMzVE8ErXIlT6hUlA7ExcmbjpHr69r
 hFbLHlty84uUzWu4W87G+bWnqXPWlFIzAvmqgL5FKo3T540cb3yAm+Qaomba4EU5WRsZ
 quPNoP+dJHc+hZozSDNJt+bzZxdTo8fjcZFhy+kjOZLfGICQB9X+JhFA4AV85VxL3Tvw
 KT0U5oxdhx+orB3vQnxtKT2gizSOM64CJZM63g60vGWNvQV/H0UW/Sr/8dZePi+tNezP
 3dRuCW5VNlxerazsCX62Ih1JgJQxz7+Ajiul1SoEVAnwTarFLGJQ+Rv73XDkaPVkubpT
 X3mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aajx42+edRFDRtjphwx6vIDAqm2MFL4c2Qd6sf5sRp4=;
 b=slvh68YFDOSSttRjOdErnO5vIffD5EUO5H5mj8ThgP1zpsHjbZPMh1hKKiKZtDa3aI
 mTtFV0Edl+Ad6RqI49chnlriDe8A5734iuqZsojRQLnxs9Gm/9aeUbRjrxVc/LrAhpIq
 iawwMjAsZFVMTql52HeA4OwJOyMoIuIAc4OcxLM/YPR2oN3orYOH1YJk047e/dyr43zc
 QJ5UfWRHznyDQ10/qgcRn2zdl8FpG0sGSSbRUkQcrg+8hN/DVMmkjfIo7qEU/sLozefc
 vAoXn9LC73Tw2KBOHQ2YK7Qd5KJwxCOV46R009/iojrOPS+eZlM/0tQFOaDnpP1k9Qe2
 ij3g==
X-Gm-Message-State: AO0yUKWFU9jszJCGvQ1FypZQQbb+v4pK4Ai9JSx4FJVHqLOc4oU7srR5
 bM74qnST2K/luWqoYdMkZRe1iw==
X-Received: by 2002:a05:600c:213:b0:3df:f3ce:be48 with SMTP id
 19-20020a05600c021300b003dff3cebe48mr165202wmi.7.1676553426582; 
 Thu, 16 Feb 2023 05:17:06 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 m22-20020a05600c3b1600b003daf6e3bc2fsm10661417wms.1.2023.02.16.05.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 05:17:06 -0800 (PST)
Date: Thu, 16 Feb 2023 13:17:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 06/16] hw/arm/smmuv3: Parse STE config for stage-2
Message-ID: <Y+4szt24KUwaz50y@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-7-smostafa@google.com>
 <3086b46d-b7dd-5403-f0c0-7051a7fbc189@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3086b46d-b7dd-5403-f0c0-7051a7fbc189@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: QYKWErWBiQ8j

Hi Eric,

On Wed, Feb 15, 2023 at 06:47:52PM +0100, Eric Auger wrote:
> On 2/5/23 10:44, Mostafa Saleh wrote:
> > Parse stage-2 configuration and populate it in SMMUTransCfg.
> > Configs in this patch (s2g, ttb, tsz, sl0).
> above 'sentence' a bit cryptic.
I will reword it.

> > +++ b/hw/arm/smmuv3.c
> > @@ -366,7 +366,48 @@ static int decode_ste(SMMUv3State *s, SMMUTransCfg *cfg,
> >          return 0;
> >      }
> >  
> > -    if (STE_CFG_S2_ENABLED(config)) {
> > +    if (STAGE2_SUPPORTED(s->features) && STE_CFG_S2_ENABLED(config)) {
> Don't you want to check both S1 and S2 aren't set?
Yes, currently this is ignored, but looking at the SMMU manual it is
illegal to configure an unsupported stage, I will update it.

> > +            break;
> > +        case 0x2: /* 16KB */
> > +            cfg->s2cfg.granule_sz = 14;
> > +            break;
> > +        default:
> > +            qemu_log_mask(LOG_GUEST_ERROR,
> > +                          "SMMUv3 bad STE S2TG: %x\n", STE_S2TG(ste));
> > +            goto bad_ste;
> > +        }
> > +
> > +        cfg->s2cfg.vttb = STE_S2TTB(ste);
> > +        cfg->s2cfg.tsz = STE_S2T0SZ(ste);
> What about IDR3.STT currently 0 so S2T0SZ <= 39
> 
> don't you need to check against SMMU_IDR3.STT/S2TG
> 
> • In architectures after SMMUv3.0:
> – If STE.S2TG selects a 4KB or 16KB granule, the minimum valid value for
> this field is MAX(16,
> 64-IAS).
> – If STE.S2TG selects a 64KB granule, the minimum valid value for this
> field is (64-IAS).
I will add a function to validate S2T0SZ based on the behaviour after
SMMUv3.0 and checks against STT disabled. I believe it is safe just to
check S2T0SZ <= 39 without checking IDR3.STT as we don’t support it
for now.

> > +                          cfg->s2cfg.tsz);
> > +            goto bad_ste;
> > +        }
> > +
> > +        cfg->s2cfg.sl0 = STE_S2SL0(ste);
> > +        if (cfg->s2cfg.sl0 == 0x3) {
> > +            qemu_log_mask(LOG_UNIMP,
> > +                          "SMMUv3 STE->SL0 0x3 has no meaning!\n");
> > +            goto bad_ste;
> what about S2PS, S2VMID?
> 
> you may either squash [RFC PATCH 11/16] hw/arm/smmuv3: Read VMID from
> STE into that patch or at least mention in the commit msg that S2VMID
> will be dealt with separately
I will squash it with
"[RFC PATCH 11/16] hw/arm/smmuv3: Read VMID from STE"
I missed S2PS, I will add it in V2.

Thanks,
Mostafa
