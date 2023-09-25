Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp443543ejc;
        Mon, 25 Sep 2023 07:54:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfs9SFoYVLfEJ5JVSZ7Ix0HuUf5z5+c0bver+d/DQrrHhxoS6mDCdVxqMFNCMf4UcWLZJ5
X-Received: by 2002:a05:622a:1182:b0:417:9c78:b32f with SMTP id m2-20020a05622a118200b004179c78b32fmr8886615qtk.48.1695653668372;
        Mon, 25 Sep 2023 07:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695653668; cv=none;
        d=google.com; s=arc-20160816;
        b=af9JujzMo26HkvqxvChFQlaIRpQ5xtx20x1XvS2RD3hwXUVDdSXcK07L2KglOogk3x
         JJ8pw09mbEg/SoL1zLrvIQRadisxZ0Iq9vF0H4U2z5T18kp2TntRIeg/Kt0M9bpcmq+7
         0qDtwrkXxraxVEcN9OSN3uixP0CFNK5hUUa1/lcF+0SYVLC6Q2xbq9/lu+Rw5C4RL0jr
         EFlEn6wpHtyFKQaZlD64t5mPidH9O59M5ZxJF/SbTfZbl15x2B6LqA2ASJSku2vr1Qtm
         GatJbCHwJBEbbqRprioj8pvsn+2Xv0RriYgQA1/Fd5wLPk8u1ElLost2X+gHgIIjpDKY
         PzTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=wQ11KAcx3/HlY1stsmdZcHMv8zuzYmsX2qxuA7D97q4=;
        fh=wnMnlE0yQTQMtKiCI/oBQCiIMtzki4ScomN0sbCKm94=;
        b=CLJx8TWd1UB0lqW2rEYfqHzBFrWxpA7jl5lVdwPOjuWpHzbpH1C5sNwNX6KQTx8m0Y
         YShwxtnCPnhB7Wit/iJBr1wyJUrI/r+RlVlpywyb2iaOBVWNQ/x3MV26Lc+kGJo+oYfL
         M3OvwmAda6xO+VTK13DzLyCXa+vnmDbVQ6PWXWkOD5LsMheVxG6w9on31YSqFfJxh6eS
         FnyZRoNxLRG41leYXFK7N4S3TYrTCLShxjrhlD3nczA7nTDRguRsPfOry/laQ0Ws1AA/
         ELjhRknAvwmsE4xGPbC/+0lkulLcAl8rKk1VGBEn5U7vB0hp9jAP/k+3pmClSETYOXxM
         cHMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13-20020ac87dcd000000b0041807b58d25si3714929qte.615.2023.09.25.07.54.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Sep 2023 07:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qkmyL-0004Bm-Fo; Mon, 25 Sep 2023 10:54:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qkmyI-0003o1-HY; Mon, 25 Sep 2023 10:54:02 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1qkmyE-0000xe-Ek; Mon, 25 Sep 2023 10:54:01 -0400
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvQpL398Pz6J73r;
 Mon, 25 Sep 2023 22:52:42 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 25 Sep
 2023 15:53:52 +0100
Date: Mon, 25 Sep 2023 15:53:51 +0100
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Ankit Agrawal <ankita@nvidia.com>, "alex.williamson@redhat.com"
 <alex.williamson@redhat.com>, "clg@redhat.com" <clg@redhat.com>,
 "shannon.zhaosl@gmail.com" <shannon.zhaosl@gmail.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>, "ani@anisinha.ca"
 <ani@anisinha.ca>, Aniket Agashe <aniketa@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, "Tarun Gupta
 (SW-GPU)" <targupta@nvidia.com>, Vikram Sethi <vsethi@nvidia.com>, "Andy
 Currid" <ACurrid@nvidia.com>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: [PATCH v1 3/4] hw/arm/virt-acpi-build: patch guest SRAT for
 NUMA nodes
Message-ID: <20230925155351.00000638@Huawei.com>
In-Reply-To: <20230925140328.GF13733@nvidia.com>
References: <20230915024559.6565-1-ankita@nvidia.com>
 <20230915024559.6565-4-ankita@nvidia.com>
 <20230915153740.00006185@Huawei.com>
 <BY5PR12MB3763BC1EB9402223B020ABF8B0FFA@BY5PR12MB3763.namprd12.prod.outlook.com>
 <20230925145440.00005072@Huawei.com>
 <20230925140328.GF13733@nvidia.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
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
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: xsgCUmeAy27J

On Mon, 25 Sep 2023 11:03:28 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Sep 25, 2023 at 02:54:40PM +0100, Jonathan Cameron wrote:
> 
> > Possible the ASWG folk would say this is fine and I'm reading too much into
> > the spec, but I'd definitely suggest asking them via the appropriate path,
> > or throwing in a code first proposal for a comment on this special case and
> > see what response you get - my guess is it will be 'fix Linux' :(  
> 
> The goal here is for qemu to emulate what the bare metal environment
> is doing.
> 
> There may be a legitimate question if what the bare metal FW has done
> is legitimate (though let's face it, there are lots of creative ACPI
> things around), but I don't quite see how this is a qemu question?
> 
> Unless you are taking the position that qemu should not emulate this
> HW?

Ok. I'd failed to register that the bare metal code was doing this though
with hindsight I guess that is obvious. Though without more info or
a bare metal example being given its also possible the BIOS was doing
enumeration etc (like CXL does for all < 2.0 devices) and hence was
building SRAT with the necessary memory ranges in place - even if the
driver then does the hot add dance later.

That's dubious and likely to break at some point unless the spec
comprehends this use case, but meh, so are lots of other things and
the hardware vendor gets to pick up the pieces and deal with grumpy
customers.

I don't currently see this as a safe solution for the proposed other
use cases however that are virtualization only.

Jonathan

> 
> Jason

