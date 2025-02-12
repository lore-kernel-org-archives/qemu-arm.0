Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp1070646njb;
        Wed, 12 Feb 2025 07:18:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVn567K/Czt2NLAniIKzDSRvNxko+34qlewcStPFkywKHRrJQRR4eja+V+UDVPAas56dw5kb//3rU/NWw==@linaro.org
X-Google-Smtp-Source: AGHT+IFrjjyKnCMPO+li3+u4LDXtMCRz/7ToHp+weMKjGtTPKWUwB7nEdym0BOgzxoaT0Ll09i0V
X-Received: by 2002:a05:6102:1624:b0:4bb:d394:46d8 with SMTP id ada2fe7eead31-4bbf216fda0mr3535626137.3.1739373508619;
        Wed, 12 Feb 2025 07:18:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739373508; cv=none;
        d=google.com; s=arc-20240605;
        b=TkRZv21WuGBNiWIobRxJQ97O0aPoLFgLEWIep9uzq6zJRQJDKDmRg3Fm59C3rSoMAT
         7X1W+VPLlGBll6euwawwRwi+/XpJQrxUjR2NagRqjfvt93luDHVX1ZF66w29lNc0vScO
         Ec4DVjOkL8hh4+6VvMJ+k3CLCrpLa+W1LcN9TWns/omJKBjJoeNB49u/OR+r2u9LxS5i
         2op1AaZ05QrZv36VJM8Otk4W268/yHgkxSZSL7RSrawJYRloUa9lJZXy/qxBWwwGyTBI
         3wdyxz05MU1OuHakCLUJQ+KB15eS3drtrguNxRtkBNn3u4geROExViv3CC6izI3zQsGE
         5h+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=pznjQpNT4cEyd/cN66+L5rE5TyVfq4GkmwObYFdounw=;
        fh=rrua58aPyIBHnRLYa6DhwCQw1Suzf5rAWcQoGwyatcE=;
        b=PptGpmOxn0LPBqi8HNa5lvq8U2mOKbfy6srO7nntCjsgvmyhu3xCTfxzoyedp8jdP8
         BzR9F/BCIOlUitezXWK3/nSjv7YSgWMultRDit6Kd31v0kbOH5/vuK7SBrb04feNkE2f
         ouUBb1LrGGgB/7gBHp2h1dZoi+25070liGsHoHiQn1JouewMU2nuAVrvLmkS0E04xE+r
         +7PpzIl8k1CCC9HDfCUgti/udpLuNcEVtDcpcPGOg3/IHbSS/zlsoDbwAadBVfsyORhM
         SdMcJC0gqCOobDAd6ial8+8n7pQVcS9dpHjEPyH7uGgqI2dnmWUjNH3Zv15f4n1pmcOJ
         uW1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cMdwk2ce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4bb662d2c0dsi1839882137.237.2025.02.12.07.18.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 07:18:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cMdwk2ce;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiEVJ-0002TD-BU; Wed, 12 Feb 2025 10:18:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiEVH-0002T2-1J
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:18:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiEVF-0007sZ-8h
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 10:18:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739373495;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pznjQpNT4cEyd/cN66+L5rE5TyVfq4GkmwObYFdounw=;
 b=cMdwk2ce1dJqGHp7aqmVGDKsrkuBvu1Qavcru05ajPhd2NEkGPJAod1r0xPgxcEDixAYOT
 vDwZKdpxscvLrAd6Hm/3S4lvOw34hwyGmZt87+NTxLl6KQ59YDz8gzYVSdXELbIDsm0Rl6
 qYvrlwNc85wbTD7lr9EAQ+WwsJuNwxQ=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-426-kQ7jVIrkOoW3B5S07dV-tw-1; Wed,
 12 Feb 2025 10:18:14 -0500
X-MC-Unique: kQ7jVIrkOoW3B5S07dV-tw-1
X-Mimecast-MFC-AGG-ID: kQ7jVIrkOoW3B5S07dV-tw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id BCF821955DDD; Wed, 12 Feb 2025 15:18:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.69])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 3DDEB1800570; Wed, 12 Feb 2025 15:18:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BC94018000A6; Wed, 12 Feb 2025 16:18:09 +0100 (CET)
Date: Wed, 12 Feb 2025 16:18:09 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Alexander Graf <graf@amazon.com>
Cc: qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>, 
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, 
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Michael Roth <michael.roth@amd.com>, 
 Markus Armbruster <armbru@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, 
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v3 09/23] hw/uefi: add var-service-core.c
Message-ID: <4bwjwcs2k4hbrj6mokc57a5dy57jjssfxnvd4qm5257dgnid3x@yqdx7e47o2mf>
References: <20250211092324.965440-1-kraxel@redhat.com>
 <20250211092324.965440-10-kraxel@redhat.com>
 <da0ac9ed-fdca-433e-b793-5423f430a852@amazon.com>
 <iuwaykfdm7bwtvblyz7lkew3em2ksi5xeztdphqjdv7tsp2ejw@s6j64y3lfmrw>
 <ea1d355b-7e56-47ef-b1e7-158003b6d85f@amazon.com>
 <kk4f5e3olb26qfjveqefkuzrjc45djikkk7uspz4yj7iesdmbj@zointitbvhdp>
 <73fe41f7-dff0-4506-8769-1997323c0a76@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <73fe41f7-dff0-4506-8769-1997323c0a76@amazon.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QSZxJKwjZm+n

  Hi,

> > Yes.  Knowing both physical and virtual address works only for memory
> > you allocated yourself before ExitBootServices.  So you can't pass on
> > pointers from the OS, you have to copy the data to a buffer where you
> > know the physical address instead.  Yes, some overhead.  Should still
> > be much faster than going to pio transfer mode ...
> 
> MacOS takes over the full physical address map past ExitBootServices: Your
> code no longer has VA access to random code

That is totally fine.  EFI drivers must register everything they need as
runtime memory.  Anything else can be unmapped by the OS when calling
EFI services.

> and it literally memcpy()'s all preserved (virtual available) code and
> data to different physical addresses.

Uhm.  I have my doubts this copying behavior is blessed by the UEFI spec.

> You simply have nothing that is all of 1) RAM (mapped as cacheable on
> ARM), 2) known VA 3) known PA.

Bummer.

> So we really really need a fallback mechanism that works without DMA
> :).

On arm it should be relatively simple to move the buffer to device
memory.  Just place one more region on the platform bus, advertise
address + size via device tree, done.

Not sure how to do that best on x86 though.  Find 64k unused address
space over ioapic?  Do we have enough free space there?  And how
future-proof would that be?

take care,
  Gerd

