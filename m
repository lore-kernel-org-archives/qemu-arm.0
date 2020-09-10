Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1061292lfq;
        Thu, 10 Sep 2020 00:03:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxguLq5rcksamXQZ51yoDpf9wiTLK5nRm7fViaiH3XXXhh1PQEjjSAqMix7AYEFbi6kNz/8
X-Received: by 2002:a17:907:7206:: with SMTP id dr6mr7698819ejc.546.1599721424203;
        Thu, 10 Sep 2020 00:03:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599721424; cv=none;
        d=google.com; s=arc-20160816;
        b=a+2p18yFK//26mCBUvWxm444K0nxk56NH+g5+i6q7q9ViMDqwYmrHq/SmUYPbWuf8I
         F5zrubGKH+zncAs2oqUjL12IYxKIgCx79Zdg3qiAEh4DTyDKIeziqe8W45duozGhA4iU
         5U08DatZQM1XDj9Z0YS/Gu5keign6mcgPAHtGNEYS/sMnj68RoOaFXn1AiSaMbOCD71w
         uHgBERNriixvTohlnoVnTwvlL22Yt5qo7Rh7ZINf0gSJYK2zIMe6bbQH4ZnGDjXmr8BU
         9UqsiJnVwf+79xsFQezhf28JGmr/fMjPpc7Z3VgXUmP8KDNuu07V1VmJgyBeI48jSVe4
         MJZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=XnZuoByvnH2UamRar6RMTxHRakWlHPGS7I+uk0rbUXc=;
        b=yF135dRAiyACLnoKyRgpJ06L7PApxJZm25Pbq4/ayfnnziuk4sUWmZ6NHJTKz+YKD/
         3vjK0+5DuqjdLno0K7vMuyT05qYD6sghqsZad//f95t01ioOwvp2h4sqlpCoZNsQkw3d
         vOFA5Qb1uXomq/ArhvVxLnDQY/rP5/ADyIcub04kjZkLHIzgea55Ys2Ty/T4kMdop9CC
         jBzKCL2atcZtvQeXx73no1PguLwDUZnpad/gPyKY7LjRKQvEbfVYC22LlJxzOjM/nJ3K
         6wYTEMWwi/Q4HBT13NfFoM7G9XMzmprZHyS8HmI4Mhafmyvg2qQqsovcRal9Q7TxFGb1
         t96w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T9AJHjB7;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com. [207.211.31.81])
        by mx.google.com with ESMTPS id o9si3158921ejr.108.2020.09.10.00.03.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 00:03:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) client-ip=207.211.31.81;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T9AJHjB7;
       spf=pass (google.com: domain of thuth@redhat.com designates 207.211.31.81 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1599721423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XnZuoByvnH2UamRar6RMTxHRakWlHPGS7I+uk0rbUXc=;
	b=T9AJHjB7N9eCLaQ7g2L++zK5DTEg9OpGSNXkREd4h9y2siaHIFPd7SEpyZ0rOeJjLGddeB
	DvlL3zBrXYeGMfKRPzQLkAeQZUu2ciJx+7ObG524IYzH2gxDld7FsGfy/U1BhfkpUUe/xl
	NDEbWq9a2Nr3suP2Sqtv5n73TvtzOsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-501-GYpHCe46Mo2XAVHffXpUmg-1; Thu, 10 Sep 2020 03:03:41 -0400
X-MC-Unique: GYpHCe46Mo2XAVHffXpUmg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7270B802B60;
	Thu, 10 Sep 2020 07:03:39 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-86.ams2.redhat.com [10.36.112.86])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C1B183572;
	Thu, 10 Sep 2020 07:03:29 +0000 (UTC)
Subject: Re: [PATCH 1/6] hw/ssi/aspeed_smc: Rename max_slaves as max_devices
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
 <20200910070131.435543-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1ffe50ce-0f95-6e3b-665a-0a86573f97e7@redhat.com>
Date: Thu, 10 Sep 2020 09:03:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200910070131.435543-2-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-TUID: F+EhrgpJXq8U

On 10/09/2020 09.01, Philippe Mathieu-Daudé wrote:
> In order to use inclusive terminology, rename max_slaves
> as max_devices.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/ssi/aspeed_smc.h |  2 +-
>  hw/ssi/aspeed_smc.c         | 40 ++++++++++++++++++-------------------
>  2 files changed, 21 insertions(+), 21 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>
