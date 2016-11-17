Received: by 10.25.150.194 with SMTP id y185csp694104lfd;
        Thu, 17 Nov 2016 05:34:03 -0800 (PST)
X-Received: by 10.28.180.214 with SMTP id d205mr17030952wmf.131.1479389642977;
        Thu, 17 Nov 2016 05:34:02 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18si11455850wmq.97.2016.11.17.05.34.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 17 Nov 2016 05:34:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59066 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1c7MpF-0008Cw-5Z
	for alex.bennee@linaro.org; Thu, 17 Nov 2016 08:34:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c7MiX-0004EW-B5
	for qemu-arm@nongnu.org; Thu, 17 Nov 2016 08:27:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1c7MiU-00006p-2w
	for qemu-arm@nongnu.org; Thu, 17 Nov 2016 08:27:05 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52986)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>)
	id 1c7MiT-00006H-Tp; Thu, 17 Nov 2016 08:27:02 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 23876804E0;
	Thu, 17 Nov 2016 13:27:01 +0000 (UTC)
Received: from localhost (ovpn-116-133.phx2.redhat.com [10.3.116.133])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uAHDR0RT010550; Thu, 17 Nov 2016 08:27:00 -0500
Date: Thu, 17 Nov 2016 11:26:59 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20161117132659.GT5057@thinpad.lan.raisama.net>
References: <1479320499-29818-1-git-send-email-ehabkost@redhat.com>
	<87y40ijn6p.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y40ijn6p.fsf@dusky.pond.sub.org>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.7.0 (2016-08-17)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 17 Nov 2016 13:27:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.9] qmp: Report QOM type
 name on query-cpu-definitions
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
Cc: Peter Maydell <peter.maydell@linaro.org>, libvir-list@redhat.com,
	qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	David Gibson <dgibson@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Jiri Denemark <jdenemar@redhat.com>, Eric Blake <eblake@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qxg5w5vMR6zl

On Thu, Nov 17, 2016 at 01:38:54PM +0100, Markus Armbruster wrote:
[...]
> A bit sad that the QOM type name needs to be computed in
> target-dependent code.

I plan to provide a generic implementation of
query-cpu-definitions later, to fix this.

> 
> With Eric's doc fix:
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Thanks!

-- 
Eduardo
