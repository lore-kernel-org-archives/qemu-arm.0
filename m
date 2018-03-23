Received: by 10.28.71.155 with SMTP id m27csp380487wmi;
        Fri, 23 Mar 2018 05:02:19 -0700 (PDT)
X-Google-Smtp-Source: AG47ELsne+0nA4cYeSnnN29WJZ1pbTfsYdXbLYQkPMYmjpAcHrTLmCaANrY8lcYRSSnLMcenwCHy
X-Received: by 10.237.60.155 with SMTP id d27mr40635375qtf.210.1521806539481;
        Fri, 23 Mar 2018 05:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521806539; cv=none;
        d=google.com; s=arc-20160816;
        b=HdHV/kx1CaBHPJ1NRZZWxOJbTZPpARRf39n8mMHH3FoABrw4r2z1/mbrtxx84Rh8Fm
         jabSwTpFQb7uvH2Lg1dMKVLSmQMzH9rLV1W4oQNpTy9zRz/EKI8ekKby6GXwIW8gUY4s
         OcJQqCrZl2cxybp7FJWmZ7bD/gJX2IcvzWMLZJ9mgNKVRD39IlQ2rXaV8aIs//964EAz
         Q5VwGjPXMrgJWOP6W9TAN3WfD+XtubdpOXpP9qtGA4N8T9a/hsNuy+Px1L/utnTC7vhw
         4iKrbuN1U/wgUg350dFLsxigga6+G94K+nmgmbuBagZ2GEQMx2enwNYrW2sogkVkBQlh
         W3JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=dixQkviGsNIBVRsCO1TExDocd2tcYQQgSUBU33tD+Do=;
        b=pqZG307YOuRmDo75dJg0eJ9pwNo9cXyogXaiSC1CDX8tS22X2j5oqu33DskAqeDwW/
         ebKQpc6Nam5B8xi3mmLFlBwxzi5VjCF8UxX4KEx8nV3JEWJ/toG6tEMLWM0urIC2B9Ud
         DkkIqOWlgG/PeRqSDjtgl/EJ4wjmmu6vXXBYn7OjhbZk4qkz7Owq+MIL2r3KhpaRTIUx
         rPwfZcVzbF291O6zXHEHUF51AQkUpIKQMqQ4Vacsj9il8h4mSZAsu19I07kJUTF65NUs
         SswX73zuet8kcSkTw0oOL7NmdDr5ad+MUdQFUhLIGw/iHudZvdGVIvfMk/Nemhf8aFRe
         oyeg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 41si4052720qtb.20.2018.03.23.05.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 23 Mar 2018 05:02:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37610 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ezLOl-0007ah-2j
	for alex.bennee@linaro.org; Fri, 23 Mar 2018 08:02:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53500)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ezLOZ-0007Y4-RP
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:02:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1ezLOU-0001Zw-Bo
	for qemu-arm@nongnu.org; Fri, 23 Mar 2018 08:02:07 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59782 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1ezLOU-0001ZZ-6v; Fri, 23 Mar 2018 08:02:02 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 47028722D7;
	Fri, 23 Mar 2018 12:01:51 +0000 (UTC)
Received: from localhost.localdomain (ovpn-116-135.ams2.redhat.com
	[10.36.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AF3E2166BAE;
	Fri, 23 Mar 2018 12:01:44 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <d29ae6aa-5758-277b-b754-4e6fe7666e6b@redhat.com>
	<CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6b4fbb94-2c28-27c2-17e4-b3ce593eb04d@redhat.com>
Date: Fri, 23 Mar 2018 13:01:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9dHPLj6aF=JsS8dXaDWf_ONQ_A+SD1xXQO7DdsWK3yAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Fri, 23 Mar 2018 12:01:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Fri, 23 Mar 2018 12:01:51 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] Regression on KVM qemu-system-aarch64 since
 "monitor: enable IO thread for (qmp & !mux) typed"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, Eric Blake <eblake@redhat.com>,
	qemu list <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tAENVjXvaxRR

Hi,

On 23/03/18 11:26, Peter Maydell wrote:
> On 23 March 2018 at 10:24, Auger Eric <eric.auger@redhat.com> wrote:
>> Hi,
>>
>> I observe a regression on KVM accelerated qemu-system-aarch64:
>>
>> Unexpected error in kvm_device_access() at
>> /home/augere/UPSTREAM/qemu/accel/kvm/kvm-all.c:2164:
>> 2018-03-23T09:59:59.629439Z qemu-system-aarch64: KVM_GET_DEVICE_ATTR
>> failed: Group 6 attr 0x000000000000c664: Device or resource busy
>> 2018-03-23 10:00:00.085+0000: shutting down, reason=crashed
> 
> Can you get a backtrace for this? (I guess you'd need to fiddle
> with the kvm_device_access() code to make it assert rather
> than passing back the error).

OK. I will try to do so. As I could have expected, I cannot reproduce on
a standalone qemu command line. The problem observed above is seen with
libvirt launch which may be doing some other QMP stuff concurrently?

Thanks

Eric
> 
> thanks
> -- PMM
> 
