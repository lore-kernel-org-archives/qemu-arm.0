Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp463692ejb;
        Thu, 16 Feb 2023 04:53:57 -0800 (PST)
X-Google-Smtp-Source: AK7set/axRptqQ1exE3u7hdalISChEXtWM42Wed6Yho6hKlmum0t8frRYRq77KQWvGb5fDYO0Uah
X-Received: by 2002:ad4:5cad:0:b0:56c:204e:473e with SMTP id q13-20020ad45cad000000b0056c204e473emr11460102qvh.3.1676552037704;
        Thu, 16 Feb 2023 04:53:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676552037; cv=none;
        d=google.com; s=arc-20160816;
        b=FhPBDY4cgIIqvGyE3Husg1wO5Bq6//Mm98zZVjvWhbl+Nb80EuDM4+5ZSUuuqSZRmx
         gK62vlYEsoteGCqGZVivS/ilsNX/jpK+YCsCETh27SvAd9HgTtG3fjCmnq02H8kB53Ta
         q2dabR7XSGsoXV/1DE/1GM29jZnp+omaMaULOQtfa7DVNqvlhipeR04gqku2+yNa493d
         lnIJ+bhZk8eKmwJpk9aeB8J78zFVMHSnWv62jDYOWmuX5KHfTdDiGejw9gh+nh2SnX/q
         ZtaDF5X3Ol6ky3JiWPWeWkpBV17n0IH3i1XlXgF/QX04nFtm+hzgPkWCi2IDA43HHAv6
         h7jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=a+qjDWSL4rGvjXMBfZfBL55ChqVeDMTznuCacNpFBnE=;
        b=qjlex96Eq21CES0veXrcPKA2tjtpb4OIozrTarFXEyvRmJB6fVAaOkLNYiBXcSO6tX
         81XpSZUgVroIaiKFl9jRWqmYSeb+k4S8dug/w3Scl6ak9aBgQa0at0nnvl4/UfoBU6vQ
         WaicGcGcXgHWJLVoD8bw+lGUfFWzMCDSu79eXPzk6qumS8szwCd56HqNE6io7bQ3Aycd
         hRsC97FGgDMoSv3d0/aD4DYih0MY8EN6eMEkfBaEQcAafAxY1X8SSz1Yd80jsSBWr/zS
         vkxa0uFs1fRgXyd58G0mX4mEMTEgFINYvo77yO2JvHvicwt1Tg6RgWlsPsWvroh21QbC
         pVKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Uq4uHA6k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r83-20020a37a856000000b0071da7c3811dsi1360692qke.643.2023.02.16.04.53.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 04:53:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=Uq4uHA6k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSdlb-0002nW-Dd; Thu, 16 Feb 2023 07:53:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdla-0002gf-1K
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 07:53:38 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdlY-0005Qo-CI
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 07:53:37 -0500
Received: by mail-wm1-x336.google.com with SMTP id z13so1504784wmp.2
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 04:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=a+qjDWSL4rGvjXMBfZfBL55ChqVeDMTznuCacNpFBnE=;
 b=Uq4uHA6km3V715+uSiTjOhr9/fEQraKGa78nqSheJmV2JxwcBXYKPI6cZke9BAP7ps
 3JLDXU+C/kzq4L3os4jP5s2SGsUC27uIYrJPL25QgkKk+YyQWMnwuX4f30dQ6WPHZIjW
 GSR1vkia4+Kuhcf93tB0azoKhkTQuE6n3btvFqxSbW1RNl40uiSE3SDEumQMJ/+ZhYqe
 ANJG7v2TwTVzDImYhHtfa1vo6GMXG/uFY1SjrghRhF8ht0wMzfNjWbLko3HSk8Ix9i+p
 xzZ3J+ma5IgsAs4mC7SiX1E0OTa64iGzZ+8EbkJgRPG+2v+UMpwTqOgMrvyfyl6cjYiR
 W5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a+qjDWSL4rGvjXMBfZfBL55ChqVeDMTznuCacNpFBnE=;
 b=fYz9DNpRFwzGpuyfsWpKJDr5cHCmMFcbEjsGXX99gjHcZg+OMDcKX3nLWOsL7U60f1
 ZI5odyR5o6M/6rSlpDVx5iM0kyf6fHX0u3K4ZZrvtRmJVw/1SpBuW5eUkKYgjlnC/rMA
 SEx8dser+HaKdIhv2dq/u9VCEaaE8ZAwwjsqyU31J/OlZ4EbJTqKtwOBzXraFCwXXSOs
 TRoZLRXu4F9bQxM9QblBNl21S4JB4SIyF5VSSBjex8nguTwNkxDlMENUoTX6Q1yUF4JH
 G6TDBY0MQVJGKl+jtvdIXCfuJed7losEekn3KA8OvrOBWjT0ig2bCqHn2B5amugHdeR3
 HCLQ==
X-Gm-Message-State: AO0yUKX4hM6uv77IGLW6ViyHGJpUqbYlVWEJHxb8sdgCFQ54Eo96XSfk
 JeLXR5g2tGTy9Fc4xNlRiqlFig==
X-Received: by 2002:a05:600c:5114:b0:3df:f3cb:e8cc with SMTP id
 o20-20020a05600c511400b003dff3cbe8ccmr167324wms.5.1676552014241; 
 Thu, 16 Feb 2023 04:53:34 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 t16-20020a05600001d000b002c56287bd2csm1413883wrx.114.2023.02.16.04.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:53:33 -0800 (PST)
Date: Thu, 16 Feb 2023 12:53:29 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 02/16] hw/arm/smmuv3: Update translation config to
 hold stage-2
Message-ID: <Y+4nSeT6Eq+ssD8W@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-3-smostafa@google.com>
 <d7f4e2cd-e60e-7187-105c-0e29b7745bbd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d7f4e2cd-e60e-7187-105c-0e29b7745bbd@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=smostafa@google.com; helo=mail-wm1-x336.google.com
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
X-TUID: UW5gmWyLfy9o

Hi Eric,

Thanks for taking the time to review the patches!

On Wed, Feb 15, 2023 at 07:57:59PM +0100, Eric Auger wrote:
> > In preparation for adding stage-2 support. Add it's configuration.
> replace "support. Add it's " by "support, add a S2 config struct,
> composed of the following fields and embedded in the main TransCfg ../.."

I will update it in V2.


> >
> > They are added as SMMUS2Cfg in SMMUTransCfg, SMMUS2Cfg hold configs
> > parsed from STE:
> >  -tsz: Input range
> >  -sl0: start level of translation
> >  -affd: AF fault disable
> >  -granule_sz: Granule page shift
> >  -vmid: VMID
> >  -vttb: PA of translation table
> >
> > They will be used in the next patches in stage-2 address translation.
> >
> > No functional change intended.
> >
> > Signed-off-by: Mostafa Saleh <smostafa@google.com>
> > ---
> >  include/hw/arm/smmu-common.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/include/hw/arm/smmu-common.h b/include/hw/arm/smmu-common.h
> > index c5683af07d..45f74d0e93 100644
> > --- a/include/hw/arm/smmu-common.h
> > +++ b/include/hw/arm/smmu-common.h
> > @@ -60,6 +60,16 @@ typedef struct SMMUTLBEntry {
> >      uint8_t granule;
> >  } SMMUTLBEntry;
> >  
> > +typedef struct SMMUS2Cfg {
> > +    uint8_t tsz;            /* Input range */
> > +    uint8_t sl0;            /* Start level of translation */
> > +    bool affd;              /* AF Fault Disable */
> > +    uint8_t granule_sz;     /* Granule page shift */
> > +    uint16_t vmid;          /* Virtual machine ID */
> > +    uint64_t vttb;          /* PA of translation table */
> > +} SMMUS2Cfg;
> > +
> > +
> >  /*
> >   * Generic structure populated by derived SMMU devices
> >   * after decoding the configuration information and used as
> > @@ -79,6 +89,7 @@ typedef struct SMMUTransCfg {
> >      SMMUTransTableInfo tt[2];
> >      uint32_t iotlb_hits;       /* counts IOTLB hits for this asid */
> >      uint32_t iotlb_misses;     /* counts IOTLB misses for this asid */
> > +    struct SMMUS2Cfg s2cfg;
> >  } SMMUTransCfg;
> >  
> >  typedef struct SMMUDevice {
> Eric

Thanks,
Mostafa
