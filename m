Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4536430wrm;
        Mon, 21 Oct 2019 05:54:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySoQ0ZHFdCKQs3yUSukqeEuDXkgWmhTBa0MclQDDxU6UhYOW35Irwa920bDCq8AA0CwVGG
X-Received: by 2002:a92:8404:: with SMTP id l4mr6071314ild.15.1571662475039;
        Mon, 21 Oct 2019 05:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571662475; cv=none;
        d=google.com; s=arc-20160816;
        b=IoaLTw2eaWzvnpPjDVp/fxvNya2JkPyLw0BXGqW/yDuuwPDGHqdb/JdNGFVUTb7dWx
         C0bbn2R8hTIX/N9v6Ju0fgYjDWNJrl872dmeWBCaIdX2EjryYLHxXosDrpFsmZRgeGgW
         39hlojZKvZaezG7iMa8qVhnsjAlz1iaZIWrjpDfQjYhO9U4emCaheWqtHI+UC6HnjdAz
         ZQJylAntZkr73HN+aSdt6eGzhvYq8bMrL832Qc0UdQnsvjPQxGX1xLDrxzjSYVQzh1p0
         CfbtnLeQi0DskDoz37FUWXe55th547EF26nTuvC+AqcmNlYimSmA0u62Yc18beGOR6hR
         sfSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=fnNWcF3aH162/o5wr3miNOOP17++hIEoPNCNh7vQ6wc=;
        b=pMDnZVBBMBVVpkC0FV932eVnjL0fyolexJfww25zuMbR9caIvYETANl6YcKggk3Qno
         xIOAHBhhLGu9oSKKkuyRYDeiG4zh/WVszg1zswty3wmyEduHMr64gxwPW2HkNdla2rr6
         Bllafzjr8bMeiiyDlNdRoVnjH31HjSqbm/s/YJWfsLNhIP1FNkMchHcgzD9K2xwQjDm1
         VyjaBtPvytZJ9Zhgd/2cwVK0tfJ35dvbtg9Ni4SAX8FHjt2/H7YXDtrcfzZaqLJN59f/
         6a9iYK5Ix06cO9sB/yG5OWRANTR1IwbsJTostpnJGEkQQ2hUyEqX3tlA9TrotFDzoiaX
         f4yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id m15si5015785ilf.63.2019.10.21.05.54.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Oct 2019 05:54:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 122A2C057EC6
	for <alex.bennee@linaro.org>; Mon, 21 Oct 2019 12:54:34 +0000 (UTC)
Received: by mail-wr1-f69.google.com with SMTP id v8so6363243wrt.16
        for <alex.bennee@linaro.org>; Mon, 21 Oct 2019 05:54:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fnNWcF3aH162/o5wr3miNOOP17++hIEoPNCNh7vQ6wc=;
        b=Z1w904+ZamJsv4E24+oCqDLDYvgQ5du965wM9f3OIKGUZ9DyYnl1nVSHc0hj9/uh1K
         lXONksQ9jecmmmiIaC6Wlw/UEl9ZOqO0PJaXhLPfpX+XOgxo6F5akXwoFPQnCEjgAJax
         /ju6ISeKQK2oFUshxYpXowXHQyqpTQloIMC/N0Op8hFjnk6OkaQAyOgPj42ovMiNTAJx
         zp3jfCzMjGTodeDBPE8TKB9kLJjlvkj/ki0kN0tTIVZuQXalHirFQ+yxCaJrNS85mXEp
         XEnQsWLGB+n6XGVGWPtIDdBkiNo+VPoviT4PBCc3BurdAbeaTjE5YbBRXThjhgeoe2Gv
         keCQ==
X-Gm-Message-State: APjAAAUHSXgL5sn4cWolk9hjDb2CktPGPBpdkbs3B1B3uAgJFOAQwHHi
	RMEblgWQOBMaU4rQeLDBXnMAjmYyUJFTLfCQXVERG5s6WssgT2rz7fzBQzU3RQRRdfBt0Kjao4R
	t5LbqKuPDcg67Kx2x
X-Received: by 2002:a5d:6241:: with SMTP id m1mr20691222wrv.213.1571662472760;
        Mon, 21 Oct 2019 05:54:32 -0700 (PDT)
X-Received: by 2002:a5d:6241:: with SMTP id m1mr20691206wrv.213.1571662472496;
        Mon, 21 Oct 2019 05:54:32 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net. [83.57.174.129])
        by smtp.gmail.com with ESMTPSA id p126sm2005705wme.0.2019.10.21.05.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2019 05:54:32 -0700 (PDT)
Subject: Re: [PATCH v6 0/9] target/arm/kvm: enable SVE in guests
To: Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <drjones@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Eric Auger <eric.auger@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Dave P Martin <Dave.Martin@arm.com>
References: <20191016085408.24360-1-drjones@redhat.com>
 <CAFEAcA8pV5batrPk+J6RLU2rv9SNAmL8JS9Kd9tWP3pD-m29eA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3f54f759-9d6d-bf04-85aa-59c1cac31044@redhat.com>
Date: Mon, 21 Oct 2019 14:54:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8pV5batrPk+J6RLU2rv9SNAmL8JS9Kd9tWP3pD-m29eA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: /w4ivWFSjH7Z

On 10/21/19 2:36 PM, Peter Maydell wrote:
> On Wed, 16 Oct 2019 at 09:54, Andrew Jones <drjones@redhat.com> wrote:
>>
>> Since Linux kernel v5.2-rc1 KVM has support for enabling SVE in guests.
>> This series provides the QEMU bits for that enablement. First, we
>> select existing CPU properties representing features we want to
>> advertise in addition to the SVE vector lengths and prepare
>> them for a qmp query. Then we introduce the qmp query, applying
>> it immediately to those selected features. We also document ARM CPU
>> features at this time. We next add a qtest for the selected CPU
>> features that uses the qmp query for its tests - and we continue to
>> add tests as we add CPU features with the following patches. So then,
>> once we have the support we need for CPU feature querying and testing,
>> we add our first SVE CPU feature property, 'sve', which just allows
>> SVE to be completely enabled/disabled. Following that feature property,
>> we add all 16 vector length properties along with the input validation
>> they need and tests to prove the validation works. At this point the
>> SVE features are still only for TCG, so we provide some patches to
>> prepare for KVM and then a patch that allows the 'max' CPU type to
>> enable SVE with KVM, but at first without vector length properties.
>> After a bit more preparation we add the SVE vector length properties
>> to the KVM-enabled 'max' CPU type along with the additional input
>> validation and tests that that needs.  Finally we allow the 'host'
>> CPU type to also enjoy these properties by simply sharing them with it.
> 
> This fails 'make check' on an aarch32 box with KVM support:
> 
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_BINARY=arm-softmmu/qemu-system-arm QTEST_QEMU_IMG=qemu-img
> tests/arm-cpu-features -m=quick -k --tap < /dev/null |
> ./scripts/tap-driver.pl --test-name="arm-cpu-features"
> PASS 1 arm-cpu-features /arm/arm/query-cpu-model-expansion
> **
> ERROR:/home/pm215/qemu/tests/arm-cpu-features.c:420:test_query_cpu_model_expansion_kvm:
> assertion failed: (resp_has_props(_resp))

Glad you could test it, I was wondering how this test work because it 
first unconditionally assert the host has PMU feature (failing the test) 
then there is a unreachable if(!aarch64) "'pmu' feature not supported" 
warning.
