Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp1777118lfc;
        Tue, 12 Oct 2021 06:06:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4QpBhCVY6Y5ihU6qkf1WeqIuBU0VH/112hUYIeZiR6OxnAqwd0y0zBjXUrJ1ez+ifDb9X
X-Received: by 2002:ad4:4ab1:: with SMTP id i17mr18573964qvx.19.1634043978041;
        Tue, 12 Oct 2021 06:06:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634043978; cv=none;
        d=google.com; s=arc-20160816;
        b=CDnpLVfL9DZ844hvhanH7y+qn2cQUkIn948gzO/bucdFzEz/TPZFS0RIpsYX4YNvcD
         VyGC3A6Epsqbc3q3J8Fwlv0BNhHzyqFYQOctqj8tlzlV5FLSo4Ty7FjKOfbinvF/9uWi
         EaR087yWIxgaKEMpP6iSAtnF8PxXzh6AG1d6GwoF27YzabxWWmC+K59YGe8AjiPB6/7y
         pQnb8/9z47o1UrlWW7vI0AvJ27rPM9CvCc47flC+e/3jS/CaS4736dp9hv6pxXqEDnB2
         4VnGOEmgVwL8o2TUDGbIF7BraV9D84eG7mNd4rddx8slMdxwC/TltMl0fUFqEzO359kD
         KnAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=U97xBi/cOvgiO1EGumQBHYbeHwpC/pJ7evrzNNJsrMw=;
        b=aeOiGxlT7Xx/mCQnR15/rcHEa1S5W2Lz6wu0tg+JQSSRowoOelmI+DTEs0zWEZwSUv
         HdKDR5vejK/0k1oAhD+LJzc1m9mgF03bvdcJycUcSJhdQYsmKwdOiBTbpIPOE548lKYl
         aKMZshXnRYoHgMVJbn923nIzaI0RQ4KZUm9GVv04zbaXE53EhShkc5vC0Z3s5TTeB2BE
         sOpQ6H5CD0a/bHa1/qK8gbnB+LuMpctzPWAGMzzJ6E2uBmHm+yB0JWpIb38kV47hp86j
         xG+mRtFa1UVPVz9IBtxjnPA4p24DG5EzIE9vJHRdst3S2wdxi2X9imJcGyqCQoFnwWWr
         DwSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R9s8nOpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si8971013qko.386.2021.10.12.06.06.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Oct 2021 06:06:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=R9s8nOpQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1maHU1-0004bz-Ff
	for alex.bennee@linaro.org; Tue, 12 Oct 2021 09:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maHTL-0004Yf-T6
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 09:05:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1maHTI-0007u5-Ai
 for qemu-arm@nongnu.org; Tue, 12 Oct 2021 09:05:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634043931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U97xBi/cOvgiO1EGumQBHYbeHwpC/pJ7evrzNNJsrMw=;
 b=R9s8nOpQc93lA67fl2Uc9O+TeJCtt/4g6KlLdywVWlGik+YphHtl+pnhK6stHFi5TcOmtJ
 SdRQE+MxskqnANBwa4Iz0aLKqvb2MPlq0KAnWksBEYjh0elU9sJMKjDMRnCZgWUt+OtuaW
 mMclabW+W8DX1lhof5sFNIZU2wMeTxQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-LMomQz_8PXOGr_fK-Hs0Xg-1; Tue, 12 Oct 2021 09:05:29 -0400
X-MC-Unique: LMomQz_8PXOGr_fK-Hs0Xg-1
Received: by mail-wr1-f71.google.com with SMTP id
 y12-20020a056000168c00b00160da4de2c7so12583206wrd.5
 for <qemu-arm@nongnu.org>; Tue, 12 Oct 2021 06:05:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U97xBi/cOvgiO1EGumQBHYbeHwpC/pJ7evrzNNJsrMw=;
 b=PoxxBjAfXm+bjXqqhk2qCUCEzviMTrTrZlNTpnDljzfBdxb4WbAd3QfgbPQ7f5/43V
 WCbp020aZFawjvnDFgU7Wpja9Whd4IJNpUb9IgvTUfjAdg4K49Xt78ych60wBZYhrksS
 J70VsQz3sAbWPBalwpMdkZQ9AtQIY7sHZxbodBPArZji1Az96A9BruszY2HTefGMexpE
 vwBGwZ4qpUNF1GFbB0irfoOrDx26mx/C17vhGXVzeb+3BAYe10T/fQFsMXKibhy6vARo
 UgHC0b5Z9kCshNentlcQhEsay0tj7+XmEBEQcLlH89SHDaevnBIw30XPLMzsi05CCDVL
 LX+A==
X-Gm-Message-State: AOAM530w/HWnQZFGg+fIJdMYQlvXLfdKoj1BsrETGKeNZpcfpSp8Te+x
 yzr6pfvXskhOzAaqvGmAINDV44X1sZhGj00RT1pEIs76GFtUejaFo4B+tdjOXKAFbGWMPdXznbJ
 jKfExhiRXt9FN
X-Received: by 2002:a1c:a302:: with SMTP id m2mr5381717wme.111.1634043927560; 
 Tue, 12 Oct 2021 06:05:27 -0700 (PDT)
X-Received: by 2002:a1c:a302:: with SMTP id m2mr5381685wme.111.1634043927344; 
 Tue, 12 Oct 2021 06:05:27 -0700 (PDT)
Received: from gator (nat-pool-brq-u.redhat.com. [213.175.37.12])
 by smtp.gmail.com with ESMTPSA id w5sm10648462wra.87.2021.10.12.06.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 06:05:26 -0700 (PDT)
Date: Tue, 12 Oct 2021 15:05:25 +0200
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH 1/2] numa: Set default distance map if needed
Message-ID: <20211012130525.ubzeatio4kntidqj@gator>
References: <20211006102209.6989-1-gshan@redhat.com>
 <20211006102209.6989-2-gshan@redhat.com>
 <20211012114016.6f4a0c10@redhat.com>
 <669adddb-5603-ed67-bc75-21bf4f68f186@redhat.com>
 <20211012114802.u3og3lmei35qacpx@gator>
 <20211012143430.17b7ca99@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211012143430.17b7ca99@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Gavin Shan <gshan@redhat.com>,
 ehabkost@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 shan.gavin@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G7pEh1tLa6og

On Tue, Oct 12, 2021 at 02:34:30PM +0200, Igor Mammedov wrote:
> On Tue, 12 Oct 2021 13:48:02 +0200
> Andrew Jones <drjones@redhat.com> wrote:
> 
> > On Tue, Oct 12, 2021 at 09:31:55PM +1100, Gavin Shan wrote:
> > > Hi Igor,
> > > 
> > > On 10/12/21 8:40 PM, Igor Mammedov wrote:  
> > > > On Wed,  6 Oct 2021 18:22:08 +0800
> > > > Gavin Shan <gshan@redhat.com> wrote:
> > > >   
> > > > > The following option is used to specify the distance map. It's
> > > > > possible the option isn't provided by user. In this case, the
> > > > > distance map isn't populated and exposed to platform. On the
> > > > > other hand, the empty NUMA node, where no memory resides, is
> > > > > allowed on ARM64 virt platform. For these empty NUMA nodes,
> > > > > their corresponding device-tree nodes aren't populated, but
> > > > > their NUMA IDs should be included in the "/distance-map"
> > > > > device-tree node, so that kernel can probe them properly if
> > > > > device-tree is used.
> > > > > 
> > > > >    -numa,dist,src=<numa_id>,dst=<numa_id>,val=<distance>
> > > > > 
> > > > > So when user doesn't specify distance map, we need to generate
> > > > > the default distance map, where the local and remote distances
> > > > > are 10 and 20 separately. This adds an extra parameter to the
> > > > > exiting complete_init_numa_distance() to generate the default
> > > > > distance map for this case.
> > > > > 
> > > > > Signed-off-by: Gavin Shan <gshan@redhat.com>  
> > > > 
> > > > 
> > > > how about error-ing out if distance map is required but
> > > > not provided by user explicitly and asking user to fix
> > > > command line?
> > > > 
> > > > Reasoning behind this that defaults are hard to maintain
> > > > and will require compat hacks and being raod blocks down
> > > > the road.
> > > > Approach I was taking with generic NUMA code, is deprecating
> > > > defaults and replacing them with sanity checks, which bail
> > > > out on incorrect configuration and ask user to correct command line.
> > > > Hence I dislike approach taken in this patch.
> > > > 
> > > > If you really wish to provide default, push it out of
> > > > generic code into ARM specific one
> > > > (then I won't oppose it that much (I think PPC does
> > > > some magic like this))
> > > > Also behavior seems to be ARM specific so generic
> > > > NUMA code isn't a place for it anyways
> > > >   
> > > 
> > > Thanks for your comments.
> > > 
> > > Yep, Lets move the logic into hw/arm/virt in v3 because I think simply
> > > error-ing out will block the existing configuration where the distance
> > > map isn't provided by user. After moving the logic to hw/arm/virt,
> > > this patch is consistent with PATCH[02/02] and the specific platform
> > > is affected only.  
> > 
> > Please don't move anything NUMA DT generic to hw/arm/virt. If the spec
> > isn't arch-specific, then the modeling shouldn't be either.
> 
> 
> > If you want to error-out for all configs missing the distance map, then
> > you'll need compat code.
> 
> > If you only want to error-out for configs that
> > have empty NUMA nodes and are missing a distance map, then you don't
> > need compat code, because those configs never worked before anyway.
> 
> I think memory-less configs without distance map worked for x86 just fine.

Ah, yes, we should make the condition for erroring-out be

 have-memoryless-nodes && !have-distance-map && generate-DT

ACPI only architectures, x86, don't need to care about this.

> 
> After looking at this thread all over again it seems to me that using
> distance map as a source of numa ids is a mistake.

You'll have to discuss that with Rob Herring, as that was his proposal.
He'll expect a counterproposal though, which we don't have...

Thanks,
drew

