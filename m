Received: by 10.25.27.66 with SMTP id b63csp2193827lfb;
        Tue, 7 Jun 2016 13:29:17 -0700 (PDT)
X-Received: by 10.200.51.165 with SMTP id c34mr1442991qtb.48.1465331356960;
        Tue, 07 Jun 2016 13:29:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n67si15141464qge.15.2016.06.07.13.29.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 Jun 2016 13:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52835 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bANci-0002Mc-CV
	for alex.bennee@linaro.org; Tue, 07 Jun 2016 16:29:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40897)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bANcZ-0002In-Ft
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 16:29:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bANcX-0005gg-IU
	for qemu-arm@nongnu.org; Tue, 07 Jun 2016 16:29:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46880)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bANcX-0005ga-Cy; Tue, 07 Jun 2016 16:29:05 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E36ECC04B309;
	Tue,  7 Jun 2016 20:29:04 +0000 (UTC)
Received: from localhost (vpn1-7-78.gru2.redhat.com [10.97.7.78])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u57KT3Ib001841; Tue, 7 Jun 2016 16:29:03 -0400
Date: Tue, 7 Jun 2016 17:29:02 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160607202902.GH18662@thinpad.lan.raisama.net>
References: <1465226212-254093-1-git-send-email-imammedo@redhat.com>
	<1465226212-254093-5-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1465226212-254093-5-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 07 Jun 2016 20:29:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 04/10] target-i386: cpu: use
 cpu_generic_init() in cpu_x86_init()
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
	qemu-devel@nongnu.org, blauwirbel@gmail.com, qemu-arm@nongnu.org,
	pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3BhcuSrA2DUn

On Mon, Jun 06, 2016 at 05:16:46PM +0200, Igor Mammedov wrote:
> now cpu_x86_init() does nothing more or less
> than duplicating cpu_generic_init() logic.
> So simplify it by using cpu_generic_init().
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

Applied to x86-next. Thanks.

-- 
Eduardo
