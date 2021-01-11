Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2798230lfq;
        Mon, 11 Jan 2021 08:09:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJywZtL6F3ht01TorhbHJzrJKuCzBoIqQGZmrKU1wnSB+QMzP3xkTil7a9U7AS6Jpi/X4lOi
X-Received: by 2002:a05:6402:1748:: with SMTP id v8mr100908edx.136.1610381352539;
        Mon, 11 Jan 2021 08:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610381352; cv=none;
        d=google.com; s=arc-20160816;
        b=zt6sM7tHrnmWS33FUHConRD+pIxlzpSiN1QMjg4ODX4PjsWzQG5L7jed+p3j19bmm2
         Q1knVsGGDXe7MaEoF1EqYMOGO8Geuzr1JNCSlJAJEUHfCzb7w13YGqh+2ug7c/I8Jb0N
         Lhb8jOMkvP1twIxXcj1BgRhkqs/Z8Iq31p4aoTJI9uBiJsEukCM59uYOavJ6CP3/xpYO
         YtitzHr0NCBZ0tjKPvdavV/uocZ9dWvoFZjF8ACZYdxmS+tGR1cMY66bof7QWCJ346jp
         m7yLCejKUjYnd1OtAOANszGzhf8bHgkXGFPPZNVYDaOq0z4cnDOGupd3UdBdb3SktyiE
         i4Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:from:references:cc:to
         :subject:dkim-signature;
        bh=IqZECK3bv/kq2PlxvYKy5vkzkPsMC3YF/nEVS5UP5IQ=;
        b=J/u9ejR6CJHjkJ3qv6GpdYNMPKiLcY7ZvzongNbs4r5pVUOKoe7Rk8d3ZBNjV9MJW5
         AiwDRgvH/0EmGO1PxmGUYGxWm7lo/pTRJsFxanfojIx+sMSyRz3jwrRpaosLJeQX+3up
         i7s5h7bTTe6+Bpoe0LI9z1vTKL0awkQNu+1fMigoqnD8iOGMGmkuIF7AO7ha44pLMBC3
         LdIZfkArh4uZqYJ78pBpd1SQKLWKtEgmYchAxq1ySfz6k4XCq7z/pMvjWY/4M9VbKKjX
         bEUqdPqmwo1k1bFDWlqseY4upIwEWJlWbsTey2sg5fn7SDr6O6JykgU0LgiO3GjIuqPM
         gTNw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vgjmw0nW;
       spf=pass (google.com: domain of david@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <david@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id x13si6973844ejb.243.2021.01.11.08.09.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jan 2021 08:09:12 -0800 (PST)
Received-SPF: pass (google.com: domain of david@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Vgjmw0nW;
       spf=pass (google.com: domain of david@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=david@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1610381351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IqZECK3bv/kq2PlxvYKy5vkzkPsMC3YF/nEVS5UP5IQ=;
	b=Vgjmw0nWVC5HoR3M30sRNV6nWu50D8R9oRR33cDWMlm083WXjYdPlwZ9oL9R8/pUnivedt
	eDzCULIqcdKt0MLN2FhfHXeSkBPFa5vWpym6icJ/YkJKtZu2+hNRZqvTy12Ktl8yY1LzBb
	O9L07k8iQbNlwdWXSOsO4XwxEKDvA/A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-425-O2U0HcbVM36YveqpPWI5Bw-1; Mon, 11 Jan 2021 11:09:07 -0500
X-MC-Unique: O2U0HcbVM36YveqpPWI5Bw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 04077803622;
	Mon, 11 Jan 2021 16:09:03 +0000 (UTC)
Received: from [10.36.115.103] (ovpn-115-103.ams2.redhat.com [10.36.115.103])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7DA6B19C59;
	Mon, 11 Jan 2021 16:08:39 +0000 (UTC)
Subject: Re: [PATCH 1/2] sysemu/runstate: Let runstate_is_running() return
 bool
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Huacai Chen <chenhuacai@kernel.org>, Greg Kurz <groug@kaod.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Amit Shah <amit@kernel.org>, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>, qemu-s390x@nongnu.org,
 Paul Durrant <paul@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Halil Pasic <pasic@linux.ibm.com>, Fam Zheng <fam@euphon.net>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 kvm@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Cornelia Huck <cohuck@redhat.com>,
 qemu-block@nongnu.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>
References: <20210111152020.1422021-1-philmd@redhat.com>
 <20210111152020.1422021-2-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <e8da7869-1c39-128a-b494-09ddc0d6b0e4@redhat.com>
Date: Mon, 11 Jan 2021 17:08:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210111152020.1422021-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-TUID: cIGEQEtOlSh2

On 11.01.21 16:20, Philippe Mathieu-Daudé wrote:
> runstate_check() returns a boolean. runstate_is_running()
> returns what runstate_check() returns, also a boolean.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/sysemu/runstate.h | 2 +-
>  softmmu/runstate.c        | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sysemu/runstate.h b/include/sysemu/runstate.h
> index e557f470d42..3ab35a039a0 100644
> --- a/include/sysemu/runstate.h
> +++ b/include/sysemu/runstate.h
> @@ -6,7 +6,7 @@
>  
>  bool runstate_check(RunState state);
>  void runstate_set(RunState new_state);
> -int runstate_is_running(void);
> +bool runstate_is_running(void);
>  bool runstate_needs_reset(void);
>  bool runstate_store(char *str, size_t size);
>  
> diff --git a/softmmu/runstate.c b/softmmu/runstate.c
> index 636aab0addb..c7a67147d17 100644
> --- a/softmmu/runstate.c
> +++ b/softmmu/runstate.c
> @@ -217,7 +217,7 @@ void runstate_set(RunState new_state)
>      current_run_state = new_state;
>  }
>  
> -int runstate_is_running(void)
> +bool runstate_is_running(void)
>  {
>      return runstate_check(RUN_STATE_RUNNING);
>  }
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb
