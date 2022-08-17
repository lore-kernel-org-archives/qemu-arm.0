Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2528270ejf;
        Wed, 17 Aug 2022 09:40:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5lirqAFIfpEMBStcd1t+B8s2FaRpTDXPLPNi1jRsEaLg+Wn1jlHziKcQXup6lnPGcx+bur
X-Received: by 2002:ad4:5caf:0:b0:496:b2ee:3706 with SMTP id q15-20020ad45caf000000b00496b2ee3706mr899782qvh.58.1660754447179;
        Wed, 17 Aug 2022 09:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660754447; cv=none;
        d=google.com; s=arc-20160816;
        b=az1rwX7LGW31+4CucG6h9ZR22mM3KYT23mLNDlTzaSgORNoIeYmZ3Bo+ylJCXReZrR
         6+Aq1QsRmimzB4r2vQGIDgkTHNmM8yd6qtWzDRFnaC+4PKZAmFwuRuf474xgZfkVLMrL
         qfbsyw6Jp69ZJDYrWltPdMyxCxx3eeNNLbut8EiOWKKwE51I9a9RJwxfo9ZWGbnbe3Ir
         e0ekfB78BjWBJedSPTq4KInmg71i1nOsVRu4wJj1VXd+duvtSuZM4eRByoRaTBtbv5yQ
         s2ti0yLKjTJLZR7n4l8dMO6GAPSnK+YrRUf0W8jHHoVNB76Lq7qLaB6umSmb4SWmQPxI
         t0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=+z7WL3OU78+l64CVqn9lDlweQYh2NTBndlOcPbfyuyo=;
        b=yoztB+jvGhI1lkyrXPq1oajcuyfAtMN+oB/D//bHYk/n4NVZNTGicfKJtQK0Hxjj8N
         HPBRoK2q7zvYuvZl2vxloLGbEtJ7quH/T/kkADx7cj7e5vgEvFkmKJz9HuSZ1oJyI0Vv
         rt5hkMpBAoFXCrpAg5sWKKX/HhZjvEirMD6LDrnNO/05Uj+TvT/QKBAn9uZ3SGFatcCk
         xZEG7ZpcnYMshWmcZRB/QIb/0ME8v04M/MtTJsUuV5k23Y0zg1i08jMy6Z2KXhDlLrVh
         e4TBvljeiBP7OYOSGYvv1BC3BZTohq2traxmAf2UiHD0lje4pzl/c2oZDkIry6EfBsAV
         ZHww==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4-20020ac84cc4000000b003435c2e1c15si7460074qtv.79.2022.08.17.09.40.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Aug 2022 09:40:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:58750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oOM61-0006W7-J2
	for alex.bennee@linaro.org; Wed, 17 Aug 2022 12:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oOM0V-0000Dv-6o; Wed, 17 Aug 2022 12:35:05 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oOM0S-0008TS-71; Wed, 17 Aug 2022 12:35:02 -0400
Received: from fraeml741-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M7Cgf4sGSz67Lkw;
 Thu, 18 Aug 2022 00:11:26 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml741-chm.china.huawei.com (10.206.15.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 17 Aug 2022 18:16:20 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 17 Aug
 2022 17:16:20 +0100
Date: Wed, 17 Aug 2022 17:16:19 +0100
To: Dan Williams <dan.j.williams@intel.com>
CC: Bobo WL <lmw.bobo@gmail.com>, <linux-cxl@vger.kernel.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: Re: [BUG] cxl can not create region
Message-ID: <20220817171619.000021ca@huawei.com>
In-Reply-To: <62f5a2ffe8be0_3ce68294a4@dwillia2-xfh.jf.intel.com.notmuch>
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <62f132aee401b_1b3c294c@dwillia2-xfh.jf.intel.com.notmuch>
 <CAGr_yG389Bm_NL8CLgo_ZkGd4staocNENbtb-ULVA5vh_ywmcw@mail.gmail.com>
 <62f27a8e9acb6_1f18b294e2@dwillia2-xfh.jf.intel.com.notmuch>
 <62f5a2ffe8be0_3ce68294a4@dwillia2-xfh.jf.intel.com.notmuch>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
X-TUID: LPFgjBOJBcLu

On Thu, 11 Aug 2022 17:46:55 -0700
Dan Williams <dan.j.williams@intel.com> wrote:

> Dan Williams wrote:
> > Bobo WL wrote:  
> > > Hi Dan,
> > > 
> > > Thanks for your reply!
> > > 
> > > On Mon, Aug 8, 2022 at 11:58 PM Dan Williams <dan.j.williams@intel.com> wrote:  
> > > >
> > > > What is the output of:
> > > >
> > > >     cxl list -MDTu -d decoder0.0
> > > >
> > > > ...? It might be the case that mem1 cannot be mapped by decoder0.0, or
> > > > at least not in the specified order, or that validation check is broken.  
> > > 
> > > Command "cxl list -MDTu -d decoder0.0" output:  
> > 
> > Thanks for this, I think I know the problem, but will try some
> > experiments with cxl_test first.  
> 
> Hmm, so my cxl_test experiment unfortunately passed so I'm not
> reproducing the failure mode. This is the result of creating x4 region
> with devices directly attached to a single host-bridge:
> 
> # cxl create-region -d decoder3.5 -w 4 -m -g 256 mem{12,10,9,11} -s $((1<<30))
> {
>   "region":"region8",
>   "resource":"0xf1f0000000",
>   "size":"1024.00 MiB (1073.74 MB)",
>   "interleave_ways":4,
>   "interleave_granularity":256,
>   "decode_state":"commit",
>   "mappings":[
>     {
>       "position":3,
>       "memdev":"mem11",
>       "decoder":"decoder21.0"
>     },
>     {
>       "position":2,
>       "memdev":"mem9",
>       "decoder":"decoder19.0"
>     },
>     {
>       "position":1,
>       "memdev":"mem10",
>       "decoder":"decoder20.0"
>     },
>     {
>       "position":0,
>       "memdev":"mem12",
>       "decoder":"decoder22.0"
>     }
>   ]
> }
> cxl region: cmd_create_region: created 1 region
> 
> > Did the commit_store() crash stop reproducing with latest cxl/preview
> > branch?  
> 
> I missed the answer to this question.
> 
> All of these changes are now in Linus' tree perhaps give that a try and
> post the debug log again?

Hi Dan,

I've moved onto looking at this one.
1 HB, 2RP (to make it configure the HDM decoder in the QEMU HB, I'll tidy that up
at some stage), 1 switch, 4 downstream switch ports each with a type 3

I'm not getting a crash, but can't successfully setup a region.
Upon adding the final target
It's failing in check_last_peer() as pos < distance.
Seems distance is 4 which makes me think it's using the wrong level of the heirarchy for
some reason or that distance check is wrong.
Wasn't a good idea to just skip that step though as it goes boom - though
stack trace is not useful.

Jonathan






