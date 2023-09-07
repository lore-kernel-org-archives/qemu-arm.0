Received: by 2002:a17:906:cf8c:b0:9a1:fa4e:495e with SMTP id um12csp239395ejb;
        Thu, 7 Sep 2023 03:59:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHqbSeVHE0uiLF64ofHDlsGLgfCxYXob5Ry4L9mspPj2Tv8piEjuoxALSQWj06ssZDRNjgZ
X-Received: by 2002:a05:620a:290b:b0:76f:1eac:e72d with SMTP id m11-20020a05620a290b00b0076f1eace72dmr24816201qkp.38.1694084351998;
        Thu, 07 Sep 2023 03:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694084351; cv=none;
        d=google.com; s=arc-20160816;
        b=WnP6vMunmuFqxN0HRY3fueIvwvLw1yH+luVYjBVHbMAUyuW9yHCkGSe6bCU1T2D2go
         DatEP3loG9LgRkgGmezzSJv47Jezl7DQabLL6nwpVjD+BlqWbKHOpY5oIuTLm8iegee5
         Gp4VB1gq+Q9ARICE5AScK7sSlOe8167nlRoJPI2ZHTnG60Wh9XNHWa7/UKqbmMNfMwxv
         QT9LfnndNFkZbAvk0S3xgetdZ/65dwONY1IdVAhjp6v35gau9PCXgoq2UgRKKuL9Vatq
         qE1GWueg7n8AKERXLYQ8aqrWZ8npYdRwvwH5LSc5FtHJMZr7IrKZxPHGE9/ME1QAHt64
         cqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=AJji+JZbNif3weYMaIacpjjoj4HvfdTf5768s7I3IA0=;
        fh=EodgwhUY7jURIdsZddeZu1Y+nS8Bt42mtmrs3oEiEgA=;
        b=oAZ/w2lEsfMvOdIXObTXg+h0MgZRtcRzqJRnPhOnx1rl0qSqHw79KsVRkL3o+Ims+/
         SqHibqm2NwmtVMDt+yamVNrraKsiuXLypq/l7RotUNICLyFbxvGr68tLrzQj/LJv0utI
         6HbglVJCYJkWqRbuhjyqEJvWO+qKA7JKk1HrafCOvA7jcpdILtH8drCEGnoWNLei54a6
         V9Xc8CNop/w0UTy24qHLjeD6PekqvXFdX4Y54iLTZ3E5vtjpuE/F05HfLUTCCWmbTvH8
         HEIA8mNuw7Fwy4uFACmW8nutabTpEc9C6rPqI77UV9nTKOvNtAtqVMkwXM2aOmxBZVF0
         pJtg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id uw12-20020a05620a4d8c00b007671804681asi10622249qkn.15.2023.09.07.03.59.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 07 Sep 2023 03:59:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qeCil-0006cG-2O; Thu, 07 Sep 2023 06:58:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qeCij-0006VW-AF; Thu, 07 Sep 2023 06:58:45 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qeCie-0006nB-R1; Thu, 07 Sep 2023 06:58:45 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RhGQk4Mqnz6HJl2;
 Thu,  7 Sep 2023 18:57:02 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Thu, 7 Sep
 2023 11:58:28 +0100
Date: Thu, 7 Sep 2023 11:58:27 +0100
To: Yuquan Wang <wangyuquan1236@phytium.com.cn>
CC: qemu-arm <qemu-arm@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 "gregory.price@memverge.com" <gregory.price@memverge.com>
Subject: Re: CXL Namespaces of ACPI disappearing in Qemu demo
Message-ID: <20230907115827.00000a94@Huawei.com>
In-Reply-To: <2023090619221880715697@phytium.com.cn>
References: <2023082215220191352877@phytium.com.cn>
 <2023090619221880715697@phytium.com.cn>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
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
X-TUID: B8NkDv4D5Zkr

On Wed, 6 Sep 2023 19:22:19 +0800
Yuquan Wang <wangyuquan1236@phytium.com.cn> wrote:

> Hi, Jonathan
> On 2023-09-05 22:34,  jonathan.cameron wrote:
> > 
> > As I understand it the distinction is more about the format / contents of that memory
> > than how you access them.   
> 
> Yes, RCH DP RCRB includes registers from PCIe Type 1 Config Header and
> PCIe capabilities and extended capabilities while CHBCR includes component registers 
> with the same layout and discovery mechanism in other CXL components.
> 
> > As an aside, they are described by a static ACPI table,
> > so they can't be in the MMIO space used for BARs etc.
> >   
> 
> In CXL 3.0 Spec, the Figure 9-14 (CXL Link/Protocol Register Mapping in a CXL VH)
> shows that CHBCR is mapped by "Host Proprietary Static Bar". According to your guidance,
> it is not a standard PCIe BAR using PCIe MMIO Space, so I understand it is a special BAR for 
> MMIO of a platform device?

Hmm. Host proprietary so basically you can in theory do anything you like.

In QEMU emulation at least it's not in the PCIe MMIO space.  I'd not rule out other
implementations putting it somewhere in that space.  For now I'm not seeing
a) Anything that says our choice is invalid.
b) Any advantage in making the handling of PCIe MMIO space more complex to shoe
   horn this in there.

Jonathan
> 
> 
> Many thanks
> Yuquan

