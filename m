Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp282727njk;
        Thu, 23 Jan 2025 09:01:51 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUnXPapq4cn6+2Ub2vYudB7EKiHfbH9Gf4d12jbEsL5J6Sqm60+IpZ2cXkzNY9SHO0jKwvC0BK4dq1qUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFXRllrA++GGLVI9EPS+OlGaQHq8YOIWGx/WeMeYekEZkScHL8OU0ba9r6crUB8nekdU1PY
X-Received: by 2002:a05:6000:1f81:b0:385:eb8b:3ec6 with SMTP id ffacd0b85a97d-38bf5674369mr26526131f8f.29.1737651710430;
        Thu, 23 Jan 2025 09:01:50 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737651710; cv=pass;
        d=google.com; s=arc-20240605;
        b=dsG6v7K+/cUX7zKnD7jnt0LL/SHrXusREKFOijvCcI+DkpD5DlXNR+vDat1IuqvJUS
         LsWXRdn+hjxjtiASgV5ETtClMZK+61Mrwo3i7ud0+k2yxLgcKsf33hA3liIlDTL0fZzm
         GrTOLM/bktZ3LiQwmxwYoKMHbjA0zvOBtmzR8ogBPmQdesLu6h/A4qcmhPZa4Q8N4Nou
         8tK7Rz2EqP30j/PvOEKwky/Groy4Jlm8xTpbGO0ybm7k0xyl4vG7cGQm69cmwfelrgAj
         2Rz1IkgpcRi0n38eHkZqtthUhKobcL9ro0oER+Oc4n2a+UIo2gSrVYEQX/3mOtjgYH7U
         AsDg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=0xSEVQjuB5qFSDSI+3BKxO2wE2xMzcAIDO59glC5e8k=;
        fh=M44bxhIZvT8kFauxyW5hZyB5twaCfOshPk+SZaTr5RU=;
        b=GRhSihrUtJg+xdg5xPhX6O0RCbL707IURugkn2MdzDr/lywZpwEyiBmhmQW1pJlfSK
         UdSNgInXNK0M+2lbDsUrJZ6rA6ltK/sazUyg97qbvBpHqeUxysXAfPVE26/KhwI/rnoh
         4Pw5M9vj87MJ2q2+wQ5f3R7vc8wlK01/zBOgJ5NhBZjskCKtgflZaFL9BnEFJJBuJpzt
         P/7Dz9+xbq3RK0XPQHx759TRlG5tLSVB9vP0mtYj4VnfyPO2DLgrfgW7yowAd1hi+btd
         5ATsz7M8SKIsPGAxjaNcLvs3/aQdUzgctTB388uvNCCple5HBRq+kjIzJ3+Q2gPtilgj
         ku0w==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cwSKpimZ;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486928-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486928-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-486928-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id ffacd0b85a97d-38c2a1ba876si114142f8f.420.2025.01.23.09.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 09:01:49 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486928-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cwSKpimZ;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486928-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486928-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B7428165B1E
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 17:01:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B937DA9C;
	Thu, 23 Jan 2025 17:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cwSKpimZ"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336173EA76
	for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 17:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737651704; cv=none; b=EZwT11uGR8D0BkuYrVUvRdEmPxT/XM8eyEQGN4gkRpvuxky7hGzzdP9Jv5svOmQFzpgCOF++5I6difBQ1tLa4/3mJQzPYgYePs6FpBlMeqhUmUrWpFY/dGmkom3k0a/5/UI0nIusqBmnLlril0iV6VvZj73Ea9nPHimjgBPX+0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737651704; c=relaxed/simple;
	bh=QPtB71YY56DARrVY7Bqf1/h+8jrKUvBo+1jSSX72Vv8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WgCq8l3maKfJHFyAM3+N9aWHuUeEP9nPbFtfUuXxB8heBYZIuHClEt/DTQqoCVhVCX+qIXLQVmJg61534Giu5QKe8NHmaqC5ZUyv4fhcIzpn+PxyKAaU26aPCs9SQcAj/XOAzhXn3QUJlRYlsQMazO0uABH6waIRHPw3TLh/tns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cwSKpimZ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737651700;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0xSEVQjuB5qFSDSI+3BKxO2wE2xMzcAIDO59glC5e8k=;
	b=cwSKpimZui+ZgJRnsS5XdIs0qg7bIlYKkeYN7mwB2vsVg7qpjZCbVaM6jIThLzlpdXqyTz
	okgkEIsptWii5CfP6txQ8kcL50UofGC/NdmQy9ODLrM/CTsq6CtamBTY4MGrxVvX60wzt0
	6sI+8RxDcXhle9KcYKYUF1kXmPI70xc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-177-iUHTQvWbNwKHP0LoLAOoMw-1; Thu, 23 Jan 2025 12:01:39 -0500
X-MC-Unique: iUHTQvWbNwKHP0LoLAOoMw-1
X-Mimecast-MFC-AGG-ID: iUHTQvWbNwKHP0LoLAOoMw
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43628594d34so6634945e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 09:01:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737651698; x=1738256498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0xSEVQjuB5qFSDSI+3BKxO2wE2xMzcAIDO59glC5e8k=;
        b=thC9hWpBpMlcSiJSdSkUhPE8Og7r4J9Gvn9E8wQsSCEUGFzCttlX4ImxOV2zhHr94I
         5DvL6wAotqfDh+GBYqv25oR6Ff0L+98Qemo3q5Is/b/2ozJDnAAQz56DaKf2t53CYumr
         iqi1+c/uW4zJmz2n4hEwDlitI1vrgHPyovFfKA0/qjkCTdF3GhoTb/DPegVayL6CU3b7
         QAHDaxYCzzdCvy+rIo9MrzRKe9H5bv+rQGmqhqONCn4O3Vccmg35oBjvxsA6j5924fqE
         Um9j0TH+jElOH+m9orzHKbkgJ5Ta8bOb1boHfzLQ3pkw5KFRqzqOZ4intnii9s5fHLIK
         VK2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX50FFXWC3N25JmlIvdE1880gIMQmXIIGSA6zxFa67yBCMD9PIr9+acozY0TrszKwB0gvV9x0v5WOg8LpY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTWh0dAVNZLXZVu8s9hEXwV2r/rzd9PiSzhbsQrPEKrJba1CAM
	l8PWJ88VdxkXATnkj3ZSDTyfqYWGE2MzETWx3N9DyxVaF951tVY0dAyszLxx1+/TFP5RbYEX1yw
	uKZr+JyB/YJtDNlg07IbPqQY5slTejDviblsYogrF0fKEaerReHP+4V3Br3dGTw==
X-Gm-Gg: ASbGncvH94lL8/DsZtaL09+8pfMpzh8RFCZzkWKMr1Q6PJI8I14pZrWS1LZRznYh0CM
	Ha42t4IXdXdr/V/PX6dtsOz64hNjH/hM6Ls/xIAQwOCN9f1DZdhnncrO6MX50vSM0gU19U6xeV8
	7axbBXNMiJ2EVR7kGFTXaP0oq8CsmVFnX5f14ic/sytDSd/ZPTFzCMRPh8VDM27BiKxChEY+iQ2
	MnKPNTTtn4s3edTZl8vGYdcxYB+9ehTRsZ5SoM01PpnrpBZ3G8YRrftgzYIJ3hC+fkigdwqr9PU
	/bpd1UDUhVRMZVUS2VzxJxeHpIrdbrAcnm/7qKFcTg==
X-Received: by 2002:a05:600c:218b:b0:436:e751:e417 with SMTP id 5b1f17b1804b1-43891919404mr258599565e9.7.1737651697577;
        Thu, 23 Jan 2025 09:01:37 -0800 (PST)
X-Received: by 2002:a05:600c:218b:b0:436:e751:e417 with SMTP id 5b1f17b1804b1-43891919404mr258598655e9.7.1737651696843;
        Thu, 23 Jan 2025 09:01:36 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1ce51a6sm52744495e9.1.2025.01.23.09.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 09:01:36 -0800 (PST)
Date: Thu, 23 Jan 2025 18:01:35 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 02/11] acpi/ghes: add a firmware file with HEST address
Message-ID: <20250123180135.4f86483f@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250123100217.00007373@huawei.com>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<a3579f6c2c24e764e544f83b6e1b2dbef730e3e3.1737560101.git.mchehab+huawei@kernel.org>
	<20250123100217.00007373@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: HmMZrKfxnvVs

On Thu, 23 Jan 2025 10:02:17 +0000
Jonathan Cameron <Jonathan.Cameron@huawei.com> wrote:

> On Wed, 22 Jan 2025 16:46:19 +0100
> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
> 
> > Store HEST table address at GPA, placing its content at
> > hest_addr_le variable.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >   
> A few trivial things inline.
> 
> Jonathan
> 
> > ---
> > 
> > Change from v8:
> > - hest_addr_lr is now pointing to the error source size and data.
> > 
> > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>  
> Bonus.  I guess you really like this patch :)
> > ---
> >  hw/acpi/ghes.c         | 17 ++++++++++++++++-
> >  include/hw/acpi/ghes.h |  1 +
> >  2 files changed, 17 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > index 3f519ccab90d..34e3364d3fd8 100644
> > --- a/hw/acpi/ghes.c
> > +++ b/hw/acpi/ghes.c
> > @@ -30,6 +30,7 @@
> >  
> >  #define ACPI_HW_ERROR_FW_CFG_FILE           "etc/hardware_errors"
> >  #define ACPI_HW_ERROR_ADDR_FW_CFG_FILE      "etc/hardware_errors_addr"
> > +#define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
> >  
> >  /* The max size in bytes for one error block */
> >  #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
> > @@ -261,7 +262,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
> >      }
> >  
> >      /*
> > -     * tell firmware to write hardware_errors GPA into
> > +     * Tell firmware to write hardware_errors GPA into  
> 
> Sneaky tidy up.  No problem with it in general but adding noise here, so if there
> are others in the series maybe gather them up in a cleanup patch.

+1

> 
> >       * hardware_errors_addr fw_cfg, once the former has been initialized.
> >       */
> >      bios_linker_loader_write_pointer(linker, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, 0,
> > @@ -355,6 +356,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> >  
> >      acpi_table_begin(&table, table_data);
> >  
> > +    int hest_offset = table_data->len;  
should be unsigned, and better uint32_t
but we have a zoo wrt type here all over the place.

  
> 
> Local style looks to be traditional C with definitions at top.  Maybe define
> hest_offset up a few lines and just set it here?

yep, it applies to whole QEMU (i.e. definitions only at the start of the block)

> 
> > +
> >      /* Error Source Count */
> >      build_append_int_noprefix(table_data, num_sources, 4);
> >      for (i = 0; i < num_sources; i++) {
> > @@ -362,6 +365,15 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> >      }
> >  
> >      acpi_table_end(linker, &table);
> > +
> > +    /*
> > +     * tell firmware to write into GPA the address of HEST via fw_cfg,  
> 
> Given the tidy up above, fix this one to have a capital T, or was this
> where you meant to change it?
> 
> > +     * once initialized.
> > +     */
> > +    bios_linker_loader_write_pointer(linker,
> > +                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,  
> 
> Could wrap less and stay under 80 chars as both lines above add up to 70 something
> 
> > +                                     sizeof(uint64_t),
> > +                                     ACPI_BUILD_TABLE_FILE, hest_offset);
> >  }  
> 

