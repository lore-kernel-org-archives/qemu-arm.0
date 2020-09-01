Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4430890lfc;
        Tue, 1 Sep 2020 02:52:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylUU6vAwtNFoiEnRVT1an9KLSxacEByYf8MNXPODb4lAXVx/AJVUnFfwiBUye9hM+GTVNS
X-Received: by 2002:a05:6402:b76:: with SMTP id cb22mr1009493edb.30.1598953940678;
        Tue, 01 Sep 2020 02:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598953940; cv=none;
        d=google.com; s=arc-20160816;
        b=HT1YNWE4cPt0voxW9UUzV5aTO94xpKzJPkmIVhqsUsuji3ryOiUbT+Efkkcna5v2IQ
         XrAu5QVd0TG8eEG95GcJeDAacVmcpEH0Px0YV+sx0uNsoXqAza37EBJBzwGUuGjmDaf4
         YJoWIWRBoq95rk3byb/98cIkPyIqJjCtVc6WXbwpt3XJbmY0CKvBXUBMGZVxqdvTCjHP
         sjMmBfjN13NuLPItgCYAOt684I4ulKnPs644oUUWMMIqdrLOgjX5taE0XfBh3kGUGPtN
         kM4jXl3bq3kYohcLlX0ez94RxXFDWOoWzpckYsqHpWtITQzGTGhrCnuyF6sIA7kbMEp6
         olLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=kPjjMvgKBJBV2QMZDnmLwOk8z1FhVrBh83xG46PnkrU=;
        b=yBhrMEPWc1TLJ+m1ADaaqImZdLzFDgGtgyWE4Al2R8V+qIwvJZkkG5FjdY9Bs1/7Or
         OdNRMowR0l49eqkXUD2EE0Wt5QxUm0FUwYhZJt+niyrJqEWJsw1MuQ2GW8Z3Id4B05cM
         MNYgJUGvCPZWGNIJ5LzoXMUKVUahg9vinthKA9mKAgFbTWJE7uCTjFW7isHV3uyLyir8
         abXzb2OKsKAFZyLcHKPc/VWQeUQ3Mg9sSJ/NzC5ulJnclkFGb2W0Hr6ZvbkNXETAnk9c
         h0yfhN2vzDx4tU9c22OC7MMJp+JVtblEXDDcqJ81BxDGj/pDKsrD16zh+TOq3ajQ64ZI
         +xjg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ae3wjZ2z;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id cw20si226322edb.141.2020.09.01.02.52.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 02:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ae3wjZ2z;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598953939;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=kPjjMvgKBJBV2QMZDnmLwOk8z1FhVrBh83xG46PnkrU=;
	b=Ae3wjZ2ze2wOQ225lI6jZmPDIPzTpgAarKYtOaRL+aqYhrPHbL77EtCtIXshjAiehfMNiu
	rfnHl4IKV0e7mG+H6cSi6Cl884bWt+9JcnPMbRwmsBJJwKv9P2vf5r+UgSo0pQtKcQpF7a
	Ann3txNY4cHe/AXp79h1Z/BI7khg31E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-KFMFXwnVNHiSueDYIyPckg-1; Tue, 01 Sep 2020 05:52:17 -0400
X-MC-Unique: KFMFXwnVNHiSueDYIyPckg-1
Received: by mail-wm1-f69.google.com with SMTP id z1so266042wmk.1
        for <alex.bennee@linaro.org>; Tue, 01 Sep 2020 02:52:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=kPjjMvgKBJBV2QMZDnmLwOk8z1FhVrBh83xG46PnkrU=;
        b=ECam8j/RjSXxb0uYEE1xEOPpYaAMD0Xb8SvxBNGtKv8IfS3sBH+YBEgJz/a3yaEhJ8
         y5fZmW4vSjGoQQneSCGWDR+u8tsA8V7etOQmf+/xJWdL/m9hkr/RqHiX3T0inxODdp/A
         nZLV0LFb6NzwsUS/aqSFyf/jLuE+M+R3KbLqfmhGabbgiGVMYHgEhf9QQPU2X04X41uG
         +79chR1ke3uxjzw2D1jIY7FGcU8SCXnKgd/7/ANASvJcYBASsz64HqdRjfR0cVujHbFI
         BAXrHZb2h6X5EZGW5XrsEUOOcjUpcPiWpyYTBLvFhgm7d0BrNVkliQ1oYKlE8camGjL2
         3xug==
X-Gm-Message-State: AOAM530q0R96Cq9wM4l1oR/EOmyrmXdzct2nxmpQ/Jd4cNwQzqlE0RhG
	3lVuyfztCt70bpJdLkYE47OyG81Q+4YppCjDJtw+UO/weKAz71QiuMs9I8aKM+jJsqVRAWUn8l3
	yyuRZNfpxMVqBsR9I
X-Received: by 2002:a1c:b608:: with SMTP id g8mr1035651wmf.106.1598953936304;
        Tue, 01 Sep 2020 02:52:16 -0700 (PDT)
X-Received: by 2002:a1c:b608:: with SMTP id g8mr1035641wmf.106.1598953936155;
        Tue, 01 Sep 2020 02:52:16 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net. [83.52.54.50])
        by smtp.gmail.com with ESMTPSA id c205sm1075474wmd.33.2020.09.01.02.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 02:52:15 -0700 (PDT)
Subject: Re: [PATCH v7 5/8] mips/cps: Use start-powered-off CPUState property
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>, qemu-ppc@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>, David Hildenbrand <david@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <20200826055535.951207-1-bauerman@linux.ibm.com>
 <20200826055535.951207-6-bauerman@linux.ibm.com>
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
Message-ID: <5d327ce2-5f1a-5f68-6103-038254c26b3f@redhat.com>
Date: Tue, 1 Sep 2020 11:52:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826055535.951207-6-bauerman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: ZRztaTsqK3yu

On 8/26/20 7:55 AM, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in main_cpu_reset(), use the
> start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Also change creation of CPU object from cpu_create() to object_new() and
> qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
> possible to set a property after the object is realized.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/mips/cps.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
