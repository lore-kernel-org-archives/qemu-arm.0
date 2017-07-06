Received: by 10.25.44.15 with SMTP id s15csp1698619lfs;
        Thu, 6 Jul 2017 00:30:57 -0700 (PDT)
X-Received: by 10.237.36.220 with SMTP id u28mr55720628qtc.154.1499326256902;
        Thu, 06 Jul 2017 00:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499326256; cv=none;
        d=google.com; s=arc-20160816;
        b=U2WAyUQygCgoTQmCyP1O3GPjrZUzMzhTMYRTzz6Q1RRIJGgd4ZHJIJxQBBDMTo14El
         S07lhL+BWLCp7BE4Sf6EwXmtb6g7hQAVor9PPWZTLYK2LYdX/44lSOEQ3pFcZz1FinOD
         vIPtVtwDqmaEHFpovoiznZrVLYm3UnI5RKDkGyS1cWNSZ42Ow1rP2a+lL48cbAirG1FW
         65xAfSN5mhb+ffxF2BBPtDwl1GkmHh8E36fQwnysHP03cEePozJ/IiK7gTRYRzWDJQZb
         qcFvtYKKJW8PqiuJaa7A/sHuacNnVp3+MH6a/e40NU5uuafhFoLLESuOTWFYZbBF415F
         tqIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=9Pt3/D/jv9AJOBD7vP4HykOhSixkRpmzsgUFnTf8ooc=;
        b=xMDJaezNEwTt51wOXRzjgZbbFWiJFPyX9ODfRBCwJqCV3z4hLp1AVFj4uRh/6tP2MB
         ASLJT4pEM+FxLQmh2ntEB27PUdH4eHWqxRoLrZeDiL5LT1pcR7qmrMdl03UcIWiyZvRG
         lLXzHtpaaYPyN6LoFse+kFQFPg/7oRJnV0/CUqWASc3CeS9ZQjYTECehW+vYC5XGZsS4
         s7v3hcVUjOcCLheNY1dNSH9bXve2+la69K8Qzys+AnqS2Jw1bVXWP3Mqkvg76lgmbDfe
         k6CcG6acsGpeGNAXsTJPwJZ8mC4Lb8jsSen9dix8YtHNNV/LTfGWtsoXA3VwSdlb5qSU
         ZnSw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b45si1242617qtc.320.2017.07.06.00.30.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 00:30:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49664 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dT1FW-000123-86
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 03:30:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dT1Ek-0000P2-OT
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 03:30:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <famz@redhat.com>) id 1dT1Eg-000077-6E
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 03:30:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52201)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <famz@redhat.com>)
	id 1dT1Eg-00006K-0S; Thu, 06 Jul 2017 03:30:02 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AE1187F7A9;
	Thu,  6 Jul 2017 07:30:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com AE1187F7A9
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=famz@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com AE1187F7A9
Received: from localhost (ovpn-12-51.pek2.redhat.com [10.72.12.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B7C6760BEB;
	Thu,  6 Jul 2017 07:29:57 +0000 (UTC)
Date: Thu, 6 Jul 2017 15:29:55 +0800
From: Fam Zheng <famz@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20170706072955.GB13548@lemon.lan>
References: <1498734863-164338-1-git-send-email-imammedo@redhat.com>
	<149932540890.339.7607386893555558786@239b34022e6d>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <149932540890.339.7607386893555558786@239b34022e6d>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 06 Jul 2017 07:30:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] qom: enforce readonly nature of
 link's check callback
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: mst@redhat.com, alistair.francis@xilinx.com, pbonzini@redhat.com,
	qemu-arm@nongnu.org, imammedo@redhat.com, afaerber@suse.de
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cv6c9LX5Vfyx

On Thu, 07/06 00:16, no-reply@patchew.org wrote:
> /var/tmp/patchew-tester-tmp-s55a7o8g/src/hw/virtio/virtio-crypto.c: In =
function =E2=80=98virtio_crypto_instance_init=E2=80=99:
> /var/tmp/patchew-tester-tmp-s55a7o8g/src/hw/virtio/virtio-crypto.c:918:=
30: error: passing argument 5 of =E2=80=98object_property_add_link=E2=80=99=
 from incompatible pointer type [-Werror=3Dincompatible-pointer-types]
>                               virtio_crypto_check_cryptodev_is_used,
>                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from /var/tmp/patchew-tester-tmp-s55a7o8g/src/include/=
hw/hw.h:10:0,
>                  from /var/tmp/patchew-tester-tmp-s55a7o8g/src/include/=
hw/qdev.h:4,
>                  from /var/tmp/patchew-tester-tmp-s55a7o8g/src/hw/virti=
o/virtio-crypto.c:15:
> /var/tmp/patchew-tester-tmp-s55a7o8g/src/include/qom/object.h:1353:6: n=
ote: expected =E2=80=98void (*)(const Object *, const char *, Object *, E=
rror **) {aka void (*)(const struct Object *, const char *, struct Object=
 *, struct Error **)}=E2=80=99 but argument is of type =E2=80=98void (*)(=
Object *, const char *, Object *, Error **) {aka void (*)(struct Object *=
, const char *, struct Object *, struct Error **)}=E2=80=99
>  void object_property_add_link(Object *obj, const char *name,
>       ^~~~~~~~~~~~~~~~~~~~~~~~

No worry, I've taken care of it when including this patch in my series.

Fam
