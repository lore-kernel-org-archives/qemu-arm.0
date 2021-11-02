Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp3330173lfv;
        Tue, 2 Nov 2021 05:17:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmHOi3TZJA2tj75xSKs0A70us+9ZKXi8yT04K/kbfRaFw0DPGdnOYMPdMZA5TWtB+xP9iv
X-Received: by 2002:a05:6808:130d:: with SMTP id y13mr4818239oiv.160.1635855445336;
        Tue, 02 Nov 2021 05:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635855445; cv=none;
        d=google.com; s=arc-20160816;
        b=i/hjWZXCnCfA+mWSHBO0kydenXbCWntKvPNBoe2r875e42feymWULBAdj8HjDzmjzh
         rHQDrZKkkeBqDkzpLjNt+qW+bKBDVE+BRnMJO2OqbRejO70InjOnzmUHwBJUNzOcmlsN
         iXnB2wvUhy51Y0ed7waBqW4Lq7rkHI4X5PMEbLfZ/NeLPYoT6hPNeIWkpS5mfmuO/IA8
         qH87gg+cwoAN8MorF1tXfuygPZosFAi9x80ZItoCdADAUU00CAcjZ5EKJzq+yKzXz0se
         9AljhKD7RYp607MuYsWTfmCYC3ln4htdbG+KA9Wu2BgMwR5YGmSgF7+A8sVGxAgrg3A7
         KbRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=N+vJnvhjVhxzWqkJCLJUN/bU5S1pXKsSpjbV1scpaMI=;
        b=K+NE/7h+y1DobyCyLGW3ocfF95enp0BZjz7ngZfKSQ+ij8JNY4L4ODDIHxlLOJ5Z2C
         Wca7uBiXAY9zDgYoukVxVhyyyqbESFGEe7sv1hluDhUAZJxao6lH09lBOz7o/4L3Ugga
         B2n0vuRtWWRDpxsB6bOchuZgD6cWGIYgA0PdcWubbaxVmevBAZBG25DCKZv+OG37M62+
         ONZk1nVUiM4RX0qykufRvIMxyDmOnxo+PjRJXgiLyZroN6i/vipC8siAMiVrzcMRCagm
         a8D6f4TbaYH3RCeRe5/G1sQzsUy2zAFBpWh8QVCxDZLwBn9TMDVXpgNXavwsIqWsFXt/
         aUVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jUBHn8+A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si9049486oiw.168.2021.11.02.05.17.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Nov 2021 05:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jUBHn8+A;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhsjE-0002J1-Im
	for alex.bennee@linaro.org; Tue, 02 Nov 2021 08:17:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhrv7-0002UH-3d
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:25:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31622)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhrv5-0001Y7-Lj
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:25:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635852335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N+vJnvhjVhxzWqkJCLJUN/bU5S1pXKsSpjbV1scpaMI=;
 b=jUBHn8+AYrH4R4EqYiQqbIE3edNc2zU03VXVcoDm2kmSQqzQiW8tVt9oJMgXOBBhtr+b0B
 xYGU4Uu1f/SIbYsvtFVYeyfytTObdTHZEbCGhiEjLj8vDd0P/+v4hKdGJxE7FjypdnTqkC
 SCrxhZs4VAgRFlphgOoeskl6WDEPH6s=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-rbGw1n-cNtG6w8MrDB3_OQ-1; Tue, 02 Nov 2021 07:25:34 -0400
X-MC-Unique: rbGw1n-cNtG6w8MrDB3_OQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 o22-20020a056402439600b003dd4f228451so18478657edc.16
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=N+vJnvhjVhxzWqkJCLJUN/bU5S1pXKsSpjbV1scpaMI=;
 b=P/gUU5AvF1vyNRr2JyVAxbFLHmSRJE8FMwFvtLMmQCGCW+3HIIvxVWs03PeYgW/m7E
 aa4TlvLFB9dJNIhNluQvDWW6ITuPnO3J6cStA1mv/53ny1ESc/DAI6tQttjzQsjcG923
 CmlbAjre8OtkQGCnxSilMiAZPtF/FlqisyprUnLChh5Vc9XkWLvBiGffai64nUkfOv/V
 liYlNGQAHT2j7hR2m69YMGGKlQIWdCJJmiClylmZSUzXrhnlzpKDYjQ+LjpU8I2bu4hG
 +IZC/3DcOVvE3BaTfEmLl4VPY456fwhqlwC5sIVElvby812N8Xpv8W0MzfjA4NksET7h
 Xfsg==
X-Gm-Message-State: AOAM530TPpUsJBxrkvamq7a13f/E108ZVr3qh+6C6l+mhvxE/ZZyWLTh
 ihl5A/eA3SxDqAkuh2xUimausw4wFiS4M6Qyrk+Krn2NhlrQpbhOxtIrsFps28VRGTB/vEte67+
 wK1anNe+IvnD1GtE=
X-Received: by 2002:aa7:cf8d:: with SMTP id z13mr15241897edx.5.1635852333043; 
 Tue, 02 Nov 2021 04:25:33 -0700 (PDT)
X-Received: by 2002:aa7:cf8d:: with SMTP id z13mr15241836edx.5.1635852332694; 
 Tue, 02 Nov 2021 04:25:32 -0700 (PDT)
Received: from redhat.com ([2a03:c5c0:207e:c1:107d:c1da:65:fcb8])
 by smtp.gmail.com with ESMTPSA id f25sm5365080edv.90.2021.11.02.04.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:25:31 -0700 (PDT)
Date: Tue, 2 Nov 2021 07:25:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v3 3/3] hw/i386: expose a "smbios-entry-point-type" PC
 machine property
Message-ID: <20211102072349-mutt-send-email-mst@kernel.org>
References: <20211026151100.1691925-1-ehabkost@redhat.com>
 <20211026151100.1691925-4-ehabkost@redhat.com>
 <a2618cf2-a2a6-53f6-a7f0-8bb3a72d32e9@redhat.com>
MIME-Version: 1.0
In-Reply-To: <a2618cf2-a2a6-53f6-a7f0-8bb3a72d32e9@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Eric Blake <eblake@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KOYrW2MYlNnH

On Tue, Nov 02, 2021 at 09:51:35AM +0100, Philippe Mathieu-Daudé wrote:
> On 10/26/21 17:11, Eduardo Habkost wrote:
> > The i440fx and Q35 machine types are both hardcoded to use the
> > legacy SMBIOS 2.1 (32-bit) entry point. This is a sensible
> > conservative choice because SeaBIOS only supports SMBIOS 2.1
> > 
> > EDK2, however, can also support SMBIOS 3.0 (64-bit) entry points,
> > and QEMU already uses this on the ARM virt machine type.
> > 
> > This adds a property to allow the choice of SMBIOS entry point
> > versions For example to opt in to 64-bit SMBIOS entry point:
> > 
> >    $QEMU -machine q35,smbios-entry-point-type=64
> 
> It would be nice to have a test for this...
> 
> Otherwise,
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Can we update seabios and the switch the default?
Maybe just for q35?
Or are there more considerations?


> > Based on a patch submitted by Daniel Berrangé.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > This is patch was previously submitted at:
> > https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com
> > 
> > Changes from v2:
> > * Rename "smbios-ep" to "smbios-entry-point-type"
> > 
> > Changes from v1:
> > * Include qapi-visit-smbios.h instead of qapi-visit-machine.h
> > * Commit message fix: s/smbios_ep/smbios-ep/
> > ---
> >  include/hw/i386/pc.h |  4 ++++
> >  hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
> >  hw/i386/pc_piix.c    |  2 +-
> >  hw/i386/pc_q35.c     |  2 +-
> >  4 files changed, 32 insertions(+), 2 deletions(-)

