Received: by 10.25.159.19 with SMTP id i19csp506709lfe;
        Fri, 15 Jan 2016 06:43:53 -0800 (PST)
X-Received: by 10.140.32.53 with SMTP id g50mr13704107qgg.47.1452869032945;
        Fri, 15 Jan 2016 06:43:52 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p8si13603032qgp.99.2016.01.15.06.43.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jan 2016 06:43:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:47256 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aK5bU-0006PL-E3
	for alex.bennee@linaro.org; Fri, 15 Jan 2016 09:43:52 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5bR-0006NC-G4
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:43:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5bQ-0005oe-E6
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:43:49 -0500
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:36726)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aK5bP-0005oN-7B
	for qemu-arm@nongnu.org; Fri, 15 Jan 2016 09:43:48 -0500
Received: by mail-vk0-x236.google.com with SMTP id n1so144888021vkb.3
	for <qemu-arm@nongnu.org>; Fri, 15 Jan 2016 06:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=dBoNasZcwrNLotlMsPL3qWOP6RHMiF8bpmfDHVxxAmI=;
	b=Uq+F3Tf+QmSDjDCerATrmDBQhjUqY1k/bqFHHdoBQXs/lbfUZsAfuwDvq5sp1K4D8u
	kR/+f9bZbodDyQCBiyKt53c3yIQQw4sq8cdiCUwDo7gt8+KJ/5RGDfsWTI+fkZWIipC4
	uwDcVAnueDrOcrVx07jjPSOTFQUV+fQeBFYgQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=dBoNasZcwrNLotlMsPL3qWOP6RHMiF8bpmfDHVxxAmI=;
	b=DSIVCRlXrZLeWub5foMMRQSP50Mf6zAZbhTk55Zw18dmqZu4XMn29Kg/EGvqn6S4n6
	eYpEDxLH8oEvdaz2zDlbyNH5Zq9qJwU3PWHDAzyeSro7BwuAS8yvHNpGj1szLCFMOKFc
	XAxVUodDbePFlErrJeJo5ql66xwhVp5lXHMeAfDH0EY21IMz+G6gRH2yjUrFsV5BJOMg
	0Tna+NOibPlCF6YsgNtW/G9lXIUPGa6aVrVkC/xqqS9WBLtR+5tWNf7vK5ZcqM/EEKRu
	FZxyhevneJuPyQTxXX4a0mSK+9jRyePx0lzM0US5s7hkrFtxzOxWShS9RC+fekpDvyrm
	fybA==
X-Gm-Message-State: ALoCoQlOhHoSuQiIcyqGlNXcUcQsozmH7N9nCmv1dDzF/gQ1Q78zu0dYQODtEnzg8C/glHp0x5HHh3pNM5NtiCounl/EhforW65048dnwzGyzjcoPta2qrM=
X-Received: by 10.31.52.147 with SMTP id b141mr7639347vka.82.1452869026680;
	Fri, 15 Jan 2016 06:43:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 15 Jan 2016 06:43:27 -0800 (PST)
In-Reply-To: <1452542185-10914-1-git-send-email-drjones@redhat.com>
References: <1452542185-10914-1-git-send-email-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jan 2016 14:43:27 +0000
Message-ID: <CAFEAcA9LTXTs889O4eUqCk_mCR6EbSyf1+6tf24EBDw3fNCu0Q@mail.gmail.com>
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Cc: Markus Armbruster <armbru@redhat.com>, Alexander Graf <agraf@suse.de>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Eric Blake <eblake@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v4 0/8] target-arm: enable
	qmp-dump-guest-memory
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CytbLQ9jG6UU

On 11 January 2016 at 19:56, Andrew Jones <drjones@redhat.com> wrote:
> This series brings qmp-dump-guest-memory to arm and aarch64
> targets. I've detailed my testing and the results in the
> following table.
>
> v4:
>  - drop aarch64_compat_sp in favor of fixing crash[*] [Peter]
>  - added more Peter r-b's (fix 1 nit and 1 typo)
>
> [*] new crash fix: commit 4641ea1f6 https://github.com/crash-utility/crash
>
> v3:
>  - more changes thanks to Peter's review comments
>    - fix 32-to-64 shoehorning to work better with EL2/EL3
>    - stole comment from Peter for best-effort at endianness selection
>    - only make ARM VFP notes when the guest has VFP registers
>    - some more patch squashing and code commenting
>    - another r-b added
>  - collapsed a level of indirection, because if we're writing elf64 notes
>    then we'll always call the aarch64 function [drew]
>  - fixed the note type for ARM VFP notes (+ a tiny bit of refactoring) [drew]
>  - set prstatus.pr_fpvalid [drew]
>  - tested on tcg [drew]
>
> v2: changes thanks to Peter's review questions
>  - Threw in the FP registers. Can view them with gdb on elf
>    formatted dumps.
>  - Added comments stating where the register structs come from.
>  - Fixed determination of 32 vs. 64-bit and LE vs. BE formats.
>    Added a new config to the test matrix below to test this fix.
>  - Added a couple R-b's
>



Applied to target-arm.next, thanks.

-- PMM
