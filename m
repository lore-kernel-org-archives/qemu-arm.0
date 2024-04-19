Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp2517893ejd;
        Fri, 19 Apr 2024 09:25:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMXS86aH0QOEKyN1ytgePDBDcTM8Ob9oIQEQ/OwNyRbqUgaHs+wmJjFW7Dj5aja0v3Xig5xgq71zdgaM1AR5j00uxWUg/1
X-Google-Smtp-Source: AGHT+IFJRaObyd5fDAf15HI5l3tCr/FAPtaWMDZXagAla3ujfMBoFx+h7oIyNZZ1yBvqLSoOswyv
X-Received: by 2002:a05:622a:1825:b0:437:9c7e:ab1f with SMTP id t37-20020a05622a182500b004379c7eab1fmr10046523qtc.33.1713543920621;
        Fri, 19 Apr 2024 09:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713543920; cv=none;
        d=google.com; s=arc-20160816;
        b=dOSky9YxNLa5hJWZ2dhNpsfdUTkCWRifmWteCvs2AqdrE1JZLmIbg3bJgQMPOzqeSd
         rM52YAerY8ldQ6ObeI9YyDLeZHZ0CikjmiGT/KsCCIrHBX8G+fvTwQWiwpXGp+PGH9ra
         KOwBzWMsdzsLNC6k1DjlKG05Tv8nkbMzQD9qyzrG5tUGWAu8hB1RUVS17HYGMDPYRiNL
         ZP+aeRdJhAudwIE+91ZS0ew5UEAC1uJ3JXLwpVu9vrenO5XmCVg5d2Zq8VLyflH5JTCS
         uq3ThPeCFaxojxBUPnaDaWPW/sB96/YC8Ibel4dBQybL4Kf7J8Oqp2Yza3PON/6Z0bOP
         FBag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=rShKuBYcFAJzq8dJMQtB3eTluoRhL85CI4uxsqdo3TA=;
        fh=BJcCiaa/1hl9DL83kRXXrqvkZvX3eR2nqFnSs1L1Vt8=;
        b=KDdC4JvCP+Vc5eQ/KkhZViVG6Fg/XPSVx5r1Dm1N+Hyxlg4m0pngRkjXwX+8KdI+yj
         rTCIlPVz4GhI7FQt8aL87XdLRVrOGfqXxwcSExWJJvuqWeBncZ94A24mSDZr8ojWQdt2
         SdRk4efcBYr6wCX/xhgHlnHUPCRjcoNIVHPTtJh3KT2tVXdA/+FswfZ2fyHTkBCKl2wf
         JHjzIXwvelzPPwdpSOXvVU22qXdClMmbuefS4troalG8zvmiNXX9i3Cl+S+bud3IJ1yp
         jQIpCj4rMM70DqwRT+sVXjFXqcxbDGkM+Z1Cf6DmwvIO/b5g3tHk4g5A2gXuBe0C8p7Y
         D7Zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JFMn536+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id cj11-20020a05622a258b00b0043658bbef13si4626142qtb.770.2024.04.19.09.25.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 09:25:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JFMn536+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713543920;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rShKuBYcFAJzq8dJMQtB3eTluoRhL85CI4uxsqdo3TA=;
	b=JFMn536+O3x/vB/PtoExmqihhq8EtYZxKmCTGoNRpYwJ0YbVdYbSTpSsBBzc9ZIkdqYeG3
	Ox4A5pMlt6VhBSV8hhhWNGT5d2BIdQsyXuKfdBkhAyLhE1JY9Jh1gplLTynF4vWgZMVGRK
	LRtmrMzolJZKJoZ/alEUUi0VJiFr4Mw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-tEUqBrmyMnOp82OOWNJ0aA-1; Fri, 19 Apr 2024 12:25:16 -0400
X-MC-Unique: tEUqBrmyMnOp82OOWNJ0aA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F426800CAC;
	Fri, 19 Apr 2024 16:25:16 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.112])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C0ED3C271B4;
	Fri, 19 Apr 2024 16:25:14 +0000 (UTC)
Date: Fri, 19 Apr 2024 17:25:12 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, pbonzini@redhat.com, alex.bennee@linaro.org,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 02/22] target/arm: Add confidential guest support
Message-ID: <ZiKa6MQaujEMlC23@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
 <20240419155709.318866-4-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240419155709.318866-4-jean-philippe@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-TUID: uepJQ9YqmGFR

On Fri, Apr 19, 2024 at 04:56:50PM +0100, Jean-Philippe Brucker wrote:
> Add a new RmeGuest object, inheriting from ConfidentialGuestSupport, to
> support the Arm Realm Management Extension (RME). It is instantiated by
> passing on the command-line:
> 
>   -M virt,confidential-guest-support=<id>
>   -object guest-rme,id=<id>[,options...]

How about either "arm-rme" or merely 'rme' as the object name 

> 
> This is only the skeleton. Support will be added in following patches.
> 
> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
