Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3822267njk;
        Wed, 29 Jan 2025 07:03:41 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXhR+imWqM7mn83tOW0NEJcijUKxjRgCWabA0wiUUKpIUwjmxee2HAw4twVe9gBrgucIiYCevfKJSpj6w==@linaro.org
X-Google-Smtp-Source: AGHT+IGfEjjTn8t8bdJGfOSiJQgEMh87jwWEFTe6G2P9QRQq1bOl/pl2X1kNfO4qFTVLhGXppL4c
X-Received: by 2002:a05:6602:b91:b0:84f:2929:5ec0 with SMTP id ca18e2360f4ac-85427e03357mr378517939f.4.1738163021734;
        Wed, 29 Jan 2025 07:03:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738163021; cv=pass;
        d=google.com; s=arc-20240605;
        b=UVEhg3kuxxm96kdgG2rb2mZKFvZSoonB69Z+2BsK7KwQg86Nsx1N++Ndrz21ih/QJv
         yOe3U3TsQuZ2gN0L29JCQ2XHRKT7rYUW9ijQTDqhNFXaZfCPy9A68tll6LlcCAPNTGJW
         3hF592HaskZX7q32Cmt6Fa4MMREl+17bTKRzN3jxhFkQZxNrS3HymsXjrCieNYYrDCKr
         9ClrA8KD7+i6TqjFM/BO/YdCzECjXO4i/pRDZNK+7Uuu7ChwXkJXVXoYGlXiwdyhebvr
         vSv2UZbA7BFBJo8wfeqdl8aIEuS9DIZw9PRjhK09CheDCvBHTDe9sYCsz0p/UeKXSS+q
         lIqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=g8F6UbpWhrTY3p6ggRWQvHPuy1L909m587AZHbSYcNM=;
        fh=8ZjzcjqCudHnI0MeQ+Lc1Sg43NboHbareQ2fWI7+f6U=;
        b=g4h4UOTVOU9TvPQjo6qVmZ/yCZ62Ie3Qh/a3DMzgHnbM/8eH3+MVpdcj1O/AZxT9iM
         Y6Z/s1LE+9wCqkKMGneNPXVpCGzN72Xb3vtm08IDG8hrNbOiHZDsNETAS6M8lsPBQeza
         GQQSwTbcDgVH88LweOBSKozn0CCKNCy+WuEVc5wfM5ON9dmMqsRSrG3GyImbvI8rbSzV
         Poa2+vrUmfmCqrkc6oC3mIn5hydh/1+y2cuQQ5yrtuZsooLiXYtylJM4oUFVboeI0pAT
         bGLKqVkTU0szxXaqMyPZ+OZvubaIJ7UtS30SRmPVajryVy0w+W8/77dd4iNR3LEk9Y8r
         u6bw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FISRbHO7;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492649-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492649-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-492649-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id ca18e2360f4ac-8521dde9f44si786810039f.22.2025.01.29.07.03.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:03:41 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492649-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FISRbHO7;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492649-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492649-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EA9A3A3CF5
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 15:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9424117BB21;
	Wed, 29 Jan 2025 15:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FISRbHO7"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74C34C83
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 15:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738163017; cv=none; b=BIZdnm0kJVtjEtiJg2Cz6tVDxg+M7AJJ1GCKvq8to+DvyOa3z26ZeKnIpbYo56mOb+tZah+2kN3BEN9DrFXT0EzJuUrIKURXunXxDPBMBuGcfYCRqhpWKvUFEfYerb02M6v3qrNxnCDPViJ0Gif9/BMJ7zus8h0gISw+QUqzG8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738163017; c=relaxed/simple;
	bh=UAl35ppTie324CIGjG+HC6Vv483TaR/4S+lLMF1PDmM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=htDcCNW2zlW7ITYxZ+tH6zpBGIfce4GxEHmFnLpVQ1z2UsSDc6yfwxUPai9V658dnYISQ/tQc2Etq+DdGZS2WOeXjmqywTF6UV2ZxQkJL0ToQhOTU86ZptF2YhsERyTQTNi+cIJfck9SviF2TYu7PAgG/PSGfI2QIIaWBS1behA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FISRbHO7; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738163014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g8F6UbpWhrTY3p6ggRWQvHPuy1L909m587AZHbSYcNM=;
	b=FISRbHO7GzliY87rHd56m2KPafTEjkm3igUu0t4peljRvJp5UCCJp3xd7EyIoiGqd6Izrl
	FZAYMXxiA9/v23jjlvWdUTbX7/5fOLoEgDhTvkNaVkXr92fSkvP+0fDkW5v1lQXiZtj/UP
	n7pMwFmmul/3qQVjwLACXoc51fmAJr0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-330-wZz7z6pYOri2VwmrrOIHQw-1; Wed, 29 Jan 2025 10:03:33 -0500
X-MC-Unique: wZz7z6pYOri2VwmrrOIHQw-1
X-Mimecast-MFC-AGG-ID: wZz7z6pYOri2VwmrrOIHQw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-385d52591d6so379520f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 07:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738163012; x=1738767812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g8F6UbpWhrTY3p6ggRWQvHPuy1L909m587AZHbSYcNM=;
        b=cTdix2/QT3z99X4E3+/7Prc3+0UEJGIaHwfuTj6j1NOA4Qgo5lICmV8eK6t399HO2w
         0feESvxyawG9NfRirR8cx6eqAkRqbdgZt0Pf5QOcx1abUO2HgqqC2HXAjHnpb4GN4Dbb
         3guoKK/56hDtp0dkrlSFYYEBdMF0ky0M/7QJexfIOF+xHBiJEhmqNz50HwPO9Dfp8IoA
         Ys5ajUbj4w6mG0fNxVqE2NUqI6N+CJ+7mNNb8zmClUN8PJVszwk+UvvhSiz2IUW643QI
         1OwVetNeN4NYPoTYUwlwfCuNosrfWl1Oy/HsEuu7iUTPDUGCNLpF2Qwb5epvNYzUaeFM
         +uVA==
X-Forwarded-Encrypted: i=1; AJvYcCXDd9CBIlJCMx/DcSLUAs3fqUzNB55c1HqrCg4YAySyG8D09krLihgKbqiflIwnHaNsQTSVLgM0y333JLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8MSM96B7qVQg1fZXdlz2T03qiqXhfUe2lGNMuNrzNFxddfIdH
	pw6irCaSFch7dRnRExJboHvtl1RTqwUK7uglr790cks83d4l8QihsCm11zP2EiOg7gB4qfty2wC
	ClnroxUCwZ8mZ1qp7LyicDNtt8Bm5MMpXMVR/Nu+2gGakEBeDV6GPdmdSvyzt4w==
X-Gm-Gg: ASbGncuaZzqqsF6Yxna9NHWhcBa95d4XzBQ4ahiyUO4Byea26g1d6Ka0QySMF/Jn9bB
	0Au1KW6F4EtFYMMaptqcs1O4ZXajSvMKZ/CRssTcUqBiklOdcuqDUpBS/2qChIGhFvv7ubV7BLF
	iNfVqqHNHAugAQA+sz9ahxOlfqStX+OBm99N0z1va4qBnFFCmEmCQWMOvdzD3ZA0ZgwK5BfHXgh
	BO+UqoABRNKXDLs3ag3CHUk/YoYHIikwCrdZs6iNkV96QUNIMZb+CN3uBcbblIQKPKguJJ0rYM/
	Pch1pCtno6eRa+b09QMHT+Yl2kJmhBvBBb8huVtNHphN0kCGkSwq
X-Received: by 2002:a05:6000:2a5:b0:386:4332:cc99 with SMTP id ffacd0b85a97d-38c49a6335amr6485404f8f.17.1738163011534;
        Wed, 29 Jan 2025 07:03:31 -0800 (PST)
X-Received: by 2002:a05:6000:2a5:b0:386:4332:cc99 with SMTP id ffacd0b85a97d-38c49a6335amr6485337f8f.17.1738163010931;
        Wed, 29 Jan 2025 07:03:30 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a18867esm17008159f8f.43.2025.01.29.07.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 07:03:30 -0800 (PST)
Date: Wed, 29 Jan 2025 16:03:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 02/13] tests/acpi: virt: allow acpi table changes for
 a new table: HEST
Message-ID: <20250129160328.2f66584c@imammedo.users.ipa.redhat.com>
In-Reply-To: <1390b46682f2bac3587239d03a0ba22d18a9a044.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<1390b46682f2bac3587239d03a0ba22d18a9a044.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: /tIvKQ54COrt

On Wed, 29 Jan 2025 09:04:08 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The DSDT table will also be affected by such change.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

move it right before the patch that would actually make changes to tables (10/13)


> ---
>  tests/data/acpi/aarch64/virt/HEST           | 0
>  tests/qtest/bios-tables-test-allowed-diff.h | 2 ++
>  2 files changed, 2 insertions(+)
>  create mode 100644 tests/data/acpi/aarch64/virt/HEST
> 
> diff --git a/tests/data/acpi/aarch64/virt/HEST b/tests/data/acpi/aarch64/virt/HEST
> new file mode 100644
> index 000000000000..e69de29bb2d1
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8bf4..46298e38e7b8 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,3 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/HEST",
> +"tests/data/acpi/aarch64/virt/DSDT",

the list in not complete so 'make check-qtest' still fails
[12/13] has complete list of changed files

