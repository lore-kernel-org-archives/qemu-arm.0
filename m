Received: by 2002:a17:906:3554:b0:a35:2c0b:b7b4 with SMTP id s20csp81764eja;
        Fri, 26 Jan 2024 20:15:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFhsnL0R+tpyNMX4Bvm/i8SNg7Ko6fx0D+lpCWRPsTwh93q82vjC36apdJ69XQfvTON4pRV
X-Received: by 2002:a05:622a:454:b0:42a:86ad:8827 with SMTP id o20-20020a05622a045400b0042a86ad8827mr1110065qtx.57.1706328912991;
        Fri, 26 Jan 2024 20:15:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706328912; cv=pass;
        d=google.com; s=arc-20160816;
        b=j7xWvjmBCYdXJQDm0/l+aZEy7YyFzmxzr9QwYh5tmTvpjCmC38kPdVJI08n0hWcTUf
         d9pek3zP91u3DTrC0JV/t1cwibV8KQGPUxHIK1hv9i4L9lA4VxbUMJ0Ov8kwFxTRCOeJ
         XhMzSOr2uqTwvW1z22Ce1wTsWKyct4YVmHO8/cSDNzMl0/6Zpl7xEruY9kPNff4KRBvf
         xzdicaFUvGe7kVlPhi94pkX52ZSEEwDCvUJHznYrFN8mVtts7mjrwIOTpqXXJDyncD69
         FTl5Jv5aGKLRYBPG3W2yARZtRN2/BCz3aI5u7hZmwe2EWXsJ7DFIlR+rPlEdsqSIybnj
         L9+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=LZC3aWTJ7Sqf/1Snv1mQ9Qj8KKtrDirAfwaj+zi70og=;
        fh=jgCC7j5AUCXebG8+MtfICLlPUQe73DdErnkUBwEj+vE=;
        b=Vt5T6JRxv4EMX+iea6ssNCGbvZN1RYxKvLTuI3cKfE4+lt25C394wykv7lkGJxpGcA
         hqPLtRBEzeVjd5piTm+BwPs6N/krl0yYiCDdnw6lx+2fWF5V3a/1dReNzupwcRju/I7w
         oLJuOyWERg9JjcFkO4jAMvVYr69TC7vEiqo5b8kspQ+UfntPE855vuqQGZR+HKDY6S3H
         27dcP4nRjWXMYNQwAJserO/Wz0pz5gWYdlxZSyCMeuKNeX2xdsTwAEQP1W/HBoousX0k
         5GHYXR6o4TMqRYt03LyjfnsX3d+MbJJH4RG9FQu7zdFJK8WBX1SII5TUSEGm8lwWl1N0
         R4bw==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gS5urc/6";
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7271-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7271-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-7271-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id h1-20020ac81381000000b0042a87d0d1e3si1335172qtj.298.2024.01.26.20.15.12
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 20:15:12 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7271-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gS5urc/6";
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-7271-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-7271-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E3AC1C21F4D
	for <alex.bennee@linaro.org>; Sat, 27 Jan 2024 04:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B261125A1;
	Sat, 27 Jan 2024 04:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gS5urc/6"
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F35911C86
	for <kvm@vger.kernel.org>; Sat, 27 Jan 2024 04:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706328907; cv=none; b=nXTC1qGUSENS5u9gMssA3Ow6M2R21Ynb3Pm2iCxh9ucSJ5pdMRKSo1NcMBz82he9JmoSd5nCrN2QHfxPQx50I7qs4Z7dXp1xtOrM1Z9zKaFuxOsKWk8XztAPdNq5a+qffPRa5MBUyIFiOA97k8gErl3EQVcUCZ3vtj3xTFnCtZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706328907; c=relaxed/simple;
	bh=IoPfaWg6xb3o/1phA5TpCbzXa/CyJAstSw0Fy6Cq7gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6BXsdgwkJU0GBRXVe7OEdVECC3G0yGNDZC1wa+PR2rZfO8QPEUWLug6jBzd4JKVP1Hi1+uXGVQX5m/iAuCvNLyz96Duoz1gKV7+bpsihIJhMMN0loQELmALFihN+VzrnTXJr3ZDEYnb5OcWU/6iq5su6nua31pWDuFYOUggs6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gS5urc/6; arc=none smtp.client-ip=209.85.210.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-6e117eec348so135049a34.2
        for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 20:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706328905; x=1706933705; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LZC3aWTJ7Sqf/1Snv1mQ9Qj8KKtrDirAfwaj+zi70og=;
        b=gS5urc/628yVjHDoQdcwEN/uZ+qF09luZFPn3/IQJ8C+kTYfamSy3W2L8jsWgUuVvR
         x3rBV7yZR2NGbrFRLR+LaYY3UpMgF7XeBIZP+zpz9EDBagiMiGXUTv0RyHx+EoqruirF
         wxw5hlGPbIoP/o30l/qx3pXDnvydpU/W7mLeHtvv00QmNQ5nPW80ydwomWum6UkzMMg5
         iwaiVxw5GiwIOG8JOc3thtLMJ+V7HDavltrOadAXvZfmw04GKXEHJ4Jh682xdMaDG/ZD
         WEpkZ2QhOO5yJ9R7YG3oVy3c1Ci6bnGugiEPuq+0liVKikV7svbDlLcruc6/Yy4PQ1KA
         Ywhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706328905; x=1706933705;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZC3aWTJ7Sqf/1Snv1mQ9Qj8KKtrDirAfwaj+zi70og=;
        b=MswSN9BVTNVnvGVewRjlB5j98jcyUgvxWS1B5Gn6zp1uJmXhhgA+4xt7bGmsCS7m0+
         uRP3f0mtAs3uW5o5lNCP8bNF823wE6cmRxfHldSEvE3ROzsDAbjiHHNMbhMk4gyuCCey
         o2jvUNWGK+DwDpt0Qbpajmjlzx/X5ZGoFIJnEchIQBfEFbD2v2kYVo2ll2KXcRbwmgz9
         E6okffvgo3CBK0I7mOYbQlc11q7UBMotde61QLafALXO/njeDuKRr+W4hdPHDTYP+klV
         u0zHv7JldTw7iC/2FuVKyjQZjM0+foiEPglPdJUuhAWL51zbHnDOkp0y8XStUNR8orCX
         NMng==
X-Gm-Message-State: AOJu0Yyef60hGW+CunRMt+9kOBzlAi9dYyJt8f0JLP1iOkCsi6BJyYg7
	q+cYF1/rpjzhYUIlDWBMgIP7QR23FxDKV0rcCjwM8jE2ypE9Cq8IV2Y/XvmZUzo=
X-Received: by 2002:a05:6358:ee90:b0:176:7f65:85b1 with SMTP id il16-20020a056358ee9000b001767f6585b1mr983966rwb.45.1706328905140;
        Fri, 26 Jan 2024 20:15:05 -0800 (PST)
Received: from ?IPV6:2001:8003:c96c:3c00:b5dc:ba0f:990f:fb9e? ([2001:8003:c96c:3c00:b5dc:ba0f:990f:fb9e])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902eac600b001d73ac05559sm1649447pld.184.2024.01.26.20.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 20:15:04 -0800 (PST)
Message-ID: <d321e939-a0f5-4bb4-940d-ae6678fa2d8f@linaro.org>
Date: Sat, 27 Jan 2024 14:14:56 +1000
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/23] hw/acpi/cpu: Use CPUState typedef
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Thomas Huth <thuth@redhat.com>,
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
References: <20240126220407.95022-1-philmd@linaro.org>
 <20240126220407.95022-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240126220407.95022-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: yqCA6LwgIuSp

On 1/27/24 08:03, Philippe Mathieu-Daudé wrote:
> QEMU coding style recommend using structure typedefs:
> https://www.qemu.org/docs/master/devel/style.html#typedefs
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/acpi/cpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
