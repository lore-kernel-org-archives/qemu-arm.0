Received: by 2002:a19:87d7:0:0:0:0:0 with SMTP id j206csp526876lfd;
        Wed, 27 Jan 2021 21:36:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzoFWfpmHLnnqOzHfsq/uHZ4UVrsHqHvie5jlN1BpZnFheu96oGtKYPNdHx2LIIL2AQR4/v
X-Received: by 2002:a25:b8ca:: with SMTP id g10mr19689723ybm.517.1611812207055;
        Wed, 27 Jan 2021 21:36:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611812207; cv=none;
        d=google.com; s=arc-20160816;
        b=eNS/RmDFiWcRFa1jDwAvqF3jAT6SIzfEmzdWfIT25Sn3pceTyw+vGsuRV8ydj9MZOB
         lpSJRk8V+rXAYz7qja2L77zoJ6RbvdILJc0pKMpZ6RnHxk/+2/pNN0E8i9fkYyL3q+Gm
         CacnHm9P5qKF/XI5e4MSSCe3T3Mgr5tBapUGOiuu/szuIxjgl5WNOuL19iXL+0qcJyZa
         qSaRFPQ/hzY7jofncNY393rbrH4sM8pZv1dsjzxpx00QWa3rsZhO2agzJvKn9C05ozSz
         RFcjnPq56fQX1T94sbrP7zisrx8VgJhm3uVPBwVhFkvHlMCEYgoru3A3iDsfV0gO/Ij1
         y6eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:to
         :from:date:dkim-signature;
        bh=aRw96ERqpc5bouPiFb0ZAt+PI6A6RczOQ7As+kjj0s0=;
        b=CrwCMQJ3SBjQjQ9OG6sOXXRDbxSJwQPTBQnlCmAY/nWotkxY46TMYNbUGcWqbho+Ds
         2ErUDHq2q98YjLGmbpNINvUk90mmyfsFurUWYJS7+rG076dBJRIetHpcXVTvzqhXsTLZ
         AcNeqWqohVJPDpHu7Js4uSbyLSYyALPfiQ4lb6mTKBBosLRstNozsCO4WZ8XCDaVbL4C
         smsJZ2m0tizsyjXzNhp5utrjdUY4vsa2jXnJJkYKL1IQNDVpBLIV/IpFet/l1Mf48FUa
         yW/Mh2vMqFn9fOOzDVmZ+GetpMdDZYlJDyWCsog5VL5qcy0x9QN6jedcEV1+pWYtXqvp
         aC2Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SBOVZ4BV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v11si4200654ybp.35.2021.01.27.21.36.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 27 Jan 2021 21:36:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SBOVZ4BV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l4zz4-0006kc-GB
	for alex.bennee@linaro.org; Thu, 28 Jan 2021 00:36:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4zyx-0006kS-Bq; Thu, 28 Jan 2021 00:36:39 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:35278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1l4zyv-00084D-M0; Thu, 28 Jan 2021 00:36:39 -0500
Received: by mail-oi1-x22f.google.com with SMTP id w8so4872523oie.2;
 Wed, 27 Jan 2021 21:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:reply-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=aRw96ERqpc5bouPiFb0ZAt+PI6A6RczOQ7As+kjj0s0=;
 b=SBOVZ4BVgX+Aih5wZczrImzCFPUAoPqjt2ZDBDDFPYUBRQAnyVFMbXhCqIoSbVjw3T
 p/aIXMQaspFJTrh9qB2K1LrGwR8ih8+w8jv3jpgfL/iAhYslRLsBrCkll/2WyWa/jRmv
 wBjSS9xdszTooyHso1+s1rEjhj1jirFNy11QIsLaRX6HkdIyoeWgtU6yJHh8bW1xmFT/
 KsZnv2HdaBU161xwt06DQ/DVzvK7b1Tz8hPDvzxMb5B4wxy0dT4R9KjbBb/tB0Vh41Ro
 ZNH5v7bzPQON/ZpPDUd1PUlwKpg0TnA27PQWGBrqGLbmQDcW4kx9naszFNjaqM3f9wnv
 Jfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :reply-to:references:mime-version:content-disposition:in-reply-to;
 bh=aRw96ERqpc5bouPiFb0ZAt+PI6A6RczOQ7As+kjj0s0=;
 b=k2HsRZ1avDfQUVFRwARAv1+nz62lgqnzkrxzRNgrj8QNXQnQPHzGpkYUojY64r/a15
 jFELCBp0sZb59mw9QSMq38WL8xQ7L8fzTabUDBSZ232a4+l+h5QyW/Q0raRj2uLoalzz
 vza0OPC8aF9gN2+Gt0PZW4J3lI0XvRIhn3NfzpGlPN5rff1L9S9md1YqqrS8RskY5mBv
 qAVGE1KiZ8DDwkyVW9OosWeEfk+3/VYouf4MA58IO8HHLqDEh0OLQntf9wu/rHjch2Gb
 qocnAbzutYoTKw7i0NRBKcIyRaUE6mkYQnzWalCIyGHiKnU8xHZu5+diSJqbLV0NWCca
 mOrg==
X-Gm-Message-State: AOAM532ys6gk2llC+9c1hp1DgecwTxn7G2vzJ7+BSI5T34QZbLje8xkQ
 +aQNmEU6XfS6OlhvGLCAGA==
X-Received: by 2002:aca:618b:: with SMTP id v133mr5797716oib.98.1611812196187; 
 Wed, 27 Jan 2021 21:36:36 -0800 (PST)
Received: from serve.minyard.net ([47.184.170.156])
 by smtp.gmail.com with ESMTPSA id m7sm815945otq.33.2021.01.27.21.36.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 21:36:35 -0800 (PST)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:d0e0:7e1d:debb:57fe])
 by serve.minyard.net (Postfix) with ESMTPSA id B817A180042;
 Thu, 28 Jan 2021 05:36:33 +0000 (UTC)
Date: Wed, 27 Jan 2021 23:36:32 -0600
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Subject: Re: [PATCH 6/6] hw/i2c: Implement NPCM7XX SMBus Module FIFO Mode
Message-ID: <20210128053632.GG2057975@minyard.net>
References: <20210126193237.1534208-1-wuhaotsh@google.com>
 <20210126193237.1534208-7-wuhaotsh@google.com>
 <20210126234724.GC2057975@minyard.net>
 <CAGcCb12nJAMnZ+eaWC6n08hAFAVueCknSWzbEYFPp+GUApoRdg@mail.gmail.com>
 <20210127214251.GE2057975@minyard.net>
 <CAGcCb13N+0wtmkH4Q4rZowrpPBn_KkOae3GgZokC4B1bGi-emg@mail.gmail.com>
 <20210127233724.GF2057975@minyard.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210127233724.GF2057975@minyard.net>
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=tcminyard@gmail.com; helo=mail-oi1-x22f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: minyard@acm.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 Doug Evans <dje@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gkCj2bZzyoRq

On Wed, Jan 27, 2021 at 05:37:25PM -0600, Corey Minyard wrote:
> On Wed, Jan 27, 2021 at 01:59:07PM -0800, Hao Wu wrote:
> > >
> > > There is also the question about who takes these patches in.  I'm the
> > > I2C maintainer, but there's other code in this series.  Once everything
> > > is ready, I can ack them if we take it through the ARM tree.  Or I can
> > > take it through my tree with the proper acks.
> > >
> > I think either  way is fine. Previous NPCM7XX patch series were taken in
> > the ARM tree. But as i2c code taking into your tree is also fine.
> > 

Let's go through the ARM tree, then.  So you have an:

Acked-by: Corey Minyard <cminyard@mvista.com>

For patches 2 and 6.

Patch 4 still has the issue with the eeprom size.  If you are expecting
a 32K eeprom to work, it's not going to, you are only going to get 256
bytes.

-corey
