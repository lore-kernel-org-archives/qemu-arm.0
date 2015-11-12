Received: by 10.182.105.169 with SMTP id gn9csp388538obb;
        Thu, 12 Nov 2015 07:04:32 -0800 (PST)
X-Received: by 10.31.48.150 with SMTP id w144mr3803419vkw.24.1447340672338;
        Thu, 12 Nov 2015 07:04:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j193si2818780vkd.112.2015.11.12.07.04.32
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Thu, 12 Nov 2015 07:04:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZwtQN-0004g2-Pf
	for alex.bennee@linaro.org; Thu, 12 Nov 2015 10:04:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56905)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ZwtQL-0004fx-SQ
	for qemu-arm@nongnu.org; Thu, 12 Nov 2015 10:04:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1ZwtQI-0006sr-J5
	for qemu-arm@nongnu.org; Thu, 12 Nov 2015 10:04:29 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>)
	id 1ZwtQI-0006sU-Dd; Thu, 12 Nov 2015 10:04:26 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 95093A075F;
	Thu, 12 Nov 2015 15:04:25 +0000 (UTC)
Received: from localhost (ovpn-113-159.phx2.redhat.com [10.3.113.159])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tACF4O4e016354; Thu, 12 Nov 2015 10:04:25 -0500
Date: Thu, 12 Nov 2015 13:04:23 -0200
From: Eduardo Habkost <ehabkost@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20151112150423.GJ4180@thinpad.lan.raisama.net>
References: <1447278167-320-1-git-send-email-ehabkost@redhat.com>
	<20151112133747-mutt-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151112133747-mutt-send-email-mst@redhat.com>
X-Fnord: you can see the fnord
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, balrogg@gmail.com,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-arm] [PATCH] nseries: Don't use qemu_hw_version()
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
X-TUID: VsFz/dDZcM6F

On Thu, Nov 12, 2015 at 01:39:24PM +0200, Michael S. Tsirkin wrote:
> On Wed, Nov 11, 2015 at 07:42:47PM -0200, Eduardo Habkost wrote:
> > nseries doesn't use qemu_set_hw_version() and doesn't need the
> > compatibility magic of qemu_hw_version(). Use QEMU_VERSION
> > directly.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> 
> This looks very wrong.
> We should be reducing the users of QEMU_VERSION,
> not adding more.

I would like to hear from the users and maintainers of the
nseries machines, to judge this. I assume they don't need ABI
compatibility betweeen QEMU versions, and maybe they want to know
the QEMU version they are running.

-- 
Eduardo
