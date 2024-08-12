Received: by 2002:a17:504:6454:b0:1be9:327d:8ee3 with SMTP id g20csp744371njh;
        Mon, 12 Aug 2024 04:59:41 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXiRPW6aO0vfMUvg6MOxJx5Zjv7kBjkMY1C6E/ANoYR8ypFOwt46CJqSBMmNS26TcuKM6JFOADxVLNTSfddnPWmUVLEAOuU
X-Google-Smtp-Source: AGHT+IFOlSMGDrXIUQL0kl4XjJ3bMzaUn9uXH4g4idi3xVZDMXVInK38ZBk2yDAoxqpjscjMzxKz
X-Received: by 2002:a17:902:e744:b0:1fb:81ec:26e5 with SMTP id d9443c01a7336-201ca1726d0mr714895ad.28.1723463981212;
        Mon, 12 Aug 2024 04:59:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723463981; cv=pass;
        d=google.com; s=arc-20160816;
        b=Kh5pjJBju3OBSTAeuWtGh6jpl73j5XvETAjo4oPcASaqO29P7wNKkHbt5XReTTQe6n
         pQ6nmwI1cmmG1yECEHguyTU4lULYHM2HdxkPykaN3ha2qfj1mL2AUjas8tFKuKSBx+Tt
         KuE6q62xw2tW5rChiCa8vD69So8iUHTFxZVgmpymjixfeKsVt5ZN0LCkwdhXfG5JHwTd
         Qfb7CsGybR1pxmJfXvskbn1VUiiZYi4kZ1PAALIYqfFixk4t2UWfEjoy90AatSH4q6TX
         l//J0Vj6fmlSAE8R8KSpmgI+RvlXvlIvo4APqCH7z9dTRTsfw/889Wio9Fw+MhHuGl9X
         VyWw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=IcRpMkf8d+V3G73B4j7uXCdRLIvu4hkKMDZaqMcRk10=;
        fh=8hhPWDaLECDR00t3pT/7HfeDK+ErVKY51w8y6LeZ92w=;
        b=jkkZbm2bi9h270f1VCmM5lzsX9n9O6pQYK+RUZk/11cunc3dW2yQegMOVzA38FdJh9
         o6vOqtlmo6xxTnWt8SIvVDWd2OJ7Tsj8mIE80aW+g9K6lfel8C63dFkfcfD9xGSSa+JZ
         RTrea30IdRh/GV99578NeM02c0OE8wZ+zEVXFY0Ix/w+GvDjYaerm53+Efx9wVQHx+aT
         2Ev/ecEpB1nlm6lc1Ouk7zJeETmyooFoWZ4hHco7FP1xAaj0V+xJwd8evgCvE5FF1ZwK
         iFtBK6lW6SD8Tg7Cmj6WsnKldwgqCpVAjKwIFcYH/wGuriq187dX8RrGpcwUozSQIOxP
         RrkA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L28D7MxH;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-283033-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-283033-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-283033-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-200bbb586c3si53015145ad.264.2024.08.12.04.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 04:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-283033-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L28D7MxH;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-283033-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-283033-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6D042822CC
	for <alex.bennee@linaro.org>; Mon, 12 Aug 2024 11:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7312178375;
	Mon, 12 Aug 2024 11:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L28D7MxH"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA61B178378
	for <linux-kernel@vger.kernel.org>; Mon, 12 Aug 2024 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723463967; cv=none; b=ScI7PDsr8BqJgqMFY9GUSmhDmg+/j2i7vJ6+/7R/ipZf6MzAewKpCsDh1ObdUJQUTY83Cw2gfmzlb7e6wWxc/jSKa1Av8V0/svGbynH6Hfz+Eii7aa0Zu4jnS3FbYKwiSGPhlsq9D128oS+WU7WBbNJIIC35DhM0nulTXnF/z1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723463967; c=relaxed/simple;
	bh=ZTQKVNT5llOMOqIkBUTETMPYhC9nAw9VreBXFn+pYfU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCWnxgMCW+aSaAwkwDFmcJPXOIb1rsiPTFab7UTRFG76yIE79OjNOh5u8zZ6HSIpAg5QE8fFthVFO0zYxDb0/dz9YjgHrA3pPaTtzFBqTtkjJJDyladvIGgX5VxpDjdHYjWDxFZqMPCqtITZmmpAnWOPirFdK3m2cMQjYJZxR+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L28D7MxH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723463964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IcRpMkf8d+V3G73B4j7uXCdRLIvu4hkKMDZaqMcRk10=;
	b=L28D7MxHV/Vx78nTFr6R4+4kdh67WNyu07Q8TRCDZcnK4MFLyX13Bq5zsAKIVoB7eV2JsF
	GJpV3Y2Zh5Kx/zbamRxNlFw8WZeKCK+TugY1J5ptd8N1fRl/Mae/uY9CFUMn6Q+tn+2N9S
	phLdvD7aKMyHdpvnYc34ELk62Qc21tQ=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-Z17j8rw0NgqtzWzJDZZg7Q-1; Mon, 12 Aug 2024 07:59:23 -0400
X-MC-Unique: Z17j8rw0NgqtzWzJDZZg7Q-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2f0276170f9so39387331fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Aug 2024 04:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723463961; x=1724068761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcRpMkf8d+V3G73B4j7uXCdRLIvu4hkKMDZaqMcRk10=;
        b=WG5wMxk6art3VcH2/Z0DRKTxEVPOHOV4SWLXGQlJkMLTJqbJ88nqzf/83TeZfFpG6b
         qRP8b2WYM1EPtEh9qtJAxwxYQIhinjG/VOUVa7iYkJZxO7OWQQsIXKdK+Uwd2DGSXizg
         86vhR8DsJTzpesNHaI9BxQkaKU5+yvQ1I5m1zcQHj0gCCzAEHwVQdreUopg6T379cR8U
         mKzPO2rs3R2ZVvdKHABsTIFU1M99+UqSWRWBZWUHNA1NPZUr93JdI7TQJJRwBSFjQ/tL
         O4oCqXylbBuDtGYrwSfPdcag7CWUHgXruoUSOweuxlCJMFZNJCoa7J+0HlEQpoR03pPH
         v3AA==
X-Forwarded-Encrypted: i=1; AJvYcCX88pvqL4o2G6WCIyauuO7lFgFPcVzQ0646ZthqjRipKOkCEPZztJzGfG/JKS4zc4ky56v8VRXZTuGReCqku5WYxFQ2o6x9a59CS9NJ
X-Gm-Message-State: AOJu0YyOf8fqNHkqfRIRq68c7b6JyZY3WT1hjg+qzzOahPgPCa4pZIny
	PUDbY6qORNftiBCuMXeBjoK0Vayqrw/jyB/Suor5LigjN06SNviPFTmT035S98mJoNhut5C5+YC
	DaW6YSdtF9QsATxNKOhLoq7NUmewOnm5mrKkBVgxscR1wvNsa9AdzMKTCyKavWQ==
X-Received: by 2002:a2e:b992:0:b0:2ee:7a3e:4721 with SMTP id 38308e7fff4ca-2f1a6cf8bb1mr59401541fa.39.1723463961371;
        Mon, 12 Aug 2024 04:59:21 -0700 (PDT)
X-Received: by 2002:a2e:b992:0:b0:2ee:7a3e:4721 with SMTP id 38308e7fff4ca-2f1a6cf8bb1mr59401391fa.39.1723463960789;
        Mon, 12 Aug 2024 04:59:20 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c775fc9csm98520995e9.47.2024.08.12.04.59.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 04:59:20 -0700 (PDT)
Date: Mon, 12 Aug 2024 13:59:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v6 07/10] docs: acpi_hest_ghes: fix documentation for
 CPER size
Message-ID: <20240812135919.1b4865c6@imammedo.users.ipa.redhat.com>
In-Reply-To: <93ae03bd89b47731f6703dab5925ed2f7a9fd426.1723119423.git.mchehab+huawei@kernel.org>
References: <cover.1723119423.git.mchehab+huawei@kernel.org>
	<93ae03bd89b47731f6703dab5925ed2f7a9fd426.1723119423.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: iniq8VzTvHNk

On Thu,  8 Aug 2024 14:26:33 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> While the spec defines a CPER size of 4KiB for each record,
> currently it is set to 1KiB. Fix the documentation and add
> a pointer to the macro name there, as this may help to keep
> it updated.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  docs/specs/acpi_hest_ghes.rst | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
> index 68f1fbe0a4af..c3e9f8d9a702 100644
> --- a/docs/specs/acpi_hest_ghes.rst
> +++ b/docs/specs/acpi_hest_ghes.rst
> @@ -67,8 +67,10 @@ Design Details
>  (3) The address registers table contains N Error Block Address entries
>      and N Read Ack Register entries. The size for each entry is 8-byte.
>      The Error Status Data Block table contains N Error Status Data Block
> -    entries. The size for each entry is 4096(0x1000) bytes. The total size
> -    for the "etc/hardware_errors" fw_cfg blob is (N * 8 * 2 + N * 4096) bytes.
> +    entries. The size for each entry is defined at the source code as
> +    ACPI_GHES_MAX_RAW_DATA_LENGTH (currently 1024 bytes). The total size
> +    for the "etc/hardware_errors" fw_cfg blob is
> +    (N * 8 * 2 + N * ACPI_GHES_MAX_RAW_DATA_LENGTH) bytes.
>      N is the number of the kinds of hardware error sources.
>  
>  (4) QEMU generates the ACPI linker/loader script for the firmware. The

