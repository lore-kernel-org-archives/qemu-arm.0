Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5609306ejc;
        Tue, 28 Feb 2023 02:40:13 -0800 (PST)
X-Google-Smtp-Source: AK7set92KrvvIKnk6X5cZDwrp5i4zf5mAK1ZrvV4HaKn0WKDOSsu9pbir00ppMthlsmiE1v7gxXO
X-Received: by 2002:a05:6214:c4d:b0:56e:a34c:d3c0 with SMTP id r13-20020a0562140c4d00b0056ea34cd3c0mr4263845qvj.15.1677580813445;
        Tue, 28 Feb 2023 02:40:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677580813; cv=none;
        d=google.com; s=arc-20160816;
        b=REb/9otR2x2sq4NjmobAH2/7QKJIfrLovUXvT/dFax5UzzERfb41W5czY9KR2Lss/N
         Z+RbSttVD8UKjX7ATSfCU2xISBLTff+7vMsD+EhfRvIjHKdFPdgRBTGBJHpdr28uiuYC
         bawaVBzqTcEKwdaQwebnjyvixYRKHIRnh6uFyTUu8Q36lB6kBMZX2srYUPBESoIZUKGb
         Pf3XcC8BEIpAPUf0p5ugVpdWksltAj6WZlLDauTKHPRZ+YTUMbsK3YbTzqmDi44QhC/z
         WIB7sIIzb6kAv0Z+qIWR5UvcoxyJSOosG6wPGnBlehHe8o8oHbeo/cYAbjugciltf5du
         j0Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=vlWOr6UclpuBL0BDe/S7bD6F7uu4g2yuIRAYJEkFyl0=;
        b=AU0eA56TfGBFK6Ng0IszC+ov7vDJFBLJtfN60NVlp17+4MOCEe3pGCBoQMe6F4bNas
         gijERxQNZd3k1Wxsw/TxHVteyUlKdMJ/i3aM6P0byHLMUt7F4z2xQKssZM5+nwUCbV9l
         cK0ayHSCNUFg1nfycivx4vc1Qb3LjaFAA3yA/oE/bkAKtbrDjjRjfEsbjvdyojLStu2u
         WyjsbyPHjtXgDhWcrQoNHmMJ4RrKHfOmDpgNVvmF2tzXWonuKYIQ4HAfOnmb8DlSRa6b
         kWmj3QLLlbg4xYi0kuZyrKdlDXkkcn782cG8K4mBT3s/XAWNAN8kdD4/K+c6gsXk0/c9
         FcrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MIbTnZWy;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id r1-20020a0ccc01000000b004e467237b6dsi8741780qvk.40.2023.02.28.02.40.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:40:13 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MIbTnZWy;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677580813;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vlWOr6UclpuBL0BDe/S7bD6F7uu4g2yuIRAYJEkFyl0=;
	b=MIbTnZWyNiGYaeSALzDonYZ8s15DHCYWvXqIYOByOP55HzYL5XaU/hFZOFDPNRP79mJ22F
	VX/6w8/z/tEVyDW/caVGE6k3qZ8cX5PnmGeOX4Txw3v0w3h0LjOTd4Kc7RQJX0wJ1GxnuH
	mrIjai+98tqMgEfKUkKi94SVuktJO7k=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-XQIWBFh3NbqbRaJ13N0j2g-1; Tue, 28 Feb 2023 05:40:09 -0500
X-MC-Unique: XQIWBFh3NbqbRaJ13N0j2g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CAD6F1C0434C;
	Tue, 28 Feb 2023 10:40:08 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7663492B12;
	Tue, 28 Feb 2023 10:40:03 +0000 (UTC)
Date: Tue, 28 Feb 2023 10:40:01 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-block@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	John Snow <jsnow@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
	Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 4/7] tests/docker: add USER stanzas to non-lci images
Message-ID: <Y/3aAWjI5tX/D/2C@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-5-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224180857.1050220-5-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
X-TUID: 0NVFdHtsxAv5

On Fri, Feb 24, 2023 at 06:08:54PM +0000, Alex Bennée wrote:
> These are flat but not generated by lcitool so we need to manually
> update them with the `useradd` stanza.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/debian-all-test-cross.docker     | 5 +++++
>  tests/docker/dockerfiles/debian-alpha-cross.docker        | 5 +++++
>  tests/docker/dockerfiles/debian-hexagon-cross.docker      | 5 +++++
>  tests/docker/dockerfiles/debian-hppa-cross.docker         | 5 +++++
>  tests/docker/dockerfiles/debian-loongarch-cross.docker    | 5 +++++
>  tests/docker/dockerfiles/debian-m68k-cross.docker         | 5 +++++
>  tests/docker/dockerfiles/debian-mips-cross.docker         | 5 +++++
>  tests/docker/dockerfiles/debian-mips64-cross.docker       | 5 +++++
>  tests/docker/dockerfiles/debian-native.docker             | 5 +++++
>  tests/docker/dockerfiles/debian-powerpc-test-cross.docker | 6 +++++-
>  tests/docker/dockerfiles/debian-riscv64-cross.docker      | 5 +++++
>  tests/docker/dockerfiles/debian-riscv64-test-cross.docker | 5 +++++
>  tests/docker/dockerfiles/debian-sh4-cross.docker          | 5 +++++
>  tests/docker/dockerfiles/debian-sparc64-cross.docker      | 5 +++++
>  tests/docker/dockerfiles/debian-toolchain.docker          | 5 +++++
>  tests/docker/dockerfiles/debian-tricore-cross.docker      | 5 +++++
>  tests/docker/dockerfiles/debian-xtensa-cross.docker       | 5 +++++
>  tests/docker/dockerfiles/fedora-cris-cross.docker         | 5 +++++
>  tests/docker/dockerfiles/fedora-i386-cross.docker         | 5 +++++

Unrelated to this, but I mentioned in another thread, that we
should really drop the fedora-i386 and tell lcitool to generate
a debian-i386 docker file one day. There's no compelling reason
for it to be an exception and use Fedora instead of Debian.

>  tests/docker/dockerfiles/python.docker                    | 5 +++++
>  20 files changed, 100 insertions(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
