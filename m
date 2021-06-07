Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3509113lfa;
        Mon, 7 Jun 2021 06:44:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTeTdXHNWalCzpdfKjhFa8akYeJ+yJUc7Sa9iAKIn2/pR5Nd8lbq2kS5Ehh4jX5SXe4eKe
X-Received: by 2002:a05:6402:27c9:: with SMTP id c9mr20270941ede.371.1623073478776;
        Mon, 07 Jun 2021 06:44:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623073478; cv=none;
        d=google.com; s=arc-20160816;
        b=FVRjCUkvH5r0LG57MFS3nalZZz+sbSwLDLQriAW+NLfo9Ecu2m0cBo+xc9K9QIJ54X
         ruYLb8nKesjG7/OaMs3+Z1snfJgnrOV+nRWE1ocY25AECzROlkEC96XNa1MwYRrRFubA
         1x2Q5chGRXDLvYtaqTcXTSJKaos0kXN+21VFzjl1bMEWy+3jLK99AqXN+8EnOpsY8vpA
         jpkDsP6R0IMeGiBn+fVEzR/YVy6o+RFmfCY5UGMjPEmh0l75fTz8k+p4aXYBCLtYvCO4
         ZAw+WbrGH5Fdg5L8Lf5U2F3zTuEkDazw2zOMsBOH0poX5wizJIGus0lBw2gL7EyBadbG
         ElCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=QYMPUTxoQpoeG4LPw6WCV5k49Gz3rRB8kgSy/0zzUpY=;
        b=zRcbdtmPfLCvuQYrsuSFL4eZDff/L9wLML/6gDdQMxHLruwoJzWO3kfn3ZJKaaQ4X0
         2TIxAxfbhZ7ruOvnAZiVT6nIPztp2C95odtwMrI51mNDGVeLaw15LUTuUi/zL1EDZ5N5
         FAjhZLf4MXPkXyxbEoUCZJJb2RXC15uCjMWg/hlWB91MeHyfVE8mppy1aStp3GDJj5WB
         VMQadLoc0f3kXkP61VmmHpdKpLexf1eHfWQ4C9gYxFnzwmV0B7JDpebCuluyDL0AIApJ
         +ZimOstLbKjRn8Aaz5kfCa+OosHjyFi4CGBBl4NxG/Gwr+BWsLTulw8ZHzVjA/J/5mAV
         rVVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eLTyk86c;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id h8si8667905ejo.57.2021.06.07.06.44.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:44:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eLTyk86c;
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623073477;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QYMPUTxoQpoeG4LPw6WCV5k49Gz3rRB8kgSy/0zzUpY=;
	b=eLTyk86csRVxWeAQlVGKSzkVikFCSvMxOUpKCHOocRBZwKTNIulC+PfDwKamMvJPyJbusH
	M+nbGIaRFeIGRXHrWTRX2uL0CX7GqGDuSdJq+tzT3iuywEk55fv7haNtdOSJBllHwZG/pW
	jsnrDcObTT4c0Xr5pY7RVUKj5x9E0i4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-a1Vm_-4MOXeEm8STHJfAwQ-1; Mon, 07 Jun 2021 09:44:36 -0400
X-MC-Unique: a1Vm_-4MOXeEm8STHJfAwQ-1
Received: by mail-wm1-f71.google.com with SMTP id l32-20020a05600c1d20b02901a82ed9095dso438947wms.2
        for <alex.bennee@linaro.org>; Mon, 07 Jun 2021 06:44:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QYMPUTxoQpoeG4LPw6WCV5k49Gz3rRB8kgSy/0zzUpY=;
        b=Aeu9HXNJfy9tWtL3rjcPoaoUqX2VH878+dyMz1PXcUjb6BmzFmz0RuAysjkHUES4w0
         oqFej/nP0HDNbAcw8LVAKPwKCb5MpxWPP/jAbc8kQIY1ACwg3NenkAlq9AMlJA5Yknvi
         um7eZjkdmDai/2mlqPtqabV2svlBHipzUVhKdWz/DuK7l5ZtFDGLxtTZE8IlKbbfFFHk
         c6t2FhJRN0HdkyDY6h9yiks1oJB/0GA7VGYBeq/lf52Oi/gyMLfXy90dVlJwsYt1sALR
         zHGIlR4g9PI+m4iECNs/VCrkMX3LlrMkGNsxobHsGKmWJKiKeN8VWDmHEfi+tqK0H9dK
         Vzxw==
X-Gm-Message-State: AOAM533pt3JgORc6uy2e1Tw25JRmTfdCQDRncUHrzJ4lRt7Ma6z6H8g/
	+BGJg92oeQ0iKXD5hgLW99gPmILmgb51/AiZjpAmtIqlIB9vFo8GFmEJmtsl5Kj4OSiTijLc+i1
	o5YcH68U3aDkST/XH
X-Received: by 2002:adf:de0e:: with SMTP id b14mr16671897wrm.321.1623073475273;
        Mon, 07 Jun 2021 06:44:35 -0700 (PDT)
X-Received: by 2002:adf:de0e:: with SMTP id b14mr16671881wrm.321.1623073475151;
        Mon, 07 Jun 2021 06:44:35 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de. [217.87.87.121])
        by smtp.gmail.com with ESMTPSA id l31sm5770776wms.16.2021.06.07.06.44.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:44:34 -0700 (PDT)
Subject: Re: [PATCH v16 10/99] qtest/bios-tables-test: Rename TCG specific
 tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-11-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2c735a29-037a-0027-b671-20e9a25433d7@redhat.com>
Date: Mon, 7 Jun 2021 15:44:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-11-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: QeyTZv2Oa9VX

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Some tests require TCG, but don't have '_tcg' in their name,
> while others do. Unify the test names by adding 'tcg' to the
> TCG specific tests.
> 
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-11-philmd@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> index ce498b3ff4..ad877baeb1 100644
> --- a/tests/qtest/bios-tables-test.c
> +++ b/tests/qtest/bios-tables-test.c
> @@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc(void)
>       free_test_data(&data);
>   }
>   
> -static void test_acpi_microvm_pcie(void)
> +static void test_acpi_microvm_pcie_tcg(void)

Lol, that's the one you removed in the previous patch :-)

>   {
>       test_data data;
>   
> @@ -1475,7 +1475,7 @@ static void test_acpi_oem_fields_microvm(void)
>       g_free(args);
>   }
>   
> -static void test_acpi_oem_fields_virt(void)
> +static void test_acpi_oem_fields_virt_tcg(void)

This one is ok.

  Thomas
