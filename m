Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp1011395ejb;
        Tue, 18 Jun 2024 12:39:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOlwv8Pa4K6YPn2FP2HGL/KYcGUzSXiKfC4cCUn3V6t1n/eKafKfOnstOSKdYENdoeYo6l6rH0GV+fki1LgphD9g/TaNaQ
X-Google-Smtp-Source: AGHT+IHFDl3v1e0EsW2O/ecHSZfha5EXAtSsitFW3yFizh+X6zvNwZflGxTj46Po/6vM2NgNUf6s
X-Received: by 2002:a81:e60c:0:b0:61b:bd7f:c602 with SMTP id 00721157ae682-63a8f9f6f33mr7284347b3.38.1718739558645;
        Tue, 18 Jun 2024 12:39:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718739558; cv=none;
        d=google.com; s=arc-20160816;
        b=0CaNOGU5QY/nCNqLUjF9h/bm+RkJ3Tdx6T/nI4WMGHDbVc08YaYGnKuIPJlYhRbZHl
         RnvXYqV9hNDdwuyPT+Cr6oJ2lMQio02nlwQjKW85FNOk3KcOLYbTMC6K6fAaOw5JE9vR
         yellWZb9gCGK2FIhdI7tqUWFprnlFUnVGGlUfRtSpNZwuVg+Iv9JEo9lQ1KqOPbrTdKO
         lr/RDfnmT8TqLOEI8VfYU9oCeCSnrvQPvLsFhJeJUtMmg2hePu6DP88o8kcnwkhBYCKg
         +PLrTf+DBh2fkcXClD71uNY31lWVG5vb8VMmt2FZ9o2ir7WrHZiYgZMzrmFCRHW3lSpC
         +uwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=xDIvXruFFAQhC7ysQALY4i+N4Zu53we2qMuBlMkoAmQ=;
        fh=RDllTFK17GeM2Pfst24bSaCWmMwE3uBZFK2A5hSFz88=;
        b=pMlXoovh75agX7fMjDrr5UBOhWwTglWQZVqr83qcLoNltQjN6QWcLtxNZFq1iESVKd
         zUH3W0bjrQp53BPCOn9OBHD+lDbVtO5GdbAPN5US1uS7ypT7gMKNdo+XyMlsOZzWbHOQ
         7cgr4lyJ1APhpway/hMgRE8ybesvaK0PZC5ClaetEwHqgfSO9wzr4YDWXEaNIRmysqks
         7AvkOGBdzpw5keccG/XkeruCBKLlmJ5gdspT/uad6jHoVWRghCicH6BUpSmZezruB09+
         2OBBrifA1zCzi2gO7s5Lqt0Eb6h+UcT8NY7CrdX7WeDf4dp8SSTr46H3oULZpI0D86xQ
         Z+IQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bJH+JPNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b423973d47si24692446d6.313.2024.06.18.12.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2024 12:39:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bJH+JPNn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sJefG-0002cM-Ow; Tue, 18 Jun 2024 15:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJefF-0002c6-O2
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 15:38:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1sJefE-00022o-2Y
 for qemu-arm@nongnu.org; Tue, 18 Jun 2024 15:38:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718739523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xDIvXruFFAQhC7ysQALY4i+N4Zu53we2qMuBlMkoAmQ=;
 b=bJH+JPNnGkmv8L0fNYX/gUP0CQxwJfblTl84drL9JC1xwrF3NWjduAt98x6Jr2c4ZTc83x
 fOydRTbhvFXzRuEtmlQrP5tEdDH50Hf2t86zl4Rc9dCKtkRGP9K7cPyJHzOJm95WFWNSzh
 5XH5+tlKkhZbaxEE0oASHBmRGq8uSHI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-jXrKhjNANVibnA4_8oyHjQ-1; Tue, 18 Jun 2024 15:38:39 -0400
X-MC-Unique: jXrKhjNANVibnA4_8oyHjQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2ebe77b877eso43046221fa.1
 for <qemu-arm@nongnu.org>; Tue, 18 Jun 2024 12:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718739517; x=1719344317;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xDIvXruFFAQhC7ysQALY4i+N4Zu53we2qMuBlMkoAmQ=;
 b=Y7vBIm6DpSrDA6Y6uGydJ/A6bRHN/YOC7Ch0t24N3ghGyzYlYesxYgBBkaCYHOZ56d
 6oLXUpVjF2Lsdug/9z6SoYsVrJnsYTaiQ7LYz5k2eSSUQLKsZ2ASkkT3COMQy1as7W3+
 SemkVuNoGbBTr22YlKTHHqUteSev/XClztqKEGtyFqFlZQWQNxOFi/p1uRqYGSeuNaXv
 Dhc4ZyMqlKyEbUOlH6aF08QUVqc9pcZuBuj4DUqT+BmiHpjSOy7cqA2N4JfWkwKxe7pd
 T14m7CRY9G1U1csd2ol5bzpIjmBbDIOl4s2zCQ0DP0Mo+Rs8t6XOzwMsKcvsZtuvkA18
 dNpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5o6jJj98klo4iVkxfuiysx0MkNUrqRWtwUr95vE0cad4/K5lx9Z07bkDDvAbkhODGvh+LJ5wEXomIFvMOdQmr6aIC
X-Gm-Message-State: AOJu0YzIoT122x7U4zNK4NHaIkn5C3Pu99+Dj3sx9Iwnjk2LikNJUx+7
 UPWN2Y1N8Z8Sy+YOHsKiU2cTqPC1aSWRs0Bi9PQJFuHd7iNVo0aF6D2mXhvqRz5CzkUPQ7SuC+n
 UGYpBmswGo1hXX8C+iyR616kDLkwvZIGq/7AC9OJ53JqUAZz1Pw==
X-Received: by 2002:ac2:5317:0:b0:52c:896b:c1f3 with SMTP id
 2adb3069b0e04-52ccaaa9049mr287005e87.65.1718739517579; 
 Tue, 18 Jun 2024 12:38:37 -0700 (PDT)
X-Received: by 2002:ac2:5317:0:b0:52c:896b:c1f3 with SMTP id
 2adb3069b0e04-52ccaaa9049mr286987e87.65.1718739516302; 
 Tue, 18 Jun 2024 12:38:36 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:67bf:ebbb:9f62:dc29:2bdc])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f9e2b306sm198117915e9.16.2024.06.18.12.38.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 12:38:35 -0700 (PDT)
Date: Tue, 18 Jun 2024 15:38:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: peter.maydell@linaro.org, wangxingang5@huawei.com,
 shannon.zhaosl@gmail.com, imammedo@redhat.com, anisinha@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2] hw/arm/virt-acpi-build: Fix IORT id_count
Message-ID: <20240618153725-mutt-send-email-mst@kernel.org>
References: <20240617223945.906996-1-nicolinc@nvidia.com>
 <20240618054729-mutt-send-email-mst@kernel.org>
 <ZnHaNMNlFjhn5Jjb@Asurada-Nvidia>
MIME-Version: 1.0
In-Reply-To: <ZnHaNMNlFjhn5Jjb@Asurada-Nvidia>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.148,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: uk3SZdia7mI/

On Tue, Jun 18, 2024 at 12:04:20PM -0700, Nicolin Chen wrote:
> On Tue, Jun 18, 2024 at 05:49:58AM -0400, Michael S. Tsirkin wrote:
> > On Mon, Jun 17, 2024 at 03:39:45PM -0700, Nicolin Chen wrote:
> > > The IORT doc defines "Number of IDs" ("id_count" in the virt-acpi-build)
> > > to be "the number of IDs in the range minus one". Otherwise, Linux kernel
> > > reports "conflicting mapping for input ID" FW_BUG at the overlapped ID.
> > >
> > > Fixes: 42e0f050e3a5 ("hw/arm/virt-acpi-build: Add IORT support to bypass SMMUv3")
> > > Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> > > ---
> > > Changelog
> > > v2:
> > >  * Moved "-1" to the same line of id_count calculation
> > >  * Added "+1" to the next_range.input_base calculation
> > > v1:
> > >  https://lore.kernel.org/all/20240613234802.828265-1-nicolinc@nvidia.com/
> > >
> > >  hw/arm/virt-acpi-build.c | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index c3ccfef026..631f2c6d04 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -243,7 +243,8 @@ iort_host_bridges(Object *obj, void *opaque)
> > >
> > >              AcpiIortIdMapping idmap = {
> > >                  .input_base = min_bus << 8,
> > > -                .id_count = (max_bus - min_bus + 1) << 8,
> > > +                /* id_count is the number of IDs in the range minus one */
> > > +                .id_count = ((max_bus - min_bus + 1) << 8) - 1,
> > >              };
> > >              g_array_append_val(idmap_blob, idmap);
> > >          }
> > > @@ -298,11 +299,13 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> > >              idmap = &g_array_index(smmu_idmaps, AcpiIortIdMapping, i);
> > >
> > >              if (next_range.input_base < idmap->input_base) {
> > > -                next_range.id_count = idmap->input_base - next_range.input_base;
> > > +                /* id_count is the number of IDs in the range minus one */
> > > +                next_range.id_count = idmap->input_base -
> > > +                                      next_range.input_base - 1;
> > >                  g_array_append_val(its_idmaps, next_range);
> > 
> > 
> > What about other places where id_count is set?
> 
> There are only three places where id_count could be set:
> hw/arm/virt-acpi-build.c:296:                .id_count = ((max_bus - min_bus + 1) << 8) - 1,
> hw/arm/virt-acpi-build.c:422:                next_range.id_count = idmap->input_base -
> hw/arm/virt-acpi-build.c:435:            next_range.id_count = 0xFFFF - next_range.input_base;
> 
> This patch fixes two, while the last one is correct using 0xFFFF.
> 
> > >              }
> > >
> > > -            next_range.input_base = idmap->input_base + idmap->id_count;
> > > +            next_range.input_base = idmap->input_base + idmap->id_count + 1;
> > >          }
> > >
> > 
> > Given this was different previously, did you actually test with multiple ranges?
> 
> Tested by creating 5 buses: input_base increases by 0x400 while
> id_count=0x2ff (0x300 - 1). ITS results look correct to me:
> --------------build_iort: smmu_idmaps
> DEBUG: build_iort_id_mapping: input_base=0xec00, id_count=0x2ff, out_ref=0x48, flags=0
> DEBUG: build_iort_id_mapping: input_base=0xf000, id_count=0x2ff, out_ref=0xa0, flags=0
> DEBUG: build_iort_id_mapping: input_base=0xf400, id_count=0x2ff, out_ref=0xf8, flags=0
> DEBUG: build_iort_id_mapping: input_base=0xf800, id_count=0x2ff, out_ref=0x150, flags=0
> DEBUG: build_iort_id_mapping: input_base=0xfc00, id_count=0x2ff, out_ref=0x1a8, flags=0
> --------------build_iort: its_idmaps
> DEBUG: build_iort_id_mapping: input_base=0x0, id_count=0xebff, out_ref=0x30, flags=0
> DEBUG: build_iort_id_mapping: input_base=0xef00, id_count=0xff, out_ref=0x30, flags=0
> DEBUG: build_iort_id_mapping: input_base=0xf300, id_count=0xff, out_ref=0x30, flags=0
> DEBUG: build_iort_id_mapping: input_base=0xf700, id_count=0xff, out_ref=0x30, flags=0
> DEBUG: build_iort_id_mapping: input_base=0xfb00, id_count=0xff, out_ref=0x30, flags=0
> DEBUG: build_iort_id_mapping: input_base=0xff00, id_count=0xff, out_ref=0x30, flags=0
> 
> Thanks
> Nicolin

Okay. Is it the case that none of these effect the IORT in
./tests/data/acpi/virt/IORT then?

-- 
MST

