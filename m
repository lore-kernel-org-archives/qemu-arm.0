Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp8972375lfc;
        Fri, 19 Feb 2021 04:19:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBPtiu80q01VZwCKOVNxI/TwoxXSi/iQmxphLU9TUbStBBSsb+Yi5P3hH/Q+33wdga0RVn
X-Received: by 2002:a25:560a:: with SMTP id k10mr13890228ybb.165.1613737164700;
        Fri, 19 Feb 2021 04:19:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613737164; cv=none;
        d=google.com; s=arc-20160816;
        b=aQwohOVij18GoRTdEA+IRf1rxDwPRkCXprUdN/5paDzPvzcXaTYnztwkm0vvWGmzff
         2tE2+9BG/UmLcCvgYJLY3dAtMWQ64rmUZWRvwitnsfFI1uOXE+8IGrc7uiMZTUDeAKgC
         lYDSflI25KTcVbf8UIMWsJm826nsQgQNSgHH65tHyWUD9ihGoeQsEeWLfoIOuHBb5y6Y
         AHjb/c/FvEaLZxH4uU7NUFk24f/a5yj7sLl1zoyzFwO8PKknXRSikVaHJZn1RlA6AsW5
         panm6jS41srJ62eIhWGQ6VCyBG7IVjJIK4iO9LXaKdFXSv2GdGRX8mVfBZzpDEAAl9nH
         86mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=u7HT95kkWTHrCt+Iv/CYRhOhkzd75rYC+HIZYMaBL0w=;
        b=XCaVkDqVClIkBut8nsmkqL5CqISPKDCfm1fOLBX6lIv/Q6FXGc2PMvwwK5wjUiyKW2
         XmkAh/sGZ+b05zA1WbFQVWL/qeoKJgx5IkDNWENCyWjmZBt8HylurQGgiKnT7yS4ynhJ
         1WVzod6bMoJUc32jJEZKDKRldExuRaZtsjoWKmx9h/ChCdMwa/dsVqAnEcXIEwMMiPMz
         pub7yfvc2LTHxfJm3t3/1bjF7lhJCuXaKYCkdIgIVZ6YOWhII6GLtfS/x+0wa+4wEtLu
         LRH0Bcep/RirXG4kJ/sFJTmg3UeErnvqZLyiU9jFx21O45tW3j0DAglc0ykGTLzqWBCP
         uQnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="DYJjov/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x133si9658701ybx.26.2021.02.19.04.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Feb 2021 04:19:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="DYJjov/t";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lD4km-0006yU-3X
	for alex.bennee@linaro.org; Fri, 19 Feb 2021 07:19:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD4ju-0005xH-FL
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 07:18:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lD4js-0007XX-EA
 for qemu-arm@nongnu.org; Fri, 19 Feb 2021 07:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613737107;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u7HT95kkWTHrCt+Iv/CYRhOhkzd75rYC+HIZYMaBL0w=;
 b=DYJjov/tPfEBp2cNlrCN54S+zi+m6FG7Z7Er9wO0Fv9xcqHTNDFSgJFC87fXKakp+QTBFq
 eWON8SzyoCnZi1O6Sk9K3IJ/axPeKWH29StH9PFSp/hjXFLraNd4mNylbd/wfFW1JCDoJt
 XFlq3fa4RE8PoJ4LGN4HAqlulWmQZ6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-F-2IZ9plOnqioXOAJ81nqg-1; Fri, 19 Feb 2021 07:18:26 -0500
X-MC-Unique: F-2IZ9plOnqioXOAJ81nqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5EA278030B7;
 Fri, 19 Feb 2021 12:18:23 +0000 (UTC)
Received: from redhat.com (ovpn-113-184.ams2.redhat.com [10.36.113.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2547560BE5;
 Fri, 19 Feb 2021 12:18:11 +0000 (UTC)
Date: Fri, 19 Feb 2021 12:18:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 0/7] hw/kvm: Exit gracefully when KVM is not supported
Message-ID: <YC+sgaN1EyKeyyOQ@redhat.com>
References: <20210219114428.1936109-1-philmd@redhat.com>
 <YC+oZWDs3PnWHPQo@redhat.com>
 <9540912b-1a81-1fd2-4710-2b81d5e69c5f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9540912b-1a81-1fd2-4710-2b81d5e69c5f@redhat.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
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
X-TUID: aeDxBrwzx8RJ

On Fri, Feb 19, 2021 at 01:15:25PM +0100, Philippe Mathieu-Daudé wrote:
> On 2/19/21 1:00 PM, Daniel P. Berrangé wrote:
> > On Fri, Feb 19, 2021 at 12:44:21PM +0100, Philippe Mathieu-Daudé wrote:
> >> Hi,
> >>
> >> This series aims to improve user experience by providing
> >> a better error message when the user tries to enable KVM
> >> on machines not supporting it.
> > 
> > Improved error message is good, but it is better if the mgmt apps knows
> > not to try this in the first place.
> 
> I am not sure this is the same problem. This series addresses
> users from the command line (without mgmt app).

Users of mgmt apps can launch the same problematic raspbi + KVM config
as people who  don't use a mgmt app.

> > IOW, I think we want "query-machines" to filter out machines
> > which are not available with the currently configured accelerator.
> > 
> > libvirt will probe separately with both TCG and KVM enabled, so if
> > query-machines can give the right answer in these cases, libvirt
> > will probably "just work" and not offer to even start such a VM.
> 
> Yes, agreed. There are other discussions about 'query-machines'
> and an eventual 'query-accels'. This series doesn't aim to fix
> the mgmt app problems.

I think this should be fixing query-machines right now. It shouldn't
be much harder than a single if (...) test in the code.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

