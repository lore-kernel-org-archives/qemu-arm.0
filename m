Received: by 10.223.159.74 with SMTP id f10csp5307103wrg;
        Wed, 13 Dec 2017 08:54:46 -0800 (PST)
X-Google-Smtp-Source: ACJfBotNJrWYO5ZmzlUrdN5FODybYDVxtlPv/shaoscAU49Z+DNKVd8cbzRkKyW+4YHJkr1i7Q4t
X-Received: by 10.129.158.71 with SMTP id v68mr2282177ywg.201.1513184086017;
        Wed, 13 Dec 2017 08:54:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513184086; cv=none;
        d=google.com; s=arc-20160816;
        b=bsOmjPzK2Ulaj1gC61QIOAXkCZbOzZr+u61+kvBywjlC249dZ6l5WWJQdHMDiCIJUg
         RvLUuVO34eqGBZ1To+LADgoUCRiHyNrdiP8R2iwDUwtRmAJeV9VFp/KEyFUY2urkejoD
         wBjm+xsx2EjbKaMfqnNrepFRe6DCa3pAGJWejJEod4LnhFAm1rd14Q5mSkqVTdKDSuaH
         EdG8J12d/rlyT0tIK4/PhMySKqzvLPrASAR1+kNlnzQxzEp103BaIZPmCUH3Bs4VxydB
         GAZx+mbh+sfBWzq0O105uHFP5ThzQYydG6c9B2Aj2z7HG80nj9uQ91u8D4ZXFXYWypY2
         AOoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=caMuRKencdSv4IcBbI1VEwnHWB3HD8PCMNlNHJ3CnJg=;
        b=d6TjTGeyDRVL7HM+FOIOQP4VbbEVYxuNysyUMslLQGyS9RJm6kfWRiBlxtRP3GPz0P
         k3alBysoVqj43MwWGpV50PPSaMcTpS4p9AVbApxg1WaF1TRgcsBZzjudV89R6Ox/4+dx
         tvYZtRsJs6UxxRVoxW9tSNpqXvXXBLfAOBZDtpXKCR2E39PB47ziGYeS2AZdNiFPsFYP
         JX3UVuoyqimPehojOKO4qkIjC2c4y8a1tLYuj91o9mY5HVzEOApSWNyJehsNl8t/q80r
         gEt7vpkHU37vnWVI8q7HX1tFscTNpl5vZsh/VWIH23trupsWAzzB/FlZZifv5mFZofdq
         bTgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sk5IGt2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id e19si406100ywe.353.2017.12.13.08.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 13 Dec 2017 08:54:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sk5IGt2+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36323 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ePAIv-00041U-Bx
	for alex.bennee@linaro.org; Wed, 13 Dec 2017 11:54:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ePAIh-0003yb-5c
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:54:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ePAIg-0005dW-Da
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:54:31 -0500
Received: from mail-ot0-x22f.google.com ([2607:f8b0:4003:c0f::22f]:34913)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ePAIg-0005d3-93
	for qemu-arm@nongnu.org; Wed, 13 Dec 2017 11:54:30 -0500
Received: by mail-ot0-x22f.google.com with SMTP id q3so2518862oth.2
	for <qemu-arm@nongnu.org>; Wed, 13 Dec 2017 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=caMuRKencdSv4IcBbI1VEwnHWB3HD8PCMNlNHJ3CnJg=;
	b=Sk5IGt2+EdbPolbHTgwCEPBVgOmS2PYMtVCP9gT4MckzZdFcdgAmmXK/MNPj2+OoUO
	qiX3j5Hkh5SRxvUMIZlbG3HDzl7HyoKDRiUwVmCrsZ+pfSZvvhnVtgNOF2TuYmcZ4MzG
	iiNOoimiGcyOaM4kF1psXIQGbejxqO+hJQeMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=caMuRKencdSv4IcBbI1VEwnHWB3HD8PCMNlNHJ3CnJg=;
	b=A8qVKnib62WR3yLN/QoYNtYBLbq22v6E3/WPxNAEMV58J+VAIV1CO6bDWTo0jHk36M
	sMODjem6LtfZ7eaZcJtiMlsY0w7hWXKhpOaWzXJhsAwBFyDbsADnZuT5WFbXcuN7L08P
	h/RxmC0VZhObtDWW7jdJxgBzX9y+/xJrilw81O5eUDScU8DVDm4Y1ZYkjD41B+yhp6GY
	cmRifGLk4UDDqYY51JCp4AYNexn+w7hiAK9DJsOwUzCNFmYLC2N+ZsNveewRp/Qhe0NR
	jak8nsiuEK/kjo2OGHIl2sUBC+40rUuvPDe9QYB4CPdYtko2mc6T06kwJheO2nbO688+
	0vDw==
X-Gm-Message-State: AKGB3mI5CGaa8JdCIOp7K3USlGf5qHa9uXmbKDJR33WfkZZg5VnbcpP1
	i06EW1NeaUlsDLzC20ZS4rFPnIr7FgOVf53hDgNXYP0p
X-Received: by 10.157.13.168 with SMTP id 37mr2591610ots.197.1513184069448;
	Wed, 13 Dec 2017 08:54:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Wed, 13 Dec 2017 08:54:08 -0800 (PST)
In-Reply-To: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 13 Dec 2017 16:54:08 +0000
Message-ID: <CAFEAcA8HswEKDPpj=cM711rNU2zwPuDXW7886=Oa2HBDmZxdCg@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::22f
Subject: Re: [Qemu-arm] [PATCH 0/2] GICv2 & GICv3: RAZ/WI reserved addresses
 rather than aborting
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
Cc: "patches@linaro.org" <patches@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
	qemu-stable <qemu-stable@nongnu.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 690MZ1CPzt0Y

On 13 December 2017 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> The GICv2 and GICv3 specifications say that reserved register
> addresses should RAZ/WI.  This means we need to return MEMTX_OK, not
> MEMTX_ERROR, because now that we support generating external aborts
> the latter will cause an abort on new board models.
>
> In particular, at least some versions of UEFI try to
> access a reserved address in the GICv3 redistributor
> (at SGI_base + 0x184) and fail to boot on the virt board
> without this.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   hw/intc/arm_gicv3: Make reserved register addresses RAZ/WI
>   hw/intc/arm_gic: reserved register addresses are RAZ/WI

Oops, forgot the cc-stable tags:

Cc: qemu-stable@nongnu.org

thanks
-- PMM
