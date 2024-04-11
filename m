Received: by 2002:a17:906:4a51:b0:a52:fc6:5c40 with SMTP id a17csp199136ejv;
        Thu, 11 Apr 2024 14:46:22 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCX2SwKLByQ/62V69Wct3cHPtJ81NXCTASXA08DqX1pI+91FKTgpahkDrygG69Ua36F0Q1jBen4dbHmMkfN0uuMfwkYeTuNx
X-Google-Smtp-Source: AGHT+IH/KG7G3nJO+rODUBvufBEoSHtrJFN7Y+yRDQaXtE5voNLUcCxde4tz5PbOMozRqz9RlWYY
X-Received: by 2002:a05:6870:a188:b0:220:c604:8df with SMTP id a8-20020a056870a18800b00220c60408dfmr739738oaf.37.1712871982269;
        Thu, 11 Apr 2024 14:46:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712871981; cv=pass;
        d=google.com; s=arc-20160816;
        b=F0difoxwgFQOAGOslsOhPPiD8wQwp/sWrhMuF9GidGldjkZHLZ5UlV3Uf6X3XOHmB6
         sdqzx0YQwMvuQBplgvZHdnPcFog0CVATW9HO5E3pPqAYtbTKYhGUC2NHR1LIX9OoEgN2
         BveDJ3ext2UYcxw53UQomCfm1f859W42tLmY4r3f98ICVwaNOh1KQ1nxcN4WbN3IS+qS
         ZAbbAvOPwn3yCqnirpKH9R+Vz91eEpZaNhsaG8/zlfC0wdG40h0YMGm57MyY8PRxLusA
         ypPKVtYr6OQuNeTvC4d+joEo6hC2tsVWFs9TV3XPHGpT+Yt2VI0H182fvd9Lar/wvb2Y
         XPgQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:date:message-id:dkim-signature;
        bh=vpxrA8cRe/B7k0FRnDEX/5CDR+EgATsgI9uZLnSVd4c=;
        fh=+lUegUPRmK5VuGXrXaPnSfWljV0MAiQMJpsg6K8CL9w=;
        b=gXAYzw5s+ywaTO3/6sOO/SrKuNI8f8DNX9j+qA0DSpPh6eTZ4e17VpIcGzUMi1ZyzU
         qXmRPVIqzYqBdQs7+Id6FDxMAUeMpJqZGMdFi/wLMDVtwzZKPJ0jEFmtV5Ljk0sVQQxf
         5gqgJhfOD9e+zYQ4IjL6ip7QB7YNCksgSXVSS3+qfpUkvIaGVnCZ3tDHP6DPHo2leAcQ
         AZeUk1DZJB6mBKI4pnrMBUZ8Y/I4uIKyAKDyfHiZdbYvb0SdwxKbLLePnQZzRmTyI4Uc
         ikVI0A4o494QS3WHZluCLltQBS9V7wmywFuc6M78GFu1Oa29PRZWJWic9fTp+olI5mJj
         WWxw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BPRvJ5Di;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14345-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-14345-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <kvm+bounces-14345-alex.bennee=linaro.org@vger.kernel.org>
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org. [2604:1380:40f1:3f00::1])
        by mx.google.com with ESMTPS id 28-20020a63145c000000b005f3ffb0d2d1si1900842pgu.379.2024.04.11.14.46.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 14:46:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-14345-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) client-ip=2604:1380:40f1:3f00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BPRvJ5Di;
       arc=pass (i=1 spf=pass spfdomain=linaro.org dkim=pass dkdomain=linaro.org dmarc=pass fromdomain=linaro.org);
       spf=pass (google.com: domain of kvm+bounces-14345-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:40f1:3f00::1 as permitted sender) smtp.mailfrom="kvm+bounces-14345-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA4B0B21927
	for <alex.bennee@linaro.org>; Thu, 11 Apr 2024 21:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85BAD36B08;
	Thu, 11 Apr 2024 21:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BPRvJ5Di"
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED55B2942A
	for <kvm@vger.kernel.org>; Thu, 11 Apr 2024 21:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712871975; cv=none; b=K3cbSXQxd/wBpFamWwz7fDqG3ZsMKU0d9Sauda4JthzIiO9jiefTyvPTgt5HewK6KEYRCkXLlQ6mBTzEFp9zjaImhkKYiqX0Mvp3s3AqJwtr86cxwDDSVzxb13MpMfM4RNTOVfo5uxTAb+cWDumlH1HtTVOmniPZ3A7BxX4a0ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712871975; c=relaxed/simple;
	bh=mLgWdom7jqFTB7wVymJ2zo5UWWDyQWbpF/ASIrQHiD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FpvWZx0gpJY3ZU5XLmbXxZEKc+0bI/r0AMDm2A88S8SyJPnIaA7lWWlXXglKmEnsJVpW3OPyUQxKOgw4Uq+mGgwklOqxh/niy4+HgGcDJYHFHu8W31Z8+ldDpofxhWePI0quYvJHS+FQ7LKiPmMWH+bVC6OVWjXO+8nV/q0fddE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BPRvJ5Di; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-6eddff25e4eso301912b3a.3
        for <kvm@vger.kernel.org>; Thu, 11 Apr 2024 14:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712871973; x=1713476773; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vpxrA8cRe/B7k0FRnDEX/5CDR+EgATsgI9uZLnSVd4c=;
        b=BPRvJ5Did7fjjtKF0MTQe2hsOgwDPDgIbiGvJRH9UX+/MEUOspZh9n1Ao5brVnemho
         gAxRwKpqCN7ADV+aP/EdjbTWlVGhYit02CbERABDrpfGrzH1JH90nSvSOkIftaRuHPlz
         7e4P1PgLOH9V2VoDclN6wgN8yY2t7DvUZIyJqW5xgnhwWEa5QcbgfOmwiJyIm4ElEOgE
         FOF678twN+PUylFiiLOMVyi9PJgdYYw5Ta7RPKa6TQcoVIv4pkBxPk6sR1c4fK1jnCRz
         tKy6fn4rk00f1y+tAfsEZ8vZg1Ju7/7T3pFe7oEQlOOWQVwyAGvAaM9C7KBnUEtneNPb
         ckmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712871973; x=1713476773;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vpxrA8cRe/B7k0FRnDEX/5CDR+EgATsgI9uZLnSVd4c=;
        b=btwllSX78AaidkGh0+CCzZ6DFLGa0iQHd+N2TPjJwfwPvpkDKWgu7ybytjGMTgxmcv
         vqRLaSfgOGW3U/INRIx3h5F8d6Mdltyz11qCUYc1kMV0XS5sNJh4DG2GPk7LwR1zmdl4
         bYYaS0OFu/G6V9KZavh4xt61RqFSUt8v5iyy1nzAzD0z84fLPa6AwEkeOjLD8ll89G3E
         7JfW484rI6cJVLYTfbYb5B4/K1U5hRRTgln99evuUVcf0FklT8jO/oSmTo7lgmLm288w
         XU3H/ttcK2RLtEiaZoIko3n80Q7Wg5ZH50meYwtpuaHwiPEWe48xAC3XR4sWXTpsSeUu
         HJZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDwM6Lz0x7mEZrZWVFD3ytzTchhDeExTCZ8QcPDcBZGp0KLn1Fp9X+8HS5HEoAJGFDZzvvzMpecs7whWRqlqk3XW6B
X-Gm-Message-State: AOJu0Yy00xqUIslpoZ/BlRE0kpf/Q4eS1hkzV2hY4QCWJNG3gSnsUNXr
	vje9iX27s6yDumggKmqkuQHzxgeZKzrAu0sOr/ucVcOs5gAotNWT4tt8HoVYIXo=
X-Received: by 2002:a05:6a00:1915:b0:6e8:f708:4b09 with SMTP id y21-20020a056a00191500b006e8f7084b09mr1103194pfi.15.1712871973271;
        Thu, 11 Apr 2024 14:46:13 -0700 (PDT)
Received: from [192.168.0.4] (174-21-72-5.tukw.qwest.net. [174.21.72.5])
        by smtp.gmail.com with ESMTPSA id e24-20020a62aa18000000b006eadfbdcc13sm1631776pff.67.2024.04.11.14.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 14:46:12 -0700 (PDT)
Message-ID: <5245b4a6-7246-456d-8be0-91fef19b8367@linaro.org>
Date: Thu, 11 Apr 2024 14:46:11 -0700
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] target/i386: Replace sprintf() by snprintf()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org
References: <20240411104340.6617-1-philmd@linaro.org>
 <20240411104340.6617-10-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240411104340.6617-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3//ZJwOiRvL+

On 4/11/24 03:43, Philippe Mathieu-Daudé wrote:
> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
> resulting in painful developper experience. Use snprintf() instead.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/i386/kvm/kvm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
> index e68cbe9293..a46d1426bf 100644
> --- a/target/i386/kvm/kvm.c
> +++ b/target/i386/kvm/kvm.c
> @@ -5335,7 +5335,8 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>       case KVM_EXIT_NOTIFY:
>           ctx_invalid = !!(run->notify.flags & KVM_NOTIFY_CONTEXT_INVALID);
>           state = KVM_STATE(current_accel());
> -        sprintf(str, "Encounter a notify exit with %svalid context in"
> +        snprintf(str, sizeof(str),
> +                     "Encounter a notify exit with %svalid context in"
>                        " guest. There can be possible misbehaves in guest."
>                        " Please have a look.", ctx_invalid ? "in" : "");
>           if (ctx_invalid ||

In the larger context,

>         if (ctx_invalid ||
>             state->notify_vmexit == NOTIFY_VMEXIT_OPTION_INTERNAL_ERROR) {
>             warn_report("KVM internal error: %s", str);
>             ret = -1;
>         } else {
>             warn_report_once("KVM: %s", str);
>             ret = 0;
>         }

so there's really no need to sprintf into a buffer at all -- just pass it all to 
warn_report_*.

The English text could use some improvement as well.  :-)


r~
