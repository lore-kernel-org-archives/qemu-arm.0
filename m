Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4430657lfc;
        Tue, 1 Sep 2020 02:51:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywBfJOMivlITUHvtJ9b5tcyC5w6HhUQDX9hoqoA1oTaNKqSTGZTMcmaninsd83ldHGfjdj
X-Received: by 2002:a25:cc5:: with SMTP id 188mr1460733ybm.326.1598953915283;
        Tue, 01 Sep 2020 02:51:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598953915; cv=none;
        d=google.com; s=arc-20160816;
        b=ujqzBCyf0Zq1vCLYoeMGj5PsZ7su69oMiXcWJsakv09cknJy5mzfSBIvBpyCEhwXRh
         dAWXCLK0VkugW4DUvMVBabNZmcN53IMKlwkM7XYNCGz5A52VbufedBZ+kNWpcYbvJpYF
         hyae0Flewxdl6BzgtcbavbTOY/FaNjLG4KjmJaEytuG+JRslERlzd9azqKSrsJ6CB/2o
         ev8Sl//XZUvXcWdGVhK6xVybYJWaYeA4y7smHHfqd2d35Rj5JuIyz9Ohs3Stg9px+NSV
         op2yIqQAQ6JloiuKhr2muab8upQoO658JKD80bl6qIotY6O/gCWCsonaipo1JA7q/cU0
         U/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:content-transfer-encoding:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=NWH0FVOZ4eV1moSjNBeSjjsRcknOmRVzvIu/WuwPeyE=;
        b=0dWw/HqYyk3Kw7GiZuotc3oVAJ5yzGZf06SXEk8JLI0/ndMDhNnRH2IULS9YhS4004
         oJ0Q/uQavjoXNMXAtpDlwr99Yf71FpQtvgBT+zHMaWAinYhXOUIn6lq0VyXH3aNtFlhe
         k2p+jiD0IHf1NG9iGhiZokah0YUcw/Cb0w8WtAx1KZbhaC9tTC+rIeYbEHanjFYyBffZ
         H6BlZZnCHoG41HF4bxWec4Rx3fivu+kAp6MByDHh5EnZTlfoFYPDu992+hcwQ/LXU3gz
         Nv/gt1EfGxSUgCiLWXtJEyM7YuHS8uw8+F0HfXWExoAtGM5y0Iavd30r9fidK7M7JVgC
         LMFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LFVI7B1q;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [205.139.110.61])
        by mx.google.com with ESMTPS id f14si590597ybg.476.2020.09.01.02.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Sep 2020 02:51:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) client-ip=205.139.110.61;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LFVI7B1q;
       spf=pass (google.com: domain of philmd@redhat.com designates 205.139.110.61 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1598953914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NWH0FVOZ4eV1moSjNBeSjjsRcknOmRVzvIu/WuwPeyE=;
	b=LFVI7B1q+Bg8MAuzUR9pDlpuHahN0BzNFSrr1bJ27CdToIfjAO9Xr/6fgjfcKThBI773eb
	qDwOFUEIMrlKh8OnLpAj6SsuFkbF2ecXXoIy9tbahXm60Y9heF9poyWw1NBH6Se8dIBTHU
	spgrxeZL+6a8XzOAmhsMi7bSJndRpTQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-Rfry1NG5P-W5gyL5UrtHEQ-1; Tue, 01 Sep 2020 05:51:53 -0400
X-MC-Unique: Rfry1NG5P-W5gyL5UrtHEQ-1
Received: by mail-wr1-f71.google.com with SMTP id n15so349541wrv.23
        for <alex.bennee@linaro.org>; Tue, 01 Sep 2020 02:51:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=NWH0FVOZ4eV1moSjNBeSjjsRcknOmRVzvIu/WuwPeyE=;
        b=KLpEgIWYoY+3G3c6iZcc14JLYygsakvNV/CTPAG6lMl65R09yyFT7yyD3DWTfEWJTg
         cqXC/GmPjLt/2ijml0q5bCCj26jnkC4RyTXiaDIsgWhKFpT5VzjCiYREddy07KvOO9aG
         vKKA6hVZX7d74Wub1H4x0VvjNjZtRsuaY5zacmk3KKqnNTLaEhZ9wQdKohZDBKhHdjrN
         QKIPYeJJ8EjE5wvOT+E/MXP6yVA+Yji3ndmtrxJ1PdV4EtGCjM+UTldkjMZAPj+Unzz8
         eOmEOEuqXmVey7oqyhwizb24kywdufQSBLkp5DcHfaHQOOg3ZuiDfGs85rEKUEOCdJW+
         gIcQ==
X-Gm-Message-State: AOAM5334SRPyomkgpULLx1HvgpBsU9TqBk0Mc2rlLJFugtf0FWYuJVto
	BsBmFU3SGHjEzUjIaYrJva5a0e+puptRlT/rGSD9GiTC0eLOESe1Q9RdG4zf0EY9M1qh32XVyA/
	LpwqaIreAPuqRiotN
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr968120wmj.116.1598953912083;
        Tue, 01 Sep 2020 02:51:52 -0700 (PDT)
X-Received: by 2002:a7b:cd05:: with SMTP id f5mr968094wmj.116.1598953911908;
        Tue, 01 Sep 2020 02:51:51 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (50.red-83-52-54.dynamicip.rima-tde.net. [83.52.54.50])
        by smtp.gmail.com with ESMTPSA id f1sm1526216wrt.20.2020.09.01.02.51.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2020 02:51:51 -0700 (PDT)
Subject: Re: [PATCH v7 4/8] ppc/e500: Use start-powered-off CPUState property
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
 <20200826055535.951207-5-bauerman@linux.ibm.com>
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
Message-ID: <eed4a3dd-2431-8f58-f716-067e86ddcdef@redhat.com>
Date: Tue, 1 Sep 2020 11:51:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826055535.951207-5-bauerman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TUID: 0NvkZEF7H81D

On 8/26/20 7:55 AM, Thiago Jung Bauermann wrote:
> Instead of setting CPUState::halted to 1 in ppce500_cpu_reset_sec(), use
> the start-powered-off property which makes cpu_common_reset() initialize it
> to 1 in common code.
> 
> Also change creation of CPU object from cpu_create() to object_new() and
> qdev_realize_and_unref() because cpu_create() realizes the CPU and it's not
> possible to set a property after the object is realized.
> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  hw/ppc/e500.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
