Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp7796004eje;
        Thu, 20 Jul 2023 05:53:49 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF0E6+D/wkXnFXHCtSPwUBx10+clipeM+cpLK6FQ48NI9YjTsc2vBqzgQCAnS02SLd/VJAt
X-Received: by 2002:a05:622a:11ca:b0:403:b219:8548 with SMTP id n10-20020a05622a11ca00b00403b2198548mr7528176qtk.65.1689857629124;
        Thu, 20 Jul 2023 05:53:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689857629; cv=none;
        d=google.com; s=arc-20160816;
        b=mgFHIfelpTLJ5h0W5Kgns7F/jdUCg9pYu6jqvAYWS7pqakwZRJCPZb6HZA1I/Rikw7
         6ObaEamZ1IpvQEHpLKWuRTPeJdM4zr74jsXGMo+312aXoFLZsqfCh7+J5pVIo+zg120u
         ggMUc0XfIo5r5BfCiRC9wO4vV+50O+bWRofH5SWXLyNfpm10arCyVwmjYHTMmOqkLGCf
         aLqDxsPuqTAJNcmuRqJtqlLsUM/IkfdiVrh0jdn7RbT2DDH+DdIJs4T8mHhIuZ8Fs8sX
         fNR2r1aWfr27aHN5uaIEu/Q3GoN6tFtIk+Ip12uT/nZ5nJ+p8jnNV8NHtWkmbUAjdljt
         llbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9bybHgMXv13RWEb0qTGEFUV7z6cklckcq2Ahk9N/jGM=;
        fh=AUWhDBBcQJl/cpkEHjYZxji9DdAuAu9jPeTYApU/3e0=;
        b=FF+esTNvKxo+IpcEl3PlZlC02d+lHXKz1nnodvQrvzcg5cbiCGKJX723hdDWVrpksn
         fEMdCsQug2ZbMShVBaibYXRDzzDvqGaScrNw+JjxiYI3n0YQ5uA85KcxRrL1GFd9EG37
         El0KsRJkoGkVSHzMuoiE1iJCHHRJa/M7oRmspc+RiDIw1u3FpeM/gVekOAWVsQaHTiIS
         Nhd7D2kHq+r/jqqboaDmuSwgyYOA0q4LSQemr9FLb4TzuchMGSYDLNLhPTKK7hryxO5t
         A7n29Eg6YPNPDZAy8jJlXraac23aEuGuggWnhvEvKfRCIz38oQgPUgM07GUjd3MmsJ4U
         gHcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjfOidPb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020a05622a15c700b00403b1d1599asi340432qty.2.2023.07.20.05.53.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jul 2023 05:53:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bjfOidPb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qMT9v-0003n1-Ph; Thu, 20 Jul 2023 08:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qMT9u-0003ml-TJ
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 08:53:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qMT9t-0002iz-6d
 for qemu-arm@nongnu.org; Thu, 20 Jul 2023 08:53:30 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3fbc54cab6fso6036495e9.0
 for <qemu-arm@nongnu.org>; Thu, 20 Jul 2023 05:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689857607; x=1690462407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=9bybHgMXv13RWEb0qTGEFUV7z6cklckcq2Ahk9N/jGM=;
 b=bjfOidPbRP9NWOX5ykNT2gD8DyvVPxDd6xOrp+SCINyHvJMRU3dUby76qyzVLbj5ba
 AjDn10ynnD7gzPr0rmuFHq+46YDg4vx4h/dDi1biCHZ93De5gwXIkP4WZaVjKNY07K5F
 5Byz4tXPagdEF98X6C0kebg9rrzBb6Dy9lsf9JxpTWtiTBbs85xKKCmdGZ1Rpurusl0O
 V/oOM5ewPs/hXgWXkjq7DMyVreWIe3nS0KqDPlCm8KnpVjHWio5O7YNxUcvRk37j/dgp
 u12SipBquK2lpoIdxxWjCDj2yy3U4+VsgYDbD2r3RgdbwYKOfiyCzH/iTkspH03KhN06
 TQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689857607; x=1690462407;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bybHgMXv13RWEb0qTGEFUV7z6cklckcq2Ahk9N/jGM=;
 b=c3qqDRgz5ceAwrwISltYN3lQUKOtw8vek6yvPAaVbJN+SeaRNIAn2Nb0u64QKwNbpd
 bG+O0ghMpnYqzjnqfgX+YS9vZRS/I+0JayCLRbIOfFfIwcD/eXird5JbXymkcmjS4sYh
 FMxyTIc0CHJ0xkDWBnfasXG4sl/wrQi0nHgNdk1vpje1VqvwOU2okRYnW39BDQVvzqO+
 pTPfMAaKuW/ogMIaoFjzAVSkqWqLrEqV4Z650dRGuAsgwXEqAfgQpboQc+rGJ26/o7sS
 y9mmlcXjdzd54M/MGOgNQOmK1yP63sGj9IeR9ewc6VWz77KL41ZliaHPpwlGEmL7E6iU
 v/oA==
X-Gm-Message-State: ABy/qLbawg/fHYlcGEyIawyiwEE23RbjcE+sjgxpspUpb0EjzizW1Fs3
 4fjstcMeZP2GCP0CfsyhdyTyNw==
X-Received: by 2002:a05:600c:ad9:b0:3fc:1bd:95a6 with SMTP id
 c25-20020a05600c0ad900b003fc01bd95a6mr1676956wmr.31.1689857607287; 
 Thu, 20 Jul 2023 05:53:27 -0700 (PDT)
Received: from myrica ([2.219.138.198]) by smtp.gmail.com with ESMTPSA id
 m14-20020a7bcb8e000000b003fbc9371193sm1147093wmi.13.2023.07.20.05.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 05:53:27 -0700 (PDT)
Date: Thu, 20 Jul 2023 13:53:30 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [PATCH 0/5] target/arm: Fixes for RME
Message-ID: <20230720125330.GB59402@myrica>
References: <20230719153018.1456180-2-jean-philippe@linaro.org>
 <CAFEAcA9sfezZEHVXFT1bTA=1oiEy_ayc0xePJHPKVf87P3E-Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9sfezZEHVXFT1bTA=1oiEy_ayc0xePJHPKVf87P3E-Mg@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x32a.google.com
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
X-TUID: +2wd611pwIls

On Thu, Jul 20, 2023 at 01:05:58PM +0100, Peter Maydell wrote:
> On Wed, 19 Jul 2023 at 16:56, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > With these patches I'm able to boot a Realm guest under
> > "-cpu max,x-rme=on". They are based on Peter's series which fixes
> > handling of NSTable:
> > https://lore.kernel.org/qemu-devel/20230714154648.327466-1-peter.maydell@linaro.org/
> 
> Thanks for testing this -- this is a lot closer to
> working out of the box than I thought we might be :-)
> I'm tempted to try to put these fixes (and my ptw patchset)
> into 8.1, but OTOH I suspect work on Realm guests will probably
> still want to use a bleeding-edge QEMU for other bugs we're
> going to discover over the next few months, so IDK. We'll
> see how code review goes on those, I guess.
> 
> > Running a Realm guest requires components at EL3 and R-EL2. Some rough
> > support for TF-A and RMM is available here:
> > https://jpbrucker.net/git/tf-a/log/?h=qemu-rme
> > https://jpbrucker.net/git/rmm/log/?h=qemu-rme
> > I'll clean this up before sending it out.
> >
> > I also need to manually disable FEAT_SME in QEMU in order to boot this,
> 
> Do you mean you needed to do something more invasive than
> '-cpu max,x-rme=on,sme=off' ?

Ah no, I hadn't noticed there was a sme=off switch, that's much better

Thanks,
Jean

> 
> > otherwise the Linux host fails to boot because hyp-stub accesses to SME
> > regs are trapped to EL3, which doesn't support RME+SME at the moment.
> > The right fix is probably in TF-A but I haven't investigated yet.
> 
> thanks
> -- PMM
