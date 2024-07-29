Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1715819njb;
        Mon, 29 Jul 2024 04:03:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWjzva75bRwkMTgUavajdx8PUWo6/v1CaR8jlJw1RspsWRKMxZ0nKG2wDsDn03kpzfHA/5OQIZl6MbVjy6WDnm+NzaCFfEn
X-Google-Smtp-Source: AGHT+IFIH8OD9UCFZSZgXWBq0HDnjp73txQnrcrG0Ku/8mwKbzKPDLj7WXlepH8JBXPthd0wc3h+
X-Received: by 2002:ac8:588c:0:b0:446:5a11:948 with SMTP id d75a77b69052e-45004d8025dmr87807371cf.18.1722250984096;
        Mon, 29 Jul 2024 04:03:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722250984; cv=none;
        d=google.com; s=arc-20160816;
        b=bXxxohkPsgqlDFdrVxdlzOYDQCyJxMQdEXE/kRfalJA4BVRGLjSsWXD9WuxSUUvEm3
         fdirWxy+DzWo2tHqrKEDIoz8VvUU1tWsGVGF+hBfpyGDlGrYUmZZnbqCkFNEDrLp4Icw
         P5NvDhGrLRYclSSg+ko5kV+7sWOWlODK1hqVhiFPRyp/RxbyHZLRRO0rECghAnZ8Pfpx
         V97H9kS5hZC3TKCISlkl9QAL+BZsvXHLauBSlCagvEJxKm6J54l+pG9VCEaUvTHDakcj
         9b/MIWhpqdBZK55YJ8Kj0r3fN8iDeop50qvlchyAYvhn0QzMliai6h1GnyaBE94DPuT0
         qIgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=lHtsD9q5KSNJOV/ib7lNeLysfNO5jDLnCk9DXQJAWVg=;
        fh=wNhxSdiHg8xiqcUd0ic1q+ay8XePjEEHF9Rtf9iA5Kw=;
        b=UJyWL2G7wiRyFgHfp8XuOEfz6wtNLT3nU4hgQILdQZJs9uk7rDqN4zoPf+BgK+t1aT
         0nxiwQQSQkbycAiZp5nXDIHDr/f0hiktrCpBEuJ6CzctNLHxOJ2pV1E95nXEuodOFLM1
         hrTraAb+3uskSOsDzLvqrruNJ4S7Lc8hlZ+nWwDAdThaD08a73bFpAbtWmHp1wfiAi3l
         eGZ4UUf9oGcGFMCreFU4TUgJbiuDx7rphhkKB+5+GguU8NN95L/DiuyeIysx+OyUH6Q5
         5x5pjt+nI7vkxhCJ0mw6bSHlrflg8m/+iV+kF0Cq/PApfJiofrq/AXWVIwibf1LSK4Gq
         7vkA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IU+GlK6E;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe81fbb86si98039181cf.288.2024.07.29.04.03.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 04:03:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IU+GlK6E;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722250983;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHtsD9q5KSNJOV/ib7lNeLysfNO5jDLnCk9DXQJAWVg=;
	b=IU+GlK6EN7cZ7WL66whX3yyBVd6Zc76Fl2+XnQDNrYV4jHXu4LOydFUQUZWbAUJ8cBq+9/
	5aS1ESmjCugVeVvz0JttjiwoXqYoJJuRq+jAuJq/R+nHWLEZ/AzV88UwZzI7CP+ueDhm3E
	JroWrbZ0CB1KWspH0xtdYSEIcVUL7v8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-445-NO1_RjZ0O1-N-_icG1jiuA-1; Mon,
 29 Jul 2024 07:02:59 -0400
X-MC-Unique: NO1_RjZ0O1-N-_icG1jiuA-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6B5311955D50;
	Mon, 29 Jul 2024 11:02:57 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.58])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4342B1955F6E;
	Mon, 29 Jul 2024 11:02:43 +0000 (UTC)
Date: Mon, 29 Jul 2024 12:02:40 +0100
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
Subject: Re: [PATCH 10/13] tests/avocado/tuxrun_baselines.py: use Avocado's
 zstd support
Message-ID: <Zqd20A6BhOS47PcH@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240726134438.14720-1-crosa@redhat.com>
 <20240726134438.14720-11-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726134438.14720-11-crosa@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 6TgLvh/dmiXs

On Fri, Jul 26, 2024 at 09:44:35AM -0400, Cleber Rosa wrote:
> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> ---
>  tests/avocado/tuxrun_baselines.py | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
