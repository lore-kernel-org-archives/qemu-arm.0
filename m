Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1212348njc;
        Mon, 25 Nov 2024 03:31:46 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUGtPH6tjcBjMbQYSyzFr/m6sATsxMn+cGKK73tLr284kYbJ0+R2CoqG653DnQjd8jyWE5pqv+HtWsjjA==@linaro.org
X-Google-Smtp-Source: AGHT+IFhnOxhn3lPaj0NmoMnnLiu1XS7rKgxMxgpUSedqF8aP4UcMOFZyEuWcH0iSB8UsMjfVZsR
X-Received: by 2002:a17:902:e5c1:b0:211:6b68:ae89 with SMTP id d9443c01a7336-2129f2a3b24mr152479205ad.54.1732534305801;
        Mon, 25 Nov 2024 03:31:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732534305; cv=pass;
        d=google.com; s=arc-20240605;
        b=aUhh6fZt5i3roPQkzs1D2Z3NA2nsR83C0zTmmo9BKN3YCpwQ60Vf+ognVFQrMii6sK
         TesDFq9geVbWk6jcWRo7Of9cUrd4j/tfDWCUodDDgw09N0kVrw/y14mUfsNCv2xI6sO0
         NpVg9RBBPDhasG6yvMwRBN7LD6iH4bLbPqh3nqIalpq4Eksm3n5n8R5h3UMtujK5t6PG
         0PZyDnH0DeSwYPISHCUAlZ4qYYi9Ojh50D5c9MGkUDde6BQ1vkzscjIG0B38S0spMC4W
         SQLctDe8jkGH1wKgDIoxcK85beNEE4s2HCl+/jVsQsqq0JDusj5y1MP96e9f+eGmfWuo
         dyLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=ioZmiRBAKHEskfX6C5aHeM5m7JTilpvHhH6Gf5dUAHU=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=FoH/t+vDnimb0P99tvbOI1EJkj2yz4DbXdM9IV54+yfRwKTLCCOEJ65dZIwH3wN4gT
         ySQIckLiXX9BsQY+q7dzYcfGSzcNkdNW6rYvrxHVSC9JmteGqosIr9omh8dYG8AQO92j
         c/uTbzp6+zxZxlPv9yvQMm1SDQqNQNUamAIClNNfysT9H9myofR+hks9u6eoQ4Gbw8LH
         TsUmx9WSR1KuoNXVEkjQyhTmMjZPSoiq4PVGKdnXbJbU6AF3vG8KnwJzMZJvjr5X5JR2
         +KAkQpmT2ywJmZkGa2iSjS6AyGsvw38kZC3N8aHrqY3yJty7DpQyqGUcyG/L7q1rH+L4
         Huyg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-420933-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-420933-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-420933-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d9443c01a7336-2129dc3f557si88332885ad.65.2024.11.25.03.31.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 03:31:45 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-420933-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-420933-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-420933-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 576B1284CB7
	for <alex.bennee@linaro.org>; Mon, 25 Nov 2024 11:31:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D290E10F7;
	Mon, 25 Nov 2024 11:31:40 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 590441531E9
	for <linux-kernel@vger.kernel.org>; Mon, 25 Nov 2024 11:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732534300; cv=none; b=GYmBC6UhRGhT2wkUW9w0nj9UbLVe+WbtyUIK/SG5BDQhmkcWhccJXvNbvY3PncaxHJmyl8tM3pUAlRd2FR4EH0j/Xa2bc9SkQzo/p+0HGUiLIbct5mGIYqpIJwaulk6OeA/f09bRJiQZe5X5Nj1+ZNcFDP2hkyvpD8tbYCDd0sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732534300; c=relaxed/simple;
	bh=tSR2gqF0QhQtoXA9X1m5m0/xdlXG1HpduI1LhY8jPuk=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WCUc7FK1YAWjE4YnUgvF0ewGJ4dYh2S0DXcHmGxdLMVu76KsxRJiuiIvbtuzu9lDZB/Po+5k6bPbGNlgl8Y0vUHkNXntjRKo2nTicdzSLqgzX22wnlzR1MZskOoS7jE9+F8lT7IdsB3nLHQwMvgt0IaNUQTVYPRe2V24d2T+nyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xxk4H5x5Xz6K9Jr;
	Mon, 25 Nov 2024 19:29:03 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id DE5821400CB;
	Mon, 25 Nov 2024 19:31:34 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 25 Nov
 2024 12:31:34 +0100
Date: Mon, 25 Nov 2024 11:31:32 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 4/6] acpi/ghes: Use HEST table offsets when preparing
 GHES records
Message-ID: <20241125113132.000069e1@huawei.com>
In-Reply-To: <20241122113714.04450f6b@foz.lan>
References: <cover.1731486604.git.mchehab+huawei@kernel.org>
	<cf60aee0059d12755c1b9deb2dddb355d8543297.1731486604.git.mchehab+huawei@kernel.org>
	<20241120145930.00003895@huawei.com>
	<20241122113714.04450f6b@foz.lan>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 1miCU80unDCt


> >   
> > > 
> > > Yet, keep the old code, as this is needed for migration purposes.
> > > 
> > > Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> > > ---
> > >  hw/acpi/ghes.c | 98 ++++++++++++++++++++++++++++++++++++++++++++------
> > >  1 file changed, 88 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> > > index c93bbaf1994a..9ee25efe8abf 100644
> > > --- a/hw/acpi/ghes.c
> > > +++ b/hw/acpi/ghes.c
> > > @@ -61,6 +61,23 @@
> > >   */
> > >  #define ACPI_GHES_GESB_SIZE                 20
> > >  
> > > +/*
> > > + * Offsets with regards to the start of the HEST table stored at
> > > + * ags->hest_addr_le, according with the memory layout map at
> > > + * docs/specs/acpi_hest_ghes.rst.
> > > + */
> > > +    
> > /*
> >  * ACPI 6.2:
> > 
> > to be consistent with local style.  
> 
> Actually, the local style inside this file was preserved. See, before
> this series we have:
Ah. That's me being lazy and unclear :(
What I meant was

/*
 * ACPI 6.2:  18.3.2.8 Generic Hardware Error Source version 2

So open the comment with a blank line.
 
> 
> $ git grep "ACPI " hw/acpi/ghes.c
> hw/acpi/ghes.c: * ACPI 6.1/6.2: 18.3.2.7.1 Generic Error Data,
> hw/acpi/ghes.c: * ACPI 6.2: 18.3.2.7.1 Generic Error Data,
> hw/acpi/ghes.c: * ACPI 4.0: 17.3.2.7 Hardware Error Notification
> hw/acpi/ghes.c: * ACPI 6.1: 18.3.2.7.1 Generic Error Data
> hw/acpi/ghes.c: * ACPI 6.1: 18.3.2.7.1 Generic Error Data
> hw/acpi/ghes.c:    /* invalid fru id: ACPI 4.0: 17.3.2.6.1 Generic Error Data,
> hw/acpi/ghes.c:         * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
> hw/acpi/ghes.c:     * ACPI 6.1: 18.3.2.8 Generic Hardware Error Source
> 
> >   

> > 
> >   
> > > +        return;
> > > +    }
> > > +
> > > +    cpu_physical_memory_read(hest_addr, &num_sources, sizeof(num_sources));
> > > +    num_sources = le32_to_cpu(num_sources);
> > > +
> > > +    err_source_struct = hest_addr + sizeof(num_sources);
> > > +
> > > +    /*
> > > +     * Currently, HEST Error source navigates only for GHESv2 tables
> > > +     */    
> > 
> > Feels like duplication of the comment below where the type check is.
> > Maybe drop this one?  
> 
> If I recall correctly [1], Igor asked to place such comment, on one of
> the past versions of this code.
> 
> IMO, placing it clearly there helps to identify what needs to change when
> support for non-GHES tables is needed.
> 
> [1] this is the 12th version of this code - my memory is starting to fail
>     to remind were exactly each change was requested.
Me too! :)


> >   
> > > +        addr += sizeof(type);
> > > +        cpu_physical_memory_read(addr, &src_id, sizeof(src_id));
> > > +
> > > +        if (src_id == source_id) {
> > > +            break;
> > > +        }
> > > +
> > > +        err_source_struct += HEST_GHES_V2_TABLE_SIZE;
> > > +    }
> > > +    if (i == num_sources) {
> > > +        error_setg(errp, "HEST: Source %d not found.", source_id);
> > > +        return;
> > > +    }
> > > +
> > > +    /* Navigate though table address pointers */
> > > +    hest_err_block_addr = err_source_struct + GHES_ERR_ST_ADDR_OFFSET;
> > > +    hest_read_ack_addr = err_source_struct + GHES_ACK_OFFSET;    
> >   
> > > +
> > > +    cpu_physical_memory_read(hest_err_block_addr, &error_block_addr,
> > > +                             sizeof(error_block_addr));    
> > So this points to a registers  
> > > +
> > > +    cpu_physical_memory_read(error_block_addr, cper_addr,
> > > +                             sizeof(*cper_addr));    
> > and this reads the register. I'm not sure the spec defines the
> > contents of that register to be constant.  Maybe we should avoid
> > reading the register here and do it instead at read of the record?
> > I 'think' you could in theory use different storage for the CPER
> > depending on other unhandled errors or whatever else meant you didn't
> > want a fixed location.
> > 
> > Or maybe just add a comment to say that the location of CPER storage
> > is fixed.  
> 
> Sorry, but I missed your point. The actual offset of the error block 
> address is defined when fw_cfg callback is called. When this happens,
> this function is called:
> 
> 	void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> 	                          GArray *hardware_error)
> 	{
> 	    /* Create a read-only fw_cfg file for GHES */
> 	    fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
>         	            hardware_error->len);
> 
> 	    /* Create a read-write fw_cfg file for Address */
> 	    fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
> 	        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
> 
> 	    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> 	        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> 
> 	    ags->present = true;
> 	}

My question was intended to be a little different but was based on a misread on my part.
I'd failed to figure out this function is called on each addition of an error
not just once.

Code is fine as is.

Jonathan


> 
> The other calls for fw_cfg functions ensure the offset of the memory read 
> inside the hardware_error firmware and this never changes, as such offsets
> are defined when the hardware_firmware is built at build_ghes_error_table()
> function. This will only change if such function is called again, which
> would, in turn, make acpi_ghes_add_fw_cfg() be called again.
> 
> In any case, no matter if build_ghes_error_table()/acpi_ghes_add_fw_cfg()
> is called only once or multiple times [1], at the time 
> get_ghes_source_offsets() is called, such offsets are stable.
> 
> [1] On some tests I did adding printks, the GHES build logic and the callbacks
>     are called twice - both before loading OSPM.
> 
>     If migration is used, I suspect that it will be called again during
>     migration but before starting OSPM. Again, when get_ghes_source_offsets()
>     is called, the offsets are fixed.
> 
> Thanks,
> Mauro

