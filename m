Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F7D606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 12 Nov 2026 07:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=M4vY5XKe;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=pRtyqCoc
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRPih-0004im-NJ; Thu, 12 Nov 2026 02:59:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1xRPif-0004iE-O2
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 02:59:41 -0500
Received: from fhigh-b4-smtp.messagingengine.com ([202.12.124.155])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arnd@arndb.de>) id 1xRPib-0004oo-Jo
 for qemu-arm@nongnu.org; Thu, 12 Nov 2026 02:59:41 -0500
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D0CA47A0249
 for <qemu-arm@nongnu.org>; Thu, 12 Nov 2026 02:59:30 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
 by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 02:59:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1794470361;
 x=1794556761; bh=cVSEKR/sSEcj2kqUoOCDBG4g9Z6MGl0XVNPCAKPLItQ=; b=
 M4vY5XKe8fCu6y1pn7kRzf2jTalRMXggmoxydRGZsxUvUB7eKaRxpXrvP2i2jIt5
 1LQCdoUu0drH2BaZO245x6NT7Tf5spJn3T8lB0hPtrbaoockx6gFbF1IZxA9Xd0O
 SaBmRmDqNb/TCw3SdHT7rhSC/u7T+/L0nXTWI2SgoLbcNh9zuZiGDeL1tdr4/D1E
 v9y0fFJWtLoiqfBnYvhsl4yxks+fSnDxy+tj9gs5VJhSNr5m3cOzIndcGyQ51Ah5
 YabZYIsuDlwDrNAQYBG3xwEJYVlceoquLAdG1I3u4ph/E7tjFuMyQtu4d2wCrOaO
 pd64VenJwoziA9yX+0OJ8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794470361; x=
 1794556761; bh=cVSEKR/sSEcj2kqUoOCDBG4g9Z6MGl0XVNPCAKPLItQ=; b=p
 RtyqCocN70nKAkOIpL8dIRy6WVXq9bLwqLPReTCgWcVTmcnOVmD9bb3q5JCakgD6
 WYn4mtvup4uMAnoXDe76EFNEWQ8Hewn1MpHrcsAheoXOTWFIb9ZVpjrvppzOYa81
 oYGqztYgtyQrlz4vBxuS9Xi++3chzrmkuAhsx/Z7Fr7suM9ljmRLm+RbidsB7uEg
 H2oJKOhORx1cZeH2+nY48iH3nucHstFbq4xP1M/WwXYtFDkSHzuK/QLJS3UUu2Kf
 Ok5ilYzXvfX1rl731PjSV7R7OrIfBZzo1xH4nBHavRlDH0nLzQGAH/OI3fgLw114
 HCiFW/nGlkcO0vDAo8vSQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
 repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
 action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794470361; d=arndb.de;
 mf=PGFybmRAYXJuZGIuZGU+; rt=PHFlbXUtYXJtQG5vbmdudS5vcmc+;
 s=fm2:rsa-sha256:Mk0K7Tk8SVJ18geGI0fX8MZxfGofRWwbHsr3cTyhAYhr+O3
 PK9HJtsUzI9NeV16GRSa/lHHO2UVI27B7cGCMxj6ghjO3HRPNuaD8ANxzQM10dIp
 bIegdnfEtLk8GylJhnGkI5sglg6akAeb4XYogvbTmDyTWbq3cyQ0Ke+658xzMGYr
 6QRu9ygHQnR26fFu/fFoV1UEe2HO20awA/nH5BYqW3mA753IiNDk+IlvwNAst5K6
 h5bnBH6edG43sGpY3wdf2EeRfCQLZyBqSveuyMmfA83uzbzy7jq/maJF4X5bfHSu
 JXp9+vY6epuQmmjEKpZWtzI8jaMio4C9xEN1Gyw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
 repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
 action=mi-m=1; hc=12;
 hn=cc,content-transfer-encoding,content-type,date,feedback-id,
 from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1;
 h=sha256:wc87NUQSquJRYsFpZvFg2+DhZhq1+zJDa5SS0gU553o=:69/HbqOdtr3yYUEdgCRTpCvFlV3qPLdmUzQcSdPq78o=;
X-ME-Sender: <xms:0nH1arLtEAKr7CvJjA9r-xLBmtlX6KKTNxOsQ9Yy4WkptkKZtCJ0Ew>
 <xme:0nH1ap_0aW42F8pQiIC5ueWcMiVigvWTTrgf604nXYE5CLvsB7qDOZA6Hcx3r1Qdh
 8xBL7-g5HhiaL84_ZMF3IMmCfkL5KkVjQLJp7fBFVMSxvgl5CTVhyYC>
X-ME-Proxy-Cause: dmFkZTFkSIWXOLZlwBlmHCHL1e0Lydj3Y83p6vUWF2DqJnMTU7D1RcjMmV5frrxyY4IzE2
 mruh3DxAHY5MY1BWw071w4M9sXazaTyOYorwJN6DIg/J7JtbBc9hxZXk5c1toZJo8X1o8C
 O7f+HHYH7vSsfj3MXq13X6/aYl0Bj/1LlEqoM5l1DmJRB0luiqRU8M3u+u4NIS7EONDQCk
 8vQb6zrOdHj+zyIF76hC6F0ffNGaA3rUhAxXgiNXu3W8Onn9Ab7QkUQvwArfW0C2l2X+Tb
 +DMV3P8abBOGmakKgU3GbJdA3zb2Fsf4TUBJ1rDAEZ6tF4OxoQ/XFdisddYYf+RCWZA8oN
 DwIxI4qNcndKWKi5jbwEEBhGjYu95e5q07yo5JPbl5fHm0PAcztXuMXwGx0nL6GMkaToaP
 0YyE9OnzeRruwb/iMATT1q4th+coE7HQ3JJDBYbasaZcKLGLdXzw08oFt1ASCQgU6eIYQm
 Fk4Obrl3pUy9Bg/BwmXn1KhpStwdnQnpJR7hysIbWZwQpNctmREanWrPiX4IJwtogQnOcQ
 /gIZeG6omAfYvmY8Th6RaNvxLP5qgf8UzulEZEcnLFQZkHxbQ3O6DY42TuJz80UjMWf1+m
 hC+IM1iMG07uRb8SUOmY5VVzRDxbNI/+sMZCkAo0e2GX3/lR/toB//0Bwxow
X-ME-Proxy: <xmx:1XH1ahdaTjQ2MiSzC6jfWPg9WWBsvbvs4qcXMMAnMmEbqqgvdFifuQ>
 <xmx:1XH1agmdmwvBYjy_NGHO2yMjdMc_VjWqrHUGsatxhZE0nbGym6ipqA>
 <xmx:1XH1ajyyWu4HH8R34JFrmueksShBO9ELXUPyM-IiQvgGlmb6W6dJtQ>
 <xmx:1XH1ajOCBlSBaoUoS3Pwk6Z9mT65dHzpuPIx0sPCkcq7TLT-cVdECQ>
 <xmx:2XH1anLN8dbVzakiPe6FkOmx8CZ_cUG7aLnys8IneL1c37FGuRIzt35Z>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
 id 5A4CD32A0099; Thu, 12 Nov 2026 02:59:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ThreadId: Aqe2GYTsJ-4J
Date: Thu, 12 Nov 2026 08:58:53 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Patrick Lister" <patrick.lister.dev@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>
Cc: "Ard Biesheuvel" <ardb@kernel.org>, "Linus Walleij" <linusw@kernel.org>,
 "Keith Packard" <keithpac@amazon.com>, "Nicolas Pitre" <nico@fluxnic.net>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, "Nick Clifton" <nickc@redhat.com>,
 "Richard Earnshaw" <richard.earnshaw@arm.com>,
 "Ramana Radhakrishnan" <ramanara@nvidia.com>,
 "Peter Maydell" <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 "Riku Voipio" <riku.voipio@iki.fi>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 luis.machado.foss@gmail.com, thiago.bauermann@linaro.org
Message-Id: <0384a52a-31f6-4bbd-9de8-8efe73610e28@app.fastmail.com>
In-Reply-To: <20261112025159.473997-1-patrick.lister.dev@gmail.com>
References: <20261112025159.473997-1-patrick.lister.dev@gmail.com>
Subject: Re: [PATCH] ARM: nwfpe: use task_pt_regs() to find user registers
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=202.12.124.155; envelope-from=arnd@arndb.de;
 helo=fhigh-b4-smtp.messagingengine.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026, at 03:51, Patrick Lister wrote:
> NWFPE locates the trapping process's saved registers relative to
> current_thread_info(), assuming thread_info sits at the bottom of the
> kernel stack. Since ARM moved thread_info into task_struct, that
> expression points past the end of the task_struct instead.
>
> This breaks FPA instruction emulation, as the user registers are
> never read or written and causes out-of-bounds reads and writes of
> kernel memory beyond the task_struct. Any unprivileged process can
> trigger this.

Thanks a lot for chasing this down!

As I understand it, this means that nobody has seriously used or
tested OABI since 5.16. I last tested it myself in 5.14 when
working on 4e57a4ddf6b0 ("ARM: 9107/1: syscall: always store
thread_info->abi_syscall"), but it was quite hard to properly
test it at the time, even getting an old Debian rootfs to work
with a modern kernel and qemu was nontrivial.

> Fix by using task_pt_regs(current), which finds the registers on the
> stack.
>
> The bug was found with assistance from Claude Code (Anthropic), model
> Claude Opus 5.5 (claude-opus-5-5).
>
> Fixes: 18ed1c01a7dd ("ARM: smp: Enable THREAD_INFO_IN_TASK")
> Fixes: 9c46929e7989 ("ARM: implement THREAD_INFO_IN_TASK for
> uniprocessor systems")
> Cc: stable@vger.kernel.org # 5.16+
> Signed-off-by: Patrick Lister <patrick.lister.dev@gmail.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

The patch looks fine, and it's clearly harmless to merge as there
are no users, so please add it to the patch tracker according to
the instructions at https://www.arm.linux.org.uk/developer/patches/info.php

Hopefully this way we can have OABI/NWFPE in a working state for the
LTS backports when we remove it in the near future, in case
anyone ever wants to play with it later.

I've added the maintainers for the Arm ports in gcc, qemu and binutils
to Cc here, I believe all of these still have some level of OABI
support that they kept just because Linux still handles it, but
that can then also be removed.

      Arnd

