Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp179863ocs;
        Wed, 28 Sep 2022 03:31:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7PySGicR9o9teSqFntMFiwhrjWawskoVryfTM7BqQm8P4tLceAzky0Apf+Qcw62tqmN3vC
X-Received: by 2002:a05:6214:21a9:b0:4aa:b0e6:c6f5 with SMTP id t9-20020a05621421a900b004aab0e6c6f5mr25176327qvc.19.1664361114311;
        Wed, 28 Sep 2022 03:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664361114; cv=none;
        d=google.com; s=arc-20160816;
        b=cIGeF3d5CRe4e6JlG9JMRVSRpitY4uZXiIahpD4bYI4v/unHd0vwe4VzJfnSbHs/Ny
         0r7bTFyZtjYasY2GwKRPV1GGcwT7jBxDfQhVVpFVMSZPtj7Kuj2zAW+G/7LZqHCwuzNa
         6Xr/2SMFv2mCxSCDxvPnvnANcNcSAjEMdT96NvCWsC9h15RbrN3FVOtplr+daQu5l0As
         646n1TwVrdbIlajEEGPDJ8VBsrSpkbNHJX1nmQxaiVmNoNHaiWFImcCnA+Z0jvH+suv2
         RC9vSXOgtz9pFZm/tmXkq6/anereZw+THuQ7pGZXEhnaVKfSvNPkFOn0XpgfM3zfq5Ci
         WOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:subject:from
         :references:cc:to:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r072hw4nq7j220SZv7l4j1oheSWPZXuwuBycfvaaNz0=;
        b=zObG1bHkcYHciad+B6qeUpYLwlKQLJYCDdVjigShI5ygLHrci2yTa7+0/QMf2DfJIq
         LAQ1MMLcN3O3qT0xYlRE0hsW2MVUuxYxa2CzwEcn4wIgM5hQnuCj5QX5GupNS56EOYeo
         zrDrWvlfVeSgc+gabasaHese39iBVGM7/7uXIhhj/1F72Z+NbO0J50EgrmNV7ZuYMTJK
         /pQX5Mp95zZ31bBmkt3uD09/C0zfRmlrVj6tzbyqWt1kO3NSl09EawSEP+sB0Nf9JthT
         j6vNuSgEzzVDQSDtrEbOHzgAM6ZzWy7R1tP+ZwJo3m1V8emrcvBAzjrbrc0LH9PvojM8
         PupA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YHgr2EWF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id c9-20020ac80549000000b0035bb73fa23esi2369486qth.363.2022.09.28.03.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 03:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YHgr2EWF;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664361114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r072hw4nq7j220SZv7l4j1oheSWPZXuwuBycfvaaNz0=;
	b=YHgr2EWFAqMirBiwJJ/2BdQ1Dy9QMaQd9bSheFkg0ADVmk3Bdt9zICYvCJZtJBfgvE0N9Z
	mh57IqpgdGkVdifZI8wlrWq6d1k+/1hcp8iMW2TdVtmLI3UU+tTbyFOKtH0Fz9q01oxbRt
	W8s1T4u9+VWsKNjwUtYoNRhMWFFaLu0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-JXL9doQHO5Ke5CTw-ef0yA-1; Wed, 28 Sep 2022 06:31:50 -0400
X-MC-Unique: JXL9doQHO5Ke5CTw-ef0yA-1
Received: by mail-wr1-f71.google.com with SMTP id r22-20020adfa156000000b0022cc3018fbaso967867wrr.2
        for <alex.bennee@linaro.org>; Wed, 28 Sep 2022 03:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=r072hw4nq7j220SZv7l4j1oheSWPZXuwuBycfvaaNz0=;
        b=GnhQDcsRRVFzkpuCKVc8IsQX/aF4gXJL6VK65sK1PskfJJ6g/2WP3AY5wKw3z/4O1G
         YjmJSViK2gl+OR71+1yd1QmJCe9g5MHKMPveV/1ZY/3mcUAazbDqfz+Uow4XVsphoWbP
         kC1AyWWSyPBhqfHnPqboiE/qwOx2Ow6KET+VMcXgED60l2LZpGlyWe0FxAr7xgc+gMGi
         93F7prCMqASMGPb5ZKka7CP4tCR1SuSZdz4JXYzgJjZ+CnjdZKLW9P7WJLhPtuXh0VAQ
         GLsUwSvs4TzZKUe3XjryTSuscGxKxAW/oPvIr+ajm5oYCVEEqeqmgYXwjBMmgZxld8q+
         trJQ==
X-Gm-Message-State: ACrzQf3TAZyMHFjF2BrVrDrqdMhFIkw9QVvtGvu/tviB+eMuoXhGJhZK
	1JiP/2mmhRgC8eqkT5HCTuSw7N+10ADUxEJ5nJiMQRRCtE8fUwXjOubMMgfXuBTPqpEGzTlDXXM
	KfxkZYOlgwoVlAaR/
X-Received: by 2002:a05:600c:4f45:b0:3b4:9c9a:7077 with SMTP id m5-20020a05600c4f4500b003b49c9a7077mr6399712wmq.109.1664361109807;
        Wed, 28 Sep 2022 03:31:49 -0700 (PDT)
X-Received: by 2002:a05:600c:4f45:b0:3b4:9c9a:7077 with SMTP id m5-20020a05600c4f4500b003b49c9a7077mr6399679wmq.109.1664361109578;
        Wed, 28 Sep 2022 03:31:49 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.5] (ip-109-43-176-89.web.vodafone.de. [109.43.176.89])
        by smtp.gmail.com with ESMTPSA id q17-20020adff511000000b002253fd19a6asm4955356wro.18.2022.09.28.03.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 03:31:48 -0700 (PDT)
Message-ID: <23ed00ab-d774-81bb-5cf1-5cd077480720@redhat.com>
Date: Wed, 28 Sep 2022 12:31:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
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
 Willian Rampazzo <willianr@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 qemu-arm@nongnu.org, qemu-block@nongnu.org
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: kpl8WEmOhW4O

On 27/09/2022 13.05, Bin Meng wrote:
> In preparation to adding virtio-9p support on Windows, this series
> enables running qtest on Windows, so that we can run the virtio-9p
> tests on Windows to make sure it does not break accidently.

Thanks for your patches - I've picked many of them for my pull request that 
I sent out earlier today, so you don't have to carry them along anymore once 
the PR got merged.

For the patches that are not directly related to tests/ ... could you maybe 
ask the corresponding maintainers to pick those up? I'm not sure whether 
they should go through my testing branch, too...

Anyway, there seems to be one more issue: The migration test sometimes seems 
to be failing on aarch64 with all your patches applied:

87/470 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test 
             ERROR          261.71s   killed by signal 6 SIGABRT
 >>> MALLOC_PERTURB_=171 QTEST_QEMU_BINARY=./qemu-system-aarch64 
QTEST_QEMU_IMG=./qemu-img 
G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh 
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon 
/home/thuth/tmp/qemu-build/tests/qtest/migration-test --tap -k
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
stderr:
**
ERROR:../../devel/qemu/tests/qtest/migration-helpers.c:205:wait_for_migration_status: 
assertion failed: (g_test_timer_elapsed() < MIGRATION_STATUS_WAIT_TIMEOUT)
../../devel/qemu/tests/qtest/libqtest.c:201: kill_qemu() tried to terminate 
QEMU process but encountered exit status 1 (expected 0)

(test program exited with status code -6)
―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――

Not sure whether it's really related to your patches or whether it's 
something else that has been merged recently, I'm having problems to 
reproduce it reliably, but it's definitely something we should keep an eye on...

  Thomas
