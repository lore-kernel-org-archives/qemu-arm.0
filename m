Received: by 10.223.161.27 with SMTP id o27csp2294458wro;
        Mon, 30 Oct 2017 03:01:51 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+S8mn8OcpQGudvqfwX1hEYfgyCPpTogAjGzRjef+UqiwEPurxJpVlxIcLHvF6R6iqqij5WA
X-Received: by 10.37.12.67 with SMTP id 64mr5427378ybm.6.1509357711715;
        Mon, 30 Oct 2017 03:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1509357711; cv=none;
        d=google.com; s=arc-20160816;
        b=xpZ8HBApEaDTLTavsnlcG6XO8TPQuNEtfyScFAe5mvE+CIjNzwSNmgVsScagV1XuP4
         jYRV3M0AJYdDBkV1VIq6WjWAdZI1les+yi5xfv2rnwOmX3W5JBm4huaVo8Jt5t4yiET7
         /lijKzXIAayTJ1lya0OhK8lFNK3wuXoxcxje/uRniUmGlmVlioAP5DLZ8kOWj+9S9sg3
         m8o3MEA6TTnYRB8OPcnlkRRWf5i2qNM40J12kvbcnu/1L/3zJ/gw/KQ2VMl/KD6a9kK5
         gFaUDTz08Ayhl2JXeIlPl1csPgBDd2dWKreTbPHyaa96N5/MUAIB6NdRnYEOUVZHTBOI
         NS6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Sw9lAYJkZsB84O8qazgwhaGeWLpZtPoi3WjcYg3e+I8=;
        b=aglSJS+IO8KOnlHklM3s3AnMHU5ySGmVKpVDBk23o+1ju+2BRoWt4pkroaAiwcjjR9
         zbCOfZ6w85lNiEC6EzTer8Nyd+g/6r9FOzKhmwLtM57DPVeJyoYf605dy/2mcDno5dvi
         HicVuxJk0DcLUx0lh2O6TmsumwPi/mwBoFnLjeHE2HuQX4Me21lVKlSGFCZHoAIZB1tD
         rJAbhwvmWEiiRuu/C0vXxsK389WVS45575HesFQGesTwDg9W9XA/UPHg5yh8fo1Oel/u
         z3369ghpV8icJVd7U82Iroxavu1DS8jU31ZfIZDG5izv8SyH15YfcTxiLempeBHFD6Wy
         DlWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kCaoKs1x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r73si2495358ywg.791.2017.10.30.03.01.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 30 Oct 2017 03:01:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kCaoKs1x;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39586 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e96tD-0008Dn-6O
	for alex.bennee@linaro.org; Mon, 30 Oct 2017 06:01:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36218)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e96st-00083M-4d
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 06:01:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e96sn-0004zH-JM
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 06:01:31 -0400
Received: from mail-wm0-x242.google.com ([2a00:1450:400c:c09::242]:48508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e96sn-0004z2-D0
	for qemu-arm@nongnu.org; Mon, 30 Oct 2017 06:01:25 -0400
Received: by mail-wm0-x242.google.com with SMTP id p75so14630943wmg.3
	for <qemu-arm@nongnu.org>; Mon, 30 Oct 2017 03:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Sw9lAYJkZsB84O8qazgwhaGeWLpZtPoi3WjcYg3e+I8=;
	b=kCaoKs1xgWKOwoHm8vVs5/JU+hvpAKaPj7KVtSTjW7nkfujqw/3bvsytNuumyuKtjv
	+QIYLUTSE3bAct3ABWnZP2ltoSt9OWIBRGO/djcRuXeMydt1Oe5e5mRqV2CPgnbRNxgx
	PCacxV+4xhaY1ByTC2zIcrtXKIIwMNcgMfLoA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Sw9lAYJkZsB84O8qazgwhaGeWLpZtPoi3WjcYg3e+I8=;
	b=LG8HYcUOD9pzgclyeupkXZIHhJbyPIGHZDNJ2uWCo5dEG9E2oh2ZAfp+ceQhTVU3e3
	FMP39+1cRWHjCnpioAsVovWj2SqTNyogkzn396gTQkpBtB4zhbMJaMozUcgNAKfnhsNZ
	wPHPNd0YpvJLx5bD6V4BCSnuKZz3JHy1AsGoY3vZnf4bN2bUI8k1KqLQt1YjIr5CWNoU
	BqFP7o1B6oYrsgD6Jk4+dlyYsex8ywtTANgOgLxTVd7QkP1ndNR+utrbHnmzsmeMuxC6
	KlgBBF2RtweSYDn52uzDMj4Pki15AN+obwXnZOwrwxtiFA6OHcZNWu3aiep/FnEMTDvG
	Gr8Q==
X-Gm-Message-State: AMCzsaXFVyyVwtdaxfn5KA407VTZoyT21nSsF/WBbLjPKssf6jTMDMyy
	N26ldBPA9uS95WFUlzIfuU9d4x8GMZcPbPopFop39A==
X-Received: by 10.28.112.22 with SMTP id l22mr3086522wmc.35.1509357684327;
	Mon, 30 Oct 2017 03:01:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.161.5 with HTTP; Mon, 30 Oct 2017 03:01:03 -0700 (PDT)
In-Reply-To: <1509253165-7434-1-git-send-email-sundeep.lkml@gmail.com>
References: <1509253165-7434-1-git-send-email-sundeep.lkml@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Oct 2017 10:01:03 +0000
Message-ID: <CAFEAcA8h4g6Jif-03yBeNikPaVLFYraLaiSGgcoB7GTmsLeKVQ@mail.gmail.com>
To: Subbaraya Sundeep <sundeep.lkml@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::242
Subject: Re: [Qemu-arm] [Qemu devel PATCH] msf2: Wire up SYSRESETREQ in SoC
 for system reset
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9633btpEEwCW

On 29 October 2017 at 04:59, Subbaraya Sundeep <sundeep.lkml@gmail.com> wrote:
> Implemented system reset by creating SYSRESETREQ gpio
> out from nvic.
>
> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> ---
>  hw/arm/msf2-soc.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>



Applied to target-arm.next, thanks.

-- PMM
