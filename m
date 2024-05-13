Received: by 2002:a17:907:90c2:b0:a52:4db9:938b with SMTP id gk2csp2179692ejb;
        Mon, 13 May 2024 06:18:19 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVWgsSA9dSon3rOJxnzBiEHGLL9YuMu/KP1kkxpDSQRYFc/tEnGy/8YDDEJi/eQGHlFzGne0iP0s+CDuYhc/SMOZc2pOvAw
X-Google-Smtp-Source: AGHT+IGsLpXQcIX4RKtKh5EiA/Kqm4jNk5+QUFVMptPIaIs+5rG0r/QSseRtsykbzpd2h6Ag25OJ
X-Received: by 2002:ac2:4282:0:b0:51d:1002:520d with SMTP id 2adb3069b0e04-52210275d75mr5815658e87.64.1715606299206;
        Mon, 13 May 2024 06:18:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1715606299; cv=pass;
        d=google.com; s=arc-20160816;
        b=hOw+EM3tn8q87AaSefnl/Pqf7tDHDJdpqczV4U8m6dMGFUzOrzz1jotl4kV0/ZBSpF
         iXl5gbvV+wr/J4Pwz3/ATEmaaETPUxoc6/Cd73JMc6yQVrrxJq6CVqPyl5q/HggBeLF5
         pCGSESig0aw0e/CLVNOruWVM1EhfoLU8O0uvWyqk6NvLz5eeYfLN0ODmc5dB+daMmuwJ
         eqJl+z6NsOJDquANi1PND/Q3z2/VOeoVTRDN6OP0W8mEe62OQbJaF2Y0pdM+dOnJp8Rh
         lkWuSFn/mg0uCz+MnT9nyPBgYiLOPyLuxcQIF43/VKmnqsB0ygDXuqGPsr1I1uaHR0IN
         TtIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=kPjgYgq2OJKi2+MpSVcM8/6vIKwKmBz6OcIcuKES9D4=;
        fh=PJC8D1pnyq3tq+jonKZSk01DtrmmFJEH5pxsCqnaMa8=;
        b=Y2rP7d97RtLYhlZagCooXETyrbHool51RoHxLu22VFmWYVSjikS8NEZCYg0VMChnVI
         jmCCy5WX2x9GrnDp9PzwqK1cn+qMd284EJ2iZJBtcRTtFDJxzGnUPumAyab0AHsi5Mzi
         bYOLZ5+oaagXLsp2Gbub5uOKsSGxYgWE3+yYkY5P55F7rpawLv97TmSO6c0dkQe9Ch67
         BFMhMNqfeqQmRzePJjB+OI0QjnueenGHEbUMKzgLoxNsGQVq2zBkzhIdsdDLyAyOX/Pr
         cVufivfXxyRaBV88YfSgPkzm8SOHz5QrCWcfjShn0EqtlrU0537ALEzkkl4Vu483+wMq
         tpfQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vFwPJo67;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-17315-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-17315-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-17315-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5735c9075dasi3245518a12.385.2024.05.13.06.18.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 May 2024 06:18:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-17315-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vFwPJo67;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-17315-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-17315-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9F041F2298E
	for <alex.bennee@linaro.org>; Mon, 13 May 2024 13:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B2381514E5;
	Mon, 13 May 2024 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vFwPJo67"
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E808150980
	for <kvm@vger.kernel.org>; Mon, 13 May 2024 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715606293; cv=none; b=EmE3OtHl1o6h+gQ4JGlWql30Myti1MYrj6AcJ6qFa5FuL0sM+1CPSvu2T5PXCgOoT1ZYwv9ksL/I5+bTyGMctzbfgczBvZuOGLMIdJ+dv577dBRYWDDvZOx3DnuM2InfvC8BCQgd0XEivG6UrrjSTXvQWcsk6aueSgt/K1Y9YVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715606293; c=relaxed/simple;
	bh=R1mjgHJalS937furFw/3CcRQaH1lDxfYP247THS079Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=L+5z4yznXdpw8ZA+SKgbCWgSJA4kAAbmf6cZoNqsPJLNppuwbeEBoNsmpqtg01zoi2sBlC5+iLWpv6yk8QoFD8bI3+PtF4V5crlqBX9dHCdFmTNsgjEJoHTfn1du07qLvHJMC1WkfV/haYOzAwmi2myVhxB1XtzGPS4SzaRrAzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vFwPJo67; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso2705492e87.0
        for <kvm@vger.kernel.org>; Mon, 13 May 2024 06:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715606289; x=1716211089; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kPjgYgq2OJKi2+MpSVcM8/6vIKwKmBz6OcIcuKES9D4=;
        b=vFwPJo67VC68YlacY2sI9VR4RRHpLjptEte8zoXiWNIfO0D5FNubB55zIfzwz3117z
         7raXfD4eWgE3ap/tO1HLnKNs2XLOzfKVdw67dfrf5QLLJ0FZYlaSIBbjNrzhTZfGjQPF
         MrxRhGRQsSLT/5VK3ATvEOlHfChIfySxbekZKWw9h+uR1FeIE0AfUYQreatv9Lbg1QSV
         h/wRr8qApl9RsbCLD52af44ucZh1CtIQG16aF8+1KcNJs54btA3BN0oOFC9bWv8hjsCb
         74S3gCoJBBWI2+psdtisodPM5aSqze1Er3ATVbAREzbe/Nvdxy96i/eMDjczO3go2+oW
         JuFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715606289; x=1716211089;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kPjgYgq2OJKi2+MpSVcM8/6vIKwKmBz6OcIcuKES9D4=;
        b=Npvs66ualkGYtjx/L+inFwwKCv3mf8ZgOTpWFyHHkDnHMb3Awy6tneOaEkxZjdFDqw
         UebWlsjCxvIxLgNPLlCFdcydqAJ6gLYxIqEzfneYtxzDhwye9JRFwk4bGZ4QcSGrqr5x
         TsaVHFl/keucnYuyGnNuSM+PSuklFen+ofMpSSxC3dZtQO9wezQneGmOAoQ8kXarec5Z
         b0jBS23PDDFiGWeCbmj8wpN5+lrzEYo7xRhGVG4nBfyCVueXYeToa+Bq0FWp7y3vJqfh
         Aizp/Pwwk0jmiOH072PUpadKh7aAkU868b8x/ztBytNHzdc+xBHfxQuqrKNYEAsuGyqb
         GDWw==
X-Forwarded-Encrypted: i=1; AJvYcCUoRAX8w1rbnmwXVGQVAfsSB+1V4AkYdiJBF+Us9+plaNrTPrPIf7q+/3zgN74qb25rIw9HhZ5KaH5KCLL79NNOT7iY
X-Gm-Message-State: AOJu0YwUKrSkx35OvaRk/rEynLu7a3GosJrtvQJbQ8B6qsqSTT/+baP/
	gfVm5wH8JopbpRWcoeMAzKc0UVXcU5zkjMsNdvPIX0V+EuU26Izcv+XnjL1dfj8=
X-Received: by 2002:ac2:4309:0:b0:518:bc7c:413a with SMTP id 2adb3069b0e04-52210276505mr5149644e87.69.1715606289265;
        Mon, 13 May 2024 06:18:09 -0700 (PDT)
Received: from [10.1.2.72] ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-522403ed95asm937750e87.57.2024.05.13.06.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 06:18:08 -0700 (PDT)
Message-ID: <96c088de-8144-4f37-81e5-f3b51d6c29be@linaro.org>
Date: Mon, 13 May 2024 15:18:06 +0200
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/22] hw/i386: Remove deprecated pc-i440fx-2.0 -> 2.3
 machines
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, qemu-arm@nongnu.org
References: <20240416185939.37984-1-philmd@linaro.org>
 <6de106f2-1061-483e-97db-96b09e5b40ad@linaro.org>
Content-Language: en-US
In-Reply-To: <6de106f2-1061-483e-97db-96b09e5b40ad@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: caNRhr8EVnGK

ping^2

On 6/5/24 16:29, Philippe Mathieu-Daudé wrote:
> On 16/4/24 20:59, Philippe Mathieu-Daudé wrote:
>> Series fully reviewed.
> 
> Ping, is there some issue holding this series?
> 
>> Philippe Mathieu-Daudé (22):
>>    hw/i386/pc: Deprecate 2.4 to 2.12 pc-i440fx machines
>>    hw/i386/pc: Remove deprecated pc-i440fx-2.0 machine
>>    hw/usb/hcd-xhci: Remove XHCI_FLAG_FORCE_PCIE_ENDCAP flag
>>    hw/usb/hcd-xhci: Remove XHCI_FLAG_SS_FIRST flag
>>    hw/i386/acpi: Remove PCMachineClass::legacy_acpi_table_size
>>    hw/acpi/ich9: Remove 'memory-hotplug-support' property
>>    hw/acpi/ich9: Remove dead code related to 'acpi_memory_hotplug'
>>    hw/i386/pc: Remove deprecated pc-i440fx-2.1 machine
>>    target/i386/kvm: Remove x86_cpu_change_kvm_default() and 'kvm-cpu.h'
>>    hw/i386/pc: Remove PCMachineClass::smbios_uuid_encoded
>>    hw/smbios: Remove 'uuid_encoded' argument from smbios_set_defaults()
>>    hw/smbios: Remove 'smbios_uuid_encoded', simplify smbios_encode_uuid()
>>    hw/i386/pc: Remove PCMachineClass::enforce_aligned_dimm
>>    hw/mem/pc-dimm: Remove legacy_align argument from pc_dimm_pre_plug()
>>    hw/mem/memory-device: Remove legacy_align from
>>      memory_device_pre_plug()
>>    hw/i386/pc: Remove deprecated pc-i440fx-2.2 machine
>>    hw/i386/pc: Remove PCMachineClass::resizable_acpi_blob
>>    hw/i386/pc: Remove PCMachineClass::rsdp_in_ram
>>    hw/i386/acpi: Remove AcpiBuildState::rsdp field
>>    hw/i386/pc: Remove deprecated pc-i440fx-2.3 machine
>>    target/i386: Remove X86CPU::kvm_no_smi_migration field
>>    hw/i386/pc: Replace PCMachineClass::acpi_data_size by
>>      PC_ACPI_DATA_SIZE

