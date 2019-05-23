Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1482966wrg;
        Thu, 23 May 2019 02:29:41 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyLHgFmdpQRClAlCLzXkdtbx7bxLXxktMBGvjGM0aAABHDCjZByAUrbaFXcrq9AsZrsfPLQ
X-Received: by 2002:a17:906:68c8:: with SMTP id y8mr58365195ejr.104.1558603781219;
        Thu, 23 May 2019 02:29:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558603781; cv=none;
        d=google.com; s=arc-20160816;
        b=WEY/OXfuBVygMmUMHFmvVI1nKGxX+8SHQoHP8pPuJHzN2YCm3iBOfg18r0fo1qh7Ft
         +5aMTYdpty4bg70g2yiJLRRuZiaD3hVeBMGZ5C1qwfPAwrNu6yyo4sgWU7nL1lX8GglW
         dhsK61Zi/Q/fR11ZqOAZmfSebAsUmo6L40SYOT4Rzebzlf2n/kepVQ+PSPXTHPP+PqgO
         A2O7vtkj880JJRb4KY784MUiv2LrVJWIVwCbF7whTM/E5C2S5pmTwEG1esreXIOcCU/6
         GD21RrfC4rjLkkZ9WL4Ya+/hBKnCRaNtgKWO2KTUGK4cg0g9RtWroMK+wyXXWc43jCTb
         0Vxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=cd2Tqu1K8ZBcZpPPVYcjLx8XCLZjsoiUkNI6k5j8kv0=;
        b=lozpmUMAuUMMx7Raa5wY5XoL/5IlHIrHOBR9wgfPf0z+oK1+mSgNm0MBqIDSyG+mdW
         eEgfzmWZnngnJzPxfoWDZkMHS5AdPrFP2xD94srVu+x6/0H2g4yoYnxkzdJQ9siIjhW/
         7frk4gm2uTZfjCg1tS3fTzefXdiyYA/+gpA0iKN4yuDa8aWxloZPB2eBAYS0woRnXKg5
         NssKYQc94sTHLa3ieoCDJZ5xXYvH5/Q73lqu1w/MHiH5lx7dt2f61l705CigcQ6x3BAG
         tR006FdxyVZFNKh1tTtUERTbEYLif54krTrwy0hg9OGmRHjW13WNc8sp/uJPQIe9wSa7
         0ViA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 4si5417073edz.371.2019.05.23.02.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 May 2019 02:29:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:60486 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTk2e-00075b-8o
	for alex.bennee@linaro.org; Thu, 23 May 2019 05:29:40 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hTk2R-000750-BR
	for qemu-arm@nongnu.org; Thu, 23 May 2019 05:29:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hTk2Q-0005nk-5L
	for qemu-arm@nongnu.org; Thu, 23 May 2019 05:29:27 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:33768)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hTk2P-0005jU-FI
	for qemu-arm@nongnu.org; Thu, 23 May 2019 05:29:26 -0400
Received: by mail-wm1-f68.google.com with SMTP id c66so6653766wme.0
	for <qemu-arm@nongnu.org>; Thu, 23 May 2019 02:29:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=cd2Tqu1K8ZBcZpPPVYcjLx8XCLZjsoiUkNI6k5j8kv0=;
	b=Pg9Ej0KGcOk9i8HbUKl/beEibCXQKXDDfwpdjFNJiD2wuNEgT4U/AarukYSQnGUFp7
	dqcGiDf212AOlbOEJm+WC3tPh72hk2Lh8kuEa9AiD0UQQZ9fM0zKC4I1RsD0OKyzcUfk
	yXGQk6UV9ufvKXa8RdTsmRA9R6k/wHhx4GGYgOhFoOr2ayaqDBo5i+mod95OCMTbD8XR
	zoUCuw7CApf9OVy3KzumGOJpoHTWCL2cvlrcKXxHKceOyx+Dqccjnhx1q+qAG8CVUK7L
	H0X837/RuG5ApK6BbM49sSQuydyDX3Erij/RKqlTb7J6abPu0te9NhhSjUDgEM6yiGbE
	aaww==
X-Gm-Message-State: APjAAAWNrpG2RkcN7SN0hFuY4lvN2i2saHoAZfwOU97hjTrUM1/Y+/7Q
	ARELsLZGhdU3EiUW5FqHAVtJvQ==
X-Received: by 2002:a7b:c7d5:: with SMTP id z21mr10932424wmk.56.1558603764243; 
	Thu, 23 May 2019 02:29:24 -0700 (PDT)
Received: from [192.168.1.38] (228.red-83-52-173.dynamicip.rima-tde.net.
	[83.52.173.228]) by smtp.gmail.com with ESMTPSA id
	a128sm10054948wmc.13.2019.05.23.02.29.23
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 02:29:23 -0700 (PDT)
To: Cleber Rosa <crosa@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
References: <20190312234541.2887-1-philmd@redhat.com>
	<20190312234541.2887-3-philmd@redhat.com>
	<20190522205234.GY10764@habkost.net>
	<1204725743.24201394.1558559144548.JavaMail.zimbra@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1088d160-20c1-00ed-b494-fede1a3a8410@redhat.com>
Date: Thu, 23 May 2019 11:29:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1204725743.24201394.1558559144548.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] Boot Linux Console Test:
 add a test for the Raspberry Pi 2
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /70wVDfwf9Tu

On 5/22/19 11:05 PM, Cleber Rosa wrote:
> ----- Original Message -----
>> From: "Eduardo Habkost" <ehabkost@redhat.com>
>> On Wed, Mar 13, 2019 at 12:45:41AM +0100, Philippe Mathieu-Daudé wrote:
>>> From: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>
>>> Similar to the x86_64/pc test, it boots a Linux kernel on a raspi2
>>> board and verify the serial is working.
>>>
>>> If ARM is a target being built, "make check-acceptance" will
>>> automatically include this test by the use of the "arch:arm" tags.
>>>
>>> Alternatively, this test can be run using:
>>>
>>>     $ avocado run -t arch:arm tests/acceptance
>>>     $ avocado run -t machine:raspi2 tests/acceptance
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>
>> We're getting timeouts on travis-ci:
>> https://travis-ci.org/ehabkost/qemu/jobs/535468057#L3289
>>
>> I don't know yet if the guest is hanging, or if we just need to
>> increase the timeout.  I could reproduce the timeout locally,
>> too.

That's odd, I can't reproduce (this test is quicker than the following
test_arm_emcraft_sf2 which start u-boot then timeouts and start the kernel).

My guess is network issues, since this test use a different mirror:
archive.raspberrypi.org

Gerd already raised this problem (timeout reached while fetching
artifacts) to Cleber.
Cleber, can we add test_setup() methods that use different timeouts?

Regards,

Phil.

> It may be related to:
> 
>  https://bugs.launchpad.net/qemu/+bug/1829779
> 
> And this is a proof that we urgently need to have a better
> way of presenting/storing test artifacts.  The brief output
> is nice when everything goes well, but makes the test results
> close to useless once a failure happens.
> 
> Philippe showed us how GitLab allows CI jobs to preserve
> artifacts, so maybe the solution is to move the loads there.
> 
> - Cleber.
> 
