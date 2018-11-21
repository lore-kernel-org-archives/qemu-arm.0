Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1955025wrt;
        Wed, 21 Nov 2018 06:43:02 -0800 (PST)
X-Google-Smtp-Source: AFSGD/WdtuX5dydic2Zh17hGrLMDiBPqhhcKCUFJpzcwMBbLoCxygRzQb53GssEn44vGh5HLNNnj
X-Received: by 2002:a25:a091:: with SMTP id y17-v6mr6363930ybh.157.1542811382174;
        Wed, 21 Nov 2018 06:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542811382; cv=none;
        d=google.com; s=arc-20160816;
        b=fpR2Ofc9L0rVholtBMDKuUWvepOipYcHD6XISOWzF85TiBi3i6AB80N4MDw/y/invf
         +kXVJ4ZBh1MW/+Zd91a5jXEGrd+WBzCtHZ74PlIuhNKyKZUCiKGCg4f63vTdXi0U51dN
         llgacg+4+l0HZl5EfnwpHg7wV5V/tMVZaGsJY7WghNjNmKDlRSM2Bn5tZsNEmqziE3W+
         Qqq44diXXg2jfQI0uWjf+2tyCAaRxyZ1PjoDngI+wB2B4OgCMr1fCaU+1en0OO58EkSF
         FUWtFDeKrtkKqa32D2k+NpR90V1WyuznKj3DX3Q4fjP2+BnGAniQcLel09API+CT2EIc
         x2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=yUUOSKpBsN2Jvpxi8p4z8KbiZIbZEOYUDuYLCbZETVM=;
        b=OjTkuUwXHblWWkYIu0PK6VTWjakrhP5NV6WjGG1K3jk/nejx0c74kv6EOVIGtxxEO4
         aYoYJWj6F4V9GV8Sg3ZBhL9MrEfSl7zPLFXzmAULD9Afki3qaTRwLLXwt3+UI8cFVS5j
         RJ+aT0ai8xxQT9Im+PBHHrYZHO4xxoNC403OfaW/ouRlVzkXBT80hJM0uZCo3xnnwep9
         MiaGd3yPFjPhf6osEb64oVxOMCkzGGv8CNKtAWn/Gc0+t7LwB51aDX/O11mnna/QJkkM
         XfBiMN5YOV5JKxwAbi/QzGkB0wTWDuW+GtOrWcM2VI/D0X4f6efAEtbxMu1qLjMTeXJn
         ukrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y12-v6si28595842ybp.309.2018.11.21.06.43.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Nov 2018 06:43:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([::1]:39540 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPTiX-0000Ty-4O
	for alex.bennee@linaro.org; Wed, 21 Nov 2018 09:43:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33556)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPTiQ-0000Ov-0h
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 09:42:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sameo@linux.intel.com>) id 1gPTiM-00015D-25
	for qemu-arm@nongnu.org; Wed, 21 Nov 2018 09:42:53 -0500
Received: from mga12.intel.com ([192.55.52.136]:12690)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sameo@linux.intel.com>)
	id 1gPTiL-00014k-Ou; Wed, 21 Nov 2018 09:42:49 -0500
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Nov 2018 06:42:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,261,1539673200"; d="scan'208";a="110162964"
Received: from tterrive-mobl2.ger.corp.intel.com (HELO caravaggio)
	([10.252.4.181])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2018 06:42:44 -0800
Date: Wed, 21 Nov 2018 15:42:11 +0100
From: Samuel Ortiz <sameo@linux.intel.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20181121144211.GE4426@caravaggio>
References: <20181105014047.26447-1-sameo@linux.intel.com>
	<20181105014047.26447-6-sameo@linux.intel.com>
	<20181108151623.4de26ecb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181108151623.4de26ecb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.136
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 05/24] hw: acpi: Implement
 XSDT support for RSDP
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
X-TUID: PeHeDM8VBWgH

Hi Igor,

On Thu, Nov 08, 2018 at 03:16:23PM +0100, Igor Mammedov wrote:
> On Mon,  5 Nov 2018 02:40:28 +0100
> Samuel Ortiz <sameo@linux.intel.com> wrote:
> 
> > XSDT is the 64-bit version of the legacy ACPI RSDT (Root System
> > Description Table). RSDT only allow for 32-bit addressses and have thus
> > been deprecated. Since ACPI version 2.0, RSDPs should point at XSDTs and
> > no longer RSDTs, although RSDTs are still supported for backward
> > compatibility.
> > 
> > Since version 2.0, RSDPs should add an extended checksum, a complete table
> > length and a version field to the table.
> 
> This patch re-implements what arm/virt board already does
> and fixes checksum bug in the later and at the same time
> without a user (within the patch).
> 
> I'd suggest redo it a way similar to FADT refactoring
>   patch 1: fix checksum bug in virt/arm
>   patch 2: update reference tables in test
>   patch 3: introduce AcpiRsdpData similar to commit 937d1b587
>              (both arm and x86) wich stores all data in hos byte order
>   patch 4: convert arm's impl. to build_append_int_noprefix() API (commit 5d7a334f7)
>
>            ... move out to aml-build.c
>   patch 5: reuse generalized arm's build_rsdp() for x86, dropping x86 specific one
>       amending it to generate rev1 variant defined by revision in AcpiRsdpData
>       (commit dd1b2037a)
I agree patches #1, #2 and #5 make sense. 3 and 4 as well, but here
you're asking about something that's out of scope of the current serie.
I'll move those patches from this serie and build a 6 patches new serie
as suggested.

Cheers,
Samuel.
