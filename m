Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp892940njb;
        Thu, 26 Sep 2024 05:08:15 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVrCVoA6DNWRQeJnRBn0VkeHPjxd/aBQH4LMTAJ/mgxM1dxavemreZ2y/3a5w7hBFp8a73tA1O6OxKigA==@linaro.org
X-Google-Smtp-Source: AGHT+IHPQ4lYhCbFnRQwQkh8yIpw6UcSTLmGjiM2tR8sJ3NNOusOP/JU6XLsmuxqmH5DvScUE0i4
X-Received: by 2002:a17:90a:2dc7:b0:2e0:a957:e8de with SMTP id 98e67ed59e1d1-2e0a957f3ddmr804629a91.0.1727352494934;
        Thu, 26 Sep 2024 05:08:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1727352494; cv=pass;
        d=google.com; s=arc-20240605;
        b=Yk/dUBTNIEFa/KwLPzRLpFGZQJcoljwJUilUG8akwowbQmGA6IhKpVjMBHiGIBd3fr
         p++l1qbHFjFuqbNIYHJ7e7SIlP28XlVDIZFPcirwxKv63REdwEOvKIgjG6t+20mZhqw9
         IW8dWTjXiIxLM55dZdUbnoJiutEYu0aGJOvqzTegXth3+3xJY/YyX5X5ZuPVi+1LHMyu
         MPYkv8joAmtgnKorETfYxMYbs/frxL7t+US1zGjFG94ixQxZL5ThnJDVGYFVHnvBSPY1
         s9GLtZs0B8huK4+VqFCidMkdVnNMllYV30b2dCZDdmXorZRPqsG/RtmM64R3SK6LHBOW
         XjfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=9n8cVuBgdpDL6V0i8NTJGgyWML2Irg+R7WQcKjQpNsQ=;
        fh=xz4FDqw4HoXXpXUzYV3lccYRcF11w/MfLNW6iEmge2M=;
        b=M6zI0cct+fiXtvpENpkrqFUuP5hnBb7iedphc9pPYXKt4ILMG70f+Kt9gv0ssEzMYa
         owhWed55E42I367FqTbFprL/CVsO6kmQ8hYX9iUI+OBafw3P8gaN9kAl2lv9bFvF42Nd
         cfdafYhA+YB8ncm+ZeOGNzVT4uuHVIHHcZSKZg6TzD+1J37mu6iNntt6RONDPcNxf13N
         t4AwIYQasaFyy45zkyyRgE6s7I/yljSD8zBxLyUs6VmhPbzzKWz+otQvIFIx3/z1HcYH
         fY5CgIpuwzEBNR2QjElKHbqZyLAYSs0fDM2yzGq7Cb8uLULRT9hWjavxTSkBxN608dpS
         sLLA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of kvm+bounces-27557-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-27557-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <kvm+bounces-27557-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2e082d9d7a3si2938948a91.162.2024.09.26.05.08.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 05:08:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-27557-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of kvm+bounces-27557-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-27557-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 734C4284782
	for <alex.bennee@linaro.org>; Thu, 26 Sep 2024 12:08:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FC0F1714B3;
	Thu, 26 Sep 2024 12:08:09 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD8214F9FD;
	Thu, 26 Sep 2024 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727352489; cv=none; b=ad+lbAJ1xgRIcosN4AaYc3TP3p8NXaUOlPsAD/Q/6+3a3TEV8zr3wYVJIKK4RueauLsd+ihBOIZ/7/T11IVNS1A85RqWJITK3h3DAMSUhyfaAPKHndt4WAAywMWAz56zBmXPlr0Ezh+O7zrGivmohVGxmFLLobbFYZKa29q3zVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727352489; c=relaxed/simple;
	bh=PO57L/uFfP7LlHOyaDgLFn5H9GT+LWQKvPwHx9D9P/s=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8OevxDCtwChhSZq7wSOwlSNEC2Qcio2PyI3Hipx5Dw/H6/XUVKK5w5284tbZV2oTuCg04Zx8OULY4+aVptO+VQuNmD8wMevQVaXeFqJVyauxJG0h0B7RC/V62m67zvnaFMz1rKbVMOXgXvqoMXLdCA/JkvvIPOAQOqbmsUmvvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDsm93tdkz6J7Y4;
	Thu, 26 Sep 2024 20:07:21 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 946571401F3;
	Thu, 26 Sep 2024 20:07:56 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 26 Sep
 2024 14:07:55 +0200
Date: Thu, 26 Sep 2024 13:07:54 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
Subject: Re: [PATCH 11/15] acpi/ghes: better name GHES memory error function
Message-ID: <20240926130754.000041ab@Huawei.com>
In-Reply-To: <f4c031c627e761b2a48267f1cec1af3a7ad0acbb.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
	<f4c031c627e761b2a48267f1cec1af3a7ad0acbb.1727236561.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: rcRHGDsyWiCU

On Wed, 25 Sep 2024 06:04:16 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The current function used to generate GHES data is specific for
> memory errors. Give a better name for it, as we now have a generic
> function as well.
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
In general fine, but question below on what looks to be an unrelated change.

Jonathan


> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 849e2e21b304..57192285fb96 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2373,7 +2373,8 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>               */
>              if (code == BUS_MCEERR_AR) {
>                  kvm_cpu_synchronize_state(c);
> -                if (!acpi_ghes_record_errors(ACPI_HEST_SRC_ID_SEA, paddr)) {
> +                if (!acpi_ghes_memory_errors(ARM_ACPI_HEST_SRC_ID_SYNC,
The parameter changes seems unconnected to rest of the patch...  Maybe at least
mention it in the patch description.
I can't find the definition of ARM_ACPI_HEST_SRC_ID_SYNC either so where
did that come from?

> +                                             paddr)) {
>                      kvm_inject_arm_sea(c);
>                  } else {
>                      error_report("failed to record the error");

