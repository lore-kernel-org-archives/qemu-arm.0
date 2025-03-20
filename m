Received: by 2002:a17:505:ab84:b0:1be9:327d:8ee3 with SMTP id pj4csp1029468njc;
        Thu, 20 Mar 2025 08:26:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOSzpG4dNX+bYUTEeLns5X3AN/huFPXhOO5Rd1SGjzQ99kwuPb9H3dpO0ikLIwoVCvktd85wj7R1xc8g==@linaro.org
X-Google-Smtp-Source: AGHT+IFe5PHLCIq7yQN1KqAnASoXZy0uVdbE2XId5/5idSfUJOYxfehlB1HxcU+YL7L9cASd24TH
X-Received: by 2002:a05:620a:4712:b0:7c5:3d85:728f with SMTP id af79cd13be357-7c5a83d1841mr1093590285a.25.1742484369096;
        Thu, 20 Mar 2025 08:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742484369; cv=none;
        d=google.com; s=arc-20240605;
        b=hWMuj+UBeyXMvid4fTlbnAOeD43vsV6xdgcGA63M8IgXGl05fkZUIckPVjx862Fsfu
         E0ERE6JjHxHxzPzmzr1u4M4PJvbpNcm6oCsw7TV8LtSWvHPf5FigDDFhrxoL8UTUGXdO
         bHCsfW9Rz2sT3ZRI6Ueajm6UxCuYDGgCyEBlwEHikjhvw9+b1e+8dg2DOK07u/av9Kvs
         g+l8ppSAqhlLZD7DZnUo0neQTmYKzNd/otNVUn7bZw4r9LCyFx/RhNlXfSnyNtFuMKBX
         0b522DAO3bBxFk+egBU+yZEOPcjSXt/XuxVcEmQvOOs9q4gGHFwngUDKP1vdwKbomuUq
         ZkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=iBGyyg2cmq+MCmowrpnaXG1qx8igrtl7GfA+WS5sKB8=;
        fh=nDFlYaei8P8t+7kUhsWaqA5H1A9WTaVnQjIgJeoFoxA=;
        b=Ci86eLGR+V6iitNP8uEOeaY+nG6jw+3w55fTnjovj35CFp0QFnQmLBoyV5ySYUTjRN
         cdf3MQ9ukZjTegaM2wOxlW/h+e9k4PSIdriOfbIRRJml7gULYanMPm+eSN9h+kFE/I9R
         OOd9zDhWdtu269MUE2k21RfwQyrH6QBMzUVRVbJ0JCbutZvJDLPl1cCDmh2v8g2b/eln
         mxY11VEe9oZzwsvgbb+nagQEQD3sWTvIt0mQQXvDSL2qybgZMUW1gPWnlQF5mKj1eTT5
         nIzL3dbz8hTUZD3X0lOq0w/twc0V/mpxLZ6AxRgSmfHuLCPpcX70qGdEKq81y0X44J/a
         L3Dg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="gHXgBX/T";
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c5b93830a8si4530585a.608.2025.03.20.08.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Mar 2025 08:26:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="gHXgBX/T";
       spf=pass (google.com: domain of qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-rust-bounces@nongnu.org>)
	id 1tvHmR-0005so-Iq; Thu, 20 Mar 2025 11:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1tvHlx-0005l1-Ve; Thu, 20 Mar 2025 11:25:33 -0400
Received: from mgamail.intel.com ([198.175.65.16])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhao1.liu@intel.com>)
 id 1tvHlr-0001Gu-RC; Thu, 20 Mar 2025 11:25:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742484324; x=1774020324;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=dAWOaP+0FbLf9uH4qvwuCLfmXr3QhrjyHbQfnvFQ/wA=;
 b=gHXgBX/T34Y/WQS+86qGt4JKxyuVp7Kr5IyhZqNk/RUOvyMVKoAMOlnt
 2qBHwcHVIBXD/Ikr8bpKCSiiB1CWdAWB9WFy3MHzRC29kBTQ0+LjTJ1j5
 O0mAav0nYo0qhHu6/tMOgFiEPpcrh/d8ZkF8LdqoWvJV874Jl2ULgS2/j
 hc11Fb5c0rAsfq3CHqwrQ61/tz7+zvQ4jZpnOq0hGodLRKwnuCLv9MCta
 9heN14zybUX+8B46XOW/jZEp8H5RgMPJguM/NWWtgoQEQQi25xn+Akekf
 l4Tl8NgTvWmfGSH4K3Drw9HhW7FmMr2NbilbiLLN4ujNyhz5mYrXJo+/U w==;
X-CSE-ConnectionGUID: MQ6rG2G3TaWG++V7HWvIIQ==
X-CSE-MsgGUID: xYqmbuLlSLmSc6GpURIr4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11379"; a="43839711"
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="43839711"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Mar 2025 08:25:17 -0700
X-CSE-ConnectionGUID: W2aHOjWmQR+YpemcmgSlIA==
X-CSE-MsgGUID: pQ1MAg9VTZ+92rWx8HeCgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,262,1736841600"; d="scan'208";a="128226883"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost)
 ([10.239.160.39])
 by fmviesa004.fm.intel.com with ESMTP; 20 Mar 2025 08:25:16 -0700
Date: Thu, 20 Mar 2025 23:45:30 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-rust@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] rust: pl011: Check size of state struct at compile
 time
Message-ID: <Z9w4Gttv8QeBRKfZ@intel.com>
References: <20250320133248.1679485-1-peter.maydell@linaro.org>
 <20250320133248.1679485-4-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320133248.1679485-4-peter.maydell@linaro.org>
Received-SPF: pass client-ip=198.175.65.16; envelope-from=zhao1.liu@intel.com;
 helo=mgamail.intel.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.332,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-rust@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: QEMU Rust-related patches and discussion <qemu-rust.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-rust>
List-Post: <mailto:qemu-rust@nongnu.org>
List-Help: <mailto:qemu-rust-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-rust>,
 <mailto:qemu-rust-request@nongnu.org?subject=subscribe>
Errors-To: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-rust-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: YaH3RS71oGL4

> -use std::{ffi::CStr, ptr::addr_of_mut};
> +use std::{ffi::CStr, mem, ptr::addr_of_mut};

maybe mem::size_of (since there're 2 use cases :-))? 

>  
>  use qemu_api::{
> +    bindings,
>      chardev::{CharBackend, Chardev, Event},
> +    static_assert,

This one looks like it breaks the alphabetical ordering (this nit can be
checked and fixed by "cargo +nightly fmt" under rust directory, which is
like checkpatch.pl).

>      impl_vmstate_forward,
>      irq::{IRQState, InterruptSource},
>      memory::{hwaddr, MemoryRegion, MemoryRegionOps, MemoryRegionOpsBuilder},
> @@ -124,6 +126,12 @@ pub struct PL011State {
>      pub migrate_clock: bool,
>  }
>  
> +// Some C users of this device embed its state struct into their own
> +// structs, so the size of the Rust version must not be any larger
> +// than the size of the C one. If this assert triggers you need to
> +// expand the padding_for_rust[] array in the C PL011State struct.
> +static_assert!(mem::size_of::<PL011State>() <= mem::size_of::<bindings::PL011State>());
> +

maybe use qemu_api::bindings::PL011State directly? Because bindings
contains native C structures/functions and their use should not be
encouraged, I think it's better to 'hide' bindings (not list it at the
beginning of the file).

Otherwise,

Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

