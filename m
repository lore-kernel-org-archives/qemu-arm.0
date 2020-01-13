Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4424959lff;
        Mon, 13 Jan 2020 09:45:20 -0800 (PST)
X-Google-Smtp-Source: APXvYqyjTRIYq0tp1NYk2Bo3qzrTYylsGU6Nsu3WbJLGQJJvvdAhOk/NJ/XBWVbbyn5Audz2oHxs
X-Received: by 2002:a05:6830:16d1:: with SMTP id l17mr13206782otr.21.1578937520365;
        Mon, 13 Jan 2020 09:45:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578937520; cv=none;
        d=google.com; s=arc-20160816;
        b=jAiS+yAiSVEtcxL/CYZuptvKeT03aBIJvORLwAZYqTlUh0l0xfznpppmIf0ruiiYff
         jwsvYLtpfYK1iouespfrqjaLidFoAwINj4LC152VwWItWSE7LOkZPc3L/ALWXUZGi9vE
         06j4bu+1rlLhYmcs2XuqKJq08Gbw66gMP+r//aamtzkMrUb14OQYVVb8Vs5elLpgSuAN
         wyLXuIjQ+GovebUQh/GojR6MN4G8DrcLD/SPkFf6GbL2gU3rlTVwYHELrEY/LN+X5O9U
         kFQRe7qauKdMbIyUZoJ6QwQPUC6sV/ztjrAIOQqPd3Y3Jm5aE7QivRf6P4mP2enNscE0
         rKeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=ZjupOVr34zDecwnMFqtNXPvApC4Q2OCWXOaNuSUosdM=;
        b=wtGDzBuO1i9Clcjr7kQtYnHn3QRs0zH/qfzpT1jZbVA6bZADTz1GLWxba2DWGNjpUP
         E7/7qbGe1v9mosOGooGQyY4GOxKYtBDgjhfDB3wRoo0/Nt4iETKeEPj/ireDfPEq+S96
         CiOdSHRoV9/iQBAFyj5STidhrC6aBRRAEm9XJv3973bLtxPr4IKJlWXLl356Ccyz8SHB
         y9Sgo7mps575hFd82d5MK7ehR8tD9FH+O7T8pJfxzLuDfhanbyKX7q2UKMsvr1UCOuNb
         4iHNy7Evvh9kDjfnOC98l0w/UaOGsfNzSRdF+YZ5T8J88OyDBTiGVsm2fqZchYnGbNRZ
         iMKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OUz1zbml;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id s19si7586946otd.9.2020.01.13.09.45.20;
        Mon, 13 Jan 2020 09:45:20 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OUz1zbml;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgAMRpT (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 13 Jan 2020 12:45:19 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:21369 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726109AbgAMRpT (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 13 Jan 2020 12:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578937517;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ZjupOVr34zDecwnMFqtNXPvApC4Q2OCWXOaNuSUosdM=;
        b=OUz1zbmlFyfKsy8aq822AesXDhNIiPxfF1FYRsN4aVwyfhKj1G84GIIz/2GbKoQ/llDCDs
        r4RXzfDvHX1TPgzdK5XUxyCPJSrzWbargUL4Azqsy8a8R1KP9nMFmaqWBA5fVBX1HCpKVR
        eJfZhso//FywyCGUBQIHwbxVy5EgnLs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-EQyERcpHO2KS3VKae6uwbg-1; Mon, 13 Jan 2020 12:45:14 -0500
X-MC-Unique: EQyERcpHO2KS3VKae6uwbg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43FE018B9FC1;
        Mon, 13 Jan 2020 17:45:10 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FB418886A;
        Mon, 13 Jan 2020 17:44:59 +0000 (UTC)
Date:   Mon, 13 Jan 2020 18:44:57 +0100
From:   Andrew Jones <drjones@redhat.com>
To:     Eric Auger <eric.auger@redhat.com>
Cc:     eric.auger.pro@gmail.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 09/16] arm/arm64: ITS: Enable/Disable
 LPIs at re-distributor level
Message-ID: <20200113174457.gg35yyeaftbadqki@kamzik.brq.redhat.com>
References: <20200110145412.14937-1-eric.auger@redhat.com>
 <20200110145412.14937-10-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200110145412.14937-10-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: E4iz1OBIRVej

On Fri, Jan 10, 2020 at 03:54:05PM +0100, Eric Auger wrote:
> This helper function enables or disables the signaling of LPIs
> at redistributor level.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  lib/arm/asm/gic-v3-its.h |  1 +
>  lib/arm/gic-v3-its.c     | 18 ++++++++++++++++++
>  2 files changed, 19 insertions(+)
> 
> diff --git a/lib/arm/asm/gic-v3-its.h b/lib/arm/asm/gic-v3-its.h
> index 93814f7..d2db292 100644
> --- a/lib/arm/asm/gic-v3-its.h
> +++ b/lib/arm/asm/gic-v3-its.h
> @@ -99,6 +99,7 @@ extern struct its_baser *its_lookup_baser(int type);
>  extern void set_lpi_config(int n, u8 val);
>  extern u8 get_lpi_config(int n);
>  extern void set_pending_table_bit(int rdist, int n, bool set);
> +extern void gicv3_rdist_ctrl_lpi(u32 redist, bool set);
>  
>  #endif /* !__ASSEMBLY__ */
>  #endif /* _ASMARM_GIC_V3_ITS_H_ */
> diff --git a/lib/arm/gic-v3-its.c b/lib/arm/gic-v3-its.c
> index 3037c84..c7c6f80 100644
> --- a/lib/arm/gic-v3-its.c
> +++ b/lib/arm/gic-v3-its.c
> @@ -199,3 +199,21 @@ void init_cmd_queue(void)
>  	its_data.cmd_write = its_data.cmd_base;
>  	writeq(0, its_data.base + GITS_CWRITER);
>  }
> +
> +void gicv3_rdist_ctrl_lpi(u32 redist, bool set)
> +{
> +	void *ptr;
> +	u64 val;
> +
> +	if (redist >= nr_cpus)
> +		report_abort("%s redist=%d >= cpu_count=%d\n",
> +			     __func__, redist, nr_cpus);

I'd use {} here because of the multiline call. But, we don't
use the report API in common code. Well, apparently s390 has
report calls in lib/s390x/interrupt.c, but I don't really
agree with that. IMO, common code failures should always
be unexpected and just assert/assert_msg.

> +
> +	ptr = gicv3_data.redist_base[redist];
> +	val = readl(ptr + GICR_CTLR);
> +	if (set)
> +		val |= GICR_CTLR_ENABLE_LPIS;
> +	else
> +		val &= ~GICR_CTLR_ENABLE_LPIS;
> +	writel(val,  ptr + GICR_CTLR);
> +}
> -- 
> 2.20.1
> 

Also, you can squash this patch into whatever is going to make use
of this new helper.

Thanks,
drew
