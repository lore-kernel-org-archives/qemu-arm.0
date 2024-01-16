Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp947974ejf;
        Tue, 16 Jan 2024 07:29:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3mo2YfmAP/Bcx1sF3CwQwePerbH+PUqQbvrvcFYNCAWL/GLYR+ImbUP+F2hfXVSa/u9F1
X-Received: by 2002:a05:6122:4a11:b0:4b7:26aa:542e with SMTP id ez17-20020a0561224a1100b004b726aa542emr3726214vkb.24.1705418973747;
        Tue, 16 Jan 2024 07:29:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705418973; cv=none;
        d=google.com; s=arc-20160816;
        b=nvHljP4PjoGfvN1R/B/jXAVLs5Dak24vuJhO9dEg4LHRp9ioHVioXzJZcDlL5u1+Bm
         1MXfvkVL2nTF81reKpUb69qB0j/KZdRpho5Q27sYrDdhE+PeOBFlR4rpSOY7rVtG/tJ6
         iKa363GjWyGcEiXxUsL4ycf7mP93Ug7Ru7K+frxNQI/8+x9eU+AZPolymdy0zKAdiGkK
         KwRI3Yf1kKGm+dAEToPA//JwbTWHdVD6cZHzwCN8ZVATybFPQ+gq3qSoievDh4CrdTH9
         pj9YD0ZjFI5Meb8ABM7vSlXrUCHoNxxvQmQMMUMFZjKIuivfLNpYKMDLB9G/d4Lbwheh
         Tvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=UeEm4WclG6SiXpAZ7Gx8zjkMkd2uuopbMcoIkS+jwC8=;
        fh=CPqfQhXyZp7q048m/2YkQDugvmq3ADVWuTpqTS8jIPQ=;
        b=stQMAvvFS/fRiZQaeQzL0DQqngWEIo3wf3rkelLJezsKKr6u31PuOtn04QreC4EQkW
         2WMN2hoU/nUEmaYHLcq7B5bkO0yXhdAU+HRRMH+yW9bIhsqul5ZCQDfjEUYfoLlMXiKq
         LoAYflkINx71SlaqvN5S0NeX3NYokAjimOZbGhbqgX83FQlHJ1/ENWyWXV0i4KdV+ds4
         boaRwXIkFzwuCsxM/zUdaNhsfdqUAvjHk+NFSofHuVUDMSIzRM4QUITGq+WLGkSDmGea
         T1+t440AATTv2Ngzoecvme3Njg2vWidLh8+RerrzmP/sDUPcO086jLeWHK+lYCdeKt4/
         WNmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10-20020a0cc40a000000b006800edeb291si9845326qvi.205.2024.01.16.07.29.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jan 2024 07:29:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPlNY-0008HL-FX; Tue, 16 Jan 2024 10:29:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rPlNX-0008H6-7s; Tue, 16 Jan 2024 10:29:27 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rPlNV-0000Ws-6t; Tue, 16 Jan 2024 10:29:26 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TDtCJ1Rblz686Vq;
 Tue, 16 Jan 2024 23:26:36 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id 241411400CF;
 Tue, 16 Jan 2024 23:29:21 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 16 Jan
 2024 15:29:20 +0000
Date: Tue, 16 Jan 2024 15:29:19 +0000
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 27/35] target/arm: Report VNCR_EL2 based faults correctly
Message-ID: <20240116152919.00001571@Huawei.com>
In-Reply-To: <CAFEAcA8=CK00w_Yk-X=+6cm2X5BWSiTw7_y6uQN8qyFHF4-iFg@mail.gmail.com>
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-28-peter.maydell@linaro.org>
 <20240116130940.00002523@Huawei.com>
 <CAFEAcA-94-TeFw4AmTsuQaJROADaet8aWDEBXbt9H_gc1Fs6pg@mail.gmail.com>
 <20240116145051.000004f7@Huawei.com>
 <CAFEAcA8=CK00w_Yk-X=+6cm2X5BWSiTw7_y6uQN8qyFHF4-iFg@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
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
X-TUID: M5QlmTf/puvJ

On Tue, 16 Jan 2024 14:59:15 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 16 Jan 2024 at 14:50, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > On Tue, 16 Jan 2024 13:20:33 +0000
> > Peter Maydell <peter.maydell@linaro.org> wrote:  
> > > Bisecting to this patch is a bit weird because at this point
> > > in the series emulation of FEAT_NV2 should be disabled and
> > > the code being added should never be used. You could put
> > > an assert(0) into the code in translate-a64.c before the
> > > call to syn_data_abort_vncr() and in arm_deliver_fault()
> > > assert(!is_vncr) to confirm that we're not somehow getting
> > > into this code for some non-FEAT_NV2 situation, I guess.  
> >
> > Not that, but surprisingly is_vncr == true.
> > in arm_deliver_fault()
> >
> > Frigging that to be false gets me up and running. I'll see
> > if I can figure out why it is set.  
> 
> I don't know if this is the cause, but looking again at the
> line that sets is_vncr I see at least one obvious bug:
> 
>     bool is_vncr = (mmu_idx != MMU_INST_FETCH) &&
>         (env->exception.syndrome & ARM_EL_VNCR);
> 
> is testing the wrong variable -- the first part
> of the condition should be "access_type != MMU_INST_FETCH".
> 
> If you fix that does the failure go away ?
Ah - indeed that fixes it.

I guess that makes sense. Presumably the bit is used for
something else for instruction fetches.

Thanks for your quick help!

Jonathan


> 
> Yay for C and its very sloppy typing :-/
> 
> -- PMM

