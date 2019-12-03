Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp1389025lfc;
        Tue, 3 Dec 2019 03:45:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqwHBJ1TAbUarr1Y3bKvYZawyBRRVB0oe8yV5bYUTp9Cz6mR7L2KjiJwmKnIW0aMTkOhETPb
X-Received: by 2002:a17:906:80b:: with SMTP id e11mr5517443ejd.278.1575373547201;
        Tue, 03 Dec 2019 03:45:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575373547; cv=none;
        d=google.com; s=arc-20160816;
        b=N0dGQrk5L7FtTE08bfMMpTpE6YpY/3IoDsN6x3tjJsMpSKV6d+nkMvjbT5TiWkj2CM
         MH2VoyM2cJOz1aVQvPq07/LSJl4oQ9blf86vuSBx7SktC2TJtUGtckd/ykMSLKBHHdsq
         Abo4gsUUNH5MmvvSFII0bnWldSpwqPn3tkgERBgzLazp9Iyek/B4cMLJOs7L/V89c7Eg
         fuekcemaxzSiVRpfRdyifHHYGCnNuxq/NcS6I9ZhUklG+9szg7U4rxzLpaW2QHMcx+2d
         aDVC8NQJ2zs1ROHmaCDy7C7xYuqAikCd5j2Dp8ApN8YGnaLEtBcb964Bsw9TYFq3vUky
         AnxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=nJ41p/tzxbTOC8IoXb8AO9fnQXerJ9pxq69DVS6la58=;
        b=R23Bn/CmWyOP1pRbsLkPtZSLVy4YZ4LjqcFVdM0CWzJxum8oYkskilnBDSjnCnoaO6
         xL5Z+N3uweiYQsPhmwg9sFxTS0iu6ZVHDtNw5A4yhrGcU/nPFqe2cz2rczjaXbpZLoWQ
         OO3lMzORRNCpXIsk5cvC2viZyveeqP7GVOJBgdIUwmX3h7eJYQSb6PVWlBI/MT01GNnP
         vSEg2Ersmxpvce9S92S9RD/XrYMyuxVDgouchAVREjirHzU0JaNtryUsEmWc99vwBlj8
         X17sOEYwaIZrKbD+exBUSWKwgPPhKF4ApCWLlC+aycft3TFR0n1yIKZRAv+/C+Pf7uzC
         2mGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=baWrfLAc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k4si2101861ejr.273.2019.12.03.03.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2019 03:45:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=baWrfLAc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ic6cj-0003Up-UX
	for alex.bennee@linaro.org; Tue, 03 Dec 2019 06:45:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37222)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ic6c5-0003Sw-DQ
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:45:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ic6c2-0001b4-5r
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:45:03 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52212
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ic6c1-0001Yv-Fa
 for qemu-arm@nongnu.org; Tue, 03 Dec 2019 06:45:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575373499;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJ41p/tzxbTOC8IoXb8AO9fnQXerJ9pxq69DVS6la58=;
 b=baWrfLAc2NjJW1koXZQmysEpaSRxA0w/NlSeJrpvAim546ExTZi4xdB+qGoIBGeDAr5DMc
 SuhWEw8KP3yrLAQw0qXCRxHOfwcbiD9msv4yUYk81BOFmxWEhdWeRfiWs+NlonCeT2IMZG
 Nv/B5aY4x6dNOxyN4e199jzjuAUGTTA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-3-0FEI4IavMOCpV58pIn4DAQ-1; Tue, 03 Dec 2019 06:44:58 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 15DCA800D41;
 Tue,  3 Dec 2019 11:44:57 +0000 (UTC)
Received: from gondolin (ovpn-116-214.ams2.redhat.com [10.36.116.214])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 20892608E2;
 Tue,  3 Dec 2019 11:44:51 +0000 (UTC)
Date: Tue, 3 Dec 2019 12:44:49 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Subject: Re: [PATCH v5 00/13] Multi-phase reset mechanism
Message-ID: <20191203124449.72158cb9.cohuck@redhat.com>
In-Reply-To: <20191018150630.31099-1-damien.hedde@greensocs.com>
References: <20191018150630.31099-1-damien.hedde@greensocs.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 0FEI4IavMOCpV58pIn4DAQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: peter.maydell@linaro.org, berrange@redhat.com, ehabkost@redhat.com,
 qemu-s390x@nongnu.org, mark.burton@greensocs.com, qemu-devel@nongnu.org,
 edgari@xilinx.com, qemu-arm@nongnu.org, pbonzini@redhat.com, philmd@redhat.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zLPGyskDMe3O

On Fri, 18 Oct 2019 17:06:17 +0200
Damien Hedde <damien.hedde@greensocs.com> wrote:

> Hi all,
> 
> The purpose of this series is to split the current reset procedure
> into multiple phases. This will help to solve some ordering
> difficulties we have during reset. Previous version can be found here:
> https://lists.gnu.org/archive/html/qemu-devel/2019-08/msg04359.html
> 
> This series adds resettable interface and transitions base Device and
> Bus classes (sysbus subclasses are ok too). It provides new reset
> functions but does not switch anymore the old functions
> (device_reset() and qdev/qbus_reset_all()) to resettable interface.
> These functions keep the exact same behavior as before.
> 
> The series also transition the main reset handlers registration which
> has no impact until devices and buses are transitioned.
> 
> I think this version is way better regarding the transition from the
> legacy to the resettable interface than the previous one.
> After this series, the plan is then to transition devices, buses and
> legacy reset call sites. Devices and buses have to be transitioned
> from mother class to daughter classes order but until the final
> (daughter) class is transitioned, old monolitic reset behavior will
> be kept for this class.

I have looked over this patchset a bit (with an eye to the s390 stuff).
Seems sane, although I currently don't have the resources to review
more in detail.

