Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8958573lfc;
        Fri, 19 Feb 2021 04:01:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrnUANm15HkwW16mg6UC4t37gTZQZ99gZLQ4EKfJd1N+F/NcIYbrXWJdHguGxK6WP4f7nA
X-Received: by 2002:a25:c6cb:: with SMTP id k194mr13005360ybf.27.1613736098685;
        Fri, 19 Feb 2021 04:01:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613736098; cv=none;
        d=google.com; s=arc-20160816;
        b=bV962v4I36D+HTNtRlT0ZrCve/5dWzmzQP5IK38McqunBV6ZM8TO6ZC5sH2Q0eEJTG
         RyrOMxmHCE+U7L6HCk8e/J2Y9jjq8cC7xJUMVNBUDE0FbtobAu49/P/nJgSndJherzpE
         1Td5P2x2lyrh6EZdMav7+ICQvfitDNXwIuEcu0AdbE/Fpfs3NMHkVAWVW0BpeBSQ7wE0
         oFnmfO6/ulwUYncRWQoNY87/2MNMCaErVVVyKhRKl2q6SnB2Z1ONGVJ/I5QR/M1mHU3f
         WN2/ch3DWxm68ZX6yyWqRPkM21JpXl6KfSOB7oDkUrxgLl1lqm9Favn+AX33pqtnk3Bi
         gYYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=fWLnHPiFIN233EMx/9zN13PG+fjuD+081yp+85rEGDg=;
        b=FRNWWvjrVhW53dIEtE25E3NeQo7Aap2qFYYFIKAbFp0yGsUUDw2u3b8Sxqs1pxecl4
         +1DCmuBW7tTwX9Yb63rP5YTtMWFE7grWnlAOb5ULWNbaPYfJxzH2j5Q30PRMLddEMSzF
         D+heQekhIeHPQ4NGzBMMGxfzWEu8sXl77XC/E2fQuesFkCS3NfyUoDAPx47IB/pg79El
         HdnnaEvZ4mlfo1p5F/y4vJTomlOZt6dcHsB+chSUt2GsEiRP0hRLq6W3qvhh8CcMtRFi
         3nCX6BiUDQFCrJHUPVfSV9GqL/EW0heJ0cg1YOcE8ByDGzReyyNjFs7I8rU0fIMQt5Ca
         J6tQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MBQGfBGK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d16si8906767ybn.137.2021.02.19.04.01.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 04:01:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=MBQGfBGK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4TZ-00048N-UG
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 07:01:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD4TJ-00045D-UR
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 07:01:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD4TH-0000uw-SH
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 07:01:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613736079;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fWLnHPiFIN233EMx/9zN13PG+fjuD+081yp+85rEGDg=;
 b=MBQGfBGKhTKMYeVEFz8MFN3fDkLLHUjwm62zdOQZXjCYIqdl7a0JpZ5W/+FUBpSXZQpnhg
 YKQi87uu8hnDla06ZdaPN39XA2fsVGQK7Xr2M0QU/SYoEh7/FFPOA47X/krqaPQCu3cxni
 5yUKclrGDY7CXJcXI0l/ZW+42XFotbc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-68-9adYdHpkOCaGhZODEykq9g-1; Fri, 19 Feb 2021 07:01:16 -0500
X-MC-Unique: 9adYdHpkOCaGhZODEykq9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3CE5846208;
 Fri, 19 Feb 2021 12:00:52 +0000 (UTC)
Received: from redhat.com (ovpn-113-184.ams2.redhat.com [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FCEA19C71;
 Fri, 19 Feb 2021 12:00:46 +0000 (UTC)
Date: Fri, 19 Feb 2021 12:00:43 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
Message-ID: <YC+oZWDs3PnWHPQo@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210219114428.1936109-1-philmd@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
 Leif Lindholm <leif@nuviainc.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XiqEKrEX2p1S

On Fri, Feb 19, 2021 at 12:44:21PM +0100, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series aims to improve user experience by providing
> a better error message when the user tries to enable KVM
> on machines not supporting it.

Improved error message is good, but it is better if the mgmt apps knows
not to try this in the first place.

IOW, I think we want "query-machines" to filter out machines
which are not available with the currently configured accelerator.

libvirt will probe separately with both TCG and KVM enabled, so if
query-machines can give the right answer in these cases, libvirt
will probably "just work" and not offer to even start such a VM.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

