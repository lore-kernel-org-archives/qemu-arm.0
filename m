Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp592682wrs;
        Tue, 12 Mar 2019 08:05:44 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyD29pqaA4uRuRUTErKc5RD9GdfzKTPNAdfkrEgzDKxYRuMqYec4x9ll8o8y/K68p6WtLNA
X-Received: by 2002:a25:408a:: with SMTP id n132mr30985632yba.479.1552403144558;
        Tue, 12 Mar 2019 08:05:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552403144; cv=none;
        d=google.com; s=arc-20160816;
        b=rmccLniVIX4pGXYgV5yR0Yt47Lfha5DZJXuEYRVkbB8cOJjjT+Mcu/wef/X2SK30s8
         FGtIjy5Z7l65v1loE6pg+5SQbUdq8E9diQLbK+Zf23OsCQ6vXLNTNQOWpCaG0GmtNdbV
         WrPYFyFvlOjQpaDpmG7NWQiFjr5tEmliNN/8QAaS2hSDfT1yI/1r57Kt4oc6kiWCX3r7
         ZJ8AYiddPYwpxajOWbwWRDz1LU4Nux2yuawDNK6kvrj2mCVPat7y0hXKdEnWJRCd5dgs
         PHmWwWFDPcXHrkuc5f9pHGAeu99maCVPQlxU/p29xjOlJTtCXuWe7rTeNSv6ybZfYr+d
         J1hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=d6dyFiy5sdTyOAga5zhm+eQQ7xEs1snfe6JlV41bGtQ=;
        b=qLqrTBENSK0TCns5S32aFs4H9/nLDPPDfU0YI/2RSrJpIJEd4Ntaf+50PQ7lCZVSXx
         OHrLP1pTsen0f5zT+V+rTVQv8zeoYOHB2UBV+MC0WG/EuZHM3Eec5tFWxof5zi3IMgHu
         Zh0KnPXGGSmeJOQIvPJvkitj4ni37d11RaId35LUXBqyrmbCj5S/Q0lVpymbJpOKrVWA
         Lx0uujvk6lXal6d72t0N26O/GhJGhF/GIFk3Ru5Q+bkgA/Cdpql+cC6s/E2CNC0efz8j
         F90pxlAPGlQl4e9hSCCMAnSk8QUjA/JLdQCTK7uWzllpNPMaWIioHz4V1zhPwEMTOuEy
         Alug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mEECq9gE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3si4808506ybw.248.2019.03.12.08.05.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 08:05:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mEECq9gE;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54080 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3iyN-0000wz-RJ
	for alex.bennee@linaro.org; Tue, 12 Mar 2019 11:05:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49307)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h3iv6-0007Ju-8I
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 11:02:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1h3iuz-0001th-9D
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 11:02:20 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:44383)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1h3iuz-0001tM-1C
	for qemu-devel@nongnu.org; Tue, 12 Mar 2019 11:02:13 -0400
Received: by mail-pg1-x544.google.com with SMTP id h34so2015978pgh.11
	for <qemu-devel@nongnu.org>; Tue, 12 Mar 2019 08:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=d6dyFiy5sdTyOAga5zhm+eQQ7xEs1snfe6JlV41bGtQ=;
	b=mEECq9gEHrfOJLYj30dF/oL+eH92Trj13lzfqBFppk/9nZFvSEffTjDQuRFBLEjLFS
	tbXHlwJG5TPxBj2twmd9Lcds9o0KmrGBYMy70Ep6drJGTqFgDQE2xb4F6XdG0IZu1XYu
	rJRZYTVJzFxeQud2TRQpA39zStKvEt+7YuDC8KTwthbn7oLF0I2f6dSzp85zutT1xy/I
	1buxpJVmz8aRmucAbYgmiYRpS0ZVjEZUu3eGL5fJfn5e6OGDtIXsTJuuE2SAiGjUHx1z
	xbKDrcwFkLXOfqvPT0i3DyckuIEDxxhU94gR9kBMaKGPyeBA1L4n3QJXqQ7Jkp1TPgib
	OAgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=d6dyFiy5sdTyOAga5zhm+eQQ7xEs1snfe6JlV41bGtQ=;
	b=R9DNShOboVJSkLhpuRb9nUvEm0zFq36LNeCr95ffZsoTEyl60DBILNs1/gHHVe+QmP
	doY0OaxDFXVUwjmlH5qKjjuLaSsRi1gGow/1rE+GXUPzOFzaIFKTOF9fWID+Zotm0fb2
	fsqGZytDRb/+NtKl5it2XRx950yQIrXo31CigeyfogUKANNfZ0oufUNjERm/eTJrbxwe
	4QOeeOCgNnYib8ntZ8Wu6lxvDmdmUlR71rjcE4B4e7FKkwVcCfImVpeJ3GinIQSp0Obm
	EEh23vuCgkfKRyxy2mFDoIow3hmundoS7pYk6+A8OjQDu3mviEBYmsK+g7HnqjYkDyIc
	wMFg==
X-Gm-Message-State: APjAAAWtpMFYy1woLEoGd2Lm43EovjdaIMQtTKc2ojFPp4OwcaexX2zA
	rPqkgEemmb6MKFhYgbA2cYfO1WlWPvE=
X-Received: by 2002:a63:4718:: with SMTP id u24mr35951444pga.381.1552402930720;
	Tue, 12 Mar 2019 08:02:10 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	l12sm11374222pgk.40.2019.03.12.08.02.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Mar 2019 08:02:10 -0700 (PDT)
To: gengdongjiu <gengdongjiu@huawei.com>, peter.maydell@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <1552386624-10484-1-git-send-email-gengdongjiu@huawei.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <6c900280-54fd-9e91-8cf3-240de0e4eb0f@linaro.org>
Date: Tue, 12 Mar 2019 08:02:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <1552386624-10484-1-git-send-email-gengdongjiu@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::544
Subject: Re: [Qemu-devel] [PATCH V2] target/arm: change arch timer registers
 access permission
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Nxd3idgWxIh/

On 3/12/19 3:30 AM, gengdongjiu wrote:
> From: Dongjiu Geng <gengdongjiu@huawei.com>
> 
> Some generic arch timer registers are Config-RW in the EL0,
> which means the EL0 exception level can have write permission
> if it is appropriately configured.
> 
> When VM access registers, it firstly checks whether they have RW
> permission, then check whether it is appropriately configured.
> If they are defined to Ready only in EL0, even though they have been
> appropriately configured, they still do not have write permission.
> So need to add the write permission according to ARMV8 spec when
> define it.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
> When VM kernel or Hypervisor configures the timer registers to RW in EL0
> user space, it will still have below panic when EL0 user space access
> the timer registers.
> 
> [INFO ]@(el0_sync:60): UNIMPLEMENTED, esr=2000000
> [INFO ]@(unimpl_exception:88): KERNEL UNIMPLEMENTED EXCEPTION
> [INFO ]@(unimpl_exception:98): FAR=0000000000000000, ESR=02000000 (EC=0x0, IL=0x1, ISS=0x0)
> [INFO ]@(dump_registers:64): KERNEL REGISTERS
> [INFO ]@(dump_registers:68): X0=00000000f52b7d50 X1=00000000040d5040
> [INFO ]@(dump_registers:68): X2=0000004000033e10 X3=0000000000000000
> [INFO ]@(dump_registers:68): X4=000000007fffffff X5=0000000000000020
> [INFO ]@(dump_registers:68): X6=0000000000000020 X7=000000000c00b030
> ---
>  target/arm/helper.c | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
