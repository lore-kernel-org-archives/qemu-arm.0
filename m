Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp919250wrg;
        Wed, 22 May 2019 14:06:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4P9j79yIuppdUBWcmvzWfszBMmdy5XuYJVs+XLWeTVw2jkkRLnRcTwTbCXanX8Hsbry5Y
X-Received: by 2002:a50:8e1e:: with SMTP id 30mr92648548edw.283.1558559181685;
        Wed, 22 May 2019 14:06:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558559181; cv=none;
        d=google.com; s=arc-20160816;
        b=QpYV0htzW2XEunIWpkgc0EYeAAIWlI0a0p1XYh8zc6moj6kLxLoR+9C1AeYkFKUnvL
         Te7+tgX3HagkwePg2wfCCZn2ZpVjLMKjaz13s7XJx7Q5CBJoLLLwLy6tBj3VrkVplrRO
         SnJoNiCtEl/TmPkkPMCxi8AjV3KJlRu43aoXRbr05kiBq3TpgS2o025pPx8101KNYAxU
         ttlk/KieGO9NLRlAgRgdebQFgNGzncAXY9L3AxJnb30lNtt7w/GW6AFHxxmpWlNTRS0i
         TH795GpzYZQ6u3WwpT1K1mFmMotCz9UkqDx5isr+kVqWRs7qXfx9lxb98q+Jxgx3ZNq0
         mTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=/e9aUwU6w3oAvUz1gDba3q2vhQlqfj6ocGqHZbM5rDY=;
        b=yIU4a9t+bySLAV6A8lO+F138E4afBJpA92B4WqxhUjZKIBS1f0WZ67JI907rgksqmm
         KIaSVFpCgJyiyy+TLdlmeFk3SBN2H4CAJJ2T+OnIeMCjnuIg+V6XsEoxPfHWmXgtfXD6
         VJkHpXbH+ztFE0BKRKRaWI/l12rPgNzcw5TLSyKSrYVySBHxJikat4tbOGVrqnp4+eTD
         Yn0IZUXBK0LVeZvwmDbc3Co2w8RkrZv2gAz+dVGGiKeYEIt+ixbZQ6L8ai6GFZh32Q/e
         UnC6lR66lM4qClQ8QeajcpaNl6ZKCqrTMytrpzUzuwBwrXmmDLtaD+CWqGSCFgRXUiFy
         in1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l34si6624209edb.201.2019.05.22.14.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 May 2019 14:06:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:51386 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hTYRI-0004qA-LA
	for alex.bennee@linaro.org; Wed, 22 May 2019 17:06:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33140)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTYQy-00049u-Hz
	for qemu-arm@nongnu.org; Wed, 22 May 2019 17:06:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hTYEK-0003p4-Qj
	for qemu-arm@nongnu.org; Wed, 22 May 2019 16:52:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46008)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1hTYEK-0003hk-LU; Wed, 22 May 2019 16:52:56 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6FA18C05B1CD;
	Wed, 22 May 2019 20:52:41 +0000 (UTC)
Received: from localhost (ovpn-116-14.gru2.redhat.com [10.97.116.14])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7A2241001E67;
	Wed, 22 May 2019 20:52:36 +0000 (UTC)
Date: Wed, 22 May 2019 17:52:34 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Message-ID: <20190522205234.GY10764@habkost.net>
References: <20190312234541.2887-1-philmd@redhat.com>
	<20190312234541.2887-3-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190312234541.2887-3-philmd@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Wed, 22 May 2019 20:52:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 2/2] Boot Linux Console Test:
 add a test for the Raspberry Pi 2
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: D6LzT/RIAFAT

On Wed, Mar 13, 2019 at 12:45:41AM +0100, Philippe Mathieu-Daud=E9 wrote:
> From: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>
>=20
> Similar to the x86_64/pc test, it boots a Linux kernel on a raspi2
> board and verify the serial is working.
>=20
> If ARM is a target being built, "make check-acceptance" will
> automatically include this test by the use of the "arch:arm" tags.
>=20
> Alternatively, this test can be run using:
>=20
>     $ avocado run -t arch:arm tests/acceptance
>     $ avocado run -t machine:raspi2 tests/acceptance
>=20
> Signed-off-by: Philippe Mathieu-Daud=E9 <f4bug@amsat.org>

We're getting timeouts on travis-ci:
https://travis-ci.org/ehabkost/qemu/jobs/535468057#L3289

I don't know yet if the guest is hanging, or if we just need to
increase the timeout.  I could reproduce the timeout locally,
too.

--=20
Eduardo
