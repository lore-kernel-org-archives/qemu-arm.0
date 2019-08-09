Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9173637wrv;
        Fri, 9 Aug 2019 06:03:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMHs39u9yBjv8MZJzi2adOOCCMvqEiWo6V2Rj4XLd3rNz1p7WU6RJnYpb8I9sx07De6+hv
X-Received: by 2002:ac8:35f7:: with SMTP id l52mr13332858qtb.299.1565355786041;
        Fri, 09 Aug 2019 06:03:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565355786; cv=none;
        d=google.com; s=arc-20160816;
        b=THjBOAEOa1MNABsgfI1lNUPBDQk1cIjO1UTKwOhD6j3LkqFJouIAJ13e+ngpcYC3Xo
         bzSak7tFrt/GkVuW/Ba/xRu/nacc8rt8Q2UQ7odRzV17Kawvp3/ytixr92T4tu2yQUjf
         ArANrHlqeDhxkRHfVZtY/sKSqq8fHiTCFo2c4wT/8RB6xTBNXzRZ3njznlXC+TAXXjaw
         PGJMn5BSEXlO0bb6etxkKkLVAOQDzlyQ5SnSyvo56HoC+koq3oCDJwN4zYCyrinbBb+D
         rIHWRU4nLIk5nSKRokr8lsV1g9R3cmGGN+NZrA6324qXoyvcTHps9/UYkI12sVSRST1a
         sCiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:subject
         :mime-version:message-id:date:user-agent:references:in-reply-to:to
         :from;
        bh=o+lL9O2PNKz0vyapYoA0x3WXq0cHi+Oa6EulYQ8zM4I=;
        b=U+4gxV5sCrvoV57+iXWLmBA/qoAdUDC4qW2X6MSV3hx+a52Ip+lrr8SE/S0z6oK1t4
         96fqhPO8D4dUEjnj/GNGlv4fpfZ4lXO47Ko7SrKYt/+F9tQvyItia7EMlaRliq0/+E2h
         uhKmqZUr9yWqBaNTVBzEOXbbOyv2Zb35G48l+AOrliSUfwFDWLAE/ILIuWJwbs77O0uQ
         nEhtDbMMeP0qohJmvELG31jx2+40KquX+kbMFoSFJVRBZL17biz0P6ceXtk+GdFg6pkj
         z21tiDRGFsgaOEmPNrzBKiUr2vxch2X5N/UPBp93y1O87J5h9dJNK3Hfa1vLlM7iLc8N
         97lQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i22si57984081qta.152.2019.08.09.06.03.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 06:03:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59287 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hw4Xx-000527-G9
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 09:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55323)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <quintela@redhat.com>) id 1hw4Xp-000516-Mv
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 09:02:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1hw4Xo-00027F-6x
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 09:02:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47824)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>)
 id 1hw4Xn-00026h-KS; Fri, 09 Aug 2019 09:02:55 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A82E13003C55;
 Fri,  9 Aug 2019 13:02:54 +0000 (UTC)
Received: from redhat.com (ovpn-116-49.ams2.redhat.com [10.36.116.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 14C1960610;
 Fri,  9 Aug 2019 13:02:39 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <69a53af1-7007-7b80-8e6c-62ebabba8a62@greensocs.com> (Damien
 Hedde's message of "Fri, 9 Aug 2019 12:46:12 +0200")
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
 <20190729145654.14644-8-damien.hedde@greensocs.com>
 <CAFEAcA-W0SaaGbUnGZ0b61ngxKY8R9xjwGXeN+=MaUi4bMDgNg@mail.gmail.com>
 <20190808154219.GK2852@work-vm>
 <CAFEAcA8L2YVMCu3Gb+eQTDfCpgVwA_WwVPrqPLV2iQ9rZ4HuTA@mail.gmail.com>
 <f400248f-7a3b-83e9-3355-77de359e3f43@greensocs.com>
 <CAFEAcA-YjLA25wPBgWOB_c2fV2o7C8n=1-uUVe6xgiP=j5+Fgw@mail.gmail.com>
 <69a53af1-7007-7b80-8e6c-62ebabba8a62@greensocs.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
Date: Fri, 09 Aug 2019 15:02:35 +0200
Message-ID: <87ef1u3310.fsf@trasno.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 09 Aug 2019 13:02:54 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 07/33] automatically add vmstate for reset
 support in devices
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
Reply-To: quintela@redhat.com
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Collin Walling <walling@linux.ibm.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, Hannes Reinecke <hare@suse.com>,
 Qemu-block <qemu-block@nongnu.org>, David Hildenbrand <david@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "Daniel P. Berrange" <berrange@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Mark Burton <mark.burton@greensocs.com>, qemu-ppc <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lmgrgF2AgXIJ

Damien Hedde <damien.hedde@greensocs.com> wrote:
> On 8/9/19 12:32 PM, Peter Maydell wrote:
>> On Fri, 9 Aug 2019 at 11:29, Damien Hedde <damien.hedde@greensocs.com> wrote:
>>>
>>> One way to keep the feature without copy-pasting vmsd would be to add
>>> a new vmstate_register with an additional argument to pass the base
>>> class vmsd section and handle the whole thing there.
>> 
>> If we have a vmstate section which contains no actual data,
>> only subsections with 'needed' functions, is it migration
>> compatible with previous versions in the same way that
>> tacking a subsection onto an existing function is?
>
> I don't think so because of the naming schema. I had to forge the
> correct name for the reset subsection for every device.
> Each subsection must be named after its parent section plus '/something'.

That bit is easy.  You jsut named it: "parent_name/subsection_name", no?

Later, Juan.
