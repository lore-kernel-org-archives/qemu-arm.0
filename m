Received: by 2002:a17:907:77cf:b0:a3d:1c09:7d3d with SMTP id kz15csp396975ejc;
        Sat, 17 Feb 2024 12:45:37 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWCgbw9ZBudFQwbrJjpnETFjDpQl5qLGQjQIySjXCEy8WyfkF9cNiwSH3d94vdc4U4Vd5ceYujWoW22whCuOG9Dt5XxWz2W
X-Google-Smtp-Source: AGHT+IFeJZL7UK079IYw9+wm6D2SHilt9pPlbafE3hZoX1tJy5Hp5UTUX8Tin7zd2/WmzXd7GaUt
X-Received: by 2002:a17:906:1397:b0:a3d:2356:c582 with SMTP id f23-20020a170906139700b00a3d2356c582mr5887226ejc.48.1708202737514;
        Sat, 17 Feb 2024 12:45:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708202737; cv=pass;
        d=google.com; s=arc-20160816;
        b=djeIMP9gKwyGuS2AI5ztZVAFDL6uvJp3j91givVm9zp2jJbynUhqhFU37CrJLWNGQJ
         66OYa3UejAD3m2ALB0tTDJybJvNeh9ELhmIHVbarO1ILXhdJ7Cd+hLUYzeh3tRdApOvG
         A+loZ5RnMh2LelpqssrqFg91aUc3/hOe5/vLmjLc4gf1jGOvMtOOKoXObAmGnmSVS16q
         uxkN4P4n4qSl6I1ENcpcmI2VUOT+KgjulwisLcTacMzOnnJqgCGM/zOZUTmomQuNuM9I
         hQj7oi6p5qa1SfJPs5Y5YeLPJVBM4Vx97wps4LYTPIWN3OaKyR5ZB0pQ1ht8Hd8zW0tH
         gtXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=BQkxEuZ1KKupyrZd7n2S/dtoK9dG9RrsFuLLvaqdWc8=;
        fh=GW3UU3AYaL6nG13c0YTyVEjib4+jx54M4OH3yBZlBEo=;
        b=YlwoMfxb24Xo/ndx9fXu9LexRLHkKInXzNY2xbxDepTZjWCOTfVMtkwazyZ9GDC5VE
         CzTNMXYAmOUdCCVu7mgXAEPHGBCfc+iRZaGGDzZ9sgorscdHw8As2Xm5i5G2juQvxlj8
         MfmObx8SHEO661Ug7O3AXhYxdRYJpL1NJD+icn1l/NBH5KGUo1x1xNVHdF9bd48GNoWF
         fvZmL0FYlh1OD0a3JfiGSbVXPbtHxBBhVilHr4feAwvpW4DkgB+N3RbbsJzDwj1w3Dgf
         qvdKqXqA6rL9NdWUe+Vq8OD+bkupSp1WJ0b3JMOLNDeJG/oPaQy/AY6lO/BPNpJkAZ1P
         5Vcw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVfzaUFG;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-8977-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-8977-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-8977-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id y2-20020a17090629c200b00a3d6cb371cfsi1066283eje.652.2024.02.17.12.45.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 12:45:37 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-8977-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVfzaUFG;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-8977-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="kvm+bounces-8977-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C14E1F22266
	for <alex.bennee@linaro.org>; Sat, 17 Feb 2024 20:45:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16ACB6A024;
	Sat, 17 Feb 2024 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WVfzaUFG"
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E6F1D6A4
	for <kvm@vger.kernel.org>; Sat, 17 Feb 2024 20:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708202731; cv=none; b=kwujaM/pRJ18+uM7jK/WyYsID+ARMIfjHK6wUSDg4pSVv33S3SZX/og/3g+5/xAwSh6EeF7kXiecfYu21TSvZF5z7wB8F+B3tU2ozmDHroiEtzUNHO+wIBaJ2bORJ2q4LSNO0+Zb5SmMpyzwlhyUhXWxSlxq+TT2Maumhl/c2kI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708202731; c=relaxed/simple;
	bh=NRcCcNrGSs6DgycF78Kmx0enC0lNWUE/s5XZjEF7bmY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V48laQkPV2CA4IaPTSo2LSmVBG53WE+lDuQ8pVXrVhOguhNmYGDdgPIhg9+D7lTeZ3CLQEUHLb+tyTe6sH+Kqfl60fj2KVFHs9lHo2brozlTM7rkf/3d32DZAMvTx1J2Tx+BRpiCKbE/BKhuQp1ewBeicpgGRYB0J90rf7XbPkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WVfzaUFG; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e2d83d2568so2123534a34.3
        for <kvm@vger.kernel.org>; Sat, 17 Feb 2024 12:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708202729; x=1708807529; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BQkxEuZ1KKupyrZd7n2S/dtoK9dG9RrsFuLLvaqdWc8=;
        b=WVfzaUFGuTkuODnhEl65VT8M6LJnFSFfK52IPMI6GEWncKF1Y2NClyJowDLTo+lhSO
         +WuxOTJIDR+tVqK8/ZO94RD6f0Qx/myn9s1N7nULR6V5C/e9H6YkgQmJyuX7+miMosmp
         V+BcmdbNVM+8K00/5SB9n8HLfT0Xm9+KNpK8fEzh3GnbcNMLaTo33Dy1pDcTvCZn6TiR
         fAtvTBDzDB+RH/S0weVmoBF3pVty0cMSjZiGQq/jZRO7dY6128rhk+ETXT6njaD/Qnum
         T9MSXbR0gpPGyLmhm22yNOM7SmZ+keHy0xrNoZmxPDXTCuU4w3oK82oGUtsViGilXzVk
         Ud/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708202729; x=1708807529;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BQkxEuZ1KKupyrZd7n2S/dtoK9dG9RrsFuLLvaqdWc8=;
        b=Fh/bfYPMscdVn/dsGmt36v1a04vE7iSvx4Typg0+ftpIbpuMVmEiqVetFfWgzvFFKx
         8G7VCcxcW/P4H647h4snLAF54qeBme+gPqLoekEu+vFBFRrzYFQvUwAnirKEcwPbs6xQ
         u0Q0EtwGJEUKnSdyA/0xAzkiORP+XS6HWEXwO577qW3xcKdx3Ks5khMyfbu2koPEnfn3
         P4FG1rx7d/vatbhy6c0O+YEynqXVi8DhO2cLuNGN/+XX6TQ7f2+ilmCMKlAKml0c0MJV
         DwYwGaJSkCJYzAgAOZ/AGH/CIpf+L/inVdQcUvBblCOtFgrtTgE2nk8SY9GBTAjUB8DT
         eWAA==
X-Forwarded-Encrypted: i=1; AJvYcCV153B/2G6RXKMrXkX0Vr7s+F8Kv/DZsx5LLQjOUuaolQemm26c8CrxtukFEIGLuPXusyFMpDUetGELiwh6VIudNjTL
X-Gm-Message-State: AOJu0Yz67bYah1f1n3S9kef0TBZ9Z+7WQxfu64KIawNQaV/H/O3Mvwh2
	PeymNP0ssK06stRjNIgOnSox8z4bxW7r/0aAXDw9SWiExsf7n56BoB99KYxl+fw=
X-Received: by 2002:a05:6358:94a4:b0:176:6141:48e5 with SMTP id i36-20020a05635894a400b00176614148e5mr10359766rwb.10.1708202729365;
        Sat, 17 Feb 2024 12:45:29 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com. [173.197.98.125])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090aca8400b00296f2c1d2c9sm2227236pjt.18.2024.02.17.12.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 12:45:28 -0800 (PST)
Message-ID: <67ffa947-5538-4d10-80ca-024c9a62e229@linaro.org>
Date: Sat, 17 Feb 2024 10:45:26 -1000
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] hw/sysbus: Remove now unused sysbus_address_space()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, Peter Maydell <peter.maydell@linaro.org>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20240216153517.49422-1-philmd@linaro.org>
 <20240216153517.49422-7-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240216153517.49422-7-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2FXT8kGjszWD

On 2/16/24 05:35, Philippe Mathieu-Daudé wrote:
> sysbus_address_space() is not more used, remove it.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/sysbus.h | 1 -
>   hw/core/sysbus.c    | 5 -----
>   2 files changed, 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
