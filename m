Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp898093nji;
        Fri, 13 Sep 2024 06:27:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVITZAM5Ik+JjxF8IIwukdQ4eA46gFkCAuLyyYLPMJ4JZHJOcVMKpLr0z3ryY2ZTsjGF28N68OpF61xWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFCbo7HBB+bifPTHSh+biM2mmUKfRGittVqRKWLlJ8OT2q2fiFDuvju9Qp1uNJvZbeqaeur
X-Received: by 2002:a05:620a:4007:b0:7a9:c193:6503 with SMTP id af79cd13be357-7ab30d5e84cmr354329385a.38.1726234035544;
        Fri, 13 Sep 2024 06:27:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726234035; cv=none;
        d=google.com; s=arc-20240605;
        b=RuoNNclstU694U3KkkMs+RZID+Eq/qOI4dRWn0VJ2GZJAUwLtz7URoUmF/AZWVNWDn
         65xxnISG4vHHNviBLCanMVez3IPILdF4f7oz4Qqw/JvYJE+TOj+vlEL57r9kqRUKzOJm
         qnsz81w6YoDK+jE3TtwvR2Mv7GB1bhNRNrx0JXwM3SkQaRTFr+fU3koOd3z1Q8MVCfK7
         KPtBJjlJnkZBk25bMrq17NuF+b3qzNogDNAHef+HgjCF5nvWNMSTDgnGYn6WWQNE4rMF
         BJfZCFF2A4ibSO8WC8Ix1jGHKppVmP8vQK1y1eIblpebgOJCZuNSRyMq8Y8ZFHV/iXly
         9b6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=NVH0sTmV6wAWXl5JQ/2OtUPxsq1ekHgHSUsUllsnbsw=;
        fh=/hTy1VVkcFGWx6Gx4W0EWWKMeQwHuPohl8kmI5Z0+TM=;
        b=SCukINhGOT7NYvBauJhLFuqvG8APvvGFgo+NTlr5qhYEd6PwLhRshrGQd5mMK5i0Vr
         p5qyGozj4At0K/MiC/4kgq/i9A9aIgevW7DXvs+40NRhwi/KHl7wyGOiCHiyx/mZ+hwR
         GKSRW/ONj9SQ3U8M3bBjdRzDUcIHbE1yu5D/Ys4h4yoZ3AfamytyOG8v5bs3IrHx0Eme
         v8EaqdGu5Batc4wnLdjpMXJNsHUdpfAzKdaGeoes8Qmpy0oJ8+D4KKoGP4yyvvVNb8uQ
         1oT7y8gHioQK2jALwtOkcgmSYXDT2qgIdwj02a7dOV46BpKzTJzznffcNWZxyC7Wg0B3
         d4KA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a47ea1si1458754385a.476.2024.09.13.06.27.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 13 Sep 2024 06:27:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sp6KO-00054Q-6p; Fri, 13 Sep 2024 09:27:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sp6KM-0004wl-Di; Fri, 13 Sep 2024 09:27:10 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1sp6KK-0004Kp-2E; Fri, 13 Sep 2024 09:27:09 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X4w3w1s5xz6J7LG;
 Fri, 13 Sep 2024 21:23:24 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 8579E140A70;
 Fri, 13 Sep 2024 21:27:04 +0800 (CST)
Received: from localhost (10.48.155.189) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 13 Sep
 2024 15:27:03 +0200
Date: Fri, 13 Sep 2024 14:26:58 +0100
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <zhao1.liu@intel.com>,
 <zhenyu.z.wang@intel.com>, <dapeng1.mi@linux.intel.com>,
 <yongwei.ma@intel.com>, <armbru@redhat.com>, <farman@linux.ibm.com>,
 <peter.maydell@linaro.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>, <linuxarm@huwei.com>,
 <shameerali.kolothum.thodi@huawei.com>, <jiangkunkun@huawei.com>
Subject: Re: [PATCH 2/5] i386/cpu: add IsDefined flag to smp-cache property
Message-ID: <20240913142658.00002da4@huawei.com>
In-Reply-To: <20240913112128.0000074c@Huawei.com>
References: <20240912133829.400-1-alireza.sanaee@huawei.com>
 <20240912133829.400-3-alireza.sanaee@huawei.com>
 <20240913112128.0000074c@Huawei.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.155.189]
X-ClientProxiedBy: lhrpeml100003.china.huawei.com (7.191.160.210) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sJjVXqnrkTsB

On Fri, 13 Sep 2024 11:21:28 +0100
Jonathan Cameron <Jonathan.Cameron@Huawei.com> wrote:

> On Thu, 12 Sep 2024 14:38:26 +0100
> Alireza Sanaee <alireza.sanaee@huawei.com> wrote:
> 
> > This commit adds IsDefined flag to the object and this helps in
> > avoiding extra checks for every single layer of caches in both x86
> > and ARM.  
> Hi Ali,
> 
> You mention x86 here, but no code changes to support that?
> 
> Jonathan
> 
Hi Jonathan,

I used this flag in Patch 4 in build_pptt function.

This flag is one of the todos Liu put as comment on his patch as
well, and it is useful for me too.

Thanks,
Alireza
> > 
> > Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> > ---
> >  hw/core/machine-smp.c | 2 ++
> >  include/hw/boards.h   | 1 +
> >  2 files changed, 3 insertions(+)
> > 
> > diff --git a/hw/core/machine-smp.c b/hw/core/machine-smp.c
> > index 9a28194676..5a02bbf584 100644
> > --- a/hw/core/machine-smp.c
> > +++ b/hw/core/machine-smp.c
> > @@ -371,6 +371,8 @@ bool machine_parse_smp_cache(MachineState *ms,
> >          return false;
> >      }
> >  
> > +    ms->smp_cache.IsDefined = true;
> > +
> >      return true;
> >  }
> >  
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index db2aa2b706..2883a57084 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -373,6 +373,7 @@ typedef struct CpuTopology {
> >  
> >  typedef struct SmpCache {
> >      SmpCacheProperties props[CACHE_LEVEL_AND_TYPE__MAX];
> > +    bool IsDefined;
> >  } SmpCache;
> >  
> >  /**  
> 

