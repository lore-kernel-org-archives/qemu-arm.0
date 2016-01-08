Received: by 10.25.134.130 with SMTP id i124csp487403lfd;
        Fri, 8 Jan 2016 06:51:35 -0800 (PST)
X-Received: by 10.140.80.240 with SMTP id c103mr143181634qgd.61.1452264692056;
        Fri, 08 Jan 2016 06:51:32 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a126si16784006qkb.100.2016.01.08.06.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jan 2016 06:51:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36799 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aHYO3-0005xZ-NW
	for alex.bennee@linaro.org; Fri, 08 Jan 2016 09:51:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37494)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aHYNe-0005US-83
	for qemu-devel@nongnu.org; Fri, 08 Jan 2016 09:51:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1aHYNd-0004Pd-9R
	for qemu-devel@nongnu.org; Fri, 08 Jan 2016 09:51:06 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:34332)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1aHYNd-0004PA-2y; Fri, 08 Jan 2016 09:51:05 -0500
Received: by mail-wm0-x244.google.com with SMTP id b14so16405599wmb.1;
	Fri, 08 Jan 2016 06:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ZVzv3aOSBSiXOZrAiQSNqK84xhMSI+eg+h+FwPVita4=;
	b=cDnA4PdcOBCZOaQas21VXgSmJ8YYa8JBUTIS/QSSeEW+6z6k3x1dG1uDetdJdBJz+t
	v68tIjZjSdmXOiepM7Wra0yvZqd+Q2QnNJfo6Inevsv23MJXDEPSdIcIaKVJpO56Gbjy
	x7y+UR9B2t7sb+SUcPu11Z1iiZa/3xIiS7iYCcOHTA5lRPfFSW62ee6CTCrQnAzTmRDB
	qarLeidml+PnG3d5sBAeYdJR28iqCWNeB6zKLc/CNkTI4P6vX/zygvGNDHiqocG5OFNd
	ARyNaTxmQmT08N+wb4roK9R8R783j2fZjdbU5IazUr45zBPNAFRHc/2FldJ5qg4W93C6
	ImEg==
MIME-Version: 1.0
X-Received: by 10.194.112.130 with SMTP id iq2mr107162491wjb.102.1452264664056;
	Fri, 08 Jan 2016 06:51:04 -0800 (PST)
Received: by 10.28.91.143 with HTTP; Fri, 8 Jan 2016 06:51:03 -0800 (PST)
In-Reply-To: <CAFEAcA8U1U67yy6wJErZYUyEEGcqnmGTTeDLbiUqzc7wG3tiPQ@mail.gmail.com>
References: <1449851831-4966-1-git-send-email-peter.maydell@linaro.org>
	<1449851831-4966-5-git-send-email-peter.maydell@linaro.org>
	<20151219213830.GE4164@pcrost-box>
	<CAFEAcA8MKt-dJU5p=w_jOLv4+dFXtHaCHps=51=9ZM49wXesjw@mail.gmail.com>
	<CAPokK=pPvPxLu3fkkz7qA9gahG1Sm2cWJYBYeDgw6A1Q2bfjeQ@mail.gmail.com>
	<CAFEAcA8U1U67yy6wJErZYUyEEGcqnmGTTeDLbiUqzc7wG3tiPQ@mail.gmail.com>
Date: Fri, 8 Jan 2016 06:51:03 -0800
Message-ID: <CAPokK=pyxu1EG_y_cpW1d2Bvohdn76weX9H-1ZSb0DinaaStCQ@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>, Max Reitz <mreitz@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Cc: Kevin O'Connor <kevin@koconnor.net>, Qemu-block <qemu-block@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Patch Tracking <patches@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [Qemu-devel] [PATCH 04/10] hw/sd: Add QOM bus which SD cards
	plug in to
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 4DT4QPII/9az

On Thu, Jan 7, 2016 at 10:09 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 20 December 2015 at 20:51, Peter Crosthwaite
> <crosthwaitepeter@gmail.com> wrote:
>> On Sun, Dec 20, 2015 at 9:10 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
>>> For user-level back compat I think we need to retain "might have
>>> an sdcard object with no block backend, and that means
>>> 'no-card-present'". This is both for the user facing
>>> monitor commands to manipulate the sd card, and also
>>
>> What are the user-facing monitor commands? I tried using "change" and
>> "eject", but they don't seem to work for SD, due to the tray being
>> closed. Has this ever worked in a way that is user manipulatable for
>> SD or is it just to handle the case of unconditional SD card creation
>> (with the card never hotplugging over the system lifetime)?
>
> I investigated this, and it looks like we accidentally broke
> 'change' for SD cards in 2.5 (specifically in commit de2c6c05).
> I think we should fix that regression, which in turn implies that
> we still want to support the "sd card object with no block backend" case.
>

Yes, saw the patches on list. I guess we are stuck with it. It would
be good to do this in a way that supports use of the hotplug API
alongside though, so SDIO device could all be ejected and inserted
with the same way.

Regards,
Peter

> thanks
> -- PMM
