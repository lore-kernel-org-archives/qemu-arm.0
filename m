Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1538276lfi;
        Fri, 3 Apr 2020 22:56:29 -0700 (PDT)
X-Google-Smtp-Source: APiQypLWfiuonxBwzfReJ3CkQlvMKP+qkqz1li2uEZDbapUSDoI+5ohPPxmhC0jO2jbw/yih0u9O
X-Received: by 2002:a37:70c6:: with SMTP id l189mr11819341qkc.158.1585979788856;
        Fri, 03 Apr 2020 22:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585979788; cv=none;
        d=google.com; s=arc-20160816;
        b=xP4lSBdi5bbQxe4hsq7lCpyAVP3cfNeju0C0TwpvNyiOekQjb3GcucX7C2LQRc4bTR
         q+yJ3gePuBhp/ZGhaWuKUHqzdbSqfIRlp3RphpJkuB+PQlg2C2RitF/0lQr1+qUvumse
         5X1NGMfN2Xnu9ye3G405x7UvVqMVDTqK01wp0f2dawilPVZAVD246v3U9E2ZBtJItr9s
         SBixhQdtseDOWoUZ1lkOvLZDgH6d+DVqmUZvdi4XHKuq9Bhwvp7u7eeLywF6yeeOGILG
         Jw20wRUemk2pPJiRMuNCvQ+bH/gEsOoq41kw2ReRgbwvdMXPOU1LOkKW6v3NUrV6Gpne
         mvtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:in-reply-to:date:references
         :subject:to:from:dkim-signature;
        bh=tbu+yhQJvJC1lvCLLfqKnvLXIL2FpNXjo1kKksMp9Os=;
        b=SDDqzZOrI8UsM1ZCC0IxxOiBVBGmUHDOC5wvdO3RmjKekLrM1NNfMRKDlUyPiJuC2n
         0FBPpzPi22xVQPv17SKcSwfdrVnZ2r13OCwRu0zZhjWkh7B4PsqPLspd8/0rl+nXyEp5
         OS3DnIOIyi8yH3zYQMqp4VtAfk5oLAIRo58xDTaQ07bUJdMM48UKf9IrE9uQ2azI68un
         oanLJgyFLjjeccP3fsKtFL6Lxz8ZFTvBsIv2z1pVh5Ljs/rh2CgkLMdGsdrBMJWW01jO
         XXc+OvD7usfNxUXSMTnfmIJiloxDhjb+gz5PMlASGqWfupmP08AlODciatwcRn2cf0Ys
         Ot1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hdd84qoi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9si6848530qka.174.2020.04.03.22.56.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 22:56:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=hdd84qoi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKbn9-0002ea-Vk
	for alex.bennee@linaro.org; Sat, 04 Apr 2020 01:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59112)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jKbmv-0002dr-4u
 for qemu-arm@nongnu.org; Sat, 04 Apr 2020 01:56:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jKbmt-0002HV-Az
 for qemu-arm@nongnu.org; Sat, 04 Apr 2020 01:56:12 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:33598
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jKbmt-0002H7-4u
 for qemu-arm@nongnu.org; Sat, 04 Apr 2020 01:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585979770;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tbu+yhQJvJC1lvCLLfqKnvLXIL2FpNXjo1kKksMp9Os=;
 b=hdd84qoifPYM1xCKcn36sk8ByCy+8qPVROmF1A+AmUFKlKIlRnn8N/0/neecGzi1KDkxf0
 EU5kL7jEaCVY062tAvY4QFk4tMpn5HmBnuaFk3kXNEUF9eVK3yKOxDYuk8GXM5X8WatiRU
 M2znzJJz7HJVTQVQZBnUs+FOp51eeBg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-WHxLg8XsMc6whceK-6e6Bg-1; Sat, 04 Apr 2020 01:56:06 -0400
X-MC-Unique: WHxLg8XsMc6whceK-6e6Bg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7EC113FB;
 Sat,  4 Apr 2020 05:56:02 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-152.ams2.redhat.com
 [10.36.112.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A20610002A8;
 Sat,  4 Apr 2020 05:55:55 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0C4841138610; Sat,  4 Apr 2020 07:55:54 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.0 00/12] hw: Add missing error-propagation code
References: <20200325191830.16553-1-f4bug@amsat.org>
 <87r1x8vet0.fsf@dusky.pond.sub.org>
 <dbee4e3d-afba-827d-4950-2ac9b99419ab@redhat.com>
Date: Sat, 04 Apr 2020 07:55:54 +0200
In-Reply-To: <dbee4e3d-afba-827d-4950-2ac9b99419ab@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 3 Apr 2020 19:53:01
 +0200")
Message-ID: <87mu7r23rp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-ppc@nongnu.org,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>, Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eqMmjylzJ6pC

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> Hi Markus, Peter.
>
> On 3/31/20 3:23 PM, Markus Armbruster wrote:
>> Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:
>>
>>> This series is inspired of Peter fix:
>>> "hw/arm/xlnx-zynqmp.c: fix some error-handling code"
>>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg691636.html
>>>
>>> Add a cocci script to fix the other places.
>>>
>>> Based-on: <20200324134947.15384-1-peter.maydell@linaro.org>
>>
>> I skimmed the code patches [PATCH 02-12/12], and they look like bug
>> fixes.  Other reviewers raised a few issues.
>>
>> I also skimmed the Coccinelle script [PATCH 01].  Peter pointed out a
>> few things it apparently missed (e.g. in review of PATCH 06+11).
>> Moreover, the bug pattern applies beyond object_property_set() &
>> friends.  Perhaps the script can be generalized.  No reason to hold
>> fixes.  We may want to add suitable notes to the scipt, though.
>>
>> Can you address the reviews in a v2, so we can get the fixes into -rc1,
>> due today?
>
> Status on this series (sorry I didn't update earlier).
>
> I addressed Peter's comments, improved/simplified/documented the cocci
> script (which I split in smaller ones).
>
> Peter suggested other functions can be checked too, not only the
> "^object_property_set_.*" matches. Indeed, more patches added. Some
> are big.
>
> Another suggestion is replace in init() 'NULL' Error* final argument
> by &error_abort. This can be another series on top.
> However I noticed we can reduce the error_propagate() generated calls
> in many places, when both init()/realize() exist and the property set
> is not dependent of parent operation, by moving these calls from
> realize() to init(). Another cocci script. But to make sense it has to
> be run previous the "add missing error_propagate" one.
>
> While writing the cocci patches, I had 3 different Coccinelle failures.
> Failures not due to a spatch bug, but timeout because C source hard to
> process. Indeed the C source code was dubious, could get some
> simplification rewrite. Then spatch could transform them. More patches
> in the middle.
>
> Now I'm at 47 patches, the reviewed patches at the end of the series.
> Too much for RC2. Since I don't think these are critical bugs, but
> improvements, are you OK to postpone this series to 5.1?

Punting bug fixes to a later release is always kind of sad, but getting
that many patches reviewed properly in time for -rc2 feels hopeless, and
the bugs old and unthreatending on first glance.

> If you think a patch deserves to be in 5.0, point me at it and I can
> send it ASAP with comments addressed. Else I'll post my series as
> -for-5.1 soon.

I'm okay with punting the whole series to 5.1.

We have quite some Error work pending for 5.1.  Beware of conflicts.

In particular, I now plan to make object_property_set() & friends return
a useful value.  This should make your patches a bit smaller.

