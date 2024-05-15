Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp470621ejl;
        Wed, 15 May 2024 00:57:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHfT9TzYcxcws4la8YJTPa8J2gWCnMCxmlb4QgqoWJD1EnYTpvidfUM70NHq2ZMV6Gv0cxd
X-Received: by 2002:a05:6214:5787:b0:6a0:c993:19c9 with SMTP id 6a1803df08f44-6a16818384emr200856526d6.28.1715759859965;
        Wed, 15 May 2024 00:57:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715759859; cv=none;
        d=google.com; s=arc-20160816;
        b=HqEKOxlI8lnsaIRNUGSP2muOHfjm53OkLc9vVF6sDcIqb8jHVc3sMqlEZYF8AYzDFt
         EAoCWjcUnWBVRuTJFo1Dfz2SJkXxA2/fOQSzdWvuK33scATO8iwCATzusT96aeKyKsA0
         wfGOKub5mvHK6OBH+SWNulrsBfLD/kNHQ+/J5y3DwQb2rC5IygcEFU7agTRUSewA4IaJ
         lW12nPFDN+MvqN/SFLpF6zu6zT3zGeZUVDMHyE/Uw8epen5dsqq7S9TiMCpG16t1qpeZ
         W2u5cckEgUqZmUss9i82uaOwqggymoRVmGlpoVyD2GFupgxV6KBRpyuWPJFqVgQ9dbfY
         MEjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=KJ60EhLSwaQyzcfeTGtD1Tj7k8Uo36YCURMWdDb65f4=;
        fh=BwSD38f6kbUk59GUBloa4/Z7gonSpXkDYaGYQFN6fWI=;
        b=khW5Mv17RqS0ITZGYSeI/fRRcEa9YzCPQht0+5cdwIZaWk3xjuFBU+tdyzvOH3hjch
         +QyeuopcsJRN6rlHM10I9zs+ZD2W9KozVbyKpIdyVkKlQ6qbzUO4KTIiFIUw/LPiwSUf
         GZs3McKqB+PfCsbfVTYfzmV8LjG8A4D04UHifKcZZIy+lAoa8wUFzDAyVKJM2c+ao66T
         VU3DOkZFx/iENMwssnPR8Rl3w/cUfuLmfNW67wqI+5G56A0NvLwbEGIY7QJafcL5C7Fm
         Mvvu4vS1FM5cCE9XXeRmFrDESTHZjEJtGdr7BxJmfzx0rWlvqWFRdVCX5Sq/Tkjh5Cqn
         dtNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QPDt9wnt;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f29a8efsi139746656d6.240.2024.05.15.00.57.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 00:57:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QPDt9wnt;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1715759859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJ60EhLSwaQyzcfeTGtD1Tj7k8Uo36YCURMWdDb65f4=;
	b=QPDt9wnti/xpTlykgJKO8Fzlba37oAPJUkM/ipEzJ1xWrCVSa3E5DssioBgaZULsgqf3uD
	9wrt9SwEgDj0cRQJq+qjBj5NdMcdo2a9i1pMQ6gVR5zfj+UmyqYZuMFhtd0BSPEU3aBfOk
	mk+ruS/Rt73haqpTeXfWPGf+atigXyo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-kBy2z7_UMeik33Yz6361Og-1; Wed, 15 May 2024 03:57:28 -0400
X-MC-Unique: kBy2z7_UMeik33Yz6361Og-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-34da03e19beso3884652f8f.1
        for <alex.bennee@linaro.org>; Wed, 15 May 2024 00:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715759846; x=1716364646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJ60EhLSwaQyzcfeTGtD1Tj7k8Uo36YCURMWdDb65f4=;
        b=ZnSo4X8BYqfl5Gr7UJWhkd3z8g9u67yGq0aYLrXN8iklER3nqV+MfKjT+3EUx5eWPp
         CTjXvxgYQuHUcdR+qqzJou+5dnTSUuYl/SNIck0Nbq+6gPo1m2cX9H2ZKnCL9YSCe+id
         Banrabn5nBicggSJQe3brorXiuTFFb2a6GFVNhw/ru+vfEQvvuwWhBg6tVyW/+27I/Sf
         Hr/QqBzXbioqpxyV9SyP0XSJifiiFN3K024EXfrwSt3guin0ICTm1OzHv9JQAmNk31Do
         /zx/qR68Hx0wG9mCAgrhJDdxn8l8ZCzfVNJrzOOZVGwFO+8X2hKUTDdNpx4iUu8O19RK
         evCw==
X-Gm-Message-State: AOJu0YyK0EtiYo2nAcBHoQAtJjgTiqbd79PcDTfkQDa31Vh7hR26AitR
	nIgIT74H5Zfi87XfOHqlVyspyrB3F7B34Y7c2vdqoCgoyEhROpoofLpiTp6xhQkfojfZgH4Tqg1
	wHvswUS7aJWQ0vCwVIE0HFcsdsC+UewqXcV9ww7z6uMegVer+hayErRVwxFJnaFJ/xva7wBtA/d
	9yOQFDv0lRpV7npZVtwlc41nFQcqSJ0cs=
X-Received: by 2002:a05:6000:150:b0:34a:a754:eb48 with SMTP id ffacd0b85a97d-3504a969261mr10747590f8f.48.1715759846438;
        Wed, 15 May 2024 00:57:26 -0700 (PDT)
X-Received: by 2002:a05:6000:150:b0:34a:a754:eb48 with SMTP id ffacd0b85a97d-3504a969261mr10747567f8f.48.1715759845861;
        Wed, 15 May 2024 00:57:25 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a02:14f:175:c01e:6df5:7e14:ad03:85bd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3502baacf47sm15687506f8f.78.2024.05.15.00.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 00:57:25 -0700 (PDT)
Date: Wed, 15 May 2024 03:57:21 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 00/11] maintainer updates (plugins, testing) pre-PR
Message-ID: <20240515035713-mutt-send-email-mst@kernel.org>
References: <20240514174253.694591-1-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20240514174253.694591-1-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: K3lvWG+VfA7e

On Tue, May 14, 2024 at 06:42:42PM +0100, Alex Bennée wrote:
> This is mostly plugin related stuff which is all ready to go however
> I have a few miscellaneous testing updates which would appreciate the
> review.


Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

> Thanks.
> 
> Alex Bennée (2):
>   tests/tcg: don't append QEMU_OPTS for armv6m-undef test
>   scripts/update-linux-header.sh: be more src tree friendly
> 
> Pierrick Bouvier (9):
>   plugins: prepare introduction of new inline ops
>   plugins: extract generate ptr for qemu_plugin_u64
>   plugins: add new inline op STORE_U64
>   tests/plugin/inline: add test for STORE_U64 inline op
>   plugins: conditional callbacks
>   tests/plugin/inline: add test for conditional callback
>   plugins: distinct types for callbacks
>   plugins: extract cpu_index generate
>   plugins: remove op from qemu_plugin_inline_cb
> 
>  include/qemu/plugin.h                 |  42 +++++---
>  include/qemu/qemu-plugin.h            |  80 ++++++++++++++-
>  plugins/plugin.h                      |  12 ++-
>  accel/tcg/plugin-gen.c                | 136 ++++++++++++++++++++------
>  plugins/api.c                         |  39 ++++++++
>  plugins/core.c                        | 109 +++++++++++++++------
>  tests/plugin/inline.c                 | 130 ++++++++++++++++++++++--
>  plugins/qemu-plugins.symbols          |   2 +
>  scripts/update-linux-headers.sh       |  80 +++++++--------
>  tests/tcg/arm/Makefile.softmmu-target |   2 +-
>  10 files changed, 508 insertions(+), 124 deletions(-)
> 
> -- 
> 2.39.2
