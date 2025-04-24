Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp3551791njd;
        Thu, 24 Apr 2025 01:38:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVAeNxNsFeD6y7woPIwhKgmtgEMkxdk+oHdYmaSxVBofo/Jm/lyTAVw9GIjVLW0BMQw6E59YHILNSjlWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEQS8KPEXqWvkg2XXp6YuIBltEQpjcRMDZrnXxw70Fls+xUGD033g7zF7k7ENmU+VLfHr53
X-Received: by 2002:a05:6902:2e11:b0:e63:6f18:9926 with SMTP id 3f1490d57ef6-e730354c562mr2623711276.14.1745483904599;
        Thu, 24 Apr 2025 01:38:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745483904; cv=none;
        d=google.com; s=arc-20240605;
        b=DtOlFLdrGOmHWi0LR5Taimuh3Idhw2ra+F2IDLtVOOipMM5tx9OPGVT14+W67sdiz4
         4nHE/6D+ZN851hwHeNX40M6bbpHr55zlZJNCjSK7pqUTEjUVZYhZTbo489Xp0TY7muOi
         BbHYeOvQmqItkvgX96eigYcvLgR0Kyl5TTqVqkcfK25h2kodgKVwPdNtQU3IeCAf/Ccn
         q/rzd9OmuFGOByYPM0hI5ErmlluKa8I2TbaFPjB0naXVxoaJyVbOw8i7wd8rh6UuPs9o
         44EAorYsubBhbtRT123N5GFuYLVnygqiLuvchv1qfBg0HCNjP7rvOGZrifGkEWNCqXG2
         jQYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=ZLFKgxWDC4V6tQpUKz3n51Ae0kpBC+dQcS/w9pmPNtA=;
        fh=IIuvlcU4OU4/G9nlE5Eojh18aGvty5m2lMD0krg8jYg=;
        b=OE/v13OhDmINC4zQ7S5ry+ZbgivZttoVsP+tse3w9I7nNhcHIkZ5xQwb5y2Y6JnF1x
         1j9WJZgnfTa/aU8G0e4BkdJlyVhv+W66qO4JjSX/2Ssq0ieyYBscODWmZ2B5hWyCo4Ut
         P6o5Tmec3LeeNt/166Aeff20T5wjCNQhl9urgcbUo/TTwuKZS9cTqwyvjTq1DtkA61+W
         yDMXp5Q9FqpSWOGzJVKrsVS4YyHRR/qdDNS8Q8a2jMYdxtwhla+M4hBorJnSRUn/naYx
         iUDXGGEq0J9iq/7bTcJjAkD/d4C3bke13wFM1ANXSWq67fncDQU0Bikj7jo+KhuPjCti
         kr9Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N7q61TIb;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e7303e571e1si978356276.324.2025.04.24.01.38.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:38:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N7q61TIb;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745483904;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=ZLFKgxWDC4V6tQpUKz3n51Ae0kpBC+dQcS/w9pmPNtA=;
	b=N7q61TIbsJJ8ex6EDNW3uyW8B785CrflpTxBAV+e+ct3KiilOErANN+H5MT2QlVNS7YWm/
	JUIl6GspuMldi0w+AlM+QEHhhImqLu9yDQB0bxdk9JWqcUgM/I+8gqddvFsrzEy4vf+sPB
	EBFgyfYxYQ4JOYcyTthG4RcrDwaHd24=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-26-lXhJVEV3OIWvnBKowB-Zeg-1; Thu,
 24 Apr 2025 04:38:20 -0400
X-MC-Unique: lXhJVEV3OIWvnBKowB-Zeg-1
X-Mimecast-MFC-AGG-ID: lXhJVEV3OIWvnBKowB-Zeg_1745483899
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88D171955DDD;
	Thu, 24 Apr 2025 08:38:18 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.118])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 94C711800352;
	Thu, 24 Apr 2025 08:38:14 +0000 (UTC)
Date: Thu, 24 Apr 2025 09:38:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, philmd@linaro.org,
	mjt@tls.msk.ru, thuth@redhat.com, alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [PATCH] scripts: Add exception to license check
Message-ID: <aAn4c6hy_kMcgwXO@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250423183728.3860325-1-nabihestefan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250423183728.3860325-1-nabihestefan@google.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: 73SGxNHeG/70

On Wed, Apr 23, 2025 at 06:37:27PM +0000, Nabih Estefan wrote:
> The documentation for trace events says that every subdirectory which
> has trace events should have a trace.h header, whose only content is
> an include of the trace/trace-<subdir>.h file.

Historically we have not bothered to add the license header to the trace.h
files, primarily because its size would dwarf the actual content, and
secondly because. the content can probably be sad to be not copyrightable.

With SPDX-License-Identifier being so concise though, the main reason for
omitting it goes away. So my feeling is that we should not exempt the
trace.h files, and stick with our default rule that *ALL* source files
must have SPDX-License-Identifier.

> Due to that, we should skip it in the checkpatch license check.
> I'm adding it as an exception to the check instead of its own if so it
> still throws the warning on all new files instead of ignoring it.
> 
> Change-Id: Ic2dae14f8cded0dd02d5b231588bd38d8a00e40d
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> ---
>  scripts/checkpatch.pl | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 365892de04..b2c6ac2477 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -1685,7 +1685,9 @@ sub process {
>  		if ($line =~ /^new file mode\s*\d+\s*$/) {
>  		    if ($expect_spdx) {
>  			if ($expect_spdx_file =~
> -			    /\.(c|h|py|pl|sh|json|inc|Makefile)$/) {
> +			    /\.(c|h|py|pl|sh|json|inc|Makefile)$/
> +				and not $expect_spdx_file =~ /(trace\.h)$/) {
> +				# Files to include auto-generated files don't require a license
>  			    # source code files MUST have SPDX license declared
>  			    ERROR("New file '$expect_spdx_file' requires " .
>  				  "'SPDX-License-Identifier'");
> -- 
> 2.49.0.805.g082f7c87e0-goog
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
