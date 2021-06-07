Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3505009lfa;
        Mon, 7 Jun 2021 06:39:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeeg5rtRXllG2MBcwIEqWErV0QPAUrOFwuIJfjz6ECfz3zNshPZaiowQrjVVwKOIJOYSq8
X-Received: by 2002:a17:906:70d4:: with SMTP id g20mr5218771ejk.327.1623073196511;
        Mon, 07 Jun 2021 06:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623073196; cv=none;
        d=google.com; s=arc-20160816;
        b=uQAZCn0EgE2xx2RE30BKF61mR+UItkd+tmWMJXZGzNTClVIzemE8uVFLpgz/6RlBgp
         snJAyeJ2uIxlCcw4sOePCyIvpdPL4YwO1e3J6LWJDj3KZ5AC/fDw9F3Qh1WF5GtFwJmr
         W5ESPr629vTLd6oQj+4ONrlJUEp2xPyhB3MYnLG30de5ERIGimud9+AzJZyEltWQu0ho
         oafI4T1q8Vk+/TJU9/R4oXZAu9B4xxR1Ps0XBNtO7grXBKll2lmXX5TyGfgLCO+8J8hx
         mI4lJZ1RpNr+B3blf3juUYNpXXk54qLXzegZ/7ORaGRiwBz2wFMpvN6aJF6FyB+YuwiD
         TyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=wBq7wls3KFErEV9Dm5UQhsUhRjSPfd6pHeakeShcHy8=;
        b=qDA6h2aS51akD27P1Qd0qg4vq5z4sbkJBqqBxtiFxkiPtT9WCkCMgRYL+D1eBv996T
         3y+jMUbMlmf9nRUZRYXt/AtpuTZrk2gFJQXikowYOopZFBhD0dRrDJ5Jbzy9cNnxbR6W
         u4HZQ3kEbQW404/vL0GhZB3aKshssy+j6AJtCR0LaqY4gR5hcJIhf0+jMFypuYZwcJAC
         VVcuFvGgNdVsJy615JeXieJ6g/ct6G8cSuQ0clgl14KVrp4jf0Q1COrLZDilw6pJxLo4
         zGgkjbGnqQZLlnVn76eojvWD97Ytzz0vED6tFOcLZTB0+MOo3gwN77ToM59E4U3Ja/dw
         ulGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hcWgx/Pv";
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id r16si11971081ejs.266.2021.06.07.06.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="hcWgx/Pv";
       spf=pass (google.com: domain of thuth@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623073195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wBq7wls3KFErEV9Dm5UQhsUhRjSPfd6pHeakeShcHy8=;
	b=hcWgx/Pv1h/HHu82YxnPfjqeog1rij5eMEH1xsbP4NcCMOhJWRwBpsl+kUMEWkltHygXr3
	O4wf69RU4wDL+BnGhwbum3O2+997VWzUlf1qG66RnC0/rWiPy/A+f7uyKSMVVynMJsJ9+3
	MjkLLmAkc617odxBF9i8VlmHLxWDY6A=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-KvpKN1h2Oeq01_ZomJ6f-A-1; Mon, 07 Jun 2021 09:39:54 -0400
X-MC-Unique: KvpKN1h2Oeq01_ZomJ6f-A-1
Received: by mail-wm1-f69.google.com with SMTP id l185-20020a1c25c20000b029014b0624775eso6812399wml.6
        for <alex.bennee@linaro.org>; Mon, 07 Jun 2021 06:39:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wBq7wls3KFErEV9Dm5UQhsUhRjSPfd6pHeakeShcHy8=;
        b=PCqxqgBz1fHiv6HoMKKNrCmgpOHtxyAqcF0aL8C01l3VjNYEhOCeuswy1BOUJN729V
         kkRaAt0/n7MlmP2C+2WNMX5W/38iilsDciwDsbLPNHJAK2tLb7UFSYF81svKNgg5lFCy
         EwVmoaAAwL13B4OyMhQM0ZpUP3+Vw0dc3OyxsrSFcxIrleX/mdnnEhxeoXMqDAPzp93r
         UAzynRjKfzwc6AoXJo4OCI7TyqIJttLBwxyG9UZnyiR+NDbSsW/PDPlgj9ZmI30J2yFu
         FIZXL16FUYw1RaBFUho6D0zUh/lKCzzvKt5FOoOgmudAFIb7wRtQbuy+3Bqx6l2qgWHX
         k8IA==
X-Gm-Message-State: AOAM532CIhaNeozgl6Bcxwh3AYpxR+sL3Jd9oUkksVHyaGTC5CL9Wi3l
	EHb7NpYQrDiB6zoDX4Qvex/R+bR0uVhBwVIfhtI20tAPT6G72jjAYRBRjUXlz4wQO0iWb7J+/Sw
	GrNW26VHnMmEhVFqj
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr17101616wmf.7.1623073192936;
        Mon, 07 Jun 2021 06:39:52 -0700 (PDT)
X-Received: by 2002:a1c:1f51:: with SMTP id f78mr17101609wmf.7.1623073192819;
        Mon, 07 Jun 2021 06:39:52 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575779.dip0.t-ipconnect.de. [217.87.87.121])
        by smtp.gmail.com with ESMTPSA id 4sm2183532wry.74.2021.06.07.06.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jun 2021 06:39:52 -0700 (PDT)
Subject: Re: [PATCH v16 09/99] qtest/bios-tables-test: Rename tests not TCG
 specific
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b6c4efd5-4ba9-48e0-e9fb-c821df7db5cf@redhat.com>
Date: Mon, 7 Jun 2021 15:39:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-10-alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ksWtYP/ahcKE

On 04/06/2021 17.51, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Various tests don't require TCG, but have '_tcg' in their name.
> As this is misleading, remove 'tcg' from their name.
> 
> Reported-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210505125806.1263441-10-philmd@redhat.com>
> ---
>   tests/qtest/bios-tables-test.c | 142 ++++++++++++++++-----------------
>   1 file changed, 71 insertions(+), 71 deletions(-)
[...]
> @@ -1255,7 +1255,7 @@ static void test_acpi_microvm_rtc_tcg(void)
>       free_test_data(&data);
>   }
>   
> -static void test_acpi_microvm_pcie_tcg(void)
> +static void test_acpi_microvm_pcie(void)
>   {
>       test_data data;

This change is wrong: test_acpi_microvm_pcie_tcg() uses data.tcg_only = 
true, so the _tcg suffix indeed makes sense here.

  Thomas
