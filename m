Received: by 2002:a17:906:faca:b0:92b:dcda:f23e with SMTP id lu10csp50127ejb;
        Mon, 13 Mar 2023 01:55:51 -0700 (PDT)
X-Received: by 2002:a05:600c:3503:b0:3ea:e7f6:f8fa with SMTP id h3-20020a05600c350300b003eae7f6f8famr9765025wmq.10.1678697751127;
        Mon, 13 Mar 2023 01:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1678697751; cv=none;
        d=google.com; s=arc-20160816;
        b=tWkraZqnC6loUDl3n19tsaRJ9kZTR6XL2yfpPeQ3EHRwhEliV+GhBanbQrxbOAKf16
         gGGnrSay6oH+ReaB7+RVl5DpHNpu+pNoBw6RQALRexeHKGfhHeQk6zO6V7RNjvpH5CB6
         F/a3aaJBlI1laFkRsGrscscsMr9siLoEJN/4lQrhGAUVLH6zDT+YZXTAqPQ6zbQtVHAa
         6LExT5AnJi07/b5Yez7HGXQlJF5feTkcv3XlC3fHIVuelaq9xNS+XZAdb9Be7n/fdDbe
         AptKFQO0B1wWkjZgv2bNxBTBuQ4KY4s09yVdZh+iu+9wJL99TNUe9jRt0AVkP2w+a8kM
         ljKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LsVEQcED9WXT/Ve5daaXDWObqeHky7fpXTG5TLSN56A=;
        b=LwRjcc7E6x8seBvHxqpv27R5CEflYhvCyey5WwrB9NcFspmJ+tBmpkKAfsVJmqJenH
         yOxOBviQTsOkfQzsreug9ASGgep3LCxLv52T3uTYdhsKTTs/+pq5atneIhXQfNw0GIkt
         gzpUY63V4XUpxDXAvYEj71abYtGulIw78+Ag/IjLA8hNBUS7/P/Qf0Sgpe2GyCXtlPIr
         f2AFGvrZeW/d45Us/zEtrkN1e8BSh/Bd6zQeFuUN5wcj0Swv5+frSa9mu+ATZZZ5JuVl
         yGE706GLmuWfYH4wWjbinPg2Ytbw4ycKpiwwjnjfAkgSO83iK3Jfq92ZAAg4x0diKjy8
         nLqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XLh5FzSs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i8-20020a05600c354800b003e222c98e48sor1807086wmq.21.2023.03.13.01.55.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Mar 2023 01:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XLh5FzSs;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678697751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LsVEQcED9WXT/Ve5daaXDWObqeHky7fpXTG5TLSN56A=;
        b=XLh5FzSsh8E2RPnrzMH7silIhoIZJjsceR15KYrTL93w1Hi1VpDZ+AebsgQT44/6rA
         k+wP5tYtPDs2S0Kqpc1GzbtYsmnvd0BbNRLdBiX1okxI7BB5LIfyYXIT2W5kOElRCOQ7
         wo+zYYlfS5G+B16MVg4pz2IMw5jiZOLizpMBN9IjrwhlXnpA/WKQhS6k9/McT3CDnNl/
         oeQeg6jT5SfBHxwwZqm3+RDGWjr5XaXhCgNDhG+8ALMGa/0y4Lh3Dpo+gHnChwooqH6+
         kiWPKboxKmnu/hqcit2ZRwQ8iZ9WNNrf62B+tpvlocpb+yUQRrvKf+LcyoW63pfDqLJq
         gP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678697751;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LsVEQcED9WXT/Ve5daaXDWObqeHky7fpXTG5TLSN56A=;
        b=i0iCyM4o68OcRxJ7O4SJfs9dApNRH3o7nzUSk9iW7IxM+hfo8h+ZBC6eOD9Q/pmmJE
         FjcCROMApkTfTb2xiRD6jFWo3A+qHz3QEWVQ6IrLGqmPB4J16xqg1B1Xyr7tfSi0Lboy
         LmY4xnXt2CCKsK+ChPAfvZqIXIUroIZ4YRw/G2sVFeIgo458l5J7KtWc6ja8UDKfkg5c
         EaoUIYItIRtw/+DuLYJ1FezzpKgNtV21dIa3ueQMR8WAz0LjF7rK/r1yzu0NanWIItqi
         VV+TJWxPdT/EZzT5x6Pk92hP2O4LlNzOqvAAncGhktKdXhK1RCJTlZHG5cKd0a1aHQbK
         lfJQ==
X-Gm-Message-State: AO0yUKWVjLntwJH237/djqA8awGKcMWfjY/9lIqTNH0mXeJYFIg9Xr/y
	jesWpbwz2FaIyq44S1R0QIAtHturWwvdywZDyfPTIA==
X-Google-Smtp-Source: AK7set8hF8PJ0U70TCssvNqC+Oc72XPj+oi5UzXNsUmriEUdbleXTksapII8TKlCRoFNlP+HaL00kw==
X-Received: by 2002:a05:600c:a0a:b0:3df:eecc:de2b with SMTP id z10-20020a05600c0a0a00b003dfeeccde2bmr9710440wmp.11.1678697750861;
        Mon, 13 Mar 2023 01:55:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c3b9300b003e1fee8baacsm867675wms.25.2023.03.13.01.55.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 01:55:50 -0700 (PDT)
Message-ID: <21b20a8a-090e-8196-720e-48469553ff53@linaro.org>
Date: Mon, 13 Mar 2023 09:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v8 09/11] tests/avocado: Pass parameters to migration test
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230309201434.10831-1-farosas@suse.de>
 <20230309201434.10831-10-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230309201434.10831-10-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kxu7OnNB5VEH

On 9/3/23 21:14, Fabiano Rosas wrote:
> The migration tests are currently broken for an aarch64 host because
> the tests pass no 'machine' and 'cpu' options on the QEMU command
> line.
> 
> Add a separate class to each architecture so that we can specify
> 'machine' and 'cpu' options instead of relying on defaults.
> 
> Add a skip decorator to keep the current behavior of only running
> migration tests when the qemu target matches the host architecture.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   tests/avocado/migration.py | 83 +++++++++++++++++++++++++++++++++++---
>   1 file changed, 78 insertions(+), 5 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
