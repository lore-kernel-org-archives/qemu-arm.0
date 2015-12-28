Received: by 10.182.158.201 with SMTP id ww9csp6502154obb;
        Sun, 27 Dec 2015 17:55:16 -0800 (PST)
X-Received: by 10.140.91.73 with SMTP id y67mr66511266qgd.42.1451267716554;
        Sun, 27 Dec 2015 17:55:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w80si2765579qhw.30.2015.12.27.17.55.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 27 Dec 2015 17:55:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:43320 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aDN1o-0001Gy-7z
	for alex.bennee@linaro.org; Sun, 27 Dec 2015 20:55:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55325)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1aDN1l-0001Gd-GF
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 20:55:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>) id 1aDN1i-0005NX-99
	for qemu-arm@nongnu.org; Sun, 27 Dec 2015 20:55:13 -0500
Received: from mail-qg0-x235.google.com ([2607:f8b0:400d:c04::235]:34797)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mdavidsaver@gmail.com>)
	id 1aDN1i-0005NR-5Q; Sun, 27 Dec 2015 20:55:10 -0500
Received: by mail-qg0-x235.google.com with SMTP id 6so61456298qgy.1;
	Sun, 27 Dec 2015 17:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=kt4KwZ2+G8ohOfm9/ifpCPyQvviCbg2yoII0COPXSHo=;
	b=kWdSalmqgH0/s/83BhCeDM7lpl94hqTRP/P+vnIBY8zwhG6iv4JwWaILyhAcY1b61t
	hJxyuviiZmadcaHehhimVdUUuzuXXcOhueXX1ioFtTctpKtM2PJKNNo6SVJ9xUPVGreb
	1WIa0kCaan37nUgp8nq8VhS89N9v5MErSmFoRx3TI2EJPMerXVuaUP6cvV64Q8pAQqEm
	2gmFtA5xmbS8DGc3dMJ7rWIPuH29O4ciK9FFqNlU6C4JiYMkkE+XVKXIDBBTljfDWjxP
	2XFynXGjTnRPbNKXf1Dokza/e/MwCJovS4hwKg+g+QxSsxXbYi5iMsKEP1joqDbjQ43n
	wn6Q==
X-Received: by 10.140.109.247 with SMTP id l110mr11753283qgf.52.1451267709793; 
	Sun, 27 Dec 2015 17:55:09 -0800 (PST)
Received: from [10.0.1.200] (ool-182df582.dyn.optonline.net. [24.45.245.130])
	by smtp.gmail.com with ESMTPSA id
	q66sm7540297qhb.31.2015.12.27.17.55.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 27 Dec 2015 17:55:09 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-3-git-send-email-mdavidsaver@gmail.com>
	<CAFEAcA90sBFurRv6rbDEP7Q-qEy2PrpH7BgHVFOt15ZDfk68NQ@mail.gmail.com>
From: Michael Davidsaver <mdavidsaver@gmail.com>
Message-ID: <56809677.5080003@gmail.com>
Date: Sun, 27 Dec 2015 20:55:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA90sBFurRv6rbDEP7Q-qEy2PrpH7BgHVFOt15ZDfk68NQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c04::235
Cc: Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH v2 02/26] armv7m: Undo armv7m.hack
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
X-TUID: DNsl+jEHqd7a

On 12/17/2015 10:38 AM, Peter Maydell wrote:
> We could use a comment here (a) explaining what we're doing and (b)
> mentioning that this isn't architecturally correct -- ideally we should
> catch these exception exits on execution of the jump insn, not by
> letting the jump execute and then trapping when we actually try to
> execute at the magic addresses.

I had an instructive little digression to investigate doing things the
"right way" (in tcg).  I can see how it would be done by adding a
conditional every time the PC could be updated.  To me the unassigned
handler trick/hack seems simpler (less likely to add a bug) and avoids
emitting more code for every ldm/pop instruction.

