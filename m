Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp256716lfb;
        Wed, 8 Sep 2021 02:16:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCjZNVO6pPlW816urqbvwLN/0YjFaldziBVH/SOP6M5o/d71iQcUiVx2hlewZKfrBkml1H
X-Received: by 2002:a5d:9c89:: with SMTP id p9mr2429043iop.13.1631092593086;
        Wed, 08 Sep 2021 02:16:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631092593; cv=none;
        d=google.com; s=arc-20160816;
        b=JVFxSVVOc0U18+lubkNgd+4VWgLPS7FXh9fvZaHHsKTF1jmGcJMYyny53bWwPBexCV
         XmG+S3BxDqeClwxnvLP41z9LKREn0APQRzjF7pxuX+nTnjVb0j5M1MqH/ng+Fmu0uf4B
         iwC6FTH8Xvlyyl2RCApW9SmbFBd9U5Dyuoz79CxedyYmJ05GMyayeWYrRxpv/ZgXVe/a
         SAjtO6nF/pPKxAQMWlljVmBrruTcBKdM7bzAjNzzb8FeveoeNfIHHPdNbxJktVRh0edW
         Gx60VOTH/U/wCVySIosT4v2/kKPwIQ4oiNK6gqRHqb4VyZPWAuR3CM8bt2SJWlOG7lX4
         /xRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=YAZtghhghlq89lbfSShBZZ/ZsCtccFU+0KD5qQVQlIo=;
        b=rg8dcxesrCIHZGKXFxCHTWBk0kbR8FEmY6Fz5WzeSMfg+xyyykHVarWP8FjmYG1ArL
         IGPV4VazwNd46Rloy5oE95gSvqBlnRJscjJ+yRtB7pBtIEUvLIjyvlS5bCdglovnadlU
         dsPwP0PWIS+uGeft02yH2NoN7KB7nRvetvyeu2oJJx1htLpwwYMU0NiYpP5cb1Pv6a3f
         CQzVzuX3w9BAhsUiABnHHufasvz0an1abVwIE0AYLUdZem/cDVmR+s5J85m723FjD/xS
         fcWGidz9uqaZLGKHkWQuDH7Ng4jmtUNj/ynygeL5gBZGda9SApfFSrMmSIdlBgeXrPCO
         koow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IvrvzJ5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s186si1594270ios.107.2021.09.08.02.16.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Sep 2021 02:16:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IvrvzJ5c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mNth2-0004ez-DI
	for alex.bennee@linaro.org; Wed, 08 Sep 2021 05:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mNtgl-0004e1-NY
 for qemu-arm@nongnu.org; Wed, 08 Sep 2021 05:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1mNtgi-0003y8-B8
 for qemu-arm@nongnu.org; Wed, 08 Sep 2021 05:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631092570;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YAZtghhghlq89lbfSShBZZ/ZsCtccFU+0KD5qQVQlIo=;
 b=IvrvzJ5cQIhGX5cFW63iK6EVheSzhRWAK4ooHSi1un/Q04OFjf9g1eLxt318aI3yLqJj0c
 vLRwNwusa0SQRyc+FrmQiBWCCxyK6sgro1vAWuEDIUFT3fui04Q5ubKNQYP6bO9IsLuUJ9
 1BOsgk8DrDf3Bmyw1DKEf4pXc59xtmo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-UAc240MKNwaY5uEcj2HY6w-1; Wed, 08 Sep 2021 05:16:07 -0400
X-MC-Unique: UAc240MKNwaY5uEcj2HY6w-1
Received: by mail-ej1-f71.google.com with SMTP id
 x21-20020a170906135500b005d8d4900c5eso702396ejb.4
 for <qemu-arm@nongnu.org>; Wed, 08 Sep 2021 02:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YAZtghhghlq89lbfSShBZZ/ZsCtccFU+0KD5qQVQlIo=;
 b=QBKkBH6G5EeZZu+TrB4/bbsQKK+V0EJcYXxToCgGO/Vq8Z8WVuxChXqMZH6sQvF3+w
 H7R4+j91hB+AoqitUTLWaAOjPhkwXR3oWTG95ZbSSCx8hdaeJJuIlLNhJRgA6WinxnGM
 CpDwjSlKmanyTxabpRVki/+AuPXlx5wR/YHLwUOBqSwRko9Hom24megLK3VFJDUf6DKZ
 v8cEcl1UB9AEwVFbgGMTR4WLhvlcMLxWNrlBxNiVxyCORcASNWHb5BtSgQv1OJ1tV282
 ohrACSX9Eu4WqfN0YM7bZfyhjEDnkR/meP0r5SEDhCC1FPcsne6ak5rUM5Xcbnmt1q8r
 f8RQ==
X-Gm-Message-State: AOAM532Zf3gDLd1toY2Ua12UFNr3ycjDjMA5ghcGbt5JTjf3q+PW9qxr
 S+ODJLyx9uKrPY3hQEvcNo0K4onyMD/6vClZdfTuW5nv51wPUVQ7C81DU4LFkSQ1bPyJYpFg1ps
 rC+j6GuNj//+Z
X-Received: by 2002:a05:6402:cab:: with SMTP id
 cn11mr2816066edb.293.1631092566558; 
 Wed, 08 Sep 2021 02:16:06 -0700 (PDT)
X-Received: by 2002:a05:6402:cab:: with SMTP id
 cn11mr2816045edb.293.1631092566377; 
 Wed, 08 Sep 2021 02:16:06 -0700 (PDT)
Received: from gator (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id r6sm672700ejb.119.2021.09.08.02.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 02:14:40 -0700 (PDT)
Date: Wed, 8 Sep 2021 11:14:04 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v2 0/3] hw/arm/virt_acpi_build: Generate DBG2 table
Message-ID: <20210908091404.ov2ku6t3dl6s2ui3@gator>
References: <20210906123139.93593-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210906123139.93593-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: peter.maydell@linaro.org, gshan@redhat.com, mst@redhat.com,
 qemu-devel@nongnu.org, shannon.zhaosl@gmail.com, qemu-arm@nongnu.org,
 imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rwJwUOqN50he

On Mon, Sep 06, 2021 at 02:31:36PM +0200, Eric Auger wrote:
> This series generates the ACPI DBG2 table along with machvirt.
> It applies on top of Igor's
> [PATCH v2 00/35] acpi: refactor error prone build_header() and
> packed structures usage in ACPI tables
> 
> The DBG2 specification can be found at
> https://docs.microsoft.com/en-us/windows-hardware/drivers/bringup/acpi-debug-port-table.
> 
> DBG2 is mandated by ARM SBBR since its v1.0 release (the rationale
> behind is Windows requires it on all systems).
> 
> The DBG2 is used to describe a debug port, used by the kernel debugger.

Hi Eric,

Did you test this in some way with a Linux guest?

Thanks,
drew

> 
> This series and its dependency can be found at
> https://github.com/eauger/qemu.git
> branch: dbg2-v2-igor-v2-fix
> 
> History:
> v1 -> v2:
> - rebase on top of Igor's series and use acpi_init_table/acpi_table_composed
>   and build_append_int_noprefix()
> 
> Eric Auger (3):
>   tests/acpi: Add void table for virt/DBG2 bios-tables-test
>   bios-tables-test: Generate reference table for virt/DBG2
>   hw/arm/virt_acpi_build: Generate DBG2 table
> 
>  hw/arm/virt-acpi-build.c  |  64 +++++++++++++++++++++++++++++++++++++-
>  tests/data/acpi/virt/DBG2 | Bin 0 -> 87 bytes
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 tests/data/acpi/virt/DBG2
> 
> -- 
> 2.26.3
> 

