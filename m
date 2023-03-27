Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2171621ejb;
        Mon, 27 Mar 2023 13:23:56 -0700 (PDT)
X-Google-Smtp-Source: AKy350a4yEFqdLVni15anL2FKk6bssBVc4IEmT3h5GGCOKb+uooEvj02Uhxeo8x8VXn9/lg8MpDe
X-Received: by 2002:ac8:5c4d:0:b0:3e4:e4fe:ac7 with SMTP id j13-20020ac85c4d000000b003e4e4fe0ac7mr9466625qtj.43.1679948636101;
        Mon, 27 Mar 2023 13:23:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679948636; cv=none;
        d=google.com; s=arc-20160816;
        b=yN/3D3ux2lrFSFc7Ay7JJPGK+6VHq/Et3niWpX3YF8cGnmFPWJwJmodfUoSXWk8/bv
         TL3HQzUOegnH3ZJ4yr5ZVeeeF2YEiiKQ9DJoORoxn+g8S6ozhoTK9XlpzjHW9puQwf2a
         ouX3Rn65Ql1TCg9Z0oKRyau9yVasw6cCn6I2aBSbVfm2vPfJWAl/KFMP03jSi05oRNhj
         puL20ZOM5cIx0BSNQcocjTBWi5j72RuFXiFu+PxbaSoINVQwbjCoH/4hctDJiFUWtQyH
         AJpUyZ663mjmLQEbnRLYudi3FpSy0YAc3nvj9/Ge3xEJBbku+t4LKEfqNR3qok0Qze4S
         aFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:in-reply-to
         :content-transfer-encoding:content-disposition:mime-version
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=ceBNBWo3Kh8hBs07kySAHpg67nlVz3ykdzXKAnkLwvM=;
        b=AdDjk+A7DQQkqguWXNmFZq1m/dtDzo0gsZlS0JVVf+S1wZM0E3vA4KmuEEABsDuP5D
         bSIrPpBo8Xn1Bo71YvgfvSc729cGes+BdIaRycinIWvl+SGJKFjspV7tWuk0AgCNpD6l
         CAcLqhciqizFrzBZFNMKPhYD2ZKjXMKdscxqqk8kPPYEN3H2o7FvKAKQ1BtLBM4DVkQI
         fLkbkDDL6MrhME8mwqdVc01EZERPh51CJMEFJK2rtW3wnZJTP1bmMQUv2rxUkuOPY08f
         NcBR6JX2XaImIvcdJz3s+RPmxF8l3XPBP+bmedvCghi9tCjpXVV93YEducCm3j3scMkI
         wv+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=CNtrQejT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v29-20020a05622a189d00b003d6cdb3f764si5113592qtc.373.2023.03.27.13.23.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Mar 2023 13:23:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=CNtrQejT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=acm.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pgtNZ-0006oR-Hn; Mon, 27 Mar 2023 16:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pgtNY-0006ns-13; Mon, 27 Mar 2023 16:23:44 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tcminyard@gmail.com>)
 id 1pgtNV-0004MJ-Mm; Mon, 27 Mar 2023 16:23:43 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 w13-20020a4aca0d000000b0053b8aa32089so1548395ooq.5; 
 Mon, 27 Mar 2023 13:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679948619;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=ceBNBWo3Kh8hBs07kySAHpg67nlVz3ykdzXKAnkLwvM=;
 b=CNtrQejTzXNB1VFbtLO4Xlkh0L19tJvuxeVH5PRtwOTlsOXqeGUWTsXXqE4AHxBIsp
 VS1xRhhZuLWN8Dp+8E/lb97K3V2R7OFlWMTWyEGZSHl6TTWpH4zKzUGtrJ2/JdalrZ+m
 1+kkGlHAAqk2WpPpLxAodpH15o/Aq8+4kYdKtk/LD6JH/3y7qZ8syGCbRR/X2BYudeDP
 2JZx7JhDtaVRLR+yJDboM0ADzW9Pniq5mwQlW8Izg73XHBOjZ3iPDss7srlYtYxgoiba
 W691VrsDEjgIgWDu/KgwJ4BwTjEXNRwdqzfbKkWwWpKVA8fIyd9WWkbjhUZNq1/arUws
 4tuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679948619;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:reply-to:message-id:subject:cc:to:from:date
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ceBNBWo3Kh8hBs07kySAHpg67nlVz3ykdzXKAnkLwvM=;
 b=lJN7fj/hWgz+IoKocHognGMoX6Wzklf554XvnTIIULVjnh/u4qN1wf3nkUEa+2v2fh
 Dm6WncdokFjXdBPbB1HtmAol5LPPXTHG/pfpFxK3KZUQIg6IWdmcfekyyxfyVh4LAWkC
 l6eW80WJJVl8j6YcWuiwaoLUZM0lz/NUuaCwmuckW9vsDg44bbg/rhx3usQYLmN4ZJ9f
 bPtFUUntbroDryixUC2V8H128I8k9Y7wWpb6698XeFUF9CpT5+vV0s0OG9Q91PdjXFCk
 atOhWUO+wKd/KkB/prYVLfnVvXwnxM2luAaCwSDrFKf/ODY5rgCSrn8Ai8yNxMybU8yd
 Bwgw==
X-Gm-Message-State: AO0yUKWZaMD1YjfdHKRHaqemjWUnVuK93I57xcIrdcR6iHtgoizx/nog
 HcloDsPeTbQEKE5y9XGw1w==
X-Received: by 2002:a4a:558b:0:b0:525:42c7:9a5f with SMTP id
 e133-20020a4a558b000000b0052542c79a5fmr8225033oob.6.1679948619433; 
 Mon, 27 Mar 2023 13:23:39 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
 by smtp.gmail.com with ESMTPSA id
 p45-20020a4a95f0000000b0051fdb2cba97sm11797804ooi.7.2023.03.27.13.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Mar 2023 13:23:38 -0700 (PDT)
Received: from minyard.net (unknown
 [IPv6:2001:470:b8f6:1b:7fea:b4f3:8d6d:64ca])
 by serve.minyard.net (Postfix) with ESMTPSA id E5CD7180044;
 Mon, 27 Mar 2023 20:23:37 +0000 (UTC)
Date: Mon, 27 Mar 2023 15:23:36 -0500
From: Corey Minyard <minyard@acm.org>
To: Hao Wu <wuhaotsh@google.com>
Cc: =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, venture@google.com, Avi.Fishman@nuvoton.com,
 kfting@nuvoton.com, hskinnemoen@google.com, titusr@google.com,
 peter.maydell@linaro.org, Joel Stanley <joel@jms.id.au>,
 Frederic Barrat <frederic.barrat@fr.ibm.com>
Subject: Re: [PATCH v2 4/7] hw/ipmi: Refactor IPMI interface
Message-ID: <ZCH7SHWzZrB92sva@minyard.net>
References: <20230324230904.3710289-1-wuhaotsh@google.com>
 <20230324230904.3710289-5-wuhaotsh@google.com>
 <29f7e479-2e2c-a9d6-d5f1-440cdfce0cb7@kaod.org>
 <CAGcCb13gHDdO=hqo_UztH1=BOZVMbXNYKNKcdVEZmqT8gBuBmg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGcCb13gHDdO=hqo_UztH1=BOZVMbXNYKNKcdVEZmqT8gBuBmg@mail.gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=tcminyard@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-To: minyard@acm.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CbSLIqqXlDPS

On Mon, Mar 27, 2023 at 10:11:50AM -0700, Hao Wu wrote:
> Hi, Cedric
> 
> The naming scheme is suggested by Corey in a previous review:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2021-09/msg02691.html
> 
> I originally kept "IpmIBmc" for the host side code talking to BMC but it
> might also cause confusion as well. I'm not sure which name is the best
> here. Maybe Corey can shed some light on this one? Thank you!

I agree with Cédric here, Bmc and BmcClient sound more clear than what I
proposed earlier.

-corey

> 
> Best Regards,
> 
> On Mon, Mar 27, 2023 at 5:34 AM Cédric Le Goater <clg@kaod.org> wrote:
> 
> > Hello Hao,
> >
> > On 3/25/23 00:09, Hao Wu wrote:
> > > This patch refactors the IPMI interface so that it can be used by both
> > > the BMC side and core-side simulation.
> > >
> > > Detail changes:
> > > (1) Split IPMIInterface into IPMIInterfaceHost (for host side
> > >      simulation) and IPMIInterfaceClient (for BMC side simulation).
> > > (2) rename handle_rsp -> handle_msg so the name fits both BMC side and
> > >      Core side.
> > > (3) Add a new class IPMICore. This class represents a simulator/external
> > >      connection for both BMC and Core side emulation.
> > > (4) Change the original IPMIBmc to IPMIBmcHost, representing host side
> > >      simulation.
> > > (5) Add a new type IPMIBmcClient representing BMC side simulation.
> > > (6) Appy the changes to  the entire IPMI library.
> >
> > 'IPMIBmcHost' is a BMC object model (internal or external) and
> > 'IPMIBmcClient' is a host object model ?
> >
> > [ ... ]
> >
> > > @@ -267,15 +267,15 @@ void pnv_bmc_set_pnor(IPMIBmc *bmc, PnvPnor *pnor)
> > >    * Instantiate the machine BMC. PowerNV uses the QEMU internal
> > >    * simulator but it could also be external.
> > >    */
> > > -IPMIBmc *pnv_bmc_create(PnvPnor *pnor)
> > > +IPMIBmcHost *pnv_bmc_create(PnvPnor *pnor)
> > >   {
> > >       Object *obj;
> > >
> > >       obj = object_new(TYPE_IPMI_BMC_SIMULATOR);
> > >       qdev_realize(DEVICE(obj), NULL, &error_fatal);
> > > -    pnv_bmc_set_pnor(IPMI_BMC(obj), pnor);
> > > +    pnv_bmc_set_pnor(IPMI_BMC_HOST(obj), pnor);
> > >
> > > -    return IPMI_BMC(obj);
> > > +    return IPMI_BMC_HOST(obj);
> >
> > QEMU PowerNV machines model the host side of OpenPOWER systems which
> > have an Aspeed SoC based BMC for management. The routine above creates
> > an Aspeed *BMC* object model for the PowerNV *host* machine. I find
> > 'IPMIBmcHost' confusing. It shouldn't have a 'Host' suffix I think.
> >
> > 'IPMIBmcClient' sounds ok, or 'IPMIBmcPeer' maybe.
> >
> > Thanks,
> >
> > C.
> >
> >
