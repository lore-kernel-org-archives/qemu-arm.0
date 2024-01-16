Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp922279ejf;
        Tue, 16 Jan 2024 06:51:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuO6tXUqSbWRkDsb/v6hvZmHMz3hKt2JY94AiaZ+mLY+gA08fPK/0LdRBgi3OUsfrQRRuB
X-Received: by 2002:a05:6870:a119:b0:1f9:5f20:8c7a with SMTP id m25-20020a056870a11900b001f95f208c7amr7011879oae.21.1705416682312;
        Tue, 16 Jan 2024 06:51:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705416682; cv=none;
        d=google.com; s=arc-20160816;
        b=oFwLKAUp46hCrB3fn3PiQ/jT4FAyibTDkGCx44Lrpk85capBmgo7kVa7osHuapo/f1
         OX00ryVcZdPgOnKkTvIC9pEiu3WS0CGzM24pQRH5MwcjOamGXjzCDKBQApr2DEJOEx4L
         dd7J0SKRjbpSJZfY0xF2EWugRjMGKGYwMzhnHIQAoA+w+44GVIB0WnCamUFHajBct6nP
         QWfBaIphgYrLHUkejpoa5MOenfjBkTNX/z1I+g3FpUUqiYGj7yrwYqipnMOAnHmTlgfK
         UYBM2jESOlmOG1LYGJ4khPOMBfMLBXlXzUrqoXo04vtWyGNwUxdMT7Y+ypts1iMnSwdr
         dVYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=DERmTmnGXutz3c6px9o3LCS/P0EOxQHIz4Ber6JEE6A=;
        fh=CPqfQhXyZp7q048m/2YkQDugvmq3ADVWuTpqTS8jIPQ=;
        b=CsLvzJTj96exeHnOaQSGm/hsLtPFu8hU2F+gWqjP1tVHU8Ulq2l3F6vRF2n6H80Pct
         rMDGpvvp+DRnrpb2MVm7k27CQx/EIrMb+oQmRIklGPZ17LqpKl1T723qc+DlNr+gKiC2
         7Lw1N79/yXl9XzfpxeR4Xb051S35J8yGgRtWop3hfYZmSa6rakkAnVBQ1AMnrQai4tS1
         eSnCAw0AmQPnwPlTLNhhpb7/aKEGoTQzn1keLMbLSVWGhi3Jtt4GoLej/gOKXVYPsKWE
         LvmxwkIeQCii94aEIel0PFfWw8+yqM5UecCrNXFXD6yMjgP5USnE/qD2t3vkx3u47+qx
         jR4w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d7-20020ac85d87000000b00429fb485704si2569293qtx.606.2024.01.16.06.51.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 06:51:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPkmM-0006UP-Df; Tue, 16 Jan 2024 09:51:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rPkmL-0006U5-BV; Tue, 16 Jan 2024 09:51:01 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rPkmI-0001XX-N9; Tue, 16 Jan 2024 09:51:00 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TDsM32mq5z6J9sP;
 Tue, 16 Jan 2024 22:48:15 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id AC0B81408FE;
 Tue, 16 Jan 2024 22:50:52 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Jan
 2024 14:50:52 +0000
Date: Tue, 16 Jan 2024 14:50:51 +0000
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 27/35] target/arm: Report VNCR_EL2 based faults correctly
Message-ID: <20240116145051.000004f7@Huawei.com>
In-Reply-To: <CAFEAcA-94-TeFw4AmTsuQaJROADaet8aWDEBXbt9H_gc1Fs6pg@mail.gmail.com>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-28-peter.maydell@linaro.org>
 <20240116130940.00002523@Huawei.com>
 <CAFEAcA-94-TeFw4AmTsuQaJROADaet8aWDEBXbt9H_gc1Fs6pg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QfzyANrnIEaO

On Tue, 16 Jan 2024 13:20:33 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 16 Jan 2024 at 13:09, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > On Mon, 18 Dec 2023 11:32:57 +0000
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >  
> > > If FEAT_NV2 redirects a system register access to a memory offset
> > > from VNCR_EL2, that access might fault.  In this case we need to
> > > report the correct syndrome information:
> > >  * Data Abort, from same-EL
> > >  * no ISS information
> > >  * the VNCR bit (bit 13) is set
> > >
> > > and the exception must be taken to EL2.
> > >
> > > Save an appropriate syndrome template when generating code; we can
> > > then use that to:
> > >  * select the right target EL
> > >  * reconstitute a correct final syndrome for the data abort
> > >  * report the right syndrome if we take a FEAT_RME granule protection
> > >    fault on the VNCR-based write
> > >
> > > Note that because VNCR is bit 13, we must start keeping bit 13 in
> > > template syndromes, by adjusting ARM_INSN_START_WORD2_SHIFT.
> > >
> > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>  
> >
> > Hi Peter,
> >
> > I'm getting an unhelpful crash on calling init in a guest
> > running on top of an a76 emulated host with virtualization turned on.
> >
> > Run /sbin/init as init process
> > Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
> > CPU: 1 PID: 1 Comm: init Not tainted 6.7.0+ #1119
> > Hardware name: linux,dummy-virt (DT)
> > Call trace:
> >  dump_backtrace+0xa0/0x128
> >  show_stack+0x20/0x38
> >  dump_stack_lvl+0x48/0x60
> >  dump_stack+0x18/0x28
> >  panic+0x380/0x3c0
> >  do_exit+0x89c/0x9a0
> >  do_group_exit+0x3c/0xa0
> >  get_signal+0x968/0x970
> >  do_notify_resume+0x21c/0x1460
> >  el0_ia+0xa0/0xb0
> >  el0t_64_sync_handler+0xd0/0x130
> >  el0t_64_sync+0x190/0x198
> > SMP: stopping secondary CPUs
> > Kernel Offset: 0x2a8c93a00000 from 0xffff800080000000
> > PHYS_OFFSET: 0xffff82f980000000
> > CPU features: 0x0,00000001,7002014a,2101720b
> > Memory Limit: none
> > ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007 ]---
> >
> > Upstream kernel as of yesterday.  Nothing particular 'exciting' in the
> > configurations. Not attempting to use Nested virt.
> > -M virt,gic-version=3,virtualization=true
> > -cpu cortex-a76 (happens with max as well but switched to a76 for testing
> > to reduce possible sources of problems).
> >
> > Doesn't happen if single cpu in the guest, or if using gic v2 in both.
> >
> > Bisection points at this patch - so far no idea why but I've only
> > just started digging into this.  
> 
> Bisecting to this patch is a bit weird because at this point
> in the series emulation of FEAT_NV2 should be disabled and
> the code being added should never be used. You could put
> an assert(0) into the code in translate-a64.c before the
> call to syn_data_abort_vncr() and in arm_deliver_fault()
> assert(!is_vncr) to confirm that we're not somehow getting
> into this code for some non-FEAT_NV2 situation, I guess.

Not that, but surprisingly is_vncr == true.
in arm_deliver_fault()

Frigging that to be false gets me up and running. I'll see
if I can figure out why it is set.

J
> 
> thanks
> -- PMM

