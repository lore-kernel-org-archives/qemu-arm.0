Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3771428wrt;
        Mon, 10 Dec 2018 08:04:46 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VyUy9v9wxZFx1IuSgOfRCk+7n2R1M2lq9T09d+KB0D0qg+o+tLbMqZ7vsBO44ox4sIvDMK
X-Received: by 2002:a0c:88e6:: with SMTP id 35mr12035664qvo.61.1544457886623;
        Mon, 10 Dec 2018 08:04:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544457886; cv=none;
        d=google.com; s=arc-20160816;
        b=IzVK8hovq0cjiRYLsPUlv4jJakKG8fDwYZOKKYlisHhPyRA4Q9hOGBM6X5qc2muuqq
         gnm0VUKuKQCWYRo8GtDoLCbcxPjwPykyB1a8xav6SVANDQFpGXX6rCU0jZOfp4CHc7od
         pLeAAZB5lD1Z68gWbht6pIc6z5UGdMJhjzHp3i0J9eqOfsAt6mxZXGIiuQGWyULaIaTF
         OVBGPVDOGmw/aa6QT5XfSHnaZBzAmgqmVuxtHHJvp17jY7X0KED9cB4lpTEGFNjLh3ax
         4ZVgM+lDE3xxDrsrytadbQeBrMCAj/KaNtIkY4BlQbyjlZhFyKeN5iXj3/ODa6N5gQnl
         WUFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=V2N76l2f/JVfJOHsZ0Uq7l/iQKTPz4V0bPyhadivYFw=;
        b=nzl3YnQupd7ZFZ3lvQ7m4Ok3NAh0BZoqmUaLPeKq0+XLvPSoD3XwbSJ2dG4H8sFWgW
         QVetkxNM8XujALMPrMNw7O/DeKw/EICaE5sbLTAqN8y9sKvDKbm40TDaAL8tHiubwgvh
         JEBRGsONZuGdx1K0ytWUIEnym7IbKRYqKwun3jD7gIZ4ovY017DYSCYa8pxyMjqhDSxD
         02UkX/amoYtDBKhUWu547oXTSrjH2VPviJfN72nZotry9A3cR/2qfRZ6yQN0qz6sVvMS
         txJfXy7FdodxflpqqvWiGEj0ugALk5LaqGJnW98L86lTSydubBIQPy9vDSSpSHvrDjxi
         FwyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a41si3758937qtb.19.2018.12.10.08.04.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 08:04:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWO34-0000g6-0T
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 11:04:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWO2V-0000LW-KN
	for qemu-devel@nongnu.org; Mon, 10 Dec 2018 11:04:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gWNvq-0000QB-1Z
	for qemu-devel@nongnu.org; Mon, 10 Dec 2018 10:57:21 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:35576)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gWNvp-0000PR-6X
	for qemu-devel@nongnu.org; Mon, 10 Dec 2018 10:57:17 -0500
Received: by mail-wm1-f68.google.com with SMTP id c126so11774540wmh.0
	for <qemu-devel@nongnu.org>; Mon, 10 Dec 2018 07:57:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=V2N76l2f/JVfJOHsZ0Uq7l/iQKTPz4V0bPyhadivYFw=;
	b=sMfPZKaB1f6uMBVV9KcXl+quFiu2pGP/UqeTpWvfvo9BOtfeL8NNj+Tf4tEF60Rqow
	tfHcV8ZiAeUQxu/TSP1irrzHSxWomxOA57cxqn81vE2i9z/HULlSPWYmSWcVElDJo5bk
	hpbDkVG5Mv6RL1DXCrKPjN82+QbcoD8q6z8MNtr+CtK5/ikgQ3eZVgGc7uNBdADLGGDO
	RzC1M/nD3uu+2Kh7FZ5CSwpgsTwSyFBVnhG8J2LpsEYSR+5tLUv7XeZG99YiO7WU83CC
	Q6P36+3yNP21FA3HjyskkcGK7gx8BwxGsf6qUnUeiuPvxe5teDcKS5DrKriXQoK3AhtO
	p+Dw==
X-Gm-Message-State: AA+aEWaUzazqXqGqxS80mo6zHvFEhW2oZOzbGBjbLBhjx03trYDTQPn1
	s05AhqeOeorz8ztoYMxHXeAK3Q==
X-Received: by 2002:a1c:b515:: with SMTP id e21mr11326377wmf.82.1544457436181; 
	Mon, 10 Dec 2018 07:57:16 -0800 (PST)
Received: from [10.201.33.118] ([195.166.127.210])
	by smtp.gmail.com with ESMTPSA id
	c7sm15388618wre.64.2018.12.10.07.57.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 07:57:15 -0800 (PST)
To: Laszlo Ersek <lersek@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Corey Minyard <minyard@acm.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181207165103.3992-1-philmd@redhat.com>
	<20181207165103.3992-5-philmd@redhat.com>
	<59daee09-d797-3340-3fd3-c6d521d2cf68@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <bfa8379c-03e1-9e40-f588-edf402d93716@redhat.com>
Date: Mon, 10 Dec 2018 16:57:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <59daee09-d797-3340-3fd3-c6d521d2cf68@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-devel] [PATCH 4/4] hw/smbios: Move to the hw/firmware/
 namespace
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jZKEq115SS4o

On 12/10/18 4:10 PM, Laszlo Ersek wrote:
> On 12/07/18 17:51, Philippe Mathieu-Daudé wrote:
>> SMBIOS is just another firmware used by some QEMU models.
>> We will later introduce more firmwares in this namespace.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS                              | 2 +-
>>  hw/arm/virt.c                            | 2 +-
>>  hw/i386/pc.c                             | 2 +-
>>  hw/i386/pc_piix.c                        | 2 +-
>>  hw/i386/pc_q35.c                         | 2 +-
>>  hw/smbios/smbios-stub.c                  | 2 +-
>>  hw/smbios/smbios.c                       | 2 +-
>>  hw/smbios/smbios_type_38.c               | 2 +-
>>  include/hw/{smbios => firmware}/smbios.h | 0
>>  tests/bios-tables-test.c                 | 2 +-
>>  vl.c                                     | 2 +-
>>  11 files changed, 10 insertions(+), 10 deletions(-)
>>  rename include/hw/{smbios => firmware}/smbios.h (100%)
> 
> (1) Please replace the word "namespace" in the subject, and in the
> commit message too, with "subdirectory".
> 
> (2) Please replace "firmware" -- both instances -- in the commit message
> with "firmware interface", or perhaps "firmware specification".

I'll go with "firmware interface", because I'd like to eventually put
here helpers for firmwares with no public specification.

> With the updates:
> 
> Reviewed-by: Laszlo Ersek <lersek@redhat.com>
> 
> Thanks,
> Laszlo
