Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1746981ejh;
        Tue, 9 Apr 2024 00:47:40 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUgPOEe/W8rW7QJ5Tr2eZ9JNkmdI3RsNC2rLJBwYZZlUWZzsH8EU9LxS3+u/2jtmUXThRru9Tc1cVIWWWIdlFJPwn/ntYQq
X-Google-Smtp-Source: AGHT+IFxFvS74QXxt/535PoCjqggrarf2+rqktCCvSyYeMuex4+2e/YlysC0hv28Mibo2mRYclwz
X-Received: by 2002:a05:6214:5099:b0:699:263d:23ae with SMTP id kk25-20020a056214509900b00699263d23aemr11926765qvb.10.1712648860695;
        Tue, 09 Apr 2024 00:47:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712648860; cv=pass;
        d=google.com; s=arc-20160816;
        b=R9HziIwxdxQ85UdVwTC6zA6nl/13g2i4pxnsXgTEx5vBMA1E1uQhxiXSIGeIfL2pI1
         aEW723kd/fJutVwbLI7gE8zrxcACIxaFUlLuGuRnoDNTwJ+65pR5oR+aY8eX5qC4xL6g
         S6wv+GS8UVQtuCpVZmdF0KvEgL4rw50S4jCk0068fdNJWb/JLpK/H5ktThttxx6JPj0n
         GjGqGj0psRCRoUS6T+4+Hq855EjsBBIY0xB8tOJLGktAgUSW3tuz/x1QfiDTXyd3oUc3
         mlMiG+6UeY7pJE3aYtBoKilfTNCjDoJ+ordMT4bqA1U6g5UoIxYyDExcFP6FpH9lrtPi
         IVpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=P2vOMs/DIcveirHQQdM7XrMgLSklaYSgQkSBVonMYZA=;
        fh=tiqbv/KR+ZChHc417769TdAGbHM4CY0swKTZ5CuhUnA=;
        b=yafI+09ULCMdkFaFP9I51+aP9mRRBUNaQcRsfY7uYtaSSK5q/o5uMyGoM70+Kc1fnl
         RbWA61gH1T2q1lO8n+VES6LXpOpkhMyo7KlMFtPTDO3usI6tP21ym/Y2fTIlD9wpbtXN
         prvsSO4wgJj2NTVBYi6HRJ4e4I3HwQFwi1qbWysnPRK+o6XLQ8Z2OBbnyh5ft99LkAQF
         bUgamsUsAip53jOnK7il2j30K7+Jq+cb+C+PJZkNVEzAL/Cyc2EG4RhSn1btGMmkvUqq
         g95xh7BF4D6KQQfeBI51weWmFwjsZjdvhPFIb10+3q6QGWKChu4ORS78nhIXaDRQOv8I
         8o7A==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PfmOKUkf;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-13973-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-13973-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-13973-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id z9-20020ad44149000000b0069923db61f7si9810933qvp.349.2024.04.09.00.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 00:47:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-13973-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PfmOKUkf;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-13973-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-13973-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 407861C212C5
	for <alex.bennee@linaro.org>; Tue,  9 Apr 2024 07:47:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D06097CF17;
	Tue,  9 Apr 2024 07:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PfmOKUkf"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D91876413
	for <kvm@vger.kernel.org>; Tue,  9 Apr 2024 07:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712648855; cv=none; b=QFXtGyj0qQ4OSNHA43yiwCjpOTnHpe5D+VL6q/92lKU9WZRuYgMGa4ldjBQ18JQ04ZHavOSaon2t13TZWs7Ui+V0AX8WcRsnhxKLa36tRKOamocJkzAC8Te7GXVaJJt/H5Cbze3A0vB7ktz46lH/aIIDJ4ZDKuRnERBmLOYWEFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712648855; c=relaxed/simple;
	bh=y0Dwj2lXyabUf14cqARhCkVWYffRd/CkPwQh1Fi8qtk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=humwGfxF1mg4D+wKN9Bw3w59qYcAwfvnliCOiZLX2OZEO0PlycDlUUSgBocqwdLKkyWZXIYFr7swae35ijWhrs0qIDgWmGAfsvWjPJ1gGSeh1hZuPTzf5wrgoAO13ZbHlkYQ2Ii6WxyTy5UTTNSqBYiktJE0PT8vZ5da0s/zxAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PfmOKUkf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712648853;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P2vOMs/DIcveirHQQdM7XrMgLSklaYSgQkSBVonMYZA=;
	b=PfmOKUkflCVyhIQqVzBggATw9aq/N7DLiCYHPFSH7fzSzmYjHTnPrY/YsmyJv1pT28Dv2Z
	Dd2Un20Jc4ZiR83ykf4y8o26MAaLLH8CKiYrMNNhk/2ax77AMv1WawkEyfJkH5ly1rZzg0
	zOHW4GDAYCBnrjGdhvqy2vZoROxtwFg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-54-0pvtu5WWNtSE_UNZ7vG9fQ-1; Tue, 09 Apr 2024 03:47:31 -0400
X-MC-Unique: 0pvtu5WWNtSE_UNZ7vG9fQ-1
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2a303938023so1400927a91.0
        for <kvm@vger.kernel.org>; Tue, 09 Apr 2024 00:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712648850; x=1713253650;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2vOMs/DIcveirHQQdM7XrMgLSklaYSgQkSBVonMYZA=;
        b=qlJQGza5n6SgIi5m2mfEP33XsXY1sBJ8OXN5DHY6o0YRxv71sQXxnRViSkebc85gQh
         ICFu1fb8KGZDz5PWwds+BGDg2SDpgp3zXgRZF2aCgC2UdtIoSqDc7HBbp7gA8eGnBcd7
         FLciUUHhxC4RWjjoJvcU7iEKul3pMvNrJtTipQjjW/oMsRzFMWyucAh0SmB3TQuk2a6L
         o7avf73cIsrdQh03LWIXvM1MnAW+OQAmBPaodZiPQu72nuqELlmztawoE9bDfnNFcYt1
         ggAhaLqlWTclF69zngMMupGJgoI4cR3UUi6828mCmsEy84J+YbgnJDU18jog8znggEI0
         Cc7g==
X-Forwarded-Encrypted: i=1; AJvYcCUr/QwYsh5kSeUFERT4VKxQfjrtr7dDuDkDqTP1pLy00ANBgDHw0px0lED2lbmYUEOIp+wH2W0APzOnNIMdvQqZT55a
X-Gm-Message-State: AOJu0YyIfFzChU1iNa/Ht5Ll7j2egXQ+9GOwQxn0n2+t1TFksrmSFmyV
	MGd88fJC4huYseFLOnDvcuhR1T/A67RKNqi+Ri7vvgf7rJ4vWumUr1iI926rV/EthmcIVeti2fD
	zqKbQusBSdPZRinRf740ahcTDAzV8bvhrWblmyYqHDMT5grHh0+9lFaUIEsi5
X-Received: by 2002:a17:90b:4b08:b0:2a5:223c:2975 with SMTP id lx8-20020a17090b4b0800b002a5223c2975mr4212088pjb.3.1712648850034;
        Tue, 09 Apr 2024 00:47:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4b08:b0:2a5:223c:2975 with SMTP id lx8-20020a17090b4b0800b002a5223c2975mr4212074pjb.3.1712648849634;
        Tue, 09 Apr 2024 00:47:29 -0700 (PDT)
Received: from [10.66.61.39] ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id fs22-20020a17090af29600b0029ddac03effsm9393320pjb.11.2024.04.09.00.47.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Apr 2024 00:47:29 -0700 (PDT)
Message-ID: <47e0c03b-0a6f-4a58-8dd7-6f1b85bcf71c@redhat.com>
Date: Tue, 9 Apr 2024 15:47:25 +0800
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] arm/kvm: Enable support for KVM_ARM_VCPU_PMU_V3_FILTER
To: Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Cc: Eric Auger <eauger@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
References: <20240409024940.180107-1-shahuang@redhat.com>
 <d1a76e23-e361-46a9-9baf-6ab51db5d7ba@redhat.com>
Content-Language: en-US
From: Shaoqin Huang <shahuang@redhat.com>
In-Reply-To: <d1a76e23-e361-46a9-9baf-6ab51db5d7ba@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: oZCrAyIb5th6

Hi Thmoas,

On 4/9/24 13:33, Thomas Huth wrote:
>> +        assert_has_feature(qts, "host", "kvm-pmu-filter");
> 
> So you assert here that the feature is available ...
> 
>>           assert_has_feature(qts, "host", "kvm-steal-time");
>>           assert_has_feature(qts, "host", "sve");
>>           resp = do_query_no_props(qts, "host");
>> +        kvm_supports_pmu_filter = resp_get_feature_str(resp, 
>> "kvm-pmu-filter");
>>           kvm_supports_steal_time = resp_get_feature(resp, 
>> "kvm-steal-time");
>>           kvm_supports_sve = resp_get_feature(resp, "sve");
>>           vls = resp_get_sve_vls(resp);
>>           qobject_unref(resp);
>> +        if (kvm_supports_pmu_filter) { >
> ... why do you then need to check for its availability here again?
> I either don't understand this part of the code, or you could drop the 
> kvm_supports_pmu_filter variable and simply always execute the code below.

Thanks for your reviewing. I did so because all other feature like 
"kvm-steal-time" check its availability again. I don't know the original 
reason why they did that. I just followed it.

Do you think we should delete all the checking?

Thanks,
Shaoqin

> 
>   Thomas
> 

-- 
Shaoqin

