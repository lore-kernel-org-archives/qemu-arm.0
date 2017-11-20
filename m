Received: by 10.223.153.116 with SMTP id x107csp618601wrb;
        Mon, 20 Nov 2017 05:50:59 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYEHsuIILUSVpyiiekdjusypRvnUaVos1IGFdXr02eC8R3mrzNTq7dGrCeob/xfnwQF0J3t
X-Received: by 10.129.46.203 with SMTP id u194mr4931556ywu.143.1511185859680;
        Mon, 20 Nov 2017 05:50:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511185859; cv=none;
        d=google.com; s=arc-20160816;
        b=HLGpbz0aYptsE3xM55c7lvTDxdn95y4/ilj8rIUEB68m2uwD09/DwYqWlC53rGA2ry
         nOtjauzBUyP04cB9Z18DCurZEn28xO/LMc43J8eCuEcOLMBv5X3LNtfEwyNvcY4FTQ3t
         tDzqfd1gLa9Nf7mXDoFcF6doYiNYBE5dmlOI1F5yEDTi9Dc8karSYhqLoPWgUWUtVMFO
         duzPu6HzooKb35r2Y4zluE9/6/1FBXFPULnM+06pyHAWyfB4T0uD75cAvMC2ahuQyfg6
         9XxGD+NXQgGWysxSsw+YS2kOOHoqEj5TrQRj3Uew+96chmsXd0osBNFWjLDyhnyAaZ6t
         oA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=XcRHc48FAsrs8Xs6gUPirZVTqEKpO2PHctzuRA0rT6Y=;
        b=xrG/phUCCufdRqoDFTD14xsmlu84fvRb7FaUd/dUjtoHr4vOR0cVGTUVTe5LsJZmMR
         ucWF0pLXjzZu7wvOI7m0c3Gu37j4Upi9HT1qJ0p0I0JiqqTnqdgN4xOeDYBXVvG9eazp
         MLnloWljTycuR40l380oiTVK4SKzPrIQzj/FOCvshpwi7Yl8+6kT35S/tb5DQiI53bnU
         XvJDRwyJf9sQ/jEOJ1WBE2ImIeMjs4QFMw6vjWFQOywaMs8OvOCPcjjAvHMbrGPbttD8
         7bnU/o/4b74egN+y43SDs7LfNGSr1cV6yPUKW1LmZAknn5xr06XUB4TOJoXDfBwkEaz3
         G0+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QiiE+o7A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5si2216832ywg.382.2017.11.20.05.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Nov 2017 05:50:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QiiE+o7A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eGmTT-0004yC-5D
	for alex.bennee@linaro.org; Mon, 20 Nov 2017 08:50:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52447)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eGmRv-0004BI-Re
	for qemu-devel@nongnu.org; Mon, 20 Nov 2017 08:49:24 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eGmRs-0008Oj-02
	for qemu-devel@nongnu.org; Mon, 20 Nov 2017 08:49:23 -0500
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:40437)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eGmRr-0008OF-Pg
	for qemu-devel@nongnu.org; Mon, 20 Nov 2017 08:49:19 -0500
Received: by mail-wm0-x242.google.com with SMTP id b189so18721438wmd.5
	for <qemu-devel@nongnu.org>; Mon, 20 Nov 2017 05:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XcRHc48FAsrs8Xs6gUPirZVTqEKpO2PHctzuRA0rT6Y=;
	b=QiiE+o7A9dL6C+TKfS4nfug3EEh8488NWPP0lnsth12ZpGdruhVpv67j573sKJ2ZUb
	H/Z50NU9S+2Ugf28mYvPi5Cy3uTGIVffmFDbIv4B0e5/NElq44q+MgVJPcab0tBNFldF
	lfgXsiA4I5WA0P91VZ/fKw+z2Nc50J9xtI8iU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XcRHc48FAsrs8Xs6gUPirZVTqEKpO2PHctzuRA0rT6Y=;
	b=f6UaaycAHkNv65Kv9KIFYQkpHgOdb0YcvvhI8FhSYq8//JD22vIkRswXhhaQ9LLls3
	rYq7e+XWmDkwAlwWomoHYs4gKHTXX/pYnWhVRIcCvwuyV9Cj9P1KJoqrL+n4OUjjqdJd
	iQe8wdUCgqCU4e1spyPNZzEeku7XwLNLRFjeXRvoHEJrs/r2RUzuKUQdcEEVAYfRDvJe
	K7SBuyEnn34XuXQFOe9cqpwvovjOP8Hs7NJxwpUG/xGB7hF9JXK79AduSJFuf/kv3Wof
	dFLvI43z2nA3fmBMW1n9O+MwzJG31hoUIW3k4pKmcDTKhv+gyh9bQZZVHqeOOh0S2YA0
	AVWg==
X-Gm-Message-State: AJaThX7Z7FGlbBcuK5EvCCj6bQkkbjkJzB8yvWjXMewu16AQRA5fGdLo
	2kmKzwzz3kHqqspB31rCfdKF5tNi0hezKFuRlmaBAA==
X-Received: by 10.28.46.136 with SMTP id u130mr5933739wmu.127.1511185758672;
	Mon, 20 Nov 2017 05:49:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.187.195 with HTTP; Mon, 20 Nov 2017 05:48:58 -0800 (PST)
In-Reply-To: <CAKmqyKONK8R_bB1PqtEtDoDRGs6ZRPh97TCrw+ne0D91Mbr=Ww@mail.gmail.com>
References: <1510846183-756-1-git-send-email-thuth@redhat.com>
	<CAKmqyKONK8R_bB1PqtEtDoDRGs6ZRPh97TCrw+ne0D91Mbr=Ww@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Nov 2017 13:48:58 +0000
Message-ID: <CAFEAcA_p-xA0oW=CVH2AT-tafqgDO0wT7i1xbYw98KP44d5Nrw@mail.gmail.com>
To: Alistair Francis <alistair.francis@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-devel] [PATCH] hw/arm: Silence xlnx-ep108 deprecation
 warning during tests
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	"Emilio G. Cota" <cota@braap.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EaeYeGJ/tOYA

On 16 November 2017 at 17:09, Alistair Francis
<alistair.francis@xilinx.com> wrote:
> On Thu, Nov 16, 2017 at 7:29 AM, Thomas Huth <thuth@redhat.com> wrote:
>> The new deprecation warning for the xlnx-ep108 machine also pops up
>> during "make check" which is kind of confusing. Silence it if testing
>> mode is enabled.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  Note: I slightly shortened the message so that the code still fits
>>  into the 80-columns limit.
>>
>>  hw/arm/xlnx-zcu102.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
>> index 9631a53..bbe7d04 100644
>> --- a/hw/arm/xlnx-zcu102.c
>> +++ b/hw/arm/xlnx-zcu102.c
>> @@ -24,6 +24,7 @@
>>  #include "qemu/error-report.h"
>>  #include "exec/address-spaces.h"
>>  #include "qemu/log.h"
>> +#include "sysemu/qtest.h"
>>
>>  typedef struct XlnxZCU102 {
>>      MachineState parent_obj;
>> @@ -164,8 +165,10 @@ static void xlnx_ep108_init(MachineState *machine)
>>  {
>>      XlnxZCU102 *s = EP108_MACHINE(machine);
>>
>> -    info_report("The Xilinx EP108 machine is deprecated, please use the "
>> -                "ZCU102 machine instead. It has the same features supported.");
>> +    if (!qtest_enabled()) {
>> +        info_report("The Xilinx EP108 machine is deprecated, please use the "
>> +                    "ZCU102 machine (which has the same features) instead.");
>> +    }
>
> Looks good to me.
>
> In future maybe it makes sense to never print info_report() when running qtest.
>
> Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks; applied to target-arm.next.

-- PMM
