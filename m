Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5053710wrh;
        Wed, 8 May 2019 09:46:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzpfATzZJ0hH/R5AJcFQWXVK71RsaSV9J19W3SBxd2ooTpBhI9WwVTaCiCvX88MtUQWAbhn
X-Received: by 2002:a1c:9c03:: with SMTP id f3mr3901414wme.67.1557333981376;
        Wed, 08 May 2019 09:46:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557333981; cv=none;
        d=google.com; s=arc-20160816;
        b=wGTTBtVs06w2voUaFWgteSpTr/tTIJXLz7WuDjQ4JchlXcAkSyW54dRxm3txUki0Mm
         oIapAVOQVWSdc/W0FqSK9QES6ZsJwU0QcX9Dij1rEMx2ELN9mBntN9XNkgILDSsYMiuk
         wHtAnBmGQ7pGo0xQlHancXxMgKHgRRHi1lwSVxWOo6JHUq4Wn2wdhl6r1Ya8fh/BaeI2
         yk5XOY5K0EkmkmGUacI5IsSH4gHLdYX18u97E5zYImfXcYLCmFeNIsYEUlxCa6L8Pe+0
         5foyiml1Jy8OETtOsxjd+1bWb1e6/dbY8rFJMKY00lqacs1oMzYnCP8w3dMyB+8bXBa5
         EvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version;
        bh=bZ+tu+/ICtwv8ZZyBrkHfYnbpxIC4jyGZUjz6/c59hQ=;
        b=cgBAcYspM6HQXUnSJ7as27D0trc4j7jDLmMHSeAZhX2EE+0r2IfOwB+Px4MnkvH7wx
         If3bw6ZfdkPjqkedZ97Zq1ClWqQBU903e57qGIqXfGqjxKpiAmvRPzUYLBDNk2oKSSwh
         E8wsJPCsOBThGIO5xrSIzKdQ+zSllwTYQPxgSWxbYs6Zz561QulCLdeN1KtYd4efXuwD
         QNe3hL07COH6OYMvLPmmhyCZJH2uhkEazliB4tq4sffGkNXooIqE8kRNU1Ep4KpyO6eY
         1HFS/qMjE/H4hy4ru51XvBv9shhWpRU1V7GEJJvKqo5g7uES7vyeGln+NYzwqZyibrzP
         i2Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d185si1809356wmf.182.2019.05.08.09.46.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 08 May 2019 09:46:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hOPi0-0006E0-GZ
	for alex.bennee@linaro.org; Wed, 08 May 2019 12:46:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1hOPh7-0006Bt-80
	for qemu-devel@nongnu.org; Wed, 08 May 2019 12:45:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pmathieu@redhat.com>) id 1hOPh5-0004TP-Vx
	for qemu-devel@nongnu.org; Wed, 08 May 2019 12:45:25 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:36823)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pmathieu@redhat.com>) id 1hOPh5-0004Kd-Es
	for qemu-devel@nongnu.org; Wed, 08 May 2019 12:45:23 -0400
Received: by mail-wr1-f67.google.com with SMTP id o4so28108373wra.3
	for <qemu-devel@nongnu.org>; Wed, 08 May 2019 09:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bZ+tu+/ICtwv8ZZyBrkHfYnbpxIC4jyGZUjz6/c59hQ=;
	b=lhtalKcqh8yt2AUJy7dIVjx+zGdmIfZC4deNrwAgiaxCDARRtJQVHhxzgbv9Jld/qC
	3SF1+Ew4UHErLpjVZ2fyuZwnox7TmeCQWkKSCVmNKOmTw5FeurvQ5j9PdZT1uCRp8T7G
	2jWMpV6VdU8blueHtBMu3WBfn/kbGbVMBLwbqJiMPhbwpFC9riyFxbgUi9P9QnhRUO90
	h9/tQoRdq1I9K8G4xUULgg0x4mvI5X0mQdjaKl+QzpC7sY51KymOno78MJw+l6sL7ews
	YR0gaWUKYOMAs1cOpHTL5wE17R13gIhTKpM00iWP3w1iLXonrwy6yKI8UwErczM3oP0/
	Cb/Q==
X-Gm-Message-State: APjAAAV//EGPsyBONf8o0CURcxLZTh6cf5OA0i6YPD+kojE9mr+gixXv
	Y+HnTuKn7KRDMswN3DvJdHaYkrcfqsobfK6W/jJ9aA==
X-Received: by 2002:a5d:68cf:: with SMTP id p15mr3973920wrw.105.1557333915495; 
	Wed, 08 May 2019 09:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190507134521.31044-1-thuth@redhat.com>
	<CAFEAcA-j+wQXjPW+puxk=foi2T8O=MzXHtxdWJ6E5P7o89WQSg@mail.gmail.com>
	<c0cda8fc-cc68-eadd-0750-cc9eeca094a4@redhat.com>
	<b93b1eb4-d2ff-67cd-a293-5ceb4db9b957@redhat.com>
In-Reply-To: <b93b1eb4-d2ff-67cd-a293-5ceb4db9b957@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Date: Wed, 8 May 2019 18:45:03 +0200
Message-ID: <CAP+75-XRZ22uhxfLF6uOpjDtKOf_EDC8uGgbu=DgYw-kcBSAGQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.67
Subject: Re: [Qemu-devel] [PULL v2 00/28] Kconfig for Arm machines
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
Cc: qemu-arm <qemu-arm@nongnu.org>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UNZ4RM9UC559

[clicked ctrl+enter too fast]

On Wed, May 8, 2019 at 6:43 PM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
> On 5/8/19 5:33 PM, Thomas Huth wrote:
> > On 08/05/2019 17.09, Peter Maydell wrote:
> >> On Tue, 7 May 2019 at 14:45, Thomas Huth <thuth@redhat.com> wrote:
> >>>
> >>>  Hi Peter,
> >>>
> >>> the following changes since commit a6ae23831b05a11880b40f7d58e332c45a=
6b04f7:
> >>>
> >>>   Merge remote-tracking branch 'remotes/ehabkost/tags/python-next-pul=
l-request' into staging (2019-05-03 15:26:09 +0100)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-07
> >>>
> >>> for you to fetch changes up to 69f879e9fefab9aaf24893fe4ce23e07756d70=
3c:
> >>>
> >>>   hw/arm: Remove hard-enablement of the remaining PCI devices (2019-0=
5-07 15:01:47 +0200)
> >>>
> >>> ----------------------------------------------------------------
> >>> Kconfig settings for the Arm machines
> >>> (v2: Fix the dependency of q35 to AHCI_ICH9 in the second patch)
> >>> ----------------------------------------------------------------
> >>
> >> Hi -- this is still failing in the build test where I 'make clean'
> >
> > Very weird. What is running before the "make clean"? Could you provide
> > me with the content of i386-softmmu/config-devices.mak please?
>
> It worked for me after running 'git fetch --tags', maybe because Thomas
> used the same tag?

Maybe because Thomas used the same tag you are still trying the
previous version?
