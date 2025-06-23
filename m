Received: by 2002:a05:7301:19ab:b0:175:694b:cb76 with SMTP id mc43csp2611612dyb;
        Mon, 23 Jun 2025 08:07:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgxKSKmK+0sRvDr/FX/3Uuk1LanekAsBkqca0mEOr1yr9Q0X/TLvkqdXDyy9B00x5Ng60xLfO5MSZV8w==@linaro.org
X-Google-Smtp-Source: AGHT+IGP1kUnaKsvQK8LePwNnT+Q/J3W2pFMiOozB/NZres5xUUe5/ommRmAm3eTgT/UwdYpzDMX
X-Received: by 2002:a05:6214:319c:b0:6f4:c422:53e7 with SMTP id 6a1803df08f44-6fd0a442292mr225999406d6.8.1750691226880;
        Mon, 23 Jun 2025 08:07:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750691226; cv=none;
        d=google.com; s=arc-20240605;
        b=aKZuz3QE8iFdGr10EGbu4OaFPUjF+v+Ghul+mJjIUxDxI1LSEH77guf4MR+/Dczwiw
         2uSP/mEiQrIeIU6cQn1xIDRcnCmqpZIHUgtXiHQLq/Fee/epDHBi2Rk2/YPzypQYT1v3
         OA6p06g2JFXgDhel3e3xm8Gn163UwRJTKGmHmyAjUBvgQnCmq+Hx6zzvXz4PxSNq0Osz
         wwTpFD8iepihhroKJV/JlkKbsNI9RovTwxKXZ+Y7hgPnTGVJ7533/5S37vFVRoYejb6M
         3wvpaZIRKje90713aNv6ucek36xGOKBJ1vyps9XRt5B8JICsFnj+87LOTp6QmbukYAF7
         yJKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=e8CylTLGHaf3QU81BclTm8+kkuyzBrG/KuFZoBykFJE=;
        fh=FWNGCeD70ZMNiHn4uayoA9cJoDTBstSNDHN3oXh6mvw=;
        b=c8Ize7OdvDlu9f8zjDoEMMdUsct9ECnvjVsh2rzhvXVzwFviEXQggTau6L0LsEjL0W
         J/9imLo0Uk2qALq2QugMPePloaQsLudCLuVJq5vjFeqL94Sqakk50SDYS7D9szYRwKj1
         x8meis8dmMXAkQyyHFGcYwdsp0gqkXYg4MKKMAv9CNtSbuEMB3L/N9zwzB5hqjkgsBtc
         HePOjUNQiV/VI7bHRqkdJLuuZBqV0eE6Vtwlx9C/Os3RWZP4hxmyn9J9Gop+FPjwQ/i+
         PqEX1otGZs8Wx/4c5Wl+PC/wSE269v1PtTjMUWICgV0RMlZr5ppEgUpZ++CdmkcWlPQ7
         6vmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dsIzHGzM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd2075cea9si49522756d6.21.2025.06.23.08.07.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:07:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dsIzHGzM;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750691226;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e8CylTLGHaf3QU81BclTm8+kkuyzBrG/KuFZoBykFJE=;
	b=dsIzHGzMv5F8mMptkJDjyP4fZ5YsOiyAT/k5PHXOecSPgHidaGZB4vXlnSki6hXb56m1QP
	krVlAlw5uyDq5OuRQ1JqtsHeu/BhuEv0hgOm4nY2NzoHI8ic1RTTEWFbxB/LbOl/3Asmng
	lz8C6bp3mEP0MYQPPz0Ih24KNjPClXU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-327-vPhA1J_yPLqwL8iA9oyZjQ-1; Mon, 23 Jun 2025 11:07:04 -0400
X-MC-Unique: vPhA1J_yPLqwL8iA9oyZjQ-1
X-Mimecast-MFC-AGG-ID: vPhA1J_yPLqwL8iA9oyZjQ_1750691223
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d6768d4dso29304105e9.2
        for <alex.bennee@linaro.org>; Mon, 23 Jun 2025 08:07:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691223; x=1751296023;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e8CylTLGHaf3QU81BclTm8+kkuyzBrG/KuFZoBykFJE=;
        b=TAk1I0/+h3bf2etnN4IjhxQQZsBRmRpE2QJ4OsFaIesh15zTV9ZNyiwxW9AGlbxL7/
         TGBJKnz5pnDE4ard6YKQDuuLmWoFpdwlQazD2SmXfGUtGma3+fPhwDdbbc8t1erb7+FM
         HTO8vgs/HU9Oas6h8T/DxzODn055tVfxpa2FlKJKrLEZY9Ia2w6eiC0Ji3NwFxmYSKDd
         gCZ6m3piraaUMz5xzHMJnkkp84vMXcI3VaAhRlp2z90paW09b3oGZf/u6e7nwTN3PF1v
         JEFjgWlDw+s1r4s/zl9ksB6ifjfg1C1qHnqwxmdKLfbZtIBrjPyq/O5AQF5ASAQb54up
         K1CQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGTJYm7+GEb6kYSZ3dRN7EVfXT/wzbzRARE7JYag6PODbotv+RTGUlDnjcZzmlzfDO08cfG0oQpma2UA==@linaro.org
X-Gm-Message-State: AOJu0YwsxUxAL6mh7SQaPsQJ9Gd76x7lP4DCV66dzjh1rIdpuiK42/GD
	mzI4qnbuhnho8dg+J3PvEMAGSqEwUcTlmpcC4poi3Z9/Agc/Aiw2jp82aNba17dAUWJJQ1ZPmZy
	gNY8cYuKm5kv1My5ELDc5THsc28985TW++v6njHUfhoSTQ82SyJiUGPCEBg==
X-Gm-Gg: ASbGncu6XFcNOcoEXFFAKrH3GZmNAixuljDXfJo0qK8b7W8M0tQQTkNXc4QFZfj7VD2
	mwcJYkve1z8jks7ef5slAIgoQlXH/a4sCssud8Yr39aMTnEhjn23SqiTsaXpi0qXkce6MRZz06W
	W5+VCNX5Z3hZWv+hRiH8H8bXVXNF6/JJeeu/AFGzPoumD/TQHu/mYCSo48Z8OIQC+JbQvDAnguw
	Uj4IoyyjCK7oStlwRx3xE29Swr4nwxPSt+u7uCnjUkqEMplZsaBqUBTk8jZBfzFqqtLWmTYgC11
	G/ooFRxEfXvjcayFX2Ap6xOyb57B2hxWyE0tha0KCPABMXQogCQQ0YeVlzSkfYGxtQJrQA==
X-Received: by 2002:a05:6000:22c6:b0:3a0:b84d:60cc with SMTP id ffacd0b85a97d-3a6d1191e51mr10263391f8f.2.1750691223064;
        Mon, 23 Jun 2025 08:07:03 -0700 (PDT)
X-Received: by 2002:a05:6000:22c6:b0:3a0:b84d:60cc with SMTP id ffacd0b85a97d-3a6d1191e51mr10263348f8f.2.1750691222682;
        Mon, 23 Jun 2025 08:07:02 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1187cf0sm9625756f8f.71.2025.06.23.08.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:07:01 -0700 (PDT)
Message-ID: <370742c4-cb80-412f-a9e2-8a1906ac0f36@redhat.com>
Date: Mon, 23 Jun 2025 17:07:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 27/29] tests/qtest/bios-tables-test: Prepare for
 addition of acpi pci hp tests
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, gustavo.romero@linaro.org,
 anisinha@redhat.com, mst@redhat.com, shannon.zhaosl@gmail.com,
 pbonzini@redhat.com, philmd@linaro.org, alex.bennee@linaro.org
References: <20250616094903.885753-1-eric.auger@redhat.com>
 <20250616094903.885753-28-eric.auger@redhat.com>
 <20250620113138.00007531@huawei.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250620113138.00007531@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jpZtQNwbJghdVOqxY1uxcIH_-M_P1X2iPdwnn_G7K1Q_1750691223
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: l1+zYodmTL5U

Hi Jonathan,

On 6/20/25 12:31 PM, Jonathan Cameron wrote:
> On Mon, 16 Jun 2025 11:46:56 +0200
> Eric Auger <eric.auger@redhat.com> wrote:
>
>> From: Gustavo Romero <gustavo.romero@linaro.org>
>>
>> Soon we will introduce a new test related to ACPI PCI hotplug that
>> will use a new reference blob:
>>
>> tests/data/acpi/aarch64/virt/DSDT.acpipcihp
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Unusual sign off chain.  Eric is signing off as handling Gustavo's patch?
> I'd expect Eric's sign off to be second.  Looks good in the next patch fo
> instance.  With that fixed.
Sure. sorry, unintentional. I did not know the rule either ;-)

Eric
>  
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
>
>> ---
>>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>>  tests/data/acpi/aarch64/virt/DSDT.acpipcihp | 0
>>  2 files changed, 1 insertion(+)
>>  create mode 100644 tests/data/acpi/aarch64/virt/DSDT.acpipcihp
>>
>> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
>> index dfb8523c8b..dc3ab24d05 100644
>> --- a/tests/qtest/bios-tables-test-allowed-diff.h
>> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
>> @@ -1 +1,2 @@
>>  /* List of comma-separated changed AML files to ignore */
>> +"tests/data/acpi/aarch64/virt/DSDT.acpipcihp",
>> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpipcihp b/tests/data/acpi/aarch64/virt/DSDT.acpipcihp
>> new file mode 100644
>> index 0000000000..e69de29bb2
