Received: by 2002:a05:7023:c086:b0:69:9a19:fb41 with SMTP id ip6csp2747570dlc;
        Tue, 22 Aug 2023 08:23:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxuc8zPLMHbDFEIK8/FJFmeGRv17aLEeekYxokeV5OovORYngaSO/iuRsWDLYmqkp8lFpc
X-Received: by 2002:a05:622a:18f:b0:40f:df1f:87a9 with SMTP id s15-20020a05622a018f00b0040fdf1f87a9mr12331566qtw.18.1692717828777;
        Tue, 22 Aug 2023 08:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692717828; cv=none;
        d=google.com; s=arc-20160816;
        b=tyec/14jkZwF31BhMnbv/bhE83t2Z4ELfUTUdlMdPAkyCxMlyb36PsWS6Q8cAAWJsk
         aCHiNowxAv701h0sQsxzCdOAZ5XgRpO9j8Qay8nzRv15ZggsGMmMKUc3jIn7ZDgxPieW
         EcxuRJrVFE+cg1/VR01l4mqvKL6CxQ9Pc/IxFUywWEDE/ktIQ+oU5jDxzNCjtTA9QJD9
         GD9xUOzX8DoNIrUawT/uPcllcMxXE1AwPmtxnNzMQJBjWhR1N/YDbAGzwlVXeUrkMRvg
         6Wbj54OEP1lIyFMlvTXHC/knBSbsr8MoxaUb8mvlpG66EXD/64m0hE4DmdctLuk9ZC2A
         D82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=FTxrnq6I4ZEMH2pMfhgsLfFCy9i8p1LxnTdumk5f7bM=;
        fh=AuNRXjyCNAzIR7g5RYFRdwdUTwCjaB4cQpp0A9ttT/4=;
        b=F8tx372Eaa7XqmhMtYYYNDM18/Ro/CoJsT6ul4/4RYqOSUsGmowsBvNm+xylexteC1
         UxhbDrBWdMrlvRXLL526gkAgpWX1WLGUuF+bIAA2jicpJjL1DxgcszvYS0Nek3kqkYJK
         RUXtohFdwEo4kid0n1gbI5Ihwf78hnST7Efv4eORhFo0IgEv5lkNWN7JB2NANE/z+u2h
         WHoAjp00qFok3tElA4lWPusGh2QbEb4wYbJBhx8Ob5elvpV+e8stAqD3+F3TIX72zb73
         0EZ3/fFnVEnd5voGErmQ2k/zQGLJNJ4M79wuEwrP5DS8+KwEcPhTywTt8fvvFNPa20+o
         zsvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b3-20020ac87fc3000000b0040694778c33si6481135qtk.32.2023.08.22.08.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 08:23:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYTE5-0003zO-OP; Tue, 22 Aug 2023 11:23:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qYTE4-0003yx-MR; Tue, 22 Aug 2023 11:23:24 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qYTE0-0003nV-Ak; Tue, 22 Aug 2023 11:23:24 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RVY0245VBz6J6xl;
 Tue, 22 Aug 2023 23:18:42 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Tue, 22 Aug
 2023 16:23:04 +0100
Date: Tue, 22 Aug 2023 16:23:03 +0100
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
CC: qemu-arm <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
Message-ID: <20230822162303.00007def@Huawei.com>
In-Reply-To: <2023081118312729037834@phytium.com.cn>
References: <2023061615433049315231@phytium.com.cn>
 <2023081118312729037834@phytium.com.cn>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: fCHmcZmZyFVd

On Fri, 11 Aug 2023 18:31:28 +0800
Yuquan Wang <wangyuquan1236@phytium.com.cn> wrote:

> Hi, 
> On 2023-08-10 21:56,  jonathan.cameron wrote:
>  
> So took a look at your issue - be it on the cxl-2023-08-07 branch rebased on qemu/master
> from today (side effect of looking at the segfault that was stopping me getting to this).
>  
> For me at least the branch does create an ACPI0017 DSDT entry and an ACPI0016 one
> and all the CXL devices turn up in /sys/bus/cxl/devices as expected.
>  
> 
> Oh, thanks for your guidance. It works so now I can get  ACPI0017 & ACPI0016 information in DSDT.   : )
> 
> By the way,  I found that if we add a pcie root port which create the same bus number as we assigned to pxb-cxl, 
> the enumeration of cxl and pcie would be different from what we expected.  In this case,  we cannot find 
> CXL devices in /sys/bus/cxl/devices. 

So this seems to be a case of shooting ourselves in the foot, but not catching the nonsensical configuration
(as you observer later! :)
pxb-pcie complains if you try and add two at the same bus number, but that doesn't protect against overlapping
ranges because they aren't known until after enumeration (which is done by the bios - and I guess the bios
doesn't sanity check for this insanity).  Qemu could take another look when it builds the ACPI tables a
second time though.

Looking at edk2 logs I can see it is happily populating the root bus 1 on my arm64 setup and that it
observes there are no subordinate buses available for the main PCIe bus (0) that QEMU is creating by
default. The _CRS entries look correct but the kernel ignores them it seems. 

It is very much not a valid configuration so there is no reason the kernel should cope with it.

Maybe it's worth considering some hardening code?


> 
> According to my test, the error happened in 
> "devm_cxl_register_pci_bus()"  of  "add_host_bridge_uport" in  "cxl_acpi_probe".
> Actually,  in above case, the incorrect enumeration of pcie will also occur with pxb-pcie except for pxb-cxl, 
> hence I guess the kernel did not deal with such case and users just need to avoid it if they need a correct
> enumeration result.

Agreed - Protecting against ever corner case of impossible configuration is tricky to
do.

> 
> My qemu script (which will cause the incorrect enumeration):
> qemu-system-x86_64 \
> -M q35,nvdimm=on,cxl=on \
> -m 4G,maxmem=8G,slots=8 \
> -smp 1 \
> -object memory-backend-file,id=cxl-mem1,share=on,mem-path=./memfile/cxltest3.raw,size=256M \
> -object memory-backend-file,id=cxl-lsa1,share=on,mem-path=./memfile/lsa3.raw,size=256M \
> -device ioh3420,bus=pcie.0,id=root_port1,chassis=0,slot=1,addr=04 \
> -device qemu-xhci,bus=root_port1 \
> -device pxb-cxl,bus_nr=1,bus=pcie.0,id=cxl.1 \
> -device cxl-rp,port=0,bus=cxl.1,id=root_port13,chassis=0,slot=2 \
> -device cxl-type3,bus=root_port13,memdev=cxl-mem1,lsa=cxl-lsa1,id=cxl-pmem0 \
> -M cxl-fmw.0.targets.0=cxl.1,cxl-fmw.0.size=4G \
> ......
> 
> Many thanks
> Yuquan

