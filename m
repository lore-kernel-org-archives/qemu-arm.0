Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp1361015wrq;
        Thu, 12 Jul 2018 06:20:36 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcYegQF8Wj2ztHCdyB1ydAhpCuQyMCG19z40AZAVQlVUsblUYAxmcvRNmQnPlINVZtGR0Ea
X-Received: by 2002:a37:5a43:: with SMTP id o64-v6mr1719893qkb.211.1531401636442;
        Thu, 12 Jul 2018 06:20:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531401636; cv=none;
        d=google.com; s=arc-20160816;
        b=g/ZlT7xHVdf+XAlkkTHxsaxDPe2uGyuCJ6KFSEuLe1/1/W2q+PwRwUIR45K8qSJPGA
         KMoww8NhHvGDGqpsAgMCEzcpdoon6vyYLDPn//y5trYOInrxmmazTnqg5hBDyPO7PgGR
         lH3kSAbZVSS6pAj1QcadOAPE/9Zs+sRtr3kOYHnzzgHql+K7JERhLrDccVRH5x25HJmL
         Ij7W13KGq+X870VZ6X1SL+b99LKTeRJ3WyZ5Hz3bEkkiRPIxOId/sOpiBGO3i0cvN2uf
         mMR9LH311j5UCAtbJu+hu0g1KMXFTa+wPHvB8F9rnZeddeuljns2MistylwAmi/Yfw4C
         c1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=aHB0pBKHa3OkozZY+FrHHQl53hYirbd1aTpblIsugMI=;
        b=gJ9BPy27jxJ8fx93D+zwP/dBOJuqCt1io+Dg0ZnHWcTr+YdTEvhiCJVOEPJtN3JWeX
         z918UgXqB2ICbRv4dhWzt8Tm0HphtQ4puQR4kveLT9KOW/yn5V5TsAxU/7HynXdU+WRp
         xgs1DhQxcgNz5UtxGoV90OSngyaX2fR/7aMubdtTDSJT8AaRrfhBK3kvz0UzBWoLzQMB
         tJaXoqu9Ae4aImBLYyKGLIqeb8ewOnYJAODdd/+j/QS4knMFkBkZCcNgUcZlc+d3G5+0
         p+E2YiQs46ekjCYDIJ/T6sATOHEHRup/7T79hM+0MyNakye9x/dL0R/bTqU7zepuxws9
         hiBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HMeEBC7t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v2-v6si1546634qtg.400.2018.07.12.06.20.36
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Jul 2018 06:20:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HMeEBC7t;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdbWN-0006He-Vq
	for alex.bennee@linaro.org; Thu, 12 Jul 2018 09:20:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54659)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdbW8-0006EI-VB
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:20:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdbW8-0001T4-4L
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:20:20 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:34593)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdbW7-0001Se-Up
	for qemu-arm@nongnu.org; Thu, 12 Jul 2018 09:20:20 -0400
Received: by mail-oi0-x241.google.com with SMTP id 13-v6so55715135ois.1
	for <qemu-arm@nongnu.org>; Thu, 12 Jul 2018 06:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aHB0pBKHa3OkozZY+FrHHQl53hYirbd1aTpblIsugMI=;
	b=HMeEBC7th3ocZZLrCigh18VKdMSgKqho6715IIfFe0lmFdBpiTjqS9LA+JZH+JxxWu
	9TXSA5VVaDl1MBep/LbfhafXqjH+pJTRnl7OH7CD+3+yH5C5Pci/6JRZ9d/SG7erJwAU
	v2OmGpR8SHnw3LeCru3Z82DlRhxnfrYF6ATnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aHB0pBKHa3OkozZY+FrHHQl53hYirbd1aTpblIsugMI=;
	b=DLdGQgaJkN8yGJGECcn/ajl5f+nGV0ZJMjaDPD9OQEi6tgbKa/M7rvrF4C5KnrOOZV
	CgN4NNiaVwXC0evkK1VsdHj5y3khqCByGE0I8mnA50UlU3mWCWtgarYujoKjKLiJt5Ml
	2KSafIbg89s/D/cxSnsajdmk9RDH/oQB9roSS627ncrVLb67JmTGhi3MwvWLQ38QwHPz
	BQVjlWNgbOdqwG3ybVr0PPSsnirfRf7hUUQooM+r7vErZ8yvbJd2PEYMu01y+aHMhP6f
	/uEEUmryPhfFr1jx7MirEcuPOXvadSR7ehvZIVimj9pSbfM1+sZ3rZRKdOHTaV7at2fH
	tl1A==
X-Gm-Message-State: AOUpUlHr5+2yfhpH4BD75Aq2112s6epQzMp3VVc6eeH/G3yIpZxs1PJI
	DnoioVIO1XJLaG8+4yI91dnSck5HShM6x0oPvQHWcA==
X-Received: by 2002:aca:4a49:: with SMTP id
	x70-v6mr2083751oia.11.1531401619170; 
	Thu, 12 Jul 2018 06:20:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 06:19:58
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-12-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-12-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jul 2018 14:19:58 +0100
Message-ID: <CAFEAcA_c34WEGeG5OnRZhxhMFLf0AX68RtS__kjo+OJqEWUbMg@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 11/20] intc/arm_gic: Implement
 virtualization extensions in gic_acknowledge_irq
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
X-TUID: 3Yj1RMJN8plU

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Implement virtualization extensions in the gic_acknowledge_irq()
> function. This function changes the state of the highest priority IRQ
> from pending to active.
>
> When the current CPU is a vCPU, modifying the state of an IRQ modifies
> the corresponding LR entry. However if we clear the pending flag before
> setting the active one, we lose track of the LR entry as it becomes
> invalid. The next call to gic_get_lr_entry() will fail.
>
> To overcome this issue, we call gic_activate_irq() before
> gic_clear_pending(). This does not change the general behaviour of
> gic_acknowledge_irq.
>
> We also move the SGI case in gic_clear_pending_sgi() to enhance
> code readability as the virtualization extensions support adds a if-else
> level.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
> ---


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
