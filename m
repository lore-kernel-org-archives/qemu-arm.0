Received: by 10.25.0.6 with SMTP id 6csp469681lfa;
        Fri, 12 May 2017 16:39:17 -0700 (PDT)
X-Received: by 10.55.144.5 with SMTP id s5mr5712388qkd.39.1494632356906;
        Fri, 12 May 2017 16:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494632356; cv=none;
        d=google.com; s=arc-20160816;
        b=HPyme+jGJHxjruGKorZBdZNCXwx5dzG8gzTlfcbLRHF7VTSaVQ0RJCPdf2TxLjM7q4
         bFO4fVGdMGPDgLwpdjuE31R8dvxQR6kPghKyrgLvHbcB2+tKjLkTwMzzgqwUiJumSsHQ
         rE71VkQGFcpLddp6a3OW03B5StW7mlc7Ho8qKruqbTbV7Q1AjrlyrLuB+6BhKhae65f2
         /HvqiFRXLBJtvZ1ObVX4dij1Li6cibkz+zVekcvqS5FCmAUZa9S1Bw979t9rynH4xtbH
         idU5fBsxgOUVlrpms9E7N+/NADj8MbvyTGCFXPQn1eOZYo7vf+ZyUioRGUUsBzEx/WO1
         rFkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=K0kxX8tfATkLUJ4SgTSX73A2g9adzySLd1zBjmRXWbE=;
        b=eE7K5wQjhszZWHfzo5MH7ZbRJnY+OUuMx3KjzWnWHz7eO+lE87P9KFgtlfouA5Jw8q
         SSo/SUJQE2efoMGhewIpFNhvzuPACHwbMM/7KsqlV5JUGQA9MmoQZ1wUn9XDiytzWvp4
         qx9A0p3BNYsF8ua+sANSdtzOcb76sfdE9pl1KdthyG9umfn7lLgifT44Re/Jv4lhbuOP
         ystQOu/q/OIum4LGTH8fjIIlbQAkokESxTpk1B48HaM3uIyTJ0yM7CfhsUufc/BBVvF1
         toXyRkynAhT5xfGl7r9zwnA19WIjRfncaeflQDyABXhjh24voHxfA+sl9mpUHIb1VPnM
         YAaw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s65si4578160qki.207.2017.05.12.16.39.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 May 2017 16:39:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:55671 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9K9S-0008Sm-31
	for alex.bennee@linaro.org; Fri, 12 May 2017 19:39:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44805)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9K9G-0008P0-4V
	for qemu-arm@nongnu.org; Fri, 12 May 2017 19:39:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9K9F-0002VF-19
	for qemu-arm@nongnu.org; Fri, 12 May 2017 19:39:02 -0400
Received: from mail-qt0-x231.google.com ([2607:f8b0:400d:c0d::231]:35046)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9K99-0002OI-Ei; Fri, 12 May 2017 19:38:55 -0400
Received: by mail-qt0-x231.google.com with SMTP id v27so40632697qtg.2;
	Fri, 12 May 2017 16:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=K0kxX8tfATkLUJ4SgTSX73A2g9adzySLd1zBjmRXWbE=;
	b=l7EVrc/Y1oLYR5wqCMbOI1XKT9PPRCeBR657QeWWJ4a4EQeiCtfw9VKb+xUTyrCpAW
	P0r/GpTkJhUJLSkKUOOtX1xjKMZl0j2Ywnod1OlgKFTDcUD44aTFI0lnrdQi99r0nMWY
	vtY1iVCQ2985lFGizEiqhN2cgMHbtUkqvoS+zhHlcQwMRR6tsM+GDRiVBPgSVKUFLHWj
	4S72AK/nsIiBww6Gj3HbSDXZW3fus+/WnLHFncOmEOm91pH5JhNlyu/Lx2AEGuMOAfui
	3hbg9QtuxY65vJEVTf/al1U+7Eh/2kY2w8WW7jiyvji9/VLxJyJNoObS4eqH9q8Z4FlJ
	+YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=K0kxX8tfATkLUJ4SgTSX73A2g9adzySLd1zBjmRXWbE=;
	b=UF+CIAqhYVdY9stER2BOcVAR0OsbhyjkkcFRs7ZKRVr/kqcA8cEGZ34+/pYKuqAZGn
	46jqY9KjOPqoTkTOqOyf8rYGSVRY86FHohnuJNz+sVKGbtBJj/aqDyhVuOX0CIpKTuAZ
	4Vx+6p+pJ5tIjYaBkIe509Edt8LhaH9tEKteW6RcB1OkatnfM5Y635UE/e2FbZxmfeQo
	+R/sl9NTvvxo8DxhNm/k96lwsV9O6M5K2fkfKUYskyE3d41tGy/RpWEwIC1Imb2lpn1u
	FECD6+XLjObHFLuQ72AAMDWKVlLwQK5lxWCBoj4MyZyRBW41Fffo0UAu681wpb4wSvn6
	Se6A==
X-Gm-Message-State: AODbwcACLm1Jqdck+VqEagsjf7frY5EYSKjqymegrFClxWMay4VMuFkM
	q+G1H0WL7oMQ4w==
X-Received: by 10.237.57.170 with SMTP id m39mr5969577qte.163.1494632334507;
	Fri, 12 May 2017 16:38:54 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	n78sm3253857qki.60.2017.05.12.16.38.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 May 2017 16:38:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, Laurent Vivier <lvivier@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2017 20:38:37 -0300
Message-Id: <20170512233843.27713-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::231
Subject: [Qemu-arm] [RFC PATCH v4 0/6] optimize various tcg_gen() functions
 using extract op
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
Cc: Julia Lawall <julia.lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Markus Elfring <elfring@users.sourceforge.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GCBmFI/TVFAQ

* Changes from v3

Tried to fix wrong previous attempt...
After getting some nice/fast pieces of advice from Coccinelle folks, I tried to
improved the script (not much inline documentation yet although).
- correctly check if this optimizable?
- document as Mersenne number instead of prime (Eric Blake)
- try to write Python code instead of BASIC (Markus Elfring advices)
- try to reduce regex usage
- try to match shri(); unrelated(); andi(); pattern to optimize, I was surprised
  to see the alpha diff Coccinelle found.

This is surely not the last version of this patchset, but I think now the
generated patches are correct and I prefer reviewers to look at them fixed
instead of wrong one in the ML.
Still lot of work to do in the cocci script, now it seems to hang trying to
parse "target/arm/translate.c".

* [v3] (v2 was a resend of the cocci script):

In my first attempt I misunderstood tcg_gen_extract() intrinsics, and Richard
Henderson pointed that out.
In this patchset the cocci script is corrected and clarified, it also print how
arguments are checked while running.
Also:
- incorrect patches have been removed. (Richard Henderson, Nikunj A Dadhania)
- Coccinelle script licensed GPLv2+ (Eric Blake)
- comment in each commit about how to apply the patch (Eric Blake)
- added Acked-by for m68k (Laurent Vivier)
- Cc: Coccinelle developers.

[v1]

While reviewing a commit from Aurelien Jarno where he optimized a TCG generator
for SH-4 [1] I found the same optimization done on PPC by Nikunj A Dadhania few
months ago [2].
After asking on the ML about a cocci script [3] I thought it would be easier to
learn about Coccinelle.

citing Aurelien Jarno:
    This doesn't change the generated code on x86, but optimizes it on most
    RISC architectures and makes the code simpler to read.

I actually applied the script using the following command:

$ docker run -v `pwd`:`pwd` -w `pwd` petersenna/coccinelle \
    --sp-file scripts/coccinelle/tcg_gen_extract.cocci \
    --macro-file scripts/cocci-macro-file.h \
    --dir target \
    --in-place

Please review again! thanks.

[1] http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg01466.html
[2] http://lists.nongnu.org/archive/html/qemu-devel/2017-02/msg05211.html
[3] http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg01499.html

Philippe Mathieu-Daudé (6):
  coccinelle: add a script to optimize tcg op using tcg_gen_extract()
  target/alpha: optimize cvtlq() using extract op
  target/arm: optimize rev16() using extract op
  target/m68k: optimize bcd_flags() using extract op
  target/ppc: optimize various functions using extract op
  target/sparc: optimize various functions using extract op

 scripts/coccinelle/tcg_gen_extract.cocci | 103 +++++++++++++++++++++++++++++++
 target/alpha/translate.c                 |   3 +-
 target/arm/translate-a64.c               |   6 +-
 target/m68k/translate.c                  |   3 +-
 target/ppc/translate.c                   |  21 +++----
 target/ppc/translate/vsx-impl.inc.c      |  24 +++----
 target/sparc/translate.c                 |  15 ++---
 7 files changed, 127 insertions(+), 48 deletions(-)
 create mode 100644 scripts/coccinelle/tcg_gen_extract.cocci

-- 
2.11.0

