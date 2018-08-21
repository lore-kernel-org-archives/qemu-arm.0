Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1804502wrd;
        Tue, 21 Aug 2018 04:38:03 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyoGpbbuHDbdDfzZ8seP08TIN4GtYPgfU/vOi+qdojcM4g6SgtvVKEFwKzMeToSGlHZLBQU
X-Received: by 2002:ac8:44d2:: with SMTP id b18-v6mr46357519qto.167.1534851483262;
        Tue, 21 Aug 2018 04:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534851483; cv=none;
        d=google.com; s=arc-20160816;
        b=F7p80dIRMoLRtXeo79ExNex9dVDIw+BsDhLNRUTavMtftd31JqnFqNQRpDlOS6a5pA
         0bZAndC4j+6k5nYmLmc6/FhveBRybdu3cc3CBugxpZ1sabfrJGJ0ZJsU1TDSwYroGfn3
         mSwGWpze78KBTXRsEzwejuRFRdoyhJB4xSju69ARYgIBeLu9C0S6TgLMK/z6z3tVhpMF
         C9ynzbLjMcqna/Du1Q2t0DuwvsoJhHz7SiU0BptIRZRyFt1hXc8lQpxsshCyJikl9AQ8
         TrOUh19LfgBpJew1XKscc8iR8onPAdVhXUlTTTUE9MhQast5j2PKhHF2AhTkouj0UsLh
         RxfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=mBmoO9gnLPleHXs/15SWLlpGgztOBhzOEnTpvIR1PgM=;
        b=xy16SeoBb4x7vhoDBrF+kI40AasyBIIJpI6enQKsaBP67xb85b/khXpAC/MTgSS4a2
         DRE+mw2hts+eZmEL4LfhxyW1t4xetThIDvBwfVXand0vwRXo/oP6NVh6Wn73PvxBkEue
         jzfM9z5l8jCsVu8dYYJzQ6qnJd2mhWMmKrUQ1eW0iLBcGok6QDFgcrdVgY/OsBG9JmCQ
         DChaythpOifLiyaHe0rrW807UG4ytpTMCfIHJTBSc75txdkzIimuPfS6vXkvJtdaAYb3
         6QV1mc/s/9Jac59yIZxtjtpfKGrmDXyLzjHtnsASZ/KsPjDBdItXXY5bKtR0ppmYUkY6
         EVxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@isystem-si.20150623.gappssmtp.com header.s=20150623 header.b=pKONyjuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m77-v6si2009197qkl.347.2018.08.21.04.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 04:38:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@isystem-si.20150623.gappssmtp.com header.s=20150623 header.b=pKONyjuF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52439 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs4z4-0000LZ-OC
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 07:38:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marko.klopcic@isystem.si>) id 1fs4yt-0000LK-Uz
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 07:37:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marko.klopcic@isystem.si>) id 1fs4yp-0001mW-S8
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 07:37:51 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:38472)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marko.klopcic@isystem.si>)
	id 1fs4yp-0001l6-Ga
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 07:37:47 -0400
Received: by mail-wm0-x244.google.com with SMTP id t25-v6so2535752wmi.3
	for <qemu-arm@nongnu.org>; Tue, 21 Aug 2018 04:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=isystem-si.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=mBmoO9gnLPleHXs/15SWLlpGgztOBhzOEnTpvIR1PgM=;
	b=pKONyjuF6lQnyk9UCvTph0i41DAaR10i6oRlifRpn+KScnrk50TfeEulO1F/pzSBeE
	UePCzTcrOoQ5aIl6ynxKK58oTgwbBq0gKARVUCjem+YJT8KEctRy2cGfozNjI64qQ/NV
	SMojbzgRd11xn7vdE0OANk341FJqM3w2azRasLNLwdsQJur+eRh731NyWA11nZJG5OY0
	nC+4eyP7s+GcHQGzs2+lZMZGbdEfxmFAfZ2QuzSw/VoQ9zw0VPXlGz7C6sAy3gnoPWrs
	HjOWbuLMfGgbzR0SnuYNvLTuj0/diP+wx9fabNxv1t3qrB2t9UQ+EqS50E3XW7YB8R4i
	m/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=mBmoO9gnLPleHXs/15SWLlpGgztOBhzOEnTpvIR1PgM=;
	b=O0so6ai0puZjnzLLkEvHnc5ug2AlXQCnzEINZjZaB2eaVVdu0vJX2dcfqe9LLTZZ9b
	euPyq95mtFWrBgoMXc+cKDnw+eJOj5r4Fgyr5hVMw+YF60sQlS2A6RIBfll36VFxaHJk
	BYZDvsn0giU38A3qpgOCNLpfuqG4eNqkgJMqe8suujaYrwhKLYrEaGSAzptVWU2ZN61d
	pj0ynmIBOMzyqTs7RafY68+1bgXwRAdF5fztl72lBhnu2djOwcRQ8Pp7+d59cPq/tMmK
	fKxflaweFd3vumtkvKy06A/mSJFHXGb6SCL/EWyKiZ0WTPDEW4dDVkir5sJXat1wKzDs
	XDWQ==
X-Gm-Message-State: APzg51BFaGQTk8dIPh4QIGpb0/EvLZ+NJKTqiutRToDbgrgR4G25r5Ro
	0sS9MqMg4HnPjSm3vAj1oU/Tkw==
X-Received: by 2002:a1c:be14:: with SMTP id
	o20-v6mr1758418wmf.73.1534851466019; 
	Tue, 21 Aug 2018 04:37:46 -0700 (PDT)
Received: from [10.1.2.132] ([77.94.130.182]) by smtp.gmail.com with ESMTPSA id
	r13-v6sm2810631wmf.34.2018.08.21.04.37.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Aug 2018 04:37:45 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <2edf4dc3-5cc2-c3f3-fd40-7901e2c06413@isystem.si>
	<CAFEAcA-gbG0xF3faXZYpkg_OyOyNcPyviDBhytzi1AkUj3FL4w@mail.gmail.com>
From: Marko Klopcic <marko.klopcic@isystem.si>
Message-ID: <5adf2f78-0e4f-7c02-a5df-a2770ab4920d@isystem.si>
Date: Tue, 21 Aug 2018 13:37:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-gbG0xF3faXZYpkg_OyOyNcPyviDBhytzi1AkUj3FL4w@mail.gmail.com>
Content-Type: text/html; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [PATCH] arm: fix reset operation on netduino2 board.
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IrYvVULNQd/Z

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    Thanks for the review. I agree that this fix is more a workaround,
    but it is local to <br>
    the only currently existing board with STM32 (AFAIK), so I couldn't
    break other targets.<br>
    I'll try to implement one of your proposals.<br>
    <br>
    Marko<br>
    <br>
    <br>
    <div class="moz-cite-prefix">On 2018-08-20 2:33 PM, Peter Maydell
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAFEAcA-gbG0xF3faXZYpkg_OyOyNcPyviDBhytzi1AkUj3FL4w@mail.gmail.com">
      <pre wrap="">On 20 August 2018 at 12:10, Marko Klopcic <a class="moz-txt-link-rfc2396E" href="mailto:marko.klopcic@isystem.si">&lt;marko.klopcic@isystem.si&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">Because roms are located on aliased addresses on netduino2 (Cortex M3,
STM32F205), PC and SP are not read from loaded kernel, which means
that the first reset fails. This fix adds additional call to reset.
See more details in code comment below.

Signed-off-by: Marko Klopcic <a class="moz-txt-link-rfc2396E" href="mailto:marko.klopcic@isystem.si">&lt;marko.klopcic@isystem.si&gt;</a>

---
 hw/arm/netduino2.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index f936017d4a..a2f102b14b 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -25,6 +25,7 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "hw/boards.h"
+#include "hw/loader.h"
 #include "qemu/error-report.h"
 #include "hw/arm/stm32f205_soc.h"
 #include "hw/arm/arm.h"
@@ -39,6 +40,32 @@ static void netduino2_init(MachineState *machine)

     armv7m_load_kernel(ARM_CPU(first_cpu), machine-&gt;kernel_filename,
                        FLASH_SIZE);
+
+    /*
+      The following two calls are a workaround for problem with rom on
aliased
+      addresses on STM32.
+      Kernel is loaded into Rom objects, which are stored in loader.c. Roms
+      are copied to memory in:
+
+      void rom_reset() {
+        ...
+         cpu_physical_memory_write_rom(rom-&gt;as, rom-&gt;addr, rom-&gt;data,
+                                       rom-&gt;datasize);
+        ...
+      }
+
+      However, since CPU reset is registered BEFORE
+      rom_reset(), SP and PC are read from memory BEFORE roms are copied to
+      memory. CPU reset also checks Roms for data, so this is normally not
a
+      problem, but in STM32 PC and SP are read from aliased memory, and
these
+      memory addresses are not mapped to Roms. Since ROMs are private in
+      loader.c the only option to copy Roms to memory is through reset. So
we
+      first have to register Roms for reset, and then trigger system reset,
which
+      copies Roms to mem, so that reset vectors are in memory, when
+      qemu_system_reset() is called again from main().
+     */
+    rom_check_and_register_reset();
+    qemu_system_reset(SHUTDOWN_CAUSE_NONE);
 }
</pre>
      </blockquote>
      <pre wrap="">
I agree that this is a bug, but I think this is not the right way
to fix it, as it is not specific to this particular board. We need
to either somehow ensure the reset order between the rom code
and the Arm CPU reset is enforced, or change how we do the SP/PC
load on reset of an M-profile core.

thanks
-- PMM
</pre>
    </blockquote>
    <br>
  </body>
</html>
