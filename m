Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp958432njb;
        Wed, 12 Feb 2025 04:29:24 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUpiIn4H8P6uiA8v+XjIz83cTr+AVuKqKxmfc9ke+U973KM4KxVPSmsGRZ80pzJO8Uo8bkaUbV0jcuufg==@linaro.org
X-Google-Smtp-Source: AGHT+IEQhMvZx37lRxKtrRpwQTL16hRNb9PYu56olMXbnEOaGCAZBTltGdx7LT1EyE1zYoxzbjkh
X-Received: by 2002:a05:622a:65cb:b0:471:b544:e6fc with SMTP id d75a77b69052e-471b544e895mr18884551cf.26.1739363364018;
        Wed, 12 Feb 2025 04:29:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739363364; cv=none;
        d=google.com; s=arc-20240605;
        b=QLzIIBeKquULMe/88mWsjjvFJiVaup+Q0vBNQcwp9Z5+E1zWdScg3WlYBBC8a1foji
         MM8J/LU/WJPqf8C7UuQTfg9gYlEI0Vk8GAQrsLWVkHS1CJp+QBxkLIUotr/gfK5xRoAr
         rrFvwrOUsP08LuTpyu4XWMTK7PHqc19Zuh4dtgdUdkM1UDbRHej9WMQyGgiDB0nNsKk7
         CjuTagJEUOQaxG6aEuOm1C470cebHg0fL9EZbl0mfqJ55v6LmzaAfQMD8iTeufRAhW6q
         h1okWlC8USv5+NJfdMBLsBZkIWXTvaQ8xldnK6Q1MtGOKa1qPVTXr6TAVqwFgaY8jxY0
         MFkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=JXRjSceMxYxUagBLxQrXrdr/9hn78YW+HitZU1RergM=;
        fh=rrua58aPyIBHnRLYa6DhwCQw1Suzf5rAWcQoGwyatcE=;
        b=dm5pkyQztdoUXo46CIhR+Lgn8GoplGf9I1IUbXJ4d62G3iUyn6TOLwplg0kEjjCTcl
         FA5xLu+VmQLUTcbvH3Ed9GnFWsrgpArC2fiQnlRKQehWcbllyD/9No0tzz5XKcNAcG5K
         T5/De06hqa8hilR+LN9Ny1k7y0UBUiwFDByl6rlgifcJsiQYdHQ67mR2s3abqO4nBF+y
         QCxMB60rVTt00zSVZhN3TYIyVtyfpm4EfI0ReCp9/RAntl2hyU5ZcQodywvKxuKF9Va5
         LUBan0+g3N8QZ/Cr+yZ/MI+rE4v/d5pxPbGa9D6XLpvET753enzPt+PaM6iNHBnKkt1h
         gDHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eQRJZ05s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bbf743si139548851cf.521.2025.02.12.04.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 04:29:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eQRJZ05s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiBrg-0000OG-0v; Wed, 12 Feb 2025 07:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiBrE-0000JG-WE
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:28:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiBrC-0005kL-E0
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 07:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739363325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JXRjSceMxYxUagBLxQrXrdr/9hn78YW+HitZU1RergM=;
 b=eQRJZ05sgw48TFGbGjK1RQf/FqS6LQsxWKuI3xfds7j7LWov18yddmdVD7WzDZrFb51Rff
 ofSk0ZPa0YkEQAVLpSxYPtCBWysd9b3rstxgGmZ1RPc3yZUq0pkOU/tE2mShgUYZpwtx8u
 GnWSu0YBV7Nx/cW+WrQ/r3sbcDKmHPg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-265-SnQWMP13NRO2XE79_u8Duw-1; Wed,
 12 Feb 2025 07:28:41 -0500
X-MC-Unique: SnQWMP13NRO2XE79_u8Duw-1
X-Mimecast-MFC-AGG-ID: SnQWMP13NRO2XE79_u8Duw_1739363319
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 955ED19560AE; Wed, 12 Feb 2025 12:28:39 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.69])
 by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E68E930001AB; Wed, 12 Feb 2025 12:28:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9E6B918000A6; Wed, 12 Feb 2025 13:28:35 +0100 (CET)
Date: Wed, 12 Feb 2025 13:28:35 +0100
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
Message-ID: <kk4f5e3olb26qfjveqefkuzrjc45djikkk7uspz4yj7iesdmbj@zointitbvhdp>
References: <20250211092324.965440-1-kraxel@redhat.com>
 <20250211092324.965440-10-kraxel@redhat.com>
 <da0ac9ed-fdca-433e-b793-5423f430a852@amazon.com>
 <iuwaykfdm7bwtvblyz7lkew3em2ksi5xeztdphqjdv7tsp2ejw@s6j64y3lfmrw>
 <ea1d355b-7e56-47ef-b1e7-158003b6d85f@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea1d355b-7e56-47ef-b1e7-158003b6d85f@amazon.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: psELVen+CLpe

On Wed, Feb 12, 2025 at 12:30:20PM +0100, Alexander Graf wrote:
> 
> On 12.02.25 11:24, Gerd Hoffmann wrote:
> > 
> > Why do you use confidential computing in the first place if you trust
> > the host with your EFI variables?  I'd rather see something simliar
> > running under guest control, in svsm context.
> 
> That depends heavily on your threat model. You can use a host provided
> variable store to gain variable persistence for things like boot variables
> and then have an ephemeral SVSM based TPM that you use to measure the loaded
> payloads. A malicious host can already replace your root volume, so
> extending the threat to variables is not the end of the world.

If you go depend on measured boot instead of secure boot then yes, this
might be a workable model.  Should be doable with a small svsm driver
which forwards requests to the host via svsm-controlled bounce buffer
(where the svsm has control over page properties).

> > The firmware knows all this very well though.  The OS passes a mapping
> > table to the firmware, efi runtime drivers can subscribe to mapping
> > updates and can use RT->ConvertPointer to translate addresses from
> > physical to virtual.
> > 
> > The edk2 code (https://github.com/tianocore/edk2/pull/10695) does
> > exactly that.
> > 
> > I see your driver does that too, so in theory it should work just fine.
> > I'm wondering what exactly the problem with macOS is?
> 
> You get to know the new virtual address, but ConvertPointer never tells you
> what the new *physical* address is. That means you have no idea where to DMA
> from once you're in virtual land.

Yes.  Knowing both physical and virtual address works only for memory
you allocated yourself before ExitBootServices.  So you can't pass on
pointers from the OS, you have to copy the data to a buffer where you
know the physical address instead.  Yes, some overhead.  Should still
be much faster than going to pio transfer mode ...

> > It would be nice to have nitro support merged upstream,
> > especially with BYOF coming.
> 
> Yes. Or converge on this protocol instead to simplify the firmware
> implementation

Yes, that works too and would reduce your stack of unmerged patches a
bit.

take care,
  Gerd

