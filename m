Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1975698wrt;
        Wed, 21 Nov 2018 07:01:06 -0800 (PST)
X-Google-Smtp-Source: AJdET5c7DH3E1NV4w2RdignvTL8CcYUJKVbCNOK2WE9zUsscSDr5GW4ikxaPsFJ03AKMC8aJcpB5
X-Received: by 2002:a81:3294:: with SMTP id y142mr6607176ywy.399.1542812466113;
        Wed, 21 Nov 2018 07:01:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542812466; cv=none;
        d=google.com; s=arc-20160816;
        b=UC7bqvB6R4Hgz/bisXaOkAXhFgiEwubzeOs7rJ6t9jrkL/sAnYvkqUeBbZXTrqfUes
         W5jf5mRvtYT93bE3YQoy/4fqX9K4ZcPSEw8z3ku4rlcZUSLEQEBTNYUf0Tz9J0cjpyMY
         BR/bSkmP5KJnvdWDkVNYbzh/xyaStefB8emgXzOYLiAkk6AxXOY4xuhElaMup5e7J6fa
         qad2y/e0wxike6mxvwiijfQcYArNVARSPGojFxdG2gkQjTRTryQcMbYD+b8jdwxzQHYj
         QmX+/n8mf38UNTHggdGM/0FMY+NCwDYm8+OApv50A/7y9o2kBIfAwPJ/uJ7qmTTbrHr6
         8wDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=bs0GW5jai++6t5EIWivrM8AMwHDYN+rnMHcgkQavJMo=;
        b=AaWRN4wUPO6uJS4HsfIQy5VYV+Ua1elEinDibl++NBGX/q9N417TaJfAq84powMbuc
         bYbroMau7G2jSJeQxY9Xorx77JM/hyQ3AwrlM0YELkNk17IDjhNLsc09+au8ycozgTMO
         RmE5DJQHqGmf0CdVjD576lYuwp2GLIM2dnRhXjMni1eZVu/n9nORD2rqfKP595YaRhAO
         rMSCn7aBj49z91i6PXNBCz1DJZUAE0yh6/0Zf+hl1yOJls5nb2dz0mi/1x/d2QK3uxKf
         8O5RaH2tqu3nLoXuPV9HvkDVKE0bU+ZjffQI4w2igHt3JZgsvxEgyzRDhTJ2ozfw4E/B
         8hTg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t17-v6si28530697ybl.205.2018.11.21.07.01.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 07:01:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:39633 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPU01-0000lG-Jh
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 10:01:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41514)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPTzp-0000kt-Rl
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 10:00:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPTzk-0004no-1Y
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 10:00:53 -0500
Received: from mga05.intel.com ([192.55.52.43]:4645)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPTzj-0004lz-Ov; Wed, 21 Nov 2018 10:00:47 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 07:00:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,261,1539673200"; d="scan'208";a="110024490"
Received: from tterrive-mobl2.ger.corp.intel.com (HELO caravaggio)
	([10.252.4.181])
	by fmsmga001.fm.intel.com with ESMTP; 21 Nov 2018 07:00:42 -0800
Date: Wed, 21 Nov 2018 16:00:10 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121150009.GH4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-8-sameo@linux.intel.com>
	<20181109143733.76b93da5@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181109143733.76b93da5@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 07/24] hw: acpi: Generalize
 AML build routines
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Yang Zhong <yang.zhong@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LZPZd/xsbrl4

Hi Igor,

On Fri, Nov 09, 2018 at 02:37:33PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:30 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > From: Yang Zhong <yang.zhong@intel.com>
> > 
> > Most of the AML build routines under acpi-build are not even
> > architecture specific. They can be moved to the more generic hw/acpi
> > folder where they could be shared across machine types and
> > architectures.
> 
> I'd prefer if won't pull into aml-build PCI specific headers,
> Suggest to create hw/acpi/pci.c and move generic PCI related
> code there, with corresponding header the would export API
> (preferably without PCI dependencies in it)
> 
> 
> Also patch is too big and does too much at a time.
> Here I'd suggest to split it in smaller parts to make it more digestible
> 
> 1. split it in 3 parts
>     * MCFG
>     * CRS
>     * PTR
> 2. mcfg between x86 and ARM look pretty much the same with ARM
>    open codding bus number calculation and missing migration hack
>    * a patch to make bus number calculation in ARM the same as x86
>    * a patch to bring migration hack (dummy MCFG table in case it's disabled)
>      it's questionable if we actually need it in generic,
>      we most likely need it for legacy machines that predate
>      resizable MemeoryRegion, but we probably don't need it for
>      later machines as problem doesn't exists there.
>      So it might be better to push hack out from generic code
>      to a legacy caller and keep generic MCFG clean.
>      (this patch might be better at the beginning of the series as
>       it might affect acpi test results, and might need an update to reference tables
>       I don't really sure)
>    * at this point arm and x86 impl. would be the same so
>      a patch to move mcfg build routine to a generic place and replace
>      x86/arm with a single impl.
>    * a patch to convert mcfg build routine to build_append_int_noprefix() API
>      and drop AcpiTableMcfg structure
Ok, I'll build another patch serie for that one then.

Cheers,
Samuel.
