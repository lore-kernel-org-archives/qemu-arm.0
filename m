Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp36638ejc;
        Thu, 2 Mar 2023 10:07:21 -0800 (PST)
X-Google-Smtp-Source: AK7set9v1gaXCKRjJG2xQc/Sfgmhr91ywvN0zIBPvjJJFyolQKRHg5vQhx19QmRupv0LIMsoIk26
X-Received: by 2002:a05:622a:1a99:b0:3bf:ca50:e82 with SMTP id s25-20020a05622a1a9900b003bfca500e82mr20152272qtc.15.1677780441664;
        Thu, 02 Mar 2023 10:07:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677780441; cv=none;
        d=google.com; s=arc-20160816;
        b=AEFRaqbfzfeEsaSqz5crCs4UDutSFYxNW6MKncssBT48Acbs8CjsKSpzSLovGFr9y1
         +iZliuC4CTZDGgpMU0XoTRfr0DQhhVSL0ToMD/TOKxrhl52H2ODE8NcWcKPdFWncsbW1
         WhRjjbsMrWYe/W3benPp8hSQzil5LLhbCU88c6mWbfY4xlfURU6iKCPTROSQudjXMfrs
         reDgsjCfAMZa2TYYEJy5ydlJnIsmnl3Phn+3q6zbianU8OXZoB7fJv4EN8mY+P+qzrjY
         Yg4b6F/6VwORnv3x8LKHmQgjE1VSJaF+0jXeUoDVJmh3fnnk8KWyK2iUF8UhmKGT9SR3
         Ueyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=RIFIu9FzFlmMJ7rjilkD4RNn39gojKgiNaI+RvmuVps=;
        b=cdKStZ4+rV6sJ7WKne1pH30QqVAhXYI2zbGVfV+6ilwAe6Vxktbs/RU0fWbh25+4It
         f0FGVPMwy3q22lBBD5PDW/mOMft620bGU0DFIxTeijpb3M0oni4Ull3UbSxU65NCdMNP
         aPaDMp8M3N1qd5F9+Q2H18xEF2UbkGTZfA7c9xLb1xCVTpbtbM3ITgkbY6UG3kItleXr
         VRhJgUiEuSebsq1HCj1j51w6bBd8nYGvMLTw8B5GGIA/T3F2Z0m7FPKj7OjG42u/+VXt
         EPlFhq/oIK6X3t5nQo7xYpmgJGco6PN1/3MhaxvUZ9ikSmfrbY8J1FW4bRejbUTaGgxy
         P0PA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BfARNxgV;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s11-20020a05622a178b00b003ba250e6204si150203qtk.194.2023.03.02.10.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Mar 2023 10:07:21 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BfARNxgV;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677780441;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RIFIu9FzFlmMJ7rjilkD4RNn39gojKgiNaI+RvmuVps=;
	b=BfARNxgVHrNtcrjOEQrgsc9JvuLAdsdiLmDLW/uuRONNMt27YmZzEF1K7knX9Mrepm9rs7
	+LEyZRMzFgs1kL0LZD1HDEkSIl2JhTDgvN9x7xLZbb8JORPBUjnsQjfbQuYvOHPOkCaaly
	htLVFGU26EdXJAWGPGmGw5piG0ERe7M=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-HQifpbvcNp2xRQ326_T1bQ-1; Thu, 02 Mar 2023 13:07:20 -0500
X-MC-Unique: HQifpbvcNp2xRQ326_T1bQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B25C38012D5;
	Thu,  2 Mar 2023 18:07:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60A0E440DF;
	Thu,  2 Mar 2023 18:07:15 +0000 (UTC)
Date: Thu, 2 Mar 2023 18:07:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 3/6] gitlab-ci.d/crossbuilds: Drop the i386 jobs
Message-ID: <ZADlzSMBnjUgyyu0@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-4-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-4-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: AfJrFVSCynTR

On Thu, Mar 02, 2023 at 05:31:03PM +0100, Thomas Huth wrote:
> Hardly anybody still uses 32-bit x86 environments for running QEMU,
> so let's stop wasting our scarce CI minutes with these jobs.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  .gitlab-ci.d/crossbuilds.yml | 16 ----------------
>  1 file changed, 16 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

There's still the mingw 32-bit x86 build, but probably wolrth
keeping that until we actually stop 32-bit from a technical
POV, because Stefan still publishes the 32-bit windows
installers currently

Similarly  the dockerfile can stay in case someone wants to
reproduce a flaw locally

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


> diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
> index 101416080c..3ce51adf77 100644
> --- a/.gitlab-ci.d/crossbuilds.yml
> +++ b/.gitlab-ci.d/crossbuilds.yml
> @@ -43,22 +43,6 @@ cross-arm64-user:
>    variables:
>      IMAGE: debian-arm64-cross
>  
> -cross-i386-system:
> -  extends: .cross_system_build_job
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check-qtest
> -
> -cross-i386-user:
> -  extends: .cross_user_build_job
> -  needs:
> -    job: i386-fedora-cross-container
> -  variables:
> -    IMAGE: fedora-i386-cross
> -    MAKE_CHECK_ARGS: check
> -
>  cross-i386-tci:
>    extends: .cross_accel_build_job
>    timeout: 60m
> -- 
> 2.31.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
