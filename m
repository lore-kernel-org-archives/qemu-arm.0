Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2062883wru;
        Thu, 16 Aug 2018 09:46:33 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPw4bXgXrDSMwtioxxPAj2xT2YCmnR5ciVfEx6WGQyGx6gMfBqoZY0VMCZZSwzO/uiAlqwmC
X-Received: by 2002:ac8:524f:: with SMTP id y15-v6mr30106865qtn.227.1534437993207;
        Thu, 16 Aug 2018 09:46:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534437993; cv=none;
        d=google.com; s=arc-20160816;
        b=UuyZyzRPWUcsoLM8JFOAF3cY98l8MOlHospljPW8IiFgSQCZ209jLbJt5k0DshtINR
         RQGuzfX2EZZ4SS8P3UmIBn3hwfmz7FLD8USBbaOmKsmbx/IR+heCcZ6FIQev3sUhzLbt
         +hx3pr+CvaXebHsKWxD8FyHGc+00621hmXfYBw+/pvSNVSMqyAD/WNCXrOkQ/6WozeZT
         hHqHT7Pc2iwrmkzfPo0cfS2JSzWqR2GpqtW9zR3X3STMMonAs6EwIFTk/rz0TtMLS9EP
         DF3pyJ3PR2jKgJSww7TKwWA2QIu1SxlaGj7RRczxrOJKMvluujZvrklqF8FQU+ZhQ1Ow
         mT+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=J+Vk/aNyRDePZJhcmX9cSE6IDAHBnuiBjuSNZWteZt8=;
        b=ymtMdJ/Iw3yFLcV1ATgFHB92anIPzL1eihQpEq5GMeiBSeD49ejau9Wo11Pee4SY9A
         XdCOuWDgd3xqgvv5Uc3L59G+V6C4u8BGkYe0LgINIFU0F5tdVRkjq02NndSUyn9gyfPU
         cAQnm0rJfNPVKkb5lLqlkZIp/A7ea+9vbq7u4oPzyIyiBzGR2y99YgcMOrPp7X/x207g
         HjSpIOmHgdhsXYywrvfvyyZmO8NjtUMeVr3gf19HO+FuBZAKaD/koz6bocHiLbV0yBjt
         GmBPnZDjNtiscxBijHER0I26a4po3tVCVQOcHIH+ALUqj8+cPgsWp1xXHckRnobECXz+
         j+eQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c1hxaqR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p16-v6si5307437qvo.24.2018.08.16.09.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 09:46:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c1hxaqR0;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqLPs-0007sM-Kd
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 12:46:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqLEw-0005cr-3s
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 12:35:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fqLEv-0005cz-Ew
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 12:35:14 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42803)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fqLEv-0005cY-8T
	for qemu-arm@nongnu.org; Thu, 16 Aug 2018 12:35:13 -0400
Received: by mail-oi0-x241.google.com with SMTP id b16-v6so9103272oic.9
	for <qemu-arm@nongnu.org>; Thu, 16 Aug 2018 09:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=J+Vk/aNyRDePZJhcmX9cSE6IDAHBnuiBjuSNZWteZt8=;
	b=c1hxaqR0fHZTMuUg5RP8t6I3fH80ZR4apEvP8GME2vCWCrAFBrGv15T90cALX3BIvb
	DfsppALWz1jFJJIt+rKyCAIwKbz28IQiXWxdvj+xyd3do+4806/cj/SuESTitbT4kglp
	UdGFA5qp8Vd/joZHSmUlvNvvtBaKI+GT2synU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=J+Vk/aNyRDePZJhcmX9cSE6IDAHBnuiBjuSNZWteZt8=;
	b=E4asNEQwO9aloi/GzBL0ypk6DTs+JW5/OXQLiWY/pjIOWEydhB/Tsp1s61IM5ZOaIg
	YIm4ddgrpCsGx1s2eUxB2RT1V9l6ldKPNA01gD79jiVWG7h23XXvuR1YywwuYsiPoY29
	57ZpWrnRlBswrcq7mM1uAIgVgW+zeqERzhPhgucO7klzs0FbGJrh5etWuIZZ8Tnc3wsR
	97mwuRodrcEEKgK4QqUmbCTLL0/7fBeXtx6a6jZcN+Jyh2AkUjNes9hNhHH3IbcLwuI0
	SSMokl4g81l3mNbKIqaFwiF3yPRSkEFH/h5g+Qnso2U8R/0gyYfuEBQggkEjZHYt5/l4
	fHNg==
X-Gm-Message-State: AOUpUlG4pDX+Ah+FbcAsO0mEL5mS5OgbAIUv3OoWl3ZDmiJ+uP5WsClV
	1ZvxbRubeOoi/JOntm/Zazr2Hf164jSlzrEmeaNLWA==
X-Received: by 2002:aca:4204:: with SMTP id
	p4-v6mr29697668oia.242.1534437312616; 
	Thu, 16 Aug 2018 09:35:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 16 Aug 2018 09:34:52
	-0700 (PDT)
In-Reply-To: <20180816120533.6587-1-rka@sysgo.com>
References: <20180816120533.6587-1-rka@sysgo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 17:34:52 +0100
Message-ID: <CAFEAcA9DB_xNyxsFbWL9aNcV_ZoUAhj2B+d8Y7gg9qOLCQgFvg@mail.gmail.com>
To: Roman Kapl <rka@sysgo.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v2] target/arm: crash on conditional instr in
 it block
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
X-TUID: kwXWLJaH/y08

On 16 August 2018 at 13:05, Roman Kapl <rka@sysgo.com> wrote:
> If an instruction is conditional (like CBZ) and it is executed conditionally
> (using the ITx instruction), a jump to undefined label is generated.
> CBZ in IT block is an unpredictable behavior, and honouring the condition code
> is allowed by the spec in this case (constrained unpredictable, ARMv8, section
> K1.1.7).
>
> Fix the 'skip on condtion' code to create a new label only if it does not
> already exist. Previously multiple labels were created, but only the last one of
> them was set.
>
> Signed-off-by: Roman Kapl <rka@sysgo.com>
> ---
> v1 -> v2
>  Split arm_conditional_skip into arm_gen_condlabel and arm_skip_unless to
>  a) cover all usages
>  b) do not force callers to ^1 the condition
>
>  Add note about CBZ in IT block to the commit message.



Applied to target-arm.next, thanks.

-- PMM
