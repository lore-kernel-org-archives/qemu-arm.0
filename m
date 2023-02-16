Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp467667ejb;
        Thu, 16 Feb 2023 04:59:01 -0800 (PST)
X-Google-Smtp-Source: AK7set8XV6uk/EqfwZquYCaNlYaS5gQdC6dE6L13LvJnU6meGpEEKzPhZk24CP6/QfE0jaqun24O
X-Received: by 2002:a05:6214:daf:b0:56e:b3dc:fe8c with SMTP id h15-20020a0562140daf00b0056eb3dcfe8cmr11015111qvh.28.1676552341757;
        Thu, 16 Feb 2023 04:59:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676552341; cv=none;
        d=google.com; s=arc-20160816;
        b=VcKUZk3jg9q7BMfEzHXz+AjqOxE6Qn2cdearmDIqBJSY8ZtK2XgOBRjvC3Esvjlr0i
         4J4Q5SaGMyeRZtvStNaxrE0K0y9CCErXK+JPKHg6gUYmAFolbls1eyneB2BjDjktGRm4
         jzWNhbys/9Y2ugdrR2tQfy9IGy2pCPBrlDOCrTrPK7Rjm22Mmg50i0r8Hs0LNcsX64Mm
         mBqmbcx1sdxPg8Gtwm1cs3SisLrTAAwZgIqNBZ+PituQqdtjoX04gCitp69Di5iJtdLj
         cOGYiNatQmqs3bG5Ydat5Y2NuOddJlGFSLDQVrAI/8huXM1ti8mOg5Um3v3/wSeictGS
         8Dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=t1bddwxU6wwx5dTZeUEYAjH4QHAKht2JsJAzeGfvEyQ=;
        b=LvEajWVKhbgQ4adicERnjfW3EryDn/9Biujx+XSv9uI5CkgcY/0GLmy2pj+wBHrWx7
         jugXQEO4aChbuneds92Jd9fNroz6QkvI6RpSvlyXA/ke5oPG+31dYvCUgzGH4A4Wok3v
         T54MA9yKScw1Y8wNq7A10aRHv8VS95FMA2iMVn+oUs853mBE4W68p/R8uUZsyDUUsHhj
         TCqTZJ7mp0rf5ELb/emqo9AiYGHNu2J1D5dHAd94BxvKFtXxcIliCKuSZmeNUvCdxIIO
         RAacOJ8AhGo7qqsdxK99p0xFZ4baAKGhwIICNnR1Wls6yAz8Yy+FrTzoPBJV+o7CHJMf
         yecQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=BCEY9v+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d12-20020ae9ef0c000000b0073b885556b0si1408671qkg.33.2023.02.16.04.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Feb 2023 04:59:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20210112 header.b=BCEY9v+V;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pSdqc-0006ld-DE; Thu, 16 Feb 2023 07:58:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdqY-0006kH-PU
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 07:58:46 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <smostafa@google.com>)
 id 1pSdqW-0007vq-8W
 for qemu-arm@nongnu.org; Thu, 16 Feb 2023 07:58:46 -0500
Received: by mail-wm1-x32e.google.com with SMTP id n36so776174wmr.1
 for <qemu-arm@nongnu.org>; Thu, 16 Feb 2023 04:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t1bddwxU6wwx5dTZeUEYAjH4QHAKht2JsJAzeGfvEyQ=;
 b=BCEY9v+VAhq8yrhd0YHSUuy2X1yNDg8bNp/UkQPBa7lWXaFMu0yA+FtU3Vgt4e1/WX
 EvHT5kgOyr9n6R5d5V+ZVaHZ4qzG+gUdq0uk3j1YjkLrxISIHSRGo+DRm1jnwnoV9aoO
 9iY8sKbDx1qo6iZPAcqBUIwxHMreYvKUFIg+BjHo+rPAviLSb3MA2nOJ0fH/HBbkFNR6
 MIkTqU70EdEt05dQgaJo+w9fIsnesmg+Rj6Tst7xfIaBD5/+IZ5LMLstEtjHxnaIyxFJ
 mdvT2WZDD7ksNPn5McD9XRalt1HIYzLxUmj2CQ5qagUmSO1WMaNyeXTuew8mTE6empux
 6U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t1bddwxU6wwx5dTZeUEYAjH4QHAKht2JsJAzeGfvEyQ=;
 b=6PqAVjk/IvXxh/xdf+bKH4SXFGGgRxeiMotB3zQslYx0YUvFBZCwrpuPGCh0xmnZ85
 Weu5om9C1+tZdXe5AMeMz3H5oOQdW/A/koOP+jCwvesEiF8p1cLsrmciL8JZl/XILTSf
 pc3/aXfB+IzVzKOrdhUI43LOwqQWzmQCT2Lo1DPMI7jVttglfqdCPT0VNRo/AOuSKeCu
 d8oVVdx+PRD1m9DpQlHS04h7VuQaE1MKr+d51UNQQnKRdxN6GBlJo7gbOS/r8JhhwEdf
 9Gns1M4zKUBVv6w1FdcNEjb8m6j22x+ZsBNHEJpQqdqFXVl2NkXaASjmyjEq7Ss5pMLM
 Zjvg==
X-Gm-Message-State: AO0yUKWbN4qhomohYSm4KtdI3Z85SfsNaDeexqR7nzHk0q+t/scFilNW
 2QhyvucS7mRbEjg4vxuzrFCxSw==
X-Received: by 2002:a05:600c:3ba6:b0:3dc:37b4:7983 with SMTP id
 n38-20020a05600c3ba600b003dc37b47983mr216721wms.0.1676552322521; 
 Thu, 16 Feb 2023 04:58:42 -0800 (PST)
Received: from google.com (44.232.78.34.bc.googleusercontent.com.
 [34.78.232.44]) by smtp.gmail.com with ESMTPSA id
 s5-20020adfeb05000000b002c54c0a5aa9sm1452780wrn.74.2023.02.16.04.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 04:58:42 -0800 (PST)
Date: Thu, 16 Feb 2023 12:58:38 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org, jean-philippe@linaro.org,
 peter.maydell@linaro.org, qemu-arm@nongnu.org
Subject: Re: [RFC PATCH 04/16] hw/arm/smmuv3: Add a system property to choose
 translation stage
Message-ID: <Y+4ofnf3wWKenB7T@google.com>
References: <20230205094411.793816-1-smostafa@google.com>
 <20230205094411.793816-5-smostafa@google.com>
 <c3b7d353-e7da-4048-6e47-5c16cddab350@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c3b7d353-e7da-4048-6e47-5c16cddab350@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=smostafa@google.com; helo=mail-wm1-x32e.google.com
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
X-TUID: kV0PsfqhIpG+

On Wed, Feb 15, 2023 at 05:29:04PM +0100, Eric Auger wrote:
> >
> > The property added arm-smmuv3.stage can have 3 values:
> > - "1": Stage-1 is only advertised.
> Stage-1 only is advertised

I will update it.

> > - "2": Stage-2 is only advertised.
> > - "all": Stage-1 + Stage-2 are supported, which is not implemented in
> > this patch series.
> >
> > If not passed or an unsupported value is passed, it will default to
> > stage-1.
> >
> > The property is not used in this patch as stage-2 has not been
> > enabled yet.
> Usually the user knob (ie. the property) is introduced at the last
> stage, ie. at 16/16.
I will split this commit, move the knobs to the end and keep features
definition as it is used by other commits.
I think it would also make sense to merge the knobs commit with last
one([RFC PATCH 16/16] hw/arm/smmuv3: Enable stage-2 support).


Thanks,
Mostafa
