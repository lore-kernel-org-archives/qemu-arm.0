Received: by 2002:a17:906:ca92:b0:a35:2c0b:b7b4 with SMTP id js18csp9684ejb;
        Fri, 26 Jan 2024 10:16:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIyLavvdZc93hT+DspcDlazibBp3LwrW7hiBsBSD2A1ovma9nxZ5VTZQjK7x6NqLpbZkzP
X-Received: by 2002:a05:6a00:f88:b0:6de:55a:7662 with SMTP id ct8-20020a056a000f8800b006de055a7662mr277219pfb.53.1706292987101;
        Fri, 26 Jan 2024 10:16:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706292987; cv=pass;
        d=google.com; s=arc-20160816;
        b=TFGTpJkLRZl8Ix8tMXoothUZ9iZemGASkCbJxpcnAtSZXwHlmREt4GfWNf4bX9Dwq7
         6RWFi/QsfKHmgEnVsH6YKVKCXSKrl9GYh9mKXBwQXO0YFO16LirMQP+yidWxuigC4eMc
         RuzEtQIGQlIz5c5/zPXO4PKKgTReaGyAIuR2kgZpu5/HsF9snqphdEVx1sbgkm3fNMFW
         iET0J4zINMAflNmOYz+0hPb7KNYEWleHAxBxf+VV7ZfDNy/+95v8nWc5f0vWVDymHM+T
         ygAU138aLc2GROldJwxbVmxnXFZ099/vPe3oVnSOihO0H1KHALoEoIKJujCa5oN+wyzg
         Ti5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:list-unsubscribe:list-subscribe
         :list-id:precedence:dkim-signature;
        bh=uNG6H+3tybJ100+FQ7ifNQULqIkXKOGQRCmck6q+baY=;
        fh=1+KOsEoY3EmNkpFU+sKR5rg4LxfthAd1a8WGcYfRF6c=;
        b=gAJqejiYFMMgnZV3NbgFLpAiv3KS2jWkK8hkdqj6cKEocRhNTV4mlViGs7CxoYKCeh
         93DdfFpyR1lOlmYRvEOiR8xV9T3s9qH4S2/8A+tcl3SDgcAPJHLrfK4jG6uyjLQ68fMV
         glJobbmyYdGv+Pu9EU71DeErkZ0RBUarLYIOumOHTl4+113yoKcDUTSldb/FKgkeyrkb
         tum0fKty9kTYwUCzSIDJZJcLxlBwtkW2vN3Q0fnToPdwz8WSjS+LQKEBF7pJXWEm3L5r
         jaxp6J66iI4KprKgYelWrv3/rEYOs+Ex8/ytrW3nErR57L0ylQ27r6KBp2UvpJkz2xv2
         QG0A==
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dBWZnp3z;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-7191-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-7191-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm+bounces-7191-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id n3-20020a635c43000000b005cd8dc9694dsi1532526pgm.178.2024.01.26.10.16.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 10:16:27 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-7191-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dBWZnp3z;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of kvm+bounces-7191-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-7191-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 81955283299
	for <alex.bennee@linaro.org>; Fri, 26 Jan 2024 18:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E77C20B24;
	Fri, 26 Jan 2024 18:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dBWZnp3z"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924A81EB5E
	for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 18:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706292983; cv=none; b=dU+yv1k6M+eW9lUlVn/At5Ug4lzMd6kpoEmuM5XFTsAFwy/6a7LpWxt/GBTjv+xOu3+aUBGLWbc3Or/2tBqoBSQjnW4cTpo4rwHjh4Gegpg7hi0lHEaOrE+6UdfJHoq9RxYq2S+m+JFNBkMLT3zm4aWAattq1zStWz6sLyXxaiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706292983; c=relaxed/simple;
	bh=Aj47SDmrcP4Pxh/hJwfKzfAt19g8T0eO/pfpf8fQ60M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jHVokyolz93SlMWYgiaQSZMdYlEt2jslWUiLiEdEBL8WhVP8MhdkGWCeO/5RStr3CgptieThprFkWxWDuarKwZPFQG+n9hYxeCBRB6yyHbiH09LDcgqUP5EUDZLs1NVo+ctntYalov80IKzSaaxkYaNTfoKsEe5NOlmVnq2NxVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dBWZnp3z; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706292980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uNG6H+3tybJ100+FQ7ifNQULqIkXKOGQRCmck6q+baY=;
	b=dBWZnp3zPPd2/AjiEvuq1Hmih1zFnun9C6IU+BX3Yl1E47sZlrZPmFnR5c1XRK7wYJAV2b
	vgY5vuKT2ef+SNu8Sxus4/GT4SA5M2B+O5uLjsYVqZvlMPOWe648CHskwlmXf8rh49yo7v
	egO+SpXvyJIiUwW+E7cTKpUGD8wevrk=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-340-_MqfY369OT-d7T8znew5CQ-1; Fri, 26 Jan 2024 13:16:18 -0500
X-MC-Unique: _MqfY369OT-d7T8znew5CQ-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3bdf1be1528so965669b6e.2
        for <kvm@vger.kernel.org>; Fri, 26 Jan 2024 10:16:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706292977; x=1706897777;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNG6H+3tybJ100+FQ7ifNQULqIkXKOGQRCmck6q+baY=;
        b=UrkeUWiq8gBHHrnngp+KKxDGGLetOplvuQ0X5S5VzaVeUvePpD+utjIQgpNMqB8hQs
         Z1FQ0m6wvWTujBWA57+IwGmbqhhcVgajo5Ia+Wb/Zid72GV47Gxpbsiq7AobgrUHNX9a
         DREOaDhg1IkaE71KTwVM55HLN31HlFU+x91BY2GS2fBVA6SHFP+PiIUqThmHaILwH0dx
         89mLh0VAu3Gxh53b7ZosITbVSRf+r2HHvheT8uHG0ui+FsDXxFN7ybVU5ountfOqBqkh
         xe06oztPsgyQrxkL9AYf2SgdwRi97E+BJKDP7xR1kWoD4OgXtBS+ZukHUAufZLM7xg2L
         b2lw==
X-Gm-Message-State: AOJu0YyraYswZUkosZzrzMHbuDZB+b7VjWi3sACvjjAKXIl63Xn8/U0g
	aCVESyjPjI6pn5dB8n7kYiO2evybSRNAYtumWIaXw6BTP3EbyLv6O0jr8VAgmsizxI3hpUyHh3u
	S8ToUL03U+XBNcmJsNoze3JtdQ47ACgacrQ3Ysyhd6GXEV6oGHq9KUHfYEfbMCBQSp/cw7FGp43
	YX0O0VFpv4CV3cI1GjVEmlU+W3
X-Received: by 2002:a05:6808:d4b:b0:3bd:f41f:f9a6 with SMTP id w11-20020a0568080d4b00b003bdf41ff9a6mr168941oik.25.1706292977737;
        Fri, 26 Jan 2024 10:16:17 -0800 (PST)
X-Received: by 2002:a05:6808:d4b:b0:3bd:f41f:f9a6 with SMTP id
 w11-20020a0568080d4b00b003bdf41ff9a6mr168928oik.25.1706292977542; Fri, 26 Jan
 2024 10:16:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240124155425.73195-1-philmd@linaro.org>
In-Reply-To: <20240124155425.73195-1-philmd@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 26 Jan 2024 19:16:06 +0100
Message-ID: <CABgObfb8pKdf=Q7JPDQ9j=Zanbk9gYOC8ufxprGA88zAPaoO5Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] accel/kvm: Sanitize KVM_HAVE_MCE_INJECTION definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org, 
	qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: We6fxG9ILhsa

On Wed, Jan 24, 2024 at 4:54=E2=80=AFPM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Trivial replacement of KVM_HAVE_MCE_INJECTION by
> KVM_ARCH_HAVE_MCE_INJECTION (not the "ARCH_" difference).

I am confused, why can't you just rename the symbol and instead you go
through this change?

Paolo

> Philippe Mathieu-Daud=C3=A9 (2):
>   accel/kvm: Define KVM_ARCH_HAVE_MCE_INJECTION in each target
>   accel/kvm: Directly check KVM_ARCH_HAVE_MCE_INJECTION value in place
>
>  include/sysemu/kvm.h         |  7 ++++++-
>  target/arm/cpu-param.h       |  5 +++++
>  target/arm/cpu.h             |  4 ----
>  target/i386/cpu-param.h      |  2 ++
>  target/i386/cpu.h            |  2 --
>  target/loongarch/cpu-param.h |  2 ++
>  target/mips/cpu-param.h      |  2 ++
>  target/ppc/cpu-param.h       |  2 ++
>  target/riscv/cpu-param.h     |  2 ++
>  target/s390x/cpu-param.h     |  2 ++
>  accel/kvm/kvm-all.c          | 10 +++++-----
>  11 files changed, 28 insertions(+), 12 deletions(-)
>
> --
> 2.41.0
>

