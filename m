Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1183661wrt;
        Wed, 28 Nov 2018 07:35:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X9pyUfL50uZi/u051Y8VZ2ajUVsP+LL+rJKHUVty0Wk8MItkyuZm/KyvBl6rw2L6vhbc8o
X-Received: by 2002:a81:c902:: with SMTP id o2mr32876047ywi.208.1543419300081;
        Wed, 28 Nov 2018 07:35:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543419300; cv=none;
        d=google.com; s=arc-20160816;
        b=S2D2PhI3GDhu3eKO3GTJL7An/i9IYpqPVH9IZZUm9FJta0SP9sxYXE9mIiIsj2HN4P
         0r/J+IWf4cB5UCb1sdenIZmb3FvGgLQ8qu4dqXW7097+MITwx0PlbLFqLboRabw17Y+G
         jzoOq3/fLcOKJjadP+TrFRqQwY9PvS4gcFB+LyDWDuWJwVmbqRmu99pAneoYpXDj2SG3
         Ob/Dr6xt2lDyg+guj0sbo6fCMn8obTglNpu2wTFfzDkh8RmmtKwDxnudlMirF7R8Npp0
         2fDK6x9hg7nVF1W8r7NQR89VGbb7zoUGmVLsHJgcjftKNTCeFcf1IxIHDFC3zLWHLGUi
         E4bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZBJPGynvsZihgruqZuu938OAiVqLyfSP/nzG9JJGVg0=;
        b=iF46/dAf4N8evVlpGAPm4BObPtZCfVB5Y3RncvZ/0xtij5JlDCIB3uvmKuKPDb3+74
         2rlMuX5wLP+aFPoekasdTPBJSqm8A78XeitCw5rIGcGFdBK2haKsN0zGxRc2ICPuySCt
         6fDVZLfOIabIMBDzuWN1XBjynJidGIPRmMXqNKxNkOf2pEwzZxBQM/ehMYRHvVqQEV0+
         t+i+nj1CmUxm02yUON3FzqGZgXb6ArgEy22s/aurIYRLEQ5pmHuxfJBR9pYSqWtNe690
         bRAqMYakhfPlCKDleCC2Ksp+BvRitndO9axPLjjWl1nTUILVWe9bTyuNsdYZzZf0ktND
         mLuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nv1xtrcu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b124-v6si4989331ybc.24.2018.11.28.07.34.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Nov 2018 07:35:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Nv1xtrcu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48349 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gS1rf-0000OJ-DC
	for alex.bennee@linaro.org; Wed, 28 Nov 2018 10:34:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gS1ps-0008CZ-MH
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 10:33:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gS1pr-0004Zj-Df
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 10:33:08 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36993)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gS1pq-0004V7-MW
	for qemu-devel@nongnu.org; Wed, 28 Nov 2018 10:33:06 -0500
Received: by mail-ot1-x343.google.com with SMTP id 40so23877468oth.4
	for <qemu-devel@nongnu.org>; Wed, 28 Nov 2018 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZBJPGynvsZihgruqZuu938OAiVqLyfSP/nzG9JJGVg0=;
	b=Nv1xtrcuD/jUtuy4y3xbQg78+mm+00FoAk3WS6P+qb4s8V3vBbmCyX1igK9eEKJwa5
	MjREb+ce8Wh0b1cMIMwbXXsj6pKlDy9GdTDfryFtCwS9lo7h6kfXzA+4AeFNoruMmtgF
	yPgEBAOz/1jz+MWv8BKRzKSHDwZ0AxkYAOEMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZBJPGynvsZihgruqZuu938OAiVqLyfSP/nzG9JJGVg0=;
	b=uTTL1z4P1VKCYZJehYqHpt+VZzYukjeET/FtwXRi9NsoJgj48XZlWJyxaY55xIUfLK
	3vJlXJgyTLDypogRvM4wDwr1SqVB9jaQp/DrsORL1eJxYPrV4Alsag7QHXBf1nap+LjU
	0/G+tk/UfKVHbaiZ0UWB2PoA6yDSf9fRGrctU+hHUald0izbFXNG+f4bAHZYzlYxkrlj
	IFk0td3/Hlknp9IqWtkFvEHZxsU8wKvrClAkZf0zqSI9Jo+aeZ+SoHERxzw6F3Q/fNoj
	dFyxbHiX6nqLDsTZr+8WLoVl7FiX3uEMSF9gA6u14SSbkZwxrrjHucu8cTHbYKisXh9u
	KFuA==
X-Gm-Message-State: AA+aEWYI9NvDt+rfAhyEFxnQFOoZ8OhbL2pQc3VIhOlsz/lxc/C9GD/z
	sdPNfWHzG8/VDhVWB2TScvu2la9kZ9hOtmTzITJ5yyDv
X-Received: by 2002:a9d:bf7:: with SMTP id 110mr20333430oth.201.1543419182950; 
	Wed, 28 Nov 2018 07:33:02 -0800 (PST)
MIME-Version: 1.0
References: <1543397736-8198-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1543397736-8198-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 28 Nov 2018 15:32:51 +0000
Message-ID: <CAFEAcA8gA7_jHyZKu_SnE9YqULKvtv39RBcoAx=zdGRGSm5Tkw@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH for-3.1?] hw/arm/aspeed: Fix build issue
 with clang 3.4
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 32OxcytVOnkG

On Wed, 28 Nov 2018 at 09:35, Thomas Huth <thuth@redhat.com> wrote:
>
> When using clang 3.4.2, compilation of QEMU fails like this:
>
>   CC      aarch64-softmmu/hw/arm/aspeed.o
> hw/arm/aspeed.c:36:3: error: redefinition of typedef 'AspeedBoardState' is a C11
>       feature [-Werror,-Wtypedef-redefinition]
> } AspeedBoardState;
>   ^
> include/hw/arm/aspeed.h:14:33: note: previous definition is here
> typedef struct AspeedBoardState AspeedBoardState;
>                                 ^
> 1 error generated.
> make[1]: *** [hw/arm/aspeed.o] Error 1
> make: *** [subdir-aarch64-softmmu] Error 2
>
> Remove the duplicated typedef to fix this issue.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>


Applied, thanks.

-- PMM
