Received: by 10.25.21.96 with SMTP id l93csp208939lfi;
        Tue, 14 Jun 2016 11:40:52 -0700 (PDT)
X-Received: by 10.140.23.198 with SMTP id 64mr1760550qgp.62.1465929651916;
        Tue, 14 Jun 2016 11:40:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c130si16813707qkb.126.2016.06.14.11.40.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 14 Jun 2016 11:40:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37466 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bCtGd-0004sv-Ck
	for alex.bennee@linaro.org; Tue, 14 Jun 2016 14:40:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40704)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bCtGZ-0004r5-Sc
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 14:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bCtGV-0000SJ-MM
	for qemu-arm@nongnu.org; Tue, 14 Jun 2016 14:40:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54445)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bCtGV-0000SC-Gf; Tue, 14 Jun 2016 14:40:43 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4E32037E71;
	Tue, 14 Jun 2016 18:40:41 +0000 (UTC)
Received: from localhost (vpn1-7-151.gru2.redhat.com [10.97.7.151])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5EIeZcf001355; Tue, 14 Jun 2016 14:40:35 -0400
Date: Tue, 14 Jun 2016 15:40:34 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Sergey Sorokin <afarallax@yandex.ru>
Message-ID: <20160614184034.GX18662@thinpad.lan.raisama.net>
References: <1465575999-3594234-1-git-send-email-afarallax@yandex.ru>
	<1465575999-3594234-3-git-send-email-afarallax@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465575999-3594234-3-git-send-email-afarallax@yandex.ru>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Tue, 14 Jun 2016 18:40:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 2/2] Fix a confusing argument name in
 tlb_fill() function
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
X-TUID: tocvm0p9bY9B

On Fri, Jun 10, 2016 at 07:26:39PM +0300, Sergey Sorokin wrote:
> The function tlb_fill() is called with access type argument which is named
> 'is_write' in its declaration. The patch fixes the argument name
> to avoid a confusion.
> 
> Signed-off-by: Sergey Sorokin <afarallax@yandex.ru>

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
