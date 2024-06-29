Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp634382njm;
        Sat, 29 Jun 2024 10:27:42 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCWrmXx2VdKt2+xoufSRgeccApEQL8F4ooZjEeV2kyqors29EBtYqIeTofctBr+DaVSi8B8JhUTeH5LDYnGn9mRnewboF16r
X-Google-Smtp-Source: AGHT+IGlNlK/N4db6J5fiSvCcjmwJS/Q8aiFf1O5eNctsXE81sLJCsYWBaH1DGbdo9Shg6gNlA3U
X-Received: by 2002:ad4:4ea7:0:b0:6b5:25b6:dd04 with SMTP id 6a1803df08f44-6b5a540614cmr87534026d6.1.1719682061839;
        Sat, 29 Jun 2024 10:27:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1719682061; cv=pass;
        d=google.com; s=arc-20160816;
        b=hk0j4Xq39H4VwcdWm6fHhvVsVlJxWRMSSy+81u2FaW1WN7ZHMa9Urtq8Y0Iwo7Xm8m
         3yilwY1ip+K3GqMNV1QFvqSkA23phY4hRWzeBSbtNfnrSv1pYYhlzgzKL8jCXu5uUdCZ
         5m9B5q9TtBc1t+8dbgmwD3soWEKUzb0X3nHK9CT3l5F89uubHku49ZnwNGt3EiYvRSRY
         7XayUjj/dFDz/2RB/nf9DlCrVDJdehEL3bZSmZ1eJ6jFJd2JqXJuM0i4p2Ibqqh7POqZ
         Jv0qSv2a4VntxcpukPoP6qNI2k9ZQw1dWu3pp3kUVwb41gwJz8BocMLiiQTXOnW5x40H
         mZ8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=3kWmdhjmCZKSz2j5dEsN40l/UWaacFCAkC7GnSoRnPc=;
        fh=HehkDQmgFBpaJ1yZpkTl5YxoiGtrIq2qWxN6myHpkq4=;
        b=r1xi8zoigDlr8GOp3kUpUYViwb+Ea6xpsillLAcCoBJbYe/d0JtEKcfJJKbNBHlcMT
         Y6KYEFMxANkjexznltSvBprDdtvOZF1MRrC6f/K7iSncZvdgfR5H6zFkhl69dXjXnSHg
         PlGw/xqdtOtB6L4snsXcXIdznk5RXhBZ9IJse2XCD4pNPglPPGDqXPqGnJnMnAjX7yB8
         TwYVfS3kc5VpzILtfwcFaTGMxewHZZlmYkl4EkPf5q7I8X7isUyc5dJkRC6am4vz5yXx
         5IIk+1o80PgM92RgPz4BtC7T4sc1/TjTsj0kW/2aHr7gyHORGPuIYFy2rWFAbhk+bYg4
         LXDg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i4+UXLmO;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-20729-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-20729-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-20729-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f05b0si436441485a.368.2024.06.29.10.27.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 10:27:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-20729-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i4+UXLmO;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-20729-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-20729-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B1341C20E02
	for <alex.bennee@linaro.org>; Sat, 29 Jun 2024 17:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08C44F218;
	Sat, 29 Jun 2024 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="i4+UXLmO"
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1761E4AF
	for <kvm@vger.kernel.org>; Sat, 29 Jun 2024 17:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719682057; cv=none; b=gL5q/dPqj5SAaeiAgWOix58/DuWiuOjMDX+4dHo3aD37CqQY8/W4UpCaXlVx2erVXzjACsLrQPBPI4Hi0AzZhxNhLWLkxeNRIM6k+GMe0zKJMkIcF2aocVyE5yl0FJ93owuLJu2oyU9uTF8M3DUYiA/Wdgo+rzIfRZsYAHht/ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719682057; c=relaxed/simple;
	bh=K83w3UZCUTYy2ZBevIKtZUuw+TmIdke+/l52b7H2BRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iREuFXFHjMOEZPe5WjKM7MKuJO6dgwuHadMYQSFaApfNqWPW8QvWH46NpDGmfucoAPKBim2IbeVAsmJ1nWjNWZUxxyBJnHZHdq3+EnDAy+6IHGdY2diLXZTLHiY7S2V9oUZJBEjKMZ0kFaQ+xTqWVds6fD+6Ad/2z6OGXvQaPmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=i4+UXLmO; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7276dff62b6so2039702a12.1
        for <kvm@vger.kernel.org>; Sat, 29 Jun 2024 10:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719682055; x=1720286855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3kWmdhjmCZKSz2j5dEsN40l/UWaacFCAkC7GnSoRnPc=;
        b=i4+UXLmOX+TTY0rTz47ebjfXczAbUNHyZVu2HmkXTUKm8v4MwUtGXtSKiTUfzPWzq1
         AUeI05o24upUhsMgIQC94Fj/DAO+JwlcjZ9Dz1iMSFxM8KjECssjLnJRrE7b2S0WZDj8
         r5wTg4O6/4XbcRbkYYwGngKrs9viUyEPcEwECdEikIQpZoL3i4T4XNLQo1Mhk84WT0V8
         ZvsFkrbIoXla7JFXiLJdGH9MvFwHlT5GGuTBG+fGcpbYe1XWG0VT9k96ybQ2EpM1AIhW
         sEsZgZocLrOt6QnRcTcN+t6KvXfryg1ngvSHk2VLKwIVHTBjxNPr7n2OWva99utobCan
         WICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719682055; x=1720286855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kWmdhjmCZKSz2j5dEsN40l/UWaacFCAkC7GnSoRnPc=;
        b=RnwFb4RgqyhgaMdU80zPSo7ieG0yQPyqg7hFh39GUIWkrNt8JffGw+75S/1qsqrHhT
         Pz73D4LsAyLLs+V6Mx2tilZHUM0J4/ueZb1Ki0S+AfOH+oYDhwBrJUAM7THMKLdFg/Df
         itcXb9P/KPIxf/bntdZpuzOCUtaVL9dngONHQ9B1dCUcyNjKgUY0EzYptaYFxw9v4df7
         teWBeGTZ5rroseXRrZAuW2neY+dSObbh+XKoxYOKnAhvMtQrDDob9jsVEqrzSpAG90c+
         9/euPqrf3tMdtt5aLqtn18k+A3CdmrlvhH0zBsXqnvygZDheTFkHbr1FB3UbhvPAOETi
         2xbg==
X-Forwarded-Encrypted: i=1; AJvYcCWmzj9dJQDGTfZz0ITk9KO1VQbIuYHqF/YFq6aTASlBo6Ihk3K1xfuOKDBDyhkXtTon+OB739Xg95uYymy/J/hcYs99
X-Gm-Message-State: AOJu0YzaljXcJubqcqnPmmm4jG5XLT54Npw0AYiofu41IZZbl7BmfYVa
	Gzou+a0qCaw7l6kEVahINGtwplWqbdJLSTXK35A1bt1OQDdnE4KewewKVi6jefw=
X-Received: by 2002:a17:90b:4a0f:b0:2c3:2f5a:17d4 with SMTP id 98e67ed59e1d1-2c93d185e2cmr2330333a91.4.1719682055007;
        Sat, 29 Jun 2024 10:27:35 -0700 (PDT)
Received: from [192.168.0.4] (174-21-76-141.tukw.qwest.net. [174.21.76.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c91ce433c0sm3643452a91.16.2024.06.29.10.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 10:27:34 -0700 (PDT)
Message-ID: <c9fd8ce7-6c88-495f-8f43-917fc675743e@linaro.org>
Date: Sat, 29 Jun 2024 10:27:31 -0700
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] target/arm/kvm: Report PMU unavailability
To: Akihiko Odaki <akihiko.odaki@daynix.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20240629-pmu-v1-0-7269123b88a4@daynix.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240629-pmu-v1-0-7269123b88a4@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: /dgnsU91MB9M

On 6/29/24 05:50, Akihiko Odaki wrote:
> Akihiko Odaki (3):
>        tests/arm-cpu-features: Do not assume PMU availability
>        target/arm: Always add pmu property
>        target/arm/kvm: Report PMU unavailability

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
