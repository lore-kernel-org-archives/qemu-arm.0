Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp608960wrq;
        Wed, 11 Jul 2018 13:24:10 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeXUjwnTzHdzYOuArFr2bGdtFWSrCtQdPcHtZ3k9fxSTg8IhDXh8U4IbO3NV3i5FvNeUZlG
X-Received: by 2002:a0c:bf84:: with SMTP id s4-v6mr168862qvj.150.1531340650918;
        Wed, 11 Jul 2018 13:24:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531340650; cv=none;
        d=google.com; s=arc-20160816;
        b=jNM/gJ7cwBGo/514Z4j0aUT4GPWxVvp9hbtV+2GzuTQ3aDbslhvVoqiJMrk/YwyUAm
         XP3EXx8lZXrlU4Mqsi75JnKHKqX87wniIDCFqkZ7I5y8wFJJMjPeNrIjGlpAgkpqY+bp
         0wRqQ9ZvzDGpb9lIX6B6gecQdaWmEeyloaePlCTaG0iRcjD2hGmEJbDv+e14CmmHz6fU
         a2JKQ1VrKM15AyRpwfFgxXJ8i6nExKr8a4i0FT7bQtZn4mLmhm5ZIJP30RcKlHDB1Rpn
         aAsRQ9TG5gY1eZ4KfWJG/zrf08E9mbyNyv+CYb1HG9yHoR7NBfO1HJAz97uwODVIM6Sz
         8PmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=h7MC2q2/WWiY+ZRXI2wgmDjuBbL4R+DrdmHwsIEymfo=;
        b=ifNY66e383BUAkIWZfuu1eTzPmRGFIgvCjyuZqV7qGDI90yCjLJbG+ftRUEA6NgPZT
         V62KuwG448e/8IHAvteJfJ6kQAlZEAk4cijCR67Fcse7Hbg4HtLsnms2cbHaSW2HUrjM
         I7cUb7CcRDT9AWniTqMuvOQ9hmn1yX44wo2x4XU5JGP1z31QNoNC3S4iGSqb54rcKE7d
         9faTpCVSpSHI/15o5wFc9XW7d310+dTmYN76AmINjjKLtECsJEO315hFmB2Y7NaBOAGC
         Dqgk/yQ7HuH21MLEMt2CA6i3JQjyr8m32gNCa3yv//wM/RYREG5geMJpX6ntt4kUW9Dp
         yOcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r45-v6si5902364qtk.381.2018.07.11.13.24.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Jul 2018 13:24:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdLek-00076v-ET
	for alex.bennee@linaro.org; Wed, 11 Jul 2018 16:24:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdLeZ-00076c-Vv
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 16:24:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1fdLeU-0005vm-Ej
	for qemu-arm@nongnu.org; Wed, 11 Jul 2018 16:23:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39554)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1fdLeU-0005vY-9F; Wed, 11 Jul 2018 16:23:54 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 505FE3082A53;
	Wed, 11 Jul 2018 20:23:53 +0000 (UTC)
Received: from localhost (ovpn-116-12.gru2.redhat.com [10.97.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A1AE716E48;
	Wed, 11 Jul 2018 20:23:52 +0000 (UTC)
Date: Wed, 11 Jul 2018 17:23:51 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20180711202351.GA31657@localhost.localdomain>
References: <1531170180-21199-1-git-send-email-thuth@redhat.com>
	<ca91bffe-2bcf-78a2-02cd-8ae7cc48074c@redhat.com>
	<20180711183031.GM914@localhost.localdomain>
	<ce0b8bf9-b0e6-fe02-c685-5a6c3140a3ae@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce0b8bf9-b0e6-fe02-c685-5a6c3140a3ae@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Wed, 11 Jul 2018 20:23:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm283x: Fix crash with device_add
 bcm2837 on unsupported machines
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +XnowzHveQuh

On Wed, Jul 11, 2018 at 10:16:42PM +0200, Paolo Bonzini wrote:
> On 11/07/2018 20:30, Eduardo Habkost wrote:
> >> The theoretical behavior should be:
> > It's not clear below where you expect
> >   qdev_set_parent_bus(..., sysbus_get_default())
> > to be called (if it should be called at all).
> > 
> > I don't know where it should be called, but I'm absolutely sure
> > instance_init is not the right place.
> 
> I think instance_init is fine to call qdev_set_parent_bus on contained
> devices.  Why do you say it's not?

Because object_unref(object_new(...)) is not supposed to affect
QEMU global state at all.

-- 
Eduardo
