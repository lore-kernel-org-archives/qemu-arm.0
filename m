Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp818974njc;
        Fri, 20 Jun 2025 04:29:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXC4y98+0PYzyS/Gvg484UqQMyWypq804GBtYjwySSKI/KfKVGWSj0GHlz7+eM31ctfDM6a2u9q+idJ+Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGJbh9+CP+QSOXBzINtN5xe0iulRR+dzR2NXkBcw2doW4cerIqusv0LECaQ2obDjLvD2U4p
X-Received: by 2002:ad4:576a:0:b0:6f8:b4aa:2a59 with SMTP id 6a1803df08f44-6fd0a558937mr37635746d6.21.1750418962260;
        Fri, 20 Jun 2025 04:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750418962; cv=none;
        d=google.com; s=arc-20240605;
        b=ZBZfLSRsXW4CMOc3L5LrYyw5+n+1PLqmH8oC4xdRAWw7Iq/yF9vS4uRZOg9eymkPB2
         OqWH+zmrZ2Q9DrYiHyvkWofOKWc6z2K6rW5g39G30n1da53QXempBbgYz7O3GRx3stmt
         CHnWqbsYc5QHGxMAGvuP+wtURbFS+v9gNQ6OdtjOUx6vNMWpTGc1lg3dIt72w0yce4b+
         toT6pzF69qHoXO3GYZ2URJQE0s9pgM0q8SUeAYBpgHzVqe5BsjhmTq5w/ALoJiZtYHep
         BkkrzToS4Ae1twQhsQc0lt7TZ99qUXEqV4lrBmjMrtNEY2eFRtKI9tFOIZ6CjhyFR3GT
         2SaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=x0ZVIkog388IuZ2NvXh1vPSTorhXglVLMwf7UZ23OQI=;
        fh=dgg03Fro00U6/GoF/tcJBZE2F7HfDIxunW9xGiIiRzQ=;
        b=h3LqL0MkXCkcWGG3EFQVuwLV3oOO9xt8pNiKoqevoQZSiJOGj+DSLmokfHsBuia62i
         sCg7hHG1PknSp9h1If1bSKG4S0/KlyhMdZNHzCVge4v+4fBc/WrDcNqZbAREVK6OVi9L
         HtTEV++mePKS1Dhe5sOrY0jqjwS8hH0UMStEWQfl4aSR8qzbFHmORvc79Brf8IWbz2bh
         USnusIjLaqAT8wvuWe50K6cEH1UVj0xAL//ZnGoKBHbjiuer7u4wC4nd6islco3KPH/+
         YRECWz0umUwd+45SBlpI0qPKrUTSLK6DW01MNKTyw+B3ofenw0/NBjwg2bk10tnXb88z
         rfTA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OUQQmC/8";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd09530af3si20161666d6.203.2025.06.20.04.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 04:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="OUQQmC/8";
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750418961;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x0ZVIkog388IuZ2NvXh1vPSTorhXglVLMwf7UZ23OQI=;
	b=OUQQmC/8J3LNCI+aoXFSaA28ZPUxspq1TLkHDy5tCM6pNlrgy9WvwUoZrT8C+S26eLDydv
	IwaRmU7fnebR9RyPo/WIq0wBGU1210liFo/mW/xHaK3vv0OYRJJbT5t8ZSy8ZR3a07BBI3
	TfuR2KdJfHUitrruX3HXt59xVsJ05HY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-xk-qAyknOt-8tGZoJk8peA-1; Fri, 20 Jun 2025 07:29:21 -0400
X-MC-Unique: xk-qAyknOt-8tGZoJk8peA-1
X-Mimecast-MFC-AGG-ID: xk-qAyknOt-8tGZoJk8peA_1750418960
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43eed325461so10768035e9.3
        for <alex.bennee@linaro.org>; Fri, 20 Jun 2025 04:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750418959; x=1751023759;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0ZVIkog388IuZ2NvXh1vPSTorhXglVLMwf7UZ23OQI=;
        b=Yny20x7qBO8x4/wFm0xoO2CycAETEiZSWPDF+ViJtIYVWw0UeF8XvT+cK+Ww21oQtT
         hMt3zIBbJdwoNiZYGbailUmNsDLCUNDhCRDqIS4upOXHVbP/ZSDIHVKBM0m4S36SE7+M
         7nG4+OPOJeHXtEh5O95fIcLCaYeicJINtaSGlRCgrV7rcTFAWYYjN/UgnMWQir3yt7OG
         fqiKvWG7ZfhErTaU/zkN22nNVSPbJ34vFesf4bEwvge3xWN8Ejq/o9gcDg1Bmg+eUr6g
         HwDXzcg3HuolJ/JKzUWv3si5svLz2PkG5DiZfExK21X1CVc/70sfa2lB4W9uc7qQD7h7
         dzvw==
X-Forwarded-Encrypted: i=1; AJvYcCXOndP87gIfFec1ZIVYpMQ8eRr9h+wSr7B2LkT9f5mmFCXN8rJ1tQPGDpUB96yM2cSLw9T6oqU+8YiqHQ==@linaro.org
X-Gm-Message-State: AOJu0Yw4RmB36K2UGtaZvgwL0bCcoDfMkcUVuBQV674gT7uDPzVDEQkl
	6bW7XerGvCJ7OK7aoubZIPTtEqtUl0KubfoAHWBLKakM1Urgfb9jzh8xVD2aUDHn2prLPhngmaK
	r74J5Au3qf1RDtz6Kc+UgrwkUkZIdQ7Aq9nvK6JXFK7ZO944Qjh0ZvS3tEwwWq4YXtw==
X-Gm-Gg: ASbGncslrdyRxvM8qEOYt1dFswU7QYVch9CSx7SvHqWSTKApehfV5eOxb6rV6ji2xxm
	mNEoN+UV8ZKjn65Y1k3ggO4uKqy4EXVfgaVvrmWzzBqEiwi3alm+AxU+C4exdNTQB5v/CD8ewEL
	DXBUMmHBq3ojY6FvnVVVp0vKYGn0HFHFdxE8p1XbwIlJoYawWqPFB8kpbLxaBByD8gS7VNLH0pj
	ip0DZknfHGTRd6olE595eI0B/qxFz3Iq3s6YIqQQMF0Kwuf9EiGglZKW+zkPZ7SH5u13KZkVutX
	t5tl518zp4nIc0wkDfvOF/WjkdgL5Y/ZXfwG+6mgTEwYM4uC+5VqG+ZDE0okgL7B88LacA==
X-Received: by 2002:a05:600c:3b15:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-453659c3b8cmr19850985e9.5.1750418958954;
        Fri, 20 Jun 2025 04:29:18 -0700 (PDT)
X-Received: by 2002:a05:600c:3b15:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-453659c3b8cmr19850725e9.5.1750418958550;
        Fri, 20 Jun 2025 04:29:18 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ead202asm56021705e9.27.2025.06.20.04.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 04:29:17 -0700 (PDT)
Message-ID: <4a2ae027-aff2-4e8f-aac3-4e8748bdcc52@redhat.com>
Date: Fri, 20 Jun 2025 13:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 05/29] tests/qtest/bios-tables-test: Prepare for
 changes in the DSDT table
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-6-eric.auger@redhat.com>
 <20250620094932.00000b74@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620094932.00000b74@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PbiZbGtU6v2vCDlcpPYFBNQoKTl4_Hxo6xwKYfnj_lg_1750418960
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: 6xSZk/Rcrnz5



On 6/20/25 10:49 AM, Jonathan Cameron wrote:
> On Mon, 16 Jun 2025 11:46:34 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>
>> This commit adds DSDT blobs to the whilelist in the prospect to
>> allow changes in the GPEX _OSC method.
>>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> FWIW given what this is and the involvement of foxes ;)

:-)
>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Thanks!

Eric
>> ---
>>
>> v2 -> v3:
>> - fox for microvm
> An excellent addition to any microvm.
>
>
>
>> ---
>>  tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index dfb8523c8b..75f057767e 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1 +1,7 @@
>>  /* List of comma-separated changed AML files to ignore */
>> +"tests/data/acpi/aarch64/virt/DSDT",
>> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
>> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
>> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
>> +"tests/data/acpi/aarch64/virt/DSDT.topology",
>> +"tests/data/acpi/x86/microvm/DSDT.pcie",
