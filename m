Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1064200lfq;
        Thu, 10 Sep 2020 00:08:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsndAgwU1J/ctMyIcxl6omKDyKNLWGDn91uCae2f+1pNZ7nKwJBKC7gVsdD1sRsik3ciR9
X-Received: by 2002:a05:6902:4f0:: with SMTP id w16mr11915790ybs.334.1599721696845;
        Thu, 10 Sep 2020 00:08:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599721696; cv=none;
        d=google.com; s=arc-20160816;
        b=iSliQPzjc0TS6HMq6y2dTikXuFqqWYrSbMZxoM0xNY+KLA2I7LfChtR4tEYVk0gSbO
         b8ASvXER4f939ajGeqqRKTZfGxA6shf/hbxY2KAv2GfnT/FChvDMkjCflkOYYFf5tHV9
         WpXkV9dnrm4l40p7iKAhE8LAczoYGROHGMt9p2uArQSqeNp8kVjtuRx8KqOTygzeWCzw
         rqUMFoiq7VRS+D3JbpvxuG85jWyDxhjQeagwgv9Ymf+oXfTVbSGA7xhhKC9ajPODaUmb
         UdV4FFIh1Jnici8qpP7ktIG7TrVn3pvDyE20Js6VPVStsL8ptTsZVd08aSDoK5STS6s8
         U6nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=j/H4Uu1wy+G6iibdT+5/lLcjn+HOv3NmsU986xOmN/8=;
        b=PzRfGVfTOH8u8tTieXSGPbLfKagTYZAOgwTQ7EM+Q+jDIBQUsG0pqRJpEeAJle7cL+
         USocPKJ6iSRrHPpj6vhSViEhdofcv6bRRBWrHQi3Eawxu28RlM0RplScZ/J/M9fjgHpM
         t+rbCO9UNHhEh9MOCd38Ppm5Ag3q1P8fOCK7SJVP0kqrZC25fItPJLn/TSv+5a5XmmfR
         LzHRFyXJzZcDshWiZSsjGjyiKDrFtIUXb8aHMyXE6V80iXQLgY61RbkasHdf67Lo3Xpa
         JRNyComdQb/UDRYvE/+l88M9B7pcTPW31ZeHU1hxtNZAAaZ5XY4LxJnh4pLVaM1lFPrd
         L8Ew==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fBchfI4r;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id g1si3386675ybq.74.2020.09.10.00.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:08:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) client-ip=205.139.110.120;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fBchfI4r;
       spf=pass (google.com: domain of thuth@redhat.com designates 205.139.110.120 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599721696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j/H4Uu1wy+G6iibdT+5/lLcjn+HOv3NmsU986xOmN/8=;
	b=fBchfI4roYR7XF/ucfafX4RuTFiEIhhhdltV2J+N7zm1FsWaXk6VRXqd28SblboVqoZWNT
	2rL1PgEGOqmH96mF010zr+DgQ32PfGVbwCNJW0usCo+8LfZ8Q+oTcM80DhAEXwoqKFBlD0
	WIBUflpo2XbWAYRaUjj52xsapkuo1ks=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-xb3zd0wRPvaW79iMCmckrQ-1; Thu, 10 Sep 2020 03:08:12 -0400
X-MC-Unique: xb3zd0wRPvaW79iMCmckrQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E314A1882FC5;
	Thu, 10 Sep 2020 07:08:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-86.ams2.redhat.com [10.36.112.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 683198357E;
	Thu, 10 Sep 2020 07:08:03 +0000 (UTC)
Subject: Re: [PATCH 6/6] target/i386/kvm: Rename host_tsx_blacklisted() as
 host_tsx_broken()
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
 <20200910070131.435543-7-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <118a4cae-f220-8224-52ac-26a1795ac071@redhat.com>
Date: Thu, 10 Sep 2020 09:08:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-TUID: wIVvtNn9WIv/

On 10/09/2020 09.01, Philippe Mathieu-Daudé wrote:
> In order to use inclusive terminology, rename host_tsx_blacklisted()
> as host_tsx_broken().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/i386/kvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target/i386/kvm.c b/target/i386/kvm.c
> index 205b68bc0ce..3d640a8decf 100644
> --- a/target/i386/kvm.c
> +++ b/target/i386/kvm.c
> @@ -302,7 +302,7 @@ static int get_para_features(KVMState *s)
>      return features;
>  }
>  
> -static bool host_tsx_blacklisted(void)
> +static bool host_tsx_broken(void)
>  {
>      int family, model, stepping;\
>      char vendor[CPUID_VENDOR_SZ + 1];
> @@ -408,7 +408,7 @@ uint32_t kvm_arch_get_supported_cpuid(KVMState *s, uint32_t function,
>      } else if (function == 6 && reg == R_EAX) {
>          ret |= CPUID_6_EAX_ARAT; /* safe to allow because of emulated APIC */
>      } else if (function == 7 && index == 0 && reg == R_EBX) {
> -        if (host_tsx_blacklisted()) {
> +        if (host_tsx_broken()) {
>              ret &= ~(CPUID_7_0_EBX_RTM | CPUID_7_0_EBX_HLE);
>          }
>      } else if (function == 7 && index == 0 && reg == R_EDX) {
> 

Looking at commit 40e80ee4113, the term "broken" seems to be a good
replacement here.

Reviewed-by: Thomas Huth <thuth@redhat.com>
