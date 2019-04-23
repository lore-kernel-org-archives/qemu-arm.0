Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3911194wrx;
        Tue, 23 Apr 2019 13:59:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwL3Kt4CUK1CreKHofS4MPqODTI45rREkUF4u9Z+GC6w9hvOvIou/2RAY73A5OIIA3dKc+4
X-Received: by 2002:a5d:6249:: with SMTP id m9mr10292188wrv.255.1556053154956;
        Tue, 23 Apr 2019 13:59:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556053154; cv=none;
        d=google.com; s=arc-20160816;
        b=pm4jasgeKL8c+2qMJ7c0Q5t90/eSrk6PQjlb0DNFytPIM8wIdmWeNC5PQHTF/aUGdx
         iWdly+cogF22PXrwUlf3D5n+JN7VUswjfw+e8bh2w4ZKXBbU+UFUmIK9Azzif3DcTckK
         0LmQhgKz7AyNtX5GgxAeKEktPSsJKmhmKhGmZp8gW6At59OQX13dITDCvv/wqi0YSXrt
         DloAGJbCCSQK7RJaEizFtVZ1m5Quh/2pLj+3bgsWq2B/k5YalL2GrODQzGwZ44nrSOvN
         NvgKvTGClLsM6RObHIE7UnifVl6eizuSy6s7NmJNoTvzVQA7zMlVNcVNzuvG42CV9JKe
         xzBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=stUvOROvbgPFVjRNiSu0eagtnmxdLN05cmHxeFf/RCY=;
        b=hkz9luK62IBgg6hSWNg3sou9ibgvu7GfteqSenkQ0ODbXOkTGoVJMqWAZcP39b7ZCE
         LIYjHoKEIyUADDwNoYFxOygQeFLST7Yy3LU+vhFSSs54vqMYx4Cx0zenZdf2bkn/Yd7P
         plEcXerlmMTi+FAqnbSJ4V88JI93K0fiv2EF+z2D8dJUXxT6/a4CwRS5zIyRHCrNBkcJ
         gjws92/VIGsIMdktiAb2I5ILX9CiS9Dghm0+OXbHhoVZaAh4ghzjausuEvZgsDs2qnNx
         sA8i3IlvQqXi4sKOd6Q2CApE1JzXfo/9CW2Dr2fZ2OYYHnOllzoKiVLoBYn7oIk0XioP
         GRTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NX1KqeMT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 88si12371228wra.283.2019.04.23.13.59.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Apr 2019 13:59:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NX1KqeMT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:59407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hJ2VW-0005Ae-1q
	for alex.bennee@linaro.org; Tue, 23 Apr 2019 16:59:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57616)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ2VH-0005AJ-Jo
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 16:59:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hJ2VG-0002BO-Lo
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 16:58:59 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:35646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hJ2VE-00029q-Np
	for qemu-arm@nongnu.org; Tue, 23 Apr 2019 16:58:58 -0400
Received: by mail-pf1-x442.google.com with SMTP id t21so8108813pfh.2
	for <qemu-arm@nongnu.org>; Tue, 23 Apr 2019 13:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=stUvOROvbgPFVjRNiSu0eagtnmxdLN05cmHxeFf/RCY=;
	b=NX1KqeMT3sR0YKw36fdHitbC/HsyjBfWgE+jcJESisOm32jzxJMc9KOyrv9Lvi6eOg
	lRscuLVqtFb0hkfIda971F9F9foByLkvFO71gsDF3igimWI9I/pdbAp5+0ymjEG+GZJs
	mC/tbhr3nAYLwVu4LfBLdE//8uO7gDaudkZplcA01a0+Z5fGNomyhfvua/EtypLuQ1cf
	qEyaq2KpTBNjjBdu5i+6uST3wFOWZ0jWcIATgbuTqMdNWTWxndnS4CfyhWXcd7A5p0A9
	SD3b+K8RBhdzs7iMtK+YQv/yqvbnqwDCYCc5vW8ADTRwrx9yuGqKVyQiExQ85iqLXTuy
	wGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=stUvOROvbgPFVjRNiSu0eagtnmxdLN05cmHxeFf/RCY=;
	b=Rjt+gWrhjEW0nVxCymzFwmvd4xRU2+rf5cN++tbM+Og1mWBZUsCcuztCDFa4FwoRP5
	ScNFhenzDlouhFzW8FPqQf0+17MIM79Qn9a+Qkb1YzjGBwWRYF9AQKbtVU3Y9/gAOy4d
	vwV/pqdSmmTL2+Odc5YZ0XLuQJO0Ec/p7LSMr6POy+ayy3IWypstCgoWyLPS6VMEsAvb
	0+kvNAC6GjbIl2Vs87tFkJUjnAfK1bP+t1lBKArKoKc1yDVz6oh6kusWPx5vO9Gud25x
	ym4vDrhlb1UlkMhcmDdsvLID0lvJ26OG1jDHWfl2FYfb6ikBbKfeolbehKCyZsAwxtqj
	33Yg==
X-Gm-Message-State: APjAAAWPezC4iaR5aeLH5TFvk6Qi5jBfnZO+WZg/WHLV8DRyHpztFe/6
	fbnECtAc4Zz8d2MXyuMHJzPdzg==
X-Received: by 2002:a63:5d44:: with SMTP id o4mr26688689pgm.15.1556053135056; 
	Tue, 23 Apr 2019 13:58:55 -0700 (PDT)
Received: from [192.168.1.11] (97-113-179-147.tukw.qwest.net. [97.113.179.147])
	by smtp.gmail.com with ESMTPSA id
	c3sm29548001pfg.88.2019.04.23.13.58.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 13:58:54 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20190416125744.27770-1-peter.maydell@linaro.org>
	<20190416125744.27770-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6f380f5c-f65b-49ba-7af8-f1c84b2fba7e@linaro.org>
Date: Tue, 23 Apr 2019 13:58:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190416125744.27770-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 07/26] target/arm: Clear
 CONTROL_S.SFPA in SG insn if FPU present
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iCwpYxUzsD56

On 4/16/19 5:57 AM, Peter Maydell wrote:
> If the floating point extension is present, then the SG instruction
> must clear the CONTROL_S.SFPA bit. Implement this.
> 
> (On a no-FPU system the bit will always be zero, so we don't need
> to make the clearing of the bit conditional on ARM_FEATURE_VFP.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/helper.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

