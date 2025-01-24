Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp776606njk;
        Fri, 24 Jan 2025 04:40:18 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXL3RBpIPdq+vNK+oBpKjAOGRsIDq978Yng5vKZJ/6e1cvOTdgVxR99/Osk6HDfauDAzJiXVlU8RRfRlw==@linaro.org
X-Google-Smtp-Source: AGHT+IGxC4Ok/ZwISpoCxtlBlZtONCrNhp89DBtcd5XQPHHzVEhMQ22+xDL8MtYfPHMTwn5DyUYM
X-Received: by 2002:a05:6a00:894:b0:725:cd8b:d798 with SMTP id d2e1a72fcca58-72f8b3c81afmr6449749b3a.9.1737722418391;
        Fri, 24 Jan 2025 04:40:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737722418; cv=pass;
        d=google.com; s=arc-20240605;
        b=BiVCcMOj5PqFrX48LJjCMNfoEnn8KM5b5+nKTV4Ps7b/Gcun4lcaUZvBmUwlJeFjoZ
         HyDngDji1k1z6maBrattHfSxzJ+I3IH9geCNIGndDKpmswm1ithuULiKDFKAbuBidxAJ
         i1sdAZz4sa6qfzLAY9OhT512Yntz6x9EFTjY+5ZAS7v8T8Njthd8XUOiYNINW5Cmu6t5
         z0hvzHcBslaiNNvAPdbj+qS5QgsZo9OdPCM4jJaWFn9NCJwsIi/8NA3sLoXJtj5IKyUd
         N5qnff+TVi8RsYxzHAZizdPgRkWEe4BNmgsxx+gyWCCCJsYGtI/xDrDTccJop+fYtY1W
         LI0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=gmgO+HvEIBTtyzELL4enJIOu2DHA7czaRvoBt+3oV6Y=;
        fh=wnqK9rCngjn5e4eYXdjbjgWrR3YjEBz7KLdt1lsP4lM=;
        b=faoMaEbTkrjRIZ5+UKrubnZcq7jxSPKy6QLuXyYRZWPjZRJMc6O3aq8qdqMzL5u5zA
         I7V7dhVa6xEZ70RVEH5rLhDVJvCxMLiTFYIpEemD/JqZcEf5t0ek1/zps1QKhFkr3vId
         N1pnyjkHYu6qCUnVnc1+KJ8ORuH2lEXdMVMAIWq0h1CaPv0Xw9kyBUWcxyFMK0lBvNrg
         RFXimu9yhIjT6QZHxpxuuikqzfC615mU+JkUHgapkDV4OMhnoZ6/oySrXsTT0p4NSR6e
         LjdHRgHKb6N9FYG/Xd9iLqknK66D+QiHR4eryaVi/Gcg6FTtndPxLYCt1vVNmzxV9zuY
         k2vw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FqNR4bM1;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-487918-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-487918-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-487918-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d2e1a72fcca58-72f8a78bb94si2731203b3a.275.2025.01.24.04.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:40:18 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-487918-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FqNR4bM1;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-487918-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-487918-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCDA63AB282
	for <alex.bennee@linaro.org>; Fri, 24 Jan 2025 12:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A2D721B1BE;
	Fri, 24 Jan 2025 12:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FqNR4bM1"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0981721ADB2
	for <linux-kernel@vger.kernel.org>; Fri, 24 Jan 2025 12:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737722414; cv=none; b=ti5eZsuRRLKKHfRsSx4cZsd49qZC8RDDdijPgJ05FcDUVjqBm5GAvi6PpxFUSIz01L2E0aW4YO/4rSfLOtvnAF7EYujjbo4VM1/Rzr2n+POyE7ZsI12JRrXEpvec+Hl4AipvRX5IazP0mgB1annGQ/0AT6GMM9aVQMDca1np8f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737722414; c=relaxed/simple;
	bh=z2qfK994aFyahzILAO92t9pc043wF3ZwFABGjyUpJ8U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IC1pmGAmsUgmI7ISfXPUWp1lCv++0sDw0HbkViCdooV2+2bRtYRuZcfoPAsu3CY6i7muaW3CtuVioj8Fa+f04QHsj2rDKXZ3WgXRe+XAT7QGS1+SAo94U8n4UkLnltQQBCP3c3sSPyczercFp/OKJQwQZamgxI0rYpteKrnDyHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FqNR4bM1; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737722412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gmgO+HvEIBTtyzELL4enJIOu2DHA7czaRvoBt+3oV6Y=;
	b=FqNR4bM1F+geKSBo8Qi2brs70CTnwTlZYMiCfw5izDbiTff1FDxhCWu0D46Xwc1XotG3je
	m76Pp8PzxZpB36LjN2Gjs9ZIoUCMrmHKW56QxexFW1WZsR5KMCODfHsMA7gqGE9lWKcqFG
	5GXkmUDdxSBSZTqudN8EkF4KEUqb3hc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-93lY3d4wOyiqdvPFfAx78A-1; Fri, 24 Jan 2025 07:40:11 -0500
X-MC-Unique: 93lY3d4wOyiqdvPFfAx78A-1
X-Mimecast-MFC-AGG-ID: 93lY3d4wOyiqdvPFfAx78A
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4361ac8b25fso11381605e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 24 Jan 2025 04:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737722409; x=1738327209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmgO+HvEIBTtyzELL4enJIOu2DHA7czaRvoBt+3oV6Y=;
        b=R2gMcY8NKIK+CqAkVdJJpsD201azz3f919H/rtgrUntxrpvAE41VRk2XBqNq43xoKw
         +x6k6fn/AECkhZhdwYWoSRZk58COLSKcVYI3HtUWAK9CPMUkYblI5Iz1QKZp7nPGOZiF
         02Qg/fHsrYycoB7y7LggnWzNOCmowTJrWp+r6ykvb86IWQnKlPEH5HIBaWRdkBzzV4qE
         4V6z7pZ7D6GapgSQwCGkUiItTeUlr1kSyzbdxPLLxjsOWSvwvvQ9JrRZ5iaYxb02lvTN
         sBkbhdbPnQsZTFxQG0DxZKs4egfm96YvkHWfnsmZgboKIdyvqC/GBHICLyiKYkkxCyv3
         0GJA==
X-Forwarded-Encrypted: i=1; AJvYcCWIvX0K3k9bDXUboblXaa8QoWuxLuOJuGd+XL7RF2BEkqqKlyUcKvRuVe4EEjjOrSANjov56G0nXSL0Eh4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKr/G2YYEk1z4zGHivdee5yqKGYWw8lsciI/ab3Z7oX4bnseUK
	CbDrOzBqa59L2GIHeJ4Q5yUoSz2VgMzL5qBJYMKGylTJGvqkrkRJFTVD4I/xteh5Q387+e1y+PA
	W+O+i0O6TAD/CyqevxZqa8kfkSgB8OfcsY7TcISz/iYyqDaELuklub7WH/6S4BwqtrqDGsA==
X-Gm-Gg: ASbGncv7HJSc0GmFUZHh7ndBe1YjNT5+qjd15cT3rH2S5BdgQBUs9p9B/pyALwl9IOl
	hKBSsDs9j99/38FoNS7Kv43yYB/cSodG843enRORWZP12D7XMpNOJpmp2RzZwk6bqxR4DxbH+1q
	DoKaS8NpXFOuzb6OyjcUpZ/R952DJTNMuwCilqzU5yyH8mROwXNuuRA987l6aXffBnBdJsWHoni
	7zv1BdI7RgWjOaPm7htI3OXOBgsKpHgc3+/l2NTqTK69RWlV+qokTrHA5RFuV91RaMiihBmq4Mv
	OfgvFfk7LH/0uiYh5Q4UX4+khCOZiu7cH93mvZHqQw==
X-Received: by 2002:a05:600c:4e09:b0:434:fec5:4ef5 with SMTP id 5b1f17b1804b1-438913e99b0mr309665035e9.14.1737722409034;
        Fri, 24 Jan 2025 04:40:09 -0800 (PST)
X-Received: by 2002:a05:600c:4e09:b0:434:fec5:4ef5 with SMTP id 5b1f17b1804b1-438913e99b0mr309664595e9.14.1737722408588;
        Fri, 24 Jan 2025 04:40:08 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4b9984sm25226475e9.28.2025.01.24.04.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:40:08 -0800 (PST)
Date: Fri, 24 Jan 2025 13:40:07 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Shannon Zhao" <shannon.zhaosl@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/11] qapi/acpi-hest: add an interface to do generic
 CPER error injection
Message-ID: <20250124134007.18b508bc@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250123110032.000052d4@huawei.com>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<769b68a3192cc921fec4c0e5e925552920fdbe71.1737560101.git.mchehab+huawei@kernel.org>
	<20250123110032.000052d4@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: Ie8PzvqNpIci

On Thu, 23 Jan 2025 11:00:32 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Wed, 22 Jan 2025 16:46:27 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Creates a QMP command to be used for generic ACPI APEI hardware error
> > injection (HEST) via GHESv2, and add support for it for ARM guests.
> > 
> > Error injection uses ACPI_HEST_SRC_ID_QMP source ID to be platform
> > independent. This is mapped at arch virt bindings, depending on the
> > types supported by QEMU and by the BIOS. So, on ARM, this is supported
> > via ACPI_GHES_NOTIFY_GPIO notification type.
> > 
> > This patch is co-authored:
> >     - original ghes logic to inject a simple ARM record by Shiju Jose;
> >     - generic logic to handle block addresses by Jonathan Cameron;
> >     - generic GHESv2 error inject by Mauro Carvalho Chehab;
> > 
> > Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Co-authored-by: Shiju Jose <shiju.jose@huawei.com>
> > Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > 
> > ---
> > 
> > Changes since v9:
> > - ARM source IDs renamed to reflect SYNC/ASYNC;
> > - command name changed to better reflect what it does;
> > - some improvements at JSON documentation;
> > - add a check for QMP source at the notification logic.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> Another bonus.
> 
> Few trivial formatting comments, otherwise looks fine to me.
> 
> Jonathan
> 
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index 5d29db3918dd..cf83c959b5ef 100644
> > --- a/hw/acpi/ghes.c
> > +++ b/hw/acpi/ghes.c
> > @@ -547,7 +547,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
> >      /* Write the generic error data entry into guest memory */
> >      cpu_physical_memory_write(cper_addr, cper, len);
> >  
> > -    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
> > +    notifier_list_notify(&acpi_generic_error_notifiers, &source_id);
> >  }
> >  
> >  int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
> > diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c
> > new file mode 100644
> > index 000000000000..02c47b41b990
> > --- /dev/null
> > +++ b/hw/acpi/ghes_cper.c
> > @@ -0,0 +1,32 @@
> > +/*
> > + * CPER payload parser for error injection
> > + *
> > + * Copyright(C) 2024 Huawei LTD.

2025

> > + *
> > + * This code is licensed under the GPL version 2 or later. See the
> > + * COPYING file in the top-level directory.
> > + *
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +
> > +#include "qemu/base64.h"
> > +#include "qemu/error-report.h"
> > +#include "qemu/uuid.h"
> > +#include "qapi/qapi-commands-acpi-hest.h"
> > +#include "hw/acpi/ghes.h"
> > +
> > +void qmp_inject_ghes_error(const char *qmp_cper, Error **errp)
> > +{
> > +  
> Odd blank line that can go.
> 
> > +    uint8_t *cper;
> > +    size_t  len;
> > +
> > +    cper = qbase64_decode(qmp_cper, -1, &len, errp);
> > +    if (!cper) {
> > +        error_setg(errp, "missing GHES CPER payload");
> > +        return;
> > +    }
> > +
> > +    ghes_record_cper_errors(cper, len, ACPI_HEST_SRC_ID_QMP, errp);
> > +}
> > diff --git a/hw/acpi/ghes_cper_stub.c b/hw/acpi/ghes_cper_stub.c
> > new file mode 100644
> > index 000000000000..8782e2c02fa8
> > --- /dev/null
> > +++ b/hw/acpi/ghes_cper_stub.c
> > @@ -0,0 +1,19 @@
> > +/*
> > + * Stub interface for CPER payload parser for error injection
> > + *
> > + * Copyright(C) 2024 Huawei LTD.

2025

> > + *
> > + * This code is licensed under the GPL version 2 or later. See the
> > + * COPYING file in the top-level directory.
> > + *  
> Trivial but I'd drop these trailing blank lines as they don't add
> anything other than making people scroll further.
> 
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qapi/error.h"
> > +#include "qapi/qapi-commands-acpi-hest.h"
> > +#include "hw/acpi/ghes.h"  
> 
> Trivial but doe we need ghes.h?
> 
> > +
> > +void qmp_inject_ghes_error(const char *cper, Error **errp)
> > +{
> > +    error_setg(errp, "GHES QMP error inject is not compiled in");
> > +}  
> 

