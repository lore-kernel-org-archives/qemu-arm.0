Received: by 2002:a17:505:4688:b0:1be9:327d:8ee3 with SMTP id cb8csp899611njb;
        Wed, 12 Feb 2025 02:34:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVjKXz55vQqSmou5Yt9ue081/EZ6fdxdP2hrmDCRIM8dfol6wYC5YPh83oV4U8G4pVkDJ+YM5GjNFWjXA==@linaro.org
X-Google-Smtp-Source: AGHT+IGw9JMMmF9HM9On2MQKwf1Da9R3+gBTnpJ4gkdEH6oSYEjsW7pb0ca7hRdl53ESJreOUZrf
X-Received: by 2002:ac8:7f89:0:b0:471:a14e:52cd with SMTP id d75a77b69052e-471afef720dmr38019411cf.44.1739356480022;
        Wed, 12 Feb 2025 02:34:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739356480; cv=none;
        d=google.com; s=arc-20240605;
        b=HSAxuPOik/vmM6yCesJWXf7bW9UY7i9PUSWAfDOjgRGTXFQfSp/AlcHYnTqBDRMP9v
         zSj9p3c9vcbZSgCmn9a2CUimOVC4D2QVZEi7PCirrbRJmVBrceRmBJnDCis64CMI0pnv
         QjlE/W82d6tT8lo7M58dQktJKrsRjg7Jx0N3L/HQURIF+QAQrTfPki9m5ayp0cvxsOKU
         UHAnEYfdyQlZpzx2JrM3TwvdJpxxpg965j/vxqBas1DrNG17UT7mFwYGNHBtDhLaa4Bg
         N74Yf1DwUw7Pb52N+TFa2fIVqu76T4vXK1oivOiwDpU49eN1yf0hV6oTk3WNuBmP+SYR
         YpOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=37zSZP/YzU+7JZ2I1m0TjA9cc7mg8tcEdR8WmIruyt0=;
        fh=rrua58aPyIBHnRLYa6DhwCQw1Suzf5rAWcQoGwyatcE=;
        b=NSVe7rAAF+XOGM0PrFBglgNodYNuQ95JY96ug0mjgCMwKwGLnR5l5/5YwAHOCGmQnt
         y6+7LK/CWt7BWm6YOGCjumB28QknElTkuRpj+nvLbqaPqDp1CFuj7JGVJVZfiK34JNDt
         qH8ccaGnKWPFSMv7rAAn8O3xIPOewJwCZH+OQYGMAz7AJzP+AHv6VjqFIzw+tRrH9AgR
         hwzwspySmb/wA0UXOxC2SwIn3TjpCjFNPdVL96liNjh2YBotpfoyGBBu1h/MW/h/P0DD
         AIB7ATUyJXiNriWC2A51TY+BP1oz6SU2BC8C9tU5Wis+HwnMYmlKrpK8KGrL6lYCr6BF
         SE/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cWdEPQ4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4719704de06si53828081cf.476.2025.02.12.02.34.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2025 02:34:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cWdEPQ4O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tiA4O-0004OL-Uz; Wed, 12 Feb 2025 05:34:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiA4L-0004MP-Ro
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 05:34:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1tiA4J-0008WM-18
 for qemu-arm@nongnu.org; Wed, 12 Feb 2025 05:34:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739356448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=37zSZP/YzU+7JZ2I1m0TjA9cc7mg8tcEdR8WmIruyt0=;
 b=cWdEPQ4OOc/qmxkA9MpjvOk8PMPinx2syQ8LEE302CNieO7cKijonZLylHbyIAsvflRApy
 Wx9qIDjgvcNCNYez1XZ+GySCQG89CbsixLKsgmIOVYpdzXzGBszouzm54ORNjZYLm05Vqj
 lgSihPkO1v6CeCxT/nIdoOfOoj1UGOk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-435-h3ez48SlNXS_uSjYtAQVuw-1; Wed,
 12 Feb 2025 05:34:05 -0500
X-MC-Unique: h3ez48SlNXS_uSjYtAQVuw-1
X-Mimecast-MFC-AGG-ID: h3ez48SlNXS_uSjYtAQVuw
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 93C4A1800873; Wed, 12 Feb 2025 10:34:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.45.224.69])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 05529195608D; Wed, 12 Feb 2025 10:34:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 19B5C18003A4; Wed, 12 Feb 2025 11:24:15 +0100 (CET)
Date: Wed, 12 Feb 2025 11:24:15 +0100
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
Message-ID: <iuwaykfdm7bwtvblyz7lkew3em2ksi5xeztdphqjdv7tsp2ejw@s6j64y3lfmrw>
References: <20250211092324.965440-1-kraxel@redhat.com>
 <20250211092324.965440-10-kraxel@redhat.com>
 <da0ac9ed-fdca-433e-b793-5423f430a852@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da0ac9ed-fdca-433e-b793-5423f430a852@amazon.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.54,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: FudwNxYyFga/

  Hi,

> > +    /* read header */
> > +    dma_memory_read(&address_space_memory, dma,
> > +                    uv->buffer, sizeof(*mhdr),
> > +                    MEMTXATTRS_UNSPECIFIED);
> 
> Depending on DMA sounds appealing at first, but can fall apart in corner
> cases. I know of 2 cases where DMA failed for me in the EC2 equivalent of
> this:
> 
> 1) SEV-SNP. If you want the hypervisor to implement UEFI variable services
> for you, the buffer region must always be in shared state. Ensuring that
> during boot time is tricky but doable. At runtime you no longer really have
> control over the sharability of pages.

With SEV-SNP I don't see the point in using this.

Why do you use confidential computing in the first place if you trust
the host with your EFI variables?  I'd rather see something simliar
running under guest control, in svsm context.

> 2) Mac OS X. MacOS is the only OS I'm aware of that really makes use of
> relocation. They move your physical pages to random locations, give you a
> non-1:1 mapping to that and once you're in real OS land, you have no more
> knowledge at all about the physical location of anything.

On the host side you have no insight into this indeed.

The firmware knows all this very well though.  The OS passes a mapping
table to the firmware, efi runtime drivers can subscribe to mapping
updates and can use RT->ConvertPointer to translate addresses from
physical to virtual.

The edk2 code (https://github.com/tianocore/edk2/pull/10695) does
exactly that.

I see your driver does that too, so in theory it should work just fine.
I'm wondering what exactly the problem with macOS is?

> Also, I'm surprised you cut the variable service off at the SMM boundary
> instead of the RTS callback boundary. Why is that cleaner/better than
> implementing variables completely in QEMU?

Well, the variable service /is/ completely in qemu.  See patch #6 which
implements getvariable & friends.  edk2 serializes the variable calls
into a buffer and sends them over to the SMM side (or to qemu with the
patches).

I didn't feel like inventing a new serialization protocol if we already
have a proven one in the edk2 code base.  Also it is possible to send
over more than just the variable call.  There is a variable policy
protocol implementation (patch #8), and we also get some events
forwarded.  More can easily be added should the need for that arise.

> It would be nice to agree on a single external variable store implementation
> :).

It would be nice to have nitro support merged upstream,
especially with BYOF coming.

take care,
  Gerd

