Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2823608wru;
        Tue, 17 Jul 2018 08:49:41 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd0cgeFX0TEPY/tMq2XFO9q9oy5xRmiPSJw5OSXcK2PE6jak9y9H7C49XpIux965TNFFon1
X-Received: by 2002:a37:2121:: with SMTP id h33-v6mr1937828qkh.319.1531842580895;
        Tue, 17 Jul 2018 08:49:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531842580; cv=none;
        d=google.com; s=arc-20160816;
        b=K9TGzf+2iBVnqbRXCsV6/G9d2z52VB+w4VAMnOYjB6SIHCi4nT9FH36gnavkc44eg/
         PGPFuY0YrIV+n9fC+pUN31/8WCPEgdRHpJ5YibIfTpvso1ohcQ5XzNje+F1+35tDpDKW
         xaGRWFvapLReggbJ5kODlvF8RnHhqIDUSBJzpLQVe8c7wpaH1DIysxz9TytzM10VU01I
         5omeOdWe5EEw/qAORQiRFNIkYaom38kk/OVDDbubAcngeNeET7PWDD+/JiZr3nPZv+QT
         JgW/kVA8y5hRvpsPVor1b/tBk+euMtBa9qxhaJ3kT7I1w4BY9E8XxRX5bUy4OnnQ5WEz
         NBQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ZB3hX10mgtQiQs3elCVrDTXPdKlkL+d8BfC0PMR1T/c=;
        b=HPL+sXDilAbUboeDIW+olH7HAVVgLEJVeYDSELB9a5IK4yfxmYvATBznPd489o3QT9
         SnMWiGvKv/d1CY+iAM310jnAtIaZjjOyw7aF3x6fEHmrsu+FjWl6OUAJagVJSN7qWM17
         psPFlimXsFLVOlFvlkuKUCEVDatSO0VlMk8O+jmXYSQoa0rHKETvpvyPhM36ED5QiHCZ
         lZnpf36O4xkquvxrQ8W+T88TaWofVkN4Xn0aDa5hKmj1VhHXUXdIeK4qTPpDNmWw4ctT
         iF//e59gHFQMwTEy4ymhj5o2naaY+mlM+ENsHFDXAnfuhstIqtbjHILQ6bCms1fzauhH
         65KQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dUlmoSWM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v16-v6si1429274qvk.273.2018.07.17.08.49.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 08:49:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dUlmoSWM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60083 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffSEO-0003Yc-Fb
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 11:49:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33965)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffSEF-0003VF-IU
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 11:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffSEE-0003HX-Kw
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 11:49:31 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:40225)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffSEE-0003Gv-Dp
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 11:49:30 -0400
Received: by mail-oi0-x244.google.com with SMTP id w126-v6so2906880oie.7
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZB3hX10mgtQiQs3elCVrDTXPdKlkL+d8BfC0PMR1T/c=;
	b=dUlmoSWMzM7JTwJpRk9ZtMXr8SPgWfNQOyrPA3ieUpk0ItdiLpS6T+0pfeLom4uZIh
	OETtJ0OnGrhxncqvptHIXQoMIKXLxSL2EBPs+xWmxgJIcAXuwj2BtQ1ZhymmRATbFez0
	/UmpAsLpq3B4NS0a8RIVk+F4wCNE98wEN7yzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZB3hX10mgtQiQs3elCVrDTXPdKlkL+d8BfC0PMR1T/c=;
	b=Xldki9JSK+yoV86HCW1YdOlF2r0tp7u3vK4os3y08O8xlIYsWHFM5M2WT6P43Ybs7s
	iSbiphxAOpK2o7RvPcX/iKLJxzpz2hK0deVcF8C976js5HXZErBpkJXovsqJNWlg/rKO
	iq4oiYCMyxP5j4wpeBHYLFe6p2GtZEtHY4380ku7h9N1J+BsB7cK5Rb55lduHahtvNsW
	yiTtjdAm/UwdzGJnRcyBC4D4OeRiS0j+niKAUjpDEtD9VfyRUrFoo8veHtc9i7TM0Cb+
	4R0e9tSPZIJwgCt1tvWrtVwWZQHFeHmSZwVJhBcnmJ1BL+0C9MSi9By7iN41t3ECu7qQ
	1m6g==
X-Gm-Message-State: AOUpUlHQOOrE8JUgYtUtfzcJzJOicHqKtG7jhqq1bK1phNXfabSU5+u9
	RoMMuAWCHbuTKhK9cM+t0A1cfXeawLtXnMrklpZPSQ==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr2068293oia.11.1531842569634; 
	Tue, 17 Jul 2018 08:49:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 08:49:09
	-0700 (PDT)
In-Reply-To: <1529699547-17044-3-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-3-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 16:49:09 +0100
Message-ID: <CAFEAcA-mywa80eTM6iJ0UDrFFYb3KZmhzEMz=OhhGTQd80JqbQ@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v5 02/13] target/arm: Filter cycle counter
 based on PMCCFILTR_EL0
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Aaron Lindsay <aclindsa@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gRUSvHi6LTx0

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> The pmu_counter_enabled and pmu_op_start/finish functions are generic
> (as opposed to PMCCNTR-specific) to allow for the implementation of
> other events.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
