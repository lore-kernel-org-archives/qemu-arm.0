Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3924912wrx;
        Tue, 16 Apr 2019 06:25:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzD62QaxNnocLkCPz0b0EjrBg8D4PpQtzfcthJKBTd+8tMMzNF6bI3uYQ3+N/eOf7Y/RBAE
X-Received: by 2002:a1c:720a:: with SMTP id n10mr25732617wmc.107.1555421110621;
        Tue, 16 Apr 2019 06:25:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555421110; cv=none;
        d=google.com; s=arc-20160816;
        b=ns54E6Pre+dLF024I/ZDqCDH60mu72RJkZB3i0sPmNawdhYTbW0NWCbGQIUFRL4ndj
         iKkQEufTsS/9hmnSFw0mO9H0HNr946ckbYQadC5Qp/JfYh1CVQULwaiJprv/9vs2NIXo
         pVFo50Pa7ajnDXfaHyMdafDaWJ+EnbioXiXWlY64Lef1OeJmHcY6Fzn5wm+PtFVfgcQR
         3n3kb08KgPekUvx39VDUM+9vrnlG0NeQZAQDOCxz/ARI1OfE6UN6mOEz6WN4JnO27eMx
         H+cBLX5ymDB6/3aMgC/fGtvcMpRyn80XWoaojcfDRmlddG2Np5BJOYgCJjGeFbdS8z2r
         Oyjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=hh0ZPxOKeSeyN7YuFh7x4B2S24u9ez/mPUNSIzcUnLk=;
        b=TbMz+YZh5gts/kDL6QEoBVxZg3TA/UYkYd9npXZmbt3ekOsfw1AqsAyhe6PyJOzLVQ
         yiLmrQk0aBQpRaqsaikV622k4rN+OWVrA9Ufbo7s1Apg2fqddlbxk0r4R2y/zDS9Tvz4
         QfLSrQbPd5Lz4Jp9XJ+kFnN0CrXLOh3XlBDZ39/SHFzfu/qdIBNrvyESgeN58E+E1hco
         6/ArbLNhVe+tIt0jFcOwpV7jmRLAmX/c+0Ng7qW5pRiuhHYd6MiNcKwJfX9VyEeldEfN
         e5ZOATFPWmIW9NG42urp3iqb/+VpkoBacEGWQS3snrTYyvnY1/XDgu4j2EXu8aCdoRhA
         9Rbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pJNejMZl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n18si35342328wru.187.2019.04.16.06.25.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 06:25:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pJNejMZl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36772 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGO5F-0000ul-Mu
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 09:25:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNjT-00009r-Cj
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 09:02:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNjS-0004Vz-95
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 09:02:39 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35006)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNjS-0004VK-21
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 09:02:38 -0400
Received: by mail-ot1-x342.google.com with SMTP id m10so17517320otp.2
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 06:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hh0ZPxOKeSeyN7YuFh7x4B2S24u9ez/mPUNSIzcUnLk=;
	b=pJNejMZlZYmUFKuuP68RMGGErMf4jt7GbjaCoLe716ze2GYYU8pr0gnInrq3HWAMZR
	bCYt6nmXzYN5O3rs9rPvMk4jEUOS2QnF7jerTjLIJ+UhuNOsdZmLbPDj332zQH+gYc3a
	ouEyjVkVVZls3uwsLeJ/a+B/HNuOxfDjuIDFuyMcjSRcVvGPVCMCgK7M/I60A0X7Cqh4
	4+Aa7eHPZeffciUtA1/M/jMcGSYZv35dZxI0Ye7sXHpTn/rtTWJtbYDxtaEa4wbghFEp
	Dx2immZblnwyBWq+V3jQ42o8ZSu11ecFST9f6kOLsxrZ8zHV3CWetq/hBTq2TXXC4rPJ
	4gHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hh0ZPxOKeSeyN7YuFh7x4B2S24u9ez/mPUNSIzcUnLk=;
	b=GnS0q+DHEwTKXIdimJFXMtBejN0PNUrjosmHUQTszXBxvM1V5oNlDCFyOSv/4s7Lm0
	Q5M8NbWKfWqRPzqaFYhJolGJBCRXeulG0uD0xDOHkvo/Y/U5aJjscBKWYRWqhjmCL/C5
	SWFDI8Yc4sxH9oGCoAg6F/EGIfKIOPUocTYEftzn1s1ngnxowCJYcwNC/a859ahhII86
	lLtn4euo2i6ybVCyVPHarYQzbBj1wekTN5CjMqV+oqpTniozNIGemeK7njFL5i6+E3ou
	38Gmilds781fwGMHlKPZWAxTRbPNdq9GVtakZRCKyvcHv53IoLhyBBJxSI6PFXoFjAGL
	Bjcw==
X-Gm-Message-State: APjAAAUlMbr4xQeINyDhTjJBIMfuXJV753U4XsetSZx7Q+EwMVItUydn
	3WqZiZ4Sxvj/G43ABO53wrSxfNGVvpXV47tGLeVLPQ==
X-Received: by 2002:a9d:3b44:: with SMTP id z62mr52959129otb.319.1555419755535;
	Tue, 16 Apr 2019 06:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <CANY2w+3iU1m9exqE2qMJj+OXcHThm2Q3jxFdDn9FWwKC6JhKUg@mail.gmail.com>
	<CAFEAcA9B-7j9ws-vaChqx1uZOA_QDzQYPixNeGDmonLXeZ9vNQ@mail.gmail.com>
	<CANY2w+0ZULuVgJTu3M+--rC01biqS=y1V4tAbgjHfyKRd6X79A@mail.gmail.com>
	<CAFEAcA9zP8OateFNU+Ea1thk4NkYgcee5ykEscaguC=hAhXfag@mail.gmail.com>
	<CANY2w+3qJgQ_HVai6trQ_gDXxPLruj1-L6LaTkcUZQbtQBofpg@mail.gmail.com>
In-Reply-To: <CANY2w+3qJgQ_HVai6trQ_gDXxPLruj1-L6LaTkcUZQbtQBofpg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Apr 2019 14:02:23 +0100
Message-ID: <CAFEAcA9gciZ3_zY-XMoC8o0P4ffvHhC0w=ZDA6biXyovx_H2cQ@mail.gmail.com>
To: Da Zhang <daz3@vt.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] Ubuntu installation shows "No network interfaces
 detected"
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
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-discuss <qemu-discuss@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2GX6qwj1rA56

On Tue, 16 Apr 2019 at 13:53, Da Zhang <daz3@vt.edu> wrote:
>
> The qemu-system-aarch64 options support vda partition for the ubuntu inst=
allation. How to setup the options to support sda partition?
> I was trying to use the image for my gem5 experiment but it gave me "[ en=
d Kernel panic - not syncing: No working init found.  Try passing init=3D o=
ption to kernel. See Linux Documentation/admin-guide/init.rst for guidance.=
". One difference I did notice is that all gem5 disk images (ARM and X86) I=
 used are using /dev/sda. So, I want to try it and see if the problem fixed=
.

You'll get 'sda' if QEMU exposes the disks to the
guest as IDE or SCSI. 'vda' is for virtio block
devices. 'vda' should work so I would recommend
finding out why not rather than getting sidetracked
into a different kind of guest disk setup that might
not work either.

If you post a link to the full boot up log then that
will have enough information to tell whether the problem
is that your guest kernel doesn't have virtio support
built in or if something's wrong with your guest disk image.

thanks
-- PMM
