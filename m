Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp1049111njf;
        Mon, 2 Sep 2024 03:25:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWrl7zxcihxZMMbTEM7CgnTQpdQSeU6lpWOnb6ld+d7LWg7qs7prCeoLPSevxalf4HV+5Sk4FwMUcNzhw==@linaro.org
X-Google-Smtp-Source: AGHT+IFdvtxHY7xUulwrCxzFLP1FjU12IOOOW5+EarMUipAyPo+OJt0sb6dZfAXw2AagMiZiHEfl
X-Received: by 2002:a05:6214:460b:b0:6c3:508a:fec6 with SMTP id 6a1803df08f44-6c3552ec883mr100804806d6.17.1725272747865;
        Mon, 02 Sep 2024 03:25:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725272747; cv=none;
        d=google.com; s=arc-20160816;
        b=IBa5E4Srr+gwMazVBqydB9LwMRhboQ6PYyHs+vucWeC2DWpNEdqwiFvb11Aen2X3C4
         zNjCaIjyX7KhT3Dva1MG8I8AKZ8WJdkKYNZPaGo3sCmz5vI4R5hCA5Dx6J/z4sW3DJzn
         NWpcbrE53+UszOJaYdkNl9jYOlL9+TppCV8Yl4tjWfFUsBuPn6rO/u0mEbYCFdG/I+sr
         d7NeMmJ4598f5drBwmoW5ZwmWxykMVTbsCLX1yHTz5guE5JIf8Q3ZoE2csEowZTG2KPI
         r0g2g1bzFcBxD1Xhq8yqVkBgpnnss8UJQ9ELBfOZ2injwd6GHoqjWu3OhZJ7f6VJJuV3
         EahQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=Wg9vgHk/LzojWm10yb3weiwgNMO6zb3E9a276dM5jaY=;
        fh=WyLw0myaUu5gFLLcSCB3F1iySlfwERjpLEvLTOUGQWM=;
        b=MIOaDiazARIMS/r5r9h/dUkRmPglN6Um1mhIO99Y9ELPtLni5TuP2AkIpi9bKplMVt
         q+hM82M2/VRdSGfzW2sCfulAP5AhKWRAhB48JSv85jm7zlfKUXxxeJV4LKvRBG5OXzXL
         BJrE5gHO6MdP5v+K8+BYZXnFDngYQ53aUEPjiUoMvdWG/y0m/MfyqnTSQ6BW0iH5yGTE
         9bTjmmmcVxEvGVH80tR11XRAJTuvDtRNJyy8OW9WMNkPvAHFiFP+yaziPsRnJSt+PJ7L
         4LNcbg0BDGzj84kw5u/mzIeWiftHIT0AnDXCU+DvNX0bgQaCNVxtboiRGMwpXPQeUV0G
         CVTw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340ca56ddsi103236316d6.401.2024.09.02.03.25.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2024 03:25:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sl4Ff-0002GR-PL; Mon, 02 Sep 2024 06:25:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sl4Fe-0002FW-Q9; Mon, 02 Sep 2024 06:25:38 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sl4Fc-0007Ln-19; Mon, 02 Sep 2024 06:25:38 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Wy4Yj2hz0z6LD8k;
 Mon,  2 Sep 2024 18:22:01 +0800 (CST)
Received: from lhrpeml500006.china.huawei.com (unknown [7.191.161.198])
 by mail.maildlp.com (Postfix) with ESMTPS id 9162E140B55;
 Mon,  2 Sep 2024 18:25:24 +0800 (CST)
Received: from localhost (10.47.78.245) by lhrpeml500006.china.huawei.com
 (7.191.161.198) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 2 Sep
 2024 11:25:23 +0100
Date: Mon, 2 Sep 2024 11:25:19 +0100
To: Zhao Liu <zhao1.liu@intel.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <zhenyu.z.wang@intel.com>, 
 <dapeng1.mi@linux.intel.com>, <yongwei.ma@intel.com>, <armbru@redhat.com>, 
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huwei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@huawei.com>, <jiangkunkun@huawei.com>
Subject: Re: [RFC PATCH 0/2] Specifying cache topology on ARM
Message-ID: <20240902112519.00005b67@huawei.com>
In-Reply-To: <ZtL9u9kQcx0GtEKq@intel.com>
References: <20240823125446.721-1-alireza.sanaee@huawei.com>
 <ZtL9u9kQcx0GtEKq@intel.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.47.78.245]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 lhrpeml500006.china.huawei.com (7.191.161.198)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: au21ThCQX+c/

On Sat, 31 Aug 2024 19:25:47 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Hi Alireza,
> 
> Great to see your Arm side implementation!
> 
> On Fri, Aug 23, 2024 at 01:54:44PM +0100, Alireza Sanaee wrote:
> > Date: Fri, 23 Aug 2024 13:54:44 +0100
> > From: Alireza Sanaee <alireza.sanaee@huawei.com>
> > Subject: [RFC PATCH 0/2] Specifying cache topology on ARM
> > X-Mailer: git-send-email 2.34.1
> >   
> 
> [snip]
> 
> > 
> > The following command will represent the system.
> > 
> > ./qemu-system-aarch64 \
> >  -machine virt,**smp-cache=cache0** \
> >  -cpu max \
> >  -m 2048 \
> >  -smp sockets=2,clusters=1,cores=2,threads=2 \
> >  -kernel ./Image.gz \
> >  -append "console=ttyAMA0 root=/dev/ram rdinit=/init acpi=force" \
> >  -initrd rootfs.cpio.gz \
> >  -bios ./edk2-aarch64-code.fd \
> >  **-object
> > '{"qom-type":"smp-cache","id":"cache0","caches":[{"name":"l1d","topo":"core"},{"name":"l1i","topo":"core"},{"name":"l2","topo":"cluster"},{"name":"l3","topo":"socket"}]}'**
> > \ -nographic  
> 
> I plan to refresh a new version soon, in which the smp-cache array
> will be integrated into -machine totally. And I'cc you then.
> 
> Regards,
> Zhao
> 
> 


Hi Zhao,

Yes, please keep me CCed. 

One thing that I noticed, sometimes, since you were going down the
Intel path, some variables couldn't be NULL. But when I was gonna go
down to ARM path, I faced some scenarios where I ended up with
some uninit vars which is still OK but could have been avoided.

Looking forward to the next revision.

Alireza
