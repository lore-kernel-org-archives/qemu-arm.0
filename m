Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5786201wrt;
        Tue, 16 Oct 2018 05:02:10 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62GkK6zwfZBK/UeX234VNxBoBEWwJFjbszDL5Tm39eBBor5Nhan4uVsyYYfxcFZk+imlcI6
X-Received: by 2002:a37:2a5b:: with SMTP id q88-v6mr19306851qkh.287.1539691330593;
        Tue, 16 Oct 2018 05:02:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539691330; cv=none;
        d=google.com; s=arc-20160816;
        b=W0ZeCA62Y8eOF09Rn8g7tCa4c7wagm1DP+rfrpSlLjIyhnsaDamsPBL2LdW/e2BXMv
         h2q+GnkvRHqAwM/SvM+urrvXf4cEfmV6Kj+vWp+QJZZinNM3TxT269xxksH3KNxvZ9MZ
         3Su4YJMipmNuZuamIl6l4GTRXD9MfLoBGTt21sqVQ4WjThepLJ77N4fWATg0PGwC3HdW
         wz0FewSFshKxSTgtD0qLPLZJ4z2CsahmKCLL7MlTWJpnJykhpy7uKOj90pSDRyUhLlld
         wAlv+rUR+rnfiBJccQPLv9I5QHR9IL9yr/Yw0LtdUYOMlIe67sYRvmKT8z5MHuWg2pGm
         3dBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=Ymv3PBH9qpn86SvVbi3z7BwhpxmX/z0aU4785hB5kvU=;
        b=Ix6JVpER8kv3DVIsQeuXqs20Udj3jATpOpBTMMzqIGksVlm4FmE89eocUEKdfQs+sN
         Aj5Qh+dFJwTlPy/OrFRHEqtM+P7Rbzc9fXTsvLUgKnyJRkUEalezqTYh0JcL205c49gE
         HsyUHPD04Su5ojW1sfmLUmd1mFmJumn2SxCSD7n0EISqUSy7K+KbEUPumGcy8H/ZQ3Bb
         yme1b73QyUldyUhzS+cm7cE7lKVmAKxeaOiqaKZDLy7oSrb30Pi+c0sZ1lnbeqGEsdHA
         B1f5wg1j8Iyv8PGcjkJwrD4+kIr4e2/msc8bWjsUcz8XqwDDBAiCL/ZNzjorzLxWkME4
         AiKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LLbNF9+s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n36si11060543qvn.68.2018.10.16.05.02.10
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 05:02:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=LLbNF9+s;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCO38-00009X-53
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 08:02:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54213)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCO2j-00009O-H1
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 08:01:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCO2h-0005c5-9e
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 08:01:45 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:38937)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCO2f-0005Zr-A9
	for qemu-devel@nongnu.org; Tue, 16 Oct 2018 08:01:43 -0400
Received: by mail-ot1-x341.google.com with SMTP id l58so22217266otd.6
	for <qemu-devel@nongnu.org>; Tue, 16 Oct 2018 05:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ymv3PBH9qpn86SvVbi3z7BwhpxmX/z0aU4785hB5kvU=;
	b=LLbNF9+sIVS/2i/ELJZ8n+VacW84dZNNzci+ZUWmLkPC2kJ5v3dRYklBJ7EEMSvvwk
	9EYSgDoJnuD4vy0q0zCzWH/oS/73Kl+7gO0Wqyq6iOZb9J5dK452gtAyVnmML+U+aRaI
	x9PRNomKlVXsIexiLVepxkhcku//mf+x9QxQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ymv3PBH9qpn86SvVbi3z7BwhpxmX/z0aU4785hB5kvU=;
	b=GQxyKPTpsXj6+/68+3kdpNkK8pu4Gr7gP5sFlBGIx1Jt0WCnwFUwppKGb/ks6N+emy
	tKI7wVxljKtSd6WwvIQeO8HwUHRIUAbHWtfjR5jggp+dOOtm97G1CaYBX0ROUfCVlV9H
	3keGxpHR7I1cHN6OSSPJbCTYsRacP4nvoa0A1AZzb8P+L2W6mmtLFXOV7zPFSyPGurnV
	wSj5VOCLV8enYemcRGP4rt2c1TC1W+1/YpozN/us2vqmLaNWCT1sTSyegx4z2vep/VkW
	jEp2Ad4oqHST48gD+LEz9RYjMnqyqRlVqwewSqMJBd5sH0VosDFqKfLezc5dSYsVL/yl
	vWfQ==
X-Gm-Message-State: ABuFfogpsfQ2cscZBrV5jS31QThFpMn/M1Hao5uMV8za5nTCyOgNCyJO
	OMvE8BKH1sJAhTVrip54oFpIcCFBKhMnBdXOEPnFIg==
X-Received: by 2002:a9d:44d7:: with SMTP id p23mr13281842otg.316.1539691299207;
	Tue, 16 Oct 2018 05:01:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 05:01:18
	-0700 (PDT)
In-Reply-To: <20181010203735.27918-1-aclindsa@gmail.com>
References: <20181010203735.27918-1-aclindsa@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 13:01:18 +0100
Message-ID: <CAFEAcA9cACQa7A8VUdfuSk-FcmFeHu+4x5m7HDE1A-+LYcwvXA@mail.gmail.com>
To: Aaron Lindsay <aclindsa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH v6 00/14] More fully implement ARM PMUv3
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
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LgbO8DHxX5Tx

On 10 October 2018 at 21:37, Aaron Lindsay <aclindsa@gmail.com> wrote:
> The ARM PMU implementation currently contains a basic cycle counter, but
> it is often useful to gather counts of other events, filter them based
> on execution mode, and/or be notified on counter overflow. These patches
> flesh out the implementations of various PMU registers including
> PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to represent
> arbitrary counter types, implement mode filtering, send interrupts on
> counter overflow, and add instruction, cycle, and software increment
> events.
>
> Since v5 [1] I have:
> * Taken a first pass at addressing migration
> * Restructured the list of supported events, and ensured they're all
>   initialized
> * Fixed aliasing for PMOVSSET
> * Added ARM_CP_IO for PMINTENCLR and PMINTENCLR_EL1
> * Addressed a few non-code issues (comment style, patch staging,
>   spelling, etc.)
>
> [1] - https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg06830.html
>
> Aaron Lindsay (14):
>   target/arm: Mark PMINTENCLR and PMINTENCLR_EL1 accesses as possibly
>     doing IO
>   target/arm: Mask PMOVSR writes based on supported counters

Hi; Richard has reviewed most of this series and suggested some
changes (thanks!); I'll just take these first two patches into
target-arm.next, since they're simple fixes that have been reviewed.

thanks
-- PMM
