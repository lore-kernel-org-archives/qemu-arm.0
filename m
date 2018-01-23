Received: by 10.28.71.27 with SMTP id u27csp4060344wma;
        Tue, 23 Jan 2018 05:40:30 -0800 (PST)
X-Google-Smtp-Source: AH8x227+Vd9O7ok9uWJsMVHbooWLGymC/4uR+7XTlc2cHjJ74HHfRWCSUEXWcUrNIjPujCPLy2pn
X-Received: by 10.37.129.69 with SMTP id j5mr2490216ybm.176.1516714830288;
        Tue, 23 Jan 2018 05:40:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516714830; cv=none;
        d=google.com; s=arc-20160816;
        b=z6ylV6cnpyqC4jOyovWPxTMXFrOHeNLBMvvJgpM7qO/3FsSMFHxgP2MmQEgo/J2ffu
         /OhM4sxucc8btEnd+9rdFWNZdipgehoLCDkDl2p/svpsnf4LQSZFwEVavSZDX5waRtq+
         wUyXLozX+J/xf6aAW+HIwDID3V3nfsTr0HgpEq2NyfRhaogUuWM83+cuqrV2sFy49a+c
         hH3SOyZNJ4DfUvMarEUUDvlGT4AAG+duPCEg06I0/dofme74QFcl8YipWPduJqUXc+c7
         uHmdOiFdqMJdrYWFkR+2GUzUKamNUTMJrB5VPZxRDq71gFyyJpSlqccL16A/6eUS5+Dp
         TYpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:user-agent:content-disposition
         :mime-version:message-id:to:from:date:arc-authentication-results;
        bh=4rRiN25FqWhWCVNd8VRa6A0h1jwUplFs5A3CktdtJSU=;
        b=tunwoxeHTvFXlqPm29o3a6RV9z8OPs4rDVnRlLG6lo/cp9Y8lIqbWzjEONpqXXedGt
         MPSvhNLELqC64egolIBaRFP/qDuq56WabgOsJWu2gE4hRyP5nHwLq4KiT9DEN5DDvb6G
         sSo6ze09mR2ySpVyBZJxx5o9Sb/vZoIk4gJdKh3vMRQWxBTKWu5TWQVZfvXMIifUvrtt
         CSM0SkO0VBSgACRXPBbKyDwOfWDAyqdmIG67rJGijItC5LmvJgw2bBYV5cu1T2e7zUeD
         1O/oWXwB28GZG8IP4kkgnTCEm163SD1JCnsLEoeIW6NFqAwl+vx1KPdp7kDkpoP4yaeD
         OGxA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v11si724245ybi.694.2018.01.23.05.40.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 05:40:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:58734 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1edyoP-0007RA-LU
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 08:40:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58370)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1edxKr-00008d-Pn
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 07:05:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agx@sigxcpu.org>) id 1edxKo-0001YL-Lb
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 07:05:53 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:39013)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <agx@sigxcpu.org>) id 1edxKo-0001Wu-7z
	for qemu-arm@nongnu.org; Tue, 23 Jan 2018 07:05:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by honk.sigxcpu.org (Postfix) with ESMTP id 197E0FB03
	for <qemu-arm@nongnu.org>; Tue, 23 Jan 2018 13:05:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
	by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hmbwXLVsywLO for <qemu-arm@nongnu.org>;
	Tue, 23 Jan 2018 13:05:44 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
	id 8BC0842242; Tue, 23 Jan 2018 13:05:41 +0100 (CET)
Date: Tue, 23 Jan 2018 13:05:41 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: qemu-arm@nongnu.org
Message-ID: <20180123120541.GA14216@bogon.m.sigxcpu.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="9jxsPFA5p3P2qPhR"
Content-Disposition: inline
User-Agent: Mutt/1.9.2 (2017-12-15)
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 24.134.29.49
X-Mailman-Approved-At: Tue, 23 Jan 2018 08:40:16 -0500
Subject: [Qemu-arm] recvfrom error with linux-user emulating armhf on aarch64
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CcvZlfhKgljT


--9jxsPFA5p3P2qPhR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,
Running the attached program=E2=81=B0 in a armhf chroot on a arm64 host=C2=
=B9 like:

    chroot . /usr/bin/qemu-arm-static tmp/nl-bad-addr

fails with "Bad address" when invoking audit_log_acct_message. strace loo=
ks like:

  [..snip..]
  31572 socket(AF_NETLINK, SOCK_RAW, NETLINK_AUDIT) =3D 3
  ...
  31572 sendto(3, {{len=3D124, type=3D0x454 /* NLMSG_??? */, flags=3DNLM_=
F_REQUEST|NLM_F_ACK, seq=3D1, pid=3D0}, "op=3Dtest:message acct=3D\"?\" e=
xe=3D\"/tmp/nl-bad-addr\" hostname=3Dlocalhost addr=3D? terminal=3D/dev/p=
ts/2 res=3Dsuccess\0\0\0"}, 124, 0, 0xfffffa3897d0, 0) =3D 124
  31572 ppoll([{fd=3D3, events=3DPOLLIN}], 1, {tv_sec=3D0, tv_nsec=3D5000=
00000}, NULL, 0) =3D 1 ([{fd=3D3, revents=3DPOLLIN}], left {tv_sec=3D0, t=
v_nsec=3D499993180})
  31572 recvfrom(3, 0x112a50eb4, 8988, MSG_PEEK|MSG_DONTWAIT, 0xfffffa389=
7e0, 0x42) =3D -1 EFAULT (Bad address)
  [..snip..]

And it fails in

   ret =3D get_errno(safe_recvfrom(fd, host_msg, len, flags,
                                      addr, &addrlen));

in linux-user/syscall.c:do_recvfrom but I have no idea yet what causes th=
is.

However the same works without problems when the host is a x86_64 box.
Any pointers in debugging this further would be appreciated.

The issue is also present in qemu master. The overall goal is to get

   qemu-debootstrap --arch armhf buster chroot

to succeed on an aarch64 host as it does on x86_64.
Cheers,
 -- Guido

=E2=81=B9: which is a stripped down testcase for /usr/bin/chfn failing
=C2=B9: the scaleway server this runs on doesn't support armhf.

--9jxsPFA5p3P2qPhR
Content-Type: text/x-csrc; charset=us-ascii
Content-Disposition: attachment; filename="audit.c"

// gcc -Wall -O2 audit.c -laudit

#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#include <libaudit.h>


void err(const char* str)
{
  fprintf(stderr, "%s\n", str);
  exit(1);
}

int main()
{
  int audit_fd, rc;
  audit_fd = audit_open();

  if (audit_fd < 0)
      err("audit_open");
    
  rc = audit_log_acct_message (audit_fd, AUDIT_USER_CHAUTHTOK, NULL, "test:message",
                              "?", -1, "localhost", NULL, "/dev/pts/2", 1);
  if (rc < 0)
     err("audit_log_acct_message");

  audit_close(audit_fd);
  return 0;
}


--9jxsPFA5p3P2qPhR--
