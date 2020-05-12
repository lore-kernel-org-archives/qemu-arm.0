Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp875877lfb;
        Mon, 11 May 2020 23:20:16 -0700 (PDT)
X-Google-Smtp-Source: APiQypIH5ymPgFd6PbUN8W6fkpB0OU60a+ndMx21ZviiS0FZ6qrTZrKJdRcg6b2NibLlf989TvBi
X-Received: by 2002:a05:6402:c87:: with SMTP id cm7mr13958995edb.285.1589264416470;
        Mon, 11 May 2020 23:20:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589264416; cv=none;
        d=google.com; s=arc-20160816;
        b=t3Ic0qGpi1N/CDHb0W+ZX3BqZ3Zv/Mt+UTehLt9jhzrRWcy8Y5HhnuZm/vAUHj1PyZ
         ouUWh1TjByr1OtU1/1cVnqrkyZXHnzlXUGtKogqtpG7zn4kf2ggXeYblTFBvIWVkseuS
         TvuQtYOGL7lrOqw2i5b7QMf2Sqrpfqi6Xdg1LOoQdjixstgZVgkDegtUnY8ZEn7yKzwU
         slQ6mR0KsOqW0FI+u0dt7H5qEH0PC3ctS99vA5XftBzbTg8MJSjlDPChnLa7A7q/U8UX
         QQvxy3uUoD5BuZxQU/CrFZyuixa7BcEFlr+5Vt9ynwsarejQYrI1x3k3pemAPkjrSYWC
         QvAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:references:cc:to:from:subject
         :dkim-signature;
        bh=1HQTdxjBEpGIyjgdIPCiV/6/3iE1I9+2al6dRVoDtNw=;
        b=ylwlq8K2VmUUntKo3RY6sDeUOQD4kJDkAFlbmbQMQ6QRTtmBmlDD1vjZjFIVX/PJfC
         qTzoCF54gSxmyAcYVusRA1Ius5IVCYr8Tkoe6r17Huj5PtFPUQ5UTo4qZtNrj5tTuhUz
         kxRqRKy+G7NKTMf2BWSwoLGRJ/ZJxDDxz1D9VPuS4jxWkZNXAjztC9lPuzg6CwfUiDVX
         qoriiq2gccha12rO7DRJl3um/zZERGALAvfHCDsV288s+7ADLpQRVqicHT8A24LQpXzy
         fR3Ux05Hk0YLCDMNpGUCgpLZ1/Jon5DjUTggX1zXeyd1fxrC97fV51r+BJ6ebWLJ2K1e
         BY7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ONoPDaxx;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id i20si7547146edx.314.2020.05.11.23.20.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 23:20:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ONoPDaxx;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589264415;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
	bh=1HQTdxjBEpGIyjgdIPCiV/6/3iE1I9+2al6dRVoDtNw=;
	b=ONoPDaxxxiUftZi2h14AQ1hqdV4dmo5Bak1O97X3QqnytZDd9BK2sI9rBL1AZxMKDNIn+I
	LkBneC2pfgzFKyHcuWQPvoGxtalqL/CedYv2LB07FWn7htNtdYAzF1wu7XakNamRUF7+51
	arNaY4/62J3C28QQLzjCDFIDKFF4Tzc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-F76wCez3P4KaVVy4JzzVJQ-1; Tue, 12 May 2020 02:20:13 -0400
X-MC-Unique: F76wCez3P4KaVVy4JzzVJQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 348CFA0C01;
	Tue, 12 May 2020 06:20:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-112.ams2.redhat.com [10.36.112.112])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EF2A35D9DD;
	Tue, 12 May 2020 06:20:06 +0000 (UTC)
Subject: Re: [PATCH v2] tests/acceptance: Add a test for the canon-a1100
 machine
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-arm@nongnu.org, Antony Pavlov <antonynpavlov@gmail.com>,
 Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20200129090420.13954-1-thuth@redhat.com>
 <a967c93c-58b2-9a8d-02fe-e7fc9e833827@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <55becaae-cde0-3fcb-dd81-ece1dcb68113@redhat.com>
Date: Tue, 12 May 2020 08:20:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <a967c93c-58b2-9a8d-02fe-e7fc9e833827@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: MiZS6vbvbrX7

On 10/02/2020 17.59, Thomas Huth wrote:
> On 29/01/2020 10.04, Thomas Huth wrote:
>> The canon-a1100 machine can be used with the Barebox firmware. The
>> QEMU Advent Calendar 2018 features a pre-compiled image which we
>> can use for testing.
>>
>> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Tested-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  v2:
>>  - Rename file and add class docstring to please pylint
>>  - Add entry to MAINTAINERS
>>  - Add :avocado: tags=device:pflash_cfi02
>>
>>  MAINTAINERS                                |  1 +
>>  tests/acceptance/machine_arm_canona1100.py | 35 ++++++++++++++++++++++
>>  2 files changed, 36 insertions(+)
>>  create mode 100644 tests/acceptance/machine_arm_canona1100.py
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index efd3f3875f..ddf6fe0794 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -561,6 +561,7 @@ S: Odd Fixes
>>  F: include/hw/arm/digic.h
>>  F: hw/*/digic*
>>  F: include/hw/*/digic*
>> +F: tests/acceptance/machine_arm_canona1100.py
> [...]
> 
>  Hi Peter,
> 
> could you maybe take this patch through your ARM tree?

Ping?

 Thomas
