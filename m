Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp473688njm;
        Tue, 29 Apr 2025 11:56:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrgKWiem6wvD7HkW0QYmI0bR/M0zSd5npqmH2UPo7Fppu5RxirIjAqVM+41RPFJNJ3Brfh
X-Received: by 2002:a05:6a21:3297:b0:1f5:6e00:14c9 with SMTP id adf61e73a8af0-20a87c542afmr134051637.15.1745953019411;
        Tue, 29 Apr 2025 11:56:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1745953019; cv=pass;
        d=google.com; s=arc-20240605;
        b=DJIzUmZW+5VH6taWw/ROnZxS5Nqt2R3Pgoz39KpJ/0UmxNHwzXXR6wD/Z2to0u/ESK
         IUJQ3COISO4wuBYTXznm9znhxu2tydD0gWfEDO9xTWP9t+oNE396lc4AgQUy2eNx0BN4
         pR+wDuEhchc8DF8L8LHbDYgFDhHwZ72WjGt32Nppr+8HU0nhkJc1L5CExt32eNk0oRrP
         PNMwB8Bvt+JCl3xzkVtZwpGsZqJNpnLe54bQkhTZtJ3SKDUxKNoeR/hG1UN2K4p+EQo0
         ZBt6/rgRohuDRBXgY7U9Kx7Aj1zvBf8F6orC3e5MqlHn9ynAddqG5565EuB3qTOkEGnJ
         RMJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xknWTEB7yvoubiG4cKQIwcY0VebPt0mmtLezT0eqyFs=;
        fh=+mOYKT4zsGb5MxwbVdbJ5qp+mF1wl9C8JTmR9wzXwFY=;
        b=XHuNtP9rkaP/+c2/5eJE1rJmtoxeXQM5nGUUHMIYJthSYq83/Sbi4fkiDUGJ7Rn094
         cMLMxG6Sv2u1ZpVv0wZguw7781kBVqy7IR/iVI3I8hX+hXyLD6xuSLHTYhENrEDzYGv/
         BP/YfQrOlhoFaLTIvGFA8ISUSuQUfGhcY0oJ0TUbuWCNjCfgWE7VpWw5zm/aMDyHHCC6
         rLSjzKioTv8gDmSsekj5w9czWXW4OA5sPexe7+Dt1tD6SeCvfOswsTHSsrIhIaIuJXM6
         k992Bn2ffsbVgbMDE2j+j+bnXX4SCjrbX6SEbFOlJF6B34N9oPAtv2VrlRbwE7KfSCuK
         1UtA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b=YLztQpro;
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
Return-Path: <dmitry.osipenko@collabora.com>
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com. [136.143.188.112])
        by mx.google.com with ESMTPS id d2e1a72fcca58-740399202ffsi30404b3a.128.2025.04.29.11.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:56:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) client-ip=136.143.188.112;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@collabora.com header.s=zohomail header.b=YLztQpro;
       arc=pass (i=1 spf=pass spfdomain=collabora.com dkim=pass dkdomain=collabora.com dmarc=pass fromdomain=collabora.com>);
       spf=pass (google.com: domain of dmitry.osipenko@collabora.com designates 136.143.188.112 as permitted sender) smtp.mailfrom=dmitry.osipenko@collabora.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1745953012; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=hj8bY+8qWDtVD0ThbUrV5Mp/C7T2oaIhDhOu5MbWyeyBAbDezvN/NBkHaV6jADADTVf0LHivRLlbIiVq1oOHDnY7I9vgqPAnGbcZhWf/jEYsgWpbA+rHpT3yW8WgAyUGB1R5HRerura7VA4J2Fr8J63h3fdEeSEYO3DdHJAq0pQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745953012; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xknWTEB7yvoubiG4cKQIwcY0VebPt0mmtLezT0eqyFs=; 
	b=FZff2QoX2yUQ6qZW2uizJwmPmnpPgeEAkQ1828RUXzF2p+p9Ub0QnczKWSpEsZy+ZARCMrLxj3m+3m+Mn8Z5B7aYBdEnNeOA0/0CW3G0/gzlFbwqKZnXm7/V2z2NSWCqr3Ip4hHEEvvVvL3sqPzqWvgYKYv8uyJcFXsNzHkBcCo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745953012;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=xknWTEB7yvoubiG4cKQIwcY0VebPt0mmtLezT0eqyFs=;
	b=YLztQpros48pfl3txC8rwjdPcI6+b7BOOD7bOHdGrWVxfOABUgmV/NSq/o1FZ+5e
	pIcBwidk2EhGS7lMA6vNB/7NjvQqVsB6NaXpwTmB03TPB4kgNN+QZQZiWI+FqJejrTE
	CUjdFL6+gMsXbv9m6jSRCcQ1Tma/PpHlZe0e/1bI=
Received: by mx.zohomail.com with SMTPS id 1745953009629739.3299186013759;
	Tue, 29 Apr 2025 11:56:49 -0700 (PDT)
Message-ID: <9115fa7c-ed94-449d-816b-a13125275dac@collabora.com>
Date: Tue, 29 Apr 2025 21:56:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] MAINTAINERS: add myself to virtio-gpu for Odd Fixes
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Thomas Huth <thuth@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
References: <20250428125918.449346-1-alex.bennee@linaro.org>
 <20250428125918.449346-7-alex.bennee@linaro.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250428125918.449346-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-TUID: Oa/Ap3i199Pu

On 4/28/25 15:59, Alex BennÃ©e wrote:
> Seeing as I've taken a few patches to here now I might as well put
> myself forward to maintain virtio-gpu. I've marked it as Odd Fixes as
> it's not my core focus. If someone with more GPU experience comes
> forward we can always update again.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  MAINTAINERS | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 661a47db5a..f67c8edcf6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2636,7 +2636,8 @@ F: hw/display/ramfb*.c
>  F: include/hw/display/ramfb.h
>  
>  virtio-gpu
> -S: Orphan
> +M: Alex Bennée <alex.bennee@linaro.org>
> +M: Odd Fixes
>  F: hw/display/virtio-gpu*
>  F: hw/display/virtio-vga.*
>  F: include/hw/virtio/virtio-gpu.h

Thanks a lot for stepping up!

This reminded me that I wanted to propose myself as reviewer for the
virtio-gpu patches. Will do it soon.

Akihiko Odaki is also good at reviewing virtio-gpu patches. Wondering if
Akihiko would want to be added as reviewer or co-maintainer of virtio-gpu?

-- 
Best regards,
Dmitry
