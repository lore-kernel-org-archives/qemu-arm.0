Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6612886ejc;
        Tue, 28 Feb 2023 22:51:36 -0800 (PST)
X-Google-Smtp-Source: AK7set86xPV/NURrI2ILp/y8g3nrP3rHsGEjkZ/Z4qgoGkVuouLzSmUGk3b4ESRQGcRqRiHml08M
X-Received: by 2002:a05:6402:1016:b0:4ac:d973:bb2c with SMTP id c22-20020a056402101600b004acd973bb2cmr6214415edu.28.1677653496283;
        Tue, 28 Feb 2023 22:51:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677653496; cv=none;
        d=google.com; s=arc-20160816;
        b=lX+7rIbFYyXiWCzE9gaEwbA3YQi/Xqu/Du1JFK/I4rsJsUXH90tfrboKaac8Z0uyiV
         psbaT/Uubhpr6+9A4Pc7ehjxlUnHktGiFyI4XxNe8p5821iTwtKRujKBcZPQ29FeVSPf
         bvCVaYuPYZjuFimoU/RWIhw6DYmIU4/rVQB+CFf48V30lJQn4DqW9eQh/JZb8vHapGxH
         MIylbv97JP1SstXMofttd8Xk1OPzqNmR15WPT0l267yX86GJHGUt/c7G+huR4CRrz4vT
         dnyLywlIvkuJQADlYIh97A7OVBIUuDJb40n4+OSvPRx4NmX4YecHM9Ebnw6TBEJTVfd3
         puMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ogcx5DhNbs0kPQsBcGT4fpTGR69uQde5lIC/j0vtRXE=;
        b=GrBsD0ZIHTL5gAJG5q0Lj8jYJ1AW6Mpyw+jL76xCf9g1zp/+Ydm4BJvO7fGHS3PM5/
         HS5aNUDMomveMBbFlQ3P3MN6Hcvbo8zI2xN/QFTEOoLw3SzoMpnoZ4aF7cMCuSXKUTIn
         8CNayGbPmH3zwJeUOO9dBaeHGQomWg2G9ZntoE94/jCnRekBBlqc8hJ2lR0V0k+hURrR
         qX8h3JM98sqhWTGd2Vh5zM1MMuAtWYkpZfbu7sNb5e1yqwmvMU3YcFKTxH0l18Ofi8Hg
         HoGCXuLcZkifJyCQmWuVK1IagTaJEJW2bEFVZXduSNROfS4Qv4bI3tPwwB43JAOPAD+Q
         rJeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MFCn7ja6;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a1-20020a50e701000000b004abd2054781si14078490edn.92.2023.02.28.22.51.35
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 22:51:36 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MFCn7ja6;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677653495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ogcx5DhNbs0kPQsBcGT4fpTGR69uQde5lIC/j0vtRXE=;
	b=MFCn7ja6QRjL9+PLnonjXtulNMihe2CrWfzTST8yHynFBibsiMexNFIFaenzHYLlV+3bqM
	t6JDNqi8r6xV6ZGF++j4gs2DYbrlSMnPtXKoN6go/bpgAUIiOLXuNyovXYMzcGc0cF5PKi
	bOBD9MiVKuAabbByTAKgAW27Tqgn/RQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-BcNHryK4MYO7ZPs-Jl5aAQ-1; Wed, 01 Mar 2023 01:51:34 -0500
X-MC-Unique: BcNHryK4MYO7ZPs-Jl5aAQ-1
Received: by mail-wm1-f72.google.com with SMTP id m28-20020a05600c3b1c00b003e7d4662b83so7941801wms.0
        for <alex.bennee@linaro.org>; Tue, 28 Feb 2023 22:51:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ogcx5DhNbs0kPQsBcGT4fpTGR69uQde5lIC/j0vtRXE=;
        b=qtNhrN1lkoaLGHdO4JM5p7rAa9rVVxtGL7tXIeCHk3p8vuSbGTW8V48EvaQVHigPQ6
         65kapqMMuKb1WI58nDAobdb9F4UcpGhcKOPOss8Smj4S7yRfZv3tTkL0WhgCt1d149CK
         7OanAMwvIOvvAt+N7qMlOSrvF7hpM+z7TrD0xtNGLFgEq4Q5BxPbG/uU4Z7TvyCd6oNG
         SjjS+QCkP2TilRNICm4+dGfFCdjlf9lVWYnhptXw+16DMdPG8UewZ29ssIy9JOvFsGOJ
         nkfYfGZWWJwdvJOka7Q036FtWrHVlvknWVsjU5LomcSjg3MCiahtwXR8zg6A/ISiHRC+
         08cw==
X-Gm-Message-State: AO0yUKV0Il5opkEJ6vmOk9IorqKvAPy0TXFTvisfdiI1hPc020s1ZNOB
	lPn9tFANkKFgZaS96icBOuc49UeThDG1KgjwwbkhKVNujvfCk7KffbyTX62r8t0ic8o7S8DSg8p
	R7yAeJbsJ3GsW5JhR
X-Received: by 2002:a05:600c:2ed3:b0:3c6:e61e:ae71 with SMTP id q19-20020a05600c2ed300b003c6e61eae71mr4746513wmn.1.1677653493154;
        Tue, 28 Feb 2023 22:51:33 -0800 (PST)
X-Received: by 2002:a05:600c:2ed3:b0:3c6:e61e:ae71 with SMTP id q19-20020a05600c2ed300b003c6e61eae71mr4746493wmn.1.1677653492872;
        Tue, 28 Feb 2023 22:51:32 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.8.100] (tmo-114-247.customers.d1-online.com. [80.187.114.247])
        by smtp.gmail.com with ESMTPSA id n41-20020a05600c3ba900b003e20fa01a86sm15879007wms.13.2023.02.28.22.51.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 22:51:32 -0800 (PST)
Message-ID: <199f0714-901a-a15d-690a-2a2f56db015a@redhat.com>
Date: Wed, 1 Mar 2023 07:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 22/24] gitlab: move the majority of artefact handling
 to a template
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Peter Maydell
 <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>, Markus Armbruster
 <armbru@redhat.com>, Darren Kenny <darren.kenny@oracle.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-arm@nongnu.org, Fam Zheng <fam@euphon.net>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
 <20230228190653.1602033-23-alex.bennee@linaro.org>
 <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <85fa3961-eb23-8d93-b4e4-e3e4227fac26@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: EPmXLt+MvFsQ

On 28/02/2023 22.41, Philippe Mathieu-Daudé wrote:
> On 28/2/23 20:06, Alex Bennée wrote:
>> To avoid lots of copy and paste lets deal with artefacts in a
>> template. This way we can filter out most of the pre-binary object and
>> library files we no longer need as we have the final binaries.
>>
>> build-system-alpine also saved .git-submodule-status so for simplicity
>> we bring that into the template as well.
>>
>> As an example the build-system-ubuntu artefacts before this patch
>> where around 1.3 GB, after dropping the object files it comes to 970
>> MB.
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   .gitlab-ci.d/buildtest-template.yml | 16 ++++++
>>   .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
>>   2 files changed, 46 insertions(+), 51 deletions(-)
> 
> This is still kludging the fact that 'make check-qtest' rebuild
> the world even if QEMU binaries are present.

Did you try? ... if so, that would kill even more CI minutes, i.e. it would 
IMHO be a show-stopper for this patch.

  Thomas
