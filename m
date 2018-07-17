Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2847559wru;
        Tue, 17 Jul 2018 09:11:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpchExaimMsOhhRSH0ObTtL7ZQmrd/eKAgmuVWLOr6n4uaj90uBdP4VihMPgG/Phpv2WMlAZ
X-Received: by 2002:ac8:42b:: with SMTP id v43-v6mr2087680qtg.319.1531843911550;
        Tue, 17 Jul 2018 09:11:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531843911; cv=none;
        d=google.com; s=arc-20160816;
        b=iQAgXrXOiHcHF95byMUzJDRtqeGFCR5pkH5nZnI+Im7VxyBKCWoH5jhetOWODj6qwQ
         XWW/zp0LpxuR5TgBoWxqiVSijUdGDiCW3tpnUcLJSwqs3ZUVidVUMzzK/k9WAvkqIjG8
         zkCL2ePuNP6186qMEZSc/yXzXktUWED44rxxJyWF0USzYMjWqpRXLqSn3jTHX5WPhbeB
         oiNfkIQ1xPpHOYKGf/1jb64ftEMCoG4/oAAwg4AJkHQPJya1N/Mr9JJFp2ygij/cYbV4
         tDbTsKzmCI9vbRlADeRXMiZUsXB6LJPP4VTb+mwD5k5ouTRRhEYNp3qS0FDQkIWEhhw2
         oZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6Vz2pDMQg2UNbC8P91USvsYuU4hSHA/aA4IR2PLH5ZM=;
        b=xN+rHGkHpkIjP7MuvlESmGDZvzY2kh8Ls9QlXolzU/t+wYb85wOMhjSnAW/POGhJyy
         DZJpytqHl/MMpgqUxwXf3l13U1U8nydc6CeVQODww+kYQ8DF7Ut7iLTtTeQAAh3Xqfy2
         MaK0TQmFz5tST5p2lb6hraW5EuqlcmpPxglJddfmz1GlovuuYqHlfDgS06FkXLNi5RHQ
         nXvdZcQCM+FYEkDDk4HyktiCwYq6nuqobop0f2PMUgyic9tpV+L4386Z/Ph9f3fFjqiW
         JV1iv93ehrXQoTHRPqcfXdhyccfcfEjYmszm9OPo1xnC/ZkGSPbMoc1YPKcMM9xKvybD
         wXxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AXuJUDMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m7-v6si1219727qvo.87.2018.07.17.09.11.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Jul 2018 09:11:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AXuJUDMx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60331 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ffSZq-0001tK-T3
	for alex.bennee@linaro.org; Tue, 17 Jul 2018 12:11:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41579)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffSZi-0001s5-Ds
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ffSZc-0002jW-Hv
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:11:42 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:32838)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ffSZc-0002j3-Bc
	for qemu-arm@nongnu.org; Tue, 17 Jul 2018 12:11:36 -0400
Received: by mail-oi0-x244.google.com with SMTP id l10-v6so3092899oii.0
	for <qemu-arm@nongnu.org>; Tue, 17 Jul 2018 09:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6Vz2pDMQg2UNbC8P91USvsYuU4hSHA/aA4IR2PLH5ZM=;
	b=AXuJUDMx9IPf/cv745PWjhqrvFQnfT7FSb7ZUkKdXJgNO6psw+IH3fdY8S/z8jH36a
	94qIihfeRDpfJsiA8gkSnc4OV9rAx7HKJToE7hR15sNiBWr33odK00iJj3shu9b0G/88
	iVVplDh7FVoaCaZRwdl0k0Bx8iLLKCGHh8zbo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6Vz2pDMQg2UNbC8P91USvsYuU4hSHA/aA4IR2PLH5ZM=;
	b=k6CWEETQwLcraIJSbYJ3rwJXO8uhKvscBQLbih/yAPhCB0bxpa9muQINhJTfhYLOWN
	8QHda6lFkAwU6FC9e0J2SRQ0IUJuF3y6YxWds5x58Y53rJfB+WrL48z5Fw9T8i7MYm+X
	w+dgx5g5mC4SXco9mFr7/tu3vHpvZaWjo6HmDPWo4FgSa9KIBkz4qWFuguMXyIflJYYq
	ccVlPZSIJK3Xn4l+782jP5QEqo0Brxew9aTG3oDHfheB8C+eWZZuuUdolQrLfGyj7vxC
	42/wqefWTXPI10ukyPujuzOr4b2ZDgcAttoL+mHwnXQRnRiTSUsfReb9+C6dpBllBZWS
	4w7A==
X-Gm-Message-State: AOUpUlFzwzuEPOS/YLvGZ3bqapYOwWhfqjKRzyTWiaADrQi+9BU0GL0M
	cctBhRo8dyrk83P26bvvG+rCJij2FIvOYtvhLo1jeg==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr2200942oia.164.1531843895557; 
	Tue, 17 Jul 2018 09:11:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 17 Jul 2018 09:11:15
	-0700 (PDT)
In-Reply-To: <1529699547-17044-10-git-send-email-alindsay@codeaurora.org>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-10-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Jul 2018 17:11:15 +0100
Message-ID: <CAFEAcA--ZGyr7i_HGwZNwKQJsvQ1WsvHomT=tMxiLdTAQhV60Q@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v5 09/13] target/arm: PMU: Add instruction
 and cycle events
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
X-TUID: G3zzoG6cj4t+

On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> The instruction event is only enabled when icount is used, cycles are
> always supported. Always defining get_cycle_count (but altering its
> behavior depending on CONFIG_USER_ONLY) allows us to remove some
> CONFIG_USER_ONLY #defines throughout the rest of the code.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
