Received: by 10.223.159.82 with SMTP id f18csp582058wrg;
        Thu, 30 Nov 2017 04:37:28 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY53kixwPamI/VWmL3E0iTqFgGXohpIwhLYt7psa9n+YMqSsYW/u/BToJnuHoNpm74gmHSL
X-Received: by 10.129.181.72 with SMTP id c8mr1382754ywk.202.1512045447804;
        Thu, 30 Nov 2017 04:37:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512045447; cv=none;
        d=google.com; s=arc-20160816;
        b=pFp+LoWioAbyEbgsXGTsiAS3NvM36J3kIshy7Ik8rTfo9xm2xIEoXjNpKjoWGsSF6L
         yMgL8WmZKTZfhvG4gmpvyO/DabVIkD+1mzkwYl/dP3wEF6UNK+o2YbPgWsSdQxpJVBPy
         xabn13KqJHIHiQvt/fKiUoWmwzpVF7eUyX5jklc88+ZKp8tJWZCGB6HxauRiLl/7jxw1
         gt7OBAZk8q18b6PjZpz+nFeZbGTzL2UFQYshfD1anOAvP9tsib+3w6r3Z6xBbiXfvk01
         27sFjlpCKOMEtFcfKth2SA9mC78vJ/Kz89OrWmp5C0dkJAWuZBhr3ttndPJ+piNGpMVz
         juZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=wNpWrb7nPirmFWiWsJM3SuCsBIfaLmHOLz1nAblN6QA=;
        b=OEpYZ8vYK/XHFdrahNubMY3EPrFjaHqPDzhDjdR3xB5lv1vaUg2O1nGLXlN2ptLvk0
         k4mj1zmPr5LyZJerWgfy1QFVkVeNKaQummAykr2LQuhwwbf0DVdGxryzkcBgd4P5UTXt
         pPQqex2yXtK5d0MA8MDr9f8oWe8xI1KE6eXKjpk3NkKIPRYvYTIK1Ocr36HRvn8jLqNx
         2byfRTNj4qmVj9wR4Q7kdd/nkDjgoTM0wxDaMyOjHSSSUP5m89Ik0qUHkKDtiY55a0Lm
         MN4Xo1kW6ORD/7rDv03h1m4LKP1hht7iCOG2LGVsNCPcJ/gPMmkoWF3hooiC2lpYs++v
         UOsw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c1si831825ywk.92.2017.11.30.04.37.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 30 Nov 2017 04:37:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eKO5n-0007cF-3N
	for alex.bennee@linaro.org; Thu, 30 Nov 2017 07:37:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKO5d-0007c7-Nw
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:37:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1eKO5a-00016N-IQ
	for qemu-arm@nongnu.org; Thu, 30 Nov 2017 07:37:17 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1eKO5a-00015l-9K; Thu, 30 Nov 2017 07:37:14 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 38A634DB11;
	Thu, 30 Nov 2017 12:37:13 +0000 (UTC)
Received: from [10.36.116.158] (ovpn-116-158.ams2.redhat.com [10.36.116.158])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5940F6031E;
	Thu, 30 Nov 2017 12:37:11 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1512031988-32490-1-git-send-email-thuth@redhat.com>
	<1512031988-32490-4-git-send-email-thuth@redhat.com>
	<CAFEAcA-LBOm=kHja3QJqOw-TT3GF9-i+wJfXdL-FU5NKimknzQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e56ccc1b-17fd-fc44-cc11-d63de2952c79@redhat.com>
Date: Thu, 30 Nov 2017 13:37:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-LBOm=kHja3QJqOw-TT3GF9-i+wJfXdL-FU5NKimknzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 30 Nov 2017 12:37:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.12 3/7]
 tests/boot-serial-test: Add support for the mcf5208evb board
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
Cc: Anthony Green <green@moxielogic.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TSf5YGQPIemt

On 30.11.2017 13:14, Peter Maydell wrote:
> On 30 November 2017 at 08:53, Thomas Huth <thuth@redhat.com> wrote:
>> We can output a character quite easily here with some few lines of
>> assembly that we provide as a mini-kernel for this board.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  tests/boot-serial-test.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/tests/boot-serial-test.c b/tests/boot-serial-test.c
>> index d997269..dd3828c 100644
>> --- a/tests/boot-serial-test.c
>> +++ b/tests/boot-serial-test.c
>> @@ -16,6 +16,14 @@
>>  #include "qemu/osdep.h"
>>  #include "libqtest.h"
>>
>> +static const uint8_t kernel_mcf5208[] =3D {
>> +    0x41, 0xf9, 0xfc, 0x06, 0x00, 0x00,     /* lea 0xfc060000,%a0 */
>> +    0x10, 0x3c, 0x00, 0x54,                 /* move.b #'T',%d0 */
>> +    0x11, 0x7c, 0x00, 0x04, 0x00, 0x08,     /* move.b #4,8(%a0)     E=
nable TX */
>> +    0x11, 0x40, 0x00, 0x0c,                 /* move.b %d0,12(%a0)   P=
rint 'T' */
>> +    0x60, 0xfa                              /* bra.s  loop */
>> +};
>=20
> This approach doesn't seem to be scalable to me -- are we
> really going to have 50 or more fragments of hand-coded hex in
> this file to cover the various board models?

No, since this only works for certain few boards with these criteria:

1) There must be a way to load such small blobs either with -kernel or
-bios. Many boards only support loading kernels in the ELF format, and
we certainly don't want to encode the hex-dump of such a kernel here.
Or some boards / CPUs also support -bios, but the entry point must be at
the end of a large image, so that also does not make sense to include
them here.

2) The UART must be usable with some few lines of assembly. That's also
not always the case.

So no, this is really not meant to scale to all boards, it's just meant
to get at least some few more test coverage, especially while we're not
having other test mechanisms in place yet. (e.g. how long are we talking
about reviving tests/tcg/ again already? ... some attempts have been
made to make it compilable again, but non of the patch series has been
included yet so far)

> I'd much rather see us have a framework for being able
> to build test blobs from source using a cross compiler
> setup (and docker or similar so anybody can rebuild
> the test blobs). That will be much easier to maintain
> and easier to extend to having tests that test other
> parts of the board or other aspects of TCG emulation.

I agree that this idea is way more flexible and could cover many more
boards, but there are also things that need to be solved first:
Not everybody has docker / cross-compilers installed or can use them, so
we likely need a set of pre-build binary images somewhere. But we
certainly don't want to include megabytes of blobs in the git repository
... so this would need to go into an external repository instead. Then
you likely can not include this in "make check" so easily anymore
(unless you force everybody to check out the external repository with
the git-submodule.sh script - but I really dislike this idea) ...

So yes, we should have better test coverage for almost all machines if
possible, but I don't see that this is happening soon or could be really
tightly integrated into "make check". I.e. the boot-serial tester could
fill at least parts of this gap, I think.

 Thomas
