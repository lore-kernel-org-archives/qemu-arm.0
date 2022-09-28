Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp374462ocs;
        Wed, 28 Sep 2022 08:31:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zGQ5NqvE1kqATNnmnRn+JSoZsKn6P3FT9RZh3CbBRwZruKBdilQyL/MlmHlX4x5PEvw75
X-Received: by 2002:a05:620a:1a25:b0:6ce:17ae:fa9d with SMTP id bk37-20020a05620a1a2500b006ce17aefa9dmr20924164qkb.680.1664379063681;
        Wed, 28 Sep 2022 08:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664379063; cv=none;
        d=google.com; s=arc-20160816;
        b=gcy/a1R/KmlAYOX8CPyY/j+sY0O/DCvwLhHn/mnb7V+LPJqmLqAx0caAVA72bVs9vp
         yZtv9DJhqyiQh15PsWVHP6lPCj7RINhtRUN9nc9X/ugMjhb7GV6Y2TdvKVGObR5zq5VJ
         Q/Dpi4i5L11T2dyXubgZRpX4ImYKQLu8CUHwxSfkONfKB6avebeEqvmibtzvz+Q1qT3x
         m0DIZ1bCTMQQLCBHVfInocbc6ul1oCa1pJGsmuH2IB2GWXorlCwu1uM7+UB4RC4BR3Lz
         P2qNs4povma0YdUnyeo9GGuIduTQMciXMkRw08P8hLQkQTsJHn5/WaOjQ2336j77YYzA
         G5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=pkKlJGkQoCpm+3CPCA4+XR4A8rC+/6N5P4McUxbJ5VU=;
        b=DCtV1ZN5xtPQ9DtQRkckA6XD1xKbzF5/luCV9lq/r7m4Cm+VgcIgzPslL1ze1rH26B
         nMNtt8RIMH6pqsYXvyQAaHdQkiL0WfxPMfSkmkzWLy6Mam39wIPPGsuzLk1cpdxxXzFI
         P59Tgu+gW5u/hpG4tBTsahn01dPsqNA1gKl8f4XA6gHh7qVxlP4P84TGYgy/tVUp7PFA
         8touGdAdo6HBcD3wggVVdSpO0VRtBpTMzZjhrjTjuAEF4kYUchuB/JgFYFk+zoEfdzdF
         J8DIGsHelE5oyarux+rIgTlq9Y2xcvD+3btVFsriHordj0US3etYzAmu5/MFKlRzTzUV
         kSzg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YTmBQIO4;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 19-20020ac85713000000b0034302879293si3433359qtw.151.2022.09.28.08.31.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:31:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YTmBQIO4;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1664379063;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pkKlJGkQoCpm+3CPCA4+XR4A8rC+/6N5P4McUxbJ5VU=;
	b=YTmBQIO42tr4Of6/KsAOy1aqGTcKF3nUAyJcYGktlQy5u5ZIkjD7zePjVlNAxwrd1UeHK/
	gfAwnM705Krdj9uwbFzRWdDmH1WO+6mvWeuqEZO7SUM+R9VXNu93Et3RJf5Jyb6jFZJ/5R
	JjAt0fsA45WnbCe97TX3G1ZDAvwm4sU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-627-EEPs4vkTOEKWPvLcX90weg-1; Wed, 28 Sep 2022 11:30:57 -0400
X-MC-Unique: EEPs4vkTOEKWPvLcX90weg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B906B882827;
	Wed, 28 Sep 2022 15:30:55 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.68])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 146D9C15BA4;
	Wed, 28 Sep 2022 15:30:47 +0000 (UTC)
Date: Wed, 28 Sep 2022 16:30:45 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Alexander Bulekov <alxndr@bu.edu>, Andrew Jeffery <andrew@aj.id.au>,
	Ani Sinha <ani@anisinha.ca>, Bandan Das <bsd@redhat.com>,
	Beraldo Leal <bleal@redhat.com>, Bin Meng <bin.meng@windriver.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	Darren Kenny <darren.kenny@oracle.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>, Fam Zheng <fam@euphon.net>,
	Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Joel Stanley <joel@jms.id.au>,
	John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Konstantin Kostiuk <kkostiuk@redhat.com>,
	Laurent Vivier <lvivier@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Qiuhao Li <Qiuhao.Li@outlook.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v4 00/54] tests/qtest: Enable running qtest on Windows
Message-ID: <YzRopeuYNDFBI7AO@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <23ed00ab-d774-81bb-5cf1-5cd077480720@redhat.com>
 <4cb2dea7-6c3d-4b4c-647d-979889bddc9c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4cb2dea7-6c3d-4b4c-647d-979889bddc9c@redhat.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: Zl6NaaXITF0r

On Wed, Sep 28, 2022 at 05:24:56PM +0200, Thomas Huth wrote:
> On 28/09/2022 12.31, Thomas Huth wrote:
> > On 27/09/2022 13.05, Bin Meng wrote:
> > > In preparation to adding virtio-9p support on Windows, this series
> > > enables running qtest on Windows, so that we can run the virtio-9p
> > > tests on Windows to make sure it does not break accidently.
> > 
> > Thanks for your patches - I've picked many of them for my pull request
> > that I sent out earlier today, so you don't have to carry them along
> > anymore once the PR got merged.
> > 
> > For the patches that are not directly related to tests/ ... could you
> > maybe ask the corresponding maintainers to pick those up? I'm not sure
> > whether they should go through my testing branch, too...
> > 
> > Anyway, there seems to be one more issue: The migration test sometimes
> > seems to be failing on aarch64 with all your patches applied:
> > 
> > 87/470 qemu:qtest+qtest-aarch64 / qtest-aarch64/migration-test
> > ERROR          261.71s   killed by signal 6 SIGABRT
> >  >>> MALLOC_PERTURB_=171 QTEST_QEMU_BINARY=./qemu-system-aarch64
> > QTEST_QEMU_IMG=./qemu-img
> > G_TEST_DBUS_DAEMON=/home/thuth/devel/qemu/tests/dbus-vmstate-daemon.sh
> > QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-storage-daemon
> > /home/thuth/tmp/qemu-build/tests/qtest/migration-test --tap -k
> > ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> > stderr:
> > **
> > ERROR:../../devel/qemu/tests/qtest/migration-helpers.c:205:wait_for_migration_status:
> > assertion failed: (g_test_timer_elapsed() <
> > MIGRATION_STATUS_WAIT_TIMEOUT)
> > ../../devel/qemu/tests/qtest/libqtest.c:201: kill_qemu() tried to
> > terminate QEMU process but encountered exit status 1 (expected 0)
> > 
> > (test program exited with status code -6)
> > ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
> > 
> > Not sure whether it's really related to your patches or whether it's
> > something else that has been merged recently, I'm having problems to
> > reproduce it reliably, but it's definitely something we should keep an
> > eye on...
> 
> Seems like somebody also ran into this issue with a vanilla QEMU:
> 
>  https://gitlab.com/qemu-project/qemu/-/issues/1230
> 
> So it's not related to your patch series.

This status timeout was something we merged in last cycle. We've
long had wierd hangs in the migration tests and this timeout change
was an attempt to turn the test suite hangs into explicit failures
for greater visibility. I guess this is working as intended, but
we're not really closer to understanding what the root problem is
we're hitting.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
