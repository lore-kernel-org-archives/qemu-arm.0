Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp315229wrt;
        Wed, 16 Jan 2019 00:33:47 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4mnRiKesJjGraz+qoJpTJtDulXjM+JCx3HAQ5lojKDS6pIANb5SjGZoNn+ZPcD0j8gsWDj
X-Received: by 2002:a5d:470b:: with SMTP id y11mr6445339wrq.16.1547627627057;
        Wed, 16 Jan 2019 00:33:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547627627; cv=none;
        d=google.com; s=arc-20160816;
        b=q8bT9uCnMp7iYPxLns0WluKv4gug2iufjhkGzgQHRWXFfjhPIkW4uF77Ae4Mo4HZOX
         K/HlENovMc+cKlyDMdadWcn6fdXuysdAUHTcy/PN5MVqNSZmfvQMZMBs00KDm2SWBZlX
         98DHzxN4e+f7ymeYOE/tPjTbZNKTVI6lT3yj9fbfgwS8MvknhgWAKlrU/QnzteDIpvDa
         0Z60kSFkSFc+IXJ9mrl4lgeMuZeIHU/2qZzAOmf2wlgnGYqgHIPx5ja74LelfenMZidK
         ygT/k3Qmrqo0aP4LZnxRLBq6Foi3V929SBe8iwNT8XH3vMf5EEcM4aeFOdWVNi6CMqq+
         WnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=Rvk6Z+LCyp82ZmKM3mY0FEkODkgQlBv1qKVfl9J9/+o=;
        b=uFcJfp1Bhyu6TYIJ241S13WrtICMWupY+u0Lgy885/7HuD/ZHd9TA5vEEFIqlptnkV
         Lv6uUVVJS4RCra4f80DsgESZfFI0CqD8FKzcBYJSoz+SG6IVrwagL7tN0obSGxVu0vVu
         5LCTb0rvljp4ksaN0gNECn2kJAKdq7vJFz/1QvaV8yJXXmnzDTTPiwEly15MowjYVxeM
         2hKgzr0HIoigb8e+hpSgncrTbd3aDVydaM03h0bhdldck8PBDdxsSGMuay5Q79tYOVwO
         MG0Q6JIcFuoKVjXTNTL++7YeGaDw7+M+K6QqdNjb+YwSASK/f4EVpJJmFZdGJ/51r7mN
         KV3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l11si14253355wrt.171.2019.01.16.00.33.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Jan 2019 00:33:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:48843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gjgdu-0006DR-2J
	for alex.bennee@linaro.org; Wed, 16 Jan 2019 03:33:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gjgdY-0006Aj-Cn
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 03:33:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gjgdR-0000UL-8S
	for qemu-arm@nongnu.org; Wed, 16 Jan 2019 03:33:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41834)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gjgdQ-0000QY-IE; Wed, 16 Jan 2019 03:33:16 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1260DC05CDEA;
	Wed, 16 Jan 2019 08:33:15 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-32.ams2.redhat.com
	[10.36.116.32])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 405A219C7E;
	Wed, 16 Jan 2019 08:33:08 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id CB82611385E4; Wed, 16 Jan 2019 09:33:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-4-philmd@redhat.com>
	<875zuqjea7.fsf@dusky.pond.sub.org>
	<403ad2e4-3282-051c-1ff5-8a3a23899293@redhat.com>
	<be75e72a-9f54-c9b5-4a1f-e87e28df8ba5@redhat.com>
Date: Wed, 16 Jan 2019 09:33:06 +0100
In-Reply-To: <be75e72a-9f54-c9b5-4a1f-e87e28df8ba5@redhat.com> (Paolo
	Bonzini's message of "Tue, 15 Jan 2019 19:02:33 +0100")
Message-ID: <87sgxtatod.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 16 Jan 2019 08:33:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 03/15] hw/ssi: Remove SSIBus
 from "qemu/typedefs.h"
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
	Alistair Francis <alistair@alistair23.me>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, Laszlo Ersek <lersek@redhat.com>, "Michael S.
	Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iEalPaW2QrDu

Paolo Bonzini <pbonzini@redhat.com> writes:

> On 15/01/19 13:56, Thomas Huth wrote:
>> Yes, agreed, removing things from typedefs.h just to add lots of
>> #includes in other files is not really the best idea. I also dropped
>> this patch in v2 of my current PULL request because of this reason.
>> Phil, I suggest to simply drop this patch. What we maybe could do is to
>> split up typedefs.h per subsystem, so that we additionally have a
>> hw/arm/typedefs.h, hw/ppc/typedefs.h etc. in the end, then the
>> target-specific typedefs would not clutter the common qemu/typedefs.h
>> file anymore.
>
> I disagree.  The *inclusions* of target-specific typedefs.h would then
> clutter something.
>
> For the (important, mind) case of circular includes, allowing struct in
> prototypes pretty much solves the issues, and a subsystem-specific
> typedefs.h is another solution according to maintainer's discretion.
>
> In this case, however, keeping subsystems self-contained is a good
> reason to apply the patch.  Having SSIBus in typedefs.h means that the
> next SSI type has a higher chance of being added to typedefs.h even if
> it's not necessary.

typedefs.h churn appars to be a non-problem:

    $ git-log --oneline --since 'one year ago' include/qemu/typedefs.h 
    a98c370c46 typedefs: (Re-)sort entries alphabetically
    aec90730fb numa: Match struct to typedef name
    7cfda775e5 move ObjectClass to typedefs.h
    ea134caa08 typedefs: add QJSON
    201376cb9e typedefs: Remove PcGuestInfo from qemu/typedefs.h
    9f5c734d59 Typedef the subtypes of QObject in qemu/typedefs.h, too
    e70372fcaf lockable: add QemuLockable

> Sometimes we need to take patches that seem unnecessary in order to keep
> the codebase tidy.  Think of the churn that was the introduction of
> hw/SUBSYSTEM.  It was painful and it added all the complexity to the
> Makefiles in order to support recursive Makefile.objs in our
> not-that-recursive makefiles.  However, it made MAINTAINERS usable and
> now, a few years later, few of us would probably be happy to go back to
> the flat hw/ directory.

What problem exactly are we trying to solve here?

To the best of my knowledge, typedefs.h has been working just fine for
us, and I can't see why it shouldn't continue to work just fine.
