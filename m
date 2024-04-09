Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1648793ejh;
        Mon, 8 Apr 2024 19:44:00 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUfJ/Wc+mDeEC9/vBSXHuyCimFFU9Lr75MPdH6bvoEOumTIMXmXam/bWmti4ADkZq/qM0+B5RrTzhtNIqtEs8yl4PETQ+Vs
X-Google-Smtp-Source: AGHT+IHzEUet8TxXTdWWlCOZvPdxbEJlTk6Crn1I7JELnTZxGYraoDqK2hMCRuHn+9BOgEwjz5EF
X-Received: by 2002:ac8:7f89:0:b0:434:8563:9fe7 with SMTP id z9-20020ac87f89000000b0043485639fe7mr7101697qtj.38.1712630640003;
        Mon, 08 Apr 2024 19:44:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712630639; cv=pass;
        d=google.com; s=arc-20160816;
        b=whfqc2GY0YZnWrFsre61vdPuUNkpMArgDQN95xT9aUZxEpSh/c6Cyqu77I38w1iBhq
         IYcDjtnWNQ1tgnPpF4aRTbKiwWLCynHlQ9BDRRH5GBgRvV4K3SywAGgT/m3bYbgRnxez
         KkMUp6EDyPwJb37PXBzCov8Gqt/lz0K6J6/mKrAzQsC9ZInunlIqmzAiHKJGzLVGQEHj
         cIB5hKiPE+g1VU1Jgesz+ITQhHWDJnCnf6eNIV3zeeNevDJez1n5SQrBHDD0Ys93ZLdG
         7JrRnfH+VUmpXCLobUGrVwroRXWhdVBTy03W8llE0EuoswFazLdzZWY5iQELtrlQa/f0
         +d8A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=MyyuXgBpprcBYNy2gIXa1GFduEQyPKUGuClL+1I3Pso=;
        fh=TxyirNlvIe0HCRI33E709S7E+4/bwjsuzCeCWfDnEVg=;
        b=HiJ1zK+bkByThRB7Xg0cKdSI+qY/ivw0Pl+bn4Gbax/W8wWeExqJOVexdTjekHJL66
         0JApQUug2a8wTDQ5ypUWwhcAB67dBWWVvsZYHRzX1WKnpfx+o3+iG17IMddHQcy1vAZE
         rV3CJe//Tv48CgNyDLKMlKuPYWcwG4tCTq1H2JY687C42ZWrQocOqEqgLt5ae5ICWp3x
         oAmntvIzCyA5kJyhEs/+lxYn3G+E/s91VyVZc2jvYIOplJmD2hL+5fqUeNCkyQukVjcO
         ZDu7jZMdOqp/PPGHz6i4xHoV9Td782HSQvKbnwR03x8YUb32GGQHDWebu66oJqaUQRdq
         1EVA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f9S8FzN0;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-13957-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-13957-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-13957-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id g9-20020ac85809000000b00434a267b9ccsi222802qtg.596.2024.04.08.19.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 19:43:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-13957-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f9S8FzN0;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-13957-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="kvm+bounces-13957-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1AD61C24317
	for <alex.bennee@linaro.org>; Tue,  9 Apr 2024 02:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2357654794;
	Tue,  9 Apr 2024 02:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f9S8FzN0"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D506954776
	for <kvm@vger.kernel.org>; Tue,  9 Apr 2024 02:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712630633; cv=none; b=YUBu83gWoKq//dOCBlvR97F5Q39582Abb1DBWKpyDY+HN7UtrR6xh9KaPGSiFRPDGARvOP5+ohLmR744irTTQIi+vKbsZl590h2iedWR06epzgFz5tLO72kA9vH7cgmUYjWRbARFlK6IcSZtofF8iyNBRsDUznB2WydWm0g4JI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712630633; c=relaxed/simple;
	bh=ejnjiS/5ARXv1ppwCLX/Cnd3VZxsWw3KGethiMK6g/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eeU/2J/E5dorFx3/PsYwbVWud451KGN9IBxv/3zfWkW5FDI8rJVxpSyLMcGWg/+kMkzwJg9+/1Riwlkbd9YquTqZfTo1bVAXU7pkLmHgy9Rd1VrhkYjBwVcx49A3EOZNkf7hJq5Nkre3OJYLPp+idg5f38djLilddGFUYDuw0JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f9S8FzN0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712630628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MyyuXgBpprcBYNy2gIXa1GFduEQyPKUGuClL+1I3Pso=;
	b=f9S8FzN0cjdZvp73k58oMNxkoZR2C1+L3RAKsY7J3OUWoGSHpC80GBrv0u6G6a7gpUULVM
	8UYrCq/sH5EuTlp86aYS5yxNKDRtzoOGe8yz5YudAYs5tTp806FzxzHoHx+T3VPZHSrbcs
	X0YAkmQx6SgVCG9ABp3WaOsD09eHr3E=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-224-nTNXMdMaNkqsOAXoaDZ09A-1; Mon, 08 Apr 2024 22:43:46 -0400
X-MC-Unique: nTNXMdMaNkqsOAXoaDZ09A-1
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-1e44a3f6011so2601935ad.1
        for <kvm@vger.kernel.org>; Mon, 08 Apr 2024 19:43:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712630625; x=1713235425;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MyyuXgBpprcBYNy2gIXa1GFduEQyPKUGuClL+1I3Pso=;
        b=DwaqtH2eh1Ghv7bsB1mDUdPRXvTxDpZZU9ubdh56ilLagaaiFdEvlw2cQMijGNgsnC
         5t9KNuscEee4Y1dBCfB8C67SIQ4SYBw8aSfhl74Ug+rCpOx8aAVLgunrjFt6CxtfekMl
         MbvnD20QUrb/0b6nniQ/ry6LBiiS4TUlfyDiq9cT+Hh+aRVB5JyK3Ip4db8WUBiDVA/Y
         OmjfVi5EHU1ArxTLNOHfah494QQD2/OinMNcTh1iJVQaf25r6al/tpKLOyA0wKaZsHP/
         QxEiWy/2eysDUpTsXRJntONeigtxxNLNmitBObZNAsRLguYtpjr8paNdjAT7t+lxNxbb
         i2jA==
X-Forwarded-Encrypted: i=1; AJvYcCUzwPLJtEQpRzsXO7owxTC1yCWhz+sZs7jJ2SpY8tv0Dyz0m/b/aADWNBcJfWcrOiErRh0irscJwpW8bDYWTaJyo56C
X-Gm-Message-State: AOJu0YxBLvwb9JuYq0wEU0sMqWAjaa55Y8GQNHaNmUrCzW/GDdsk+1Z4
	NZR4iBEXKuW2rUlymf4r9gZ233kkFE9o8soErT+e/Fs8F5BxU1OMWA6eqKm2EmUe45pHza0/1Bv
	h8wJTJ7twCOBVi926GZy/DPwiOoY4kAjFsi0b1vtiFgKUTqfyOg==
X-Received: by 2002:a17:903:2352:b0:1e0:b5f2:3284 with SMTP id c18-20020a170903235200b001e0b5f23284mr12926306plh.0.1712630625126;
        Mon, 08 Apr 2024 19:43:45 -0700 (PDT)
X-Received: by 2002:a17:903:2352:b0:1e0:b5f2:3284 with SMTP id c18-20020a170903235200b001e0b5f23284mr12926293plh.0.1712630624858;
        Mon, 08 Apr 2024 19:43:44 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id lo4-20020a170903434400b001db3361bc1dsm7753160plb.102.2024.04.08.19.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Apr 2024 19:43:44 -0700 (PDT)
Message-ID: <5b44a2a2-5326-4ca9-a981-08f59d588e7a@redhat.com>
Date: Tue, 9 Apr 2024 10:43:39 +0800
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
Content-Language: en-US
To: Eric Auger <eauger@redhat.com>, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
References: <20240312074849.71475-1-shahuang@redhat.com>
 <901a0623-c93b-4930-9ef5-89adf505929d@redhat.com>
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <901a0623-c93b-4930-9ef5-89adf505929d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: O4b52rb8Bcr6

Hi Eric,

On 3/19/24 23:23, Eric Auger wrote:
>> +        if (kvm_supports_pmu_filter) {
>> +            assert_set_feature_str(qts, "host", "kvm-pmu-filter", "");
>> +            assert_set_feature_str(qts, "host", "kvm-pmu-filter",
>> +                                   "A:0x11-0x11");
>> +            assert_set_feature_str(qts, "host", "kvm-pmu-filter",
>> +                                   "D:0x11-0x11");
>> +            assert_set_feature_str(qts, "host", "kvm-pmu-filter",
>> +                                   "A:0x11-0x11;A:0x12-0x20");
>> +            assert_set_feature_str(qts, "host", "kvm-pmu-filter",
>> +                                   "D:0x11-0x11;A:0x12-0x20;D:0x12-0x15");
> Just to double check this set the filter and checks the filter is
> applied, is that correct?
> I see you set some ranges of events. Are you sure those events are
> supported on host PMU and won't create a failure on setting the PMU filter?

What I test here is that checking if the PMU Filter parser is right 
which I write in the kvm_pmu_filter_set/get function, I don't test any 
KVM side things like if the PMU event is supported by host.

Thanks,
Shaoqin

> 
> Thanks
> 
> Eric

-- 
Shaoqin

