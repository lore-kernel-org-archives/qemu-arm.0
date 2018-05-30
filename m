Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp4386874wre;
        Tue, 29 May 2018 23:23:24 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKQju1UxZw9/fniqMUzsIL/T8yCPJsUrR69aDm/TkHlU7d/K7pHI/ls+AIiRQ49BqD3ezjy
X-Received: by 2002:a37:8146:: with SMTP id c67-v6mr1167429qkd.313.1527661403868;
        Tue, 29 May 2018 23:23:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527661403; cv=none;
        d=google.com; s=arc-20160816;
        b=L+F3aFEAmxxAR+fhn44ubRv4kTikJZ3W2H9tmg132yg5M4fGwIOEwuKHNt5mfi9sig
         aQHr/5mWUBcySiwC1d4ElxqfqrACCXVmbK5mC/w37GNPUI9AeihPLZ24mi+uqyl5eVrL
         8MQFzSF3Ztuv8Q39uMjSvXhRrHO4NS7YSl9KrYothEBkydYfRUVlHyjoLl1GwP0sCd0d
         tHH3s2LSuRO/xNGq6wrygjrWwvfj3r40omlPb17cVs9Cib2c4thTF5vHKmQkSK0JgxHI
         cuLTDKGvfbI9bvBNKYW1pa+Y9uoDgcIGMJa0AcOHaUknOZ14PMEidnPvYFR1SwJiW7dU
         mNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:arc-authentication-results;
        bh=8Imxb4a++T+3kzbfK2mmjDsPS9fdWkiKl/jy7vwWFEI=;
        b=uqzKdEZQMiT2vcCYgP51ilDDhN+3cR5jYP0qAGsS+LdpCurhfwIwpwwV/5iEOq2zj0
         44szCBpCNLqcAm5RaGO64E9NYo4GZRM4DUz4QFRpM72KNaWey3KSR+CKvNGFQJWp6DqI
         yxQRztPjvUR2PbZ9Mrxg5wOmislCkI6PRTgshlFqm1jXqw+xOngjAABljw9IFQ5ba2Du
         BLRQuezrHpZMHg2CxWCx91jbHeHt6KOjh4LGpeWKEQJmfsqiCftEjNTI0dHfKZ+mdge3
         ptYkudIMDfaFTbqtZXQzPKykFn2/ardYU4J53YKPsvxUw2knICQY/zwiOcIdTi1bpaDL
         en8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b7-v6si2161687qkf.298.2018.05.29.23.23.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 May 2018 23:23:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36443 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fNuW3-0005s0-FD
	for alex.bennee@linaro.org; Wed, 30 May 2018 02:23:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59007)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNuSM-0003U8-C6
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:19:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNuSJ-0001tS-68
	for qemu-devel@nongnu.org; Wed, 30 May 2018 02:19:34 -0400
Received: from mail-yb0-f193.google.com ([209.85.213.193]:42007)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fNuSI-0001sn-Vo; Wed, 30 May 2018 02:19:31 -0400
Received: by mail-yb0-f193.google.com with SMTP id d123-v6so5967080ybh.9;
	Tue, 29 May 2018 23:19:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=X/enLrvTvozeqa6gWdiJO+/5kI1bEHammfpcgV30Gvg=;
	b=VookSVL/JmJwEoPhd71CImOgIltsbwj+M+H8XYca4V9cvKr4BYIwXHM5jk06q1Zkhl
	rXa8NYmIv77U+WdUx3HjUTK6KJCWdhtieOOC4pRrHslT2fgIja9H3asBMW9yMBmavzGf
	9i5rViVKtb+s4EjJP2dq/4h6TnC7pwsTOrW0eeJFekwZceeKP9IB8AxhjoyYW8ec3VoV
	xZPu5fFd52AteWiucTLBOLFjS8NUy7S4n+pa8cdYWeKyGWiNtd0Wnxx6uvFeXRMuW9Jy
	v6u0/M9vLxYadwUmE+lwiPaZ4uPLHibIAkb26yAHDRBSpC2z1pRFfhqoCWm/yv5Sxcv3
	Zz6Q==
X-Gm-Message-State: ALKqPweWWxqMsy6qJalFmd//ropkz0Un0IvhCwoUtAxzeMaTLdjLlOhN
	2EanJUhObQPp74An9DrJbwAvyEXZPvFEqusdA9s=
X-Received: by 2002:a25:4cc3:: with SMTP id
	z186-v6mr739513yba.81.1527661170269; 
	Tue, 29 May 2018 23:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20180528232719.4721-1-f4bug@amsat.org>
	<20180528232719.4721-10-f4bug@amsat.org>
	<20180529134053.1ea9f46d.cohuck@redhat.com>
	<11289f38-6d0f-74c9-1719-83b2a3ed2d97@amsat.org>
	<20180530074026-mutt-send-email-mst@kernel.org>
	<CAAdtpL7sDOg2m+Ffsbc3f_Za6fr3in5ZfBJ2BAtGNJ1j4vbhJQ@mail.gmail.com>
In-Reply-To: <CAAdtpL7sDOg2m+Ffsbc3f_Za6fr3in5ZfBJ2BAtGNJ1j4vbhJQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Wed, 30 May 2018 03:19:19 -0300
Message-ID: <CAAdtpL6eW5=djFE-k7bHUR6s_b=wAmMuOLM8Djb_CYPf54L8CA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.193
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [PATCH v4 09/21] target: Do not include
 "exec/exec-all.h" if it is not necessary
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
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AC9EQvsT9Ag+

Le mer. 30 mai 2018 02:50, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> a
=C3=A9crit :

> On Wed, May 30, 2018 at 1:42 AM, Michael S. Tsirkin <mst@redhat.com>
> wrote:
> > On Wed, May 30, 2018 at 12:12:55AM -0300, Philippe Mathieu-Daud=C3=A9 w=
rote:
> >> Hi Cornelia,
> >>
> >> On 05/29/2018 08:40 AM, Cornelia Huck wrote:
> >> > On Mon, 28 May 2018 20:27:07 -0300
> >> > Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> wrote:
> >> >
> >> >> Code change produced with:
> >> >>     $ git grep '#include "exec/exec-all.h"' | \
> >> >>       cut -d: -f-1 | \
> >> >>       xargs egrep -L
> "(cpu_address_space_init|cpu_loop_|tlb_|tb_|GETPC|singlestep|TranslationB=
lock)"
> | \
> >> >
> >> > Hm, does this expression catch all files that need to include
> >> > exec-all.h? The resulting patch seems fine, though.
> >>
> >> No, not all :/
> >> I started with "(cpu_loop_|tlb_|tb_)" then kept brutebuilding until no
> >> more errors appear. In 2 more steps I added "cpu_address_space_init|"
> >> then "|GETPC|singlestep|TranslationBlock". Quick and dirty enough for =
my
> >> goal than trying to build a regex to explode function/struct names fro=
m
> >> headers. This is a clever way to do it for long term command reuse tak=
en
> >> from commit messages...
> >
> > Brutebuilding isn't a good way to find unused includes, some other head=
er
> > might pull in an include you are trying to remove for its own purposes.
> > If you want to try brutebuilding you must also verify that's
> > not the case - e.g. look at the dependency file generated.
>

I think I get it for headers, but here I'm only modifying .c source files.
I'll restrict the shell command to .c


> Hmm you mean the .d files in the build dir?
>
> i.e.
> $ find lm32-softmmu -name \*.d -exec fgrep -L exec-all.h {} \; | sed
> -e 's/.*-softmmu\/\(.*\)d$/\1c/'
> dump.c
> numa.c
> tcg/tcg-common.c
> tcg/optimize.c
> tcg/tcg-op-gvec.c
> tcg/tcg-op-vec.c
> accel/tcg/tcg-runtime-gvec.c
> accel/tcg/tcg-all.c
> accel/accel.c
> accel/stubs/whpx-stub.c
> accel/stubs/hvf-stub.c
> accel/stubs/kvm-stub.c
> accel/stubs/hax-stub.c
> hw/lm32/milkymist.c
> hw/lm32/lm32_boards.c
> hw/core/generic-loader.c
> ...
>
> Then look why each .c included it?
>
> >
> >> >>       xargs sed -i.bak '/#include "exec\/exec-all.h"/d'
> >> >>
> >> >> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
