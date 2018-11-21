Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1955577wrt;
        Wed, 21 Nov 2018 06:43:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5dUj8yqHcsv1r80BZXu83WtczFJkLr5G5DQoOuy/oWm2kPVnYLTWGTMsxlp9i4m0L5HF+ab
X-Received: by 2002:a5b:64b:: with SMTP id o11-v6mr6686130ybq.504.1542811413517;
        Wed, 21 Nov 2018 06:43:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542811413; cv=none;
        d=google.com; s=arc-20160816;
        b=SuH+Kk1V/PmNdx5a9p3eUFm6YvTS9i4U5hELjqpgFAqGlncYsJHesS0BjZ89Mxj2iB
         tggYgrPkrcq+K4ZQ4sF0ZTHKrNe3YeAGmQEwsx2aiaIv0CiAztEJnLKMUhPhGFVWB71L
         Xs1tsMRN4o5kbo9oknuaqo6SzAEZLkg4sIlW1spRSBD0SBcftdJjkGfG2Jwml8/iRBo4
         QuReEB2o7gHRKarbLsVEkaI3R7hPWXui4dbe+/BFk44bfCwHQ2epvN0oK1QV5+CkikJ2
         yqg32uoBk6vDrv/oBFeCkOGrTXRprlsX6g20zcC0AmpbYpmtJLvuOZOOfTt2ivYkdoyY
         pEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=mV00W3e0mfVjuyRFRLtZqjLOngGJ1rdSjRgcAC8jv6A=;
        b=iX7o/LcUDXY2ZIxetbHcmy/be6bFYb7rqHINuzMVnd7kyMAxg74Pc62VxtLk9B8p4z
         UUkExjV8LUB6F5U7dKQGQXtLoT2hV5z4LD25BgU2g7eAuc9Mv2hCRuvsDd0WsOCsFWQd
         4Ho2V98ujMpjJ7a+ie49nmDSDsExlVrSqEA/Z2lmRcky2Q0SGtUmeTt2DhpVnKOe/K0b
         2XR0pp/R/ntdNqM8V7be2bwksI51Qoi7MBAUAV8elyxci0toZ9LtK7kluz0qlORJ/btU
         2gHZh46frpCatPtCL5HuTWOJtANlPhZh+Aa3pOHZ9lYXf4Y9aXjFJGa58i8q6sSwbWlM
         2Pag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g129si9976595ywe.389.2018.11.21.06.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 06:43:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:39544 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPTj2-000133-Ui
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 09:43:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33752)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPTiq-00011o-63
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 09:43:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPTim-0001HN-6r
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 09:43:20 -0500
Received: from mga12.intel.com ([192.55.52.136]:12721)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPTil-0001GW-S4; Wed, 21 Nov 2018 09:43:16 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 06:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,261,1539673200"; d="scan'208";a="251518126"
Received: from tterrive-mobl2.ger.corp.intel.com (HELO caravaggio)
	([10.252.4.181])
	by orsmga004.jf.intel.com with ESMTP; 21 Nov 2018 06:43:10 -0800
Date: Wed, 21 Nov 2018 15:42:37 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121144237.GF4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-2-sameo@linux.intel.com>
	<20181109152316.43b79217@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181109152316.43b79217@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 01/24] hw: i386: Decouple the
 ACPI build from the PC machine type
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	xen-devel@lists.xenproject.org, Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hlKsNeJ2fXr2

Hi Igor,

On Fri, Nov 09, 2018 at 03:23:16PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:24 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > ACPI tables are platform and machine type and even architecture
> > agnostic, and as such we want to provide an internal ACPI API that
> > only depends on platform agnostic information.
> > 
> > For the x86 architecture, in order to build ACPI tables independently
> > from the PC or Q35 machine types, we are moving a few MachineState
> > structure fields into a machine type agnostic structure called
> > AcpiConfiguration. The structure fields we move are:
> 
> It's not obvious why new structure is needed, especially at
> the beginning of series. We probably should place this patch
> much later in the series (if we need it at all) and try
> generalize a much as possible without using it.
Patches order set aside, this new structure is needed to make the
existing API not completely bound to the pc machine type anymore and
"Decouple the ACPI build from the PC machine type".

It was either creating a structure to build ACPI tables in a machine
type independent fashion, or pass custom structures (or potentially long
list of arguments) to the existing APIs. See below.


> And try to come up with an API that doesn't need centralized collection
> of data somehow related to ACPI (most of the fields here are not generic
> and applicable to a specific board/target).
> 
> For generic API, I'd prefer a separate building blocks
> like build_fadt()/... that take as an input only parameters
> necessary to compose a table/aml part with occasional board
> interface hooks instead of all encompassing AcpiConfiguration
> and board specific 'acpi_build' that would use them when/if needed.
Let's take build_madt as an example. With my patch we define:

void build_madt(GArray *table_data, BIOSLinker *linker,
                MachineState *ms, AcpiConfiguration *conf);

And you're suggesting we'd define:

void build_madt(GArray *table_data, BIOSLinker *linker,
                MachineState *ms, HotplugHandler *acpi_dev,
                bool apic_xrupt_override);

instead. Is that correct?

Pros for the latter is the fact that, as you said, we would not need to
define a centralized structure holding all possibly needed ACPI related
fields.
Pros for the former is about defining a pointer to all needed ACPI
fields once and for all and hiding the details of the API in the AML
building implementation.


> We probably should split series into several smaller
> (if possible independent) ones, so people won't be scared of
> its sheer size and run away from reviewing it.
I will try to split it in smaller chunks if that helps.

Cheers,
Samuel.
