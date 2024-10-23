Received: by 2002:a17:504:4a21:b0:1be9:327d:8ee3 with SMTP id wq1csp406620njb;
        Wed, 23 Oct 2024 06:14:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHa1EnwC/T8qToV3e2rXmjNQOCcZO+2oIYYkSO9Y/F/SKC67gj+nJakfszwTOQ8VIzF6dNH
X-Received: by 2002:ac8:598e:0:b0:458:2a24:6ed6 with SMTP id d75a77b69052e-461145befb7mr29809321cf.21.1729689268217;
        Wed, 23 Oct 2024 06:14:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729689268; cv=none;
        d=google.com; s=arc-20240605;
        b=NL9LtoOVMnPiBHvUdT48YTCE4lM5xsPsHVLf0XEA7F+RE21vquGtxq3imxIS+eYbdM
         09aiPUU4M1L5S0aZYj6OZn7yyY2r9BPMNTYOGdNZ9Jh3FviYK4vZeVM9TejoOFVIjkOl
         CdbOiecyhUSSXzMsZ/uLSBA7zYmEP85k+suLadaAeeinsTNM+7wb2c+NWP8u4d1jvptj
         FXgJnZNdFB0C9IFfMRLM1drNTtx6C7XKxrnDWLrgYJyTkh4yMnr0cHmfW2CiD5ZBIT8H
         qrpAVoO2/bBY8EQPDXiBCjSIOgXCoOlcLpI5VeZIm2YexKlRm+gy39lFsIwo8a3VU/hu
         AO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=+b3DDwCyM3dIDJrog05I+Xx0Ggfa5QHIq1W48Um5CTU=;
        fh=PsI3NmtKm5/RAnNNV7hEx6tyseYhuPI0nZhotP/PYqE=;
        b=Cz7X+ygZdcRgAob/bjxoH324WN1k6RmfRZuBJjuGZHNZ+4A9FDRs9CGAMDT8U30F4V
         7GWc7tIRRqTq0AaGEQry6xCq4AOPWyEo8k1KEVyiA7HkKLD6Hf9/UIv19dHTAK9O9RT3
         iVYtb2DQjHHa8ax9KgLniyf9fQIXg0cg1meuKzz8e8Ffg64Y8XI6MCt7O3aaxgFH6xPV
         stoej3yAiaHkjPuqU81Kpvy7d/emtTKQeN/8iNxzNxTCOI3+BCDMRRIltxkV34gqUw1q
         kIC/G+Fv8sDOzEh/kFuMzgXf3XuE6UgBF15ynnC6Vd29gdcnCk9i7RjuPeLHixW/3bct
         vGjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IUDvXMzL;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-460e89cae9csi76532611cf.308.2024.10.23.06.14.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 06:14:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IUDvXMzL;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729689267;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+b3DDwCyM3dIDJrog05I+Xx0Ggfa5QHIq1W48Um5CTU=;
	b=IUDvXMzLNlrQeY2GdSzifX/argW8vlrJUjNt1iA4fmGHSVanCDevL0c7rFKPTfBQNnq7Qw
	2lNXDEZdfcl8bOOtKbXIED5QMqd7pvB6JOhslC1GYUDsmjDy5AvbLfI+dqmPjXwUQ6SovA
	hF6jz8J1Ik1uwusSil1ipItTmF6y3WY=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-sADDw2CRP-KNiv6bR-Payw-1; Wed,
 23 Oct 2024 09:14:23 -0400
X-MC-Unique: sADDw2CRP-KNiv6bR-Payw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6E6A11964CC1;
	Wed, 23 Oct 2024 13:14:20 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.19])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CE38119560AE;
	Wed, 23 Oct 2024 13:14:10 +0000 (UTC)
Date: Wed, 23 Oct 2024 14:14:07 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Yanan Wang <wangyanan55@huawei.com>, John Snow <jsnow@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	devel@lists.libvirt.org, Marcelo Tosatti <mtosatti@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>, qemu-arm@nongnu.org,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Cleber Rosa <crosa@redhat.com>, kvm@vger.kernel.org,
	Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 10/18] gitlab: make check-[dco|patch] a little more
 verbose
Message-ID: <Zxj2n0kxAtnIAd9A@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241023113406.1284676-1-alex.bennee@linaro.org>
 <20241023113406.1284676-11-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241023113406.1284676-11-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: ufbLKVNo50o2

On Wed, Oct 23, 2024 at 12:33:58PM +0100, Alex Bennée wrote:
> When git fails the rather terse backtrace only indicates it failed
> without some useful context. Add some to make the log a little more
> useful.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v2
>   - keep check_call, just don't redirect stdout/err
> ---
>  .gitlab-ci.d/check-dco.py   | 5 ++---
>  .gitlab-ci.d/check-patch.py | 5 ++---
>  2 files changed, 4 insertions(+), 6 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
