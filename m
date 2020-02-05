Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6550310lfp;
        Wed, 5 Feb 2020 03:23:24 -0800 (PST)
X-Google-Smtp-Source: APXvYqxvfBCF7iT+OwgDQ2i/Mhn7r8fCMEbDr7Q8omS1vNBoDNePw9nrZKdE819zLjWSrnzWEhIl
X-Received: by 2002:ac8:7646:: with SMTP id i6mr31483100qtr.91.1580901804592;
        Wed, 05 Feb 2020 03:23:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580901804; cv=none;
        d=google.com; s=arc-20160816;
        b=X9DeJdzMOs5rI9EUE2Ud4i+2k6O7UV72o66m2RpajOtBL/gZ4/loTHu38PZfe6lPSs
         z1TNjBgx25Nxn0ytFFxfMD+T/96NJS6dDwn2jSJ2kxMfW6ObzXq/0PfGmUdMjnb5QTd4
         BLqOBpkgdL/skmjGOrA8/8jJiH243hRvmqmlr4EKhob1QqJwVXJ1fMyW88vFvBX+VD6q
         9iNRztnv0j0T7vgcrMftqWXQO5tfcJhs5nKktaSkF8jqJ9yBsXqXF+6RBtQX3ERqYLhJ
         Ir9uh4cmi+jwjjbgslzc+LUQeS32NAl8e2w8P6185fp1pU+6L6+jLpOzE0I7QxDdVSjs
         XKMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=qn9rF9dSPqm6LOVxrk2w/vPdD989u4q6JmlK1nGPmgg=;
        b=iRrespcfp4sXykeva1NcRZXH9cMY0D5eDEBp7rnsKiXymY181H24ycyCqAKVe9mt/l
         ogHPq+wAsoy9TURmA/5dtaIa/932gvsCR95PdDSkB+Z+L2a55sCIhVU9kyLxjX9ryuuG
         AjpPSkMknDmy0GY3Y++n4VDnESCNnbopJrl0JvN7Zp3+SOYzcLfBpUkMoaDVeHC/fpJk
         tLF5/KRG5rZAWVTw5D5oLF1T/FR4MsVmMI/c8M6kl0lWlj6pIOrW4tr8NJvTiOEs2bHj
         x4Tdi5Ct7u1JuEkqysBmIqOxjC6r2D0WL8D/mMe3L0aeFKhDtdrDne7fcVPNOroUFXQj
         w90g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PsUFiWFJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si15260033qtg.254.2020.02.05.03.23.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Feb 2020 03:23:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=PsUFiWFJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1izImC-0001RY-0P
	for alex.bennee@linaro.org; Wed, 05 Feb 2020 06:23:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54185)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1izIlp-0000p5-Vs
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:23:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1izIlo-00061e-S6
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:23:01 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21524
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1izIlo-0005x2-N2
 for qemu-arm@nongnu.org; Wed, 05 Feb 2020 06:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580901780;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qn9rF9dSPqm6LOVxrk2w/vPdD989u4q6JmlK1nGPmgg=;
 b=PsUFiWFJ35jI7v5zqFvy5PEgLz8CUYkAN6j0n4lzZ/jfZOeBWzgL7Ong50HeZ+oYEOJWky
 Xv8hB1+Th6aZRUmqmbr9zIXQky8tqOj2+wnnaG6LlqnmVgOQ7sq2YpQznQDQ0UOVQUJj2k
 sXYvw2mu+GjIFWvrG6p70fINY9dMiqQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-2AZlh6gxP46LvqYDPEWruA-1; Wed, 05 Feb 2020 06:22:56 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2DEC802B67;
 Wed,  5 Feb 2020 11:22:54 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A19E8E9FE;
 Wed,  5 Feb 2020 11:22:49 +0000 (UTC)
Date: Wed, 5 Feb 2020 12:22:47 +0100
From: Andrew Jones <drjones@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Subject: Re: [RFC PATCH v2 0/2] Support NMI Injection
Message-ID: <20200205112247.khzzxlwzkf2odo2k@kamzik.brq.redhat.com>
References: <20200205031227.24355-1-gshan@redhat.com>
 <CAFEAcA_3A5fxo4gedJxsc64jus-rjzaLgzcipguOMwkSD4PNbQ@mail.gmail.com>
 <728d4be5-72f7-7742-98a3-c80c4c930f62@redhat.com>
MIME-Version: 1.0
In-Reply-To: <728d4be5-72f7-7742-98a3-c80c4c930f62@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 2AZlh6gxP46LvqYDPEWruA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jthierry@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Marc Zyngier <maz@kernel.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Shan Gavin <shan.gavin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5w11+O77RaxF

On Wed, Feb 05, 2020 at 10:10:30PM +1100, Gavin Shan wrote:
> On 2/5/20 9:57 PM, Peter Maydell wrote:
> > On Wed, 5 Feb 2020 at 03:12, Gavin Shan <gshan@redhat.com> wrote:
> > >=20
> > > This intends to support HMP/QMP "nmi" command. When it's issued, the
> > > SError interrupt is injected to the guest. The guest is expected to
> > > crash with it. The behavior is similar to x86: NMI is injected to
> > > guest as error indication. The guest possiblly crashes and reboots
> > > with the injected NMI. Note that the functionality is currently
> > > supported on "virt" machine and {"host", "max"} CPU models only.
> >=20
> > Hi; you forgot to cc qemu-devel; can you repost, please, so that the
> > tools like patchew that monitor the mailing list pick it up?
> >=20
> > thanks
> > -- PMM
> >=20
>=20
> Sure, The series was resent with a "RESEND" tag.
>

Another problem with the series is that patches 1/2 and 2/2 are not
in-reply-to 0/2, so the threading of the series is broken. I see
you've already reposted. I'm not sure patchew will be happy without
the threading corrected though.

Thanks,
drew=20

