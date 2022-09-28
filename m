Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp370663ocs;
        Wed, 28 Sep 2022 08:25:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Qj3UfCgAe4yaabdbGuxef1VJj21CHSuX6XBs1dlxeKQkh4rzA7IIK0UlctlixcfnhbJiV
X-Received: by 2002:a05:6214:5288:b0:4ad:7535:9b9b with SMTP id kj8-20020a056214528800b004ad75359b9bmr26428448qvb.89.1664378703179;
        Wed, 28 Sep 2022 08:25:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664378703; cv=none;
        d=google.com; s=arc-20160816;
        b=v3ShoskZZfXMgPjhsbgwNMkw3dGkquREYB4ev2qtjPfoK2/Tt1apVtJdoTmu7WR1nT
         Pu5q2Z8ylS7j1jQ8RxnBKsN1h1KypBUuqdWlZFR/O4Rjr8tGnjVa96Avhs6XLU62caBE
         aF51XGtK3j50JQ5tPfLr4YJm5lFqoy7+qo4PRZcYXIbX5bu8RhnT70tyjXZaO2unt4Pl
         Uo/adyBF1rObElkrVyt0a669l0QXnLEYH2a2yqMvqZh2TZBqmLGAEdwnntNzx7OPEnZ7
         /s+9D9KL/sFIb3Kb3i/wjfEu7+K87RgfLhSbL14ybe8+C4tjou6CCykrCQ3kSn1H9h6V
         IjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=cd3LLtqKmeXgJ6NDuTnMU4cbeK3FOtpKOnxb9+fp7FI=;
        b=LA0gtfDxR+a86WgzTiO6q+99kbE4yqz6qOKfPsLIQl6SNAam6qrwmAyTP4EKnId7zt
         kWk9G7JEhZp2TYXROXeacSJagGMkMnEwJy94Vdha7bf+LialnkSTw65OWaosvKtee/Or
         Orhq3jgSDEnnvLVEKnRy6JfXj9U5pS+giHNhlD1qxeFrd6CdzSpvgb6DHWAhbaCEl+KX
         MhGOaVGC70XiVFszGTkCdORjLNJe2cCZDVth6rw0rNPtHpZxHRin9MBY6BxyISkB5866
         sxvCBBk021iWtsaxoJofHhV+r0KIPEXzSzvKB/OHsQ9qforwOE+0TaSVIUewEY/2pokS
         w/Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IObR9nQV;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h12-20020ac8548c000000b0033ffe99eac3si2628652qtq.528.2022.09.28.08.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:25:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IObR9nQV;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664378702;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cd3LLtqKmeXgJ6NDuTnMU4cbeK3FOtpKOnxb9+fp7FI=;
	b=IObR9nQVIvC0B+TnmPOiJgz8lLiLniNpwp6fdOjQidMMTnyrggWQBSt10HDWqelGhKq0ta
	0JJHSUTzbNnbMIVT8rewCfXxxN4YVkLGPQg7EXNQF/ibV99YlHFkJip06lWvn/hVVNqnh4
	wLiCF886ejIu1G4rBM+7m66xlePUlJ4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-Yhxj4cPNPGS9Wp0qXtarCg-1; Wed, 28 Sep 2022 11:25:01 -0400
X-MC-Unique: Yhxj4cPNPGS9Wp0qXtarCg-1
Received: by mail-wr1-f69.google.com with SMTP id e28-20020adfa45c000000b0022cc7d071b4so634960wra.23
        for <alex.bennee@linaro.org>; Wed, 28 Sep 2022 08:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=cd3LLtqKmeXgJ6NDuTnMU4cbeK3FOtpKOnxb9+fp7FI=;
        b=3vWFCZvajywQPZK2DjKqrjlKbMgYDl1qm2zTYXMjXkhFCmEokKoygm1Dc3cwCIVMAI
         gvHJAbM7aRmVcPP4Ne5m+COnm3G8jVVx8CEmxWERdyvEb8e7gCfxdoH/LzAT1C1JTVzi
         1uCuMjYS/rZIVwUprvKDZW0KwXtfixahkJvvmK+JM15ZwNegbOTMOfdhmw7FhT1Epa1h
         OlGLTWlzeIV9Nxl+xjiyb9/PtrIb3zfsWcDkCd/jb6tgO3M2NIGKE/JwB/WJlWBTALd/
         OQWgDDcAwKcJuajx+GTv41GHNX3wYZBE+NJkHjyf94HX5HE/yTCRz1Tax4muryuCY21O
         dGpw==
X-Gm-Message-State: ACrzQf3m95smV4gZhytQEVfZmTwLcwiWSrOlFIwgrH5KK1zTqwR0gEZs
	SwA/Bn1gpt5tDiKjPwadTM/XSIvo+4oMLm1Q8m3cl1vikE8F2nKBcbAJPRmJGlRMc9cN7O7YzzP
	7DAJV40yBPoH4BRRR
X-Received: by 2002:a5d:4f0d:0:b0:22c:c7c1:aa07 with SMTP id c13-20020a5d4f0d000000b0022cc7c1aa07mr2893514wru.401.1664378700601;
        Wed, 28 Sep 2022 08:25:00 -0700 (PDT)
X-Received: by 2002:a5d:4f0d:0:b0:22c:c7c1:aa07 with SMTP id c13-20020a5d4f0d000000b0022cc7c1aa07mr2893497wru.401.1664378700379;
        Wed, 28 Sep 2022 08:25:00 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de. [109.43.176.89])
        by smtp.gmail.com with ESMTPSA id e12-20020adffc4c000000b0022ad393ba3csm4336552wrs.107.2022.09.28.08.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:24:59 -0700 (PDT)
Message-ID: <4cb2dea7-6c3d-4b4c-647d-979889bddc9c@redhat.com>
Date: Wed, 28 Sep 2022 17:24:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
From: Thomas Huth <thuth@redhat.com>
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
 Ani Sinha <ani@anisinha.ca>, Bandan Das <bsd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Coiby Xu
 <Coiby.Xu@gmail.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
 Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
 Hanna Reitz <hreitz@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Joel Stanley <joel@jms.id.au>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Konstantin Kostiuk <kkostiuk@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <23ed00ab-d774-81bb-5cf1-5cd077480720@redhat.com>
In-Reply-To: <23ed00ab-d774-81bb-5cf1-5cd077480720@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 3T2NPnCTj4Kz

On 28/09/2022 12.31, Thomas Huth wrote:
> On 27/09/2022 13.05, Bin Meng wrote:
>> In preparation to adding virtio-9p support on Windows, this series
>> enables running qtest on Windows, so that we can run the virtio-9p
>> tests on Windows to make sure it does not break accidently.
> 
> Thanks for your patches - I've picked many of them for my pull request that 
> I sent out earlier today, so you don't have to carry them along anymore once 
> the PR got merged.
> 
> For the patches that are not directly related to tests/ ... could you maybe 
> ask the corresponding maintainers to pick those up? I'm not sure whether 
> they should go through my testing branch, too...
> 
> Anyway, there seems to be one more issue: The migration test sometimes seems 
> to be failing on aarch64 with all your patches applied:
> 
> 87/470 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test             
> ERROR          261.71s   killed by signal 6 SIGABRT
>  >>> MALLOC_PERTURB_=171 QTEST_QEMU_BINARY=./qemu-system-aarch64 
> QTEST_QEMU_IMG=./qemu-img 
> G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh 
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
> /home/thuth/tmp/qemu-build/tests/qtest/migration-test --tap -k
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> stderr:
> **
> ERROR:../../devel/qemu/tests/qtest/migration-helpers.c:205:wait_for_migration_status: 
> assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
> ../../devel/qemu/tests/qtest/libqtest.c:201: kill_qemu() tried to terminate 
> QEMU process but encountered exit status 1 (expected 0)
> 
> (test program exited with status code -6)
> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> 
> Not sure whether it's really related to your patches or whether it's 
> something else that has been merged recently, I'm having problems to 
> reproduce it reliably, but it's definitely something we should keep an eye 
> on...

Seems like somebody also ran into this issue with a vanilla QEMU:

  https://gitlab.com/qemu-project/qemu/-/issues/1230

So it's not related to your patch series.

  Thomas

