Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07153CD98CE
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Jun 2026 13:54:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wXfr3-0004WB-O9; Thu, 11 Jun 2026 09:53:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXfqz-0004VQ-RQ
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 09:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1wXfqy-0003Oy-9F
 for qemu-arm@nongnu.org; Thu, 11 Jun 2026 09:53:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1781186030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/VgrPa3naNK/9zGDRnujqRYVwg/TdAvfTE5hbEKZmls=;
 b=Ga1uwUeGks//BqN9jURkSDCpdClSD3xe+a7/mBBpYAbuUnOMlajTyyn/LHAyN4s6ZsAykG
 jSMpggkOum2SLZTMR8Ffwoe3wquHPyzU5dlHL7sHitwyjc7IE2r7klyq7MxL8nzydHjQCY
 zQFgYcTQwvR7tpr7F/CrQ357QXtAIiM=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-gr1LJkGQOIW00zDJFahxhQ-1; Thu, 11 Jun 2026 09:53:48 -0400
X-MC-Unique: gr1LJkGQOIW00zDJFahxhQ-1
X-Mimecast-MFC-AGG-ID: gr1LJkGQOIW00zDJFahxhQ_1781186028
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7eb902b15b7so153253377b3.1
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2026 06:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781186028; x=1781790828;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/VgrPa3naNK/9zGDRnujqRYVwg/TdAvfTE5hbEKZmls=;
 b=eTLNQ2cgskBRZrbAGHbWQghRZlK3le6WNoN2EgFiKyicXIfySaOqfu9mMxpsxDvP7P
 vOVKJg0gtsEqDoiNViUVZvM7SVJFo1L0ZU54XsPadeTl/88yNJSW0Y4Rfi9Zc4cg2btX
 BTqDqDG/h1Uy3h4uHmSNxAxPHHxoycaIFEff6Yd5uhleQ5yEZaBCFvkE+l8HNrx8OMxK
 D9Rpcr/uWtjq7mdDtGiiaZTI8KJCKbU6Wubg15XVh5f6PKgtJYD8+2WGODM69IhwSXCp
 wzSh6hQVIaWGPsVmkceU9Y3iZE/R901NBYMgW2rofJ6RMclHAETNw0iENPNVHEsIU1YY
 kdqw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/rD5L1lBIaJwoZ88KtiHXoFbMZ50iwXx/z/6TywrUPT/7ecVlliPjwA/n14wPxyZFtiZ6nIJKpbw==@nongnu.org
X-Gm-Message-State: AOJu0YyPN4vVdCDiXu3/0JO/jd7sK9SxNTkI5e8skqcilrHpa6mb4RO4
 oOhlFovdVtPD6ZfAHvjoIVTF9yLDHIRbMlIcLW5XwdPwpTMxMRzUkG5y99ep9X1/AfLotSdaZUK
 y4+bMhCGAeP5d/yxO0gbXbCTzePzah49znSd87qfP9q9FmZGeUJ9OyQ==
X-Gm-Gg: Acq92OESevS+zjYQPthtnAs3ENJeovrw4EOF2kvJdrHtCYqALxUhRvoZ1BjL5EaR8r6
 caiIdcKDd0daVHZot2qryfX7wmGmi4sDWhze756EozGIzWGU7XDC0sPWt8QLgcjD/358fS4UJiA
 XoJAOZaxlkrheLl5aCggNtlGUXamMkd7pkrRJvL9Enn10Y3gYQX2VDrh3Vl0AvM8Eb7gqF16glG
 KrHpKbacyns0dSpPxUT1wZ9vHwXF92t7EBcM4COU9v+3ahiqLYirvEDIzTKXd4GUZMUqnhaXHZa
 MU28YeeFVTf4ChS/VdIQ9iJ8eUnc7JMoZoOjELuH6wofzW6Qza50k+YySWO7UE1vYgk7J+UqAtC
 1SSvxjmSkVDf3ow+ddiUMx0/Q8A==
X-Received: by 2002:a05:690c:885:b0:7dd:489:b56a with SMTP id
 00721157ae682-7f65719007bmr30080027b3.25.1781186028046; 
 Thu, 11 Jun 2026 06:53:48 -0700 (PDT)
X-Received: by 2002:a05:690c:885:b0:7dd:489:b56a with SMTP id
 00721157ae682-7f65719007bmr30079707b3.25.1781186027470; 
 Thu, 11 Jun 2026 06:53:47 -0700 (PDT)
Received: from x1.local ([142.189.10.167]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-7f6958cabfesm5548377b3.27.2026.06.11.06.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2026 06:53:47 -0700 (PDT)
Date: Thu, 11 Jun 2026 09:53:45 -0400
From: Peter Xu <peterx@redhat.com>
To: Mark Cave-Ayland <mark.caveayland@nutanix.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Dr . David Alan Gilbert" <dave@treblig.org>,
 Eric Blake <eblake@redhat.com>,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Paolo Bonzini <pbonzini@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Sana Sharma <sansshar@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Juraj Marcin <jmarcin@redhat.com>, qemu-rust@nongnu.org,
 Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 05/10] qom: Create object-property-ptr.[ch]
Message-ID: <aiq96eu4C-8AQwKu@x1.local>
References: <20260609172514.2037645-1-peterx@redhat.com>
 <20260609172514.2037645-6-peterx@redhat.com>
 <73fe919b-d8eb-4b01-8401-f7ecb418eb11@nutanix.com>
MIME-Version: 1.0
In-Reply-To: <73fe919b-d8eb-4b01-8401-f7ecb418eb11@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cll5kt7M_P0WxXt_yh-zobfm5nDcoCUTyGp8wKiEtyM_1781186028
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, Jun 11, 2026 at 01:54:54PM +0100, Mark Cave-Ayland wrote:
> > @@ -2141,4 +2048,10 @@ char *object_property_help(const char *name, const char *type,
> >   G_DEFINE_AUTOPTR_CLEANUP_FUNC(Object, object_unref)
> > +/*
> > + * Object property ptr helpers cannot be included at the beginning of the
> > + * file, because it depends on QOM definitions in current header.
> > + */
> > +#include "qom/object-property-ptr.h"
> 
> I wonder if possibly we might want to let the caller include the extra
> header? But I don't feel too strongly either way.

Yes, I didn't try to when drafting, but I also agree it's cleaner.  It will
need to update existing files (20 .c files) that used the api set.  I'll do
it if we can reach a consensus on the concept.

[...]

> Otherwise looks okay to me:
> 
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

Thanks,

-- 
Peter Xu


