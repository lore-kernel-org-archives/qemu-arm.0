Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp24321035lff;
        Mon, 6 Jan 2020 23:39:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqzzHyAvzeLPEznKvYHgKIaJAUWeYPmu/163Uf+sDqaixN5KV1WbAol2c7+EjTbVRKkENYRA
X-Received: by 2002:a05:6830:1e16:: with SMTP id s22mr108506578otr.340.1578382765194;
        Mon, 06 Jan 2020 23:39:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578382765; cv=none;
        d=google.com; s=arc-20160816;
        b=L9qsfWqLFB4Pcez0g6zLqR1V4IHLMPIKdVAsQQGjV/sGXGxppfvIgBCcgprZj9lVUn
         qjx3jsTximVvJYMl7aJAyMjBn1FBgfAEgkiTpqk5kwsCA3brR/3gOWDglAH+WyhS2nMk
         ZlpAIN1VzClKUIoGXiYVARsU0/AbvYrm5eho6//ld4F74xWSqp62Wdu+dj6JQ5Y8XNIU
         MBWVLyRtrLrv+DqRujQ0W3Rgkz1Y7X4CRMtY7J5a64wkGmplctHypmGTzw8LLaXO0dVe
         VYZdAJdPzyfHPQ8YvwWyf7wQ8R768ezhyV/bY1juyEs/Q4ghkoj/4tMhgxbHpQig/Ssm
         DDjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:dkim-signature;
        bh=XP6X6jfo2D1Ntt4i7WREXuOToJDDJqraHYyom/OfMhg=;
        b=Y7V6dc5qTTY1xstIuTnXY3XGd516EM18lmoE86BIAlQsdBF+pzV2+3D86z2uFWygMF
         Z1VXbn6OWTrORfkcPGKT0i+vLb8eM/8VWgZDZvYGPme60kyO5JGGYCrsoitogBgFN9kJ
         L05Ocw/+kyROwNJRbS4lbL6a/TvUK73r2p2AiQNQk+SIf37KTAo2xM2DC2Uc+EEhVvyl
         W94dtezO5jmH0aiIeuPY/03bnFlkFDqrfYQDVNGYBbMsUsgjy4roNVb0cG5vb9c2GV/q
         A+JtEpgLBFBH4tywmD+ohP2Cv53ZeiXelrzw2YIz6Ie9gLkCqGvgp70F2I6Z9WMHcTWS
         /glA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fNqETqSF;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id p16si38727695oto.287.2020.01.06.23.39.25;
        Mon, 06 Jan 2020 23:39:25 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fNqETqSF;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726428AbgAGHjY (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 7 Jan 2020 02:39:24 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:20888 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725781AbgAGHjX (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 7 Jan 2020 02:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578382762;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references:openpgp:openpgp;
        bh=XP6X6jfo2D1Ntt4i7WREXuOToJDDJqraHYyom/OfMhg=;
        b=fNqETqSFQQZT+C77IEqFUjzPfFv//9JD0kTNfDgSdDbsdcBnhcrgHyJO9DsbbFlNqNS/ut
        vCXmfO5eA1oU6qba9KR2ZFNrf8z6qm3Dk5zVoYkg5vlQ2RGClfKlQ7nM3Un23SOFksWYai
        3kGWrub8z6QqFudEo7iwS6VYWBXsJkg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-r5ygW_KtMd6V1DRyzLNExQ-1; Tue, 07 Jan 2020 02:39:19 -0500
X-MC-Unique: r5ygW_KtMd6V1DRyzLNExQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E214800D4C;
        Tue,  7 Jan 2020 07:39:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-116.ams2.redhat.com [10.36.116.116])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 074FB84672;
        Tue,  7 Jan 2020 07:39:11 +0000 (UTC)
Subject: Re: [kvm-unit-tests PATCH 14/16] arm/run: Allow Migration tests
To:     Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
        maz@kernel.org, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com
References: <20191216140235.10751-1-eric.auger@redhat.com>
 <20191216140235.10751-15-eric.auger@redhat.com>
From:   Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <9b03fb14-008b-549b-9336-d5e91208a54f@redhat.com>
Date:   Tue, 7 Jan 2020 08:39:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191216140235.10751-15-eric.auger@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: I79YTu0H5q39

On 16/12/2019 15.02, Eric Auger wrote:
> Let's link getchar.o to use puts and getchar from the
> tests.
> 
> Then allow tests belonging to the migration group to
> trigger the migration from the test code by putting
> "migrate" into the uart. Then the code can wait for the
> migration completion by using getchar().
> 
> The __getchar implement is minimalist as it just reads the
> data register. It is just meant to read the single character
> emitted at the end of the migration by the runner script.
> 
> It is not meant to read more data (FIFOs are not enabled).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  arm/Makefile.common |  2 +-
>  arm/run             |  2 +-
>  lib/arm/io.c        | 13 +++++++++++++
>  3 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index 7cc0f04..327f112 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -32,7 +32,7 @@ CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
>  asm-offsets = lib/$(ARCH)/asm-offsets.h
>  include $(SRCDIR)/scripts/asm-offsets.mak
>  
> -cflatobjs += lib/util.o
> +cflatobjs += lib/util.o lib/getchar.o
>  cflatobjs += lib/alloc_phys.o
>  cflatobjs += lib/alloc_page.o
>  cflatobjs += lib/vmalloc.o
> diff --git a/arm/run b/arm/run
> index 277db9b..a390ca5 100755
> --- a/arm/run
> +++ b/arm/run
> @@ -61,6 +61,6 @@ fi
>  M+=",accel=$ACCEL"
>  command="$qemu -nodefaults $M -cpu $processor $chr_testdev $pci_testdev"
>  command+=" -display none -serial stdio -kernel"
> -command="$(timeout_cmd) $command"
> +command="$(migration_cmd) $(timeout_cmd) $command"
>  
>  run_qemu $command "$@"
> diff --git a/lib/arm/io.c b/lib/arm/io.c
> index 99fd315..aa9e1b5 100644
> --- a/lib/arm/io.c
> +++ b/lib/arm/io.c
> @@ -87,6 +87,19 @@ void puts(const char *s)
>  	spin_unlock(&uart_lock);
>  }
>  
> +/*
> + * Minimalist implementation for migration completion detection.
> + * Needs to be improved for more advanced Rx cases
> + */
> +int __getchar(void)
> +{
> +	int ret;
> +
> +	ret =  readb(uart0_base);

Duplicated space before "readb"...

> +	if (!ret)
> +		return -1;
> +	return ret;
> +}
>  
>  /*
>   * Defining halt to take 'code' as an argument guarantees that it will
> 

... but apart from that nit:
Reviewed-by: Thomas Huth <thuth@redhat.com>
