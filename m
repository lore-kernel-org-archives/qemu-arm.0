Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2243199njb;
        Tue, 30 Jul 2024 02:11:27 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCV6C6tV8G2l8st7FYN1BVWnPC/VLV/WKtB7a6nd1OtqCV7AT2rHGJQ97Oo3mLGNSKZPT9jnU1804bXhdDnyK5sVixStHC9I
X-Google-Smtp-Source: AGHT+IE/HHkhJyBAgZecuIsGydT0bSE+mbF9mXvY4Rt+lSTLvN7L2JHulOVZceUQCCi+s8LSyM0n
X-Received: by 2002:a05:6a20:9146:b0:1c4:9100:6a1b with SMTP id adf61e73a8af0-1c4a134322dmr8466721637.30.1722330687690;
        Tue, 30 Jul 2024 02:11:27 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1722330687; cv=pass;
        d=google.com; s=arc-20160816;
        b=soHDs46pLWZ35PqTnVhY/qVdhWvfDG3Wf91sgx2ModVyWrSESpiH7o270FQhAmBIeY
         O75eSdZtKueogAtpjfBE6/z3wY2PhnYgeMbo04rF9CmeMnOVJB2oJmYzDZYgPmWYQhdD
         aeqin8ymC6H/dVqUvHSao0V2aEFm5YJFMVAfv4MU3As9XP7lezqYhoaIWmKbSoOf10/u
         7Lzi0PJmDJauW1C/nWfkOy3Dk6g8WLRHYs/gc2XDc5smhaQX5P+pnpOtI4z3CHe5CXez
         fc6xdkgF7TFTIWXfa8vgdmEjutkFjX5Cfs4E+TTsPGu8OCWPy3Zi1OcaOoFW0xqTImuL
         O5yw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-disposition:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=87BHPbG+6hPVAZuMpI0Y1Gv+ZbRVLasRQRex7zDP4SM=;
        fh=gL0kw3NDB8GfNjleNsPSQTywug7fi6SsYwHfjWZe0Uo=;
        b=NliFrN05HXGbjMJxD8vJ+HrRzktp4TpzPE3HIXG71zqHxARo8bTsyrqVTdh88dz1gd
         5UWqIVRowYinV4wAE2zkIVE4Qp/CORS+14RlgoMOz/OWZ2WXJUiVyKEJA52pXh/WnNYo
         EO2zplrCvE16saF86r1bd1bYV+/ZRTnceemwOOfVaD3pwD1WJlf1R1zuKv94VwCLbLW/
         80u1ZrS+uN1eWJqkw4NUPSDI4xs3HBVNv3/wK57QVzgPfmAzbM97EL4LzEvVwuqK2JyB
         4MUoCItjHiqmmKwlz00I4GXuhfWuKww0atpSN8taaXL/xhmAcXZz9PRULCsNSVZaBr/Z
         uSDQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=A2bRXVla;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-22651-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-22651-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-22651-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-1fed7eec249si118614965ad.315.2024.07.30.02.11.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 02:11:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-22651-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=A2bRXVla;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-22651-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-22651-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40243282BD2
	for <alex.bennee@linaro.org>; Tue, 30 Jul 2024 09:11:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C97D3194126;
	Tue, 30 Jul 2024 09:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A2bRXVla"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81997190053
	for <kvm@vger.kernel.org>; Tue, 30 Jul 2024 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722330683; cv=none; b=kLHwHPGIdFIM4Trq0SSiP4afSc3egIw4jpDtUJH0kyTpRzIMb6ZMZfNjfKDwUVNvCboRFVJLgqgupxLzuCnJX+YI/fmiQI/X5W4+nNHBLfwdSmu6xQTxehfmzpV8ZY26+Wajv6Z2zInPFW/9GGT+2U505RY/8HPaYpeSTwjSPr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722330683; c=relaxed/simple;
	bh=Jt/KW4ijgn/wS46aVdfpJ4SG7pm8ZRBktxlKrLmiT2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vjygu6qGAxCRgND4GL6RZ6JuFNGP8RxFnrKovhNA5GvnnWLiamN4+HYdPsLeVrkj4b1JX9vSaMngBn1Eyh+O+Kh3IZbzl67a3FTWfepvxkM+QMlA5rYdkMSIyan13GvQ41onLBQozUULKUskcjtF9KRsX5W7JH2jX36REXnQTe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A2bRXVla; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722330682; x=1753866682;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Jt/KW4ijgn/wS46aVdfpJ4SG7pm8ZRBktxlKrLmiT2Q=;
  b=A2bRXVlaf8wXEgov8z/W7+HQYoD1n3aqtSA2qMUTzqMGfiv2kSXKb4ex
   Ji89znSMUqWGYDz+OCir9bt+9ugOiL2Tab36Z3CuVcp2+e9ah4FSyWs7o
   nZfzJ1sdCn/17+9o4Gox7uZtjruG+++9SDoRZ2jycw6Ytzj/K+p2bEZE2
   s+c04HCaDRB3GfSoAPSmWDooMrYBRCuUVBCCk/pBBEx7F0TUVR+jdpK4I
   GUwEYRaBEVxiQjI9bao3gQzMQWJxtXqpJ1osWozW4Px3CKjCKdwzn8FxN
   tjUQPs/1i7L6mvq3clqbCTcvIXuCYBgI/wbKUIQwvvcWuQQO1Hiu+CFUG
   Q==;
X-CSE-ConnectionGUID: mMx8EHjZQa+NR9HJcj5MUg==
X-CSE-MsgGUID: sTs2uE3dT+WQJuVhSStn7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20082663"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="20082663"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 02:11:21 -0700
X-CSE-ConnectionGUID: yNTegJrdQRCBmSsq7OI9IQ==
X-CSE-MsgGUID: thjTxyPDR4qq5CRxhP60Ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54182560"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.36])
  by fmviesa008.fm.intel.com with ESMTP; 30 Jul 2024 02:11:11 -0700
Date: Tue, 30 Jul 2024 17:26:57 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, alex.williamson@redhat.com,
	andrew@codeconstruct.com.au, andrew@daynix.com,
	arei.gonglei@huawei.com, berrange@redhat.com, berto@igalia.com,
	borntraeger@linux.ibm.com, clg@kaod.org, david@redhat.com,
	den@openvz.org, eblake@redhat.com, eduardo@habkost.net,
	farman@linux.ibm.com, farosas@suse.de, hreitz@redhat.com,
	idryomov@gmail.com, iii@linux.ibm.com, jamin_lin@aspeedtech.com,
	jasowang@redhat.com, joel@jms.id.au, jsnow@redhat.com,
	kwolf@redhat.com, leetroy@gmail.com, marcandre.lureau@redhat.com,
	marcel.apfelbaum@gmail.com, michael.roth@amd.com, mst@redhat.com,
	mtosatti@redhat.com, nsg@linux.ibm.com, pasic@linux.ibm.com,
	pbonzini@redhat.com, peter.maydell@linaro.org, peterx@redhat.com,
	philmd@linaro.org, pizhenwei@bytedance.com, pl@dlhnet.de,
	richard.henderson@linaro.org, stefanha@redhat.com,
	steven_lee@aspeedtech.com, thuth@redhat.com,
	vsementsov@yandex-team.ru, wangyanan55@huawei.com,
	yuri.benditovich@daynix.com, qemu-block@nongnu.org,
	qemu-arm@nongnu.org, qemu-s390x@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH 09/18] qapi/machine: Rename CpuS390* to S390Cpu, and drop
 'prefix'
Message-ID: <Zqix4UGgy4adBVFG@intel.com>
References: <20240730081032.1246748-1-armbru@redhat.com>
 <20240730081032.1246748-10-armbru@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730081032.1246748-10-armbru@redhat.com>
X-TUID: AMwKC0nsrkz3

On Tue, Jul 30, 2024 at 10:10:23AM +0200, Markus Armbruster wrote:
> Date: Tue, 30 Jul 2024 10:10:23 +0200
> From: Markus Armbruster <armbru@redhat.com>
> Subject: [PATCH 09/18] qapi/machine: Rename CpuS390* to S390Cpu, and drop
>  'prefix'
> 
> QAPI's 'prefix' feature can make the connection between enumeration
> type and its constants less than obvious.  It's best used with
> restraint.
> 
> CpuS390Entitlement has a 'prefix' to change the generated enumeration
> constants' prefix from CPU_S390_POLARIZATION to S390_CPU_POLARIZATION.
                         ^^^^^^^^^^^^^^^^^^^^^    ^^^^^^^^^^^^^^^^^^^^^
			 CPU_S390_ENTITLEMENT     S390_CPU_ENTITLEMENT

> Rename the type to S390CpuEntitlement, so that 'prefix' is not needed.
> 
> Likewise change CpuS390Polarization to S390CpuPolarization, and
> CpuS390State to S390CpuState.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  qapi/machine-common.json            |  5 ++---
>  qapi/machine-target.json            | 11 +++++------
>  qapi/machine.json                   |  9 ++++-----
>  qapi/pragma.json                    |  6 +++---
>  include/hw/qdev-properties-system.h |  2 +-
>  include/hw/s390x/cpu-topology.h     |  2 +-
>  target/s390x/cpu.h                  |  2 +-
>  hw/core/qdev-properties-system.c    |  6 +++---
>  hw/s390x/cpu-topology.c             |  6 +++---
>  9 files changed, 23 insertions(+), 26 deletions(-)

[snip]

> diff --git a/qapi/pragma.json b/qapi/pragma.json
> index 59fbe74b8c..beddea5ca4 100644
> --- a/qapi/pragma.json
> +++ b/qapi/pragma.json
> @@ -47,9 +47,9 @@
>          'BlockdevSnapshotWrapper',
>          'BlockdevVmdkAdapterType',
>          'ChardevBackendKind',
> -        'CpuS390Entitlement',
> -        'CpuS390Polarization',
> -        'CpuS390State',
> +        'S390CpuEntitlement',
> +        'S390CpuPolarization',
> +        'S390CpuState',
>          'CxlCorErrorType',
>          'DisplayProtocol',
>          'DriveBackupWrapper',

It seems to be in alphabetical order. The new names don't follow the
original order.

Just the above nits,

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


