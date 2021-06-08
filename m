Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4261105lfa;
        Tue, 8 Jun 2021 02:48:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysjy5eJO9DVh8cuLnj4YuFjGmytEn13Qz7Q2ZAR9ukUQJa5hGF/PJgStVPnLuIsLzUnKVq
X-Received: by 2002:a17:906:b2d1:: with SMTP id cf17mr22816396ejb.225.1623145732046;
        Tue, 08 Jun 2021 02:48:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623145732; cv=none;
        d=google.com; s=arc-20160816;
        b=yGK+xs8vs0YtGt+4poMNvWMAn89Fla27f3wasNgt+Tq1XkeO0dlaC4XCwv5KUhey6n
         Nf/2mFiMS9wnpJp9twNyOl0MLraWkxdYLaPs2Vp11RWYTxSQeptldhfY9MzBxO0eB4WZ
         jUhx4z4PUK8EiB74vJ7z/2+Ek3Z4uFCIDqUysFOjUmwDh1u+s6XzzAumGB0btlQrW72D
         /FtpoePkyZYo19CLvDbpCfwfhXAkivfZ9G93g7KJ62Wda1BujzkffyA3N9nZYgwMGnCG
         iknICNkKzaFnJBJuI391WtUOSNxVRMGGguR3/L1ooUA02OMvUma3K2sSW7UTMX900qSx
         PtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=ztjOwBWVWRcLBeGlv9kV0M01VSWdGwRS4cSf3jXheyY=;
        b=m5VSNtHobuKo0S0oTo/YBv5ypCFA+WgQ5MrTjX9KgY9PRZ4Dx0qsGp/tQdBy3+ECvI
         cJznOXGuk/eLovFegOP5r01aO6cIgyJmyGc5LtU6ue+cwfeVZqN2S1uWN+ARHyPpjwf2
         13ycPI5kvp4/0T94RLicw+lz2edSNf1ppleGSqbQ8/kIGL3VCFsKKGQfsUY4VL4dqmSg
         GE7IyeCvx31O0cJfqRv9Jw64xhIYjldR4lErTr7teQA61alxphbX6wfa9cglyMlog9Mu
         xWZ9k9Zm6+NwAVxwGZEnoPy/ruZOftonW4rCiy1H41vRfUFdhKDNA5Pn8ToZ8npHD7rm
         D2hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bpDoQckK;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id g14si5679054edp.611.2021.06.08.02.48.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Jun 2021 02:48:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bpDoQckK;
       spf=pass (google.com: domain of philmd@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623145731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ztjOwBWVWRcLBeGlv9kV0M01VSWdGwRS4cSf3jXheyY=;
	b=bpDoQckKh57ipZODw19OwAVEdl79LENawzkN33pdmXJBMbsOM8/VFiXPL6AUweK9CGeoqX
	mhixqtlmnymmXcTjv+m97e6JmxzTgqp2yWtIgN2K20xYHhbKOcBu8USYsVNxCOCdqSpOzN
	fZkFk68i+J3R0QkHRNRMapJaorOW1FI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-33-alJNB9IHMeufrC8Gw3TwTg-1; Tue, 08 Jun 2021 05:48:49 -0400
X-MC-Unique: alJNB9IHMeufrC8Gw3TwTg-1
Received: by mail-wr1-f69.google.com with SMTP id d5-20020a0560001865b0290119bba6e1c7so5229700wri.20
        for <alex.bennee@linaro.org>; Tue, 08 Jun 2021 02:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ztjOwBWVWRcLBeGlv9kV0M01VSWdGwRS4cSf3jXheyY=;
        b=NBBDQvAZ8bg6rbcUW8ocCZj8xkc37LE1w1enPEBsEOwAJv6iNpoIkudrm97Lu838MX
         P1wQxcrR3ITiWAYFTIey8QJY795Y5U+Tk1nZhXu5dMr2NwRCYl2l/349bzWOEySpxbbr
         /A2iDvZ1R7Zp38aI9SRWyEU/z/DhzlF5Oi6g9vdr5aGbo/a3DsHIrhlXJB9pga4mOAXG
         uYjX34g/WhbBNr25ckheMrvZyz95Ekj8i1lDqt8sHWbIb3U+fnimNz+GsfqA/7UuaicS
         xoALd7t2XJH9WO0BUf1f1Xcx3q0ZTgSWU/KSINDDL3U87gYfHqgLCks1lxld/5MgmPS/
         weKA==
X-Gm-Message-State: AOAM5323tprbQoEdLAzyH5zOKSjj7V6r1IQa/uF2UbceVn40eZPgMuWO
	bplPMX0d+SGGmGbroeFEHVtbAglsI1JpZZJSQ6ySJ+NYmPmRWaPlnXOwdJ9PyCu/soNJ3skpHbU
	HLSMEYXTW/FHwhQnW
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr7725725wrt.281.1623145728641;
        Tue, 08 Jun 2021 02:48:48 -0700 (PDT)
X-Received: by 2002:a5d:50c6:: with SMTP id f6mr7725702wrt.281.1623145728442;
        Tue, 08 Jun 2021 02:48:48 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id z188sm17739635wme.38.2021.06.08.02.48.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Jun 2021 02:48:48 -0700 (PDT)
Subject: Re: [PATCH v16 03/99] qtest: Add qtest_has_accel() method
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-4-alex.bennee@linaro.org>
 <088d554c-ef63-0f79-cedb-bdc89b532490@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7410b765-7252-3d19-af96-399fd34d94dc@redhat.com>
Date: Tue, 8 Jun 2021 11:48:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <088d554c-ef63-0f79-cedb-bdc89b532490@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: ySjjNIaIQaTQ

On 6/7/21 3:16 PM, Thomas Huth wrote:
> On 04/06/2021 17.51, Alex Bennée wrote:
>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>
>> Introduce the qtest_has_accel() method which allows a runtime
>> query on whether a QEMU instance has an accelerator built-in.
>>
>> Reviewed-by: Eric Blake <eblake@redhat.com>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Message-Id: <20210505125806.1263441-4-philmd@redhat.com>
>> ---
>>   tests/qtest/libqos/libqtest.h |  8 ++++++++
>>   tests/qtest/libqtest.c        | 29 +++++++++++++++++++++++++++++
>>   2 files changed, 37 insertions(+)

>>   +bool qtest_has_accel(const char *accel_name)
>> +{
>> +    bool has_accel = false;
>> +    QDict *response;
>> +    QList *accels;
>> +    QListEntry *accel;
>> +    QTestState *qts;
>> +
>> +    qts = qtest_initf("-accel qtest -machine none");
>> +    response = qtest_qmp(qts, "{'execute': 'query-accels'}");
>> +    accels = qdict_get_qlist(response, "return");
>> +
>> +    QLIST_FOREACH_ENTRY(accels, accel) {
>> +        QDict *accel_dict = qobject_to(QDict, qlist_entry_obj(accel));
>> +        const char *name = qdict_get_str(accel_dict, "name");
>> +
>> +        if (g_str_equal(name, accel_name)) {
>> +            has_accel = true;
>> +            break;
>> +        }
>> +    }
>> +    qobject_unref(response);
>> +
>> +    qtest_quit(qts);
>> +
>> +    return has_accel;
>> +}
> 
> This spawns a new instance of QEMU each time the function is called -
> which could slow down testing quite a bit if a test calls this function
> quite often. Would it be feasible to cache this information, so that you
> only have to run a new instance of QEMU once?

Good idea!
