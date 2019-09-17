Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp5331461wrp;
        Tue, 17 Sep 2019 07:40:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzmz46MuU1q11arQTqmLTOzI88+ZzOMUwZVCJOyW7srXjl43/SBnA8FY7Cmnygtsx67rryK
X-Received: by 2002:a37:9686:: with SMTP id y128mr3998256qkd.139.1568731217059;
        Tue, 17 Sep 2019 07:40:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568731217; cv=none;
        d=google.com; s=arc-20160816;
        b=sYEqA3WWuKa5jezaqP+yRJw/OpRje5wPD49w4HQMf42F3beGyYckhzZBkFpPBi1Mf9
         BtxsatgqAS+WR4u7c9vl7gBxJyFk0IBa199ztrPOnpeF/ygpo6WnekLXG6cCDFKv4Zry
         24NRLYZ5Jd2cjwygO3Ev16oUGUl5o+DMdLYrJNbUNvQnHhCpK72xfbvGQbYJHzgyf4zd
         0slipESHwaxKSqLkIHfcL0EMQt24PqLBcinG+/KyYWUNV9JJ/QakRCpHabuqUGPIX1+I
         aaBZCTCtaM8bWKnTBbYGNehC4BAjAkC6AassjAkk+tLQORXsX8QCaeMKIRnsVaxE71uz
         x6wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=vnyFtNc6VgoC/R6m1u7VL7h2xF7d9nEFwzJyvp7/Ekk=;
        b=G4gFPKoGhmDZCcDfLBp7Y7kzJy5cY7lRS9P77alE9uNoswQ5L4lLMqAsbjqCVXegjn
         d6lKaH6gFMDJFJ6hqyVg7mE/M8NAvOxRGcNsZwwsCB6QE65J4+xOr3qKq1R+uunrNVtS
         DcAxiYK4rys92vE/22OVcbXuehqMJfhUXIHnLRC0mqrz3b2ASOPmRmVBHfrXTEqNAfXF
         +jCOFC8yYiZLeupxcpM7rDkyZb0hJVyNvHM+K0Vd7Kmo9c4DhUMnGMwgTTB9n4SQsvX+
         HpdXJ9XqaWzaLgIsL6EmCIWN9lJ2QxBSHdJ/Ew5yiLHeSb64SKCtZEwnrMBb6v3ZfP73
         LroA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si1814243qth.84.2019.09.17.07.40.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2019 07:40:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAEeO-0006mB-9H
	for alex.bennee@linaro.org; Tue, 17 Sep 2019 10:40:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54485)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iAEeE-0006m1-7v
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 10:40:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iAEeC-00045x-Pg
 for qemu-arm@nongnu.org; Tue, 17 Sep 2019 10:40:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46064)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iAEeC-00045P-GP; Tue, 17 Sep 2019 10:40:04 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7A7CD1DA0;
 Tue, 17 Sep 2019 14:40:03 +0000 (UTC)
Received: from [10.3.116.234] (ovpn-116-234.phx2.redhat.com [10.3.116.234])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 26AEB60623;
 Tue, 17 Sep 2019 14:39:41 +0000 (UTC)
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <156871562997.196432.17776290406203122029.stgit@bahia.lan>
 <156871564329.196432.5930574495661947805.stgit@bahia.lan>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <19e78ae8-96dc-6154-6572-d7176057eeb7@redhat.com>
Date: Tue, 17 Sep 2019 09:39:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156871564329.196432.5930574495661947805.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 17 Sep 2019 14:40:03 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 02/17] block: Pass local error object pointer
 to error_append_hint()
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jeff Cody <codyprime@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Eric Farman <farman@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Yuval Shaia <yuval.shaia@oracle.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 John Snow <jsnow@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-s390x@nongnu.org,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: InswQYwaWCCm

On 9/17/19 5:20 AM, Greg Kurz wrote:
> Ensure that hints are added even if errp is &error_fatal or &error_abort.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  block/backup.c       |    7 +++++--
>  block/dirty-bitmap.c |    7 +++++--
>  block/file-posix.c   |   20 +++++++++++++-------
>  block/gluster.c      |   23 +++++++++++++++--------
>  block/qcow.c         |   10 ++++++----
>  block/qcow2.c        |    7 +++++--
>  block/vhdx-log.c     |    7 +++++--
>  block/vpc.c          |    7 +++++--
>  8 files changed, 59 insertions(+), 29 deletions(-)
> 
> diff --git a/block/backup.c b/block/backup.c
> index 763f0d7ff6db..d8c422a0e3bc 100644
> --- a/block/backup.c
> +++ b/block/backup.c
> @@ -602,11 +602,14 @@ static int64_t backup_calculate_cluster_size(BlockDriverState *target,
>                      BACKUP_CLUSTER_SIZE_DEFAULT);
>          return BACKUP_CLUSTER_SIZE_DEFAULT;
>      } else if (ret < 0 && !target->backing) {
> -        error_setg_errno(errp, -ret,
> +        Error *local_err = NULL;

Can we go with the shorter name 'err' instead of 'local_err'?  I know,
we aren't consistent (both styles appear throughout the tree), but the
shorter style is more appealing to me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
