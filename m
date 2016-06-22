Received: by 10.25.21.96 with SMTP id l93csp2471105lfi;
        Wed, 22 Jun 2016 06:28:39 -0700 (PDT)
X-Received: by 10.55.81.70 with SMTP id f67mr37992538qkb.173.1466602119513;
        Wed, 22 Jun 2016 06:28:39 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j53si4501537qtj.9.2016.06.22.06.28.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Jun 2016 06:28:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58336 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bFiCs-0006mj-PJ
	for alex.bennee@linaro.org; Wed, 22 Jun 2016 09:28:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56099)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bFhes-0006Uu-Lm
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:53:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bFher-0008Uq-Ef
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:53:30 -0400
Received: from mail-vk0-x22b.google.com ([2607:f8b0:400c:c05::22b]:33431)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kevin.zhao@linaro.org>) id 1bFher-0008Ug-4H
	for qemu-devel@nongnu.org; Wed, 22 Jun 2016 08:53:29 -0400
Received: by mail-vk0-x22b.google.com with SMTP id d185so60441296vkg.0
	for <qemu-devel@nongnu.org>; Wed, 22 Jun 2016 05:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a5HXH3pgAwIN+Cth+IyFlRMN+j7GfTDXGGuyc76YYe0=;
	b=V36TMeYFxjZJ6iDm3Y0DUCgbRYS7hcLA3pX0qD3SDQ/kl/6WsQhiRPQxOhNTmyamk3
	PkfilQ8HCFlDmOymH+8HWRNY3JZtYBR2PHCCx6//FyO7zq49BGwM3Pb5Xw44o3ORRhOe
	+Fg1AwTycbgownTBVsdD8TO6eXPW5Eku6/8JI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a5HXH3pgAwIN+Cth+IyFlRMN+j7GfTDXGGuyc76YYe0=;
	b=GGnrn/zCS+MYLdn4pG8YQ+BqJ318rgG5ZbkU9NkDJZfJlQ+6YtsucBCEN0RYP/TUUi
	fwwSRSTe/MFFBRlAcseGMvZf0dVyx5Py10XKsOJXSsVl4nEqKw52fT29LhgBsbEz+Q04
	clKlcxN+667q6OAeAFptGPuHoCRbCX3r5bXynA5t2EGPLuJseCX2keka9O2NkBmxAg8W
	FDjFcm+zipGaUaN109+x3QuEjuqxkNuDTm67Nae2zL1UD14M5xp1p/CjwDfE63Q4FHVm
	907achGGj7lL8qK02FP3STrh3KyhChjZqVlAGo0BeFzd7x04s9G0svbuwRjI7PoIumas
	gMiA==
X-Gm-Message-State: ALyK8tKPi1AukvzDZ1YpAk8N8w7bScYWaopvYsAAnYDf0slG95aCygRObSIbWidv5WXKESdot/DLNDlc1u2bFheJ
X-Received: by 10.31.153.139 with SMTP id b133mr11849649vke.64.1466600008645; 
	Wed, 22 Jun 2016 05:53:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.68.228 with HTTP; Wed, 22 Jun 2016 05:53:28 -0700 (PDT)
In-Reply-To: <20160622120821.GH2274@work-vm>
References: <CAN76PtRzf2qAwkMi9PMCUCaUha+6EpFnA_TiBB_oWLVFEQ8yyw@mail.gmail.com>
	<20160622120821.GH2274@work-vm>
From: Kevin Zhao <kevin.zhao@linaro.org>
Date: Wed, 22 Jun 2016 20:53:28 +0800
Message-ID: <CAN76PtQWoEssNwA4Xuu+fyjTqkDy33eQ_YOLsT3RizhwhUppqA@mail.gmail.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22b
Content-Type: text/plain; charset=UTF-8
X-Content-Filtered-By: Mailman/MimeDel 2.1.21
Subject: Re: [Qemu-devel] Question about a qemu Aarch64 error when adding
 several SCSI disks
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1Yvx44NKPbS5

Hi David,
    Thanks for your advice. In this condition, there are  more than 1
virtio-scsi controllers for the guests will induce this error.
    I'm not familiar with Qemu development.  I will try to rebuild it and
get more debug info.
    Thanks~


On 22 June 2016 at 20:08, Dr. David Alan Gilbert <dgilbert@redhat.com>
wrote:

> * Kevin Zhao (kevin.zhao@linaro.org) wrote:
> > Hi All,
> >        Greetings from Linaro. This is Kevin from Linaro, and recently I
> > have met a problem of qemu-system-aarch64 when I am working on
> virt-manager.
> >        I have reported a bug here:
> > https://bugs.launchpad.net/qemu/+bug/1594239
> >
> >        It's mainly bout adding several SCSI disks to Aarch64 guests.
> >        If you have a moment, pls kindly give some advice about
> this.Thanks.
>
> Hi Kevin,
>   The assert you've got there really should not happen:
>
>  starting domain: internal error: process exited while connecting to
> monitor: qemu-system-aarch64:
> /build/qemu-zxCwKP/qemu-2.5+dfsg/migration/savevm.c:620:
> vmstate_register_with_alias_id: Assertion `!se->compat || se->instance_id
> == 0' failed.
>
> I've only seen that error once before, and that was when the
> device had a really long device path (lots and lots of PCI bridges)
> but you've not got that.
>
> Can you get a full backtrace from that?
> If you can rebuild it and debug then adding some
> prints into vmstate_register_with_alias_id should help, in particular
> if you can print the name that qdev_get-dev_path returns it would
> be good and also the vmsd->name value.
>
> Dave
>
> --
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
>
