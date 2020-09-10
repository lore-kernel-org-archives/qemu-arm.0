Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1068090lfq;
        Thu, 10 Sep 2020 00:15:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxmuFKdoDGlTJzJCP0zirkT9JzvjMrhhIkUijPn+Jrb6ftQAZ2rJTQsnlZ323WxIUxAv8X
X-Received: by 2002:a25:ab91:: with SMTP id v17mr11038142ybi.76.1599722116599;
        Thu, 10 Sep 2020 00:15:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599722116; cv=none;
        d=google.com; s=arc-20160816;
        b=0KwJH+btf0kWo6PfiikesbIJgpfVDawTSYB5THEfGuGr00RelzpSWweja0noSIuP4d
         QgGXMsSGQB7XNmL+yoMdTPmav63r4TztRJVRclwZuNf1i4ptTYPT28ek+WfoiYea7zFU
         OthfksOYJ9YbnhZ7Qe+FD8D2QwZE6zF+Cbmr2EUrhyQqQYeMJL2hB1rqutCECMzs6LmA
         OguSAKuoxS/0QBVSLbOBNlEWxrJBudDkNxfZakxq8Pd40xP9tY1N90Yqn1sZ2MqZru2z
         4h4H3GGvhAkmNvzbWrzfsTL6dKL2GD9OrNyZDB92cj7fVOhd1AJKUQLAjIA2lc/uNHt5
         +Bxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=NujrVkwgQXomRFqBptCRf8I5qXyjyjT+dpDlxDqalIs=;
        b=BhxMjukl4mLMuZ5VFC9g1/kheXaxPrR6ps7e/1sP/vtSKOEHDSp0we0/EY22PEAwTI
         D1ZZ8xxQoaJEYTLyfHwlyKUrmhA3t/mMJ13rgNOVKLCtXINByaeLwm9/dAiPwrNpzvxl
         iYWjRwJW2geahT0DS3MwDgpSBvqG9QtkxktDXiYj1GQ+/njFvn78hiw+TX8YxykIsLKJ
         t7qeTouO4rjWqS5Z7kuiodsorvlBM5ogX6uqAlqih/JqrZQb4qitpN31IZZagoZrGda4
         cVFkBKUvEwEeQZ9vtBIOQ9h2STq15c9x1votTyZ6izzAal+w+OG9eN/9S+iOLb2zQSb3
         eLmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fyEcIooj;
       spf=pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id t186si4766568ybf.203.2020.09.10.00.15.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:15:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fyEcIooj;
       spf=pass (google.com: domain of thuth@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599722116;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NujrVkwgQXomRFqBptCRf8I5qXyjyjT+dpDlxDqalIs=;
	b=fyEcIoojD+UT1XsPyY5ujc1BaHdbmMSiXtlVnBzY0RiqwVhCSjrC0tjbNmqE9plUXTEgwM
	waeDJpRzaVE7Ht1fr52SEAARkEtHr43r4PVnpLjnPiGDHnjc4TLmoSI4wkshL1SJ9vHo9a
	zjJwRzlW01nUQqw/JefoI9HhaiGdPOs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-7ObhZB0GNoSSa78vWCPA5A-1; Thu, 10 Sep 2020 03:15:14 -0400
X-MC-Unique: 7ObhZB0GNoSSa78vWCPA5A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 191ECEF4EE;
	Thu, 10 Sep 2020 07:15:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-86.ams2.redhat.com [10.36.112.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BDFEC5D9E8;
	Thu, 10 Sep 2020 07:15:03 +0000 (UTC)
Subject: Re: [PATCH 5/6] hw/pci-host/q35: Rename PCI 'black hole as '(memory)
 hole'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, qemu-arm@nongnu.org,
 Marcelo Tosatti <mtosatti@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Jason Wang <jasowang@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-trivial@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Joel Stanley <joel@jms.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20200910070131.435543-1-philmd@redhat.com>
 <20200910070131.435543-6-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7dbdef90-1ca6-bf27-7084-af0c716d01d9@redhat.com>
Date: Thu, 10 Sep 2020 09:15:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-TUID: WBOOeVcAbZ7r

On 10/09/2020 09.01, Philippe Mathieu-Daudé wrote:
> In order to use inclusive terminology, rename "blackhole"
> as "(memory)hole".

A black hole is a well-known astronomical term, which is simply named
that way since it absorbes all light. I doubt that anybody could get
upset by this term?

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/pci-host/q35.h |  4 ++--
>  hw/pci-host/q35.c         | 38 +++++++++++++++++++-------------------
>  tests/qtest/q35-test.c    |  2 +-
>  3 files changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/include/hw/pci-host/q35.h b/include/hw/pci-host/q35.h
> index 070305f83df..0fb90aca18b 100644
> --- a/include/hw/pci-host/q35.h
> +++ b/include/hw/pci-host/q35.h
> @@ -48,8 +48,8 @@ typedef struct MCHPCIState {
>      PAMMemoryRegion pam_regions[13];
>      MemoryRegion smram_region, open_high_smram;
>      MemoryRegion smram, low_smram, high_smram;
> -    MemoryRegion tseg_blackhole, tseg_window;
> -    MemoryRegion smbase_blackhole, smbase_window;
> +    MemoryRegion tseg_hole, tseg_window;
> +    MemoryRegion smbase_hole, smbase_window;

Maybe rather use smbase_memhole and tseg_memhole?

 Thomas
