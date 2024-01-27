Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp84640eja;
        Fri, 26 Jan 2024 20:24:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEd2Gcevaf+HYW/r+bLG+uri5y2o8GncjCLX/F0B/Hoar5GWroLqkG79bsTmQTrtuQQj0CZ
X-Received: by 2002:a05:620a:218b:b0:783:54da:28ce with SMTP id g11-20020a05620a218b00b0078354da28cemr881019qka.135.1706329496772;
        Fri, 26 Jan 2024 20:24:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706329496; cv=pass;
        d=google.com; s=arc-20160816;
        b=AS/M+DWr7cq1a0gYlMI21CwKVochDJig4Q4AgY7HfXVXtENAMjtbYaAZFzqFkANv7h
         +hEmZ78BzR+S7rjlFaPt6eySHJjwM65ZUnZWs/tTH+5wNbbMfVDtV7L1IFlxSegxOAnm
         gGV2BZctnwcqrz54Xz2fLcio3aY8xSDOmfCQTBh61Wgj9Q6MNf6mEq85G8v8omhNiNct
         uB+nAWh5NMZy8zPEBcSjwlIj3OhU6UtEZu0CaPHskqsQl4mLq5AECjJq/O7ajn26xsTP
         9d5anZHXtfSDVOY+v3AV7AMkvEQ0ZVUEQA5F5yt/4k1XkIh88Bxx1gKJ4QC50lf/PCMd
         7wEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=qwh7umL/TaZaRiuFz8g8riwDzaQCkJzC/LRygZGabUQ=;
        fh=3eKkNY+PEywWCHb5g17zws+W5NsjT4sA/mUlSqMFGmM=;
        b=FHZy4t8QN9ekv1KcOTFrvzxuajiUWNWoZdXuW9ZKYLQwBGRl+9IIAMAzjIzLl14Gis
         zTt2lf+2ri0kX25u0Yy9pDBzmeMfcVMd57iEd5IdsQJKtXCDOmqsbeeX+lygdGqn1DNj
         StucTl1cFmvADDDJPMyEMwivBifwnmtFDHscElORk09CgQ05YF7FkDbfZHrwFuDq76I7
         POlC8ZlMLHhFgnashO2qkOeqs6iOq0cFgz7xfCAqORbUDDL7Q3ytgEsHLfsyr5lBaU3Y
         FkEeD0cSRgFWxs7vj7bN8Qk2imlQXVVonv3PMmvvWzFd1HiKq+9FscCE8hriaV8H47OT
         BMew==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sG6VZwjX;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7272-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7272-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7272-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id x1-20020ae9e641000000b00783d8b6200dsi2149397qkl.113.2024.01.26.20.24.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 20:24:56 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7272-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sG6VZwjX;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7272-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7272-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DFDD1C214BE
	for <alex.bennee@linaro.org>; Sat, 27 Jan 2024 04:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD0512B6B;
	Sat, 27 Jan 2024 04:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sG6VZwjX"
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986DF125A1
	for <kvm@vger.kernel.org>; Sat, 27 Jan 2024 04:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706329491; cv=none; b=d0ac6ALfbZ02D+xFxF31uL9J9Heocm4EC/BooXzv1tXc8YDyznOs4TcgN3bkOAtCjXQUrrAqhy+gR7HJvzdVZhvQplk0RyNV1c47Mt/YS8O0LF7MreiWN7cwoMnEQGsVfRqpTExDMQcYZsvRnKJpDtPvHBO8XQ7jFsJVzKdU3w4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706329491; c=relaxed/simple;
	bh=E7xXlvbFxyKFI2RK1tTr+9ppd45y9JqWbMb33TfgjYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=onEh49H6+jXUYnCFswBEqCsvbW41DsB2cfc7GIfejBgaQBuHYoswzlJkYfJ5ClIxnnKZ/Ulz1j6hx/MFhSSR+5bs5LN7STgbaYDbhIpAp5hdtx2G2u6e6zGYz48rYAgyvY2AGoWyOI2YZX03ux0M5ubMXhwk6sV3690WaAbkDaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sG6VZwjX; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-29026523507so1103010a91.0
        for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 20:24:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706329489; x=1706934289; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qwh7umL/TaZaRiuFz8g8riwDzaQCkJzC/LRygZGabUQ=;
        b=sG6VZwjXfw72jfXzE3KMgqfiCaLndLd2yAx8KwNIEQqtWQDNTMDgmW67IjvWilfacB
         tKN+MXNnyyVBr5iH1bwKel++nBYbjyoTtz+JfW0g+kgk1A472fO1U+FYtOkG8GdGJtb4
         QJzcq4MvEuMrbNKI8+6nOsc6GRIKFH5Z+HyJ4e4enNgrOWVHhIFlYZBh6/11jtqVjtO6
         iee1JlYqut5X4j9R+Eq3xp9WD/12/MEPbyBDNgn/qkXCqRAxYsNWWzOGll41bTDqfIm1
         k1YlYC2pmLX212zzesNeiS3h+XQqLeGjM6Fve3d/BnaDoZugNs7nJG3LlcmGdrqjpUgJ
         gWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706329489; x=1706934289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qwh7umL/TaZaRiuFz8g8riwDzaQCkJzC/LRygZGabUQ=;
        b=Dk3jhMSeSWXOjC2KWRmQ27Qp2U4gA0YJiXKxt08zHPqQzhzUzZB4dMKFq/fXCNxc9a
         ufOt4wqBCDNFHT/1dP6+//Wdyx4oCm2HYa8KTJNbK/Tk9zrtNrgFzMczSzBkbT0wimQX
         rjLpChUmMkA6a9cAgPRDqLGDBKPkV5eXnr7/qvoFvC5Q0uE4XFGdzklyZzfzDpKc75WM
         sCK5h0EExdaIFDj5WelYWhBG8/Y2BuS/4u3w4xotLUCVYct3FByNbsg6UTfUTRMWQEWG
         ZyV3rzoOspESW6yawioSNfHqvebVaMixD3N3N/iktLSPlArjTErthrYVHrG9re7Q7Q6N
         uU7Q==
X-Gm-Message-State: AOJu0YyDAcN++Y+yC3xdQxF1JF/DLSsjjGjBVgtREVsqFO44y9Z7GJa4
	1dR56o1AIVl9ruAs8E4z+LlAeH3UqbT+RCMkqoDqRhWA4gmTdi/CHg8+YemOfWo=
X-Received: by 2002:a17:902:788f:b0:1d7:8c9a:14b0 with SMTP id q15-20020a170902788f00b001d78c9a14b0mr909200pll.42.1706329488906;
        Fri, 26 Jan 2024 20:24:48 -0800 (PST)
Received: from ?IPV6:2001:8003:c96c:3c00:b5dc:ba0f:990f:fb9e? ([2001:8003:c96c:3c00:b5dc:ba0f:990f:fb9e])
        by smtp.gmail.com with ESMTPSA id gd17-20020a17090b0fd100b0028ffc524085sm4001781pjb.56.2024.01.26.20.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 20:24:48 -0800 (PST)
Message-ID: <8d359557-3672-4813-a415-b0f8e0a69832@linaro.org>
Date: Sat, 27 Jan 2024 14:24:43 +1000
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/23] target/arm: Prefer fast cpu_env() over slower
 CPU QOM cast macro
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Alexander Graf <agraf@csgraf.de>
References: <20240126220407.95022-1-philmd@linaro.org>
 <20240126220407.95022-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240126220407.95022-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AF2ZZ+eHEBO7

On 1/27/24 08:03, Philippe Mathieu-Daudé wrote:
> Mechanical patch produced running the command documented
> in scripts/coccinelle/cpu_env.cocci_template header.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/intc/arm_gicv3_cpuif_common.c |  5 +----
>   target/arm/cpu.c                 | 19 +++++--------------
>   target/arm/debug_helper.c        |  8 ++------
>   target/arm/gdbstub.c             |  6 ++----
>   target/arm/gdbstub64.c           |  6 ++----
>   target/arm/helper.c              |  9 +++------
>   target/arm/hvf/hvf.c             | 12 ++++--------
>   target/arm/kvm.c                 |  3 +--
>   target/arm/ptw.c                 |  3 +--
>   target/arm/tcg/cpu32.c           |  3 +--
>   10 files changed, 22 insertions(+), 52 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
