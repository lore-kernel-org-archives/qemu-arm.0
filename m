Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp2971036ejb;
        Mon, 18 Sep 2023 08:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFflUujOmqyXuUIgarjI08Ml/EqzSa/svOIxTCVl4wDqPME9P6JNi4My6qlEBYmBKvPrKqY
X-Received: by 2002:a05:6122:420f:b0:495:e18f:67cb with SMTP id cm15-20020a056122420f00b00495e18f67cbmr6615777vkb.7.1695049407933;
        Mon, 18 Sep 2023 08:03:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695049407; cv=none;
        d=google.com; s=arc-20160816;
        b=rCGbBORqprW46MIPXKtE4jtNJAss7IsgVifFb6S/2vMpVAnRRICh1MO26vxDwOzOuU
         IFNGtAgJkOddTnSVjKvBBjjjQ3GQFLWsnI4fpZC6bYcRWkV8ilgubb4bdgyfCgz3Koye
         G2zP7CCnxP6kqXvxrPayFESbu2z3P4XOwWxaT56k++tJc+RMeA9WkXrxKlHjjHcaG0nB
         PdooiaJEG8FH+3z3jW+1BERexSyLZvxThgjQ9bTo0IIVWu+KrjWdrtFxp1ypHDAwu+nP
         2qZlBQt+EOih8vSLu5W4iTyr2mfOELGQ5qsFDc3alFk4FDC6mZdgPYTYRHUbdw9uUZAz
         8fZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=ftz9A2DUXPjViIo1RhcqLiiBB/OaXpqAcUK2JUCr2yw=;
        fh=/uDWztHlYbsbjUkcgYoXAPDloHst/2NsW0P60g26yZA=;
        b=Gc7xdWVx9+AW0IYsOAGsN5GFrZFxktdxlYw6lpZYFoj+5rbJ58r5vaDVtIfCzqj1tu
         F5l4g8BM9VaDYBN5ZbT6CHX/JACfnXPp8SYlEf7RY7jKpEmOnd0us9JPgbZ3t0ufYyNO
         +JH1jbXgFf4FdxU0s+anvSqkr3VzUI+x+iryhAWqM415s6pOt9cFvDU5ZF9KiFo9q3RM
         M940kZcqPRzDLUcUbaokOgxGE4oVuiRNjAX1+YPtarUZqZLvUUcCZ3pEr20Dql0FCKY3
         vCovzHntctzRWjTxl20rUtvarMonOxWUlQAevEr8ispvmuyE3e5ekyNFvgK4Iq2DNgsC
         UaKg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f7-20020a1f1f07000000b00496c3c9b696si109057vkf.123.2023.09.18.08.03.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Sep 2023 08:03:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qiFmR-00063z-AC; Mon, 18 Sep 2023 11:03:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qiFmG-0005eE-Qm; Mon, 18 Sep 2023 11:03:09 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qiFmE-0006ul-OZ; Mon, 18 Sep 2023 11:03:08 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rq7G123SMz6J7sv;
 Mon, 18 Sep 2023 22:58:17 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 18 Sep
 2023 16:03:03 +0100
Date: Mon, 18 Sep 2023 16:03:02 +0100
To: Peter Maydell <peter.maydell@linaro.org>
CC: Gregory Price <gregory.price@memverge.com>, Yuquan Wang
 <wangyuquan1236@phytium.com.cn>, qemu-arm <qemu-arm@nongnu.org>, qemu-devel
 <qemu-devel@nongnu.org>
Subject: Re: A confusion about CXL in arm virt machine
Message-ID: <20230918160302.000059a2@Huawei.com>
In-Reply-To: <CAFEAcA8beGka0AzEkX4SE1B+UwFpck2_0gWM9bV5WgFbWQYB1A@mail.gmail.com>
References: <2023061615433049315231@phytium.com.cn>
 <ZIylkIt38MXaTytx@memverge.com>
 <20230619105809.000007b9@Huawei.com>
 <CAFEAcA8beGka0AzEkX4SE1B+UwFpck2_0gWM9bV5WgFbWQYB1A@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: cjuP3x204vEx

On Mon, 18 Sep 2023 13:41:20 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 19 Jun 2023 at 10:58, Jonathan Cameron via <qemu-arm@nongnu.org> wrote:
> >
> > On Fri, 16 Jun 2023 14:10:24 -0400
> > Gregory Price <gregory.price@memverge.com> wrote:  
> > >
> > > Last I tested cxl-2023-05-25 branch of Johnathan's fork is working on x86:
> > >
> > > https://gitlab.com/jic23/qemu/-/tree/cxl-2023-05-25
> > >
> > > I have not worked with the ARM machine, but Johnathan may be able to
> > > comment on the state of ARM support for this code.  
> >
> > ARM support is not yet upstream.  There are some precursor problems we still
> > have to solve because arm-virt should also support device tree bindings.
> > See talk I gave at Linaro connect that includes some of them:
> > https://resources.linaro.org/en/resource/hM986DSHfoTrZ98UjpvLg1
> >
> > For now, I'm carrying the arm-virt + ACPI support on the tree above.
> > There are a lot of things we still need to provide support for in QEMU CXL
> > world so for now figuring out the path forward for upstreaming ARM support
> > isn't at the top of my list.  I'll get back to it at somepoint - probably
> > next month.  
> 
> Is the Arm CXL support still out-of-tree? I ask because at the
> moment docs/system/devices/cxl.rst has some aarch64 virt command
> lines which don't work, and we've had a bug report about it:
> https://gitlab.com/qemu-project/qemu/-/issues/1892

It's still blocked on device tree support...
Step 1 to fixing that is working out that PXB device tree enumeration
dance. I've not yet had time to look at whether we can do
more of the enumeration part in the OS.

> 
> Could you submit a patch to correct the documentation, please
> (either fixing the command line, or just deleting any claims
> to aarch64 support if it's not upstream) ?

Strange, I thought we'd long fixed the docs for this.
Gah, I messed up a rebase of Gregory's series adding multiple
region support and put some back in again.

I'll roll this fix into a little series with some others I have queued up
and post it in a few minutes.

Jonathan





> 
> thanks
> -- PMM
> 

