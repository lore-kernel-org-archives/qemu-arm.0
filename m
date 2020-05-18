Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3028188lfb;
        Mon, 18 May 2020 06:17:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw69Jp11PS0TudRiVeN+bf2NuCi12IvqkfSza0NGfyDjYGWdY1qQGrvBgL9wCVX9W3KBtRy
X-Received: by 2002:a05:6214:108b:: with SMTP id o11mr15086459qvr.60.1589807858122;
        Mon, 18 May 2020 06:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589807858; cv=none;
        d=google.com; s=arc-20160816;
        b=ZFx093BOwJRm0ivy42hdjvHDR+i7y5Bf6mjBszJjmavi9zHa8hN3GQCCPy1jiSbpKz
         MeJbDTL3d1EMSBLiTzOI+YxoDkKgVWAVcDHhovbZKWuyZXiKueTkCzYjOY+4VAPlU2YL
         hZkJrg9E0+i97pBrAKNie3FcTF6wOz40gvpKZN48ZunJWcUQ3l6bEhX9DeDhQ34F64EV
         sMlPQW5ZEpKArAIwRUwouWesiYS0faZdHCrXY5FWHod7W1Yd076xHlbkwQ+Qu/UQKSSD
         Nlq8rawTrx2WdyQmFfHctusqDLbPDMQet6Vs4XTuzq3h97t5HSAu8sUT8vcz6kC+Y2go
         sFiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=hO5s4pwgSKIz4wc7eUJFUZw07FYxYL3A4Zvi1+EiJ8I=;
        b=tqlrNtY7SOnhAWrmxU0shxdoFhy2qYz+y4D/j+OCNGDtCntObgNEvpvcm/lZbyNf7W
         jxPh9VuBWS5fw1HLQ7eKVvnBoH37GGaPRUNyWCW7Ikgr9jKmgrkZBzD/V1I3M18375+m
         WNF4YgiRq1ZCIzZVx3Gs/X3auMPl1F76nmviJR5F2Klc227VxnVIpIYN8/vySvMsnA2D
         ZPa00HzgQYOeB3aBdx8BaC1grEP5/VM5m5KaX4P/anhq+hFrR6eYCohMjRHK+NxMKilO
         0k7jZaGz9Nn2314C9mchp0HdCPt4RcW7JI+ZQ2Mx3TXIJL7kUFUPyaAX/7gC223XfADR
         9bSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dTihhRxF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t85si562536qka.114.2020.05.18.06.17.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 May 2020 06:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dTihhRxF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jafeD-00086x-Hs
	for alex.bennee@linaro.org; Mon, 18 May 2020 09:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jafe5-00082Y-19
 for qemu-arm@nongnu.org; Mon, 18 May 2020 09:17:29 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60835
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jafe4-0005pD-3P
 for qemu-arm@nongnu.org; Mon, 18 May 2020 09:17:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589807847;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hO5s4pwgSKIz4wc7eUJFUZw07FYxYL3A4Zvi1+EiJ8I=;
 b=dTihhRxFfV7gNr0Ag10rAx7DipYryPgH2WB2cFBZ63EGTzLnskC1FbU7hLUPXGZY/RGBNs
 ++56zywG+nH3WEYYdFC5LloQq44wnZCKfq0qbQTvrPF+11mbvDaVtjUtNuIxKN7BVwmA8Q
 7dlwRCZA1dmuuw+/jBjBd+W8zgpPOyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-HRl-J9wqPuicx608h3qMiw-1; Mon, 18 May 2020 09:17:23 -0400
X-MC-Unique: HRl-J9wqPuicx608h3qMiw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F518872FE0;
 Mon, 18 May 2020 13:17:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-32.ams2.redhat.com
 [10.36.112.32])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 37AA22E161;
 Mon, 18 May 2020 13:17:12 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id BC6FF11358BC; Mon, 18 May 2020 15:17:10 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 0/3] various: Remove unnecessary casts
References: <20200512070020.22782-1-f4bug@amsat.org>
 <871rnlsps6.fsf@dusky.pond.sub.org>
 <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com>
Date: Mon, 18 May 2020 15:17:10 +0200
In-Reply-To: <8791b385-8493-f81d-5ee3-cca5b8559c27@redhat.com> (Paolo
 Bonzini's message of "Mon, 18 May 2020 14:40:19 +0200")
Message-ID: <87imgt9ycp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=207.211.31.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/18 00:53:04
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Paul Durrant <paul@xen.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Joel Stanley <joel@jms.id.au>, Anthony Perard <anthony.perard@citrix.com>,
 xen-devel@lists.xenproject.org, David Gibson <david@gibson.dropbear.id.au>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Peter Chubb <peter.chubb@nicta.com.au>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. =?utf-8?Q?Berrang=C3=A9?=" <berrange@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, Cornelia Huck <cohuck@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-ppc@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3f5wvAOwqqv4

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 15/05/20 07:58, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>=20
>>> Remove unnecessary casts using coccinelle scripts.
>>>
>>> The CPU()/OBJECT() patches don't introduce logical change,
>>> The DEVICE() one removes various OBJECT_CHECK() calls.
>> Queued, thanks!
>>=20
>> Managing expecations: I'm not a QOM maintainer, I don't want to become
>> one, and I don't normally queue QOM patches :)
>>=20
>
> I want to be again a QOM maintainer, but it's not the best time for me
> to be one.  So thanks for picking up my slack.

You're welcome :)

