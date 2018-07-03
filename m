Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp996279wrq;
        Tue, 3 Jul 2018 06:21:01 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeoWYolMhT+oiR0h8tbLw7IHNo5w0rDpHIcnSoExh8iYwDM4zFJ9xngFw8NmZ3s10gFXW2O
X-Received: by 2002:a0c:91d0:: with SMTP id r16-v6mr26546968qvr.38.1530624061082;
        Tue, 03 Jul 2018 06:21:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530624061; cv=none;
        d=google.com; s=arc-20160816;
        b=pNATyGaEUAQWZliC2mPz0G5kAE2awhURbqYe9FktelD/ou3y/5B5sbzaU+ziIZXOB3
         UWUeus6oaIeclPBjJsxkVbeAXBWPS545rilIPoV1V1vj2rFszBfkBoP9zD4MfCbThbpA
         0L28ivg6ZBL9wA8Dhy+YZUyMxvmMxTkGr/o7ckvRvADTugP+ma2yAXlTwGtZrRN5/d5V
         ibGLo57CmSbhDDv+NmK7tmEKzINeMnJCqPEf/kSB+ryc3bWK39QgEjKfZnU5v7TbO0b0
         5x8hJaZbHaOfqUT4cB9477xs5jcN7TCLJ5ipueMM+5iF0Bvn9FFHnTMKp6+vi85+F0z0
         /UnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=wgFyFsTrBGoIyYKgPLbfatZwVdGhq4RNfOEOO5tIbQI=;
        b=DpucsWLQWdCjPC4zpFuKj7uTvzgpXf6XSCc5VTt/vBppMTrb4vN4GMv5LSZ0O9z69i
         3mdqT7/SDK3j2GWTc4v+kdh6DFi6nbr9SVT8/OlqxuLrLfH1dbGKRRk/8PFDv4O3W83T
         tWKbz22ENG8i7m4Jm3uCLxsmgzTkWA/yvRJEmNRKavw5CLxs5lve20/oJOPBjhIJblkf
         WBF4ZzsWRQPNKPSa5zKMc01Ys2TOcKIuDEuyVV+doZYoaRsr/jjzt1qadatrwRM/Oo6p
         qRONefXpQRROqxNkWidgoK4kOyg9a9tlG2CR2UKZjZpAx2YZ3qX0u62ICjp0akHURoa/
         CT1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b103-v6si472199qkh.60.2018.07.03.06.21.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 03 Jul 2018 06:21:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40522 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1faLEq-0002cd-Gh
	for alex.bennee@linaro.org; Tue, 03 Jul 2018 09:21:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>) id 1faLEc-0002cK-Ll
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 09:20:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>) id 1faLEX-0005pI-LN
	for qemu-arm@nongnu.org; Tue, 03 Jul 2018 09:20:46 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:56580
	helo=foss.arm.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Suzuki.Poulose@arm.com>)
	id 1faLEX-0005of-E0; Tue, 03 Jul 2018 09:20:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE76680D;
	Tue,  3 Jul 2018 06:20:39 -0700 (PDT)
Received: from [10.1.206.73] (en101.cambridge.arm.com [10.1.206.73])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4731D3F5A0;
	Tue,  3 Jul 2018 06:20:38 -0700 (PDT)
To: Andrew Jones <drjones@redhat.com>, Auger Eric <eric.auger@redhat.com>
References: <1529500053-21704-1-git-send-email-eric.auger@redhat.com>
	<1529500053-21704-6-git-send-email-eric.auger@redhat.com>
	<20180703115507.nqmyo7c5q5lrevgt@kamzik.brq.redhat.com>
	<31c24e33-8fe8-a3c0-0430-d2f503f10932@redhat.com>
	<20180703124709.sqt5rmjsadnqag2c@kamzik.brq.redhat.com>
From: Suzuki K Poulose <Suzuki.Poulose@arm.com>
Message-ID: <9e8e72c5-707e-0d50-68af-f69fb1804cf4@arm.com>
Date: Tue, 3 Jul 2018 14:20:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180703124709.sqt5rmjsadnqag2c@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 5/6] hw/arm/virt: support kvm_type
 property
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
Cc: peter.maydell@linaro.org, agraf@suse.de, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, eric.auger.pro@gmail.com,
	dgilbert@redhat.com, david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nfkiqTvWhqcZ

On 03/07/18 13:47, Andrew Jones wrote:
>> This infrastructure already is used in hw/ppc/spapr.c
>>
>> Whould it be better if we would pass something like kvm-type=48bGPA?
>> Otherwise I can decode another virt machine option (min_vm_phys_shift)
>> in kvm_type callback.
> 
> Yes, this is what I'm thinking. I don't believe we have to expose the
> details of the KVM API to the user through the QEMU command line. The
> details are actually more complicated anyway, as the phys-shift is
> only the lower 8-bits of KVM type[*], not the whole value.
> 
> Thanks,
> drew
> 
> [*] Looks like Suzuki's series is missing the Documentation/virtual/kvm/api.txt
>      update needed to specify that.

Thanks for spotting, I will update the documentation.

Suzuki
