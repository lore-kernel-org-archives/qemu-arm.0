Received: by 10.25.85.209 with SMTP id j200csp1066501lfb;
        Mon, 13 Jun 2016 00:48:32 -0700 (PDT)
X-Received: by 10.237.56.225 with SMTP id k88mr12466519qte.86.1465804112515;
        Mon, 13 Jun 2016 00:48:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y78si7503011qha.38.2016.06.13.00.48.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Jun 2016 00:48:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54248 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCMbo-0001QO-1H
	for alex.bennee@linaro.org; Mon, 13 Jun 2016 03:48:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1bCMaj-0000Yv-JG
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 03:47:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>) id 1bCMai-0002hm-Nq
	for qemu-devel@nongnu.org; Mon, 13 Jun 2016 03:47:25 -0400
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1]:40044)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aurelien@aurel32.net>)
	id 1bCMai-0002hc-IX; Mon, 13 Jun 2016 03:47:24 -0400
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::1000])
	by hall.aurel32.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.84_2)
	(envelope-from <aurelien@aurel32.net>)
	id 1bCMaL-0006iQ-TO; Mon, 13 Jun 2016 09:47:01 +0200
Received: from aurel32 by ohm.aurel32.net with local (Exim 4.87)
	(envelope-from <aurelien@aurel32.net>)
	id 1bCLuA-0004ZQ-Ef; Mon, 13 Jun 2016 09:03:26 +0200
Date: Mon, 13 Jun 2016 09:03:26 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Sergey Sorokin <afarallax@yandex.ru>
Message-ID: <20160613070325.GA16232@aurel32.net>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
	<1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465575999-3594234-2-git-send-email-afarallax@yandex.ru>
User-Agent: Mutt/1.6.0 (2016-04-01)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:bc8:30d7:100::1
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Jia Liu <proljc@gmail.com>, Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Leon Alrae <leon.alrae@imgtec.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uw1ER1JlLRx/

On 2016-06-10 19:26, Sergey Sorokin wrote:
> There are functions cpu_unaligned_access() and do_unaligned_access() that
> are called with access type and mmu index arguments. But these arguments
> are named 'is_write' and 'is_user' in their declarations.
> The patch fixes the names to avoid a confusion.

Unless I missed something, it seems that the is_user/mmu_idx argument is
never used. Should we maybe just drop it?

Otherwise it looks fine.

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                 http://www.aurel32.net
