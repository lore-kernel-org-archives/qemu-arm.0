Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1518739wru;
        Mon, 16 Jul 2018 06:39:56 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc1ecvyPlAgR6xgShcQPUEzy5Am5ReL7195QfVNZW7vAKKY5BDkrgi9cS61krZllXIL1Lya
X-Received: by 2002:a0c:8b11:: with SMTP id q17-v6mr13327516qva.193.1531748396110;
        Mon, 16 Jul 2018 06:39:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531748396; cv=none;
        d=google.com; s=arc-20160816;
        b=Ccx+m/H74V18WgqBR9RptHxgvJr8aJCBrhAFKTrbhGiZ9/qOOHAiJ7vTxVLyZu73cD
         oQRoPabjfoR2iivAim+O2y3B/eydshHGFjFYdpNPwQ8VxMNWhWv2i1/tMw3D4B86sovc
         ZF7ojReGjZmjjvbR38QHJys2LHIlOzKpaPpH1iKaRiN0xmiHFKE4xQMneR1T1eZhTIeZ
         qsP3Xg6FCQM2/HPsx/njn7YAcXSoqWVGlCwNeHvY6uFKHVOZ3dco8EXr+IaM7Q5Wh00m
         /xhCXEQ7hbYhd50DuhjwJHQnerzCXzni6Xfk166nsw/YOJ4uuxhu9ZsA1xkl9NZo2aXW
         nngQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=vYsyFd3z7Vz9FXk0yamy16bz+jvksM13DymlyW+CLKI=;
        b=SiacGrxs3KI2Ng8NZevBirTqUaxaiz2zcDih7iVxdYz7xupJm8PSDDVjXUgvWmNjh9
         GZQZ+982TUfAk4h9+vPIz+WakcdAXtvGms2B2t997o50f8tdVxHVd5EaY2BAm0JGve7y
         qJW283PYUGBD5mxoF2kvPbfG5q64OWRPQa6sAP1BJwSe6R7S6RP+oooclV+RREgtaLIh
         aRAdDW6ugrJD86DHWl96y2MQO3rqXMynG+Z91sbiEX2dSVrWeX0UPklGTcva8VOcYp8r
         ZeuPKWcGnze2AY+EdR30pC6cHJmJuKBPNaf1ugvnTIwE9IlB8QXwnomUXZv38Nl9i5ij
         3tGg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=an6Gyh0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d13-v6si1037833qve.226.2018.07.16.06.39.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:39:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=an6Gyh0G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51824 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3jH-0000Of-L3
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:39:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56822)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff3j6-0000OF-6C
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:39:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ff3j5-0005Uj-Cb
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:39:44 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:46789)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ff3j5-0005Tk-4Q
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:39:43 -0400
Received: by mail-oi0-x243.google.com with SMTP id y207-v6so74809009oie.13
	for <qemu-arm@nongnu.org>; Mon, 16 Jul 2018 06:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vYsyFd3z7Vz9FXk0yamy16bz+jvksM13DymlyW+CLKI=;
	b=an6Gyh0G/0tmwm9lAzRDk4IP0Vcxc621zGNsF9PjLMnqR8XUu4WfSFciYLYOkP32tq
	zzxAWldszSI1C/yLDc2ZgB+QK5vwTHtRPdaIVv7q4NAZGiQ+OqrT48XvVAe73tgbxKeG
	uNLxe8cj5LOvI8fBh+VnhRs6ifb1nZbhin228=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vYsyFd3z7Vz9FXk0yamy16bz+jvksM13DymlyW+CLKI=;
	b=KLs5bf57yn3TnhJXVXvPZ7FhgmS0AJnxDTX0qYJ60gbEqn6eIRnNsdHfnGW2lsdWO8
	fz4+G8OEfustbI/ZtBUFld/rpxtv78XQ4gBuI4ZljbqIEFWeSSyZaSGhp6Xh+BnlzSNK
	6MiUT6D0rr/lc8MgjAW2Ef46CBZsM5M5lY/CZTFWu6YcahGOFBLLtiQtBg/M29wqyiqy
	TP9TIdVy9subZhY2yGGU7GWa2V6mHn1MW5NVnE6AyQDwQAdzln6pI2lWgw5qlmL4xll8
	R70OJRTuiV56eQYhcI2gw9edjlhQNX2ueSHzeErACV3iw/2MM/StmZUg50Z0oh1soOU0
	0Xdg==
X-Gm-Message-State: AOUpUlHtifI4lNSVd0gk41YDPqtugZxp7gJty2l/pmamvJ0mzOUiFVWc
	vttk7F207HQtkXrLkV6rT8baO37HykY68h9LBL6VqQ==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr16686478oia.164.1531748382368; 
	Mon, 16 Jul 2018 06:39:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Mon, 16 Jul 2018 06:39:22
	-0700 (PDT)
In-Reply-To: <1531415537-26037-1-git-send-email-thuth@redhat.com>
References: <1531415537-26037-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Jul 2018 14:39:22 +0100
Message-ID: <CAFEAcA9_TrSTrcHBGS1mAd0-w2VSQ0AP3z=EPM_U3dTF3k_R1w@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-arm] [PATCH] hw/arm/bcm2836: Mark the bcm2836 / bcm2837
 devices with user_creatable = false
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
X-TUID: qPQPo7NRqT6v

On 12 July 2018 at 18:12, Thomas Huth <thuth@redhat.com> wrote:
> These devices are currently causing some problems when a user is trying
> to hot-plug or introspect them during runtime. Since these devices can
> not be instantiated by the user at all (they need to be wired up in code
> instead), we should mark them with user_creatable = false anyway, then we
> avoid at least the crashes with the hot-plugging. The introspection problem
> will be handled by a separate patch.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---

I thought we'd changed things so all sysbus devices defaulted
to not-user-createable? Am I confusing that with something else?
(The set of user-creatable sysbus devices must be very small...)

thanks
-- PMM
