Received: by 10.25.21.96 with SMTP id l93csp585593lfi;
        Thu, 23 Jun 2016 08:34:32 -0700 (PDT)
X-Received: by 10.55.47.6 with SMTP id v6mr43814598qkh.11.1466696072815;
        Thu, 23 Jun 2016 08:34:32 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v83si628249qka.68.2016.06.23.08.34.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 08:34:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG6eG-0006bT-44
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 11:34:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48201)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bG6TG-0002kt-5p
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 11:23:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1bG6TF-0006gS-DK
	for qemu-devel@nongnu.org; Thu, 23 Jun 2016 11:23:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51154)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1bG6T6-0006cK-2q; Thu, 23 Jun 2016 11:23:00 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9F250C0703A0;
	Thu, 23 Jun 2016 15:22:59 +0000 (UTC)
Received: from localhost (vpn1-7-238.gru2.redhat.com [10.97.7.238])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5NFMwEG001803; Thu, 23 Jun 2016 11:22:59 -0400
Date: Thu, 23 Jun 2016 12:22:57 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20160623152257.GA2048@thinpad.lan.raisama.net>
References: <1465492263-28472-5-git-send-email-imammedo@redhat.com>
	<1466515457-253194-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1466515457-253194-1-git-send-email-imammedo@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.6.1 (2016-04-27)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 23 Jun 2016 15:22:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 4/6] fixup! cpu: use
 CPUClass->parse_features() as convertor to global properties
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
Cc: peter.maydell@linaro.org, rth@twiddle.net, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1EafOtNYdpH2

On Tue, Jun 21, 2016 at 03:24:17PM +0200, Igor Mammedov wrote:
> make sure that -cpu features converted to global properties
> will not be ignored and QEMU exits with error as it used to
> in case feature couldn't be applied.
> 
> fixup is on top of:
>  [PATCH v2 00/10] globals: Clean up validation and error checking
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

To original patch + fixup:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>

-- 
Eduardo
