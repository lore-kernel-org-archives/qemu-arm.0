Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp95749wrq;
        Thu, 7 Feb 2019 09:33:04 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ia6dlB0LYiNBS1THhzGvTJMsuBEAxuD4BieJArtf8Q3htpJx9RXeubbp6DJwbD2p4Wzdijk
X-Received: by 2002:a25:4009:: with SMTP id n9mr2639308yba.178.1549560784018;
        Thu, 07 Feb 2019 09:33:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549560784; cv=none;
        d=google.com; s=arc-20160816;
        b=Zi5KslJRKHefwrfq/ZU8JFwcJzNnewLBC/yLm19rh5EuRFAp5oObCsa1FOIki+2v4G
         ndpE0ugm4RWP2xo5tW8Qv0J6QbnQZVMoA00+ocep7OEcGKdCnKuDIxyaduwCMskcvl2H
         td2oIBNQ2hIycIC0uW5VgcjQwLoQMZg9aaSBeWWlgmVxO4/BppuN6dU1vngo5OrrxY88
         rNmrJipl9E/V1RRBUT8/Wqngx8+fpvoHOvaXPj15gPxTIiXwcboFarTbMgEgsklhLVwB
         tQL85m29QOYkBBOegavHPZKg+hoAHbHUyHrXAGZKvnlD5lG7V3oBypDoMgsX1WWhpYp+
         4YnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=50/snB4kF8VWEvtNPBnuBS37gYmICavLpEP1NeY7njw=;
        b=uhbLPssYHzUBVDL6Qe70TLlO1dUpJf3VtGnimIAoQ4KvRoGbuISOBNcx7iAaxNqZJA
         Wu0gxtQSNQSg2giNhOvB3uCQFuNdwz8lIgVogsh0WiqX2YOm5GE+ZKnUbOHMFzPMlAdz
         I6Dj4KlgB45jpJWRuHIGgjknVFRe6Dj9i85Hg8M2kzHJza20KweIpyskG9R+5bs2hJgP
         cypyepH+1KZb687/cbMzV5KZznXeXb0h9aHVEhVyIVdaa9ao2LGm13dPy7cu9P9xDuLP
         DiqwYNMXelPUHvtYarGpJiQ9b2IjqMZjaBtoxn7zg7meT0Kf7N/yNBDIuPVDV0Vz+EnP
         kEDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ciS9owrT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u203si5764037ybb.171.2019.02.07.09.33.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Feb 2019 09:33:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ciS9owrT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:44072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1grnXr-0006xi-Fz
	for alex.bennee@linaro.org; Thu, 07 Feb 2019 12:33:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grnXh-0006wn-Rs
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:32:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1grnXg-0007Wd-K2
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:32:53 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40170)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1grnXg-0007TT-Cf
	for qemu-arm@nongnu.org; Thu, 07 Feb 2019 12:32:52 -0500
Received: by mail-ot1-x341.google.com with SMTP id s5so1146802oth.7
	for <qemu-arm@nongnu.org>; Thu, 07 Feb 2019 09:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=50/snB4kF8VWEvtNPBnuBS37gYmICavLpEP1NeY7njw=;
	b=ciS9owrTaZTAGx2+2kvOKk9XMA9AbAwSeobtTba28R7o9mKWBqdE2jqCA3RsysNY78
	iqBq03Oy/IMeBaxCFQjrlx7Ngv+T0LdkF4agE97KrnwAWNDA3vGjKVqZfbGmwLDDLfCM
	EVEtK2G1rby9itIY5CmYxIgWfuBPxIOvd42+esoy64hTk/HyaqpXEO34xwSi6Q2q8d+K
	qhhyQV7LYj2jgWRYRBRdrh9vo/DmTScGA8qoJtfAhbcOFKpYVig778iUGVb2fbU+WRiZ
	4eRQa+2j5ybOzzfziU32ntAu0PAC2xIbry/kim6iTGvvvg0eOQ175dKRqvTVvJx+3oV1
	LqFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=50/snB4kF8VWEvtNPBnuBS37gYmICavLpEP1NeY7njw=;
	b=jHaYcpxI+rdBxp4wsS5y2edXpmO2M9ZhlwMVOOM20E9AP5o8SoiruLJ+KEdGzt6y4p
	yMRZv0K3+IgBBXxGrCifNsuXRPkSDAqUtva6CQvB/OtmSJ5seP+a4LK0jk0TQMCqkHh/
	l1KQL40QUmLLOzrghDrDzGLmrsIUl8cpQulvD992tS6ZM/ZRntc1xWE1R3LkIJvXKFow
	nNXlg7mgdtPdcvWTjYLolErMTu+g4z7HzpcDeuDes2Wd5uMkP6Tv70iq3KM4MgGNzzgC
	VRBUCsmuZKiOqQdU1nK0oJEoajmIZE9Bvk7cDjV5Ucw4zapuTetWuSkAqvloAYWvVH7b
	B5Xw==
X-Gm-Message-State: AHQUAub0Jp3fI9MIrCo4llY7wcQnvQTEa8tsL2rl5jHtkHraWII/58v9
	ynpYYBKzxKh/LV/vgWh6zEJJQn+gFdzfcCvpGoA1xg==
X-Received: by 2002:aca:2801:: with SMTP id 1mr945789oix.98.1549560763127;
	Thu, 07 Feb 2019 09:32:43 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-9-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Feb 2019 17:32:30 +0000
Message-ID: <CAFEAcA-=WDNsZaDCg3X_2ZZReiqZLBLaS2RBJuJ0_mfoTv-erw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 08/17] target/arm: Implement the GMI
 instruction
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
X-TUID: ZxUF2Fd192d/

On Mon, 14 Jan 2019 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/helper-a64.h    | 1 +
>  target/arm/mte_helper.c    | 6 ++++++
>  target/arm/translate-a64.c | 6 ++++++
>  3 files changed, 13 insertions(+)


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
