Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp909164wrt;
        Mon, 19 Nov 2018 06:22:38 -0800 (PST)
X-Google-Smtp-Source: AJdET5c5DvZ2ZySdj5pLVNR7/eXdN6XU1LpXt/osNhUw0H8PoO5eqoamLd1GXLAURsedyXtpyMUl
X-Received: by 2002:a0d:fd05:: with SMTP id n5-v6mr21169312ywf.46.1542637358065;
        Mon, 19 Nov 2018 06:22:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542637358; cv=none;
        d=google.com; s=arc-20160816;
        b=P7M/TOZebdqYRQfgWf4xWEnXARjSweoCftlSMsGrJ2+dtLFQedXabOfmn2UBDaXacd
         4RAd4KfuISxXJNmOw29cbR/iD2IVgkZVXmpOQMYU53SyPUJUftbms2h2XdV5+5O9fF0L
         Ah5s28BL80SUkGB9oO3WGfy2JYcbqyTGTiG7cb10GzOoiogrRH3qtU+EDw5jDZJPCWgN
         PDOws3ZOv4une67YAbnvA+DiwDFQ4zp4ZbQPDnW//IWtlkePsc+1VPsZWb6sgxP0esDi
         5XO5guBML4gRwdLR5cdlGCWVBLAcU7HUJ+hXDcJaf+OOKgLdGZ4mQIykPzKxbSBQqucE
         R0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=aFTTvDhJYpdxBWQBVFepHDxKzptrAOT7oCuWhpsaFd4=;
        b=T5B0lERJl9mciCa1GST1o4VcHBhp1Eko5Ru2WhtIdIo73Yg2fLqeL03pTVSIix1cM7
         BMn3vwcEcJkO5P7V3wNsHSeizZ+XiMKal3ZmF0Evcgx8BK/trMcyyb6i1F6F7blw0Ivz
         Gp7SbGFrhGqSxN+IP4fmE2nWxWg1Storv15jWIWPPVmTkaStj4h6wneCbgXIEA+MifaZ
         TZaG9JdBNhwgkF3c8SUaTaQVA7aFRI60NYgLtUN4u3utq0bhXY2DyzvWK/V3KhqctDl/
         TDN2gytv2Y8p+aWMaTEWHW4be0zMLIpiH49uYhvxKFwOzl2a672O3H32foXlyCHg+ypK
         OuXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bIumbRMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 67-v6si3822840ybt.20.2018.11.19.06.22.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Nov 2018 06:22:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bIumbRMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56893 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gOkRh-0005s0-FJ
	for alex.bennee@linaro.org; Mon, 19 Nov 2018 09:22:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gOkRY-0005rL-Gi
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 09:22:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gOkRX-00023Q-NA
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 09:22:28 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:37616)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gOkRX-00022Y-BZ
	for qemu-arm@nongnu.org; Mon, 19 Nov 2018 09:22:27 -0500
Received: by mail-ot1-x343.google.com with SMTP id 40so27767646oth.4
	for <qemu-arm@nongnu.org>; Mon, 19 Nov 2018 06:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aFTTvDhJYpdxBWQBVFepHDxKzptrAOT7oCuWhpsaFd4=;
	b=bIumbRMzckhdwCzPAhH4mCLvVhBjGJno5GouKtkqW4tOXJdClaX2GE5CtflCjGJYS8
	MZBcf4POthxFoYk3PZL1bWMq+GqXBqBgQr9zOy1Dwd6g+EgLPOF/rZ7ipr8GUEBLbcT+
	EZoUciepTvm4naB2AWMBAmn/AMiGSQOUhUsoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aFTTvDhJYpdxBWQBVFepHDxKzptrAOT7oCuWhpsaFd4=;
	b=QGBAJdYe78M021vRZBFF975cLVeyXqJ7uT3CDsijUo97ywT4me+YawjBc98g+yPsBi
	xB7gC5KdY3zNqY5DKPczcgI3u/FPen9mu4wxOcuj67MwzdVVrtQ+cXVYohPYKT3ofo/8
	kBpmDHLDAmiOAhVCypNrPuRop+qi2N3Ng31mxnriGsLfRah9CsURWtw/AqczPR2DprdY
	+gwr2cDezqLfMHVs/V+qlQ9G3nkqrv5TTdsD27gNEpR6AwLnzC/zYn7hAsc5f5OcrZ5v
	0MVLjvIXHgVjui/kBE56PnG0zb49ZxNUYpHo8CedIDQDsM9b0kc0Old94tH1bIBBPvEa
	DYuw==
X-Gm-Message-State: AGRZ1gIjL7ReDTnSFiTOPQsIyltOxPRXWaaY4lEf3UcaNrl4MjWo0ZGb
	zQGGI/1qEfOAMaEmM1gqd2VphaQmQ4zY1Ruh1g3KeA5WSDE=
X-Received: by 2002:a9d:12d:: with SMTP id 42mr12535504otu.352.1542637346572; 
	Mon, 19 Nov 2018 06:22:26 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Mon, 19 Nov 2018 06:22:06
	-0800 (PST)
In-Reply-To: <20181117160213.18995-1-luc.michel@greensocs.com>
References: <20181117160213.18995-1-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Nov 2018 14:22:06 +0000
Message-ID: <CAFEAcA9Y4fykSD+FyE_K_G6U1OB0oSjEgxma6wp-qYm9pws_Qw@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH] target/arm: fix smc incorrectly trapping to
 EL3 when secure is off
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
X-TUID: CVYOHp9yPz9x

On 17 November 2018 at 16:02, Luc Michel <luc.michel@greensocs.com> wrote:
> This commit fixes a case where the CPU would try to go to EL3 when
> executing an smc instruction, even though ARM_FEATURE_EL3 is false. This
> case is raised when the PSCI conduit is set to smc, but the smc
> instruction does not lead to a valid PSCI call.
>
> QEMU crashes with an assertion failure latter on because of incoherent
> mmu_idx.
>
> This commit refactors the pre_smc helper by enumerating all the possible
> way of handling an scm instruction, and covering the previously missing
> case leading to the crash.
>
> The following minimal test would crash before this commit:
>
> .global _start
>     .text
> _start:
>     ldr x0, =0xdeadbeef  ; invalid PSCI call
>     smc #0
>
> run with the following command line:
>
> aarch64-linux-gnu-gcc -nostdinc -nostdlib -Wl,-Ttext=40000000 \
>                       -o test test.s
>
> qemu-system-aarch64 -M virt,virtualization=on,secure=off \
>                     -cpu cortex-a57 -kernel test
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Thanks in particular for that helpful table summarising all
the cases -- that made this patch much easier to review.

Applied to target-arm.next, thanks.

-- PMM
