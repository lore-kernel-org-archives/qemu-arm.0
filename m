Received: by 2002:a17:505:110e:b0:1be9:327d:8ee3 with SMTP id pu14csp905735njb;
        Thu, 8 May 2025 23:49:48 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVYzj5DhVTzEd2b2twQg4cLy4LhsYyxvPJCqJDed7fmJVGxGNx4DcJxbovODbBAgHhS83w3O7gBnSBPnA==@linaro.org
X-Google-Smtp-Source: AGHT+IEIBCiY1tFbTOl0JztDkDoDpl/K2woW0tw1aW3BPg+NfzMSI8X+Hji7Jkp9m9hzcdQNUgdq
X-Received: by 2002:a05:6402:5114:b0:5f8:504a:88d5 with SMTP id 4fb4d7f45d1cf-5fca0731b67mr1650310a12.7.1746773387803;
        Thu, 08 May 2025 23:49:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1746773387; cv=pass;
        d=google.com; s=arc-20240605;
        b=Con5bR6VcZSfpB1gpcFdumRRbzi/4s5EaXdY6Zznqw0S01LoTOZO3bCGg+vpYYrPit
         dsUUg0tgOHfm0+dn2M36NSU785B2kajbxTSgA+CByP8vUxgvARJfUWpOsP4ujpZJ2+Bs
         ZpUKCH17ribpTWhXP4FgTQfG9RmDmLSUXE/d61bcOBp2fClYUrC7xeS/WIy+dYvAeS6/
         ikhibVP7OJN/ORShjZwVNY4fd0d8snY3OHNvTTsPQwAjwx/eXWgaryn2UjEQuaAEGfpS
         W116d9R2ohFMFfmGMBhrAkHjUhBUrFz9H0SEbYwW+sgaPoW7o+lAWDT35H2aFqd0iGxr
         LiMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=59cdBi6kRt8fTdNcXgmxlheeMaGHMLWplc56/ilHrwg=;
        fh=Q8omI+ATFA/q+WOClFqBZjMkLCUnNMldHOUWFyGFFAk=;
        b=jo46CBtj1jLrP+O57nocHnsAdjXvYRbnkkBk+3ZkAnvPjUOAkGIUV453EHusUITzvL
         pcGrJWmH2555rhow4OA1oh3OFS9LE6dEc9YQVL/4Mns1YVXLvEZx8P7NwtN7u5RcIfhW
         guDVedPlgzttzpWYfIqSCEsIIhkLFOLfFd2FTGjY3wQ4WXF2qfK1mTjLRnB1bUGNV/M6
         sgWR7qj1ltGZBr5MneCEHgWb83z0CWHd/la3vvsYZaZfwsWYtjBOaWnYM1wv9TmGHKoS
         AogCExfdOYSpjFSqTI38kxv+HY9UaG4VG/8Qv4wouBiImcOjeMnq7VZk2vboVsCHTmLG
         Xp+Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=hlVBONVe;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46019-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-46019-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <kvm+bounces-46019-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5fc9c9e72b7si1072524a12.111.2025.05.08.23.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-46019-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@intel.com header.s=Intel header.b=hlVBONVe;
       arc=pass (i=1 spf=pass spfdomain=intel.com dkim=pass dkdomain=intel.com dmarc=pass fromdomain=intel.com);
       spf=pass (google.com: domain of kvm+bounces-46019-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="kvm+bounces-46019-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 167DF1C04033
	for <alex.bennee@linaro.org>; Fri,  9 May 2025 06:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3038126D4F9;
	Fri,  9 May 2025 06:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlVBONVe"
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B8B238C39
	for <kvm@vger.kernel.org>; Fri,  9 May 2025 06:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773383; cv=none; b=FYF/B/UtSfmN/DahCMruNatBUJIpirpvcIV1TQ0cG03dCqk8wluuvm50FGGuP6q8Lzf4Q93L0lmoIVqRRzJ9ReFOHsaR8MXDw8T2lUjas5yPGl//ZntozxW2HSvvdW2iETQ2pR7VnZUYXNDH1ij+nkSOuJ6d8cGTwtNjEOpVbEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773383; c=relaxed/simple;
	bh=Avp9ih7O0rS3iqGb/YM02n6x4BTddKP/bzEfaLI3gZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SpEERfd52A+weuVgAOXWDVRrXkYHh+qocY+rGHWBFvbEtdibkrl/IKZTtkqf2c2YATPBrqEfeCu7HnECZFSDFXZRIhlA9MlOx+HTUQeMDS3dN7sb1D+AV8biwc+ad5LaAAsJg0UYWr6N4YW0Ev02oZccTlLhCOZzTbjLxH0pdnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlVBONVe; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746773381; x=1778309381;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Avp9ih7O0rS3iqGb/YM02n6x4BTddKP/bzEfaLI3gZg=;
  b=hlVBONVeAKrcd9etaXuNTWOLLw+opfwasWwIUpTJHiqoWMv+IgDb603S
   UDk6s0OBZnF6fTialQYxeXgKkZty7PQRhdVhEloTF63M+ujN/FqcZoTss
   6jDf1fj794FliNzrBLRYGu34KGyaGvlKcmEfjpRI/lHLNrzVAtdntqUn7
   GbXzHJcGIhf7/65evYCwy6fBRWjJiRKUpEThnnd5+MdkFXmelBpC4jg/I
   1ejcHz/CcXipqijb/waK90my+1cO2ZXrYY+btbRoKQHCb+yHfiEe6rHzl
   ZqDw2EOJVw85EDQ/s2mzMZblWUJwikXc11iAMBKhgPzg8I1D+590+eewP
   w==;
X-CSE-ConnectionGUID: +sHkugZ/RjiKCaA+PjJ2+w==
X-CSE-MsgGUID: 3ljZ47xsTICB0GN1Dbr8pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="36216115"
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="36216115"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:49:40 -0700
X-CSE-ConnectionGUID: 7Pzedr8eSwG9Ykn8VQdFWQ==
X-CSE-MsgGUID: +phI7N1YS5m7iubQu1JxEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,274,1739865600"; 
   d="scan'208";a="136419659"
Received: from xiaoyaol-hp-g830.ccr.corp.intel.com (HELO [10.124.247.1]) ([10.124.247.1])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 23:49:31 -0700
Message-ID: <23260c74-01ba-45bc-bf2f-b3e19c28ec8a@intel.com>
Date: Fri, 9 May 2025 14:49:27 +0800
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/27] target/i386/cpu: Remove
 CPUX86State::enable_cpuid_0xb field
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Sergio Lopez <slp@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Laurent Vivier
 <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yi Liu <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-riscv@nongnu.org,
 Weiwei Li <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>,
 Zhao Liu <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Ani Sinha <anisinha@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?Q?Cl=C3=A9ment_Mathieu--Drif?= <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?=
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>,
 Jason Wang <jasowang@redhat.com>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-13-philmd@linaro.org>
Content-Language: en-US
From: Xiaoyao Li <xiaoyao.li@intel.com>
In-Reply-To: <20250508133550.81391-13-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: GQOmn9cexpMF

On 5/8/2025 9:35 PM, Philippe Mathieu-Daudé wrote:
> The CPUX86State::enable_cpuid_0xb boolean was only disabled
> for the pc-q35-2.6 and pc-i440fx-2.6 machines, which got
> removed. Being now always %true, we can remove it and simplify
> cpu_x86_cpuid().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/cpu.h | 3 ---
>   target/i386/cpu.c | 6 ------
>   2 files changed, 9 deletions(-)
> 
> diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> index 0db70a70439..06817a31cf9 100644
> --- a/target/i386/cpu.h
> +++ b/target/i386/cpu.h
> @@ -2241,9 +2241,6 @@ struct ArchCPU {
>        */
>       bool legacy_multi_node;
>   
> -    /* Compatibility bits for old machine types: */
> -    bool enable_cpuid_0xb;
> -
>       /* Enable auto level-increase for all CPUID leaves */
>       bool full_cpuid_auto_level;
>   
> diff --git a/target/i386/cpu.c b/target/i386/cpu.c
> index 49179f35812..6fe37f71b1e 100644
> --- a/target/i386/cpu.c
> +++ b/target/i386/cpu.c
> @@ -6982,11 +6982,6 @@ void cpu_x86_cpuid(CPUX86State *env, uint32_t index, uint32_t count,
>           break;
>       case 0xB:
>           /* Extended Topology Enumeration Leaf */
> -        if (!cpu->enable_cpuid_0xb) {
> -                *eax = *ebx = *ecx = *edx = 0;
> -                break;
> -        }
> -
>           *ecx = count & 0xff;
>           *edx = cpu->apic_id;
>   
> @@ -8828,7 +8823,6 @@ static const Property x86_cpu_properties[] = {
>       DEFINE_PROP_UINT64("ucode-rev", X86CPU, ucode_rev, 0),
>       DEFINE_PROP_BOOL("full-cpuid-auto-level", X86CPU, full_cpuid_auto_level, true),
>       DEFINE_PROP_STRING("hv-vendor-id", X86CPU, hyperv_vendor),
> -    DEFINE_PROP_BOOL("cpuid-0xb", X86CPU, enable_cpuid_0xb, true),

It's deprecating the "cpuid-0xb" property.

I think we need go with the standard process to deprecate it.

>       DEFINE_PROP_BOOL("x-vendor-cpuid-only", X86CPU, vendor_cpuid_only, true),
>       DEFINE_PROP_BOOL("x-amd-topoext-features-only", X86CPU, amd_topoext_features_only, true),
>       DEFINE_PROP_BOOL("lmce", X86CPU, enable_lmce, false),

