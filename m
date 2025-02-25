Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp101106njg;
        Tue, 25 Feb 2025 01:43:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCAoxvrTeIf46q/WAZm+5Jvoq8HJc5DP7lcdy8sithGRinCQgw3aK7r28QKzkltuuZcrPvWseFNyZ0Ow==@linaro.org
X-Google-Smtp-Source: AGHT+IGwK+HRwDMPTZv1tR1E6FS/KUckfaoaNUoFZVvjAQsKdrjmRHB0Q678u2l4e87cm5Ty/gBr
X-Received: by 2002:a05:620a:2a13:b0:7c0:cb96:8311 with SMTP id af79cd13be357-7c23be2489bmr398243685a.30.1740476628741;
        Tue, 25 Feb 2025 01:43:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740476628; cv=none;
        d=google.com; s=arc-20240605;
        b=HwFTQ3NmRNTDP6kavodNL00dKx16dPS8oId/YUVvQZ9VXUoB/Zc6BNSkbX6gAqcM/W
         a/YoOQae4gb6GbOE6NasP5+3xqN8QYVp63oNHtAw9z40zoTZczw0DnnK18xpUo4t4+rQ
         vKRkTkPqHWRu3iDso0Z7Mj01/C2Zm8xM+IOR24aKhuoYrWxmCDmDGpf+UfN9WUAeSThG
         vUTOwybbzqUnrTvNWjG4v2nieQuHCiCwi4cN8MMtL6I32rP/fHZjYini+Ngr2V0ZIf4p
         sbkuVVMceCUT/llQt4B1S1WnaRzL5u+ZrXrhC/SNldFW4bxQduv+lOlQmmqu0+SZydsc
         oBaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=N5IuXbVC/fE2fpy28ItJZlJGmOxKbKIqaMashXqUdLM=;
        fh=zGYZwWgH3Svzd8qE6wTrLB+keIVLfsnOCiSck6SjezQ=;
        b=Uljc93pGX7ESq8AsX/FObqyRLhcR2DjkmaRnSfTjw9Mv9pm/SZnRSEZ4OAZ3VUrs/r
         oYCINLsQj3XnghKgycnK9eREQLp+YXDRXiDXSXil7wSVSoODbkJccYgHUhpQnVMhqX1r
         AwRp2m3/mExmCTRTdjC6d61sYTa3cfrEvFiRz+gTfsCSr7RBq/WNqo5JC6U68+FO9jlJ
         alp20O8SI5dbWxQ+cqCrtneQhtv+0n2xgowfAyRlihvrp3IVPKFHvelNC4b5zNgYs8cY
         MGFxs22m/HgLyYCMbSWWEHYirkqe4bLWZ8Hwj6/kHyISS3pzR6sL5dR6wJIuaRDQW7KM
         7DwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QjbpLF07;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c23c24d6b3si131949385a.145.2025.02.25.01.43.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 01:43:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QjbpLF07;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmrTZ-000621-8N; Tue, 25 Feb 2025 04:43:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tmrTX-00061U-6m
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 04:43:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tmrTV-0005Zy-4d
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 04:43:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740476614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N5IuXbVC/fE2fpy28ItJZlJGmOxKbKIqaMashXqUdLM=;
 b=QjbpLF07aki1gyhKTleGX0Vk1QmxubQvM2+ICL77t3j4R8Pc4dxU+CFbSTv/KDL74ioKyG
 piGNzbELpYnrdCobnNmYuZuoq2aN+vCGtiLGBBxkIIl5onMmWMM4rpXuZvy0Sfvo2hf877
 fTE59sotshM54SNfqVLFf1Zy/pBZTWM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-d5D_NMM4OeeZGYkzmfuPJg-1; Tue, 25 Feb 2025 04:43:31 -0500
X-MC-Unique: d5D_NMM4OeeZGYkzmfuPJg-1
X-Mimecast-MFC-AGG-ID: d5D_NMM4OeeZGYkzmfuPJg_1740476610
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4393e89e910so29789755e9.0
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 01:43:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740476610; x=1741081410;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N5IuXbVC/fE2fpy28ItJZlJGmOxKbKIqaMashXqUdLM=;
 b=USzNG2+PssYyv4RMxkVTzAdr53kH0L7waWS6bODGT+an6iQWq+qWjVx/0i3wWzu640
 aHb1xppv8junCkLKTqMqAaNL9nAAA1gm8+AuvA4jm1f10iuewYelAqfF6eGoXnfG9RLD
 19hT3XD5PttweVOsPTHAIvLfqMCdyBL21asDM3rCmbDl0MNZI6PJ1072Oq0ZicD9gPSD
 qCEiDbnES/nNzjzY4I2CnccYU1eJXLwuzYCnN2Q4eUoNrVbZkmiUEMJ8sMb+BcutOd2P
 rIJ5+LWpxT5dV38k+f4L6Exr5IfbVrhiomOyGd7BOO9AFIotnq44asySPR8Avr5rScq7
 pUJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5udlbWx4o4b/JDESAluyYVFES9F4Xrf8tDCxBIxBTgwpTqNoNRU7V+LAZbzC6MWRCzwAl3e8CVA==@nongnu.org
X-Gm-Message-State: AOJu0Yy09eMkQxfJ7PuQ3wQHrVNkkaueKm7rkLTTV1i3qB3DMQnBeZZa
 +wVdrjjiB+aEMCGVx0Zf4N0z1QfL6YiKR4TbkAPjq1YQJdZraeZvKbTjz7ZEoiwfaQ0ahCwggUG
 3pU6Yzb3aMFab3dgVu//Ee/9GvfjdTr47Rj691cEWBI2kKHWxjQ==
X-Gm-Gg: ASbGncsZa3iagq4BE8lnAv0WTjhpreWECtnn13EUxOm0nL0jXUL55F49RLfbwt2tugy
 D21dC2Tac6PkiGtrXRkP+NHToCFvPBz8vCFUYVuzjfOM0YmkRO/m9b24H+A8B79PliIoD/uExkx
 IhhJcAwdYYEj8iDu7UVfg7hfpa4iquNruQkmGMXNAqUtUc/x4Y40RL/QLTimCRJMkHuioqXcNla
 6io7Dyrr6/mPg+/XjOmQQYZcwrm5/07pIC63qKx7falSslGbU5a/GH1xDXqU20lt5cWsoucBq+K
 1FCxxvibQW+MYktEtIfZh5eMxaNNV8F4Uz9PWye6uec0hByqagiUe3CFZLKTzV8=
X-Received: by 2002:a05:600c:3c87:b0:439:930a:58aa with SMTP id
 5b1f17b1804b1-43ab0ecc2f2mr24089265e9.0.1740476610522; 
 Tue, 25 Feb 2025 01:43:30 -0800 (PST)
X-Received: by 2002:a05:600c:3c87:b0:439:930a:58aa with SMTP id
 5b1f17b1804b1-43ab0ecc2f2mr24088975e9.0.1740476610069; 
 Tue, 25 Feb 2025 01:43:30 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02ce615sm134946725e9.5.2025.02.25.01.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 01:43:29 -0800 (PST)
Date: Tue, 25 Feb 2025 10:43:27 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/14] acpi/ghes: Use HEST table offsets when
 preparing GHES records
Message-ID: <20250225104327.0a2d1cb4@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250221070221.329bdfb0@foz.lan>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
 <9610ff88cf6fdc59cbfc8871d653fd890391be1e.1738345063.git.mchehab+huawei@kernel.org>
 <20250203153423.3e4de17c@imammedo.users.ipa.redhat.com>
 <20250221070221.329bdfb0@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7IeT-97Ff6H4AgVsxO5QEhW3_-IjykQmzuzflOJDdTs_1740476610
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SDd/qLzQBNzO

On Fri, 21 Feb 2025 07:02:21 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Em Mon, 3 Feb 2025 15:34:23 +0100
> Igor Mammedov <imammedo@redhat.com> escreveu:
> 
> > On Fri, 31 Jan 2025 18:42:44 +0100
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> >   
> > > There are two pointers that are needed during error injection:
> > > 
> > > 1. The start address of the CPER block to be stored;
> > > 2. The address of the ack.
> > > 
> > > It is preferable to calculate them from the HEST table.  This allows
> > > checking the source ID, the size of the table and the type of the
> > > HEST error block structures.
> > > 
> > > Yet, keep the old code, as this is needed for migration purposes.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  hw/acpi/ghes.c         | 132 ++++++++++++++++++++++++++++++++++++-----
> > >  include/hw/acpi/ghes.h |   1 +
> > >  2 files changed, 119 insertions(+), 14 deletions(-)
> > > 
> > > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > > index 27478f2d5674..8f284fd191a6 100644
> > > --- a/hw/acpi/ghes.c
> > > +++ b/hw/acpi/ghes.c
> > > @@ -41,6 +41,12 @@
> > >  /* Address offset in Generic Address Structure(GAS) */
> > >  #define GAS_ADDR_OFFSET 4
> > >  
> > > +/*
> > > + * ACPI spec 1.0b
> > > + * 5.2.3 System Description Table Header
> > > + */
> > > +#define ACPI_DESC_HEADER_OFFSET     36
> > > +
> > >  /*
> > >   * The total size of Generic Error Data Entry
> > >   * ACPI 6.1/6.2: 18.3.2.7.1 Generic Error Data,
> > > @@ -61,6 +67,25 @@
> > >   */
> > >  #define ACPI_GHES_GESB_SIZE                 20
> > >  
> > > +/*
> > > + * Offsets with regards to the start of the HEST table stored at
> > > + * ags->hest_addr_le,    
> > 
> > If I read this literary, then offsets above are not what
> > declared later in this patch.
> > I'd really drop this comment altogether as it's confusing,
> > and rather get variables/macro naming right
> >   
> > > according with the memory layout map at
> > > + * docs/specs/acpi_hest_ghes.rst.
> > > + */    
> > 
> > what we need is update to above doc, describing new and old ways.
> > a separate patch.  
> 
> I can't see anything that should be changed at
> docs/specs/acpi_hest_ghes.rst, as this series doesn't change the
> firmware layout: we're still using two firmware tables:
> 
> - etc/acpi/tables, with HEST on it;
> - etc/hardware_errors, with:
> 	- error block addresses;
> 	- read_ack registers;
> 	- CPER records.
> 
> The only changes that this series introduce are related to how
> the error generation logic navigates between HEST and hw_errors
> firmware. This is not described at acpi_hest_ghes.rst, and both
> ways follow ACPI specs to the letter.
> 
> The only difference is that the code which populates the CPER
> record and the error/read offsets doesn't require to know how
> the HEST table generation placed offsets, as it will basically
> reproduce what OSPM firmware does when handling	HEST events.

section 8 describes old way to get to address to record old CPER,
so it needs to amended to also describe a new approach and say
which way is used for which version.

possibly section 11 might need some messaging as well.


> 
> Thanks,
> Mauro
> 

