Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1577991wrt;
        Thu, 17 Jan 2019 01:02:42 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5fPajpl9Nh7nBRLblso0HsQIKoySqrLTdsT9YJI0jdgvXNAbxLj+PofuS7y9XY3FsVi4/H
X-Received: by 2002:a1c:ab87:: with SMTP id u129mr10864794wme.104.1547715762121;
        Thu, 17 Jan 2019 01:02:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547715762; cv=none;
        d=google.com; s=arc-20160816;
        b=BmMvl1Kzpy8fSBOA8D0JPz+ONgkCT9ir5xueTG06Wbb32Hvo23EUQBbVevkcHmVceh
         J4OCIO7fi8N7fa8XiS/2wAlKZTwZafag/S8rAua3Mt0v79QiLNPts9iSGM9NX/JVXl8f
         j5RDen8r2yBCXGIxymTndZUOtGVOX3tywpSzZx8sszBmw3vuLsjnVPamCq/5xTnT1nXQ
         5dJih1I8VHkIlC2IyUF21Fv28tyJJFydLxp+kKHPk9lpHLWGSQwtkxP/nb19VFObKWlp
         d2r6UMRBYo75f4SRzf8jguhQjJiWMf6Y7OudpGMg/npqAs9dZt7a4G17wkmFwqJb0Chc
         m0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :message-id:in-reply-to:date:references:to:from;
        bh=XnKZrJjReBKbty0tH9r5R+6u/1dAP24b8FhdoYNBb9E=;
        b=h09jgKVzefNo7YOe9uadaHmfjYASKBH7bBOruRsm+YzRtUWdhtcEGsgY4OuNgCYQlT
         jfbjRqV9el0q4cYpT5eyythdTJfCMx6sJ6IbqOjW6Rmwy6La9yjtYFHeQ1D96JMJnDGw
         ntCMP7rXlnRUznLS9JUSJdooJmM/HCCp/qkC2bygmtcCfQHPMVlbfxt682odV5FOrxH5
         mBoN8cvuSxihwysgM1yOpnMPZ5rbaewsucfT85aez1AaKbgniwmFy+4KPaBO3F7W3vKp
         aj+iFZn9eMoYssmKW/oholY/VnxYNcAjpvDIj+9i1aW2yMKCHLxrqX7X2BLgDdICMTRe
         /9Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x22si24283755wmi.101.2019.01.17.01.02.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Jan 2019 01:02:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39067 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gk3ZR-00022P-2Q
	for alex.bennee@linaro.org; Thu, 17 Jan 2019 04:02:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gk3Ym-0001qw-RR
	for qemu-devel@nongnu.org; Thu, 17 Jan 2019 04:02:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gk3Yg-0002MG-OT
	for qemu-devel@nongnu.org; Thu, 17 Jan 2019 04:02:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44746)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gk3Y3-0001Y9-2p; Thu, 17 Jan 2019 04:01:15 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3A49036809;
	Thu, 17 Jan 2019 09:01:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-138.ams2.redhat.com
	[10.36.116.138])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6E5A6063E;
	Thu, 17 Jan 2019 09:01:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 03F531138648; Thu, 17 Jan 2019 10:01:05 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-4-philmd@redhat.com>
	<875zuqjea7.fsf@dusky.pond.sub.org>
	<403ad2e4-3282-051c-1ff5-8a3a23899293@redhat.com>
	<be75e72a-9f54-c9b5-4a1f-e87e28df8ba5@redhat.com>
	<87sgxtatod.fsf@dusky.pond.sub.org>
	<4b24723e-5a27-f25f-76c1-f2f4e94757ba@redhat.com>
	<20190116113455.dyl6uctl4dpaqh6v@sirius.home.kraxel.org>
	<ad34caf3-5f1f-dffc-4aed-60bb90ba2e5f@redhat.com>
	<20190116091801-mutt-send-email-mst@kernel.org>
Date: Thu, 17 Jan 2019 10:01:04 +0100
In-Reply-To: <20190116091801-mutt-send-email-mst@kernel.org> (Michael
	S. Tsirkin's message of "Wed, 16 Jan 2019 09:48:52 -0500")
Message-ID: <87imyn64kv.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Thu, 17 Jan 2019 09:01:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 03/15] hw/ssi: Remove SSIBus from
 "qemu/typedefs.h"
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>, qemu-block@nongnu.org,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Philippe =?utf-8?Q?M?= =?utf-8?Q?athieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EwQO/2WLZznS

"Michael S. Tsirkin" <mst@redhat.com> writes:

> On Wed, Jan 16, 2019 at 12:49:07PM +0100, Paolo Bonzini wrote:
>> On 16/01/19 12:34, Gerd Hoffmann wrote:
>> >   Hi,
>> > 
>> >> typedefs.h is useful to avoid rebuilding the world too often if a type
>> >> is used many times as a pointer, but rarely as a struct and rarely has
>> >> functions called on its instances.
>> > 
>> > Related:  Can also be used to keep struct content private.  struct
>> > QemuConsole for example is private to ui/console.c, but pointers to
>> > QemuConsole are passed around alot in ui/* and hw/display/* code.
>> 
>> True, though as we switch more and more from pointers to embedded
>> structs that does not work that much anymore.  Another way to do that is
>> to split the header in include/path/to/foo.h and path/to/foo_internal.h.
>> 
>> Paolo
>
> Not sure this will help since no tool checks structure isn't
> actually used even though it's in internal.
>
> If you want to go overboard it's solvable of course, e.g.
> something like this will work:
>
>
> E.g. in virtio.h
>
> #ifndef VIRTIO_PRIVATE
> #define VIRTIO_PRIVATE(f) (VIRTIO_PIVATE_##f)
> #endif
>
> struct VirtioPrivate {
> 	int VIRTIO_PRIVATE(bar);
> };
>
> and in virtio.c:
>
> #define VIRTIO_PRIVATE(f) (f)
> #include <virtio.h>

I don't like such games at all.

Instead, I'd recommend to keep internal headers out of include/, and
rely on review / grep to catch, correct and prevent inappropriate uses.
