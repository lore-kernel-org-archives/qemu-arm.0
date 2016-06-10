Received: by 10.25.85.209 with SMTP id j200csp74016lfb;
        Fri, 10 Jun 2016 09:35:12 -0700 (PDT)
X-Received: by 10.237.58.137 with SMTP id o9mr2807774qte.83.1465576512323;
        Fri, 10 Jun 2016 09:35:12 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j13si6709544qkh.172.2016.06.10.09.35.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Jun 2016 09:35:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43330 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bBPOp-00037f-Po
	for alex.bennee@linaro.org; Fri, 10 Jun 2016 12:35:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39988)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bBPNS-0002UW-RO
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 12:33:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bBPNR-0000rs-84
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 12:33:46 -0400
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:32986)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bBPNQ-0000r2-MT
	for qemu-devel@nongnu.org; Fri, 10 Jun 2016 12:33:45 -0400
Received: by mail-vk0-x22f.google.com with SMTP id d64so104590963vkb.0
	for <qemu-devel@nongnu.org>; Fri, 10 Jun 2016 09:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=jlinKYfawDiztJ+w8MEF8/xIFui1A/2IPAYHd8UtKxA=;
	b=b8ZYLyPHGfHuBWltaQgdegBiZ45yiND399YU32QiOe5UR/UaDY8gldrvhdQzbv7kpZ
	3sRRcpIQf2tNSKcnyUj/u+rbC2xiDpw7sjBwxXx8QwREZYyquOakotWQhtWxgeEZaAui
	Xn9q3f2jc4rz4+rrc6JfRj4h24I3UjaZk3VgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=jlinKYfawDiztJ+w8MEF8/xIFui1A/2IPAYHd8UtKxA=;
	b=IU621AbSPNLVE+7TFMT5PhgW2N9pk0defpvVYBveOvWLHwXp5aQrglneFp4aVWEA4K
	nAlm5sUYwgICCX6EatdZc33bcuQS7TIsT+OnGFUPigd0enOdX001kFtn/ahC/OimMbX3
	WNLCyBhbgot/GngjzupMzCU3bqXzKBE7i1cd8TYQw2VXsyougrIafGR2JmzaockzClZT
	esQ0cxnW00qzwZa5UjMai8qOpJACHftsSiQkKti+BvSO0P/Co/Sfaif3g+NtgXEOKLsx
	caqhMv7g8ZbDVqzdq09h5BfgmrQByA/kseyKkeJwRiyDKVxlFhaz8UoM9MpiU/nqcb8l
	rvRA==
X-Gm-Message-State: ALyK8tK5V856XJRZVYYVonY2PM3stP5PqcQowZfTqNGs2BjbvleUzgAdX4A9kmqB3lteNFdfdqg8A4a8oRKHU/eH
X-Received: by 10.176.65.7 with SMTP id j7mr962799uad.38.1465576424221; Fri,
	10 Jun 2016 09:33:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.97.68 with HTTP; Fri, 10 Jun 2016 09:33:24 -0700 (PDT)
In-Reply-To: <1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
	<1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2016 17:33:24 +0100
Message-ID: <CAFEAcA-UqUdkoM2abzNiVstLR9tO_SgaQBTjsm=QHt-Hr6xrzQ@mail.gmail.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Subject: Re: [Qemu-devel] [PATCH 1/2] Fix confusing argument names of
 do_unaligned_access() functions
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
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rYqn6j32RPLa

On 10 June 2016 at 17:26, Sergey Sorokin <afarallax@yandex.ru> wrote:
> There are functions cpu_unaligned_access() and do_unaligned_access() that
> are called with access type and mmu index arguments. But these arguments
> are named 'is_write' and 'is_user' in their declarations.
> The patch fixes the names to avoid a confusion.
>
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>

If we're going to touch all of these then we have an enum type
we should be using instead of just 'int' for the old
is_write argument: MMUAccessType (defined in cpu-common.h).

thanks
-- PMM
