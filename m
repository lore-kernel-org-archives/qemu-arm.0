Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp3014278wrw;
        Mon, 12 Nov 2018 03:38:23 -0800 (PST)
X-Google-Smtp-Source: AJdET5f5MvgLFMHgvgC38pSDbt5znJSuQV41Ght5dm/cvYTeST0k7/q07fksy64a2J97R8AbZfna
X-Received: by 2002:a37:5e85:: with SMTP id s127mr470173qkb.234.1542022703423;
        Mon, 12 Nov 2018 03:38:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542022703; cv=none;
        d=google.com; s=arc-20160816;
        b=QfsKuv8rV11odRU8ufNRjUD65qv6NtjkBjoIkgdcPdljiV54EYf0k2gR2P8lTO1du+
         SwFlfD7IqHNo7Bod2iFdhoS+hvQW6xIA5OTcJBkZEGjyrFzt9Mkp1SI2t0NFC1pqJ/b4
         /cTSiKpaD2MVva5yzYf+ZbR4w0/N339JLDE9inQEWZsxWxmfTOwrlflw3QrFGIlIgxeK
         iwW62IxvfxLluWhJHV/PYWK9bEvnFBf+f8oOd7gYqnDwC0sEOLSaHFm3DGuOoTQdKE0g
         dvXOijnHKnzaoHp1bOZFauECXpLSaNLtdpp/B5YBvQ4te1kB6nHPnWb/6COSch1O1P9A
         ugMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=fVssV3nDoCu1GHJb+H+CpR1YGSN5zhdEsm4YmIWBySg=;
        b=ystWsZ8/uu+32JwRt2JfQxMEB0+L1jWpzDZoD2NzilH31bEXVekz1eoVMLCHRxnJyr
         cVdPxd3lELRrxR+M89/SqYJ2JXSC15XxqB02gLVfs5OyLM41Yo3ECBZLIvFuEZpfwJta
         Q7eRXk4gmnZwa3pTFpJQn98L39WNXgjMpOJTSWFRJyLqP+P4p6MmWqadhnZqDj8QHMiz
         4Cgfw1NnnyM1bHWOiZfQtIjNF/GffS9CZFxvHCOWGvjyzsPaUPb74L70w0x98NMQzwPU
         IK6+w/32EvwRntR0fZHUJzcx2LaNQQeDPFjoyvxWDs1ONekdDwElxV7Uk/K5LiMoTXak
         yXHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ydo3+ZSP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d127si4150812qkc.211.2018.11.12.03.38.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 12 Nov 2018 03:38:23 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ydo3+ZSP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48063 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMAXu-0007qN-OK
	for alex.bennee@linaro.org; Mon, 12 Nov 2018 06:38:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44530)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMAXl-0007qD-8W
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:38:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gMAXk-0005ph-D0
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:38:13 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41944)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gMAXk-0005pK-1D
	for qemu-arm@nongnu.org; Mon, 12 Nov 2018 06:38:12 -0500
Received: by mail-oi1-x243.google.com with SMTP id g188-v6so6870695oif.8
	for <qemu-arm@nongnu.org>; Mon, 12 Nov 2018 03:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=fVssV3nDoCu1GHJb+H+CpR1YGSN5zhdEsm4YmIWBySg=;
	b=Ydo3+ZSPQCaVhFFKbm2bhI0t0hFSTMgrqqmyvDyryY9d3YkdrXZB7UlLD6iEO3p7JL
	v31NrzdmxhE04vdjQ2wMj70VsRLlRqELK77lSNd5IvWNamg//W1Qw5F5h3r8dqcqIysK
	q/fawOtN9RSVmr1/8Ymi0XEGI/3ON7QeFK6tc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=fVssV3nDoCu1GHJb+H+CpR1YGSN5zhdEsm4YmIWBySg=;
	b=l//itcwpZiMuYcY5eCNltBJL6o4SGnzKerA5v3CeQkU6JyeVwGji3aUklg/hHynTZL
	HbIYH746axLIhbVJoiNta0BPH1Jcw9xkWiRUliRGPSUgHV1PVu3yB2UFNwH/055PEvXm
	8HxQ07r2y5M0iuIKAEX9SY8PzCB5tUfzF0tQ+vUgYCLjHzQxMk7zRFfSb0RmTDncvV3Z
	jg3Cy21RCvzV3zo25Ws1sMmcDX4Yad8odt3JgPIc2pdBYW/atFCCnDcE5VCpDcs7h7j9
	EfvKz3wbDUTqHgQVlPIvs24GqEcuJq1Km2MZv3vLVgp09r0lTrDlNJbgH1MjsyrRgdtd
	fu8Q==
X-Gm-Message-State: AGRZ1gIwtOwuiDYMAchRktyyIlp+l+qpHCmhyEp5Xa8wFovF1hhxePh6
	qMN+nN5Q2V8xBXOVwnTrq+vyM/ELxpaWjfEy8VuZ7Q==
X-Received: by 2002:aca:5ac5:: with SMTP id
	o188-v6mr283170oib.146.1542022691038; 
	Mon, 12 Nov 2018 03:38:11 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Mon, 12 Nov 2018 03:37:50
	-0800 (PST)
In-Reply-To: <20181108175246.13416-3-richard.henderson@linaro.org>
References: <20181108175246.13416-1-richard.henderson@linaro.org>
	<20181108175246.13416-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Nov 2018 11:37:50 +0000
Message-ID: <CAFEAcA_WJMAsHWx+OTO+j0eTsHodpXkyxLv6cAdXxgjsCmTYhw@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v3 2/5] target/arm: Fill in ARMISARegisters
 for kvm64
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
X-TUID: J2vWNakAw2bh

On 8 November 2018 at 17:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

>      /* Old kernels may not know about the PREFERRED_TARGET ioctl: however
>       * we know these will only support creating one kind of guest CPU,
>       * which is its preferred CPU type. Fortunately these old kernels
> @@ -474,8 +497,71 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>      ahcf->target = init.target;
>      ahcf->dtb_compatible = "arm,arm-v8";
>
> +    err = read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64pfr0,
> +                         ARM64_SYS_REG(3, 0, 0, 4, 0));
> +    if (unlikely(err < 0)) {
> +        /*
> +         * Before v4.15, the kernel only exposed a limited number of system
> +         * registers, not including any of the interesting AArch64 ID regs.
> +         * For the most part we could leave these fields as zero with minimal
> +         * effect, since this does not affect the values seen by the guest.

These older kernels do implement reading of id_isar0 through
id_isar5, though -- we could read and use those values rather than
leaving them zero.

> +         *
> +         * However, it could cause problems down the line for QEMU,
> +         * so provide a minimal v8.0 default.
> +         *
> +         * ??? Could read MIDR and use knowledge from cpu64.c.
> +         * ??? Could map a page of memory into our temp guest and
> +         *     run the tiniest of hand-crafted kernels to extract
> +         *     the values seen by the guest.
> +         * ??? Either of these sounds like too much effort just
> +         *     to work around running a modern host kernel.
> +         */
> +        ahcf->isar.id_aa64pfr0 = 0x00000011; /* EL1&0, AArch64 only */
> +        err = 0;

Doesn't this code path leave everything except id_aa64pfr0 as
zero, thus leaving us with the "could cause problems down the
line" situation ?

thanks
-- PMM
