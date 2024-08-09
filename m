Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp775677njc;
        Fri, 9 Aug 2024 00:11:16 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVRBQyAvl6TNX+kNPFPqmrOGxgZhMQfjv9mpVIUCnDUkNzavAe+yl86DI9IwkzlWVur9U84paafpaxV0xwbeBFG6Moyn0J6
X-Google-Smtp-Source: AGHT+IF1gAc+D/WaG23k36oz9Uvp1xAdm7Pz8ZWLttZgb65i+B07twkUDraUu2P36i5JZXpniDMx
X-Received: by 2002:a05:620a:440f:b0:79c:fbf:6381 with SMTP id af79cd13be357-7a4c1869570mr60226885a.70.1723187476097;
        Fri, 09 Aug 2024 00:11:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723187476; cv=pass;
        d=google.com; s=arc-20160816;
        b=kOoC69dEhazFsVuE2m/9PQeWEf9PAyRm32H1yKhsrsDccOiEwgHILZPJTDl/PBqpDL
         s+Q1kXM2g2/+w0CJw0j6k0BwpQhViRBRegGUvyKAv+WAhkaWAmjoDMMKIizi174IF2qz
         whMraTMgWj0VAX2vlNfeE9nNy+Ld21rNM5IafxXlJwajyCY5kPj/3og+iPcThBwUAQ7+
         SeLY3jGihzS5Clx6OX4ifRvSwxvA2Hki1X2RDi2wPn/cgPB53gh1OD4lwKdlBJpqpK7a
         Q/EnKs5obNJjM2Rn9m9XqF6Ex0g+YosXON3snFT1+CvsmD3wd6Dau09msu8Js0jnAPn5
         rGhw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:list-unsubscribe:list-subscribe:list-id:precedence
         :user-agent:message-id:date:references:in-reply-to:subject:cc:to
         :from:dkim-signature;
        bh=55FiknPVOjMgPerwYdzxQyFRVU6c8E5y8pIIfmOhXag=;
        fh=SsQ7b33/JqL3KcIvZVu1cGzlitW+R78QMpVcelChigg=;
        b=bZhVF6g4KfvtigCePy8VGdOGAWFyyy8X+n/QGSIRg3Q4ZrzpuAS3ef6SjdfBG1d7mn
         uZCf7/ehE2ej2e/qIBy27I4U0H7Mkct9KYYw5WYudaBQDMa/FxqkGHBAQ4SbEFnpQQZt
         w1YB4UJAhEcz6vbO8NDTLselVe84ZQp19vy1X/OQ5Is53w9OYeq8usZO2xmAx3HUV8jt
         tolz9JsE9L5HbL+LjqYhLWwmDM44KSLW8F3G625/5n7HMXfqF9V3De3Uhs1Z3wl23G7D
         +amic/8Bfe4JiHaXUmeIEmlDBvORLoIOXILiLueRv5MrMZHCWKNmnFqH7qmJ1cPHWJyy
         gHAw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cmz2BC/8";
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-23678-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-23678-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-23678-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id af79cd13be357-7a3785f933csi608755585a.1.2024.08.09.00.11.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Aug 2024 00:11:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm+bounces-23678-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="cmz2BC/8";
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-23678-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="kvm+bounces-23678-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA07B1C221D0
	for <alex.bennee@linaro.org>; Fri,  9 Aug 2024 07:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D9D16DC2D;
	Fri,  9 Aug 2024 07:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cmz2BC/8"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AAE16DC22
	for <kvm@vger.kernel.org>; Fri,  9 Aug 2024 07:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723187472; cv=none; b=Mk0eImSeWbPSstHIVxTG6pcBufIMQ3kWvkIbfOoMK54oZpNLphcAOXjLRBoe0cwHH0M99CQ4KNJhpjEAgwtA+OUu3vmoU+o9BByvh9otMsJvntk0+S2TJGwBF8c/L1XVMF6Z0g3Bu6VijRDsQycqU2Tzyf9iE8XpuYP+8lbJSOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723187472; c=relaxed/simple;
	bh=tpEMj+sY7jg8GfgIPxEaNok9prbpmPGZipqrn6g+n1I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k5sEQcOw72sBWIxaJtGSyTalpZsyjkEuP27YG+5maybCNnhAMHXduBAAEbJzLdw8w1vn5qtpuS7Yi4zV9mbyVpeIAqN4+pI8yyKoV5/0sHAK9yzRxv7G0LSpIh3KWQ6Ahh9SZkAiPQ5xyGNdvyy0fupZZe7QkbmMuLqt4OPy1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cmz2BC/8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723187469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=55FiknPVOjMgPerwYdzxQyFRVU6c8E5y8pIIfmOhXag=;
	b=cmz2BC/8RfMxIdQv7ByVpTi980mLWUwdIdNAlL8i+ndBeLl4XtEK5nLswe8pLKgm48sDSe
	R6m77uC6wEX6dTZK05P23ewT/VKIHYUAR+1uH9FFIxRObd6DqZIRGHVDw7td4jjUBjzZbw
	9dtJKVwq9I/siSH2B++aPvbb1JfJnxM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-127-juI5lSNNN12rJ7wUww4ndQ-1; Fri,
 09 Aug 2024 03:11:06 -0400
X-MC-Unique: juI5lSNNN12rJ7wUww4ndQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B0191955F49;
	Fri,  9 Aug 2024 07:10:53 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.245])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ABFD83000198;
	Fri,  9 Aug 2024 07:10:47 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 9DBF721E6682; Fri,  9 Aug 2024 09:10:45 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: qemu-devel@nongnu.org,  alex.williamson@redhat.com,
  andrew@codeconstruct.com.au,  andrew@daynix.com,
  arei.gonglei@huawei.com,  berrange@redhat.com,  berto@igalia.com,
  borntraeger@linux.ibm.com,  clg@kaod.org,  david@redhat.com,
  den@openvz.org,  eblake@redhat.com,  eduardo@habkost.net,
  farman@linux.ibm.com,  farosas@suse.de,  hreitz@redhat.com,
  idryomov@gmail.com,  iii@linux.ibm.com,  jamin_lin@aspeedtech.com,
  jasowang@redhat.com,  joel@jms.id.au,  jsnow@redhat.com,
  kwolf@redhat.com,  leetroy@gmail.com,  marcandre.lureau@redhat.com,
  marcel.apfelbaum@gmail.com,  michael.roth@amd.com,  mst@redhat.com,
  mtosatti@redhat.com,  nsg@linux.ibm.com,  pasic@linux.ibm.com,
  pbonzini@redhat.com,  peter.maydell@linaro.org,  peterx@redhat.com,
  philmd@linaro.org,  pizhenwei@bytedance.com,  pl@dlhnet.de,
  richard.henderson@linaro.org,  stefanha@redhat.com,
  steven_lee@aspeedtech.com,  thuth@redhat.com,  vsementsov@yandex-team.ru,
  wangyanan55@huawei.com,  yuri.benditovich@daynix.com,
  qemu-block@nongnu.org,  qemu-arm@nongnu.org,  qemu-s390x@nongnu.org,
  kvm@vger.kernel.org
Subject: Re: [PATCH 09/18] qapi/machine: Rename CpuS390* to S390Cpu, and
 drop 'prefix'
In-Reply-To: <Zqix4UGgy4adBVFG@intel.com> (Zhao Liu's message of "Tue, 30 Jul
	2024 17:26:57 +0800")
References: <20240730081032.1246748-1-armbru@redhat.com>
	<20240730081032.1246748-10-armbru@redhat.com>
	<Zqix4UGgy4adBVFG@intel.com>
Date: Fri, 09 Aug 2024 09:10:45 +0200
Message-ID: <87ttfumaru.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: RLO8lDAw4UmS

Zhao Liu <zhao1.liu@intel.com> writes:

> On Tue, Jul 30, 2024 at 10:10:23AM +0200, Markus Armbruster wrote:
>> Date: Tue, 30 Jul 2024 10:10:23 +0200
>> From: Markus Armbruster <armbru@redhat.com>
>> Subject: [PATCH 09/18] qapi/machine: Rename CpuS390* to S390Cpu, and drop
>>  'prefix'
>> 
>> QAPI's 'prefix' feature can make the connection between enumeration
>> type and its constants less than obvious.  It's best used with
>> restraint.
>> 
>> CpuS390Entitlement has a 'prefix' to change the generated enumeration
>> constants' prefix from CPU_S390_POLARIZATION to S390_CPU_POLARIZATION.
>                          ^^^^^^^^^^^^^^^^^^^^^    ^^^^^^^^^^^^^^^^^^^^^
> 			 CPU_S390_ENTITLEMENT     S390_CPU_ENTITLEMENT

Yes.

>> Rename the type to S390CpuEntitlement, so that 'prefix' is not needed.
>> 
>> Likewise change CpuS390Polarization to S390CpuPolarization, and
>> CpuS390State to S390CpuState.
>> 
>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>> ---
>>  qapi/machine-common.json            |  5 ++---
>>  qapi/machine-target.json            | 11 +++++------
>>  qapi/machine.json                   |  9 ++++-----
>>  qapi/pragma.json                    |  6 +++---
>>  include/hw/qdev-properties-system.h |  2 +-
>>  include/hw/s390x/cpu-topology.h     |  2 +-
>>  target/s390x/cpu.h                  |  2 +-
>>  hw/core/qdev-properties-system.c    |  6 +++---
>>  hw/s390x/cpu-topology.c             |  6 +++---
>>  9 files changed, 23 insertions(+), 26 deletions(-)
>
> [snip]
>
>> diff --git a/qapi/pragma.json b/qapi/pragma.json
>> index 59fbe74b8c..beddea5ca4 100644
>> --- a/qapi/pragma.json
>> +++ b/qapi/pragma.json
>> @@ -47,9 +47,9 @@
>>          'BlockdevSnapshotWrapper',
>>          'BlockdevVmdkAdapterType',
>>          'ChardevBackendKind',
>> -        'CpuS390Entitlement',
>> -        'CpuS390Polarization',
>> -        'CpuS390State',
>> +        'S390CpuEntitlement',
>> +        'S390CpuPolarization',
>> +        'S390CpuState',
>>          'CxlCorErrorType',
>>          'DisplayProtocol',
>>          'DriveBackupWrapper',
>
> It seems to be in alphabetical order. The new names don't follow the
> original order.

You're right.

> Just the above nits,
>
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>

Thanks!

