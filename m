Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp228550ejc;
        Thu, 19 Jan 2023 02:37:32 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsyY5vizrMeWgJHQj5dVQ6VdrsM/mA6+4a6wUjRuA+tqql1GIkk6lMwCCjxX9pG4sqMJ7AY
X-Received: by 2002:a1c:4b19:0:b0:3da:fb5c:8754 with SMTP id y25-20020a1c4b19000000b003dafb5c8754mr5877870wma.2.1674124652799;
        Thu, 19 Jan 2023 02:37:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674124652; cv=none;
        d=google.com; s=arc-20160816;
        b=F32RA0leMzuVlEeei3DziKFnOh86lRE+qm+QZKH1BmrMG02dR4ajwJgfJ+J6o/6yE1
         J09hPGwV4pWnFoDkN+z0Stoz4vOHieJdp9u4QRicexQUpYFfaE2OkCUdGVAvvbhOD/a3
         zQiUAM7ePP1VCB7VMvjYhJfMa1vvzPo426wgSphQKQo6JtRyslLYuPaeRCRuQmB9oD2h
         AsY/gO9ZRd/EnhS0OSyxVgNbB5mc3w3YpjQKqZjZIUg3HSbePkxYIUT33eYaHWNj5yjq
         zQWRfBwLvTLqZ/0/sTQ0ldEjee20PtTnuduk4iXRYOvhklMDGkOqYAlkMbMRRGpoujoL
         Yrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:cc:to:from
         :dkim-signature;
        bh=8I5V5D8SBtVhj5HSttNgb/AXTMEfOIYaAv0dg2hMXPQ=;
        b=PvTdA3uJQcJ1vtaN/qW75dzUUIFbHO3zMQLjiBWgoCW5HqlLT5rn9Ts9H/An2+azdI
         HSw3t2QG+DgZIUKx+zci+OfGvQpVvdf+wAmgXkKBleYpWdXPDsbmABqDHJiQHiVORCtK
         rgXsyR9BRGjwu8hXnzfcjYce+7369suXeqMQJOMjOPHF6kIOpEWOXY93TspsewhCewRh
         p9N6FaZue10POs6u3OfjMFmLy2sH3Lvvau/Akf3GQs6Eo0UyhIrTkJXKf8EqTR5lxXwT
         npdzlgUoHl678POS67F2TYhCwVzYL2YEhRpgft73IEJtPLFc51s7Ve8oWJJeOt+si95b
         QsGQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=afAvy2Fr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e10-20020a05600c438a00b003d9c8dcdd5dsi3929848wmn.102.2023.01.19.02.37.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 02:37:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=afAvy2Fr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pISIG-00089c-UD; Thu, 19 Jan 2023 05:37:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pISIA-00085v-5e
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:37:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pISI8-0003bL-Ci
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 05:37:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674124626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8I5V5D8SBtVhj5HSttNgb/AXTMEfOIYaAv0dg2hMXPQ=;
 b=afAvy2Fr4xiU5B8OdaI5N2STSHY9PrOcGFlzy92YHv218V4/RVqMsBhkj/Gdk7z+INKCvX
 5YwTOrmpZy2OgjytdkC3ctxTqf5tehI3PiwqgjMpIacAlz5Nhh5BbHT7odgT423FULz165
 lqrZAW5zYadlMswA57dFUfU7fjsIze8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-yF-0uHIbPi-6cFyWOvTzDA-1; Thu, 19 Jan 2023 05:37:03 -0500
X-MC-Unique: yF-0uHIbPi-6cFyWOvTzDA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1CB3419705A9;
 Thu, 19 Jan 2023 10:37:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C91291415126;
 Thu, 19 Jan 2023 10:37:01 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A514221E6A28; Thu, 19 Jan 2023 11:37:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org,  richard.henderson@linaro.org,
 pbonzini@redhat.com,  kwolf@redhat.com,  hreitz@redhat.com,
 imp@bsdimp.com,  kevans@freebsd.org,  berrange@redhat.com,
 groug@kaod.org,  mst@redhat.com,  philmd@linaro.org,
 peter.maydell@linaro.org,  alistair@alistair23.me,  jasowang@redhat.com,
 jonathan.cameron@huawei.com,  kbastian@mail.uni-paderborn.de,
 quintela@redhat.com,  dgilbert@redhat.com,  michael.roth@amd.com,
 kkostiuk@redhat.com,  tsimpson@quicinc.com,  palmer@dabbelt.com,
 bin.meng@windriver.com,  qemu-block@nongnu.org,  qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org,  Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v4 18/19] 9p: Drop superfluous include of linux/limits.h
References: <20230119065959.3104012-1-armbru@redhat.com>
 <20230119065959.3104012-19-armbru@redhat.com>
 <5266030.ICAI56zT51@silver>
Date: Thu, 19 Jan 2023 11:37:00 +0100
In-Reply-To: <5266030.ICAI56zT51@silver> (Christian Schoenebeck's message of
 "Thu, 19 Jan 2023 10:50:39 +0100")
Message-ID: <87ilh2vmib.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3rfDmTY0njqP

Christian Schoenebeck <qemu_oss@crudebyte.com> writes:

> On Thursday, January 19, 2023 7:59:58 AM CET Markus Armbruster wrote:
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  hw/9pfs/9p.c | 3 ---
>>  1 file changed, 3 deletions(-)
>> 
>> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
>> index 9621ec1341..aa736af380 100644
>> --- a/hw/9pfs/9p.c
>> +++ b/hw/9pfs/9p.c
>> @@ -17,9 +17,6 @@
>>   */
>>  
>>  #include "qemu/osdep.h"
>> -#ifdef CONFIG_LINUX
>> -#include <linux/limits.h>
>> -#endif
>>  #include <glib/gprintf.h>
>>  #include "hw/virtio/virtio.h"
>>  #include "qapi/error.h"
>> 
>
> Where did that base version come from? I don't see it anywhere in history. 
> Last relevant change in context was a136d17590a.

Current master (7ec8aeb6048) has

    #include "qemu/osdep.h"
    #ifdef CONFIG_LINUX
    #include <linux/limits.h>
    #else
    #include <limits.h>
    #endif
    #include <glib/gprintf.h>

The previous commit changes it to

    #include "qemu/osdep.h"
    #ifdef CONFIG_LINUX
    #include <linux/limits.h>
    #endif
    #include <glib/gprintf.h>

because "qemu/osdep.h" already includes <limits.h>.

Clearer now?

