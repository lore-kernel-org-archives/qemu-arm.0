Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp4961774lfg;
        Thu, 27 Feb 2020 13:45:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDxxOZG9FfVeZKGVjMzPkg8iECh7VQuJN83fd3yjFGr5GzUwjRKUzvY06Y7RbIMNqnqueQ
X-Received: by 2002:a05:6214:9d2:: with SMTP id dp18mr1081269qvb.98.1582839902230;
        Thu, 27 Feb 2020 13:45:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582839902; cv=none;
        d=google.com; s=arc-20160816;
        b=wy0xkkn12rssaygYK0ujGxQdyo54wxum/BJ4i17eSBPHpZolLT6+GJpytycQZKaZmM
         hfdJAqKx9KbOVSqHu9D/S0FxF5novEv+K3ImWqnegxCF4gndT8AayXtBtRAgBV1/cUAU
         JZtJkA+yGgoUeNQ6/1DA0njqB840HcGMKdHjmmGMu6+nq9kNPdf5JZGlkHUjGvpGU6+2
         OPfYed+G+Qrii7qr0JE3Nix1FZd+nJ+a+/MehDfg7tQ+k09MY9ATair3+Jr+3jSDMoAc
         O+igK/67aydVIeAcoQK+BN0r15235QxtPqJKClo2Dlz/yAiJ0/FoX+CO0XV4DnruRUX7
         PT+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tPwHyCJOQdlkW/9tqROjADY7bM36Bpf2aEcA0iVPo0s=;
        b=vB4nHLkO40dAJ3sYiZXDbY5k9B4kfE3B/6EWOyt5GWn8E82QRMdxeFrIFytk/29YJd
         lMoyi12kKcWW22YO/0MAXF0GoD1lu1hNq5uDbAaasilZz9Uufwcf1ywNramipx0RwEM/
         xI8ycJad3+baE/CGsUZGqujDvCF7A6VOq6lLQ8AZBqTHVixa5S3zW/mDv9XkGFV+0ZI8
         5/bAhJSNOHGYXUn6zbL+1nSIOpkd+gDigEb4AZwheK2mhkUhfZd8VCYpKqE7VT9zH9uo
         xuo6yORCnfYJRnzUgzemDUhnBq63cxScDF9BUFiW4b/G/lDnhltPlWBHtr32jcGr41kM
         DHAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jRcVLAfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s19si313994qkj.377.2020.02.27.13.45.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2020 13:45:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jRcVLAfE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j7Qxp-0007nM-Lx
	for alex.bennee@linaro.org; Thu, 27 Feb 2020 16:45:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41739)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j7Qxh-0007n5-Eh
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 16:44:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j7Qxg-0004Qy-EV
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 16:44:53 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:35819)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j7Qxg-0004Qd-8k
 for qemu-arm@nongnu.org; Thu, 27 Feb 2020 16:44:52 -0500
Received: by mail-ot1-x341.google.com with SMTP id r16so687205otd.2
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2020 13:44:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tPwHyCJOQdlkW/9tqROjADY7bM36Bpf2aEcA0iVPo0s=;
 b=jRcVLAfE4YhBTeLuyfS1tJgxfuascJM8A5FgEclAv8rhvGVEeynycT7TgcX8+L4ziy
 Pabq4wCtavIYQXpKHLg2p9xz47uTyCMOcReiKBFNEWfS7v0WnWwCTATCpdG5kX84LLXv
 heQjpMEIus3hNMFATZD9upvNPaXCU+XIJifsE7KDy2H6TDCiiFZ6kyeKvAfR43ILcQCe
 KWBEGmaZkiD8vfcnr00a/Va6yWsw/HTFKz4qoxLU9ZhYHvWCQL8xTCuWKLovBecoP8w7
 ZeRlc/It/aWeC2gvmzPKZ8uix+hnybfWtdyDisfvn17b4ExbgAToIIV4CPlp6knHaXjq
 djcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tPwHyCJOQdlkW/9tqROjADY7bM36Bpf2aEcA0iVPo0s=;
 b=j46OKDLZ+f6+Q2hRSKTIvGrTBjyTLNfqAYo54PPk/AgyoPtESQwtR/bGEssZ1GdDLA
 4Fi8noUtHhN54XQzyZBi36yJJov/E5lOguznP/LkwvaLZBfs6XnVU0u51ais6U8yjKdR
 VpFl33Ni0oG32YoMaTLCSBK1yL86aQuUkXVyaGoawnV1zKPLz1THie0j2kHI5Ja5JQKO
 DE4WGYzipT5+OkHp0u8dT2g8O4RUAuCFRr+Anc/DPjI0OH2Nw7Y0UMAPexOAepkPT+vU
 RDDYFfbOZ6Y1xTvVeNLy92/SBqF9rfqzNV7jYx/DOkOkSyi75nA9TObFWx4hF89Ld4So
 a/gg==
X-Gm-Message-State: APjAAAVhyLCFrE4Ex7RCHlxXVjMM9s7kL5uErGYdH0n3kqHzqqY5O+tR
 JkONwfMokKQqAdJTHMj4VP9NToJkx89OyfWpTYOMHg==
X-Received: by 2002:a9d:68d9:: with SMTP id i25mr770594oto.135.1582839891414; 
 Thu, 27 Feb 2020 13:44:51 -0800 (PST)
MIME-Version: 1.0
References: <20200227115005.66349-1-root@stephanos.io>
 <20200227115005.66349-3-root@stephanos.io>
 <88ad7129-9654-088d-6569-066949973a86@redhat.com>
 <CAKmqyKMkTsgqSEWhrkCmbQ3LMNz1OgdeHE6zFaMsZdRjAFvdRA@mail.gmail.com>
In-Reply-To: <CAKmqyKMkTsgqSEWhrkCmbQ3LMNz1OgdeHE6zFaMsZdRjAFvdRA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Feb 2020 21:44:40 +0000
Message-ID: <CAFEAcA_i9Qjvq1Bp8Me2JnUwL5bwEaUTi+8uvusNMcoc7OwfkQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hw/arm/armv7m: Downgrade CPU reset handler priority
To: Alistair Francis <alistair23@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Stephanos Ioannidis <root@stephanos.io>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Bk5YcwGImUDk

On Thu, 27 Feb 2020 at 21:37, Alistair Francis <alistair23@gmail.com> wrote:
> I do hit this problem, Peter described a workaround in the previous
> version of this patch, that is to link at address 0 instead of the
> alias address.

Do you happen to have a simple test case you can send me
that demonstrates the bug? That will save me a bit of
messing around when I come to try to fix it...

thanks
-- PMM
