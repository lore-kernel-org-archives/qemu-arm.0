Received: by 10.28.173.206 with SMTP id w197csp2500473wme;
        Mon, 8 Jan 2018 05:59:19 -0800 (PST)
X-Google-Smtp-Source: ACJfBouypmYlA18S3oE+xeqXH9v4KOyR7/No5i5f3qCpmZt0gUWhUX3JJAJZIGqlsKzsVi6Vp+0v
X-Received: by 10.129.158.145 with SMTP id v139mr3962133ywg.165.1515419959748;
        Mon, 08 Jan 2018 05:59:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515419959; cv=none;
        d=google.com; s=arc-20160816;
        b=mH8HCetTP+9PSfZ7DIYjdpCBskeZFkozErl0gp1az2wFg4AHm5+mxNFBSHIlGA2Wk6
         3fr1FJy01Kvo2F7JheK/UKncf5oGLGQb2EDippqm6Fq3oHg8irinVHAQygZl/sZx3F4j
         H+PFN06txg5RLzH8deQ5OWd2+1LV+ZkzY9hgFSwMwqvo2jyXU2v5Mel6iP5TzO5sZPQ0
         Mv1s+YvE+js25ye2V3+9XpYczA0v5QmITyuHMfBLlYicJxdIpMJK7CalHixsRRWN1/pJ
         asvWbZ6SoE/GjqGs6GLPn1VYH5I5GE7f/KYwSNtpBiGaaENC5wtQpaTl2Cg0eEpu/Jb0
         JQmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=4BjRus0ujfvldrW01u0ubgmu9FRafFAKR+KYFPh2ELw=;
        b=f0ra5YPC2gM9UT8H/L2TgMsOq0dmswNdUPCrCcyRE8zUj6AqB5ywKc/gDkGwRktegG
         ZOZH6uCkvrBZut4UqwUNUlxfufvzunDSOgk5z5V50JeZdyNDl/ZQF959JD1Wua7ml4F+
         WQtKXBPdDUL3TeNDYJG80pCwHXAQyl6n0g01rSU3qpW+HZeBUMtjHtswOwaEyc2OOA49
         Mb4RrCF5IW/nCp0KAP3RfepnVPGZW42aCSxdzWYPa4QzlPPv0l0WhNvlwBhLgiGSQC6V
         o6w61gBcB3oP5bpMJ6QdlSjCXhDQ2Id5QX2W/Pfpj1TliMk96amb107LBE3NoVA5qcqi
         E/Sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S/yRc1LI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x13si2522153ybf.378.2018.01.08.05.59.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 05:59:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S/yRc1LI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36094 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYXxP-0005Hf-8s
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 08:59:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYXxH-0005Gl-0t
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 08:59:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYXxG-0002p0-7Y
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 08:59:11 -0500
Received: from mail-ot0-x230.google.com ([2607:f8b0:4003:c0f::230]:38475)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYXxG-0002oe-26
	for qemu-arm@nongnu.org; Mon, 08 Jan 2018 08:59:10 -0500
Received: by mail-ot0-x230.google.com with SMTP id h2so9268481oti.5
	for <qemu-arm@nongnu.org>; Mon, 08 Jan 2018 05:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=4BjRus0ujfvldrW01u0ubgmu9FRafFAKR+KYFPh2ELw=;
	b=S/yRc1LI1cqRY1FOjjdzyEi2bRQQw6fx8G505ns5KUWsCKOoONOtjVQPgGvJoFgLyd
	QlLAu62XJpPGgUiYH2SZYkmA5Ux/+vxQDfIujd2vIs77JsnAKPeLb92ng1Sb9A0PcwLP
	YIBSVMbXO4VFVVDyxdMdvkRY5/kO9LFihuoyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=4BjRus0ujfvldrW01u0ubgmu9FRafFAKR+KYFPh2ELw=;
	b=svbreHExJBtsIgfYOn/FSO7JwKVeiRAf1Oru+MO+/JtEHb2eqx/GtPwS7M5d/gyArY
	skclvi/vUsDYM7w0/3joZMTkX2YIApu/grQdNho7qnFEwu6GoMFv2SFkP+1ElaQtzfDs
	Mf30E3fRR5UVVKuOrsQA4Nm7rllFKySTURQ6fJidcJEiidCJL/Xo1bvLPqHtDVK+NUGK
	uoxFwVPyZT5wujjID9kNtSdADDlU4THTxGG6djKcEJlymYzwtnIJ4xBalZGdPLMCHJPN
	VRvQ2ElJkmJxPFMCO2GLdXXochCQTzevhhHS5gUgyPKu/Rp2NLn/YlNDTdPeOaOgktbM
	vxjg==
X-Gm-Message-State: AKwxytdpSPfZtlJmpQaRGBntVwxz+8GuCTdJvlmO75x8LktKcrh+1Q4N
	ZmNr1VJl5JG6p5Ff1ogWQ3t3VdHx7eQiHH2lmgWCig==
X-Received: by 10.157.29.233 with SMTP id w38mr5868966otw.24.1515419949211;
	Mon, 08 Jan 2018 05:59:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Mon, 8 Jan 2018 05:58:48 -0800 (PST)
In-Reply-To: <20180102193622.27215-5-andrew.smirnov@gmail.com>
References: <20180102193622.27215-1-andrew.smirnov@gmail.com>
	<20180102193622.27215-5-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2018 13:58:48 +0000
Message-ID: <CAFEAcA9aHoR84nhGZwLfHht+_7UKBC+AovOyLwzc-2CsiZSmLw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::230
Subject: Re: [Qemu-arm] [PATCH v3 04/11] imx_fec: Move Tx frame buffer away
 from the stack
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xjGnvH4/cggj

On 2 January 2018 at 19:36, Andrey Smirnov <andrew.smirnov@gmail.com> wrote=
:
> Make Tx frame assembly buffer to be a paort of IMXFECState structure
> to avoid a concern about having large data buffer on the stack.
>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
