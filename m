Received: by 2002:a17:907:77cf:b0:a3d:1c09:7d3d with SMTP id kz15csp395514ejc;
        Sat, 17 Feb 2024 12:40:14 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXY2/ZiPI7K5LLY3V4qsOqqwREgcaEsLdCrouCYRG8SDuXZ+j1NwyJg2yue4A6ikBaFX+PicRivWkPf7Wdc9hgee1PaDSUt
X-Google-Smtp-Source: AGHT+IHWcjEbFuCZnwryCdPydiYxDsr0qygeR/fduG2lFhHmaNVi+V6imewwvp/M6y9YMqops3A6
X-Received: by 2002:a17:902:d501:b0:1d9:7782:316f with SMTP id b1-20020a170902d50100b001d97782316fmr11099627plg.39.1708202414685;
        Sat, 17 Feb 2024 12:40:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708202414; cv=pass;
        d=google.com; s=arc-20160816;
        b=IaQ0PL5FMdOKKlsE0T96wHXgYmhgTTe28dSE4YRhrSgVS9zdLmEi2S46NbF20MD/yE
         m0C48SxMtq2sBJDRsYEJH2lxN16KJGKC/y065CbV8ZS0be9QpxRQPb8O4lECNh82sR6q
         jlH5CofOjhvywVKUt1kS1uauH3aatG+I41fNu9m9vmur68uLNp1I6jvWpQglzN/RKgFX
         rrPEDPaZCRHtn2NF8rjipErZbZY0Eb+mqE6mxS3vUFgDhPeAlQnRrDMVQDZuMEswQgba
         llM/zm04qpkO0wseaQb0JVh2Ze5OV2URXeA6SmNVctlre1AI7EUefqxAU5hYkFeaV3kE
         BaaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=TGm7bt0LXkK1ArBzg/CaREi9+G0hDu7PzGsQZhkcbHk=;
        fh=bKNoNcyyUuDeaffmqMuQiITukRfm9RSU1FBrJpIweK4=;
        b=pQq6Tbym9ccN7rtgvPXStauGXc4ruEVcnYJuzbo608fiP3jCJ6sfvq72AcmN6zBcaR
         GTPktqc6mUYD1nZD86fVHVr5KOllTXhvccOcMrsSJvHoCDzFSSuKKmyOd5rQF+PwX4V/
         Ha37kpyq38QWJU/v4WjVcz6W4NxdgyEq6yU/AiK+/luMLDkysn/BO3aS9sPaNPtBcNxn
         kE8KkPtJlBI3eqtSBjoj3hP1TSmYodKVijlaq4CylIIoiKA5+0NiTcPL3NeRs809t9Um
         qkYa2ixtpDJb33S2fiLGcC9Rm8JGTUvpibhJZyQnXwm+HaFSAM6vCn9hIPY6m4uN5Aj5
         UygA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PF9JydCm;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-8972-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-8972-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-8972-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [147.75.48.161])
        by mx.google.com with ESMTPS id g24-20020a1709029f9800b001db29999242si1905860plq.251.2024.02.17.12.40.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 12:40:14 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-8972-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) client-ip=147.75.48.161;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PF9JydCm;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-8972-alex.bennee=linaro.org@vger.kernel.org designates 147.75.48.161 as permitted sender) smtp.mailfrom="kvm+bounces-8972-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83188B20BB5
	for <alex.bennee@linaro.org>; Sat, 17 Feb 2024 20:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1CE7E58F;
	Sat, 17 Feb 2024 20:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PF9JydCm"
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B031D6A4
	for <kvm@vger.kernel.org>; Sat, 17 Feb 2024 20:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708202407; cv=none; b=hf7E1r+3y12fsn2AIr9HL0suJae3QjgBXZjfMkHmI69ZJelx/mFImK77YTSnFul4EZoupGHV/4zTCy2yiI20V1hbXBnQLelxA5F2jX5diAo8BnoYf6J0xUsSdN6iFqtFswGUqHwLTfcXTDEZulPu5yyGu2S773HgGlovOJKB52k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708202407; c=relaxed/simple;
	bh=MFfQKQoho2IkfGgCyXPtGinmyVWBW0QSFaJthDXyMbU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QBt8BQy3/zBkff5TdLKULlUH/pNMA09QHGr5Uv2apIhQApKLDVBKGWsc5qBk1nR7ufj8EVfbBUhaPzmMy0C6xDZHHdNdPIDoGQ0sUuygAXUPB7eRhIVinIiKwma0VG5iJHmkRUZ9Fw8jPDlcpUFhqsbxCjFo8TRG6kEc2CInVUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PF9JydCm; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6e2d83d2568so2120866a34.3
        for <kvm@vger.kernel.org>; Sat, 17 Feb 2024 12:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708202404; x=1708807204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TGm7bt0LXkK1ArBzg/CaREi9+G0hDu7PzGsQZhkcbHk=;
        b=PF9JydCmqdUrNCfCVrOpYJ3jXuFB9s+fWbx6dVoB/UBM1apXH9DK2jlMTJ1q6qwnER
         aTW454TXc0UugWV4ZGgydgN3yrUf1bSR5yQGDk2lvgtYzGxERWEznRttow7gDZCjaa+g
         AtWYV0MpcKHzzQVQk5WRbNtj7/ieJl1Ydv4PpUVA1EX2i5JY/nvFqss27zRSmkOfzsmS
         LJSZf/pOIQx01FAopWiYPgBXiGbsPRKUugrbixbwToq6/m3h99oOoLJXtvsIBOffzkwL
         JlM/PNwOTXRe1rPb37NE0+1mFBbCl/JbOIsoxJI0fjfisja6u6Ai/5Qz202ci7XOy3Bz
         5zFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708202404; x=1708807204;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TGm7bt0LXkK1ArBzg/CaREi9+G0hDu7PzGsQZhkcbHk=;
        b=peBaDBS9hq5s8Lt1Pira/P2+mdD9FxL6e0ejnD69gf8CtLo6thgb9MarXzftB3Uspy
         QofV05AoczZU1Pbr/A25XQmlO4dsIMfmi7E3Vh/F9xZwSA3cx1R07+kzpBCHpHY1EFMH
         zyuRn2pHQn/q1C0jeDn039KI5sHz12Y4wL9QSer8wkw56NteBCyk32ds8oxCjAjzalPS
         x5ESjvSDYSXKUfzhQZYFPR4emgcFYlkoDf0LWsqDuhtKyEFqPzKCW1NY63d2p9INt0E9
         aF3+2juH50TUCfqWkmdCjfV+FVzAFuSh5Akzb/qRRuGxef2JKZjmaJs4u2hZRjD4VFY5
         JDvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2ea8G1+ejaCnrsTOLZfBIPdiEDQLZ3IcIXDO60hH68Qq5MfR5KCdejkpw624bSQpG+ZCZtUDlSNTSazlPBAoWGH3q
X-Gm-Message-State: AOJu0YyDeRXjcXmFwGCYdvnOsdDdHDun3Ugve9IvCFh4oXgEwwRpefXp
	o3MCKV47A587Ml9sZgGGYdVX2/R8cQZqoNCluLhvaaMIqvCQK7D6jD6TILUXQf8=
X-Received: by 2002:a9d:7e96:0:b0:6e4:3e94:d706 with SMTP id m22-20020a9d7e96000000b006e43e94d706mr3599278otp.2.1708202404676;
        Sat, 17 Feb 2024 12:40:04 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com. [173.197.98.125])
        by smtp.gmail.com with ESMTPSA id n15-20020aa7984f000000b006e0651ec052sm2049388pfq.32.2024.02.17.12.40.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 12:40:04 -0800 (PST)
Message-ID: <08746b20-24b1-4ac0-8f9f-4eda5448c2b7@linaro.org>
Date: Sat, 17 Feb 2024 10:40:00 -1000
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] hw/arm: Inline sysbus_create_simple(PL110 / PL111)
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
 <20240216153517.49422-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240216153517.49422-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 8N4kvTzjbt1M

On 2/16/24 05:35, Philippe Mathieu-Daudé wrote:
> We want to set another qdev property (a link) for the pl110
> and pl111 devices, we can not use sysbus_create_simple() which
> only passes sysbus base address and IRQs as arguments. Inline
> it so we can set the link property in the next commit.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/arm/realview.c    |  5 ++++-
>   hw/arm/versatilepb.c |  6 +++++-
>   hw/arm/vexpress.c    | 10 ++++++++--
>   3 files changed, 17 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
