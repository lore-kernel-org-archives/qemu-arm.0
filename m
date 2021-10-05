Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp5010310lfp;
        Tue, 5 Oct 2021 08:20:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzW2szAH+pN8pSLAE9KyhhdpxRz4OG3tfNPHrVdv+C0zqM6V7dBfk//+gx4mxFbzyAtF1Jv
X-Received: by 2002:a05:622a:1350:: with SMTP id w16mr20140917qtk.354.1633447243011;
        Tue, 05 Oct 2021 08:20:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633447243; cv=none;
        d=google.com; s=arc-20160816;
        b=uePg7vWD000+l7LKPndy+CFm3ZP0vZZRH0ePKJ4u2LKQM4FPJ+2I68ymlGl+WqwEnf
         BqxJ+2OrRkPezBy/i3/AxaTkzPCvl3/S0IPuFHXP1cgVquGvvI8kwLvqaT1BjV8dsH/v
         1ySBtV909dJeNBSfEe1v+jh4fbNq0tegYPkCYA6aku3jT1eRnRV7Zh5sGUzSxPFIQxMW
         EL3K1AG7gCUnP4OEb0qbblOdd38LzJymllDFAB8JhI6XBfuKBAdZ5WaomPYxGmaFRaBp
         hFgrtwAbYhPELpAuA1/+p74vJUoj51+T+4+avibJPdGG3dHcPZgJ8GuAXN2hOsO/vKZm
         QeSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=E7ckrzHsn4jfi18xHbyGJ35f/6LWrfmPSLonsi9z9PA=;
        b=MO3I8pJ7+aiHdv5Ozu+bXxqPZ8DzQWoI2joDsd6sakjR42A9/DZ1RRJrpsA7LJRwCo
         LkEueQtxwrWCCY2pm9AEbFU7/Rui/1NnvV6NqaQEIkmHYKL1yd8jc7RCyEvCkoVlB+9G
         6Z/tmz+/2hpuNE6Fdk4ijxPZuJWyBclXiEjsieCyP1CbNUGjWfGFNdYLX/NRD0se7om4
         YRGF8gpsmyj3LVnhZLbQw4E0xW/lOjU+U06mRwLisI69mJ4DlZxnipmTIwlb45L/ONkQ
         9ZOl3Bem2nMFgBPb25GlL7Smuw6eSS7uA7+O6/UYRl+MORLjIutC1K+nJZK6PS5KrgUb
         6n9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IwIOg2A1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kj30si13787422qvb.239.2021.10.05.08.20.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Oct 2021 08:20:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IwIOg2A1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mXmFG-0000YN-Cn
	for alex.bennee@linaro.org; Tue, 05 Oct 2021 11:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXm3z-0001NI-BP
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 11:09:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXm3t-0005Yv-VR
 for qemu-arm@nongnu.org; Tue, 05 Oct 2021 11:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633446537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=E7ckrzHsn4jfi18xHbyGJ35f/6LWrfmPSLonsi9z9PA=;
 b=IwIOg2A1X+GkZ5yEWzckVfIFx4aZ3FlezcF8p7Hf+YlUiAJDeEayzfMktSRo81BkYSw0ka
 +2jsLNDzyeFYhPSUl83I8y90UDtsNG9RJMKCErfTz6ob2l57MA3TrQwTNisEayAkircGDv
 /IQYatryEkU4XzbcbozVwAeTiVitR9c=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-cCL0cXBZO4GR0gr3paHM9A-1; Tue, 05 Oct 2021 11:08:53 -0400
X-MC-Unique: cCL0cXBZO4GR0gr3paHM9A-1
Received: by mail-ed1-f70.google.com with SMTP id
 k10-20020a508aca000000b003dad77857f7so5012209edk.22
 for <qemu-arm@nongnu.org>; Tue, 05 Oct 2021 08:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E7ckrzHsn4jfi18xHbyGJ35f/6LWrfmPSLonsi9z9PA=;
 b=yyqzR4WvH+2HMiY5ZfLXrNUd+ZCz8rr3Z7mH5TqCKwoZ/o1hiviFcuEjafqT6J7Feo
 mo2jidLFE8V1DdAIZ7FiCgJ2U+KwpIhcDgPdUKeMhhwHJkgewjrWx7hw88jn2qGTuULQ
 oPTAmWrhi7pG5dN4gh93wYCt8y/6tiDi1hFXGOOscNhajoqunialEeNf3YpusdDhJlUi
 yVioIeS5OWx9sX1m/5IIzRWGnazgyVneZyTCYpfpOKmfd6AAl/K817l8lMxzzsOQiHmt
 EWdWEjbfsr/Bh7qEyl2RjwQCPx4mbO9keTNRuXEuTA/fnrour72k9klkblte0BvPGa3G
 h61A==
X-Gm-Message-State: AOAM5307bJfEavvLFvQfcWc6i8jw+0aDcTlolov86/KO8gZBntXBn/uo
 jQ02ogZDl0GmQUk9h2pvueQAl0SD6SJ6pLsX80H5TQjdPwYISTYaEgZ+5Zl8tIvye98vbXgATVZ
 hAn84a8rEQd+Z
X-Received: by 2002:a17:906:354a:: with SMTP id
 s10mr26628380eja.475.1633446532340; 
 Tue, 05 Oct 2021 08:08:52 -0700 (PDT)
X-Received: by 2002:a17:906:354a:: with SMTP id
 s10mr26628356eja.475.1633446532148; 
 Tue, 05 Oct 2021 08:08:52 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id d18sm3769781ejo.80.2021.10.05.08.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 08:08:51 -0700 (PDT)
Date: Tue, 5 Oct 2021 11:08:47 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v3 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20211005110838-mutt-send-email-mst@kernel.org>
References: <20210927131732.63801-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210927131732.63801-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: duIFnQPFzPrN

On Mon, Sep 27, 2021 at 03:17:29PM +0200, Eric Auger wrote:
> This series generates the ACPI DBG2 table along with machvirt.
> It applies on top of Igor's
> [PATCH v4 00/35] acpi: refactor error prone build_header() and
> packed structures usage in ACPI tables
> 
> The DBG2 specification can be found at
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.
> 
> DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
> behind is Windows requires it on all systems).
> 
> The DBG2 is used to describe a debug port, used by the kernel debugger.
> 
> This series and its dependency can be found at
> https://github.com/eauger/qemu.git
> branch: igor_acpi_refactoring_v4_dbg2_v3


Acked-by: Michael S. Tsirkin <mst@redhat.com>


> History:
> v2 -> v3:
> - addressed all comments from Igor on v2:
>   patches 2/3 swapped
>   style adjustments in "hw/arm/virt_acpi_build: Generate DBG2 table"
>   + more precision on spec references
> 
> v1 -> v2:
> - rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
>   and build_append_int_noprefix()
> 
> 
> Eric Auger (3):
>   tests/acpi: Add void table for virt/DBG2 bios-tables-test
>   hw/arm/virt_acpi_build: Generate DBG2 table
>   bios-tables-test: Generate reference table for virt/DBG2
> 
>  hw/arm/virt-acpi-build.c  |  62 +++++++++++++++++++++++++++++++++++++-
>  tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
>  2 files changed, 61 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/virt/DBG2
> 
> -- 
> 2.26.3

