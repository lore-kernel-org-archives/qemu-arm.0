Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6598401ejq;
        Mon, 15 May 2023 08:38:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7gr7oiuYhk/cvBxOyHyLoa9r2TtFyzlFnjNb7joyfLK5AFS2vmRRCSCz2PdtykZ5KbzA/+
X-Received: by 2002:a05:622a:1102:b0:3f3:6446:90fe with SMTP id e2-20020a05622a110200b003f3644690femr56330527qty.49.1684165100843;
        Mon, 15 May 2023 08:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684165100; cv=none;
        d=google.com; s=arc-20160816;
        b=B3m6py+xK70OkkGuvvDbo2ip9gwIw4K3QNytzRRPVYbEICxMABry7wMUNiWS2i0esd
         +lYyWm42NofYR0hXCOn4+KkfuVJhu1k52L3gplMpWQ/wzkAeviX/DYOZTT73RdVJ2h7A
         16DsgBiUOencCUyx+zcT+xF3I5fsUdPNdDc5/Ja7d0fxAgs/WgUjnBWhEVfd7B2yC3jZ
         eSkNKVb4b24A608PJ9HGj+c8DFNlXv+rI6w6QWyJYqMkYF0ua1L08AYmqQKNglAzY+r2
         lVYH14Fm3OABj7pSMNd3yZ9jm5jWHI3b6DkwCA52oLoSL+MbsjCQJfYzWXG+Tymbm90Y
         Imrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=gl8x4rAWRd8xfyPT4K5elIQEizFkl0MnikriyEOnKGk=;
        b=EnpmIPbn65zkbsEWo7nTVvXLkT8LDldl6RUgW262eLF8ZujUVhUbFmlqi0w4InsfZh
         8JWd6oT4sfXWUSY1fhJQMrdSWa/97Fv0io+hFxkYs1sbrF38g0G6dUuavGEx7uXztQ3G
         XVJ0HlZAwnTj+Yb64q9HD07wnDEYk3u3/5Fe88TUFCb5ZC6eL6xfb8UXgJuwna+E7rAh
         eFmpS9ewEs7fLbPSWmalOX/1vDvxcNA/wC8fqlF0NdXJXTJwnVc0TFmCZYXiiIMY3ZWD
         /Lx71QXX0WpQxIpPzsUB2NgKlqwzFNtKaVcGqCIKPXd2/1alqWmSinW2UCTmMJkrmHrp
         0z7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=dXJF2Ldd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v10-20020ae9e30a000000b00751324d4fbdsi50931qkf.379.2023.05.15.08.38.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 08:38:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20221208 header.b=dXJF2Ldd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyaH4-0005O8-5a; Mon, 15 May 2023 11:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pyaGz-0005NU-GK
 for qemu-arm@nongnu.org; Mon, 15 May 2023 11:38:05 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pyaGw-00046m-8J
 for qemu-arm@nongnu.org; Mon, 15 May 2023 11:38:03 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3f2548256d0so364785e9.1
 for <qemu-arm@nongnu.org>; Mon, 15 May 2023 08:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1684165081; x=1686757081;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gl8x4rAWRd8xfyPT4K5elIQEizFkl0MnikriyEOnKGk=;
 b=dXJF2LddttwVjhJWpqwyrg+V2ggF7eG4SBuSQ6jc90Qek5OocrpORUe8zG0d1LCNN8
 wK9aLTSidzP9FkfQ4DZvbufgPGtDzYcX8INrpb77niiUsuDyAtIOr0Bgt8TatbNObBRB
 TzC8bRIQoWZzDwrB0+kBmU0t55hamuF8JNKu5w5Ylvywoe5bEiVNKa2fGTVFsPXHUMAW
 j6mCnvKZBiMLouSOGTwfCMi/GS2mJrER8XxRcbVuYTdoDMiC1fYKAagBAlwWL4hR4dKl
 FKENUELyrHjzqh6+PNEfKr64s0RK9NAyqz+gQs0tcMpWWVXTzK1z5cJCqV4cHI0sWPpS
 UD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684165081; x=1686757081;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gl8x4rAWRd8xfyPT4K5elIQEizFkl0MnikriyEOnKGk=;
 b=MfYp/LS8TrvkOwtjMLhf4eOFKpBQoU8hapf+7AsfUb7Q+UbQ71uwmUUCNOyUSGl0Z9
 7/YQm1P/cHF/wAODtNMnzoJJ0INPVUMrJ0yHtix40d1JeUH/jjb8NJc7J1A058c4u19v
 RU2nZVOVBR54nwGNwsUkMSMkgkVALfB+sIUXluEDXxanCC4IFN86psppk/v+3WgDMXPb
 1GbIg12WgDVLwDIhtDJZeWhfBMT3c5LgEPN01iPD8Opdu13VD4s2rBD/WPUtf3sn7TIt
 ZVQ1X9bgc7V3KLBA1fbwJOzlSYRpHAjzYT98XeJDVK4swKZ8FjhcQLdhnvSmgCvHjxJs
 TCHA==
X-Gm-Message-State: AC+VfDzyn3T54Q/nZpJDcjYnp/6Cd95ZSxWDyUQAGgLX+fE2Ba4awWy8
 LYbud3aPW4eXQizrRhAlWQ2b9A==
X-Received: by 2002:a05:600c:3d93:b0:3f1:758c:dd23 with SMTP id
 bi19-20020a05600c3d9300b003f1758cdd23mr828283wmb.7.1684165080641; 
 Mon, 15 May 2023 08:38:00 -0700 (PDT)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 u4-20020a05600c00c400b003f4290720d0sm21166093wmm.47.2023.05.15.08.38.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 08:38:00 -0700 (PDT)
Date: Mon, 15 May 2023 15:37:55 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org, richard.henderson@linaro.org
Subject: Re: [RFC PATCH v3 05/10] hw/arm/smmuv3: Parse STE config for stage-2
Message-ID: <ZGJR0yYaIxfddu3j@google.com>
References: <20230401104953.1325983-1-smostafa@google.com>
 <20230401104953.1325983-6-smostafa@google.com>
 <c5b495d4-8679-8190-9966-d3ab82cb1a6d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c5b495d4-8679-8190-9966-d3ab82cb1a6d@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01, USER_IN_DEF_DKIM_WL=-7.5,
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
X-TUID: iDXq/QeEPi1v

Hi Eric,

Thanks a lot for taking the time to review the patches.

On Mon, May 15, 2023 at 03:03:28PM +0200, Eric Auger wrote:
> >  
> > +/* If stage-1 fault enabled and ptw event targets it. */
> > +#define PTW_FAULT_S1(cfg, event)            ((cfg)->record_faults && \
> > +                                             !(event).u.f_walk_eabt.s2)
> > +/* If stage-2 fault enabled and ptw event targets it. */
> > +#define PTW_FAULT_S2(cfg, event)            ((cfg)->s2cfg.record_faults && \
> > +                                             (event).u.f_walk_eabt.s2)
> > +
> > +#define PTW_FAULT_ALLOWED(cfg, event)       (PTW_FAULT_S1(cfg, event) || \
> > +                                             PTW_FAULT_S2(cfg, event))
> The name of the macro does not really reflect what it tests. I would
> suggest PTW_RECORD_FAULT and PTW_RECORD_S1|S2_FAULT
> I would also suggest (cfg->stage == 1) ?  PTW_RECORD_S1_FAULT(cfg,
> event) :  PTW_RECORD_S2_FAULT(cfg, event)
> 
> PTW_FAULT_S1() and PTW_FAULT_S2() are not used anywhere else.
> 
> I would simplify PTW_RECORD_FAULT(cfg)  (cfg->stage == 1) ?
> (cfg)->record_faults:  (cfg)->s2cfg.record_faults

Yes, this is much simpler.
I am wondering as stage-2 only SMMUs can have stage-1 faults as described in
(IHI 0070.E.a) "3.4 Address sizes".
If the input address of a transaction exceeds the size of the IAS.
I guess this means that the fault record in this case is still controlled by S2R
although it is stage-1 fault as there is no CD or stage-1 config.

Thanks,
Mostafa
