Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp4059278wrq;
        Mon, 11 Jun 2018 06:39:51 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIQniGK4IO3E8gsW2ktYuZKsPced+x97z8ktDu50EpFTcxrVjpA2tdWvfflDreKwByQD937
X-Received: by 2002:a0c:93a2:: with SMTP id f31-v6mr15156156qvf.151.1528724391104;
        Mon, 11 Jun 2018 06:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528724391; cv=none;
        d=google.com; s=arc-20160816;
        b=kwgMRqxjt1JPDWh9OFBJGVwbJfDBBgaEs5kPC6TrBDyeDDJqApjndmdZSOFRnHcxqI
         KzFzW5ViJT9iQ1u5hffJsnxOL2fpGHpTBTI/kpdG2BzaGW30U8w6glYlGqc3TT5RIIR9
         IAWR0ISIpmxgHo15BTuZmiPrhSPaCl1HgWto3Y/dq6FIXYtU+B5/TYVGg1ljJ4Y1u2Z3
         FfHc8XjA6kOnIOjVXBudoFX/yfT2boUnAJkoqZoEVpEdeanCgHvXfKZ+wrjwEcUjmD1H
         m/jxy+l7HXajg3nv71JHVAjOwfB9rw95Cls9izBdSxM5YD+Qqmada/gzqHuxFbQJEA1e
         yYlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=3TTykBhy7CRWywNUmAtNOqH3OMGBSdHetfObhC5LeYw=;
        b=mUiQ+Vjw0VdRZF3fRmMW6yAPLDvbSnN4MIrVh/ks7UPKh5RYAl6J+An2IY4ssIHXXv
         +Snx5w2tLoBZIZ3ugM1PCS6HtS9Q2EprmYA1hHI1PCE6HeNBmzbgjnfSK4Mp1Y2PZ4gU
         rZUflX88rtpPIubo5NLx/Vn1EWlTnp8FXb2bLf53/AVTONVCc21/JEOj9qa4LY70Qu/F
         P0Vl1qWNWdIYJdXdyt/RL9t8AinQ8six+fYrugSDV1UMThk7bHW2fSgEDy2qHQDYaCYL
         nA/qZQZI62xyQ+2zE6RLgTkUdVIqi5eBUkTSfRfbZ0eUoWuBmvOXLt9Ls8M5ALVZPUWX
         6dRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BZPMIeJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j6-v6si1195934qte.142.2018.06.11.06.39.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Jun 2018 06:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=BZPMIeJJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48896 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fSN30-00074J-KI
	for alex.bennee@linaro.org; Mon, 11 Jun 2018 09:39:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41291)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSN2p-000736-6E
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 09:39:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fSN2o-0005rd-DZ
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 09:39:39 -0400
Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244]:46604)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fSN2o-0005rV-9H
	for qemu-arm@nongnu.org; Mon, 11 Jun 2018 09:39:38 -0400
Received: by mail-oi0-x244.google.com with SMTP id h79-v6so17861689oig.13
	for <qemu-arm@nongnu.org>; Mon, 11 Jun 2018 06:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=3TTykBhy7CRWywNUmAtNOqH3OMGBSdHetfObhC5LeYw=;
	b=BZPMIeJJy1fcL+R0YyYo6RzoA8Zsl7vKwmccsf0bpbv4T6bUoDN737R8e9Xj/p6VWb
	w1qAqSwpkvrchX1OnUB3hBVCd6x9jE0+ZR9JVppEH8uBdiqXPAYVXwIA+CA0KmZoSD6y
	myw2wVtNqcYyPS+1l42Ws9sERCKbiAuX0DuK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3TTykBhy7CRWywNUmAtNOqH3OMGBSdHetfObhC5LeYw=;
	b=j3bFdnRcCpPRvGCtuxs/V34dWpapCXkL6FBgQxUibcs2CUoYgGk4akZT6TEaSD0K7N
	moTpTxkRab9/Jq1F7bsAhLigdI2WK7w8r3UCqvKiLBTvMADlCocLe2r+9UY/a8Axol2H
	CMSaRYCdg+kVms6D+I5Ub29msuDQo/RbK5N81Xik26M69HRtte4pp1goYSXiWN3qbcdn
	wwn9KoM44/X4YCOxydQRH9EMjtzZ5pU74BN8H3SGTVwdFdEhzt+MDK2qOZ0qtjyXpuRf
	BvrAnKp/vIYQC5PeGKpmgLiaTK2n28pw4QTtSrEZ4rHxGWr1uSpbtzL4pbYCGBHdnT6U
	ZX3Q==
X-Gm-Message-State: APt69E0ZE3J6MEPQaeDVm0tqVMcVXQwbysvVB8qWBjNr7U1phu0WQ5Nx
	4pIAPyFiygb0PsV5uYKXVJmkaTwrJCQfRBUumQ1+1g==
X-Received: by 2002:aca:5383:: with SMTP id
	h125-v6mr8784730oib.252.1528724377518; 
	Mon, 11 Jun 2018 06:39:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 06:39:17
	-0700 (PDT)
In-Reply-To: <20180606093101.30518-2-luc.michel@greensocs.com>
References: <20180606093101.30518-1-luc.michel@greensocs.com>
	<20180606093101.30518-2-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 Jun 2018 14:39:17 +0100
Message-ID: <CAFEAcA_uCfgs_ciEQPtyRGJ7yBgDrSiGrS8G9qgawH9si7yhVg@mail.gmail.com>
To: luc.michel@greensocs.com
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::244
Subject: Re: [Qemu-arm] [PATCH 1/6] intc/arm_gic: Refactor operations on the
 distributor
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 40Y2iL86nzQo

On 6 June 2018 at 10:30,  <luc.michel@greensocs.com> wrote:
> From: Luc MICHEL <luc.michel@greensocs.com>
>
> In preparation for the virtualization extensions implementation,
> refactor the name of the functions and macros that act on the GIC
> distributor to make that fact explicit. It will be useful to
> differentiate them from the ones that will act on the virtual
> interfaces.
>
> Signed-off-by: Luc MICHEL <luc.michel@greensocs.com>
> ---
>  hw/intc/arm_gic.c        | 164 ++++++++++++++++++++-------------------
>  hw/intc/arm_gic_common.c |   6 +-
>  hw/intc/arm_gic_kvm.c    |  23 +++---
>  hw/intc/gic_internal.h   |  51 ++++++------
>  4 files changed, 127 insertions(+), 117 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
