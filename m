Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5001925wrg;
        Tue, 11 Jun 2019 18:49:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxPYtQo85DLy+EtV0rvyhGYELlYTOW6DXFbrGt6OIbWSkoTH6rX6rpMg7EaoGi7oexPltWi
X-Received: by 2002:a0c:acb5:: with SMTP id m50mr16263qvc.82.1560304172550;
        Tue, 11 Jun 2019 18:49:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560304172; cv=none;
        d=google.com; s=arc-20160816;
        b=P0wnnFV10H8TogR2zs2UTJNbO1lbVun00pMsPX+Nj85My8Qlbp/GFIDLPZrwSRsCqu
         2keJyg0k/lcb6hBw9SNPac1p3jr5Vhv2/eCnazx966WkylMjeNm8h9/5j3KHk1cn3ghI
         DZyLfMiBwKkFSCvhozUndkkvKMvXbgDGNcTCWG4UdjrrYx+L0MKouh0Dox4x2jYstHhw
         +g9sED8M9S9B3tNtdJMu5FVJtbhZIuWPon++oY1NH+BWilphNW2e1E4AGOx6OwT9mvnR
         6I9B92rtzwOX6NsObKKeR04vd0o0QPUQPr5RifxXKUbJ1pzgYnKwRcpZHCJQAP5RhrjR
         CnhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=k3JgUsX15SkJ630nXUVbg1RHuzGleq7PmIfGXOQzOIo=;
        b=nqyJj5WnqKq4b8jQutllUoE8iaXfih1ZgFfL1HGAWPWlJ3IHwgaS6WhDWraARaGvN9
         /EdOOKwLU/JeD0qsT/J1txg/0dsoOD3YJkcK6PQ+9ZXisx5f621N4mUh8wDqXuR+Z7oH
         ys5s04N+SwwVChcVOogEodNJR7Cq6yLyTZFH4/9LIjcGlln6ZL1zsvzMCsQzTNgXRuJx
         Pp1RZTjQN2G5B4fNSa1rEAIsYxkB+o+pMCncWVBxBBUadVYnrMT3L8TrHuci6B7jabce
         DkQq/QLNnX5sIIgT9RjaVW0B5fGerK/0jypudzvo9sSGGU6m/MVsCary7vMIGauE5Hu/
         ZKvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=lHnRFsDL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si2949430qtf.171.2019.06.11.18.49.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 18:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=lHnRFsDL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56148 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hasOK-0004YO-2x
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 21:49:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53985)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hasOA-0004M9-J8
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 21:49:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hasHL-0003EF-H8
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 21:42:20 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:38617)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hasHL-0003E7-Dj; Tue, 11 Jun 2019 21:42:19 -0400
Received: by mail-qk1-x741.google.com with SMTP id a27so8984319qkk.5;
 Tue, 11 Jun 2019 18:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=k3JgUsX15SkJ630nXUVbg1RHuzGleq7PmIfGXOQzOIo=;
 b=lHnRFsDLDU90zodG0YPba/0O+2rnIOAwXZsNy485E5Xkqr0Ngg9CbbPag8XD02qpJY
 kiYeFpGF4faMpljuAmUw7Rt+ASlukJsFyqJsiA5cia1hobu+yS3UEiJGaMr8DxntCyOn
 uqrZ+D2n7VQaWeSZaSHoUGEsZGFlIaml8iN7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=k3JgUsX15SkJ630nXUVbg1RHuzGleq7PmIfGXOQzOIo=;
 b=DkfUPY55IF1bwqiCSJjzMPdNp5iH2p2f/vZXH/dQ31iF/+pOKCfgDEpKwblSGdu0dg
 6x4WMZSam/ObBpibIfRKola5lfO3PDNjfyzl37+kPv2pg208t1DhPb5NGpuJrk9tqjaK
 Ki0iBghlq6FZ/0emja717kE4MxI0UwtXrw74hoF+pTbvSpMIGokOaJGrOUC9ovX6e+Bt
 mzvFV+EISZdYSIGqSiNa8J4fdjRLlIfYXf8wuyEzvS+e5gxyz7xZJVNGl+dNdbB9F9F7
 2PSm2d4O+/L/aTIQMtuiODIGKP1nnh04EFD0A18BeC33TIqSapAMC1Upzp8FPgVmshty
 7Yrg==
X-Gm-Message-State: APjAAAWiQBiml1IucjJY8OIRRmSy+QsN0GP1nNrDwAZBNCZoNPQfpWyH
 opqE5hcZTmOWWJAy9jbx06wWV6zXeBWNU3e7+oc=
X-Received: by 2002:a37:a10b:: with SMTP id k11mr65043557qke.76.1560303738544; 
 Tue, 11 Jun 2019 18:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-20-clg@kaod.org>
In-Reply-To: <20190525151241.5017-20-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 01:42:07 +0000
Message-ID: <CACPK8XdQR3J_mEES11_JT=FBSSzSOPUmrJ0m_jjXfj=YRLtKcA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-arm] [PATCH 19/19] aspeed/smc: Calculate checksum on
 normal DMA
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Christian Svensson <bluecmd@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PFeuAc1KrUqn

On Sat, 25 May 2019 at 15:15, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> From: Christian Svensson <bluecmd@google.com>
>
> This patch adds the missing checksum calculation on normal DMA transfer.
> According to the datasheet this is how the SMC should behave.
>
> Verified on AST1250 that the hardware matches the behaviour.
>
> Signed-off-by: Christian Svensson <bluecmd@google.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
