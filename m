Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3358838lfg;
        Wed, 26 Feb 2020 09:48:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqwjyYxDuvte2l+DA+WaZfBgKSy9GGTpO+IX4Rjy6E/C07L+utsGG8Tl87NAMw94BsFmovJ8
X-Received: by 2002:ac8:3978:: with SMTP id t53mr4786709qtb.367.1582739286363;
        Wed, 26 Feb 2020 09:48:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582739286; cv=none;
        d=google.com; s=arc-20160816;
        b=h/CdmSfrLlXZF+lDA0WQbN6cOxiMRz1VcOzmN80qaoypjr3j931hm9jE1l1LMb7BIa
         XS/K3JvI0zFlIvddILk3ZkXwofDGs7mGj6IIIpPoJKrY13wglnY/FZqcwmDQyfYGNoyK
         c5pZCGy6xWCMzaNW6+1vOvsigDFFqnPF8yv4HPbpgowYqIziPKWP83SGnpjsqfRr8cJb
         KH+8FgBdM7NyrCUf6GauFwx8Gq7TplTf3Wery0rlR6V81wbNwwHaBXi9xxT2gpluTLZ8
         8gnshoAEDidWEm+vmdpF8H39zM11P1FVKfHsij/6S0UZMzffoZHKE8WH9RBWnweWrMsD
         Yelg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=L6rqBdkrTv6+OD3BXdG4o0FUEG/yy1/W+m/baiqwrU8=;
        b=OvGU5q3iwfKM7PB3lgPFGVZruWBCIyT/Kaytl19yCZoUPDsB7Bdvqb6IYfkPjm1ZPQ
         Q1W3AadDU03DRMmU2tK0Fi4mnyUkQMYVfBqTmVGQ/VFM9ZNfYWB38wplgCCgx22+QuUv
         cwk3ImlDERINthuFX6JqGdwMOZSFpzlX4ybRhSyWqTBnUXePOb9x4QjGCTaYhXps7iXe
         /8+UEXoVtDKBWAgqUFSRIu8SATxx96YVhvGH1cuAY8k2CqXxcRCsSSTtP2YGuV0u7+0/
         LcNWswWLhMGke8W4WJFNVMFw8x3RtF70vrvUrSoYc6ofPSeT9LRE4yfU9TRZ8wrZtTnY
         B+eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G2dKmvGq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fe15si1146729qvb.89.2020.02.26.09.48.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2020 09:48:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=G2dKmvGq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j70mz-0003vw-RG
	for alex.bennee@linaro.org; Wed, 26 Feb 2020 12:48:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57525)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1j70mn-0003tg-CU
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:47:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1j70mm-00029y-8U
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:47:53 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:29706
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1j70mm-000293-40
 for qemu-arm@nongnu.org; Wed, 26 Feb 2020 12:47:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582739271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6rqBdkrTv6+OD3BXdG4o0FUEG/yy1/W+m/baiqwrU8=;
 b=G2dKmvGqzrFTY3GCaV2g4hiJlTUBWLmMm1Wvsmf9bNCTfTj39BMJkQH1PAJHOtRLrziEXD
 FbedxFKZn/suf3rVD9UTe7TIMCtwEjuZW/x3uKed3RCk5hCZskaANZEzrK2763Ab06P4FM
 LLhTd25taKeonXrKWFT2vRyIkCb0t0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-BjXvljPRPZynpH8qw6zbbA-1; Wed, 26 Feb 2020 12:47:50 -0500
X-MC-Unique: BjXvljPRPZynpH8qw6zbbA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EC683800D48;
 Wed, 26 Feb 2020 17:47:48 +0000 (UTC)
Received: from [10.36.116.59] (ovpn-116-59.ams2.redhat.com [10.36.116.59])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0842F60BE2;
 Wed, 26 Feb 2020 17:47:41 +0000 (UTC)
Subject: Re: [PATCH v3 00/10] vTPM for aarch64
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org
References: <20200226102549.12158-1-eric.auger@redhat.com>
 <31e81f4b-ef00-692e-540f-ef3d9be5bb9a@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <22380cd3-b13e-aede-a7f5-158d86ca6136@redhat.com>
Date: Wed, 26 Feb 2020 18:47:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <31e81f4b-ef00-692e-540f-ef3d9be5bb9a@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: marcandre.lureau@redhat.com, lersek@redhat.com, ardb@kernel.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EIB5i8YWbS8A

Hi Stefan,

On 2/26/20 2:32 PM, Stefan Berger wrote:
> On 2/26/20 5:25 AM, Eric Auger wrote:
>> This series adds the capability to instantiate an MMIO TPM TIS
>> in ARM virt. It is candidate to qemu 5.0.
> 
> Looks good. Can you run the checkpatch script over the patches and
> address the warnings?
> 
> 
Thank you for you review!

About warnings

- There are warnings due to new files added but I think they all have an
entry in MAINTAINERS as wildcards are used.

- In tpm: Add the SysBus TPM TIS device.
  There is line over 80 chars but I think it is fine

#define TPM_TIS_SYSBUS(obj) OBJECT_CHECK(TPMStateSysBus, (obj),
TYPE_TPM_TIS_SYSBUS)

- test: tpm-tis: Get prepared to share tests between ISA and sysbus devices
has lots of warnings due to old comment style being used in
tests/qtest/tpm-tis-test.c. I did not fix the style issue because I just
copy the code into tpm-tis-util.c

Do you want me to fix them in the same patch, in a separate patch or
ignore the style issue for now?

Thanks

Eric

