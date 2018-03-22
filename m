Received: by 10.28.71.155 with SMTP id m27csp618847wmi;
        Thu, 22 Mar 2018 10:27:56 -0700 (PDT)
X-Google-Smtp-Source: AG47ELtLN19DfZRV7vZU+90j0jhguSlXAH+DNZ7PjrCs2K2p43WF1CoyURGDpYKEUX0aBZ1c6bka
X-Received: by 10.55.145.70 with SMTP id t67mr35332616qkd.114.1521739676609;
        Thu, 22 Mar 2018 10:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521739676; cv=none;
        d=google.com; s=arc-20160816;
        b=p3kStDy/UoDmwhcc3Uqt2m7qKd+b1cCOLwn7g6GJgpjemQwDa+LMgPZZH7vfxga5CY
         PmWmvc5bYz1ayEwH4xLba5Cdu1DiCooU/waQHpcGNBzrWLdaBBaoN2NVYbPSSF8nX/bJ
         kj2NUnykiN6gkrlLeXpvJ8IwM6bMhHqPm03l07m6E5CngEZyCmgl96DuZYz4R5wSE+ab
         NgmYf80w+48egM281//vkgiXle+dGVCxJ3eMJ3pLtuWkidjjfOYNtH8z97hEdDqXbSZn
         +BYqE0/1w8BSZE8cXdor4rYr3FaeWeHyb3LnIkPDSdbxHUMSrSy8gyylq3tJrrlhr+FY
         l8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=zZ45YUQBXpXDewsgbNgQ7duZnSkv0sLfWA63ALPNlSQ=;
        b=IA49R62B4MX8xIoSjNMGxmlOaGQr7UugDwroa0ToGrs1lK0qj4hra44w5hc6dc/Dio
         CX8b+4b6QIOycqqxZBsYlTy+0VE8dLhgJ99yR3MKpTc6THUqcxUh5whP4rJd1Trl0Iej
         kZp195m1baZV4cDFFNLqpsTDG+agxVyyb+ds5OigWPU1ZuI94t+RELMoJtYjtIedjZGO
         IIq8wRQnLrbhj4EaoTGqMN+ztFTDkH7gGKGTPRIfGW6DoaKg3ZSy72ZWT3okKWdLsPSb
         v2Pd16+HiLPkkgUh794uOCQk9OF56rP6EZA6Ivt0R7rlWkfG9zFet06CZ2WUuLjs7c4T
         UYqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cRP772+l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m70si1196347qkm.391.2018.03.22.10.27.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Mar 2018 10:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cRP772+l;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:33910 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ez40K-0001PC-5U
	for alex.bennee@linaro.org; Thu, 22 Mar 2018 13:27:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3zF-0000tu-SS
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 13:26:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jcmvbkbc@gmail.com>) id 1ez3zF-0003WP-2O
	for qemu-devel@nongnu.org; Thu, 22 Mar 2018 13:26:49 -0400
Received: from mail-yw0-x241.google.com ([2607:f8b0:4002:c05::241]:36605)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jcmvbkbc@gmail.com>)
	id 1ez3zE-0003WB-TN; Thu, 22 Mar 2018 13:26:48 -0400
Received: by mail-yw0-x241.google.com with SMTP id y64so3086097ywa.3;
	Thu, 22 Mar 2018 10:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zZ45YUQBXpXDewsgbNgQ7duZnSkv0sLfWA63ALPNlSQ=;
	b=cRP772+lCNT1yNukrT2yVSA/UJ8somw54HIXVG4t5U4iKRMvU61bZ8Q5sLN3L/saU8
	CePpQ7Z4G7s9dJSJYaxHttoOBWyCmHlKPYypcY/rNsD4edfurJTgiuZbaVBTzGSn1dcb
	U7NwwMCIbpL4F19n/2/ksWO1cwWH2AlSDM/2GIB4fpyHAamWI7LQxUw91G109HILGfK9
	/9dPQX6prnDWlTxwKqeLtavS0ca7m8EeswMKaxpi9HMfw2r0lkbtCujWxRjS+rhG1DPr
	mytguFBSHBoYU6cGHQvz3yPccYEBgqahHVNH5OUHa39brZaD6bqy4+m4tWvFs3jdA3w5
	Hi9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zZ45YUQBXpXDewsgbNgQ7duZnSkv0sLfWA63ALPNlSQ=;
	b=luo+besK5cN95z3OE8d5gQkMWLYBsJzzwkBytK04wAz4dMpv/b4Gr8a8se1fa7JEaF
	8Lz1X3AOGO7a1L3x2V0vKUmnaLSf8GNvq0VpbD6ZjBOTmDSQoJNSJsvbmuWjA8BPKVEb
	xSp+gdmqLVXlDbT796wFa0ASR3JssHPNrRXVpKZhsbTyiQZsVUx8bGqQQKVacH8EFHAs
	QqN8iyK77mB50hYa3+AHsW+WziPC0EoDSJJka1D3qAyZAfqAyAfTc+W7UiasKHEUb2wT
	Z/eEJHxthMz/DqG+KuwbcdcBprpSZU+m3NmeYFumTIcjpm78UcZSkb40gYWbl6+L5lxG
	eQhA==
X-Gm-Message-State: AElRT7HGg2ZvkzuyRRmBw+xaUXRdlNctXwtWnwKF4goECXLz67/G1g1z
	8oJsDFGCALGULc0DuwAtWzLV5pM+QqFL6iz187Q=
X-Received: by 10.129.83.215 with SMTP id h206mr15615001ywb.388.1521739608277; 
	Thu, 22 Mar 2018 10:26:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:b047:0:0:0:0:0 with HTTP; Thu, 22 Mar 2018 10:26:47
	-0700 (PDT)
In-Reply-To: <CAFEAcA8iVaYmnCgQ9-2D=3w_sf6Zs_oAvXBDPL3KVBpomA3PxQ@mail.gmail.com>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-5-lvivier@redhat.com>
	<CAMo8BfKkwM0wzX1yCBvwJ-Av4SZbgSrxmOGzD+Z_+bY0DTcgYg@mail.gmail.com>
	<6fd26097-aa7e-38cf-0d9e-09d0d36bd88b@redhat.com>
	<CAMo8Bf+K_XCsZ2tLVT15v5v0ssEbGSmYj+HuT-x5UMYZTKBZ4Q@mail.gmail.com>
	<CAFEAcA8iVaYmnCgQ9-2D=3w_sf6Zs_oAvXBDPL3KVBpomA3PxQ@mail.gmail.com>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 22 Mar 2018 10:26:47 -0700
Message-ID: <CAMo8BfJc9A9bJoNHs3wT1jmVyDkRKXxm6NV3OPJ0hXC-qpbWUg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c05::241
Subject: Re: [Qemu-devel] [PATCH 4/4] Remove unnecessary variables for
 function return value
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
	Yongbok Kim <yongbok.kim@mips.com>, Alberto Garcia <berto@igalia.com>,
	Qemu-block <qemu-block@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Alexander Graf <agraf@suse.de>, David Gibson <david@gibson.dropbear.id.au>,
	Laurent Vivier <lvivier@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Richard Henderson <rth@twiddle.net>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Max Reitz <mreitz@redhat.com>, qemu-ppc <qemu-ppc@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zo/pT4FuZnLA

On Thu, Mar 22, 2018 at 10:23 AM, Peter Maydell
<peter.maydell@linaro.org> wrote:
> On 22 March 2018 at 17:19, Max Filippov <jcmvbkbc@gmail.com> wrote:
>> Ok, I can add a fixup that changes #include <xtensa-isa.h> to #include
>> "xtensa-isa.h".
>> Adding #include "qemu/osdep.h" there seems pointless to me.
>
> Every top level .c file must start with including osdep.h.
> Other headers that it might include rely on that.
> It looks like these files aren't actually top level .c files,
> but are only compiled by being #included from some other file.
> Our convention for that kind of thing is to give the file
> a .inc.c extension. If you follow that then clean-includes
> will skip the file rather than trying to apply the requirements
> for a top level .c file to it.

Ok, thanks. Will do that too.

-- 
Thanks.
-- Max
