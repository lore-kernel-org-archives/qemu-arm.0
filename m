Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp56247eje;
        Tue, 13 Feb 2024 03:09:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVNMjZOZh4faebWMkRlb3MuELqciAROiKSMg0buwy0D2L3e/dS92V4gLJRNZVghTwz4mcV2Jd5Gr3PUTv6iWguksi+mOgcx
X-Google-Smtp-Source: AGHT+IGiBfdxhPuhvK02dyMQuQGb7EZhVAfmzutuRQhlZPWsCPv6IgfQIBJbgzDBenh/JPJWE63C
X-Received: by 2002:a05:622a:1793:b0:42c:7da1:ebb9 with SMTP id s19-20020a05622a179300b0042c7da1ebb9mr4297210qtk.15.1707822580542;
        Tue, 13 Feb 2024 03:09:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707822580; cv=none;
        d=google.com; s=arc-20160816;
        b=EpdDgdB/d2bXy5QPppSDu3l1CUGmSj/3nQvqUg6tLSysXnjXFF49KtL/AZ8Y447enD
         v6bO6Y9zQP+wMcCrWhkxqpeS2EXpV521UK9MGEZHZMf1Jb4ZndTaUYvPTsG4sBS9+sch
         aRK3Oaor8POjd0vQ1I8oN7HNhnt7y6W1yK1gMX2h8FsKKfXxdkYuI3tUw9ZLuaFX/x8k
         ynify0W8vUSEKlqQmD1euAnoHCipU3ryXp9eUbtl/KiGzLwIowHO5sJ6C2FfLQcL7UbG
         qj1Gs+o879Mlq1hPD40KpAlpVpUqMZCykRuJJDj4jbaV9ZzC1sNNVUwoMJ+LGTkyz0rY
         +D1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=FVTfp0hjf6tbmLRdvNE0osBJnT72ZZTj1q2/0hjcaDM=;
        fh=pYpYqj4z4d/WO+pOwnLHZlZ34DSUUCNAqvcZLtwnB10=;
        b=ZscYg5Z1leWNGZhQlmWv8Q/kzT/4LhlM1Cxt31I8Qah7vghqs0G53V7FIKeDnlCOyY
         MBe+TQN+VcxxpIQ51gpr9xnWqP8P4n0XRVhw/cc8Kqqhd8Lof7Xl/qXiM7VP7GksOXfv
         geabNIK4tPpicvR/BZOP1eU7XAEliuiZ2bEwFw5SPenIDyQhp0Rjl17mw+LOGeJC3HAS
         r+wbwTzFXlvpAGgoLjSWoEOzT9dtcEbW6mh0dQWhW3KjBnwKLlCaMzhhCAH55NeDx494
         1FCwT8p45j0YPvcvCl+oIAjtTpRYLXQbyZ807btK54+B5ZmbDNlkvcwBGFN7QbSra6D/
         p6xQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hl1ukN9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCW9rcJJO+v1BlpN4hbQyatORKB4kpvM/1l4fQHnBmoUuh3EE3y+q3CPKKILN0OUkBYGLEobqI8PEFjdqmYS284QYRf09vQq
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u4-20020a05622a010400b0042dac5fe341si1527403qtw.210.2024.02.13.03.09.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 03:09:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hl1ukN9t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZqfI-000210-0p; Tue, 13 Feb 2024 06:09:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZqfF-000206-GY
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:09:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZqfD-0007nc-QF
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707822563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FVTfp0hjf6tbmLRdvNE0osBJnT72ZZTj1q2/0hjcaDM=;
 b=hl1ukN9taIEQ90iS05gSQEM1hYIob+6oPXUJ6la2hAvXJlogb1h2nvoA1Kg7qDl1qm0jM6
 YZ7dJtFGtYEAm7OdHErbnt8qYH1H5YmA5rXw5f/K5+/b67ZdTrw+UvpCev6UVi4Akp7wfv
 tl/FqVM9ELbDjUWMfBf9bs1CIcGXJH8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-U7kgP03-NIu2_SxM3R-zAw-1; Tue, 13 Feb 2024 06:09:21 -0500
X-MC-Unique: U7kgP03-NIu2_SxM3R-zAw-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-a2b6c2a5fddso286674366b.1
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 03:09:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707822560; x=1708427360;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FVTfp0hjf6tbmLRdvNE0osBJnT72ZZTj1q2/0hjcaDM=;
 b=vpns+5CLCFF+4uQ25thJb6jnJbchdp9RpLg1N3f3YCHP/TR43J0H20LDE3fLNdVfXB
 lFEbzQ42pTeki+gx9Yv6uQU8O14wHQ/KmS3N0UKoXHeufAgEYF6uadnr+21/yfB9e3bJ
 KCvM5Ylu2RJ9B3D7S9DRHnJyA2i61XueRr5jvUk8r8eKBiKDldiAkXbM+8eg/qLIfUiq
 3l5IVUc9ft8ufqCB7oRZouex056KCuCwvDhY4MEfv/jezCTMuCa00PLLoi6bBjYnCL02
 XPrcWlb6XZJA86pZJrWJxkWQxaJ5gqHcxAeA0L2aQ9nRLqU5eXMMzeQp9n5fz4y2keYR
 z/9g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVwBPC2rxTGtkJXEpdKrJFr1tNFFOzdKo/xiCBGt6ph3DAHQWu8UX9e/JARQjfvVkWCzuIGx8/NuT9NL/TxHwOp+N0p
X-Gm-Message-State: AOJu0YyyTzOPvNi+VGJtYe4byNLcen10jbwk/GPuH3+C09onN/Ek0eEe
 YCtMjKdULx/yZkAVmWr0RJDr7xPe5WsE1oJiLtgBfE+kEC+egzDuqaiuxSpKvtNf8sBHw7tKeqy
 tk+NwqX2UuItWCcwi0iE11pBbDFyzVimVDsdpaWs+RP/9upqJmw==
X-Received: by 2002:a17:906:b291:b0:a3c:8120:898d with SMTP id
 q17-20020a170906b29100b00a3c8120898dmr4686094ejz.72.1707822560547; 
 Tue, 13 Feb 2024 03:09:20 -0800 (PST)
X-Received: by 2002:a17:906:b291:b0:a3c:8120:898d with SMTP id
 q17-20020a170906b29100b00a3c8120898dmr4686079ejz.72.1707822560232; 
 Tue, 13 Feb 2024 03:09:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWRyg8YXvjYPUpEeudgmDAyV036gzdArX1WgdUajuHWNg4XaOZQaZyKZ4/GnfeARTKbHQok3iy2gfhvzR4bA/BOkSbhV9ZzlL7mgnYys27VglnXHPaGqsnCTdErOEH6Ha8QiU13WgpSumUwVNJ+Lb6e2GhEoar1MBk3njsdHXlgUBx2ztpI8m83AU/i0zZJnvk1RaFZU99/QYq9IpXqUO8fzRYgMBaUv7SLbJFC9Tq2ifU8a8LRZ5jdSIw=
Received: from redhat.com ([2.52.146.238]) by smtp.gmail.com with ESMTPSA id
 qo3-20020a170907874300b00a3d03a5f7acsm498854ejc.65.2024.02.13.03.09.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 03:09:19 -0800 (PST)
Date: Tue, 13 Feb 2024 06:09:13 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com,
 clg@redhat.com, peter.maydell@linaro.org
Subject: Re: [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
Message-ID: <20240213060731-mutt-send-email-mst@kernel.org>
References: <20240117132039.332273-1-eric.auger@redhat.com>
 <20240213044312-mutt-send-email-mst@kernel.org>
 <6d4b5766-f8e2-4889-827d-01d3509239f7@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6d4b5766-f8e2-4889-827d-01d3509239f7@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.774,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: FAYWPlP+E4qS

On Tue, Feb 13, 2024 at 11:32:13AM +0100, Eric Auger wrote:
> Do you have an other concern?

I also worry a bit about migrating between hosts with different
page sizes. Not with kvm I am guessing but with tcg it does work I think?
Is this just for vfio and vdpa? Can we limit this to these setups
maybe?

-- 
MST

