Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4748361wrt;
        Tue, 5 Feb 2019 05:10:55 -0800 (PST)
X-Google-Smtp-Source: AHgI3IY4BFKuIlx+O0lx7Vj2ZSp6FYq/YiHU2kneBvRmTLzjvoiCyVMPY/DQ64b+RRybBFy7XRwK
X-Received: by 2002:a5b:890:: with SMTP id e16mr3652389ybq.310.1549372254916;
        Tue, 05 Feb 2019 05:10:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549372254; cv=none;
        d=google.com; s=arc-20160816;
        b=GlBjuUGzNKJkQ2QEzNGje4chAnjYwn10xVMcygKH+Idjt0Lfl6VC3pcgBQPP7V2Um4
         k8OF5FK3Mjv8Ogx/hC9L0+VKNV6T20f6gwRupzr65QtgKaszGYUkhtITZfQsm02HR9R2
         WrJS2L/BcCbBARIbgZWNjcJbUfL4jdmAzu1eJ6DVXXOpxoihh2gLhXCExF3UO6H5Unvd
         zUgJBi2BMwfSwqg+Gya0D2Phr4lewJKl0zfZV1Wv8PV0aJVM+Lth7yAF0v3ag3U2Orz3
         30KLRnF71ZRs/0Kwq4Xv/yogt/FOaUbPR1wVdO7B4J9CuZ4gaCXonj+98s9hf8oHic89
         FITQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y7bvlR0OPUQvpwDi78s+Y1BnOKRmObf0M4vBSCVIPCg=;
        b=Yqggtqjdc6fyHpMcygQhTLPMpbx8fIXoV0nf1P28JlU2/iMB8dNOG/RMJ2GeTCr0bb
         jlVtrWky5mzt7WGvDREqaoJU4FbaaKoTwhzvPTSzg0QofW1+9zRJH9miD8hvgAV/N3nE
         S7CVBbFbhBHtn/PMkVOu5Ax5clBt/b3Wz6h9zNg4pwkRd3T0n9jKAByfUjECcS1WTnj3
         si5ugOsdut61rEeKsSOzKxQ2TDKGFalzl/AbowTLvJF+56Qag5vl4v6xHtVGkygawxLN
         MM+y2BEgZY3lcGZTFZIEWXYdpF8usnjbOTfQQuFGrIQrCgMFWOefm7ArwOc6/ZRe69H5
         RcVA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="QAf4j/jG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i128si1873336ybc.138.2019.02.05.05.10.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 05:10:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="QAf4j/jG";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60070 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr0V4-0002uZ-By
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 08:10:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44725)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr0Ux-0002sN-W1
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:10:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr0Tn-0004ie-Fx
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:09:42 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:41456)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gr0Tn-0004et-9X
	for qemu-arm@nongnu.org; Tue, 05 Feb 2019 08:09:35 -0500
Received: by mail-ot1-x343.google.com with SMTP id u16so5489490otk.8
	for <qemu-arm@nongnu.org>; Tue, 05 Feb 2019 05:09:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Y7bvlR0OPUQvpwDi78s+Y1BnOKRmObf0M4vBSCVIPCg=;
	b=QAf4j/jGytcvPJRQR1B9+wBP3PdCquUHgTO3YN13FqwQgDyqrLmAEiy3qCDh0Dr/G8
	oGnAin2hpwSU2Zk4da1GKDgdZYryBEVTi/M1X3ZsIOVf9PPGacB9ODHduvfSgH9w5bP0
	vZ6fR3CnUQedP4CddyTT26SaA2yDUhNjkRpvp3qc8XWwPPHP4gYPDi9WdDEqAIBlnWOn
	+LCGC01+i5sjUF6GWkhKS/42UH9LDLhDkK8jpTzRUVE3SenKeCYMmb7uz4Wn838j1u/5
	gonXt2UCmdJW4P69tbQbCc7GLc/kar1pZJIoLDYelO5SIy0M8G3T2+s80wr1d+Qx79bF
	6GnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Y7bvlR0OPUQvpwDi78s+Y1BnOKRmObf0M4vBSCVIPCg=;
	b=FZ1I+vJb4McAbfd67A4EfMidPqxXsG4KSteA8gycq+znDYd7hUKxTvw2fiPVtKAcqO
	eigzVMEei5ZRuLJ64I2++j33Xfh7cYbRZ+kOae4GJphhoPzxL0/WBVSkyvnN4dmp1jXA
	Zzs50o5TuqL6v4QQX8FdIessZZOnSBtr8V9INqRbsJ7O9Sv9BnuT7uqt/F8VJwf9im4o
	wshW8ojeV6QYmRhro3BM6KiDm2pHSbm2xFj1ASv6rX9oZGstGQtPKaRlT3gr/F9nCoVi
	NVFc6JQhQl1LKL6Z6WXrzJkp36Bl1SKkAX+xU+STCfkPZ7J1TdRP08JyN0IPzDHhncsS
	Gxyw==
X-Gm-Message-State: AHQUAubI/INLuRYKn/1NQWQWCTq4ZFaoQBYIPctIxn2v/JnIXdC1XOTS
	7Srwoyl0GohwGuACPHTGbl4PvRLr825UIfLebqIJQg==
X-Received: by 2002:a9d:3a22:: with SMTP id j31mr2588483otc.238.1549372163149; 
	Tue, 05 Feb 2019 05:09:23 -0800 (PST)
MIME-Version: 1.0
References: <1549371525-29899-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1549371525-29899-1-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Feb 2019 13:09:10 +0000
Message-ID: <CAFEAcA9PKSW92GJO1KcBEQcbGY7TB4pqaW8qSe9j6JJZ7Z2MKA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH] hw/cpu/cluster: Mark the cpu-cluster device
 with user_creatable = false
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Alistair Francis <alistair.francis@wdc.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AxCaq5TRYfMo

On Tue, 5 Feb 2019 at 12:58, Thomas Huth <thuth@redhat.com> wrote:
>
> The device can not be instantiated by the user and QEMU currently
> aborts when you try to use it:
>
> $ x86_64-softmmu/qemu-system-x86_64 -device cpu-cluster
> qemu-system-x86_64: hw/cpu/cluster.c:73: cpu_cluster_realize:
>  Assertion `cbdata.cpu_count > 0' failed.
> Aborted (core dumped)
>
> Since this is an internal device only, mark it with user_creatable = false.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  hw/cpu/cluster.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/hw/cpu/cluster.c b/hw/cpu/cluster.c
> index 25f9070..6f5f037 100644
> --- a/hw/cpu/cluster.c
> +++ b/hw/cpu/cluster.c
> @@ -79,6 +79,9 @@ static void cpu_cluster_class_init(ObjectClass *klass, void *data)
>
>      dc->props = cpu_cluster_properties;
>      dc->realize = cpu_cluster_realize;
> +
> +    /* This is not directly for users, CPU children must be attached by code */
> +    dc->user_creatable = false;
>  }
>
>  static const TypeInfo cpu_cluster_type_info = {
> --


Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Would it be possible to add a 'make check' test that every device
we claim to be user-creatable can be created without crashing ?

thanks
-- PMM
