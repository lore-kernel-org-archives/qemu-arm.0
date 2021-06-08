Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4215014lfa;
        Tue, 8 Jun 2021 01:33:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzrmL8rGrDgyoCmyxhe9HQhYvoQrfx3VaUwd5kzOMIGZREIOz+9kkZUZYgRr6PWKsbHxIJ
X-Received: by 2002:a05:6402:188:: with SMTP id r8mr24243859edv.75.1623141220477;
        Tue, 08 Jun 2021 01:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623141220; cv=none;
        d=google.com; s=arc-20160816;
        b=dE2xw1oxYw4H5hLQcs7I4ocBRUPdTeqdsi0GkxlwjHXxGlV9k9sAqnfkEqSfmhZ1rH
         dQKDW8dU2prgQGF2znjm59jzjmvb7uZ7eB5KbdaOFnjyob2uW1AsF5eZtnetC9a/Piwv
         wpFhU2QBo9FB7WPB6R8D8bVBbOmH9sSkW8VWAZmD2WLHmEfJrr/cQHUqJkkfKL/Fox5j
         UT/3gIEzX7f6DsUbR2dZgnATt7hBPXDJA+8bHrVbfQCLmJyD7OHcn16l40Ju4PVMHKYg
         aDYTSAqfVcRTLzEjEVJ34lBOYHhBfl+GGDBh0IDW3R5lSk3mmV2fMeSiGpGo11+0XD+c
         Wljg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=nwr7JmP8IaxJeEBeAOVdfRM2v1y/FhFYN/LoEBtDjjc=;
        b=yzrOuHHMhiUU/h/A19MH18xVYFZdKiiEk3zMZke+UxTucN2+a1GXNWvYp+7UzmLfr1
         vPiKsP+fJ9MFbvdfdT54ZjiLoOrU7RjtjqSD9j9MTKhhWhNXX3HfXPsZO7HEX3IMY8nW
         lZL8mO6MZQUk7/FlAuid0jgyOMbn1EUwS66v7nZC8WHlrybk0kvS5+X9V9Vwx+HBUApn
         n45iNArG8GHbIXa3/oUGCpxKohkcU3BuQccnq8OAwk3JTl+ePrE00tAIhU/rr6rs9iio
         E0uuzXQuaoRtdVRQaJruxfdKZj/CGtFKo569tBIO6Sa0xr/ckzbQE/n5wTQkdWP6eyX9
         NTaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IXwcSHp1;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id n16si14210327edq.422.2021.06.08.01.33.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:33:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IXwcSHp1;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623141219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nwr7JmP8IaxJeEBeAOVdfRM2v1y/FhFYN/LoEBtDjjc=;
	b=IXwcSHp1tVPHCLMBJSPgv0yUgLsPoYYWZk9KYSRcIiT+wlp58pUzOs6FWGOznacWC18kYI
	CXsOBcL8wVvBt+i8PLZKBIVVo8cZhWoqW8A80Xd/eNjcHxiQZl6t51Ae4eWd7/a7/h+84M
	uW+2s+3z91d2SH4zlagaV81Ic6rgofk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-65-r64ZF838MdmQ4ihVw9DYiw-1; Tue, 08 Jun 2021 04:33:38 -0400
X-MC-Unique: r64ZF838MdmQ4ihVw9DYiw-1
Received: by mail-wr1-f70.google.com with SMTP id d5-20020a0560001865b0290119bba6e1c7so5136501wri.20
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 01:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nwr7JmP8IaxJeEBeAOVdfRM2v1y/FhFYN/LoEBtDjjc=;
        b=S8JmhMHWn9IBwoe71sFQUv9slzSSe/nUZxC90wRliOU3/ZEcm0iX8WNCdYmd1H59GG
         reDoEt3S5tmnwPoUUXkaSEAEvR4DpxDUd7YILJywo3aprO8G3S/2DDTqE5Qs95mLjCvT
         ITw5zdqW9JDpN+j68Qpt8Imzu/3hriHoreyZcF54scicrWUkwi0y41+HzScHyMGDVn2W
         rLQGMzW0pk71MUqTisP41a9FRsbZ8NGOzl5mq2npRQNPoDOlpHoCE3yG/xlm2PtpKSaU
         nm4L1KouplTVtTJsiFrqHox48uRXqCf+b0Vgy7iXHvXcE7SVaoL9Vmb/OFDrd9bXXLcU
         rP8Q==
X-Gm-Message-State: AOAM532yzbX+wg+rp0EwwWwkvIhmouh/4KmBiXDdbNeFh813ph4mTgJr
	RfswTxSFIXiiLzjmZ06o5ivtJqk7TGeF/hmJx8oroYUcgN0s0yWZR3QD3q7MLUzE0nlgXsbDDAT
	Ys7wFrajnCJ0nnSeA
X-Received: by 2002:adf:a489:: with SMTP id g9mr20983685wrb.103.1623141217083;
        Tue, 08 Jun 2021 01:33:37 -0700 (PDT)
X-Received: by 2002:adf:a489:: with SMTP id g9mr20983677wrb.103.1623141216983;
        Tue, 08 Jun 2021 01:33:36 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id g21sm20092414wrb.46.2021.06.08.01.33.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 01:33:36 -0700 (PDT)
Subject: Re: [PATCH v16 09/99] qtest/bios-tables-test: Rename tests not TCG
 specific
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-10-alex.bennee@linaro.org>
 <b6c4efd5-4ba9-48e0-e9fb-c821df7db5cf@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <8f2e1403-35d6-833a-080b-95b89ce43db3@redhat.com>
Date: Tue, 8 Jun 2021 10:33:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <b6c4efd5-4ba9-48e0-e9fb-c821df7db5cf@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: Zd4VfqtSvboa

On 6/7/21 3:39 PM, Thomas Huth wrote:
> On 04/06/2021 17.51, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Various tests don't require TCG, but have '_tcg' in their name.
>> As this is misleading, remove 'tcg' from their name.
>>
>> Reported-by: Igor Mammedov <imammedo@redhat.com>
>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210505125806.1263441-10-philmd@redhat.com>
>> ---
>>   tests/qtest/bios-tables-test.c | 142 ++++++++++++++++-----------------
>>   1 file changed, 71 insertions(+), 71 deletions(-)
> [...]
>> @@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc_tcg(void)
>>       free_test_data(&data);
>>   }
>>   -static void test_acpi_microvm_pcie_tcg(void)
>> +static void test_acpi_microvm_pcie(void)
>>   {
>>       test_data data;
> 
> This change is wrong: test_acpi_microvm_pcie_tcg() uses data.tcg_only =
> true, so the _tcg suffix indeed makes sense here.

I supposed I messed while rebasing...
