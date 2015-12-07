Received: by 10.182.158.201 with SMTP id ww9csp2117890obb;
        Sun, 6 Dec 2015 22:36:57 -0800 (PST)
X-Received: by 10.140.31.73 with SMTP id e67mr35166636qge.46.1449470217429;
        Sun, 06 Dec 2015 22:36:57 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 53si22626323qgc.0.2015.12.06.22.36.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 06 Dec 2015 22:36:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a5pPt-0006Vs-4C
	for alex.bennee@linaro.org; Mon, 07 Dec 2015 01:36:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a5pPX-0005zS-Iw
	for qemu-devel@nongnu.org; Mon, 07 Dec 2015 01:36:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1a5pPW-0006gH-Lh
	for qemu-devel@nongnu.org; Mon, 07 Dec 2015 01:36:35 -0500
Received: from mail-wm0-x232.google.com ([2a00:1450:400c:c09::232]:34309)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1a5pPW-0006gC-F6; Mon, 07 Dec 2015 01:36:34 -0500
Received: by wmvv187 with SMTP id v187so151243997wmv.1;
	Sun, 06 Dec 2015 22:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Zx/bqBxRRKf7qk+fs7ZtcGLQmVdXAtkAy5LWvp884MI=;
	b=0bRBrL5ymmLWndQ8MdPkPwzLqS+JwZK9bIPzGfmnRy85gbA7xSYUvgTzB7crJcvG90
	opeYyfFVjJQFjZ0GUsn4wC0dbnmR3vipvlY7sGX3t6V1xPLQpgI2szQFcAChnMbpFZ8N
	/54pDvuQW7q9UuzQz6bkgE7gHRV3QRMCKRp6Oe3NCdC1qd2ajnjsWEDIhj+7z8thAK/m
	eHJQOA2q9Pl06HgquMMwxy3zEnTpLoYdIRn1QZTCz1jH7oC8z6xRK++0Iyn75HpU3Np1
	NADG3J9i2r+axIhPeiSzt1Wp4temJZw0QaJU4y1X9XNU1uRpA4/8GSbs87PI6nmE2lRI
	osvQ==
MIME-Version: 1.0
X-Received: by 10.194.120.226 with SMTP id lf2mr30712045wjb.108.1449470193921; 
	Sun, 06 Dec 2015 22:36:33 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Sun, 6 Dec 2015 22:36:33 -0800 (PST)
In-Reply-To: <1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
References: <1449187263-4604-1-git-send-email-Andrew.Baumann@microsoft.com>
	<1449208887-9564-1-git-send-email-Andrew.Baumann@microsoft.com>
Date: Sun, 6 Dec 2015 22:36:33 -0800
Message-ID: <CAPokK=rSRXiGdZK-J+-1wvP9in+WC7pGcPTfEe5p1VzbhYj58g@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::232
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] [PATCH 1/8] bcm2835_sbm: add BCM2835 mailboxes
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
X-TUID: wHR4TIJ2qH92

On Thu, Dec 3, 2015 at 10:01 PM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> This adds the system mailboxes which are used to communicate with a
> number of GPU peripherals on Pi/Pi2.
>

Are there any publically available specs for this? I found the
peripheral manual which documents the interrupts controller but I
couldnt easily find a doc to cover this. I can review without docs,
but it is a little harder. A few top level sentances about how it
works and what it does would help in commit message if we can't get a
doc.

Regards,
Peter

> Signed-off-by: Andrew Baumann <Andrew.Baumann@microsoft.com>
> ---
