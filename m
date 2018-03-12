Received: by 10.28.91.67 with SMTP id p64csp779340wmb;
        Mon, 12 Mar 2018 06:44:07 -0700 (PDT)
X-Google-Smtp-Source: AG47ELvE0Ln3zMvjb8M00xGRPp+du94OB9Viuact9ZXzXrFu/IOwykkeCWz59Uvjku6nCq7mGxa7
X-Received: by 10.129.177.131 with SMTP id p125mr4660786ywh.61.1520862247100;
        Mon, 12 Mar 2018 06:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1520862247; cv=none;
        d=google.com; s=arc-20160816;
        b=Oj7HdHGGmID6P5J/fwAocKUVLy0STAO6PuhvP/wOzBuMyOJqlyqbokPZc6Up3JQmQH
         HoCuNER6p/dLYty32/jQSuQvo8RbYGR/BJN+bRNO8PcW0fsy0I42GSUF7dqMKgMkgaC7
         HkfY8FNT2OXv7w0w3VI2JHsZOgJGYlqt4OgdEnTo+yRJef60TtQOzk1EaNTljyvOicx/
         9zN8hX28FEriD+JySRXtR9Y98TCgu899RstGQkmSmgObyn3Wo3PI+M+VF3bm4dk0A6Wi
         NGv6v4L9bwVhgkEKRu4+OsNMCqfJYxBh6LyXf6ZFxbcgWsE3hEpr0UnfqLdvu57II1zy
         tiQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=ILNswcluNl6rPNHWelP+DUJ0u5PXNHMVk5VnSlIIHEE=;
        b=kRIqGNbLxTjYX9zJeXQNnoRXPLmsvlNZWvRqTjuW+pQd9UzcDXHn1OnNGKEemlwxCR
         VbB8Gr9FTj2NHvONHmXIrR9CKdWb/yAewS6vC1rHf6XRS1gNIlPWXP/vH0j+2YFL8bEM
         KQNpVDJ6Z+YTBjdqdIXn3O7DOkuq3UA9S7092SSvSeAo1vTt07XDx1N5z2BMpP0Bg2yx
         OWF4M3z1w429w0R3yRjMchXa0MY3gUANRRmppfdCHzItuzQyaA+OrfZcCyRO9ToD4VCt
         RlJZ/euxMO5mmQwqjcRToUKAHAzSJLQEheA8LyDzpMxsTURkVL4X+KxjBuEKQOdkFHms
         zFSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QJ2rJvwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q2si1251549ywj.109.2018.03.12.06.44.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Mar 2018 06:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QJ2rJvwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58941 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1evNkE-0005lM-JA
	for alex.bennee@linaro.org; Mon, 12 Mar 2018 09:44:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evNk6-0005kj-33
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 09:43:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1evNk5-00035k-0L
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 09:43:58 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:44209)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1evNk4-000351-R4
	for qemu-arm@nongnu.org; Mon, 12 Mar 2018 09:43:56 -0400
Received: by mail-oi0-x244.google.com with SMTP id b8so12295145oib.11
	for <qemu-arm@nongnu.org>; Mon, 12 Mar 2018 06:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ILNswcluNl6rPNHWelP+DUJ0u5PXNHMVk5VnSlIIHEE=;
	b=QJ2rJvwXlQPa1R7TC/UuPsM17B48JATSKG7QDBvs5FUIhuPpwaJD9EOOHnJ5Ox2a9E
	1criJANcTL91L90Tw8S3eleIZMExQheoB/L99nBI2CKv5jb/3HQOKD/Jpc042awDO6xG
	K3PBdmidJhHlv6gcDp9vBcXqZriUYOiavkhL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ILNswcluNl6rPNHWelP+DUJ0u5PXNHMVk5VnSlIIHEE=;
	b=m0eNeV08H6wgQTIsxOkFj2ST8AuFNUqzEmEi31WAyIErlGf35L1lGDbqVOJFGTw7qv
	BPhlhQGSspBV04J9aSWDHrkFPw5h8MZ8T6nSf+dPdIm4Dv43KAsBj8nYawbX96vcf20F
	xt7NzisSnw4JPHOrIE7lcBDkwRrHvm7eFb4+BkZDs5GJL802AdXqilkx4f1Eyi3/PUka
	yYzcxsEE9nMRezu3s9PTsI9ET28G3MxMRCYFTTGwWgGP42evTo+uIEpndh3gc9S/0dvq
	h5nh+OQdqFCDofaHkOgWfoP4AfTA001/MUdBdx3/IgUl+p+qRq/+dY9eULIKUEXreEKJ
	PVjg==
X-Gm-Message-State: AElRT7Ep6TFdDg8atvF8sSkTFOlx4UxVwA4IItp+Udgf+HQMLGZEaru0
	l14lvK4DAA7RmR1fEPgaEv0zcPqBG14a5pRREfiLJg==
X-Received: by 10.202.61.198 with SMTP id k189mr5050227oia.252.1520862235980; 
	Mon, 12 Mar 2018 06:43:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2164:0:0:0:0:0 with HTTP; Mon, 12 Mar 2018 06:43:35
	-0700 (PDT)
In-Reply-To: <1520723090-22130-1-git-send-email-linux@roeck-us.net>
References: <1520723090-22130-1-git-send-email-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Mar 2018 13:43:35 +0000
Message-ID: <CAFEAcA_M51Yv-B78uY9NXBYSD02aXf5As+eXNTcyrNxYqtML=Q@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH v3] fsl-imx6: Swap Ethernet interrupt defines
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
Cc: Bill Paul <wpaul@windriver.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
	Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Jean-Christophe Dubois <jcd@tribudubois.net>,
	qemu-arm <qemu-arm@nongnu.org>, Chris Healy <cphealy@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VwAR3aYImxOb

On 10 March 2018 at 23:04, Guenter Roeck <linux@roeck-us.net> wrote:
> The sabrelite machine model used by qemu-system-arm is based on the
> Freescale/NXP i.MX6Q processor. This SoC has an on-board ethernet
> controller which is supported in QEMU using the imx_fec.c module
> (actually called imx.enet for this model.)
>
> The include/hw/arm/fsm-imx6.h file defines the interrupt vectors for the
> imx.enet device like this:
>
>  #define FSL_IMX6_ENET_MAC_1588_IRQ 118
>  #define FSL_IMX6_ENET_MAC_IRQ 119
>
> According to https://www.nxp.com/docs/en/reference-manual/IMX6DQRM.pdf,
> page 225, in Table 3-1. ARM Cortex A9 domain interrupt summary,
> interrupts are as follows.
>
> 150 ENET MAC 0 IRQ
> 151 ENET MAC 0 1588 Timer interrupt
>
> where
>
> 150 - 32 == 118
> 151 - 32 == 119
>
> In other words, the vector definitions in the fsl-imx6.h file are reversed.
>
> Fixing the interrupts alone causes problems with older Linux kernels:
> The Ethernet interface will fail to probe with Linux v4.9 and earlier.
> Linux v4.1 and earlier will crash due to a bug in Ethernet driver probe
> error handling. This is a Linux kernel problem, not a qemu problem:
> the Linux kernel only worked by accident since it requested both interrupts.
>
> For backward compatibility, generate the Ethernet interrupt on both interrupt
> lines. This was shown to work from all Linux kernel releases starting with
> v3.16.
>
> Link: https://bugs.launchpad.net/qemu/+bug/1753309
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Applied to target-arm.next for 2.12.

Thanks to everybody who helped in identifying what the behaviour here
was and coming up with this useful workaround to avoid breaking
previously-working guests.

-- PMM
