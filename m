Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp801292wrt;
        Thu, 4 Oct 2018 05:02:33 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63LYqrHMuaJ2NNwLHX9+ofxAq+WafraKRVC1fc0z0350hhqhIY7UEvybfbLLceQu/++f6vT
X-Received: by 2002:aed:2c42:: with SMTP id f60-v6mr5122378qtd.340.1538654553487;
        Thu, 04 Oct 2018 05:02:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538654553; cv=none;
        d=google.com; s=arc-20160816;
        b=oq92ABHiq1COTX6I98BJnurF/27WHoRGk4KaONx9vlG8k+qCnai9aJ40+hlld9sgwq
         FNukqn4dmdarotUqczoGvqMxAwh+gbHF7OSXQ1nRhKmf0hAgEDE5J//J0kRwbQldidMT
         vKC+eRcNkMrMgffgalnw1BKZOh8eGuBXE4Qv4BMnEtHiLXemVGR9E8MwjQGKLj297/bT
         TXKPHQjl1CpEvJj5gjbFo1Vb2OKJ9UwowytQp6r1e9qFGgtwQUt9qQU2MzN9RKVNwQpt
         sPxMGKk903ktgbFDypeK6XR6U9e7D1ww7zwepqZe7wyUJmBuPorpZX/O5YVpmkg6Gn++
         w/KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=a/NHrfrMKk7wJNkPfVm3gP99ep5u7BYBpe7rIj2QsFo=;
        b=DyVCzcHQoHHV1BGO8FkuXnPIDTO1uJBXt35WU82YVnECVyoAnhgkwE7mclfENSPNFK
         LG2MzbYNRlq/MQbP6HkaF45ut5DRRyo/E6vqI5szAcqM8TFAg53/NSpEBEeBKx6GyrXv
         svZjeljVeFDz7nCq6xUKG695+SGwxdWkP/2AI/56Z35evolt9fAq24+/W/9GP0eMCb3q
         re1gs6Q6s+c2tC0xwih1hPLB465k+E+P9ymHq2lK19xxWICL6Iu6Np/To6aKItgP+jW9
         yOCL2HI1cj4q3LjMVoTpwIjAmbubCLad03hWBuYR8co6sRWEXUEK6ZU6A+23qoALUO2+
         UTvg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 13-v6si3025276qvu.234.2018.10.04.05.02.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 04 Oct 2018 05:02:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g82Kv-0006cE-2z
	for alex.bennee@linaro.org; Thu, 04 Oct 2018 08:02:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1g82Ko-0006c5-Jb
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 08:02:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <david@redhat.com>) id 1g82Kh-0003kt-3h
	for qemu-arm@nongnu.org; Thu, 04 Oct 2018 08:02:26 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47620)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <david@redhat.com>)
	id 1g82Kg-0003jB-RE; Thu, 04 Oct 2018 08:02:19 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D239888309;
	Thu,  4 Oct 2018 12:02:17 +0000 (UTC)
Received: from [10.36.117.140] (ovpn-117-140.ams2.redhat.com [10.36.117.140])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C82B25D6A6;
	Thu,  4 Oct 2018 12:02:14 +0000 (UTC)
To: Auger Eric <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
References: <1530602398-16127-1-git-send-email-eric.auger@redhat.com>
	<43a03645-fa17-3274-9a66-502acc27b2ee@redhat.com>
	<20181004131150.3de8174a@redhat.com>
	<b673ca5c-f38e-b4a5-7abd-debfa8382e22@redhat.com>
From: David Hildenbrand <david@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=david@redhat.com; prefer-encrypt=mutual; keydata=
	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
	SE+xAvmumFBY
Organization: Red Hat GmbH
Message-ID: <3ee4a49b-77fa-da05-262a-ab75ef1ade84@redhat.com>
Date: Thu, 4 Oct 2018 14:02:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <b673ca5c-f38e-b4a5-7abd-debfa8382e22@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 04 Oct 2018 12:02:18 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v3 00/15] ARM virt: PCDIMM/NVDIMM
 at 2TB
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
Cc: peter.maydell@linaro.org, drjones@redhat.com,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	qemu-devel@nongnu.org, shameerali.kolothum.thodi@huawei.com,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, agraf@suse.de,
	qemu-arm@nongnu.org, david@gibson.dropbear.id.au,
	Laszlo Ersek <lersek@redhat.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: C/1zP67nss+W

>>> Alternative to have a split model is having a floating RAM base for a
>>> contiguous initial + device memory (contiguity actually depends on
>>> initial RAM size alignment too). This requires significant changes in FW
>>> and also potentially impacts the legacy virt address map as we need to
>>> pass the RAM floating base address in some way (using an SRAM at 1GB) or
>>> using fw_cfg. Is it worth the effort? Also, Peter/Laszlo mentioned their
>>> reluctance to move the RAM earlier
>> Drew is working on it, lets see outcome first.
>>
>> We actually may try implement single region that uses pc-dimm for
>> all memory (including initial) and be still compatible with legacy layout
>> as far as legacy mode sticks to the current RAM limit and device memory
>> region is put at the current RAM base.
>> When flexible RAM base is available, we will move that region to
>> non legacy layout at 2TB (or wherever).
> 
> Oh I did not understand you wanted to also replace the initial memory by
> device memory. So we would switch from a pure static initial RAM setup
> to a pure dynamic device memory setup. Looks quite drastic a change to
> me. As mentionned I am concerned about complexifying the qemu cmd line
> and I asked livirt guys about the induced pain.

One idea was to create internal memory devices (e.g. "memory chip") that
get created and placed automatically in guest physical address space.
These devices would not require a change on the cmdline, they would be
created automatically from the existing parameters.

The machine device memory region would than be one big region for both,
internal memory devices and external ("plugged") memory devices a.k.a.
dimms.

I guess that will require more work to be done.

> 
> Thank you for your feedbacks
> 
> Eric


-- 

Thanks,

David / dhildenb
