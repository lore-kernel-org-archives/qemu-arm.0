Received: by 10.25.21.96 with SMTP id l93csp2114533lfi;
        Tue, 21 Jun 2016 12:46:54 -0700 (PDT)
X-Received: by 10.55.92.198 with SMTP id q189mr21923187qkb.155.1466538414127;
        Tue, 21 Jun 2016 12:46:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v64si1383786qkh.209.2016.06.21.12.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Jun 2016 12:46:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53946 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFRdN-0004uQ-Dj
	for alex.bennee@linaro.org; Tue, 21 Jun 2016 15:46:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFRdJ-0004tE-Ap
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 15:46:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFRd8-0002lf-Ga
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 15:46:49 -0400
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:32775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bFRd8-0002lS-BL
	for qemu-arm@nongnu.org; Tue, 21 Jun 2016 15:46:38 -0400
Received: by mail-vk0-x235.google.com with SMTP id d185so34582489vkg.0
	for <qemu-arm@nongnu.org>; Tue, 21 Jun 2016 12:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CV/RSuHSvp+PaXEzZNm3YWmZCOtJUHhmzZ6IzHuSmdM=;
	b=V0YYUlsMgbrCJ8jrm8NIVzfNchosamj4k+weDL6XOLtameICrI6/KjoB7/kziYdzpj
	rTW5WEiGj9f/TuTzDyXE/DT0UFvPQ/UjT4h6jAMDLQO+qW9joqAkbxFpRrHCbxyKmDji
	uViX292cx/nzNVLY5ZK5eZWMKboppF2GRweGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CV/RSuHSvp+PaXEzZNm3YWmZCOtJUHhmzZ6IzHuSmdM=;
	b=j/LJ1p4Qg0ZRJN1GTwUp+3wiQHRWO8T1zGg8KvNWYDqi/U/ITjA696dYTpXL5qVMcp
	1eOHdtqJbKWKK8fdf7QdIOLEKomjxR+lVJvIuFDf2jO2uJH4LlIMAOLD4xNA4j+9VpiG
	d9YFLYeDK0M+Mj+KXPc3qXIOzdNyeew0AHKf2mIEvLZJyyIV9uFvsBxcork8ivLX63Sd
	x6CiGn5V/UT574aBSuw7f2/6YJCb3U1u5dJVQ9TmpeqaP7/zxMJcQAZxvMPpPhsnoGpT
	7L1D2OUCeG5OoNfzSm27sbo5n9tein1NJwH2oCA9ECXn4LxZgTwr+7kHuTIkQJlvogGy
	XOjg==
X-Gm-Message-State: ALyK8tJ3AAB9PFJ7lw9I677QP1YgfPmMPo56lYoqa2APQ8c1u92dd7uZCK5BifErjSDYPCuVxxybmTSw4IgOdl1y
X-Received: by 10.176.65.106 with SMTP id j97mr10482788uad.64.1466538397725;
	Tue, 21 Jun 2016 12:46:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Tue, 21 Jun 2016 12:46:18 -0700 (PDT)
In-Reply-To: <20160621182634.5xwirsgel7i4twmm@hawk.localdomain>
References: <1466528974-12183-1-git-send-email-peter.maydell@linaro.org>
	<1466528974-12183-5-git-send-email-peter.maydell@linaro.org>
	<20160621182634.5xwirsgel7i4twmm@hawk.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Jun 2016 20:46:18 +0100
Message-ID: <CAFEAcA9SLKxKJD3VRYYb5hXPpZ2BvWhfPkBK0E2FwzZHm94Sow@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 4/6] cpu: Support a target
 CPU having a variable page size
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Vijaya Kumar K <Vijaya.Kumar@caviumnetworks.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U+P6bBOjglWW

On 21 June 2016 at 19:26, Andrew Jones <drjones@redhat.com> wrote:
> On Tue, Jun 21, 2016 at 06:09:32PM +0100, Peter Maydell wrote:
>> --- a/include/qemu-common.h
>> +++ b/include/qemu-common.h
>> @@ -76,6 +76,19 @@ void tcg_exec_init(unsigned long tb_size);
>>  bool tcg_enabled(void);
>>
>>  void cpu_exec_init_all(void);
>> +void cpu_exec_machine_creation_done(void);
>
> Was the above added here by mistake?

Yes; leftover from an attempt at finalizing the page
size much later in init; I deleted the function but forgot
the prototype (and gcc doesn't warn about that).

thanks
-- PMM
