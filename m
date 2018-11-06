Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp721497wrw;
        Tue, 6 Nov 2018 02:47:27 -0800 (PST)
X-Google-Smtp-Source: AJdET5f1smIezZi2bgbUElC1hoimODWWQjKov0W05UGE6telebdW1wb5vMkSxrH5L5wAIn5vBTlu
X-Received: by 2002:ae9:d60c:: with SMTP id r12mr1344247qkk.9.1541501247467;
        Tue, 06 Nov 2018 02:47:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541501247; cv=none;
        d=google.com; s=arc-20160816;
        b=A+JmQEsfM8zNRnSr1YI8k3enXB3QL/bx8IIGcitihaTLNa4bOqq8mk+mGZuDmQ7XqJ
         CjeP3OMF3b6ixPuEGjr0OuYkcBSFnZk5ycbgWwcXofNHITVOKtaVbzT4iH2LGCR5Set8
         S/JceWCAyoB6Kh8ZvnTgaBAWvPRhK1mSJEUvQgTNTSlSVkE8sA9cDHspvDkImUvQzlAC
         DZ24ShzgXJzVMFWIYg1HmoAbEIvC0gq0Go2sKGc8U4g+nP3RUuu6AAwamYyEpotJdAnu
         6POTAWLw7XvEL6DjEmC6TUeQZaNPg/Xzx8HAnf2CIE015xbuPIUS6driZuTq9Gm0xRaG
         MgaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=5LOHRx78kKYWXiGJjW3sXOdEJPWusRXK/uIN1zsPRyY=;
        b=wFlWL8/gBPpAUkX5oEd0MGTc5CMkK3niArfDZtwyYQ4Ij+HWeNjFp8DO4eoIPhboxX
         iwFvD6RaA2TnYKy1ipZ/SNZhV+hSA0MGIqd2qIPt3KAads4vkjVBV7XCClqJTK3Tzg0/
         5hf/yFF0LZhlS6qZpX0olAVLHB3cMp1qPURhpt/5xpgRAXhyNIY0sBVbE3z/8oKsttRV
         Rb0u+L+vFhUDHnxJetbnWqeVfK6S+/P25YThh4tpYo7vX49NSTTAugM8EvNrl5jWvXFJ
         dUEC7nxLzXdqlMKrLCEn/FP8Mz7wz+nKkwbV1BQuoHlpLQ4yYrHtJLMmKapBpGwsyqtm
         UDvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v190-v6si4961040qkc.168.2018.11.06.02.47.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Nov 2018 02:47:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:40180 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gJytK-0000G9-Vt
	for alex.bennee@linaro.org; Tue, 06 Nov 2018 05:47:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41908)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJypx-0006On-DO
	for qemu-devel@nongnu.org; Tue, 06 Nov 2018 05:43:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gJypw-0006at-RH
	for qemu-devel@nongnu.org; Tue, 06 Nov 2018 05:43:57 -0500
Received: from mga11.intel.com ([192.55.52.93]:28916)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gJyps-0006SD-L1; Tue, 06 Nov 2018 05:43:52 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Nov 2018 02:43:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,471,1534834800"; d="scan'208";a="83688758"
Received: from csavagex-mobl.ger.corp.intel.com (HELO caravaggio)
	([10.252.5.18])
	by fmsmga007.fm.intel.com with ESMTP; 06 Nov 2018 02:43:45 -0800
Date: Tue, 6 Nov 2018 11:43:06 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20181106104306.GB27585@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-4-sameo@linux.intel.com>
	<591c453a-977c-98a5-a23e-bd04b6dc9533@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <591c453a-977c-98a5-a23e-bd04b6dc9533@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
Subject: Re: [Qemu-devel] [PATCH v5 03/24] hw: acpi: The RSDP build API can
 return void
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ex9+blVk34+L

On Tue, Nov 06, 2018 at 11:23:39AM +0100, Paolo Bonzini wrote:
> On 05/11/2018 02:40, Samuel Ortiz wrote:
> >  /* RSDP */
> > -static GArray *
> > +static void
> >  build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> >  {
> >      AcpiRsdpDescriptor *rsdp = acpi_data_push(rsdp_table, sizeof *rsdp);
> > @@ -392,8 +392,6 @@ build_rsdp(GArray *rsdp_table, BIOSLinker *linker, unsigned xsdt_tbl_offset)
> >      bios_linker_loader_add_checksum(linker, ACPI_BUILD_RSDP_FILE,
> >          (char *)rsdp - rsdp_table->data, sizeof *rsdp,
> >          (char *)&rsdp->checksum - rsdp_table->data);
> > -
> > -    return rsdp_table;
> >  }
> >  
> 
> Better than v4. :)
Right, I followed Philippe's advice and it does make things clearer :)

Cheers,
Samuel.
