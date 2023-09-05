Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp2048817ejb;
        Tue, 5 Sep 2023 07:35:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3YeGi2TjYRVi4GaQxqy9J7ioIctFEaTKir4HE9axulpya5bPzHlisa3yMarCTZtPbKpQ5
X-Received: by 2002:a05:6122:da6:b0:493:49ef:59e0 with SMTP id bc38-20020a0561220da600b0049349ef59e0mr4353611vkb.13.1693924515677;
        Tue, 05 Sep 2023 07:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693924515; cv=none;
        d=google.com; s=arc-20160816;
        b=oIah+VblBIBR8SBbDIPkldMjx3hqPixlCZEtXLfgbeG+B+Bo5bRx70g5H7/TQeqe0H
         F8wQyccOnVLdyROsEiyJ/RtQ5oXIyEprDZO+qoN1QoNADR1dKTq05mInevPFtvOs06eo
         cV8ZNKekIas9wcrHP5r5FGYE73CTwkpTiK5yXoun+zfngEOEH3lm/yHWV+8DTGuQNhEd
         Gm2UP7pbEgjYJCGdZf6HqFkeG4daZDljTlLcDcyZX4eiDZ52BVmq5H7Gijqecr8MvhJw
         +k7oau4oOKqF0zry8NmJ3YPjXUVnPCvc0/PeW6zIbXybrvxiE/uX0HG2YQel8iqtomK6
         8WSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=4lKGM6nRvJXBSk8vjrHdDQr2zjJlDYVEfUMM35gFD68=;
        fh=jH5jfeN860fn+vI0fsYXs9CdNQSJy9IvhpauVikPNms=;
        b=W1t/RmrULKklkNciYYIvZJ8Fcer+yvBHqW92qLcxhA/MrEkDwI2ujBD99EiB++OtmO
         n49sKRM7GbaNpoZWItfso8O/o7PbhJmddMcad4/WqfmSR3oN4JWQgfCCHI5NLkfV8XG6
         xU5JvpERLkikWgBSVZUYOUrifsNNiHLkJlmbNPxxujyOyXAfNJq8XGDMN5phBbcghA4J
         UVbfBLz+UyHjexvqWwtlw0HvDrA0rTlJuVWYK+JDtV4H1LNXAcwe6vQXGlWvbFLfD43m
         1pnl7UR5ffvSGDWsAHq8Bvr5OKH21XeRUKlgsz0wzfXA4rhEexfsjjb9LBDx7haJmt4q
         SE3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12-20020a0ce30c000000b0063d00dc9c52si8080540qvl.471.2023.09.05.07.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Sep 2023 07:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qdX8q-0006jb-15; Tue, 05 Sep 2023 10:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qdX8p-0006jN-0d; Tue, 05 Sep 2023 10:34:55 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qdX8m-0001er-AA; Tue, 05 Sep 2023 10:34:54 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.200])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Rg7KC5D08z6HJ5h;
 Tue,  5 Sep 2023 22:33:19 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 5 Sep
 2023 15:34:39 +0100
Date: Tue, 5 Sep 2023 15:34:38 +0100
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
CC: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 gregory.price <gregory.price@memverge.com>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
Message-ID: <20230905153438.000075ff@huawei.com>
In-Reply-To: <2023090518450211126476@phytium.com.cn>
References: <2023082215220191352877@phytium.com.cn>
 <2023090518450211126476@phytium.com.cn>
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
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zvOo4dcSdZJO

On Tue, 5 Sep 2023 18:45:02 +0800
Yuquan Wang <wangyuquan1236@phytium.com.cn> wrote:

> Hi, Jonathan
> On 2023-09-04 20:43,  jonathan.cameron wrote:
> > 
> > At the system design level, MMIO space of Root complex register space via RCRB
> > does not map in a similar fashion to PCIE MMIO space (which is handled via
> > address decoding in the PCIE fabric). It is much more similar to MMIO for platform
> > devices - as such the implementation handles in like a platform device (well 16 of
> > them which seemed enough for any sane usecase).
> > 
> >   
> 
> Oh,thanks! According to above, therefore, the core factor is the implementation of RCRB.
> 
> > 
> > So in theory we could make some space for the CXL root bridge RCRB registers
> > but it would make various generic paths more complex.  In a real system
> > those registers are likely to be far from the PCI MMIO space anyway so the
> > way it's modeled is probably more realistic than pushing the RCRB into the
> > existing allocation.
> >   
> 
> Here implies that all CXL root bridge will use RCRB registers.
> 
> From Table 8-17 and Figure 9-14 in CXL3.0 specification, I understood that only RCH DP &
> RCD UP will use RCRBs, and CXL host bridges VH mode will use other way to realize
> the CHBCR. I had tried to find more explanation in CXL spec, but I haven't found. Hence 
> this is why I am confused.

Ah. That distinction is a bit messy.  Both an RCRB and CHBCR (CXL Host Bridge Component
Registers) are similar in the sense that they are mapped in host memory space. 
As I understand it the distinction is more about the format / contents of that memory
than how you access them. As an aside, they are described by a static ACPI table,
so they can't be in the MMIO space used for BARs etc.

Jonathan


> 
> Many thanks
> Yuquan

