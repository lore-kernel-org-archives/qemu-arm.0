Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2876082lfm;
        Mon, 29 Jun 2020 04:03:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrzlHGaUe4K47iOMdPZbJaQKreRU5i9LP3/9EoKGWyPL2YttmHTFsQCmN1/3MEpfxedlzk
X-Received: by 2002:a17:907:7283:: with SMTP id dt3mr13812973ejc.195.1593428617385;
        Mon, 29 Jun 2020 04:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593428617; cv=none;
        d=google.com; s=arc-20160816;
        b=yyI402Nsmk0hWgrvG0ASpnRP6tH0pXpgLGUbahdUKuUUnExt3BFZ4RTiPYXYdhWdS5
         3uChRZ2Itq37x4uRgdfZFClTgr523SlRD3T5g1I+h54umYXJIq8H1wt02gx666fdj5sb
         c3wipQ8jLBQOyjCWHSlRLS+7iNawIGCBoEkx/JzJUibogby9R4/DkdRxz4xy4FjpSof2
         A8K5wFn7UO85G07cLcQYHR156NpdJNpav23/DhKOCycqPvtUVp3MdwpxgE+anUbbsFut
         sD7UlPhoT3CzzBrtAk29vZwJyFKxoiSYsEVhN9BAWwEJsVqIDnwOK+Tmut/ryKdQ/PVL
         u7rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=SFgWDsAKiaAP3Q9MIiJTOW3EH9Qe5mC1cV0+xpFupio=;
        b=Jf7a01/5iOXlcdYT9zzd0nwCfBZqSrfKcAFupBOsjVwVoJdPraVKv9rB73D6aAAYe6
         og8BTZ1JTP6I77fgrMM3kv78/eiOK2GX5Layig4+KrJj6Kd3WKGse1MiKNf+BO6JKMmS
         y/Rs7QGGOHKxI+lOdrfKOudCKLDk+/awtotY9Fa8aS0GNiefpa4RgRMhwv9hcYzJ7RfT
         w44VsXUlCb2K9pZrQV7b5oAEfA/hlQmhE9u2WRD5hgmFAyMdo9D3Fsjx7wBzi2x4PEQn
         W2LbnHVGNOyw3LNITe+ksxdGoEMFCxVj6vG6uwT6zPSnvt/LtRj05Vz4pracbS4zZTQW
         pL6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TAm+X7NJ;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id bi2si6295657ejb.531.2020.06.29.04.03.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jun 2020 04:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TAm+X7NJ;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1593428616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SFgWDsAKiaAP3Q9MIiJTOW3EH9Qe5mC1cV0+xpFupio=;
	b=TAm+X7NJDPj/VeDCSEuOeo7ua0pa9VGymnzgIbK12IES4jOu5T5iilF3+d786p9doRW8gU
	Edp6r151MTBEc3c3VFNCa9n1lugQ4RI/8005ZugMMCwKFO4DZzQIwqRdOX4QtaAnaYzKY7
	gcbSYdemkyomQgpMrchQw27xeZyAW3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-rYWA8jqCOmeytstUFucyTQ-1; Mon, 29 Jun 2020 07:03:32 -0400
X-MC-Unique: rYWA8jqCOmeytstUFucyTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE1DB100CCC2;
	Mon, 29 Jun 2020 11:03:30 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-140.ams2.redhat.com [10.36.112.140])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A60C29367;
	Mon, 29 Jun 2020 11:03:23 +0000 (UTC)
Subject: Re: [PATCH v3 26/30] gitlab: enable check-tcg for linux-user tests
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>, cota@braap.org,
 aurelien@aurel32.net, qemu-arm <qemu-arm@nongnu.org>,
 Laurent Vivier <lvivier@redhat.com>
References: <20200626181357.26211-1-alex.bennee@linaro.org>
 <20200626181357.26211-27-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <9d44ff2f-a42a-449b-7e1a-8e006a510f6d@redhat.com>
Date: Mon, 29 Jun 2020 13:03:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200626181357.26211-27-alex.bennee@linaro.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: lNUGIvqEl8Ex

On 26/06/2020 20.13, Alex Bennée wrote:
> Switch to building in the new debian-all-test-cross image which has
> most of the cross compilers inline.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.yml | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
> index 5ae8130bd1a..17c3349dd9e 100644
> --- a/.gitlab-ci.yml
> +++ b/.gitlab-ci.yml
> @@ -140,10 +140,9 @@ build-tcg-disabled:
>   build-user:
>     <<: *native_build_job_definition
>     variables:
> -    IMAGE: ubuntu2004
> -    CONFIGURE_ARGS: --disable-system --disable-guest-agent
> -      --disable-capstone --disable-slirp --disable-fdt
> -    MAKE_CHECK_ARGS:  run-tcg-tests-i386-linux-user run-tcg-tests-x86_64-linux-user
> +    IMAGE: debian-all-test-cross
> +    CONFIGURE_ARGS: --disable-tools --disable-system
> +    MAKE_CHECK_ARGS: check-tcg

The pipeline is failing for me now:

https://gitlab.com/huth/qemu/-/jobs/615345144#L2654

qemu-arm: /builds/huth/qemu/linux-user/elfload.c:2321: pgb_reserved_va: 
Assertion `addr == test' failed.

Is that a known bug already?

  Thomas
