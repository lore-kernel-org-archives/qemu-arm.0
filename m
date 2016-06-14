Received: by 10.25.21.96 with SMTP id l93csp217470lfi;
        Tue, 14 Jun 2016 12:06:03 -0700 (PDT)
X-Received: by 10.140.27.203 with SMTP id 69mr21259781qgx.96.1465931163023;
        Tue, 14 Jun 2016 12:06:03 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h4si13516945qtb.97.2016.06.14.12.06.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 12:06:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37577 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCtf0-0001yn-GJ
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 15:06:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46797)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bCtew-0001yV-TI
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 15:05:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bCtes-0006NZ-1k
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 15:05:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45375)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bCter-0006My-SC; Tue, 14 Jun 2016 15:05:53 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4D6280E4A;
	Tue, 14 Jun 2016 19:05:52 +0000 (UTC)
Received: from localhost (vpn1-7-151.gru2.redhat.com [10.97.7.151])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EJ5pnX007157; Tue, 14 Jun 2016 15:05:52 -0400
Date: Tue, 14 Jun 2016 16:05:50 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Message-ID: <20160614190550.GY18662@thinpad.lan.raisama.net>
References: <1465907177-1399402-1-git-send-email-afarallax@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465907177-1399402-1-git-send-email-afarallax@yandex.ru>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Tue, 14 Jun 2016 19:05:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2] Fix confusing argument names in some
 common functions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Jia Liu <proljc@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Anthony Green <green@moxielogic.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-arm@nongnu.org,
	qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YzD72qK6+lSi

On Tue, Jun 14, 2016 at 03:26:17PM +0300, Sergey Sorokin wrote:
> There are functions tlb_fill(), cpu_unaligned_access() and
> do_unaligned_access() that are called with access type and mmu index
> arguments. But these arguments are named 'is_write' and 'is_user' in their
> declarations. The patches fix the arguments to avoid a confusion.
> 
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Do you plan to change *_handle_mmu_fault(), arm_tlb_fill(), and
xtensa_get_physical_addr() later?

-- 
Eduardo
