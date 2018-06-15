Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp783537wrq;
        Fri, 15 Jun 2018 05:23:20 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJR0jLAASlCb6al1PY9+a2+V+Aotb4JqjWeRG+yzT0EPpG3lCFT51c93C9a2bB+0XjMkH+2
X-Received: by 2002:a37:ab04:: with SMTP id u4-v6mr1047456qke.92.1529065400600;
        Fri, 15 Jun 2018 05:23:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529065400; cv=none;
        d=google.com; s=arc-20160816;
        b=u9TdCD0OwgQ8Un05UUYrUKQ9lPyBqDzOF3iGTRyfauf5B0Yxsb+3GWvpPm59g0QaR6
         /38NEdThIdPd+lQy9rstVCIxO+geYqRAViBtPg+RW3C+g5zpD/nMUuiUOJeTbLw3NKS2
         pEvyH0HZlaLHV3ceGMU68BsWfEfYqkezRq/JWrCpM1OVkiroHierMSOQ/pSQVZsLcCRt
         0XEsV9V/nEQ5cdZkVzq9c6+OAMaCVMh8FPtRfIDHmNR0rZWMQHCWw4kObzxctYCs4PbI
         V7g8vvuTNEeoPzMBw5aOsJQdLmXJMeMA/mG7W1aqEMOeuIxXmQFB0uLjjQWJryI8EjWA
         /tiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qoEc1wQpTrhjORCACKoRYT73kKL/wHHoKXzN3F1yewE=;
        b=HZyxrmQCRvwvaq3ZWfMOE9r4TVRU41ltDL4ulxMQTSPomfX8mpbR9dDIJMOmnD0KPS
         DqOlmHFzC5EwPritEOLku5sni/VddVweQFfwj9dyz6UEApcM6ShuPc6lciOnTF3cWjpC
         vtEeaPSw8a/7m69O43I8OyvHOacHB876HmX1VJEMkW/w4vLHi2q5LB1we2RxlycX54nZ
         7QZwhKnfDM670julYC9lP+mQFwYTm7YhZLdZt9pSAmE/cZvypN/q2ai9QoGTMo2FOY5g
         Kw2/SUlsEwR/hsx+iGDi87c2YWFEEw8Syml32Q3tK2Vsrih/xDIX3U61VwBY3j/oTG/N
         7H8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I9bNLDpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p85-v6si7812725qkl.132.2018.06.15.05.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 05:23:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=I9bNLDpE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46474 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTnlA-0001Hw-2b
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 08:23:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59879)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTnkz-0001FK-N6
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:23:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTnky-0001gx-R3
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:23:09 -0400
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:39156)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTnky-0001gX-Lz
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 08:23:08 -0400
Received: by mail-oi0-x242.google.com with SMTP id t22-v6so8623143oih.6
	for <qemu-arm@nongnu.org>; Fri, 15 Jun 2018 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qoEc1wQpTrhjORCACKoRYT73kKL/wHHoKXzN3F1yewE=;
	b=I9bNLDpEIC547gOMRFK16Wk/ifY2920D4bYJiKAA+VRzlWwJ/Pczrt4Zd8YoFvicxE
	CYq7nAvIYGUBf263zzuZjkPqf92JJ0ySnqJHWD75a166f2ax6wFO4ItrSpApF7kmXxx7
	Ekwg0n55e3ct94+Zm4/DbXmEgbewEQ75qHyBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qoEc1wQpTrhjORCACKoRYT73kKL/wHHoKXzN3F1yewE=;
	b=kmmKCKg9Y0PSnHAGJLh0jlrdeFAxZLi/fywopKNBh1jS64xh6WqH7obAVcxe0rqeMG
	a/IeLHKVfD5FDGuJekQqmpTEMASrA5KtBRziNay7Vaa2KKzM/FWoq/lX30D4TD6DdPn1
	NbVyWTF6GJbJEa8AgxeAA4Hs3JYS5+4vZwM5BLkPiVdF/7b448fMZhTltdhX4OBXvF2H
	m+JwrFR0kxRTLHhmL0jLplUe4RjRZjGdziRaeD3WWmrDT3eJHn0T4STqX5u6TwG+YN2R
	IU5YFinLy/duwWWg9o1qKqFmuDUXt8sYE4I8S5D58JvUgL8qe5cVdxsLAV3sv/8iBr9K
	cYlQ==
X-Gm-Message-State: APt69E2NESASRisqdHmdSGjIxMkq++a2b2++l2NkqB2ulYE4RPCiEzmA
	Sttm4ca6Ug88gaYJ/EKWufPkoRs5+Asd5Q9n4XXlIw==
X-Received: by 2002:aca:a846:: with SMTP id r67-v6mr782953oie.12.1529065388006;
	Fri, 15 Jun 2018 05:23:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 05:22:47
	-0700 (PDT)
In-Reply-To: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
References: <1528554193-27270-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 13:22:47 +0100
Message-ID: <CAFEAcA-PJe+hwmL+vtLKNoCCb+2c5e8tx6kWnE0AuOiB_3HR+w@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [PATCH 0/2] ARM virt: Silence dtc warnings
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NDofKLv++Xi9

On 9 June 2018 at 15:23, Eric Auger <eric.auger@redhat.com> wrote:
> When running dtc on the guest /proc/device-tree, we get the
> following warnings: "Warning (unit_address_vs_reg): Node <name>
> has a reg or ranges property, but no unit name", with name:
> /intc, /intc/its, /intc/v2m, /memory.
>
> This series removes those warnings by adding the unit address to
> the corresponding node names.

Thanks for this patchset -- Marc Z reported this ages ago
but I never got round to looking at it.

Patch 1 looks fine, but patch 2 changing the "/memory" node
handling I'm less happy with. Currently we're consistent: we
assume that the memory node must always be called "/memory",
and we look for an existing node that way and create our own
with that name. If in fact memory nodes might not be named
"/memory" then we need to look for any preexisting "/memory@*" node,
not just "/memory", don't we?

thanks
-- PMM
