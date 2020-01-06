Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp22896300lff;
        Sun, 5 Jan 2020 18:45:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxfQ83VuwF1H77sS2nfXPJCiQ3HwfGTDS5zwS7jB6QZ5IEs7ORUItWRc0kYXjBYUbD9CJsK
X-Received: by 2002:a9d:2264:: with SMTP id o91mr114912949ota.328.1578278759782;
        Sun, 05 Jan 2020 18:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578278759; cv=none;
        d=google.com; s=arc-20160816;
        b=H7Xe5febq15vWsREyS7r0OQhX65aRKmcfURqqz6fLSZaCU2Q4KmgkH7195OGrkGIMa
         ufE3DqV7WaUECYSiFezXNpWhVGS2hoW+fBkrYBfUOrQxfRgCAgW68ya/s22QOSjg2CmH
         220ynAUpqkh1KlSW7FB5xFRuDFT9JnQlMj5xlcd9+m9eYfkMb+2FPB7/ni4fukQKF7q8
         nGCKv4nJ4WJw+CsywOVc/cOUEfReEcXA98fo2rQ5gD/kOlaZ+YRKnJAcbzzL8zD90VeM
         JhXqP90nJ0f8ID2pzP4q9HlMv5z3ATbnGLwuOBs+lVBZVAUSkEGU3ZTTYQCD7JQh+ljX
         t/OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=qax5nmvAmlQixQuWGKpQcfY3QvYaacxL+7LMz4OFCqU=;
        b=gwAqmLpWX2Y/RcqVFUy6YvXoiULMvqU4PLGbrKzrd+lIC/VhDdpqmsG8jkwF6Vgr7Q
         zn/70X+xD5iUFkF8l3aO0/uf30Mi1BxUWRpyWJ9JojaXCm3laRDDSQLf0e+qNeU7iv7G
         IrulVfZhsBGqBlie8rjSkUKkHV4W1W4Ksc1Mz4Nq3b5opzJXlDUf1moNPt8dkn8zlyH4
         GpI2tXs530ihfyrZlS/i0hVpxhjvyFQYBYvavvWEEd8OTvZicMymzdhIwl/FCqpNITkF
         wBzIhOhE4XfEOcp5m4AChnu0XuAdBx+O5PH8kKVuJZSbeQuie/3ZibcSKAz8Fz+4YnpX
         EzvQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y65si33570318oia.162.2020.01.05.18.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 05 Jan 2020 18:45:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:47370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ioIP0-0001TM-U4
	for alex.bennee@linaro.org; Sun, 05 Jan 2020 21:45:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49223)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ioIOt-0001TF-N0
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 21:45:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ioIOs-0005MV-D4
 for qemu-arm@nongnu.org; Sun, 05 Jan 2020 21:45:51 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2228 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ioIOs-0005KF-2d; Sun, 05 Jan 2020 21:45:50 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 72904C0902ADA7E3453A;
 Mon,  6 Jan 2020 10:45:44 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 Jan 2020
 10:45:34 +0800
Subject: Re: [PATCH] arm/translate-a64: fix uninitialized variable warning
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>
References: <20200106015700.52992-1-pannengyuan@huawei.com>
 <69ee9eb1-84bf-5bcc-738c-c75dd520cbf2@linaro.org>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <4dfe7a32-80f7-bd57-edc0-3105e8f08dce@huawei.com>
Date: Mon, 6 Jan 2020 10:45:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <69ee9eb1-84bf-5bcc-738c-c75dd520cbf2@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Euler Robot <euler.robot@huawei.com>,
 qemu-arm@nongnu.org, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PP0oZAeS07L6



On 1/6/2020 10:15 AM, Richard Henderson wrote:
> On 1/6/20 11:57 AM, pannengyuan@huawei.com wrote:
>> From: Pan Nengyuan <pannengyuan@huawei.com>
>>
>> Fixes:
>> target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
>> target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>     genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>     if (!feature) {
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org> 
> 
> Are you compiling with reduced optimization?  The compiler should be able to
> prove that these variables are initialized.  It certainly does with -O2, on all
> known gcc versions.

Yes, I compile it with optimization flags (-O2) and get this warnings. The gcc version is 8.2.1.

> 
> Perhaps a better fix is to add a
> 
>     default:
>         g_assert_not_reached();
> 
> entry to the o == 0 switch.  Though of course opcode must be in [0-3], based on
> the extraction mask, so a default label isn't actually reachable.  But that's
> the only path I can see for which incomplete optimization would fail to prove
> initializatio
Yes, a default label is a better way.

> 
> r~
> 
