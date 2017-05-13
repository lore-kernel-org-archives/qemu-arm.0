Received: by 10.25.0.6 with SMTP id 6csp492533lfa;
        Fri, 12 May 2017 18:17:25 -0700 (PDT)
X-Received: by 10.237.42.122 with SMTP id k55mr7112249qtf.237.1494638245750;
        Fri, 12 May 2017 18:17:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494638245; cv=none;
        d=google.com; s=arc-20160816;
        b=MMWMwtnsb3A50C5pDqlNCAO+640+R0yAV+izU61nZmZ68G6LMOuXtTu6WoCmo8qNQU
         mkyxeF+BQ3JrpZ0Q43K+hy1O7Y+xs1Rmj7zNHEC4a9D2E9v4io+BXx3fQslHwQcKq3hL
         Daft58LwuU6fFEhbtJb7YvkALi1xv7Mail1RDqjQuub+UGGIpa+SL2ClppxDOD/ZqW9j
         T1U81U4jxzH4Du1MTCry5syADAI6+470ktPOwYKy1VhmOnxYL9itvbmgBMurXCWRRkzm
         G/2kG88tiortdwU1hGPXkpQiYXyt06NjBBn5csR7qNauqF5gwfNLFBEdYhEOCAIk0tod
         B+8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:user-agent:references
         :message-id:in-reply-to:to:from:date:arc-authentication-results;
        bh=2nvQlEC2QRiHe/nYScR4nUFhuv0VxyVMw7ycKtFedRM=;
        b=P8xnU1Uut4UuHNma65A9LAizQ+ovRFlOBfcJhUWBgewEjf0EFnUQLJnpfp91wmuays
         DFFXO2lTz5Q0p9QYRJ2q0SrLE54AJQuT6kRv0lFIFxIYLHbih1As7FtxMqQe07azha5Y
         z9T9WgGNTfynAovWwK9nbJELyRWujIwVNzOa3PX+E9WUVlwV6vsWc8pdpmZMOBuvzLXq
         uLZtM1yN2pgTNdUU4tSEt+XGDxABbbnTQYziCKiFw+XQNpZkcu7ULoqIo4v6MyqIuFOY
         oYaX33MLBdgZOTkIXfdyIg2CnAV0HVKv2jdAyJeH2hOYvft5NZTFcqRH+Bt2g3lYH/bL
         sfJA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n7si4828315qtf.97.2017.05.12.18.17.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 May 2017 18:17:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55925 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9LgQ-0000Oq-TF
	for alex.bennee@linaro.org; Fri, 12 May 2017 21:17:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52800)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <julia.lawall@lip6.fr>) id 1d9LfZ-0008VK-N6
	for qemu-devel@nongnu.org; Fri, 12 May 2017 21:16:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <julia.lawall@lip6.fr>) id 1d9LfW-0004tp-H1
	for qemu-devel@nongnu.org; Fri, 12 May 2017 21:16:29 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:36166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <julia.lawall@lip6.fr>)
	id 1d9LfW-0004rd-3u; Fri, 12 May 2017 21:16:26 -0400
X-IronPort-AV: E=Sophos;i="5.38,332,1491256800"; d="scan'208";a="223471096"
Received: from unknown (HELO hadrien.local) ([202.161.57.226])
	by mail3-relais-sop.national.inria.fr with
	ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 May 2017 03:16:14 +0200
Date: Sat, 13 May 2017 09:16:10 +0800 (SGT)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
In-Reply-To: <20170512233843.27713-1-f4bug@amsat.org>
Message-ID: <alpine.DEB.2.20.1705130915020.3152@hadrien>
References: <20170512233843.27713-1-f4bug@amsat.org>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.134.164.104
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] [RFC PATCH v4 0/6] optimize various tcg_gen()
 functions using extract op
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
Cc: Laurent Vivier <lvivier@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	Julia Lawall <julia.lawall@lip6.fr>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Markus Elfring <elfring@users.sourceforge.net>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0+/DSgljZrn6



On Fri, 12 May 2017, Philippe Mathieu-Daudé wrote:

> * Changes from v3
>
> Tried to fix wrong previous attempt...
> After getting some nice/fast pieces of advice from Coccinelle folks, I tried to
> improved the script (not much inline documentation yet although).
> - correctly check if this optimizable?
> - document as Mersenne number instead of prime (Eric Blake)
> - try to write Python code instead of BASIC (Markus Elfring advices)
> - try to reduce regex usage
> - try to match shri(); unrelated(); andi(); pattern to optimize, I was surprised
>   to see the alpha diff Coccinelle found.
>
> This is surely not the last version of this patchset, but I think now the
> generated patches are correct and I prefer reviewers to look at them fixed
> instead of wrong one in the ML.
> Still lot of work to do in the cocci script, now it seems to hang trying to
> parse "target/arm/translate.c".

Try using the arguments --debug and --show-trying.  This will help you see
what rule it is stuck on, and what function.  If the function is just very
complicated and the file is not important for transforming, you may just
want to give up, by adding eg --timeout 120.

julia


>
> * [v3] (v2 was a resend of the cocci script):
>
> In my first attempt I misunderstood tcg_gen_extract() intrinsics, and Richard
> Henderson pointed that out.
> In this patchset the cocci script is corrected and clarified, it also print how
> arguments are checked while running.
> Also:
> - incorrect patches have been removed. (Richard Henderson, Nikunj A Dadhania)
> - Coccinelle script licensed GPLv2+ (Eric Blake)
> - comment in each commit about how to apply the patch (Eric Blake)
> - added Acked-by for m68k (Laurent Vivier)
> - Cc: Coccinelle developers.
>
> [v1]
>
> While reviewing a commit from Aurelien Jarno where he optimized a TCG generator
> for SH-4 [1] I found the same optimization done on PPC by Nikunj A Dadhania few
> months ago [2].
> After asking on the ML about a cocci script [3] I thought it would be easier to
> learn about Coccinelle.
>
> citing Aurelien Jarno:
>     This doesn't change the generated code on x86, but optimizes it on most
>     RISC architectures and makes the code simpler to read.
>
> I actually applied the script using the following command:
>
> $ docker run -v `pwd`:`pwd` -w `pwd` petersenna/coccinelle \
>     --sp-file scripts/coccinelle/tcg_gen_extract.cocci \
>     --macro-file scripts/cocci-macro-file.h \
>     --dir target \
>     --in-place
>
> Please review again! thanks.
>
> [1] http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg01466.html
> [2] http://lists.nongnu.org/archive/html/qemu-devel/2017-02/msg05211.html
> [3] http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg01499.html
>
> Philippe Mathieu-Daudé (6):
>   coccinelle: add a script to optimize tcg op using tcg_gen_extract()
>   target/alpha: optimize cvtlq() using extract op
>   target/arm: optimize rev16() using extract op
>   target/m68k: optimize bcd_flags() using extract op
>   target/ppc: optimize various functions using extract op
>   target/sparc: optimize various functions using extract op
>
>  scripts/coccinelle/tcg_gen_extract.cocci | 103 +++++++++++++++++++++++++++++++
>  target/alpha/translate.c                 |   3 +-
>  target/arm/translate-a64.c               |   6 +-
>  target/m68k/translate.c                  |   3 +-
>  target/ppc/translate.c                   |  21 +++----
>  target/ppc/translate/vsx-impl.inc.c      |  24 +++----
>  target/sparc/translate.c                 |  15 ++---
>  7 files changed, 127 insertions(+), 48 deletions(-)
>  create mode 100644 scripts/coccinelle/tcg_gen_extract.cocci
>
> --
> 2.11.0
>
>
