Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp646996ejf;
        Thu, 11 Aug 2022 10:09:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4yM4qER9BrYAP3fnNhjZdtyqKp8rvV0L5axLM79BX1t3iLdvkBlwiNVmcdcmRjU0EkOh/R
X-Received: by 2002:a05:620a:1583:b0:6b9:56f4:e486 with SMTP id d3-20020a05620a158300b006b956f4e486mr13979717qkk.464.1660237770352;
        Thu, 11 Aug 2022 10:09:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660237770; cv=none;
        d=google.com; s=arc-20160816;
        b=pSY4p5pIY0JuR+Nz8p8KeQdAOJCWFlDTh800MX17yY4oc8pBsEHVzJx1JooWIHH70Z
         6SkjogQLEc08+2nId20j0U6rrVsrJ+//Vf2u2HB9hsVORpYB4ZhhtxRDaefEJLFvDes9
         +3H3J0MZVNFjDrOEY2HSGSx+16EX+bzAQLlXRlNrqe3+Or5pXetaV75VRJMWK9kxBBn6
         4X3mfdenXgY9ldhr2CwX2hfyJT6ootEtkidkB518gAs9ezw8WBVZHfoITYpYTVqlQGky
         77vT0mqSzYwDQlRykkQaQUetRd7csl+RGV+D3bY4aHEg8TzLV8aRcLF5cmfS17XiOE2k
         c2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=FltEWhuuBzO6Lcpl052qiEMN0bkI7cuJiPAt6qBPWyY=;
        b=oV4YbU0pnpV+OrEg/k/0foIaawShdXW9Sr4fr0EV+Vusjt+ZG9N5x/7iUcfkAO6dSh
         AGvsDEAGQoDr+/lVUXSILpiHZBR9+alNUGTLZjqyI7d+R2sk82bGvsJayt02fmB5Po4W
         lIdt7P5MEFOb3Re3X4xq6D0uiHw+qDZ7EL/SV36thBlWAprqk5RtWA2VUEjHlDzpe/U0
         IEwpYp+0vG8psyq2QQI8YVoG7E6tQhE1ZvOfyeEM1GP3INFTPNDMrhy7IknAPLl11mam
         KQZA1b60S8q/Y79dHLJZHK3mGVAmnF4jm7QBSbcJCywxE2qSQDFMkgjz+3PqXx13RCkJ
         IAPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hr13-20020a05621423cd00b004744f5b5c1esi1514176qvb.119.2022.08.11.10.09.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Aug 2022 10:09:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:58362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMBgX-0000UE-SP
	for alex.bennee@linaro.org; Thu, 11 Aug 2022 13:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oMBgJ-0000SI-DL; Thu, 11 Aug 2022 13:09:15 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oMBgG-00088s-Ci; Thu, 11 Aug 2022 13:09:15 -0400
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M3YDj3T2Cz67ZHP;
 Fri, 12 Aug 2022 01:08:53 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Thu, 11 Aug 2022 19:08:58 +0200
Received: from localhost (10.202.226.42) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 11 Aug
 2022 18:08:58 +0100
Date: Thu, 11 Aug 2022 18:08:57 +0100
To: Bobo WL <lmw.bobo@gmail.com>
CC: <linux-cxl@vger.kernel.org>, <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
Subject: Re: [BUG] cxl can not create region
Message-ID: <20220811180857.00005e67@huawei.com>
In-Reply-To: <20220809170825.00001b61@huawei.com>
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <20220808133727.00001171@huawei.com>
 <CAGr_yG36GSO8esyO9nn6OeOEN5zPSosEmBHbfYGwqNGiYOh9vw@mail.gmail.com>
 <20220809170825.00001b61@huawei.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.226.42]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
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
X-TUID: YkrE0zsFcJ0y

On Tue, 9 Aug 2022 17:08:25 +0100
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Tue, 9 Aug 2022 21:07:06 +0800
> Bobo WL <lmw.bobo@gmail.com> wrote:
> 
> > Hi Jonathan
> > 
> > Thanks for your reply!
> > 
> > On Mon, Aug 8, 2022 at 8:37 PM Jonathan Cameron
> > <Jonathan.Cameron@huawei.com> wrote:  
> > >
> > > Probably not related to your problem, but there is a disconnect in QEMU /
> > > kernel assumptionsaround the presence of an HDM decoder when a HB only
> > > has a single root port. Spec allows it to be provided or not as an implementation choice.
> > > Kernel assumes it isn't provide. Qemu assumes it is.
> > >
> > > The temporary solution is to throw in a second root port on the HB and not
> > > connect anything to it.  Longer term I may special case this so that the particular
> > > decoder defaults to pass through settings in QEMU if there is only one root port.
> > >    
> > 
> > You are right! After adding an extra HB in qemu, I can create a x1
> > region successfully.
> > But have some errors in Nvdimm:
> > 
> > [   74.925838] Unknown online node for memory at 0x10000000000, assuming node 0
> > [   74.925846] Unknown target node for memory at 0x10000000000, assuming node 0
> > [   74.927470] nd_region region0: nmem0: is disabled, failing probe  
> 
> Ah. I've seen this one, but not chased it down yet.  Was on my todo list to chase
> down. Once I reach this state I can verify the HDM Decode is correct which is what
> I've been using to test (Which wasn't true until earlier this week). 
> I'm currently testing via devmem, more for historical reasons than because it makes
> that much sense anymore.  

*embarassed cough*.  We haven't fully hooked the LSA up in qemu yet.
I'd forgotten that was still on the todo list. I don't think it will
be particularly hard to do and will take a look in next few days.

Very very indirectly this error is causing a driver probe fail that means that
we hit a code path that has a rather odd looking check on NDD_LABELING.
Should not have gotten near that path though - hence the problem is actually
when we call cxl_pmem_get_config_data() and it returns an error because
we haven't fully connected up the command in QEMU.

Jonathan


> 
> > 
> > And x4 region still failed with same errors, using latest cxl/preview
> > branch don't work.
> > I have picked "Two CXL emulation fixes" patches in qemu, still not working.
> > 
> > Bob  

