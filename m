Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1222402ejf;
        Fri, 12 Aug 2022 08:46:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7dR5ocGh8Bp9xHPHOOKJrefef3l6KZwutSiLeSzhZv2n6tLXz2qNkmy2nt6VOGY2g5hh27
X-Received: by 2002:a05:6214:27c6:b0:476:7b87:bd62 with SMTP id ge6-20020a05621427c600b004767b87bd62mr4212821qvb.2.1660319190523;
        Fri, 12 Aug 2022 08:46:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660319190; cv=none;
        d=google.com; s=arc-20160816;
        b=kI1IYKXYEZR3uAfu7E5/xo0SZbovMennTB4BzG+f1bYK0r7euioOtBSjG1m61NFWQD
         KZ6Q7V1HHxAgesIIvrqlmrJjMjOZbYL/qpjjOiNY86ADN3QnzPIPEH8ew+RrMX/0np/N
         YwPI+znLSs1ks2unT6frzm3z1jhYc9SrVqYzsixbUWDhaab6oIEjYw9i3OtOpAmNb9LS
         MFQzgNsRvPj0YXMV9/ocKur2hGbqGI84tYR05ik1ImCbKhUVyEiQDIBT2nSkE70e1OTZ
         5Mzl7w8uq12n5xRa8Ol/CIY8LuTEyMcxipOmyAnrZcbWBzn5efc0qiMfxk0BlEg/gCgD
         XRUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=viZweJj6d0C+7gONENxuW/JSuNXPcv4VckazpK6SeKM=;
        b=v6VluO5jeud094ciwdnS7k/9UGvOP+GipRBZTUPCCrS9+QvVTrmo18pJ6HYvvDKAgh
         P2xaNjYPKdTuU36DfCOctJC4OaoYXrtKAVMnA7KEzHpBkzGgVDhs61bAs5n4390CBRz4
         gaJXAYWpUkPXBcBMQKeMbJyLAxx9+0o3AqS+sX9Ocg3uLr0dNd2EE9QXECmdDPBzbV0U
         otYG8tRigd1+CPsjSO0koNfjBvRctKnh3WCP8IHvn+ZMCIIPbkP6QsJUwnNF8huiJ5+C
         hscZWtn3VSRJLOYksREA0Qctm4ta/GtFs9T6lD7mRT3NuKYWdvfiiduAesGEh6v7uMCA
         Di/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a05620a138500b006b5e1b330a4si1291881qki.419.2022.08.12.08.46.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Aug 2022 08:46:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:41346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oMWrl-0005Yq-RD
	for alex.bennee@linaro.org; Fri, 12 Aug 2022 11:46:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oMWpZ-0003zK-Ez; Fri, 12 Aug 2022 11:44:13 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56]:2671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1oMWpW-0001Cc-VE; Fri, 12 Aug 2022 11:44:13 -0400
Received: from fraeml703-chm.china.huawei.com (unknown [172.18.147.206])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4M47JG4Lgpz688JN;
 Fri, 12 Aug 2022 23:43:58 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (7.191.163.240) by
 fraeml703-chm.china.huawei.com (10.206.15.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2375.24; Fri, 12 Aug 2022 17:44:05 +0200
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 12 Aug
 2022 16:44:04 +0100
Date: Fri, 12 Aug 2022 16:44:03 +0100
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bobo WL
 <lmw.bobo@gmail.com>, <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>
Subject: Re: [BUG] cxl can not create region
Message-ID: <20220812164403.00001654@huawei.com>
In-Reply-To: <20220811180857.00005e67@huawei.com>
References: <CAGr_yG0UrfJAMWta3EkR1F0JZ4j--sig74p6vKL3K6TZDx9YGA@mail.gmail.com>
 <20220808133727.00001171@huawei.com>
 <CAGr_yG36GSO8esyO9nn6OeOEN5zPSosEmBHbfYGwqNGiYOh9vw@mail.gmail.com>
 <20220809170825.00001b61@huawei.com>
 <20220811180857.00005e67@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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
X-TUID: Mlpme+RKRpm2

On Thu, 11 Aug 2022 18:08:57 +0100
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> On Tue, 9 Aug 2022 17:08:25 +0100
> Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> 
> > On Tue, 9 Aug 2022 21:07:06 +0800
> > Bobo WL <lmw.bobo@gmail.com> wrote:
> >   
> > > Hi Jonathan
> > > 
> > > Thanks for your reply!
> > > 
> > > On Mon, Aug 8, 2022 at 8:37 PM Jonathan Cameron
> > > <Jonathan.Cameron@huawei.com> wrote:    
> > > >
> > > > Probably not related to your problem, but there is a disconnect in QEMU /
> > > > kernel assumptionsaround the presence of an HDM decoder when a HB only
> > > > has a single root port. Spec allows it to be provided or not as an implementation choice.
> > > > Kernel assumes it isn't provide. Qemu assumes it is.
> > > >
> > > > The temporary solution is to throw in a second root port on the HB and not
> > > > connect anything to it.  Longer term I may special case this so that the particular
> > > > decoder defaults to pass through settings in QEMU if there is only one root port.
> > > >      
> > > 
> > > You are right! After adding an extra HB in qemu, I can create a x1
> > > region successfully.
> > > But have some errors in Nvdimm:
> > > 
> > > [   74.925838] Unknown online node for memory at 0x10000000000, assuming node 0
> > > [   74.925846] Unknown target node for memory at 0x10000000000, assuming node 0
> > > [   74.927470] nd_region region0: nmem0: is disabled, failing probe    
> > 
> > Ah. I've seen this one, but not chased it down yet.  Was on my todo list to chase
> > down. Once I reach this state I can verify the HDM Decode is correct which is what
> > I've been using to test (Which wasn't true until earlier this week). 
> > I'm currently testing via devmem, more for historical reasons than because it makes
> > that much sense anymore.    
> 
> *embarassed cough*.  We haven't fully hooked the LSA up in qemu yet.
> I'd forgotten that was still on the todo list. I don't think it will
> be particularly hard to do and will take a look in next few days.
> 
> Very very indirectly this error is causing a driver probe fail that means that
> we hit a code path that has a rather odd looking check on NDD_LABELING.
> Should not have gotten near that path though - hence the problem is actually
> when we call cxl_pmem_get_config_data() and it returns an error because
> we haven't fully connected up the command in QEMU.

So a least one bug in QEMU. We were not supporting variable length payloads on mailbox
inputs (but were on outputs).  That hasn't mattered until we get to LSA writes.
We just need to relax condition on the supplied length.

diff --git a/hw/cxl/cxl-mailbox-utils.c b/hw/cxl/cxl-mailbox-utils.c
index c352a935c4..fdda9529fe 100644
--- a/hw/cxl/cxl-mailbox-utils.c
+++ b/hw/cxl/cxl-mailbox-utils.c
@@ -510,7 +510,7 @@ void cxl_process_mailbox(CXLDeviceState *cxl_dstate)
     cxl_cmd = &cxl_cmd_set[set][cmd];
     h = cxl_cmd->handler;
     if (h) {
-        if (len == cxl_cmd->in) {
+        if (len == cxl_cmd->in || !cxl_cmd->in) {
             cxl_cmd->payload = cxl_dstate->mbox_reg_state +
                 A_CXL_DEV_CMD_PAYLOAD;
             ret = (*h)(cxl_cmd, cxl_dstate, &len);


This lets the nvdimm/region probe fine, but I'm getting some issues with
namespace capacity so I'll look at what is causing that next.
Unfortunately I'm not that familiar with the driver/nvdimm side of things
so it's take a while to figure out what kicks off what!

Jonathan

> 
> Jonathan
> 
> 
> >   
> > > 
> > > And x4 region still failed with same errors, using latest cxl/preview
> > > branch don't work.
> > > I have picked "Two CXL emulation fixes" patches in qemu, still not working.
> > > 
> > > Bob    
> 
> 

