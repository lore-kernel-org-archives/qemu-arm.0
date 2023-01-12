Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp4818193ejc;
        Thu, 12 Jan 2023 06:26:40 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtgJ+sk4Gd8yNpAtVPsAKCHSXIFln71UZbbIWX0U6FjlDfnVM+jTbI7wDChxprGCd6joEhE
X-Received: by 2002:a05:622a:2612:b0:3a8:3058:db43 with SMTP id ci18-20020a05622a261200b003a83058db43mr115224982qtb.57.1673533600594;
        Thu, 12 Jan 2023 06:26:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673533600; cv=none;
        d=google.com; s=arc-20160816;
        b=pCiMuUtOHIAldSG46/L2jAxu3HfZQDDhqhtvhFKk3DcYCQqnVSUcurt2lZKUjXObOo
         N/IYLrAFUuCMQDEjM8/TiCUWXKX6iA3zoCaznd0Q0ZzY2ZrSsmeGUcIRkfM9ftdD4/7U
         k2RMgIKkqyVSBUPmULyn3emrPGNaBAepO/PYVlLs1qOI9wQFreKwe8UFeCqG+51E9U3B
         bdUQU1zo4ij+OPy1Phyxao7Gh12Nq9gtckirGDJ7yABluwhoz2Lw9GHJt5sSROd2dQHO
         Uk8dzZTKlekUx6/hEPt3bihIKOEw3UMriCEuqqrT43OY1XVAdWoo1ykuelEqjL9c/ckK
         saHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Yj7k7Q8S83zKCwM9PvdgW0lmc+tfOH9sqoawaWxhZkE=;
        b=ZQ/GBVqQtS4tucyx3AqhVMs9vBbKmPEC8CTwDhgoS1VcGlZu8wZV0ATQpdtT/PIAbv
         5ue8GNfOB/SLr+z0fmj668GvtQsHIDyubrMaA0mfmC/Ug5wD9U80izsCYptvxLZLLQnt
         FqmxchX3rpQ+2v+Cf0ZqELNQmnuXLzWd1D8n28qc//oMTbF+1DuaqdyYCfQg0zQFEZ/2
         4ofgz+LwE5cxWUguQ+0XOoWlrH/05EwdIQ0+bDPbBd360+Z111IK82FOYkbejyyBgxIq
         RWXVqGCqj6CpACJiEx3x8gJT0+wabXXCcOt3pxrXT/j0pjAG0sHRasNdvDa7Y+42senp
         fZDg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SFtm5gD2;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id bc14-20020a05622a1cce00b003a51b82f290si10209737qtb.495.2023.01.12.06.26.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 06:26:40 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SFtm5gD2;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673533600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Yj7k7Q8S83zKCwM9PvdgW0lmc+tfOH9sqoawaWxhZkE=;
	b=SFtm5gD2NXkUR8zy4+doW5q9SrXTqGTUsGG+5U4LmuXLnUM8sXoRVvCBVzdbanzHnrmyJU
	40h9Ef7JZxMFwc5HgC8YBmh+j/Z5yjjGnPJf/trbqxjVLb4ZamGBoqCR+UolxCyJRiuXe4
	Ty8E6XeKwh2OUUFCF5Zv6ce7swiajCw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-210-xuOsOCpMP7CN1XbJ72cKKw-1; Thu, 12 Jan 2023 09:26:38 -0500
X-MC-Unique: xuOsOCpMP7CN1XbJ72cKKw-1
Received: by mail-wm1-f70.google.com with SMTP id v23-20020a05600c215700b003d9e9974a05so7084912wml.8
        for <alex.bennee@linaro.org>; Thu, 12 Jan 2023 06:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yj7k7Q8S83zKCwM9PvdgW0lmc+tfOH9sqoawaWxhZkE=;
        b=Y0T2it6cDfH7VQaYIl5Om6Y+JDrL26lx9ikTaOWUkq2FwlC43RXAL33a92pKkJAhVX
         e3u8SZXFJrhE0Ze3SDsWafC5tDwLu5NSqugYzoqP3E3RtIpGgjGv59NoGN0cpdE/FiwW
         fCc/LNJUIRys88o7kBgJrAU5YpsRc5iijwmnnkziGFBFm3xZQzzRi6Qv0xV5m0Oe/aP4
         JX6hkMKsAPZvW5+u0lUx6ZX7s5wteEepHvCk/7wmFVK6TjDObieYo5EcUrIhw5VxMaLB
         1kCYxIPjBS9068ciQDfy758PscYdj9ITyl2fTaFx9XUQYaRCwoYWvRXteeR+JDGagJls
         iKcA==
X-Gm-Message-State: AFqh2kp0lN+aSL0JmgqiSeiDXZO8CRCJ0uA00coqwCmVoiNGMVtD2cib
	Jcf4rp8YZfaYlXGdJx3ez8W0NIDJBmZFjJjJQy7eSsMRCkf9IPyumVgtZ83C0V+7gtrfSliOX7/
	MATo9qn4pobgzFerUMboYPZcJl6WvkEWi3Nh3JjYG5UydGKqtFXXu49dO7tbxulo8
X-Received: by 2002:a05:600c:3b93:b0:3d2:1bf6:5796 with SMTP id n19-20020a05600c3b9300b003d21bf65796mr56543870wms.35.1673533597512;
        Thu, 12 Jan 2023 06:26:37 -0800 (PST)
X-Received: by 2002:a05:600c:3b93:b0:3d2:1bf6:5796 with SMTP id n19-20020a05600c3b9300b003d21bf65796mr56543833wms.35.1673533597222;
        Thu, 12 Jan 2023 06:26:37 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-128.web.vodafone.de. [109.43.177.128])
        by smtp.gmail.com with ESMTPSA id m25-20020a05600c3b1900b003d9ed49ee2bsm17873817wms.1.2023.01.12.06.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 06:26:36 -0800 (PST)
Message-ID: <2e9e18ea-db55-72ad-0bee-2ef3d2543548@redhat.com>
Date: Thu, 12 Jan 2023 15:26:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 02/26] gitlab: add FF_SCRIPT_SECTIONS for timings
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ed Maste <emaste@freebsd.org>,
 Yanan Wang <wangyanan55@huawei.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20230110173922.265055-1-alex.bennee@linaro.org>
 <20230110173922.265055-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230110173922.265055-3-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tmwrRPtrBQ8h

On 10/01/2023 18.38, Alex Bennée wrote:
> From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> Suggested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/base.yml | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/.gitlab-ci.d/base.yml b/.gitlab-ci.d/base.yml
> index 69b36c148a..50fb59e147 100644
> --- a/.gitlab-ci.d/base.yml
> +++ b/.gitlab-ci.d/base.yml
> @@ -6,6 +6,11 @@
>   # most restrictive to least restrictive
>   #
>   .base_job_template:
> +  variables:
> +    # Each script line from will be in a collapsible section in the job output
> +    # and show the duration of each line.
> +    FF_SCRIPT_SECTIONS: 1
> +
>     rules:
>       #############################################################
>       # Stage 1: exclude scenarios where we definitely don't

I was just about to create a patch from Mark's suggestion, too ... glad that 
there is already one!

Reviewed-by: Thomas Huth <thuth@redhat.com>
