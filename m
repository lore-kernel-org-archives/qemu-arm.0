Received: by 10.182.158.201 with SMTP id ww9csp1849672obb;
        Sat, 19 Dec 2015 11:08:57 -0800 (PST)
X-Received: by 10.140.233.67 with SMTP id e64mr15306494qhc.42.1450552137352;
        Sat, 19 Dec 2015 11:08:57 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s44si22393374qgd.17.2015.12.19.11.08.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 19 Dec 2015 11:08:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38325 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aAMsD-0008E8-02
	for alex.bennee@linaro.org; Sat, 19 Dec 2015 14:08:57 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1aAMru-0007xI-M7
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 14:08:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>) id 1aAMrt-0001Vk-VX
	for qemu-devel@nongnu.org; Sat, 19 Dec 2015 14:08:38 -0500
Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233]:32948)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <chrisfriedt@gmail.com>)
	id 1aAMrt-0001Vg-Q0; Sat, 19 Dec 2015 14:08:37 -0500
Received: by mail-oi0-x233.google.com with SMTP id y66so75134135oig.0;
	Sat, 19 Dec 2015 11:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=TSFoSPB3xRYGkaxotnAPPRpk/sjIMNntmDiTHJyS4Yw=;
	b=eXKfRyFC6/0KuxyTMyTYbie5CBdIBAiVg38SSop6inblPTRQSB1C91XndPDod1r8nN
	GBmJlNrxmQhffiYQNuok+mYQTE/GaJiYmzp9F3ymx7GHJaPPgeDj1x6fv/H8WYfUwB7x
	tNUxQYh2fdufl8Qm6y96cwIF3Mb1hapoukSSdSmdzD2vNpPan5LNKswsbLLynGFz/cAG
	yY/fpYkYNrkjuAd6SD8YjQ7YwiN32k+UWECVYIvsMvRfCZhXjMqwoH0uD8g97QB4o6MR
	ov2PtRWdt8ETSJx8SNVoeD5fyFmVY7vgb1nHb78Ye7vOBqzWYcZAYCBy6Guj359auzE1
	PIdQ==
X-Received: by 10.202.223.198 with SMTP id w189mr4222103oig.38.1450552117076; 
	Sat, 19 Dec 2015 11:08:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.69.69 with HTTP; Sat, 19 Dec 2015 11:08:17 -0800 (PST)
In-Reply-To: <1449101933-24928-9-git-send-email-mdavidsaver@gmail.com>
References: <1449101933-24928-1-git-send-email-mdavidsaver@gmail.com>
	<1449101933-24928-9-git-send-email-mdavidsaver@gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Sat, 19 Dec 2015 14:08:17 -0500
Message-ID: <CAF4BF-SHKWWCZT_uEV39-YphhwVSUqwQpM6UKckUPTe8JAtZ=A@mail.gmail.com>
To: Michael Davidsaver <mdavidsaver@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::233
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Peter Crosthwaite <crosthwaitepeter@gmail.com>,
	qemu-arm@nongnu.org, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-devel] [PATCH v2 08/26] armv7m: rewrite NVIC
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
X-TUID: i29DEzRcMZz/

On Wed, Dec 2, 2015 at 7:18 PM, Michael Davidsaver
<mdavidsaver@gmail.com> wrote:
> Expand the NVIC to fully support -M priorities and masking.

Wow - this whole patch series is quite impressive. I was just about to
start doing a MemManage implementation when I saw this and some
previous posts on the topic.

Michael, I've previously written an emulator that covers v6M & v7M
(unfortunately no DSP or floating point - yet). Do you have a branch
in github that I could track?

I'm sure I could be of some use for feedback and to help get your
patchset accepted.

Thanks,

C
