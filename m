Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp2468869njb;
        Sun, 11 May 2025 19:24:54 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCXF3UjVwuArilfSODpPOxrmyzmGs+4/oh9Bbhu/YVwMcCwkF3ydn0dNaQ7kB2IgBsZqKCUTvQLgNd729w==@linaro.org
X-Google-Smtp-Source: AGHT+IGlarhXHVNZ2/zX6ejBbBoZedEdT0ghoMSJJ/hi9tW+LBnMxsEVAIcWXYIhUEuy5EQGpVgz
X-Received: by 2002:a05:6214:242e:b0:6f2:d45c:4a1d with SMTP id 6a1803df08f44-6f6e4810b84mr239001136d6.38.1747016693805;
        Sun, 11 May 2025 19:24:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1747016693; cv=pass;
        d=google.com; s=arc-20240605;
        b=MJ3ub592UnprIuMR9i67roXauGXrDVbGC7nuyhPniMRzuvV/RSBHX9jcUn5bS3Fq2L
         ezNiGpQlSrgkedK6GsrDCrzGC6Tl9zcgBjQ87jJQDA61AYmr/Su63Jnx/DdX4vODpj49
         rQiR6hlFpScc3SWUbamG+Oyu7JlMBOCfp97jgQfaPSy2q4KHmyTXETvxpft171Ov2Tsm
         O+uDx1NHn7xJq6Bsk76q1KvFsmWGSYw+gqVFxiUtN+Gw92wBVJGDhBlkSX7RJl37dQsj
         /+mbpd13BCbtStxQ/6lXNGf3UbcZkst9aFAUpJ5Ih/8TaKoENdytOZfMxwiikD2g12Uv
         yYCA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :references:message-id:subject:cc:to:from:date:dkim-signature;
        bh=/EccWw1R2uDi0CzbpPeZuT4u8e+raDYou1A/QVBsGUk=;
        fh=YatMphBfL3TW1DrIOHYmM02GpSGt5f+gnGFZMvLZ/5Y=;
        b=fScYemR7/Il3CcBELYMcArbYQSFMq6eVE8GkpUqaUhxXvqG3KFv7IXA3KA8NsNWrmu
         lpacJ562n6UkLxAZDb9gQvo7C7ry9Vuv1PxeFmy9MwJPsOusNJA/52yjO4bGZSFaG97l
         SRcHVEEUAklxMTMDsCksvuf20B33Ykf5Q+O/PzBdNjubpzdwCuZ9diDC8P1zP/rP0rFP
         Jga2YZd+40z2y0WOQMBiwIerz5DHtmfMrx4F3DkY+g+sSSTaLdmBaSunqgqBidBmzlgY
         gmarrDFOKLmFeUSJUfQeJNwyFUHrkCbwneJLY/Iy5m5tCfi66mb9xuLqGFHnbuKcejhM
         iXXQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="N/BC6y8P";
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46127-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-46127-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46127-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39f73dfsi80059456d6.114.2025.05.11.19.24.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 May 2025 19:24:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46127-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b="N/BC6y8P";
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46127-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-46127-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7344172103
	for <alex.bennee@linaro.org>; Mon, 12 May 2025 02:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1656E253332;
	Mon, 12 May 2025 02:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N/BC6y8P"
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC494128816
	for <kvm@vger.kernel.org>; Mon, 12 May 2025 02:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747016689; cv=none; b=E6QMd1ENQ/SgvGl7M3DrZXhGAruIjGNuzKewrNy+N5rufqdTdQWWcIfPoL4t6dtswLW/JzY2TyNQd9fbFU3wzxilp6JafZdUDrRtxaPdbHpV/4Jo3HXWlr72OYkjHlv4uGI8lD6l4kDO2ovJ8iCuj4171hiJYzkKTgaqtN+ZbTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747016689; c=relaxed/simple;
	bh=z7qhnh/wiUvOpKBKk84OgMz6hz8R1PuKuj0Ro9Ok98M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eyKXDJ9L9VH5K4yynlrwGAmu/bKfRTfMaTEkDMkWaTgCbQCbwRgdawJlNmZR2ENhqWXSF4RR/ieimy46SGvWfQguJ+eyGHf58CO3jpNcrXaKSriNWCdm4YE6gEV42ikQocHTF7SRDOO2vx2brcgvP05XRfGHrKy+1EqUa/sKRDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N/BC6y8P; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747016688; x=1778552688;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=z7qhnh/wiUvOpKBKk84OgMz6hz8R1PuKuj0Ro9Ok98M=;
  b=N/BC6y8PFnQ2H87NSZ48n0B/eS4Nob0tnnnHHplhLjRace1YBNLY45fV
   mn8cpRIRbbAhg7WJCji6p5lxgtUW/dPf+aEgR+1a88wGxMx29DnckUC+w
   fNoy+Dv7bowNTO0tf3xQTv3el9QRY/piKapUPnEsC22silAANwYvi7YPH
   gEUbTXzXS6EAJdLybIdhMi1jJVYa8qYS0GD77vrwgaiXVRwRwWFgIKZLJ
   dYqL08yy7zXzzKKYdBaHDvs3q4RLcZp/QG9lPJIDr0YfbbkrdMR1zj4jl
   kTZfA0AhNbJ9oz3FAuHS5eXzHtCYyg8rvOhcoyddrHQ/XQOaz99sz/OGx
   w==;
X-CSE-ConnectionGUID: ARYDyf0SQ4esnOQ6a9ma4w==
X-CSE-MsgGUID: HbMvI0GoTF6neSgsYJbTTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="60202900"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="60202900"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 19:24:47 -0700
X-CSE-ConnectionGUID: MOgSV+puRlO3gTTA58Sv+Q==
X-CSE-MsgGUID: nX5TD5wBSsGv9x37LRRe2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="137094374"
Received: from liuzhao-optiplex-7080.sh.intel.com (HELO localhost) ([10.239.160.39])
  by orviesa010.jf.intel.com with ESMTP; 11 May 2025 19:24:40 -0700
Date: Mon, 12 May 2025 10:45:42 +0800
From: Zhao Liu <zhao1.liu@intel.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Xiaoyao Li <xiaoyao.li@intel.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	kvm@vger.kernel.org, Gerd Hoffmann <kraxel@redhat.com>,
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
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
	qemu-arm@nongnu.org,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jason Wang <jasowang@redhat.com>
Subject: Re: How to mark internal properties (was: Re: [PATCH v4 12/27]
 target/i386/cpu: Remove CPUX86State::enable_cpuid_0xb field)
Message-ID: <aCFg1hr1wpNZIcL3@intel.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-13-philmd@linaro.org>
 <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com>
 <aB2vjuT07EuO6JSQ@intel.com>
 <2f526570-7ab0-479c-967c-b3f95f9f19e3@redhat.com>
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=gb2312
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2f526570-7ab0-479c-967c-b3f95f9f19e3@redhat.com>
X-TUID: EQf0/17ZTPrs

On Fri, May 09, 2025 at 12:04:19PM +0200, Thomas Huth wrote:
> Date: Fri, 9 May 2025 12:04:19 +0200
> From: Thomas Huth <thuth@redhat.com>
> Subject: How to mark internal properties (was: Re: [PATCH v4 12/27]
>  target/i386/cpu: Remove CPUX86State::enable_cpuid_0xb field)
> 
> On 09/05/2025 09.32, Zhao Liu wrote:
> > On Fri, May 09, 2025 at 02:49:27PM +0800, Xiaoyao Li wrote:
> > > Date: Fri, 9 May 2025 14:49:27 +0800
> > > From: Xiaoyao Li <xiaoyao.li@intel.com>
> > > Subject: Re: [PATCH v4 12/27] target/i386/cpu: Remove
> > >   CPUX86State::enable_cpuid_0xb field
> > > 
> > > On 5/8/2025 9:35 PM, Philippe Mathieu-Daud¨¦ wrote:
> > > > The CPUX86State::enable_cpuid_0xb boolean was only disabled
> > > > for the pc-q35-2.6 and pc-i440fx-2.6 machines, which got
> > > > removed. Being now always %true, we can remove it and simplify
> > > > cpu_x86_cpuid().
> > > > 
> > > > Signed-off-by: Philippe Mathieu-Daud¨¦ <philmd@linaro.org>
> > > > ---
> > > >    target/i386/cpu.h | 3 ---
> > > >    target/i386/cpu.c | 6 ------
> > > >    2 files changed, 9 deletions(-)
> > > > 
> > > > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > > > index 0db70a70439..06817a31cf9 100644
> > > > --- a/target/i386/cpu.h
> > > > +++ b/target/i386/cpu.h
> > > > @@ -2241,9 +2241,6 @@ struct ArchCPU {
> > > >         */
> > > >        bool legacy_multi_node;
> > > > -    /* Compatibility bits for old machine types: */
> > > > -    bool enable_cpuid_0xb;
> > > > -
> > > >        /* Enable auto level-increase for all CPUID leaves */
> > > >        bool full_cpuid_auto_level;
> > > > diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> > > > index 49179f35812..6fe37f71b1e 100644
> > > > --- a/target/i386/cpu.c
> > > > +++ b/target/i386/cpu.c
> > > > @@ -6982,11 +6982,6 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
> > > >            break;
> > > >        case 0xB:
> > > >            /* Extended Topology Enumeration Leaf */
> > > > -        if (!cpu->enable_cpuid_0xb) {
> > > > -                *eax = *ebx = *ecx = *edx = 0;
> > > > -                break;
> > > > -        }
> > > > -
> > > >            *ecx = count & 0xff;
> > > >            *edx = cpu->apic_id;
> > > > @@ -8828,7 +8823,6 @@ static const Property x86_cpu_properties[] = {
> > > >        DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
> > > >        DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_level, true),
> > > >        DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
> > > > -    DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true),
> > > 
> > > It's deprecating the "cpuid-0xb" property.
> > > 
> > > I think we need go with the standard process to deprecate it.
> > 
> > Thanks! I got your point.
> > 
> > Though this property is introduced for compatibility, as its comment
> > said "Compatibility bits for old machine types", it is also useful for
> > somer users.
> 
> Thanks for your clarifications, Zhao! But I think this shows again the
> problem that we have hit a couple of times in the past already: Properties
> are currently used for both, config knobs for the users and internal
> switches for configuration of the machine. We lack a proper way to say "this
> property is usable for the user" and "this property is meant for internal
> configuration only".

Hi Thomas, thank you.

AFAIK, there are two ways to configure whether an object/device is
allowed to be created by user or not:

* TYPE_USER_CREATABLE
* DeviceClass: user_creatable

So, it looks like it would be tricky to change the infrastructure around
object_property_add because it's not easy to be compatible with both of the
above user creation ways.

> I wonder whether we could maybe come up with a naming scheme to better
> distinguish the two sets, e.g. by using a prefix similar to the "x-" prefix
> for experimental properties? We could e.g. say that all properties starting
> with a "q-" are meant for QEMU-internal configuration only or something
> similar (and maybe even hide those from the default help output when running
> "-device xyz,help" ?)? Anybody any opinions or better ideas on this?

Therefore, I think the ¡°q-¡± prefix might be a good way, simple and effective.

Let's see if any other maintainers have a better idea.

Regards,
Zhao

