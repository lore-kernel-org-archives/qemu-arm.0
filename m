Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp5327949njc;
        Fri, 22 Nov 2024 04:00:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUt64BLop+dHHRJHuJB8KpUezoIEHRLJqwB8htGa2yhyPpEw/OAEU/kH7KAVosht+pM8xBcHam8VXvxdg==@linaro.org
X-Google-Smtp-Source: AGHT+IE2UECgmwONml7T6bR3rFIoTlP8iP9tL7c9xjzQsGiVzxn2Iv1oh7nSkfJlOPYhIqUEsBjd
X-Received: by 2002:a05:6902:e13:b0:e2b:d610:9d67 with SMTP id 3f1490d57ef6-e38f8ac871dmr1961911276.9.1732276808864;
        Fri, 22 Nov 2024 04:00:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732276808; cv=none;
        d=google.com; s=arc-20240605;
        b=lXcggzTxT7uU09kYDKaUcCOqgB5HhnnB4YR37ZsdsI2yVP+54LcFJMcSZlnm1IJRHx
         7unBrtmbypZXKus157xZdHu67FaH8pjpVhQH+6+wKDR9YGKtiN/xI60frnNK8tVMMgKc
         emOtrb8Cgtz3iPonMRqP/zWhvsZF/Vrsm3jPlxirO2ch5rlW54apoDRIEA5EcCXMpEc/
         yRyzxB76CanmALRuLsaeSZtB8CvBaZHmrbEt40WdQ70WyPnGJrZjMiZKZ/D/DwBVTY3n
         QaV+6wJuvt3jbqCUUSrej+u0otubc8HlshPUPVRpOc36lZmASUhc451NAMo3AdKJpKng
         2Amg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=ImaqswwEAOm8DHGAkB77N8hsQ0mKlAHog5bMnpBMVmU=;
        fh=5V7/4MlvsqOBlmu+lKeX/yui0WxM09WshO1bpji+sVI=;
        b=VahXiFWn05KSth0pE4AgMeLMrLjKZDHmXLeKkvrtILIKdCswxUIS5+h/hy/dK/l3Rx
         d3IRO2Rw5cH4uPkeoBZG3J2sMCySlNZLfnOW4bUzuGb9Kfg34LJQerZM6vm8lrheeE8d
         hwi5HUnaSwVX4QguPr8nUNzXs1f40Zh5m62Ao/i4LseBIfUZGBig1lx1KXwFoOH6hIpY
         BVqeQ9mqtDrUcIpMSJpLTofEyxIp8gBzcLBByyE7yRQBeeAN62UQ/ba+qWgubc5VbRxB
         rEuB905+7XvwKGQHkFIG/TVNYG6SsbXaUhwPgsfjjwJf1/9sABIJcbcCosoU+90Eg+Qg
         ucGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MgmnRyuo;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <clg@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4666fdffe0fsi250971cf.299.2024.11.22.04.00.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 04:00:08 -0800 (PST)
Received-SPF: pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MgmnRyuo;
       spf=pass (google.com: domain of clg@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=clg@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732276808;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ImaqswwEAOm8DHGAkB77N8hsQ0mKlAHog5bMnpBMVmU=;
	b=MgmnRyuoO7Sna5HPmahR9VXulsFlhWTGzm+fLqLTqGv7A16sb12dEoZQzl+198Grb43DTa
	2kEpMYinnYWfEsQqIn2BCNKyUoWimBO0EhJ5oid3T1xVKXpqmtDCKtGQcGFMkhQbHSmVDq
	jjFYI2/hzI1q4XBHVFeQjt8g7iEVSoE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-PYVRZp-ENTqoZIoJEiVD8w-1; Fri, 22 Nov 2024 07:00:07 -0500
X-MC-Unique: PYVRZp-ENTqoZIoJEiVD8w-1
X-Mimecast-MFC-AGG-ID: PYVRZp-ENTqoZIoJEiVD8w
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46360a97a99so28009431cf.1
        for <alex.bennee@linaro.org>; Fri, 22 Nov 2024 04:00:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732276807; x=1732881607;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ImaqswwEAOm8DHGAkB77N8hsQ0mKlAHog5bMnpBMVmU=;
        b=sXdvWPzVcQFagDuLYZsGfpf0dgeo64p5EZ1QWzSV5s49Rb7Y+6XfaFzsByFwtJ9UMB
         kjY2lcpyRNWbwPmyooGgXSbzsFRZtptXBXBMKbe5JGisSLVcD4MlhqjsOZ/d8IYteigr
         XNogBSHoGNKv4ZPxOi1L/1ATWMZek56uHot3ndDyHg+hsB6gJmBULfYcJAxVo1KFYG1F
         fcK11MOyByPHzYv3pvtzRkavSG/9/HKjjQnHXKWfQ/A/MIdpWZns/S9qwLCdjbjwZqOD
         yAPM3eWRtjqQxV+Wt5Pk8XatoaQRmJgqyv92mFExvA0uJ4Fd8wnsIWK5OdFmy36bv42V
         GYoA==
X-Forwarded-Encrypted: i=1; AJvYcCW0y3EOyYK5dyas9jG0wM1nRwy7v8kVXIu811j8v/Tc4nJ6lyk5W2VcWTyysh1Hm90QN2povGs/87cUOA==@linaro.org
X-Gm-Message-State: AOJu0YzZxsLT1Od6PYFDa0OTm8sFuHIDBdX+DudubRdLWoazuRWf7yIY
	BjbtzA6ggsCA0BULxulhsMMGIh/xvTSdtimV5mbD60f9VGZb0fCwvtvnnbAeNa1C4GfmPt9gpm0
	trKLj1/la4NHvDCUVjHLiwOFyy5l4nHn7pXxc1kRgDn6sGXLj2dfqsw==
X-Gm-Gg: ASbGnctRN534XqtLaQ7bgB52JUhl5OWsiaNtAUleCJzubFrOWTlhYJeHSiAgc/l69Ho
	40f0tulQepZLV6FG2B4A9JLcJJMJPuOvRVNkyXjbb76+HC4/bamD2lZ5gbK1F5nJ+eTM4+vY6AS
	66KYhAA2Y40C+dY7N6/n/q6QII2QkLwEBf7c7qB2EiFUG0zQ8O81ZgQyniZMc+ev5H8dlkuE70T
	ghOLcKUYCcoSHI8P38Rqi5YhEFCsEKPDDKBL++6YHjO5Gxgpto0R15qvf0Xh3iGfWmcFRtpfwjO
	Wme8+oZsQIZX
X-Received: by 2002:a05:622a:1817:b0:460:90aa:ba8e with SMTP id d75a77b69052e-4653d63ec53mr35348171cf.52.1732276806275;
        Fri, 22 Nov 2024 04:00:06 -0800 (PST)
X-Received: by 2002:a05:622a:1817:b0:460:90aa:ba8e with SMTP id d75a77b69052e-4653d63ec53mr35346691cf.52.1732276805475;
        Fri, 22 Nov 2024 04:00:05 -0800 (PST)
Return-Path: <clg@redhat.com>
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c? ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4653c48fd02sm10502501cf.81.2024.11.22.04.00.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2024 04:00:05 -0800 (PST)
Message-ID: <f30aa80f-613e-4a01-94ce-b2779349ece7@redhat.com>
Date: Fri, 22 Nov 2024 12:59:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/39] maintainer updates for -rc2 pre-PR
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Alexandre Iooss <erdnaxe@crans.org>, qemu-riscv@nongnu.org,
 Thomas Huth <huth@tuxfamily.org>, Bernhard Beschow <shentey@gmail.com>,
 Eric Farman <farman@linux.ibm.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-s390x@nongnu.org, Niek Linnenbank <nieklinnenbank@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-rust@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Markus Armbruster <armbru@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <anisinha@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20241121165806.476008-1-alex.bennee@linaro.org>
 <2b8f6079-f2ca-471f-8580-43352437625d@redhat.com>
 <a3935ca8-5a44-4f2a-a414-aaa39f8e193c@redhat.com>
 <0cbbec0d-5be0-4ec2-8791-470c70d93e33@redhat.com>
 <ae1ee2e9-4be2-49ae-a5dc-2bc6e72a8506@redhat.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSJDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQHJlZGhhdC5jb20+wsGRBBMBCAA7FiEEoPZlSPBIlev+awtgUaNDx8/7
 7KEFAmTLlVECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQUaNDx8/77KG0eg//
 S0zIzTcxkrwJ/9XgdcvVTnXLVF9V4/tZPfB7sCp8rpDCEseU6O0TkOVFoGWM39sEMiQBSvyY
 lHrP7p7E/JYQNNLh441MfaX8RJ5Ul3btluLapm8oHp/vbHKV2IhLcpNCfAqaQKdfk8yazYhh
 EdxTBlzxPcu+78uE5fF4wusmtutK0JG0sAgq0mHFZX7qKG6LIbdLdaQalZ8CCFMKUhLptW71
 xe+aNrn7hScBoOj2kTDRgf9CE7svmjGToJzUxgeh9mIkxAxTu7XU+8lmL28j2L5uNuDOq9vl
 hM30OT+pfHmyPLtLK8+GXfFDxjea5hZLF+2yolE/ATQFt9AmOmXC+YayrcO2ZvdnKExZS1o8
 VUKpZgRnkwMUUReaF/mTauRQGLuS4lDcI4DrARPyLGNbvYlpmJWnGRWCDguQ/LBPpbG7djoy
 k3NlvoeA757c4DgCzggViqLm0Bae320qEc6z9o0X0ePqSU2f7vcuWN49Uhox5kM5L86DzjEQ
 RHXndoJkeL8LmHx8DM+kx4aZt0zVfCHwmKTkSTQoAQakLpLte7tWXIio9ZKhUGPv/eHxXEoS
 0rOOAZ6np1U/xNR82QbF9qr9TrTVI3GtVe7Vxmff+qoSAxJiZQCo5kt0YlWwti2fFI4xvkOi
 V7lyhOA3+/3oRKpZYQ86Frlo61HU3r6d9wzOwU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhW
 pOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNLSoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZ
 KXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVUcP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwp
 bV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6
 TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFU
 CSLB2AE4wXQkJbApye48qnZ09zc929df5gU6hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iS
 YBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616dtb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6g
 LxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7
 JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1cOY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0Sdu
 jWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/Jx
 IqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k
 8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoXywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjK
 yKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9j
 hQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Tad2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yop
 s302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it+OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/p
 LHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1nHzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBU
 wYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVISl73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lU
 XOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfA
 HQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4PlsZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQ
 izDiU6iOrUzBThaMhZO3i927SG2DwWDVzZltKrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gD
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <ae1ee2e9-4be2-49ae-a5dc-2bc6e72a8506@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W_dHaFhpUWbBH4e6TbK7bSQRoR6i1tQg42nA5LOTTps_1732276807
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: Vb/21bQ+STw2

On 11/22/24 11:47, Thomas Huth wrote:
> On 21/11/2024 22.46, Cédric Le Goater wrote:
>> On 11/21/24 20:10, Thomas Huth wrote:
>>> On 21/11/2024 20.03, Cédric Le Goater wrote:
>>>> Hello Alex,
>>>>
>>>> On 11/21/24 17:57, Alex Bennée wrote:
>>>>> This is a mostly testing focused set of patches but a few bug fixes as
>>>>> well. I plan to send the PR in on Monday. I can drop any patches that
>>>>> are objected to but I think its pretty safe.
>>>>>
>>>>> Contains:
>>>>>
>>>>>    - Daniel's clean-up of functional tests
>>>>>    - Another avocado->function conversion from Thomas
>>>>>    - Update the tuxrun baseline images
>>>>>    - Minor fix to the rust pl011 device
>>>>>    - Documentation clarification on identity
>>>>>
>>>>> The following could do with some review:
>>>>>
>>>>>    tests/functional: update the x86_64 tuxrun tests
>>>>>    tests/functional: update the sparc64 tuxrun tests
>>>>>    tests/functional: update the s390x tuxrun tests
>>>>>    tests/functional: update the riscv64 tuxrun tests
>>>>>    tests/functional: update the riscv32 tuxrun tests
>>>>>    tests/functional: update the ppc64 tuxrun tests
>>>>>    tests/functional: update the ppc32 tuxrun tests
>>>>>    tests/functional: update the mips64el tuxrun tests
>>>>>    tests/functional: update the mips64 tuxrun tests
>>>>>    tests/functional: update the mips32el tuxrun tests
>>>>>    tests/functional: update the mips32 tuxrun tests
>>>>>    tests/functional: add a m68k tuxrun tests
>>>>>    tests/functional: update the i386 tuxrun tests
>>>>>    tests/functional: update the aarch64 tuxrun tests
>>>>>    tests/functional: update the arm tuxrun tests
>>>>>    tests/functional: Convert the Avocado aarch64 tuxrun tests 
>>>>
>>>> Do you think we could include patches 2-4 from this series ?
>>>>
>>>> https://lore.kernel.org/all/20241112130246.970281-1-clg@redhat.com/
>>>>
>>>> Only patch 3 lacks a R-b.
>>>
>>> I had a question on patch 3 and a suggestion on patch 4 ... could you maybe address them first? Thanks!
>>
>> Oh Sorry I forgot.
>>
>> I did address patch 4 in my tree ... In Patch 3, EXTRA_BOOTARGS was
>> added by Alex IIRC to work around the console issue. We ended up
>> adding the sleep call. I can resend tomorrow.
> 
> IMHO v4 looks fine now ( https://lore.kernel.org/qemu-devel/20241122090322.1934697-1-clg@redhat.com/ ) in case you want to pick it up, Alex.
> 
>   Thomas
> 

Here is a check-functional run with this series and the v4 I sent :

   https://paste.debian.net/1336417/

This system is fast so the timeouts are more certainly tests failures :

   func-sh4-sh4_tuxrun		?
   func-rx-rx_gdbsim     	https://gitlab.com/qemu-project/qemu/-/issues/2691

Thanks,

C.
