Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4161635wrt;
        Tue, 15 Jan 2019 04:58:13 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6AOEAU6mJbXm4GGIaI8m0wjY7o1APxIzzDTSK5/PPn2HKM0ajcD4Yv6ukSVnYZIEXRzUeh
X-Received: by 2002:adf:9d4c:: with SMTP id o12mr2887199wre.94.1547557093321;
        Tue, 15 Jan 2019 04:58:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547557093; cv=none;
        d=google.com; s=arc-20160816;
        b=HhLJMVbv6M3L6ZrniFBKqBNbKZRcbMADTaTbN8DDC6KIscyuK3hpb7Yi2pgRfnY06v
         pib/HPHrac0kZx4kd+amJRmNOQxxuFQrzPIJHDV9urnA3nvgkhFj4qEfPkbKU8OaNGBK
         mzTY16/i6zZBgSk6Lb3xtAikq7yoOI8bhEO6BcEyUVU8PcOqnjJZqYugdV52CZyDiE5F
         ZEuQQOfabnPmRnmMgXSkSeYpWwIHd3XgKB/TyeE3cHUyVHbz0B56u7C4jnKif1e2zxv3
         tQZQlroeaol5VJJcjtdwxFmLGxs2TpkwlUNgWtiquwKFC2ddh9P+ExTUJcdUVf7ujWgx
         wF3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=faJNuKLFisgZP11F2ehw8965ZT9GT7jCJNNU+qRwXwU=;
        b=aaeAWi+S2YrTR5biBbYOIRiUhA8kJm1fBFs5Xofy6qNPAV+2K3INcYDh5vCxUMYdGL
         ZhbM1NBYB8rgaep1uKirwiaIQiQjjrlBNFaEzM4WbpGGNTOd6ODXFcx15lWENI9lW2tX
         baWW0NB+nLkQziD8aSZTp50+xuiGS4C8zg4rRBWTLKrGSpuNNR7lNFot/iDPePyVfXoj
         R3Y6SbkODQVzYdTSsIBEWkzQvcyMfOKHggK7ABJITnP7Ra/PdgL2curMZIWJePklM358
         SFVT/qIxe6rddbuMJnfX/nqRwpjVXrR5LV0btUbduloiZewFw4mFZlUyudmMJq6/xJAF
         rncQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i64si20980357wmd.12.2019.01.15.04.58.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Jan 2019 04:58:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38977 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gjOIG-0004Uh-DS
	for alex.bennee@linaro.org; Tue, 15 Jan 2019 07:58:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gjOHA-0004CU-PE
	for qemu-devel@nongnu.org; Tue, 15 Jan 2019 07:57:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gjOH8-0003kv-Ql
	for qemu-devel@nongnu.org; Tue, 15 Jan 2019 07:57:04 -0500
Received: from mx1.redhat.com ([209.132.183.28]:55268)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>) id 1gjOH7-0003ge-7m
	for qemu-devel@nongnu.org; Tue, 15 Jan 2019 07:57:02 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA5F68667A;
	Tue, 15 Jan 2019 12:56:54 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-182.ams2.redhat.com [10.36.116.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1171419C7C;
	Tue, 15 Jan 2019 12:56:40 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-4-philmd@redhat.com>
	<875zuqjea7.fsf@dusky.pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <403ad2e4-3282-051c-1ff5-8a3a23899293@redhat.com>
Date: Tue, 15 Jan 2019 13:56:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <875zuqjea7.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Tue, 15 Jan 2019 12:56:54 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Greg Kurz <groug@kaod.org>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NMKc9XIgjKZ4

On 2019-01-15 13:28, Markus Armbruster wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:
>=20
>> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>>
>> There are only three files requiring this typedef, let them
>> include "hw/ssi/ssi.h" directly to simplify "qemu/typedefs.h".
>>
>> To clean "qemu/typedefs.h", move the forward declaration
>> to "hw/ssi/ssi.h".
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> ---
>>  hw/arm/strongarm.h      | 1 +
>>  include/hw/arm/pxa.h    | 1 +
>>  include/hw/ssi/pl022.h  | 1 +
>>  include/hw/ssi/ssi.h    | 1 +
>>  include/qemu/typedefs.h | 1 -
>>  5 files changed, 4 insertions(+), 1 deletion(-)
>=20
> When typedefs.h changes, we recompile the world, but it pretty much onl=
y
> ever changes when new typedefs are added.  Thus, *keeping* a typedef
> there is therefore pretty cheap.
>=20
> Nevertheless, we shouldn't keep typedefs there without a real reason.
> Being able to move one away without having to add any new #include
> directives is a strong sign for "no real reason".  I like patches doing
> that.
>=20
> What I don't like is adding #include directives just so you can move
> typedefs out of typedefs.h: it slows down the build.  Granted, the four
> added by this patch are a drop in the bucket.  The point I'm trying to
> make is typedefs.h's purpose: it's for avoiding #include directives.
> Circular ones in particular, but others, too.

Yes, agreed, removing things from typedefs.h just to add lots of
#includes in other files is not really the best idea. I also dropped
this patch in v2 of my current PULL request because of this reason.
Phil, I suggest to simply drop this patch. What we maybe could do is to
split up typedefs.h per subsystem, so that we additionally have a
hw/arm/typedefs.h, hw/ppc/typedefs.h etc. in the end, then the
target-specific typedefs would not clutter the common qemu/typedefs.h
file anymore.

 Thomas

