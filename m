Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp828975lfu;
        Wed, 27 Apr 2022 01:47:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxFNTyS7VnjPyfCCX3AEThIBW1Mc13Kc1c50EuQQjaohP6GNcfGqR7Y40BH/HSf9XU1PwdD
X-Received: by 2002:a05:6214:3007:b0:456:520f:70ab with SMTP id ke7-20020a056214300700b00456520f70abmr739090qvb.124.1651049220642;
        Wed, 27 Apr 2022 01:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651049220; cv=none;
        d=google.com; s=arc-20160816;
        b=vudf/M+/WaCJS9EHCKGRBQhH27VOWdcp7nJQYvQrODVPOtCooYilsqLkAL0lYRx5Yk
         azhRLa/qeZTUBzkPU2hkit1GUp4haCeny9+jBrYFVMNByPHjssWT3aCeHC5BQKBCyKhe
         kZHG8sTHI/56WwTorCANBDyRq9hltpSysgIcD34CcM6An1BbtOdzTajjqF/ZmHFzEYl2
         30iYrD7neMhnfAzeZeY3nRpzokLrF3/tSYNw0oPI6wun77EvrNQ+PRKZNafTFa3yRtOo
         tcBqcwcOj+ZbQZah7r8wAOwOeIeFGnjIHy9zoOUoihii99IYp/XCxVSrPMJ6Jy8Mi6vZ
         7EDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:to:from:date:dkim-signature;
        bh=RxCFzww6bYdXYDc3pwzE+Abs9JuJNWj96VKdAejKV9w=;
        b=r2DscBdYrq/HUYbK7IAxP+tbRD3pkMn56yGvAdztHWlAaFs2nQiKmMv0jo+iYbuO53
         sbLy1VoIiBsYrLpkq4gRRWTC+/i7SQM97kNUEhEY/0Egys1K52YmpiBsqCrA/Htia1Z7
         BHWn0Wnk1r+G+5mhvBECjzdGf0Z8TpQ95vp7psrFPEISkzXMgVBEBG9Lrh9Ns2XSJv4F
         MQbb3bVxuxVP2bb5nGigYUZeHOcdnVWYSQrGoEuN8xECwUbhmi7qz6ScRv7nVMS1DbkX
         2xuorRZO2BfSMQD/RtYVPnDPLIwIXObEUfGMFOwjxUyguxbgEfgnIQ6P/7Cdk/RVqT7d
         wooQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=7slJHXMN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j8-20020ac85c48000000b002f383f0416csi220601qtj.348.2022.04.27.01.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Apr 2022 01:47:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=7slJHXMN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njdK8-000872-2W
	for alex.bennee@linaro.org; Wed, 27 Apr 2022 04:47:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clabbe@baylibre.com>)
 id 1njd89-00072l-QJ
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 04:34:46 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46970)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <clabbe@baylibre.com>)
 id 1njd83-0006F4-KR
 for qemu-arm@nongnu.org; Wed, 27 Apr 2022 04:34:33 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i5so1390173wrc.13
 for <qemu-arm@nongnu.org>; Wed, 27 Apr 2022 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=RxCFzww6bYdXYDc3pwzE+Abs9JuJNWj96VKdAejKV9w=;
 b=7slJHXMNPC5yxhgxO6H7hKsoC57L4Nb9s0maIdVVAjmFAtZw5K7AE0SuCBFTceTugh
 HxnxvnFr27cjkCG6ZS23r79jIGb5eXaaFPU9CEdPCOOP1Rl/xN/1PZ8dqGgcQbGbLScd
 dtnSj6ed8baJymOJf7MFaHN6gFydDjEYk6ymyPdvDNZ7HhcOi2yi/5csYOW8HRIVpLoq
 7HqImcBpM7aPvwKSnQaJcXz90oBkQoFauEnN6d1VCZncC3/145vzLINcd9oFoMpeZnUj
 IuHdHLQGEP3FQN8ekPJBuUMbIL3GcebvIWBBXSBEOkAy+kTeq3D8Fl+jFcGy7hZKLqyg
 ln+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=RxCFzww6bYdXYDc3pwzE+Abs9JuJNWj96VKdAejKV9w=;
 b=HSI9jYupg1+u7O/IjgBszOoAHYUg6jFi5tLNvHmjxAp5e1gK0XzFRIkQSmJurGDX85
 rP+R4bDJmYN9HbSnqUdkgopMb+ruJezBpUF51S10CUCq6H1gOoFnfvvExLvGbrw1eXyL
 q/Q45T/LEVJtN3xuVr8gDACRO4rbSJV3ze9vCpFq/v4uqAx+BaIziVsCgG8HJG7zo1K0
 kbLr7wdqiC3uufmwv15LvTEv+/SqWAZ5D/62P2ueFRbZ9eRVnFbmSLzUn5KMSiZb0Dnp
 hcMYWtqXzJvQXgVgW7VQBVxDN9Tgm2YtFU4nmYNrXKHYgWaPu8bkvAbqpqrhm3yAUayK
 UQHw==
X-Gm-Message-State: AOAM530WwwibNRVBtfm9cHvzqcuzngE1+cBQ35tQ921ca02M5c7flYmF
 Za/X7BtWwIUnlihXnpv276GdRg==
X-Received: by 2002:adf:f809:0:b0:20a:c40d:ae9a with SMTP id
 s9-20020adff809000000b0020ac40dae9amr21436055wrp.609.1651048467312; 
 Wed, 27 Apr 2022 01:34:27 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
 by smtp.googlemail.com with ESMTPSA id
 u4-20020a5d6da4000000b0020a8c8d3e00sm13881269wrs.73.2022.04.27.01.34.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 01:34:26 -0700 (PDT)
Date: Wed, 27 Apr 2022 10:34:24 +0200
From: LABBE Corentin <clabbe@baylibre.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH] hw/crypto: add Allwinner sun4i-ss crypto device
Message-ID: <YmkAEEEuquXOpqzJ@Red>
References: <20220410191238.760733-1-clabbe@baylibre.com>
 <CAFEAcA9L89oN5nfM4RRxyYPBMtwbH1VfO1FbnXFUyC+rmzk51A@mail.gmail.com>
 <YmWgn2OGoZ9Uyirh@Red> <YmZ1pCU+0bP/LFPU@redhat.com>
 <YmacD3eroYTnjUdx@Red> <YmawTE9AfYxyaZoo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YmawTE9AfYxyaZoo@redhat.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=clabbe@baylibre.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: b.galvani@gmail.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RiDwu8cBjMev

Le Mon, Apr 25, 2022 at 03:29:32PM +0100, Daniel P. Berrangé a écrit :
> On Mon, Apr 25, 2022 at 03:03:11PM +0200, LABBE Corentin wrote:
> > diff --git a/crypto/hash-nettle.c b/crypto/hash-nettle.c
> > index 1ca1a41062..b9342b4fe1 100644
> > --- a/crypto/hash-nettle.c
> > +++ b/crypto/hash-nettle.c
> > @@ -26,10 +26,22 @@
> >  #include <nettle/sha.h>
> >  #include <nettle/ripemd160.h>
> >  
> > +#ifndef nettle_sha256_compress
> > +#define nettle_sha256_compress _nettle_sha256_compress
> > +void _nettle_sha256_compress(uint32_t *state, const uint8_t *input, const uint32_t *k);
> > +#endif
> > +
> > +#ifndef nettle_sha512_compress
> > +#define nettle_sha512_compress _nettle_sha512_compress
> > +void _nettle_sha512_compress(uint32_t *state, const uint8_t *input, const uint32_t *k);
> > +#endif
> 
> The 'nettle_sha256_compress' function doesn't exist in any header file
> from nettle that I've looked at.
> 
> The '_nettle_sha256_compress' function exists as a symbol in the .so
> library, but it is clearly not intended for public usage:
> 
> $ nm -a -D /usr/lib64/libnettle.so | grep sha256_compress
> 0000000000027730 T _nettle_sha256_compress@@NETTLE_INTERNAL_8_4
> 
> So this #define magic is definitely not something we can do.
> 
> IOW, unless I'm missing something, I don't think we can even
> use nettle for your desired goal, which leaves us no impl at
> all.

sha256 is only necessary for the upcomming sun8i-ce, so it do not block sun4i-ss.
I try to contact nettle to add necessary headers.

So for sun4i-ss, what do you think about my qcrypto_nettle_compress implementation ?
