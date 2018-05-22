Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1762717wme;
        Tue, 22 May 2018 10:22:13 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrIBxTR/pFWwlE8tE5EWhiNv2+vVSv02/b5ryY0x/mA2zc4bi6atqkWc3fn3v5YbNikIibk
X-Received: by 2002:a37:bbc3:: with SMTP id l186-v6mr21514782qkf.120.1527009733464;
        Tue, 22 May 2018 10:22:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527009733; cv=none;
        d=google.com; s=arc-20160816;
        b=cZ/5bq3OWKmCBlJ6N96c+irUVpg3J0r3eBQuRusbkCB8ztm1m+xG1e/cEQOVmUPJkp
         FtokzuxGJ+wEb8qe+moW99dwvK8LOn8+26U6L2gzusURZybYT5LzRwWKd8Ntvhtk7ae3
         BrO+Qu6qQBRlXlz+lOqYM/lqk8h9jr8hb9fg/z0EUbhiDhczEtG/hiKnAp6oPqpCOmrT
         3fubjmZpfwXliGgRRvQeveRRtNRCBObmdEU/thRW18+eRpG3TGVY5kmGggpbNv/iyHG5
         7HHKG/LFWFEGQDOcraBPLzJPONpx5P6kTRyuy3dQOC0FGDKYY7jD+YM9k8f64ukH8R/O
         5khA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=qrHBK2jBY04hry6DTcKa8GLG+oKbdi9hBDMFcuLQURo=;
        b=NxFVYhWbgVL5GGwnTIuZQz2TlQRhJ/u3x5Sn/ngq84THGM1Z33V04pPs1BrE2bNQLH
         nrLNMagfPhRJeZc4siwKAyC07A4G2+3TEeAcYtdwlDnlIRtBhEsWpBeM0nL+r8F7ew7/
         kHEcuTd7gbfalc4t9JzxKYFKSi6BzYquQQsJujypg/spwMxL4WWukZnHKS7LKAXVUaSM
         w1j61HBz8PIxec/6XinXUwRB46dBkaRn9NyoU/DmyCmRM7eCnM7/cIhqUnf4CgUw4KYj
         9At6wxLiG8dd9KqG0rHECJqHH/5pVPZ6Y6Z9qZVim/7d2Zv8ftu9zBMIgMxvxPnxGcjr
         zMmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q8tjDxfU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o16-v6si5239001qvm.210.2018.05.22.10.22.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 10:22:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Q8tjDxfU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56991 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLAzF-0000Lv-19
	for alex.bennee@linaro.org; Tue, 22 May 2018 13:22:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59816)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLAz7-0000LV-Nd
	for qemu-arm@nongnu.org; Tue, 22 May 2018 13:22:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLAz6-00023o-Qc
	for qemu-arm@nongnu.org; Tue, 22 May 2018 13:22:05 -0400
Received: from mail-ot0-x22b.google.com ([2607:f8b0:4003:c0f::22b]:33746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLAz6-00023h-Lf
	for qemu-arm@nongnu.org; Tue, 22 May 2018 13:22:04 -0400
Received: by mail-ot0-x22b.google.com with SMTP id l22-v6so21910994otj.0
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 10:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qrHBK2jBY04hry6DTcKa8GLG+oKbdi9hBDMFcuLQURo=;
	b=Q8tjDxfUrR4FfwWBHf4KerkebyVr0JCaM8oyKvYFRznTNTfEUfV6e8WoDpWsZx/idY
	OHOuxrdTvY2d8RzDofVZUANyxna7ss3k0Bego0llEXIsdaB6ro/24PT1Rul4IY+yJ8uc
	+Lo+BQESvKEFGwog6D4YK7okEj1FXR++Ewr/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qrHBK2jBY04hry6DTcKa8GLG+oKbdi9hBDMFcuLQURo=;
	b=AV9wn48GU6mJ3npKRK/1vzwUAo4SkqQHhueyRVOKOSNUafXi0maaJE5fQFEguakbC/
	PKEUBH4JVC5Cp5Xdqw1/pDq76f6LuwKTK4Dg/37QuB9hz33DDCeJaX3sTMsOhwB8sGd1
	XyhibPnE1/G1XZajnNK4XQVgzGykM9/GwbOh3/65gmF5rLeai9RNz/rKTLO9hEreZllz
	C3/kt6eadwN4y8cbQRIhVAy5qbqhp4FV7aocU3JKBYIJnt/whBVYdzVCaYT+ActiUvjM
	SLXXJ87roGFjuHNzFnmehQKpUH54E2Y2S600pie5HzayaY6u3xEenRlZiIla5Bq0E0kj
	B1oA==
X-Gm-Message-State: ALKqPweour/Mcezk/waM1m64do6XEuDWLHFL9qh/A6io1dxYRVnIPOVW
	NHR2oS0diUYw/+BsrPSZzQ5WdR1xLEkmSaGzA+cuhw==
X-Received: by 2002:a9d:16d0:: with SMTP id
	s16-v6mr17519459ots.294.1527009723980; 
	Tue, 22 May 2018 10:22:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:3170:0:0:0:0:0 with HTTP; Tue, 22 May 2018 10:21:42
	-0700 (PDT)
In-Reply-To: <707c783c-0c82-4916-c8b9-0a4d93364386@kaod.org>
References: <20180423101433.17759-1-clg@kaod.org>
	<CAFEAcA_1q4+kKunX6_d9N3+6tUFGJRRc5biqn5TqDDmh09-kiw@mail.gmail.com>
	<e2d6b0b9-2402-4c34-305e-ae61ebe10df4@kaod.org>
	<707c783c-0c82-4916-c8b9-0a4d93364386@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 18:21:42 +0100
Message-ID: <CAFEAcA9wr9dXJcqiz83LSPhta19yE-cAukKJ0ztagntyp=Bc=w@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22b
Subject: Re: [Qemu-arm] [PATCH v2] timer/aspeed: fix vmstate version id
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eQMSPv40ed0k

On 2 May 2018 at 14:56, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>> There seems to be an issue while reading the CPACR reg.
>
> With a brutal setting of CPACR in cpu_reset, the romulus-bmc machine
> migrates. What would be a more appropriate approach ?

Ah, yes, the bug here is that we made the cpacr_write() function
insist that certain bits are RAO/WI, but we didn't also change
the reset code to match. So (a) the guest initially reads a
value which doesn't have ones in the RAO bits and (b) when we
migrate we get a mismatch between what we had on the source
end and what we get when we write that to the destination end.

I think we can fix the reset value without having to duplicate
the logic from cpacr_write() using a resetfn. I'll cook up a patch...

thanks
-- PMM
