Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp915022njb;
        Fri, 9 May 2025 00:11:43 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXBPiqHd0odYdszx+nQ4eoezh9smRTRmf6UqIqjKao1/cjvstiw1FX3s4sz/vHLScTSt+U+2huBmo+gHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF9u6rut8fFnkV1VuK4GNTok+GeTS5/wC5w0T6CHmUGC/eqArzGiqSKoHpF8fj36/1SZFSc
X-Received: by 2002:a05:6214:4105:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-6f6e482d125mr35218706d6.31.1746774703663;
        Fri, 09 May 2025 00:11:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746774703; cv=pass;
        d=google.com; s=arc-20240605;
        b=TyDScJm8YczbDOlvu/tHftdNCu93Vsosu8syogOh2mQUfvm3Upc6xjYWuVe2U0AZbs
         IVC+I+dhcXyJfU2tdCu6Qe3zMi3EERuoheDDT7zvuCiA3iY8DGlhfxttSSa6Ya8fPsp9
         ri50SSZuC3nkf9fg6PqNHiRHvm/PamBoQ3CiXHrCGrfJsyFdowHwia1Gb/Ji9ibCTa+X
         oi0ffiJUZKSgaRN5gIOtc80wqbBeEFxTrQLNnFTprhhTjOC+Zq736Z4UmGqbfgRPZsHh
         75fAQlegOgYqR1VKiPiU2eC+Ve1h4qVqQtqFXbXZZNiuTNe1NBdOQAXh/sJtan95YeP2
         BsXA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=ELRFXv/jKqMKy2BSbcm36n6y4C71uBptLzGtdC0HEm4=;
        fh=vlMR2Ti7ZlCCyfocbqWdMsAjdWbSRoTu7L3QHQO1Fgw=;
        b=A0jF4Yh8Pi9vRaoad36ILtmoEi8YmCYDY6k0IFI2y8HiUogYYsed7ouc6QmUYnpPf7
         DdIZ+Yk9LIr84Kvyb5FPpwrCeRf1CSFsTt4DFF3/TP+Iknyz0gwbRRPvJkR02vkyvyCN
         AuFGyJ4IiOwG6QUA9h2le5KVcB1Y1tTRAEXdoUHrztsIzJ5PznQphDbo55J5Hc8KB6ZT
         A1bPSDlvkeII9NiM3EXxYGdRJO5Aw/cWIYh/Nba1aYkWcP3a7eUNW3cFQTn0BaVO9Jce
         patUnCepQn123HYpVSVhtr6YuWYt9K+gTUAGH6XeBO6r62x67QKHUK6Ea0cIiqPDaDqA
         Ysig==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=SVCK4Nyx;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46022-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-46022-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46022-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a58d5bsi17250036d6.399.2025.05.09.00.11.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 00:11:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46022-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=SVCK4Nyx;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46022-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-46022-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 98A4616E496
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 07:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887EE26FD90;
	Fri,  9 May 2025 07:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SVCK4Nyx"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BEA26B2DF
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 07:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746774698; cv=none; b=Q+n02XugQ+R0lIIAolnZimPyMVEJ7JqcK914EU5u1Wo+86vDS9ihN3WOY8rWq9rbyDsNGLEIbpDiuEJf1RYxKTwz8x12GBRjqiyqx8CPcW20K31g1CLQuDrk3u0pIr7TmZBtgwnr21z4jW+ds5JXc9itTUaXWB41yezLhqeb8z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746774698; c=relaxed/simple;
	bh=2C5nET5W0bcIefwZbA8VGGLLv3FN4P08bT/uTlqla4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAwV6vNH+tlmsUgJQRKV3czEFoLgK05bOY2BNZ3sC6JIMNT12lY0utETtNGK8CN80cbhewB4zTB5KSsNQHqqydMuajNZJwcRO2+oXKe4vkE7r+5QxaENrreN+hLYHkwwiyephRb4HCDfotbqCtY0s7e/FcrypoCYOaeA6VViEe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SVCK4Nyx; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746774696; x=1778310696;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2C5nET5W0bcIefwZbA8VGGLLv3FN4P08bT/uTlqla4U=;
  b=SVCK4NyxuQOaSeyfVPOxeM9zurWuHNso5dZNckNdtWWmX3whVovtvE4K
   T0Mezk2phGIHaUzb7HDUmGaiSgxcNwsGGtAxNlEG05Wlkf2cqFVS1gpaq
   w76CC5xbEQPIbxGrfywuY/wT0QTBVlr0U/g31tzZgkc5n3C8/kvKCktcZ
   a0OWCjk9sNFCpn9fXxbxSXepFVeNh4k7Bcu0gPrU86P3Wea+PiNZxrRGs
   GZB0rmknpcAqpN93kjrOS/IfTBcjZxR29/RV9p9pTSYj60bSDtO7RXosK
   g4XppWv3cun2hAmzwC7qlfDopb0q53KFdFUIoyuuPDurIovWIxmqEl+Xz
   w==;
X-CSE-ConnectionGUID: afJjqG2JSkmkhAsPwsUGdg==
X-CSE-MsgGUID: lK9yqJeESAi7kczAchGg6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48505806"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="48505806"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 00:11:35 -0700
X-CSE-ConnectionGUID: n9zxyQjGRH+MShzMygYUyA==
X-CSE-MsgGUID: 8Fjt0m4zT2CGbDnrIJiefA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="141311969"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa003.jf.intel.com with ESMTP; 09 May 2025 00:11:28 -0700
Date: Fri, 9 May 2025 15:32:30 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu <yi.l.liu@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
	Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
	Yanan Wang <wangyanan55@huawei.com>, Helge Deller <deller@gmx.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ani Sinha <anisinha@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
	qemu-arm@nongnu.org,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v4 12/27] target/i386/cpu: Remove
 CPUX86State::enable_cpuid_0xb field
Message-ID: <aB2vjuT07EuO6JSQ@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-13-philmd@linaro.org>
 <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com>
X-TUID: b0MEQ1/mV56q

On Fri, May 09, 2025 at 02:49:27PM +0800, Xiaoyao Li wrote:
> Date: Fri, 9 May 2025 14:49:27 +0800
> From: Xiaoyao Li <xiaoyao.li@intel.com>
> Subject: Re: [PATCH v4 12/27] target/i386/cpu: Remove
>  CPUX86State::enable_cpuid_0xb field
> 
> On 5/8/2025 9:35 PM, Philippe Mathieu-Daudé wrote:
> > The CPUX86State::enable_cpuid_0xb boolean was only disabled
> > for the pc-q35-2.6 and pc-i440fx-2.6 machines, which got
> > removed. Being now always %true, we can remove it and simplify
> > cpu_x86_cpuid().
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > ---
> >   target/i386/cpu.h | 3 ---
> >   target/i386/cpu.c | 6 ------
> >   2 files changed, 9 deletions(-)
> > 
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 0db70a70439..06817a31cf9 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -2241,9 +2241,6 @@ struct ArchCPU {
> >        */
> >       bool legacy_multi_node;
> > -    /* Compatibility bits for old machine types: */
> > -    bool enable_cpuid_0xb;
> > -
> >       /* Enable auto level-increase for all CPUID leaves */
> >       bool full_cpuid_auto_level;
> > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > index 49179f35812..6fe37f71b1e 100644
> > --- a/target/i386/cpu.c
> > +++ b/target/i386/cpu.c
> > @@ -6982,11 +6982,6 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> >           break;
> >       case 0xB:
> >           /* Extended Topology Enumeration Leaf */
> > -        if (!cpu->enable_cpuid_0xb) {
> > -                *eax = *ebx = *ecx = *edx = 0;
> > -                break;
> > -        }
> > -
> >           *ecx = count & 0xff;
> >           *edx = cpu->apic_id;
> > @@ -8828,7 +8823,6 @@ static const Property x86_cpu_properties[] = {
> >       DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
> >       DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_level, true),
> >       DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
> > -    DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true),
> 
> It's deprecating the "cpuid-0xb" property.
> 
> I think we need go with the standard process to deprecate it.

Thanks! I got your point.

Though this property is introduced for compatibility, as its comment
said "Compatibility bits for old machine types", it is also useful for 
somer users.

Fo example, in the early development stages of TDX, when there was no
full support for CPU topology, Intel had disable this property for
testing and found this bug:

https://lore.kernel.org/qemu-devel/20250227062523.124601-3-zhao1.liu@intel.com/

So, I think there may be other similar use cases as well.

And, if someone wants to emulate ancient x86 CPUs (though I can't
currently confirm from which generation of CPUs 0xb support started), he
may want to consider disable this property as well.

The main problem here is that the "property" mechanism doesn't
distinguish between internal use/public use, and although it was originally
intended for internal QEMU use, it also leaks to the user, creating some
external use cases.

@Philippe, thank you for cleaning up this case! I think we can keep this
property, and if you don't mind, I can modify its comment later to
indicate that it's used to adjust the topology support for the CPU.

Thanks,
Zhao

