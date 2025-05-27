Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4919998njc;
        Tue, 27 May 2025 09:05:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtBk7CaWomFjj3EHkVhKGn3KtMOzjySZ7B52ei6TWQ393+OBPhxi97rVQOXO7y+H4cWVq9aWhAgDVo5Q==@linaro.org
X-Google-Smtp-Source: AGHT+IH1RqCYSoZ6anttIfj1oSgMhwuMD4jdptaW8Z1qLvC0Mo+pS9dyLv81ROc8aOXajpAjUh3T
X-Received: by 2002:ad4:5761:0:b0:6f8:b0a8:8ab8 with SMTP id 6a1803df08f44-6fa9cff2f47mr212083756d6.4.1748361958970;
        Tue, 27 May 2025 09:05:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748361958; cv=none;
        d=google.com; s=arc-20240605;
        b=knAeKXNg/8AO+dWx7IfsYaRIcatyy+QSTGuD2vp0Anh1ziKDSX5eAgZ732D3kh47GQ
         kaL/hIyxgT8kOKdoXnOoHxDCWgd2szLWlmwbEWrliD68ZSZ98fWW0bu71DkgwmcW8BMI
         m11Q5qShfvWCs9Jz+LKXjqmwMpqxAjFha23FzOn/nLLQRC9n6hYXiKV2RgdZue7LPnHw
         SfNlQoJtNZDQTba+Dq57KnImYIve3PIo8p4m8NzTOU56Tq+1sxyi+1dOuA+R39mzxgya
         jt8sr91MDVwgiBL8rTE0m7hLxat0VLr4NsPnH9BLmCWZpBEiQg5qvitMLrvKRmQhzCKP
         rTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=RykdFHPcbM7jErk+ieCQqs2lKf1g3vkAlSuGttKVVZ8=;
        fh=jB4EPcoGdiUM4ZoSfUtHmHNKdmV0mpTZQN3bLMcLL0I=;
        b=KBi+6UYPGsQe+qosB+TtAJdDQmJN1wKeTCYLb3IkJVCRAkl6J7QN6MQ6qIq+X62TdN
         Qh8yr6XMz5QAkUaljVo6XA3umkMCBLE5DQ4DMZYXIEIcTNZdCfPpsPzLAYuPAn9ZoiOa
         tnhi3uW/zbJnh7D7jM+j/AnYnS5UC5aNnHEsrehIrvXTks741m3p0N5kViV3X+4T8SAu
         w2FHpPnwJ0I1PMu6PZC6IKRA6mBaQd78CXfDfKHYhvtE1yaRPa986M0u6bLcQOZqSAEU
         YrUa0vj+fwAmHOG8IjL1clnZIitjJaqqO+gWAtHV1vNK8/4mFhXk02BZ7hpH5ZIKjYfy
         rcqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-52dbaa41d1csi9678483e0c.115.2025.05.27.09.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 May 2025 09:05:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uJwo7-0007mu-MU; Tue, 27 May 2025 12:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uJwo5-0007mj-G3; Tue, 27 May 2025 12:05:37 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1uJwnx-0006SR-23; Tue, 27 May 2025 12:05:36 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b6HVw1Q9sz6K9D6;
 Wed, 28 May 2025 00:03:52 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 6E8BF14050D;
 Wed, 28 May 2025 00:05:02 +0800 (CST)
Received: from localhost (10.122.19.247) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 27 May
 2025 18:05:01 +0200
Date: Tue, 27 May 2025 17:04:59 +0100
To: "Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Fan Ni
 <fan.ni@samsung.com>, Peter Maydell <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, "linux-cxl@vger.kernel.org"
 <linux-cxl@vger.kernel.org>, "linuxarm@huawei.com" <linuxarm@huawei.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Yuquan Wang
 <wangyuquan1236@phytium.com.cn>, Itaru Kitayama <itaru.kitayama@linux.dev>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v13 2/5] hw/cxl: Make the CXL fixed memory windows devices.
Message-ID: <20250527170459.00002418@huawei.com>
In-Reply-To: <1c90834e-f4ed-4707-8d46-57bc37fbf320@fujitsu.com>
References: <20250513111455.128266-1-Jonathan.Cameron@huawei.com>
 <20250513111455.128266-3-Jonathan.Cameron@huawei.com>
 <1c90834e-f4ed-4707-8d46-57bc37fbf320@fujitsu.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: 8co1JtYVEcvG

On Fri, 16 May 2025 05:44:34 +0000
"Zhijian Li (Fujitsu)" <lizhijian@fujitsu.com> wrote:

> On 13/05/2025 19:14, Jonathan Cameron via wrote:
> > Previously these somewhat device like structures were tracked using a list
> > in the CXLState in each machine.  This is proving restrictive in a few
> > cases where we need to iterate through these without being aware of the
> > machine type. Just make them sysbus devices.  
> Make sense.
> 
> Minor comments inline

> > diff --git a/hw/acpi/cxl.c b/hw/acpi/cxl.c
> > index 9cd7905ea2..20806e5dd4 100644
> > --- a/hw/acpi/cxl.c
> > +++ b/hw/acpi/cxl.c
> > @@ -22,6 +22,7 @@
> >   #include "hw/pci/pci_bridge.h"
> >   #include "hw/pci/pci_host.h"
> >   #include "hw/cxl/cxl.h"
> > +#include "hw/cxl/cxl_host.h"
> >   #include "hw/mem/memory-device.h"
> >   #include "hw/acpi/acpi.h"
> >   #include "hw/acpi/aml-build.h"
> > @@ -135,56 +136,62 @@ static void cedt_build_chbs(GArray *table_data, PXBCXLDev *cxl)
> >    * Interleave ways encoding in CXL 2.0 ECN: 3, 6, 12 and 16-way memory
> >    * interleaving.
> >    */
> > -static void cedt_build_cfmws(GArray *table_data, CXLState *cxls)
> > +static int cedt_build_cfmws(Object *obj, void *opaque)  
> 
> Too much unrelated indent updates in this function

Fan addressed this.  It's due to the loop now being external to this
call.

> 
> 
> >   {
> > -    GList *it;
> > +    struct CXLFixedWindow *fw;
> > +    Aml *cedt = opaque;
> > +    GArray *table_data = cedt->buf;
> > +    int i;
> >   
> > -    for (it = cxls->fixed_windows; it; it = it->next) {
> > -        CXLFixedWindow *fw = it->data;
> > -        int i;
> > +    if (!object_dynamic_cast(obj, TYPE_CXL_FMW)) {
> > +        return 0;  
> 
> Never reach here? It seems the caller has ensured passing TYPE_CXL_FMW obj.

Excellent point.  Further than that, now the iterator is gone
I can just pass in correctly typed pointers from the caller
which is a nice to have as well!

> 
> 
> 
> 
> > +    }
> > +    fw = CXL_FMW(obj);
> >   
> > -        /* Type */
> > -        build_append_int_noprefix(table_data, 1, 1);
> > +    /* Type */
> > +    build_append_int_noprefix(table_data, 1, 1);
> >   
> > -        /* Reserved */
> > -        build_append_int_noprefix(table_data, 0, 1);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 1);
> >   
> > -        /* Record Length */
> > -        build_append_int_noprefix(table_data, 36 + 4 * fw->num_targets, 2);
> > +    /* Record Length */
> > +    build_append_int_noprefix(table_data, 36 + 4 * fw->num_targets, 2);
> >   
> > -        /* Reserved */
> > -        build_append_int_noprefix(table_data, 0, 4);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 4);
> >   
> > -        /* Base HPA */
> > -        build_append_int_noprefix(table_data, fw->mr.addr, 8);
> > +    /* Base HPA */
> > +    build_append_int_noprefix(table_data, fw->mr.addr, 8);
> >   
> > -        /* Window Size */
> > -        build_append_int_noprefix(table_data, fw->size, 8);
> > +    /* Window Size */
> > +    build_append_int_noprefix(table_data, fw->size, 8);
> >   
> > -        /* Host Bridge Interleave Ways */
> > -        build_append_int_noprefix(table_data, fw->enc_int_ways, 1);
> > +    /* Host Bridge Interleave Ways */
> > +    build_append_int_noprefix(table_data, fw->enc_int_ways, 1);
> >   
> > -        /* Host Bridge Interleave Arithmetic */
> > -        build_append_int_noprefix(table_data, 0, 1);
> > +    /* Host Bridge Interleave Arithmetic */
> > +    build_append_int_noprefix(table_data, 0, 1);
> >   
> > -        /* Reserved */
> > -        build_append_int_noprefix(table_data, 0, 2);
> > +    /* Reserved */
> > +    build_append_int_noprefix(table_data, 0, 2);
> >   
> > -        /* Host Bridge Interleave Granularity */
> > -        build_append_int_noprefix(table_data, fw->enc_int_gran, 4);
> > +    /* Host Bridge Interleave Granularity */
> > +    build_append_int_noprefix(table_data, fw->enc_int_gran, 4);
> >   
> > -        /* Window Restrictions */
> > -        build_append_int_noprefix(table_data, 0x0f, 2); /* No restrictions */
> > +    /* Window Restrictions */
> > +    build_append_int_noprefix(table_data, 0x0f, 2);
> >   
> > -        /* QTG ID */
> > -        build_append_int_noprefix(table_data, 0, 2);
> > +    /* QTG ID */
> > +    build_append_int_noprefix(table_data, 0, 2);
> >   
> > -        /* Host Bridge List (list of UIDs - currently bus_nr) */
> > -        for (i = 0; i < fw->num_targets; i++) {
> > -            g_assert(fw->target_hbs[i]);
> > -            build_append_int_noprefix(table_data, PXB_DEV(fw->target_hbs[i])->bus_nr, 4);
> > -        }
> > +    /* Host Bridge List (list of UIDs - currently bus_nr) */
> > +    for (i = 0; i < fw->num_targets; i++) {
> > +        g_assert(fw->target_hbs[i]);
> > +        build_append_int_noprefix(table_data,
> > +                                  PXB_DEV(fw->target_hbs[i])->bus_nr, 4);
> >       }
> > +
> > +    return 0;
> >   }

> > index cae4afcdde..13eb6bf6a4 100644
> > --- a/hw/cxl/cxl-host-stubs.c
> > +++ b/hw/cxl/cxl-host-stubs.c
> > @@ -8,8 +8,12 @@

> > +
> > +struct cfmw_update_state {
> > +    hwaddr base;
> > +    hwaddr maxaddr;
> > +};
> > +
> > +static void cxl_fmws_update(Object *obj, void *opaque)
> > +{
> > +    struct CXLFixedWindow *fw;
> > +    struct cfmw_update_state *s = opaque;
> > +
> > +    if (!object_dynamic_cast(obj, TYPE_CXL_FMW)) {  
> 
> 
> Never reach here? It seems the caller has ensured passing TYPE_CXL_FMW obj.

Also a good point.  Here as well I can simply pass the
correct type of pointer in for this and hwaddr *base, hwaddr max_addr
removing the need for cfmw_update_state()

That is all stale infrastructure from before I changed this handling
to force the device order.

Thanks,

Jonathan

