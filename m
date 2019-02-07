Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp107210wrq;
        Thu, 7 Feb 2019 09:44:16 -0800 (PST)
X-Google-Smtp-Source: AHgI3IYmJsIyFiXYEDNvHG0R9CDG9T/Av0kENvLziur8XXiKAofSgAZgLOzPEoVneCWsgiojPzkK
X-Received: by 2002:a81:4646:: with SMTP id t67mr14146579ywa.331.1549561456494;
        Thu, 07 Feb 2019 09:44:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549561456; cv=none;
        d=google.com; s=arc-20160816;
        b=a15iwOIrvr6ZdeffKlaPHl7PDoGeDtVZJjIyijKY8yZ/zeekrydqOgGK5na2fbDBR7
         W2Ne9vTpOLMsFs+MIVXYM3ECvTMNBrjHmni4iIL4f+LfnG/DNbbwOA8PBYIGO/X8leKM
         pjvHNJbF0mYtMTtrB03L8kso+vDpxYPnP3lvFNPpOpKxIhabBLE6f1w/qmi3i1ZZrHLv
         XUF1flkLuQS7pSG9hWrQfvfArpHEzYni+EaTbBoFluaTRr6ots1VtVCe1+uQypslRphQ
         uPuRXNUm5tAnZtPigUOqUFQOYAtHe+nttl6R29V7j8yr8H/u4HipAmO2wFPtV/3LYjPY
         rP2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=toZPimqNNCb7kRQJITVX8NZPxrJYQ7ULBVA8gh+lrD8=;
        b=i2GanKRMFmWdTjmEWVkPW0MDfK6qAkRtOwWztpJU/2B5Z+uqAAS4q05rtgmmNIewvS
         84rs4yMUEXuBtDhjcX3CEQTV4fjH1OpttEiDSfgOo09nbrS17frYVeQsNBnDRhk101hR
         eIN6GsLGuTzwSo2ziAo1HApODMyILBJBlT0SJdKu4hYNx/Tpb6Qns1figKSKp0aojsao
         HAhi9JkQALox2e8UZakf2keJTq8vL3Saz94uyTxaUxRvGmSjqnvJoLsRlOklmLN8GUNl
         ocvVhUdq16u+6F2hpHFyVRCx5SzGXQ59p8Zk6bajNaI1WmlJpu+Y9aGKlkSZVyrXOYTm
         JNyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ER3vO0Gv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si5966539ywc.422.2019.02.07.09.44.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 09:44:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ER3vO0Gv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44221 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grnih-0003lL-R2
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 12:44:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grniP-0003cT-Sv
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:43:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grniN-0003wo-VG
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:43:57 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:46484)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grniN-0003wE-4P
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:43:55 -0500
Received: by mail-ot1-x344.google.com with SMTP id w25so1136035otm.13
	for <qemu-arm@nongnu.org>; Thu, 07 Feb 2019 09:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=toZPimqNNCb7kRQJITVX8NZPxrJYQ7ULBVA8gh+lrD8=;
	b=ER3vO0GvdWvW21jYmDhS8yzephYpJtJNTCAZfU/MyVerh8qxt45rlVuywtal3mnsi7
	EDhmiyZAZEqOgUwjx13R4fPG3vnnyz0gLI8DexMn+uv3h2nMBu9fyWfRjYK42sBTPJnG
	da9BbPvcpHknvuMJuAJfm0yaOIq7FUlQbxh4AVVtgOBwiX/MpsXlu4nUMfz5x+E2HcRe
	W4hxltkDKdNCdM4r4XbWGmFYdaUjV6y1pE7Qo3Dpmrl831D+wYQwenlW1ZZImQrb5luK
	E5jKrCTN2lm6l64Qh9OvYyhaU9yzqeBfk6ZzKR55lqJq7YV3k8umaazUDBo+HTGsTesp
	Kjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=toZPimqNNCb7kRQJITVX8NZPxrJYQ7ULBVA8gh+lrD8=;
	b=Az7HylKmPz1ceX4dTRIS7BOEymFEA02PNROcjcNlW/nb4ruaFFyPR5XtzI4giGktc9
	xIA1laMn4Wo8PNETAvHoRjceup5bfYeBbtuO2NN9wGwaT/GR2uoZtctXY5RvVLN0GzA2
	vG9GGayxZn6FT08HbMh0xRK7BOChou0Jlbu5qZsL4C/t0geEVB5Xw+WtG8okCBCCuyWC
	y6fSF7RmWdAYaNFN1QA+eMemoC2TGwJayo83H0j265dCy2oWbZUOnrbtbQZCiCJjMXQK
	CV86Wf24mag4SKz9H/35DB6CY1Fy3V1RK9imBeySDF1MDbQOg4MxQLbrW1LOK4wxauQQ
	+rlg==
X-Gm-Message-State: AHQUAuZ7Xj9/fKT+qS9zEZAdU4VCx9kiINnCfIUccJdn2elyV5SEVQWO
	ACVkrubOvsXyUKsRwmUAyn7pT9k5F73VJodYmJ0Bfw==
X-Received: by 2002:aca:2801:: with SMTP id 1mr975337oix.98.1549561433346;
	Thu, 07 Feb 2019 09:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-13-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 17:43:42 +0000
Message-ID: <CAFEAcA97JdvMLbtjDUAkUCWhmT1NGkWQsierM=AEmpR3X+gDUg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-arm] [PATCH 12/17] target/arm: Implement the LDGV and
 STGV instructions
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FAfXlkMMJYGx

On Mon, 14 Jan 2019 at 01:12, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

These insns don't exist any more.

thanks
-- PMM
