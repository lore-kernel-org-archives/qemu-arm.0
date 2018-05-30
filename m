Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4363192wre;
        Tue, 29 May 2018 22:51:05 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLAXhYLe0dSUNWJeyY81hZIwQzZ1mY4HqSl6JsDPrQPjAlSinGqNn7vEnqXmvY1Y63GmYQv
X-Received: by 2002:ac8:3441:: with SMTP id v1-v6mr1216700qtb.315.1527659465109;
        Tue, 29 May 2018 22:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527659465; cv=none;
        d=google.com; s=arc-20160816;
        b=jkew5LmRP1vUT0tokyZXMqZtJR8VV0DIFOhzWkrRcEMUE5ZI1g08VjVG6Oe0LrxWZL
         ecPZhtxzeeidApczp357aHMvcr0AuxVhwC3yeyACI6+xg7hxIb5HzOgdpPvMsOegXhI/
         Z4kKpGQok2KJoBqZ1WbUHKVwJm8pwNQZ8+o8okrsMAf9QwFFZRFGrmeszkW6/J6bPLIE
         O4LWVy8llLY+2SJqgIAqqPMEUR4EVMWZdr25287tvf9E6DgWcqmOaqedyCiv12HKt+rd
         vyZWRmmdbr8wi4waCftHFP6/BtuwpBhuZsLGjvsDaUPW9pFp9a1YPXevC4o/kzMVImGp
         extA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=Fmijq3sHX8cFGu9GZQS8Lzy2sjkv5Zx7SN9T/OHMke0=;
        b=oluRjWE9gjjPc5VMujgNxlXnHu6Utnv7/pkud2Ef5vGzw1F3il/2QaVLqMqiaLzfmw
         oNxS//Jrzp8vs9R7Iy6W/pUX62aNyL7yEaiDa2IAXdUGCIbheBGLvPA+rif4r7xwMS//
         cmF4b23kg1SOXwhmQVmdOGMLMVC2t2QtmyR4dSgefuf8a/9xilejht+OBEkFx9KLSN5F
         NJPpzpCI22HNs7PLnKHObh8zsb3iiFE0z7p5tKEck8BV2pc1bLD7c/y8u9dp7mZV7CHy
         Gj0kMbUdsgImRexyL7WLRgI+mWBuxMrEohq+5VlY8QxMW2Se7UERTWJjvf2xE+u955KQ
         d3PQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qQCeG1Ia;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d25-v6si6081866qto.282.2018.05.29.22.51.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 22:51:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qQCeG1Ia;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36329 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNu0l-0004gv-Tn
	for alex.bennee@linaro.org; Wed, 30 May 2018 01:51:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNu0W-0004eq-1o
	for qemu-arm@nongnu.org; Wed, 30 May 2018 01:50:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNu0V-0007Ug-5T
	for qemu-arm@nongnu.org; Wed, 30 May 2018 01:50:48 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:42379)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNu0Q-0007Ty-Ok; Wed, 30 May 2018 01:50:42 -0400
Received: by mail-yb0-x244.google.com with SMTP id d123-v6so5947841ybh.9;
	Tue, 29 May 2018 22:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=Fmijq3sHX8cFGu9GZQS8Lzy2sjkv5Zx7SN9T/OHMke0=;
	b=qQCeG1IaiYB62mWn3A5aIGL5JvoDJVGMBShTUdtWBxYIvxLfAGFQ+WAHSlynG22PXU
	QFWM8d9sZzYTSFOkeJd0D+Cu+F1ZRz/OgBowYvjhUhvialQXIejtCS06Q65dSUuub/jk
	GlKjFChMX/s3nYdaZmlZ2+VrJsMwItfe7jZAT9sG4fbiaU7yar5qdLPrlEKTaBVyF3J7
	8z+yOadf52tN7TZuvPlabZwmlTwUEF0SNUaVMXx4o9b4cKIJK/PWIGLCM0HSbmwZWO5A
	hH+4seGJDB3wRMQNu6+ncej7Lc6FdNt4YCs/jovpW9QWMKjPEXfT68d8rMdujgbwn4im
	n8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=Fmijq3sHX8cFGu9GZQS8Lzy2sjkv5Zx7SN9T/OHMke0=;
	b=Eo/TUyYLp+0vlmNst5+DCGBbZDofasipioME5Ddcxpu7GjKydbdQ4XB9BU9jJ+VHmI
	D5Wr1Jwq92py2XdkL40vSLBaGfJD97JW5aEbHpidpvFOIUbRYZOoHhIwlJl35oLtFoCs
	fiS9eqFtpNwEOffZUL68kn/l3EFN7PoyYu4cPydVjbBZUol/1YB0tYXZZZbEDnWw1m9B
	e/2RJKRaGXfMgQoibRPnvyEaTYOtveM8StOzZEnNe6jSGPVcwYTsnEvdgzQBTek78YO7
	bSPUK4PAv8UXMEjQ2+A9VQSN6W07Xa7lW6L1eK/QDKWpz9JI+k3Jr4hxbTBbVZuGuPpa
	9u/g==
X-Gm-Message-State: APt69E2KJi5zwBULkCZtgE0byvBkOplw2TsGyyRwt2MVkk14eFsu4/1e
	MD7YuOv+UPLsoxVly7xhLSZpo1xoYpeYge4MBWE=
X-Received: by 2002:a25:d1c5:: with SMTP id
	i188-v6mr738478ybg.114.1527659441791; 
	Tue, 29 May 2018 22:50:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:3d7:0:0:0:0:0 with HTTP;
	Tue, 29 May 2018 22:50:41 -0700 (PDT)
In-Reply-To: <20180530074026-mutt-send-email-mst@kernel.org>
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
	<20180529134053.1ea9f46d.cohuck@redhat.com>
	<11289f38-6d0f-74c9-1719-83b2a3ed2d97@amsat.org>
	<20180530074026-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 30 May 2018 02:50:41 -0300
X-Google-Sender-Auth: MTQLDqEjj_pSZ-qkUhcUVkcgSOw
Message-ID: <CAAdtpL7sDOg2m+Ffsbc3f_Za6fr3in5ZfBJ2BAtGNJ1j4vbhJQ@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Subject: Re: [Qemu-arm] [PATCH v4 09/21] target: Do not include
 "exec/exec-all.h" if it is not necessary
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
	Eduardo Habkost <ehabkost@redhat.com>,
	"open list:S390" <qemu-s390x@nongnu.org>,
	David Hildenbrand <david@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	Anthony Green <green@moxielogic.com>, Cornelia Huck <cohuck@redhat.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Alexander Graf <agraf@suse.de>, Laurent Vivier <laurent@vivier.eu>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	"open list:PowerPC" <qemu-ppc@nongnu.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 76zaejdqcbIR

On Wed, May 30, 2018 at 1:42 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
> On Wed, May 30, 2018 at 12:12:55AM -0300, Philippe Mathieu-Daud=C3=A9 wro=
te:
>> Hi Cornelia,
>>
>> On 05/29/2018 08:40 AM, Cornelia Huck wrote:
>> > On Mon, 28 May 2018 20:27:07 -0300
>> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
>> >
>> >> Code change produced with:
>> >>     $ git grep '#include "exec/exec-all.h"' | \
>> >>       cut -d: -f-1 | \
>> >>       xargs egrep -L "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GETP=
C|singlestep|TranslationBlock)" | \
>> >
>> > Hm, does this expression catch all files that need to include
>> > exec-all.h? The resulting patch seems fine, though.
>>
>> No, not all :/
>> I started with "(cpu_loop_|tlb_|tb_)" then kept brutebuilding until no
>> more errors appear. In 2 more steps I added "cpu_address_space_init|"
>> then "|GETPC|singlestep|TranslationBlock". Quick and dirty enough for my
>> goal than trying to build a regex to explode function/struct names from
>> headers. This is a clever way to do it for long term command reuse taken
>> from commit messages...
>
> Brutebuilding isn't a good way to find unused includes, some other header
> might pull in an include you are trying to remove for its own purposes.
> If you want to try brutebuilding you must also verify that's
> not the case - e.g. look at the dependency file generated.

Hmm you mean the .d files in the build dir?

i.e.
$ find lm32-softmmu -name \*.d -exec fgrep -L exec-all.h {} \; | sed
-e 's/.*-softmmu\/\(.*\)d$/\1c/'
dump.c
numa.c
tcg/tcg-common.c
tcg/optimize.c
tcg/tcg-op-gvec.c
tcg/tcg-op-vec.c
accel/tcg/tcg-runtime-gvec.c
accel/tcg/tcg-all.c
accel/accel.c
accel/stubs/whpx-stub.c
accel/stubs/hvf-stub.c
accel/stubs/kvm-stub.c
accel/stubs/hax-stub.c
hw/lm32/milkymist.c
hw/lm32/lm32_boards.c
hw/core/generic-loader.c
...

Then look why each .c included it?

>
>> >>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
>> >>
>> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
