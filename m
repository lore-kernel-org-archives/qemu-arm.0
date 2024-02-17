Received: by 2002:a17:907:77cf:b0:a3d:1c09:7d3d with SMTP id kz15csp396610ejc;
        Sat, 17 Feb 2024 12:44:16 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXCaG3mxZj+Jggco4WaqONIowWX9HtgeCUFmxW8IsIWTeDKC/hs/8NsMTGeL3tjKPVLWtPSbnRpX5gEigeAusaUcC+unWus
X-Google-Smtp-Source: AGHT+IGY6GXxqMlsfCoj007ouJGO6aMXsdfwKH/QtzaiP0Jo2A/EbuU5RSJANI02oI2Dn5XMSXhl
X-Received: by 2002:aa7:8654:0:b0:6e0:54bc:3591 with SMTP id a20-20020aa78654000000b006e054bc3591mr8858125pfo.10.1708202656559;
        Sat, 17 Feb 2024 12:44:16 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708202656; cv=pass;
        d=google.com; s=arc-20160816;
        b=XRjojAeXmuqG4XTdMonEUK8UFvGPGit6/4KCR0lIvhp7SLwVQaaUnI8RXic0rPDDtD
         uOawtEYBjETl3fk5Ndp3HWenIOlP4aTBwCRO2xxnxt/HYYZEskJSveSoMWm1qkIJ5xam
         gmaHjYmC1ckONM9/mYT3P9Gx9njFsgUSKFq0tJ29p5rgRB6vV5GUl2MjgYnxQdB/FsBp
         gar46uo4LxqThJHneama/4VL6Zqb87IT9O3rVELoEy7lmJonLGRr7RM8UizkwA4Q6day
         gbFi7VrIw/volHI1ewaU7ee0ixZT4zzWXroiD0WiTA1StObCA6nHcER27Gs0HLaLsW/k
         PdwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=M/KURmixgPMCy/7Mb3v5DHX0msHKFJrA8nPc7bgaBhM=;
        fh=fhjDpBYNRlWv8iJs7zmpwgVQ6yxu5ZFrQZNhZJoO9ds=;
        b=OghMOVOT5vp5qS03IqB4aUHMSnL7R6LQMfE82C7j5QQnFt7U39M4PCVVaPpmSVTipD
         tt6VtQLoJXRsw6fkoMOO7/Ji7YzHgjY+BiRKmvKGWqBPXFpchkL4/bX7h0Dw08nUQY8W
         Ng/KU73s1dDrrblEuauAV4jM5IEDsWN6iLC1G7xzpgJJrkag38apeB6ECto3FO8IUzxU
         lcwu8371st3GzvSMy3dyi/w4W7pwgSbqnUXDWCZRXOD6eIdxHoMVnD2YmCtUm+lLECEl
         XREHRtsL0p0UL340IUO2j3wtC1ggnwY9vMCqV24f2Y7Wh/53xx1VOAU7MHZYXCVsJXBV
         kDFQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oPqmsx9q;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-8975-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-8975-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-8975-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id y17-20020a637d11000000b005d8bb0cd282si1934144pgc.126.2024.02.17.12.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 12:44:16 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-8975-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oPqmsx9q;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-8975-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-8975-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22FE4283B3D
	for <alex.bennee@linaro.org>; Sat, 17 Feb 2024 20:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495007F49E;
	Sat, 17 Feb 2024 20:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oPqmsx9q"
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90D147F464
	for <kvm@vger.kernel.org>; Sat, 17 Feb 2024 20:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708202653; cv=none; b=DjF296MKgB3qGjnB11AHwp4HMkfd76BwnA2CeU+VhwNKUm89nQNDHzko72136y69gm05Q5UFZDNltANwq89B/8l71PV0dJ3G1lEN9mKEzE7AU5HwdowwP+/8dDdyYrejjYJt18GxE3GjY4tX9elgT9QqrGjJhKO4723dzzgxID0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708202653; c=relaxed/simple;
	bh=rXBp/AyMq/OAo5mJpf2rMDoTH17ekSw+yjZsCNHNLkk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxMI1j/Upu1Kk9I7ZHYLKgR3MeD4Rm4IjKs24cbAWnd+YQm8dDf7M/G7y/Xm9XxyqoQv3MyR9F7WT8nOek+OxkwaO96QMPWuY2loHv8RdDIBd30NYJ9xt2ALDg3u2WIRZbyWqlkxfKubXaP5m9qJVk1xau+D/tdOTaN5OqrvNM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oPqmsx9q; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-290b37bb7deso2624506a91.0
        for <kvm@vger.kernel.org>; Sat, 17 Feb 2024 12:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708202651; x=1708807451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M/KURmixgPMCy/7Mb3v5DHX0msHKFJrA8nPc7bgaBhM=;
        b=oPqmsx9qqUfDznkXOMitsF1nUV3kZ2KNO2wykCJkueOw3eNWYbIP0/hwNC3u7USj71
         OQr2tT/xxXR+KU7BwFThzzvwjS/MmBZ4NG7IExwciJgRWGuAVoosjsqJA81jStjMMhEj
         CSNLrD8x/FkTQ6jFSwH+2iQHRYjSH41fQl0z/nhfR0Oo6OSTF6vChbKjMcZfuRDd0HZy
         4v14fXaY3VgRO2LjjvWUkPvO7cI+Yr/V6iCG/w1Dd3Q5jWbVv+RDvMzDSa/vuzFtqKgp
         pazsuuq9xXwNTDaPEMqj7jGPePoAKrtYzaokuLzSQULqLSqvasKqW8IPvwS5F64Qlg3v
         48MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708202651; x=1708807451;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M/KURmixgPMCy/7Mb3v5DHX0msHKFJrA8nPc7bgaBhM=;
        b=qoNeVOnZzWo8YR2G93W8T3fbMb7UNHfgYW1047qrgFF3mLFdNhodg/yp2DVjoPpPlc
         06qDnBPPVRTDiTW1IvugXiTCck2FRy6+y01yxn0ZVpmhnlwBtXaStHksWvLYORuIh7j3
         81/c2GU3McZAE/EG46I8uVk6nXYDk9/bjNu5Nk64Det7ip/MeIgNpJ5pj/jMO2usjjbi
         kppVfdVZuQBZk06tbiiWcPCnITI+EBxa5i8j3InjyNaASKZSYIiyYWw9FF0CNIAmP1aZ
         WDczpxvPpoVjkgHLpQV7/TEin+GRZBE9wBkxMEqyNwgPCYfBNB+3GrWStxA95U3XFu0m
         sBtw==
X-Forwarded-Encrypted: i=1; AJvYcCX7skxiEIlFgFkomQOvuZSjyoUyXwWVOEY5omrFqKyNtaF4KhwOueqDMfzFP6vpI3uBEXzvR7L03gzRFf4aZ8dRdB1k
X-Gm-Message-State: AOJu0Yxy1Pa2n/DjXtTq0sA/H/0iEdw2gG7JvuTf/riXgXAGTYqcqCEB
	RXVaMdWRnKNN07rmWD6GapfRo4cDVmIPwUSB5oTPIBmr3sJjdojRNlQHePC3j94vbb/cXoZnolb
	g
X-Received: by 2002:a17:902:da92:b0:1db:80d3:1af8 with SMTP id j18-20020a170902da9200b001db80d31af8mr12027422plx.19.1708202650772;
        Sat, 17 Feb 2024 12:44:10 -0800 (PST)
Received: from [172.20.1.19] (173-197-098-125.biz.spectrum.com. [173.197.98.125])
        by smtp.gmail.com with ESMTPSA id y4-20020a17090aca8400b00296f2c1d2c9sm2227236pjt.18.2024.02.17.12.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Feb 2024 12:44:10 -0800 (PST)
Message-ID: <a69dc66a-5227-47c4-8491-8d4666e4eeb6@linaro.org>
Date: Sat, 17 Feb 2024 10:44:06 -1000
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] hw/display/exynos4210_fimd: Pass frame buffer memory
 region as link
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
 <20240216153517.49422-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240216153517.49422-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bmwLjI7rMiQx

On 2/16/24 05:35, Philippe Mathieu-Daudé wrote:
> Add the Exynos4210fimdState::'framebuffer-memory' property. Have
> the board set it. We don't need to call sysbus_address_space()
> anymore.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/display/exynos4210_fimd.c | 19 ++++++++++++++++---
>   1 file changed, 16 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
