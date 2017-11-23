Received: by 10.223.159.82 with SMTP id f18csp864268wrg;
        Thu, 23 Nov 2017 07:19:48 -0800 (PST)
X-Google-Smtp-Source: AGs4zMYRYEGBHcQW2f6SUYdnGV53floMGXDVjVq6mFsmlMVTeX1WWXwGDjmXpmpUMK5N7nfZK1ke
X-Received: by 10.129.120.23 with SMTP id t23mr16823268ywc.513.1511450388708;
        Thu, 23 Nov 2017 07:19:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511450388; cv=none;
        d=google.com; s=arc-20160816;
        b=nKtWAONXaYo0/u/KmD9Hdelgpd2dxQttHGxwquowG6IqvzbkUmrL04cZzC475SOlfl
         tKBz/E0Rk0Dz+PlQIj68DMYsaDwSZVzpLRAULB37KRblxmHzMuYuJQ5wZaVNqIoXLXMG
         Znr4II6lRHvGRub760Du59Etk1pwLdR8pp4JK+xulIuLXjwPAO28jZOtin3vNGgHRl3c
         Jac+/N2VbEZ4VIF+tcVKTeN6VpwXYmqtZFN4x7/7CLkLbwYK+aApzdXpySZxW9s6KAZZ
         OGvJulf8iB14Ip5a30UM4jBil7GUIHDh0HJI4/3WaLWuT2dg3xJz1g/J0p/Oz/ppudmf
         m+kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=CThzUQ6Aom5D2NiKnDmz8nsj0NHbwULLKwWoUh8mlqQ=;
        b=tF5JsJTfAwsdOYjUQ8Ch7GpAR8i45LlqorC0PMk/c/TlO0oGbVKv2ZgD5xEUuKucrP
         LIAML7q2x/mq3KTgWlp1Hdo1X43AquLD6xhASV1OEJUC+IiR2ZCYOrttd1QMYuMOv1WR
         N5cQbxXI/7j8dar0HZE3Mj+JjqyQIa47SVKhOe9U/khtywsQANmRO9Fu6bwEo5iKymZX
         vRR0vb7p8a+HZulKYJ1jyYuYUCMSJODTYCT+ByrHAY+mRDh9phyVcwQrB7mAMTuHDcut
         z9++XA/OBY5kXwRroDVe12T7jtHSpSMvTnWYs5PbGaynq/GUmlM24xhBsmuhIoeRgzso
         nhkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DgTGkBjL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v75si355389ywc.592.2017.11.23.07.19.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Nov 2017 07:19:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DgTGkBjL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44838 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHtI4-0005LG-5j
	for alex.bennee@linaro.org; Thu, 23 Nov 2017 10:19:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40361)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHtHn-0005JP-3J
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 10:19:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eHtHm-0004SC-1K
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 10:19:31 -0500
Received: from mail-oi0-x242.google.com ([2607:f8b0:4003:c06::242]:35766)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eHtHl-0004Rc-SX
	for qemu-arm@nongnu.org; Thu, 23 Nov 2017 10:19:29 -0500
Received: by mail-oi0-x242.google.com with SMTP id e142so13364977oih.2
	for <qemu-arm@nongnu.org>; Thu, 23 Nov 2017 07:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CThzUQ6Aom5D2NiKnDmz8nsj0NHbwULLKwWoUh8mlqQ=;
	b=DgTGkBjL6KU0qNFwToOLehjGsjsVApq21h+y0IuUjuaz2X2nnD/vxKyqoAEDmeZcmW
	I53PYIF47mLSy7XtAUUs3vSDw5SkXgA+DLSU9SaZEbPLdl22E0xZ3TSXRQshsznrmcD0
	O8JrhQz6tX9asT+dA/jwEMjck1Od8nYX99Hrk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CThzUQ6Aom5D2NiKnDmz8nsj0NHbwULLKwWoUh8mlqQ=;
	b=QB+rFauw5J8mjb8Bgh0IunxYg/WRD7xSx8AEPLh+2k2JPlM1L/eC+dd3mLtmrkIP1S
	4eywyx+T475OTzKk0S4LdCno2ObhM9sPEg7QEWtatJ4HWE51Pm3gRva4qkGRPVDCErZI
	BCcb9btFq6gTX0rOT3QNZMoGNEtipRcfxJNDrY5aoo0/1ghCLx8yPBJLpC7QLei+mzBM
	S1TO/Gmn+hILKUbYnV38/JkP+/PzlU1H7sdqUK7dmjAJT6DxMxxTRWHydKLGeroTAXic
	uy691t0BtWnLRzSrrTZAsAZHdsk/IF/qVTZn/CD/qYDc6+1fZlPV9HughkQY1YYmoYjI
	b9sQ==
X-Gm-Message-State: AJaThX7EyBZVnFfw2seAZloSu5qslmOwsi7sjSndqs/t1G8DiNRsgvfQ
	+y3xnOUIelZvE0RiVdhL17RxAKKYr/rWl/iTt2FxTw==
X-Received: by 10.202.114.22 with SMTP id p22mr15855832oic.327.1511450369172; 
	Thu, 23 Nov 2017 07:19:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Thu, 23 Nov 2017 07:19:08 -0800 (PST)
In-Reply-To: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
References: <1511448975-28326-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Nov 2017 15:19:08 +0000
Message-ID: <CAFEAcA8T4cShPYONdo8hiaZKvd+zq9Uo1o5awU3rA03uu8Vsiw@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::242
Subject: Re: [Qemu-arm] [RFC v3 0/4] vITS Reset
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
Cc: Andrew Jones <drjones@redhat.com>, Vijay Kilari <vijay.kilari@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, wu.wubin@huawei.com,
	wanghaibin.wang@huawei.com, Christoffer Dall <christoffer.dall@linaro.org>,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QkX2hNBOESYH

On 23 November 2017 at 14:56, Eric Auger <eric.auger@redhat.com> wrote:
> At the moment the ITS is not properly reset. On System reset or
> reboot, previous ITS register values and caches are left
> unchanged. Some of the registers might point to some guest RAM
> tables which are not valid anymore. This leads to state
> inconsistencies that are detected by the kernel save/restore
> code. And eventually this may cause qemu abort.
>
> This series adds vITS reset modality:
> - the 2 first patches bring a minimalist reset through individual
>   register writes. However, with kernel versions < 4.15, this reset
>   is not complete (vITS caches are not voided).
> - With kernel versions >= 4.15 we can rely on a new ITS KVM device
>   reset IOTCL. The last 2 patches introduce the full reset.
>
> Patches 1-2 have all kernel dependencies resolved.
> Patches 3-4' dependencies were pulled for v4.15-rc0 but as the tag is
> not set, the kernel header update still is partial.

We don't need the change to be tagged for us to sync with the
kernel headers: if it's in mainline that's good enough.

thanks
-- PMM
