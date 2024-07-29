Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1718900njb;
        Mon, 29 Jul 2024 04:08:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXgKasVo3LfDg6lDHRWQWhf4nVmPrSyD+aCAGsUVmQhhtkKLMfsbU9qZRsewr9PD9Oc2TiwaQOmxoYQZBXW7BPKFUhF9gWP
X-Google-Smtp-Source: AGHT+IFhjW+G6IFhw8lshsDp4FdpYgb+K2R0sivUdy9lCPo/ro97L/JtkMWN9QN3W9Q4kKqG+FVj
X-Received: by 2002:a05:622a:1a10:b0:44f:e49c:8ef7 with SMTP id d75a77b69052e-45004f88fedmr99638741cf.57.1722251335179;
        Mon, 29 Jul 2024 04:08:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722251335; cv=none;
        d=google.com; s=arc-20160816;
        b=F197ev5c3zAJ0a1d53RJxPTjfxyaoB0V7awBPtS60ZkR9Hvl3voaIxz99zJvjJVNk9
         PLl68voPtXh/j3lF+69/pCPVGR7ZxYcD/PHqVZEkEVGWfRXBPSclgtegm3JBnoazQ2F9
         DVnIuoOltL2CFlUlUfLa3zGnm+uoTvAiHBGxxPSPKjQGmxwli/XeE4tdDU7chC3LLWDR
         ekRQD0zZDgRIwdKzV7ukisaxlaRQ9pwFxWplQEbiWUkpjFZog2EaDlgUDvGJZ0uot6K+
         kngnckUQndD9Wv1KAB/zCmnwPUggul/o9DcHxPNf2S6BAVPmzpwbQBePEdmyt7uDDfVb
         FkdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=B1VdBTnyn5qt9IYla/ESU9CYnd0IBiOOUAW5rSXdVM8=;
        fh=wNhxSdiHg8xiqcUd0ic1q+ay8XePjEEHF9Rtf9iA5Kw=;
        b=bAi9mBqETJo4lmhD8ooSrz9cc6WBuqi+uefM72BQxozptuZsetczecXkbw/auNiKuk
         W0JbPHBUiGQAwqq3pJ2f0dvzKNdXiHv1gc9AFEui4ShjEYLCU2PF5EFUFjoHhHqsGD8v
         S8TgqhBYlk0LnM2KO4mIinyrBsVtPgTTdr/5dLq8Qvlx2FSnRNlVtC1ov+YusQ0zkJU2
         QBdvtinHhkt7YNPmAsb7vOj43H8oFufIKP3lD7H7todOvDDD6h+kL/5jhHZIDITYSgQf
         aKCF10Ik1tSSg+uWFltioRbZddz5v2WMajrZj4szbFCup8Sdnr1n0LpUMvXDO4rAgOMU
         mXfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g1v9N+EK;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe8420b53si99865261cf.553.2024.07.29.04.08.55
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 04:08:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=g1v9N+EK;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722251334;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=B1VdBTnyn5qt9IYla/ESU9CYnd0IBiOOUAW5rSXdVM8=;
	b=g1v9N+EK2tazg+XKlXagf2OuSg8PpVR44hgAK5xKfBHEOzHJS3sz3hMzJo1lRLAKfg7OTI
	2zwEdXlHDtoZOKc+db4t2CnpAqssQULvwI22IokO7K39zqIR658288N8X01YH0wGJG/wtr
	6CfgVgfDD5cUeScgD6YZoQw/eDHqgss=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-193-1lHYfOtrOJu55Ip7tXWDBQ-1; Mon,
 29 Jul 2024 07:08:51 -0400
X-MC-Unique: 1lHYfOtrOJu55Ip7tXWDBQ-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4B32E19560B4;
	Mon, 29 Jul 2024 11:08:49 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.58])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 291E11955F68;
	Mon, 29 Jul 2024 11:08:42 +0000 (UTC)
Date: Mon, 29 Jul 2024 12:08:39 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	qemu-arm@nongnu.org, Radoslaw Biernacki <rad@semihalf.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 12/13] Bump avocado to 103.0
Message-ID: <Zqd4N0udouYyI_d-@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-13-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240726134438.14720-13-crosa@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 9hUiJnQJjAzG

On Fri, Jul 26, 2024 at 09:44:37AM -0400, Cleber Rosa wrote:
> This bumps Avocado to latest the LTS release.
> 
> An LTS release is one that can receive bugfixes and guarantees
> stability for a much longer period and has incremental minor releases
> made.
> 
> Even though the 103.0 LTS release is pretty a rewrite of Avocado when
> compared to 88.1, the behavior of all existing tests under
> tests/avocado has been extensively tested no regression in behavior
> was found.

Rebasing to a completely re-written test harness while in freeze feels
on the risky side to me, despite the known problems we have with the
existing release. 

> Reference: https://avocado-framework.readthedocs.io/en/103.0/releases/lts/103_0.html
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  pythondeps.toml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/pythondeps.toml b/pythondeps.toml
> index f6e590fdd8..175cf99241 100644
> --- a/pythondeps.toml
> +++ b/pythondeps.toml
> @@ -30,5 +30,5 @@ sphinx_rtd_theme = { accepted = ">=0.5", installed = "1.1.1" }
>  # Note that qemu.git/python/ is always implicitly installed.
>  # Prefer an LTS version when updating the accepted versions of
>  # avocado-framework, for example right now the limit is 92.x.
> -avocado-framework = { accepted = "(>=88.1, <93.0)", installed = "88.1", canary = "avocado" }
> +avocado-framework = { accepted = "(>=103.0, <104.0)", installed = "103.0", canary = "avocado" }
>  pycdlib = { accepted = ">=1.11.0" }
> -- 
> 2.45.2
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
