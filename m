Received: by 10.25.159.19 with SMTP id i19csp451464lfe;
        Sat, 6 Feb 2016 05:48:42 -0800 (PST)
X-Received: by 10.55.26.136 with SMTP id l8mr12750704qkh.103.1454766522655;
        Sat, 06 Feb 2016 05:48:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c191si21152772qka.29.2016.02.06.05.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 06 Feb 2016 05:48:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:53815 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aS3EA-0005ag-4I
	for alex.bennee@linaro.org; Sat, 06 Feb 2016 08:48:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37348)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aS3E7-0005aG-VL
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 08:48:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aS3E7-0005uE-8h
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 08:48:39 -0500
Received: from mail-vk0-x22e.google.com ([2607:f8b0:400c:c05::22e]:36510)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aS3E7-0005tt-42
	for qemu-arm@nongnu.org; Sat, 06 Feb 2016 08:48:39 -0500
Received: by mail-vk0-x22e.google.com with SMTP id c3so25927914vkb.3
	for <qemu-arm@nongnu.org>; Sat, 06 Feb 2016 05:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=oJgRxvMyAsx3CKe63XEOgmyVtJI+jaRibvGEZCD5DSs=;
	b=OptkFG8iiPfWs6oDBKpSybSJ1obkrmi2Kha9Jtvo+90lvDpvGfONR958ne7jwt1SsS
	+tthm4tiRDl8Enq9v5PfCmPre4uGCLVijKj7PnXM1Bt2Uz00uSjGkypX6DrG5sN88Hve
	dzGqhd39jOm+c+6IVIFIil74Gg4vPSd7r/RpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=oJgRxvMyAsx3CKe63XEOgmyVtJI+jaRibvGEZCD5DSs=;
	b=eTN+cfbi5DI21CqYE/GhKkAwV3SILYMCUJDT0iczeqMSEa/CoiAZpngBZpr9Un/1N+
	4R+al43NCsNHebEo8wcXcNci20ZEMnjwgkVJOOf8biacEhbcAtzaFibR7SvxmNbAFwdS
	tQc8rqqXOHk1Z3BEACSwDQNWLlbC5rb8cPRcS8g2blL3xlsKVLdfwXf988j6JrSJzBKG
	tXnXMoP1U5YfCAKtnANb3LAebtuw0n2oze1UOfyVLvVDsyluYGx2F1kioKHfQdSA1wk4
	f/6RAEiSjx6QTjqG7vlgR/lrW0MJ7+DEWLVAo4+198EHffAYTktZy/uO93JuRHLTJJVw
	uK3g==
X-Gm-Message-State: AG10YOSoHFGLcan1HAo5458GTHqfpJp3PcNP3eKE1eB9AE71zFKKqjIn/JY+47O4hS/Z1wqDKHIJv+HutcaRGFW5
X-Received: by 10.31.141.2 with SMTP id p2mr13363781vkd.37.1454766518622; Sat,
	06 Feb 2016 05:48:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Sat, 6 Feb 2016 05:48:19 -0800 (PST)
In-Reply-To: <20160206121756.GC3913@toto>
References: <1454506721-11843-1-git-send-email-peter.maydell@linaro.org>
	<1454506721-11843-4-git-send-email-peter.maydell@linaro.org>
	<20160206121756.GC3913@toto>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 6 Feb 2016 13:48:19 +0000
Message-ID: <CAFEAcA-KxmVhGxk4d=+yMj5+NxCaPeGNc_3m4guB3Y72hSMcDg@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22e
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-arm] [PATCH 3/7] target-arm: Use access_trap_aa32s_el1()
	for SCR and MVBAR
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: rAhV/gsdYa68

On 6 February 2016 at 12:17, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> It seems to me like if EL3 is running in AArch32, then we shouldn't
> trap accesses from Secure EL1 but I can't find that logic. Am I missing
> something?

If EL3 is running in AArch32 then there is no Secure EL1 -- all
of SVC, IRQ, and the other PL1 modes run at EL3 privilege,
and arm_current_el() will return 3 in this situation.

thanks
-- PMM
