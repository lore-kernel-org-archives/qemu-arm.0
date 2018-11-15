Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp7238564wrw;
        Thu, 15 Nov 2018 08:50:33 -0800 (PST)
X-Google-Smtp-Source: AJdET5dxBR/HIzEwfAt5Gf0/WdbV3iPR+sTlp21M+dOea1mQGD82WXksv1VScSuQX1z4sVge3f37
X-Received: by 2002:a37:d643:: with SMTP id t64mr6555211qki.201.1542300633665;
        Thu, 15 Nov 2018 08:50:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542300633; cv=none;
        d=google.com; s=arc-20160816;
        b=F3h/+lHskMoWrq7i1XpvDZ0+N2Nd2jbb6ZBjK8goyd3muRgZZH0cRsDovYGgrGguXb
         sXwfsXSqBjs4jI6m8Z1LKO03fF2fKhuqskaRnPz8sFAM2/xUgraXU2ebtYENKA3b6U+i
         89d0sAXB/y/GW1SykhWiLRTj0t7ky9A1XcYAW8rVhGpfPatsec1il1iPQ0pfNOb+CtGo
         0SAlLCk8LZCgOqVmAwUcp0Dhwu4zFTXQ7m3s0W6dnJeZ0vd8i5qFhJaddIy/lgAg0PTS
         oxWNjqZs7hYBnTBWNMk4785h2ZWkCc0Ad6K9sp08XrBbE4pBfLkkq96hlHEq3r5r73vi
         bB9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=XGHoz6l+K5KidK2DEZGorNL/ZWNb+9mg84D2FSIFOTs=;
        b=YD2XQlR3z/+dN9SUbRVKS7BRP3po7VQNqh5fW0F9o/7RN/0MGZV0DixlcVfGl6rufC
         BbgVqvGVOROINu3RImbUOcPDwxzi/QTGSMB9829cHAxktcZ0jPMurhSSql3Bz7a93MZj
         gS9q2vn/0nNWJ5KbvXzRNyKfMru7z4ld1K9esqPLMtGJB8NyBQjHMG4RHjousu7IHo22
         sPiItuYD7G0DYtt3pi7AMSEDeyd1U6FBvMoGc/fxBfY3I/kAAp5N9RlnhVWNjf4TsrBC
         257/vvSN1mn6iIsUilfOf1A7GYQ9pqQmAJLgWl6Fn2tw8r0fdmjBVHbv1GygXSfW4ovU
         xm9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jkKsp4wo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d27si1294108qvh.180.2018.11.15.08.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Nov 2018 08:50:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jkKsp4wo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNKqf-00007Q-5l
	for alex.bennee@linaro.org; Thu, 15 Nov 2018 11:50:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44645)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNKqA-00005p-IR
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 11:50:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gNKq9-00047t-3g
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 11:50:02 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39749)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gNKq8-00046g-Lv
	for qemu-devel@nongnu.org; Thu, 15 Nov 2018 11:50:00 -0500
Received: by mail-ot1-x342.google.com with SMTP id g27so18624469oth.6
	for <qemu-devel@nongnu.org>; Thu, 15 Nov 2018 08:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XGHoz6l+K5KidK2DEZGorNL/ZWNb+9mg84D2FSIFOTs=;
	b=jkKsp4woK+a5BrdLCxhsDe1SqRN6hK31sqXeL30r63f+QJprcpxSPJ9SGaKRcoKY8B
	wPlMfNewgSuKBWnOTYQUKSnGXfo4A8yB5Y+vXJbRWlLg03HAssROAZhpsTQQhKsPp4bK
	REgXOjTDQ1lkivV7x/QbWExL/3uDeHE+i11ws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XGHoz6l+K5KidK2DEZGorNL/ZWNb+9mg84D2FSIFOTs=;
	b=JjRbsRjxMMFRcRjGOYh/EVl6jA8ym2NXV53rUoA21hVleQpMt0ufgGy0V5JFf23OFS
	sV0o/jLPOTys2QdgrUwPCiOqi27j3762T7dRmXa+CSAKyutRaK18xLHr17AYLayyg2KT
	S/wkLwKBGfZhOP1nGxxizRgHXTBs0MIh3za+MQxgGpi64G7mHJzz6j9w0R9aMlcn5PLa
	7H9KZK88eb5jocn6ozzXcGQAIA0Lcvzso9kl17V9AzZry7ZDJhpVa3NwnSywW05qPe5R
	Wj4qHOugs1twQvRZqc2XuKvOj/NAV++Wfkm1mgThdU+eIClAnRlyYkB+lWoH62PNyjd9
	zJHg==
X-Gm-Message-State: AGRZ1gJRUHtMHGfK8mXEtZIa2SoXOWPMr9ffN5co0iCLZmJt9606CbgG
	5jBsMFzzYofp6w+4glN53QKQmQk3rb/CI9Kz1L1eDw==
X-Received: by 2002:a9d:156d:: with SMTP id z42mr4248383otz.201.1542300599263; 
	Thu, 15 Nov 2018 08:49:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 15 Nov 2018 08:49:38
	-0800 (PST)
In-Reply-To: <20181102134112.26370-2-richard.henderson@linaro.org>
References: <20181102134112.26370-1-richard.henderson@linaro.org>
	<20181102134112.26370-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Nov 2018 16:49:38 +0000
Message-ID: <CAFEAcA_8cgFgCvs6jZ0rb-QPf60YkdPJgpu0SzCh3SfKYD560w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH for-4.0 1/4] target/arm: Move
 id_aa64mmfr* to ARMISARegisters
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UQgslggUgnUF

On 2 November 2018 at 13:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
> At the same time, define the fields for these registers,
> and use those defines in arm_pamax().
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
