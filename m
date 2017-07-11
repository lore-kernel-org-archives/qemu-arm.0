Received: by 10.25.44.15 with SMTP id s15csp5067236lfs;
        Tue, 11 Jul 2017 09:31:42 -0700 (PDT)
X-Received: by 10.200.52.71 with SMTP id v7mr1057199qtb.214.1499790702683;
        Tue, 11 Jul 2017 09:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499790702; cv=none;
        d=google.com; s=arc-20160816;
        b=RGr8vxiOnenqrEuKlnvQeXGIfL6zWwwBcm7WgIs+OeEy2sF9Y6lJ+gBRXLwqe4ePaZ
         hXnkLZLt9MCakdTfdyDwc99LhH/nXloaJWdNRPHuEtoqnXmSGeUcNmXRjCVBDCZmvptr
         Pet/1iTO1Xd5JLBTjJZkYPlfdIGp+Rv3aE/EB+D6TzEYMvF7ZJu1zCs3oHG0JFlG4TcW
         GYWdDOY1axy2UKM3iyq8++qHlDsy3XCq0yk6JNlyJl/75pfEivIW6t/M4rF5RR2fSbDJ
         ykI6yycNeK6ceHSGMisody4aZGgl5nQFMopjTD1yDK5y0p7BcDb12Nwt6T7hW+EuuQX0
         lF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=9mQ0/NJTGzlaMth1d3ziYI//lp/AiKY4jJiWBIFa3lw=;
        b=KlIbofRQvLLGR1HtTwloOhV9ppva4JqRIvWMf0osKgpEv/UVUZ+/Dc+T5q1e5nf9dw
         nGvACaBTmbSj/GsPDn8FxNlIPh0cbUx8eHp4IxWHVXIxBLLyBSUWuEOiQ/U2eb3m0hgP
         TCEHTtNwY8U+kKY+HBPKi4SOPopdOlVfAPFKf/Qd4mG99mLA8M+yFBArpxCdF+nNATCz
         E017sHUXAmre1atTX6dZ9zV/MiUqI3oEk81pI71+QoYADIEXUnIdBf1O4LHFuMnWHGY4
         bcAdSoW3BfsY2+KhYL1gk7nqPOD2a/lvVMlR8WCu1VqF9FRCXePLd9dNYf11rNN+dG5R
         nwLw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a12si338738qti.262.2017.07.11.09.31.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jul 2017 09:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 33E0E61D03;
	Tue, 11 Jul 2017 16:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 33E0E61D03
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 33E0E61D03
Received: from [10.36.117.192] (ovpn-117-192.ams2.redhat.com [10.36.117.192])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7791C1838E;
	Tue, 11 Jul 2017 16:31:37 +0000 (UTC)
Subject: Re: [RFC PATCH 1/3] configure: disable Xen PCI Passthrough on !x86
 archs
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-arm@nongnu.org,
 Anthony Perard <anthony.perard@citrix.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, xen-arm@lists.xen.org,
 Anoob Soman <anoob.soman@citrix.com>, Juergen Gross <jgross@suse.com>,
 Anthony Xu <anthony.xu@intel.com>, Paul Durrant <paul.durrant@citrix.com>
References: <20170711025703.24194-1-f4bug@amsat.org>
 <20170711025703.24194-2-f4bug@amsat.org>
 <446cc0e3-dd49-e088-85f1-0caf1d42fbf8@amsat.org> <87iniz9byq.fsf@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <82ed455a-8fbe-0270-b3aa-5290dc40e653@redhat.com>
Date: Tue, 11 Jul 2017 18:31:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <87iniz9byq.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.39]); Tue, 11 Jul 2017 16:31:41 +0000 (UTC)
X-TUID: S4g1NjFXOyB/

On 11/07/2017 18:26, Alex Bennée wrote:
>> It seems our minds crossed at the same time since Alex/Pablo fixed it
>> and got merged in master as b5ed2e11ef39 "build: disable Xen on ARM"
>> so this patch is no more necessary.
>>
>> Alex/Pablo, any thought on patch 2 regarding xen-mapcache.h?
> 
> Pass, I know little of Xen on ARM other than I think it doesn't need
> QEMU for device emulation. IIRC the use of QEMU on x86 is to handle the
> weird set of devices you can get on a PC without bloating the
> hypervisor. ARM is a lot simpler in that regard.

Yes, my understanding is that Xen on ARM doesn't need the mapcache.

Another thing being discussed a few years ago was the creation of
qemu-system-xenpv (aka xenpv-softmmu), where the same code would run on
x86 or ARM.  It would never support TCG, so the --disable-tcg patches
would be a prerequisite for that.

Paolo
