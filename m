Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp1399924njc;
        Tue, 10 Jun 2025 02:19:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURv6rl8+wIuYBmm59UgaCOLjHyq0HvPWD8EFM91ymLJTld6mHbImg85otg5hioUQ2EsaoJKddfP+NoNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGNno9HkbvDhX5/OywerLgBaxvSHjadWVxoCzrCb/cLAmNsbORNwx2YObFRKYQ1xpsUWhRe
X-Received: by 2002:a05:620a:6192:b0:7d0:94c8:c1a4 with SMTP id af79cd13be357-7d39f5beac5mr252096885a.23.1749547177547;
        Tue, 10 Jun 2025 02:19:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749547177; cv=none;
        d=google.com; s=arc-20240605;
        b=b3dnF8XAN1rxOxHWuENM7baDruWfrWEm5FtcaXLqKJxSIGx3BzjOwRqDiVG0zRUUVL
         uDFaDCFLYsGZqrGmCtYPqm2QQJdnOLDCoxO5FqFFzdrWs3+NJK134pUSnWhKpAO4uQEx
         M0D5twV0mstY2JhI/ULKVCZnzNRkE9r1DOeE7zQ0gcoH2DIzj17oMmEk4xaLfUrPB1OQ
         wDmOPiUsHk0mqNrjAtg84Jr59NSHl+nGrRS6LHo6R5CXAEYVQ3ExGP0cP0HXv5QFGc7z
         XtL0ip0lB6nJpqwC0KbssJ/4fAw8NShWBYlgu3/9fHlciip+VnBW75Jz41KmfSThjxf7
         t0YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=MSSxvaBIMsqn9TbdUWH6hSYVQXucvKv5g7FobsHaGe0=;
        fh=MTOuWDNIVZ1v9+DWyrogvuVgCj3virTl2rL+S57KbgM=;
        b=BlyKOqOyI98MXFoWvStWwuuam1fQyDoHRg8LDqCe2bWhjEbvC9S3GWUIaN5l1BZDze
         w+z0C7H9j6xMAaqpLAcKC/9/5libfCMbpx7E7eGsOcOkeu2F+Ax4eZ5LWbxbxGYb7oXC
         PZ+sy5g/lYqxMnkl2ulxs3ezFwtzfzxXXne4QoAU2nd/hkdgjYZIw7u045USQaGt1sWu
         y8mvypTslT6W0+IoDIiRSNktahzgAjFPyLsvKqMiqQkwAR39cFh4Q7BfNOuWbrWfKXKM
         e/Oj4WPJj8OkNbjUkfk5TpytZ2oTMZPkVfzu70RaghgsL6EIZRXn64YoI00MSgZMJ62u
         F4Yg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d38e9f51b1si599657085a.158.2025.06.10.02.19.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Jun 2025 02:19:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uOv8c-0004C9-2J; Tue, 10 Jun 2025 05:19:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uOv8Z-0004Bf-Az; Tue, 10 Jun 2025 05:19:19 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uOv8U-0007Nu-7G; Tue, 10 Jun 2025 05:19:18 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bGjmN3MVyz6H6q9;
 Tue, 10 Jun 2025 17:14:44 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 2AE1D140275;
 Tue, 10 Jun 2025 17:18:59 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 10 Jun
 2025 11:18:58 +0200
Date: Tue, 10 Jun 2025 10:18:57 +0100
To: Itaru Kitayama <itaru.kitayama@linux.dev>
CC: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, Peter Maydell
 <peter.maydell@linaro.org>, <mst@redhat.com>, <linuxarm@huawei.com>,
 <linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>, Yuquan Wang
 <wangyuquan1236@phytium.com.cn>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
 <philmd@linaro.org>, Alireza Sanaee <alireza.sanaee@huawei.com>
Subject: Re: [PATCH v14 2/5] hw/cxl: Make the CXL fixed memory windows devices.
Message-ID: <20250610101857.00002818@huawei.com>
In-Reply-To: <aEdl6xvqyOsU+Z2S@vm4>
References: <20250528110726.226389-1-Jonathan.Cameron@huawei.com>
 <20250528110726.226389-3-Jonathan.Cameron@huawei.com>
 <20250529160801.00003ade@huawei.com> <aEdl6xvqyOsU+Z2S@vm4>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-TUID: 3UNTiEB2Dr0y

On Tue, 10 Jun 2025 07:53:31 +0900
Itaru Kitayama <itaru.kitayama@linux.dev> wrote:

> On Thu, May 29, 2025 at 04:08:01PM +0100, Jonathan Cameron wrote:
> > On Wed, 28 May 2025 12:07:23 +0100
> > Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:
> >   
> > > Previously these somewhat device like structures were tracked using a list
> > > in the CXLState in each machine.  This is proving restrictive in a few
> > > cases where we need to iterate through these without being aware of the
> > > machine type. Just make them sysbus devices.
> > > 
> > > Restrict them to not user created as they need to be visible to early
> > > stages of machine init given effects on the memory map.
> > > 
> > > This change both simplifies state tracking and enables features needed
> > > for performance optimization and hotness tracking by making it possible
> > > to retrieve the fixed memory window on actions elsewhere in the topology.
> > > 
> > > In some cases the ordering of the Fixed Memory Windows matters.
> > > For those utility functions provide a GSList sorted by the window index.
> > > This ensures that we get consistency across:
> > > - ordering in the command line
> > > - ordering of the host PA ranges
> > > - ordering of ACPI CEDT structures describing the CFMWS.
> > > 
> > > Other aspects don't have this constraint. For those direct iteration
> > > of the underlying hash structures is fine.
> > > 
> > > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>  
> > 
> > I'll not post v15 for a while to give time for review, but I just realized
> > this snippet was in a patch I was carrying on top of this and should have
> > been in this patch.
> > 
> > diff --git a/include/hw/cxl/cxl.h b/include/hw/cxl/cxl.h
> > index a610795c87..de66ab8c35 100644
> > --- a/include/hw/cxl/cxl.h
> > +++ b/include/hw/cxl/cxl.h
> > @@ -46,7 +46,6 @@ typedef struct CXLState {
> >      bool is_enabled;
> >      MemoryRegion host_mr;
> >      unsigned int next_mr_idx;
> > -    GList *fixed_windows;
> >      CXLFixedMemoryWindowOptionsList *cfmw_list;
> >  } CXLState;  
> 
> With this one line removed on top of v14, today's Dave's cxl/next kernel makes
> cxl test suite ran through without a single failure.
> 
> Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
> 
> Jonathan, Zhi jian of Fujitsu gave you feedback on the QEMU core CXL emulation code, 
> are you still waiting on any other reviewers to take a look at the series v14 (or
> v14-ish)?
No - obviously extra review is always good but I wasn't waiting on any.
Just been distracted so not sent it out yet. Should get it out in next day or two.

Jonathan


> 
> Thanks,
> Itaru.

> 
> >   

