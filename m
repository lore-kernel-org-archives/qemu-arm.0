Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2584181lfy;
        Sun, 16 Aug 2020 22:24:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlKTNTT4YHF52+Zf04iQuHKDAVPtNXkUH5fMcCenXceZhB0MYdM+sTqZKGl8JP1M5DsE7Z
X-Received: by 2002:a25:8481:: with SMTP id v1mr18823406ybk.203.1597641890401;
        Sun, 16 Aug 2020 22:24:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597641890; cv=none;
        d=google.com; s=arc-20160816;
        b=QzPUdrzTrXtxNRkdV7t2FJ6K+EZKCn3VmKplyWlS2x1lTe3eWKwBw4vto+QDKMDn6W
         TsEFrFTHwhIn2dAzF8uZcsgsVOvay8c1UL3nvYsU6N7ZEY5wsA7UItpEoDAatx/1imm1
         ICL1ytabxF/LDVU9egfSLDG7khfYvCuuHNzzEMheenPHn3zqJNnQTnBczFQ35YYBcoCu
         NZx45XkBk4JMIWVlbOTTR8YcZs5zXAhBpvyHO0tpJLLqWz76jXXCJWZ/3FEuDv4QrHvZ
         IAy/+v7VJh0QcyxaM6CpYfY2rx4Qu3Yy4OveKxZAn2kNMJvhscf+xj1c41dlCT2W1WgQ
         VvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=t8sSNWEgbGqHQQao5jWuxMb/IzyK23atDvjGWJkZhe4=;
        b=SmCrl6d00vI7aPu0l5zTIbmkXLO+jbqxz47Zj5KkG2y8AAPXA8pAEPGILnRA6/I62H
         1YbhLd6iq6P3dE6O5Kyb3QjL0o2JRAEWyMA5Nkgz+OPe9Erlek0ePndbY3o8wrfToHcl
         h0oDg0L/SeW8NLmuEv7pTx7o3N2K6nfYjmgqs7BaI/+SuWstZXoizP8br35J2awOYs+a
         igzo3YIpV/akX/GFkdEEtyxQ7dWYyU0/js57NtjNNvt4EcYZl8bWLSaN8UWOnRvqnLOb
         S7CJXLUdmq4KnMnCwGJyXvUBEmJP9Efn9wzcRKjJHLomPhNJp9bi3yW1h/9BYy3Qv0kb
         rOOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JMw/r7T4";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id b12si16737711ybm.49.2020.08.16.22.24.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Aug 2020 22:24:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="JMw/r7T4";
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1597641889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=t8sSNWEgbGqHQQao5jWuxMb/IzyK23atDvjGWJkZhe4=;
	b=JMw/r7T4tVl3LV95xazjL2sUEb1CBAx4jRBwjQVaokJsEh7iNbEB3XIrSbiVramSGRc8UV
	WJczzJn0WiI+6LfrnFHmqT9PEWB09sQToWPqruMO4QDtN5xzO/TA0foaKeCPMZIhUQBEv5
	Z7cAYBBO3jQeGqaxfUTDUaqZbE/mgIY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-otEY8Nz9MM2gfb4T32lraw-1; Mon, 17 Aug 2020 01:24:48 -0400
X-MC-Unique: otEY8Nz9MM2gfb4T32lraw-1
Received: by mail-wr1-f69.google.com with SMTP id f14so6441235wrm.22
        for <alex.bennee@linaro.org>; Sun, 16 Aug 2020 22:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=ZYpalzqwUoNBePZOpV7je+sSd/fyQW+gkbORBclRMMY=;
        b=M/p1rYCwpB9OYM0alW5xSkf/9QQY9/Ma3lhbtGk2CcdX3MNfMhuF1Zt+e/WNF8MQtY
         H+IuyqhtddxVmkYloDlyu1bQIK5fkmc3jF4Pa58+BDZv0hjm/CtTW45hWW5+IlreQW39
         GSQPgm0NdnbB0ScVeGq/KGFrgPhAe8zNnMO2ouB1TwA6hVRh7TuSGeeMZ/3+nuPjuUSB
         MrAsI9eyYqjHxBmqWcTyXwDe6MQ+OYXLEXq/z8oBo7Gc+grEpIqss9H/seJowpc35iGP
         Jtvkq+mLm/kzaiY7PCQ5xz9+CKBQhMGVNH9zbUMdCoUqylj9nr9HxpADtgpUBQ3ZCvz2
         0cyA==
X-Gm-Message-State: AOAM5337YVtHzyyLwaIBjFGEvaSPpyjLHvqq3moxazQKEioqKqxYMVUs
	fn6eLV0F9U5XsR+k7pa8DDkxqXovoF93U3i7yD72D1sh8nYUiwVzP1hpR8S+WfX5hzAjvP+1QJF
	oglWREw8BJERM02TQ
X-Received: by 2002:adf:f812:: with SMTP id s18mr13848456wrp.96.1597641886981;
        Sun, 16 Aug 2020 22:24:46 -0700 (PDT)
X-Received: by 2002:adf:f812:: with SMTP id s18mr13848440wrp.96.1597641886788;
        Sun, 16 Aug 2020 22:24:46 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (121.red-81-40-121.staticip.rima-tde.net. [81.40.121.121])
        by smtp.gmail.com with ESMTPSA id c10sm27697729wro.84.2020.08.16.22.24.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Aug 2020 22:24:45 -0700 (PDT)
Subject: Re: [PATCH v3 0/8] Generalize start-powered-off property from ARM
To: David Gibson <david@gibson.dropbear.id.au>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Cc: qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth
 <thuth@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Cornelia Huck <cohuck@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>
References: <20200723025657.644724-1-bauerman@linux.ibm.com>
 <20200817044730.GK12805@yekko.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <83ebefab-8bdf-2584-53e6-e4fa0f540109@redhat.com>
Date: Mon, 17 Aug 2020 07:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200817044730.GK12805@yekko.fritz.box>
Content-Language: en-US
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.003
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8bit
X-TUID: Q9RkpTOwRFLI

On 8/17/20 6:47 AM, David Gibson wrote:
> On Wed, Jul 22, 2020 at 11:56:49PM -0300, Thiago Jung Bauermann wrote:
>> The ARM code has a start-powered-off property in ARMCPU, which is a
>> subclass of CPUState. This property causes arm_cpu_reset() to set
>> CPUState::halted to 1, signalling that the CPU should start in a halted
>> state. Other architectures also have code which aim to achieve the same
>> effect, but without using a property.
>>
>> The ppc/spapr version has a bug where QEMU does a KVM_RUN on the vcpu
>> before cs->halted is set to 1, causing the vcpu to run while it's still in
>> an unitialized state (more details in patch 3).
>>
>> Peter Maydell mentioned the ARM start-powered-off property and
>> Eduardo Habkost suggested making it generic, so this patch series does
>> that, for all cases which I was able to find via grep in the code.
>>
>> The only problem is that I was only able to test these changes on a ppc64le
>> pseries KVM guest, so except for patches 2 and 3, all others are only
>> build-tested. Also, my grasp of QOM lifecycle is basically non-existant so
>> please be aware of that when reviewing this series.
>>
>> The last patch may be wrong, as pointed out by Eduardo, so I marked it as
>> RFC. It may make sense to drop it.
>>
>> Applies cleanly on yesterday's master.
> 
> This series appears to break the Travis build for a MIPS target:
> 
> Unexpected error in qdev_prop_set_after_realize() at /home/travis/build/dgibson/qemu/hw/core/qdev-properties.c:30:
> qemu-system-mips64el: Attempt to set property 'start-powered-off' on anonymous device (type 'I6400-mips64-cpu') after it was realized
> Broken pipe
> /home/travis/build/dgibson/qemu/tests/qtest/libqtest.c:175: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
> Aborted (core dumped)
> ERROR qom-test - too few tests run (expected 8, got 0)
> /home/travis/build/dgibson/qemu/tests/Makefile.include:650: recipe for target 'check-qtest-mips64el' failed

Good catch. hw/mips/cps.c, hw/ppc/e500.c and hw/sparc/sun4m.c are
incorrectly setting the property after the cpu is realized because
the cpu is created with cpu_create(). We need to create them with
object_initialize_child() and realize them manually with qdev_realize().
