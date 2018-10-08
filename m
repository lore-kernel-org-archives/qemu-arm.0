Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3416800wrt;
        Mon, 8 Oct 2018 05:54:38 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61kNIhnFeny2GoHUEfb1buA/C+Z+E7ZfDhzOJzNSK9DPjM5rs+8sUeL84BQFNfkbQJ2Bdyx
X-Received: by 2002:a37:4787:: with SMTP id u129-v6mr18661745qka.301.1539003278286;
        Mon, 08 Oct 2018 05:54:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539003278; cv=none;
        d=google.com; s=arc-20160816;
        b=akijO+9MjhfPvZL/ZZxIOkcK3u+3unCTw+Zt7Ua7RK1AC8+fDaj5qAQW8aBjAJT+FN
         YCx60ppK5SIe4aFU2hrdSYoaEZUPCy7uhUstPjm28K74wjhRmCT0ZX55cwL0xS5LoCjT
         1Ir39FS1vQN7cUAVI/ZUlTRWiq2pWnFiVi/ksKe503X/xuAzLSrOGSfgeIMPExT8bnwn
         r3qtifSe/dEMvVFfomBYUq6vLQIDNWaiaBQ+j+h/+pKcQw7digMy2U9Ivvi6E2vcbljC
         UdqUX3Ocw75PWavSBRJHE4RtFc6+K81pA+j//E5YEgtdLLB0QadCyA/86KvZwRSAYkEU
         dw4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=D554nSMIBaRlcQ0G+C0Pmp2GKu4Ft05HpQE4cGfMXn8=;
        b=g/XMkrkBvZYaItMehdrgdtHVDl9gf/AcsDlDTNyPNJ9RsjPQ46SAVZzZJ8jBXoqvWU
         uxlIQtc0u5Lq0tcELQ+bFCGyWhf4dvCWrk5ZPtH6Hhjt4NRzAC1XsBupzs2a8CKzJTcK
         EdC4JH24O3nN2+/h5ozQXyRjx2pTFOwraIIY+s5AiJQ+FFAFY3VONUwDHpetvZMaU+uu
         D/uAoPp0RkK5AmbPgra/fRuk5QT8xXWXruYxn48XgDFOoqIWzhZmJhIEIqgZw27s8vz4
         Fz+zPzqyOIPM0M7VPXkosXgSN1/UwS8uSbqDijgJiCWU9baQxpMktV8DHCBbuXdmOmq+
         SMXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZCXi/uQG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j184-v6si6731266qka.181.2018.10.08.05.54.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 05:54:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZCXi/uQG";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46026 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9V3V-0007ar-PI
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 08:54:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45660)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9V1F-0005tG-8r
	for qemu-devel@nongnu.org; Mon, 08 Oct 2018 08:52:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9UrG-0000Ca-8G
	for qemu-devel@nongnu.org; Mon, 08 Oct 2018 08:41:59 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40883)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g9UrF-0000C1-Tt
	for qemu-devel@nongnu.org; Mon, 08 Oct 2018 08:41:58 -0400
Received: by mail-ot1-x343.google.com with SMTP id w67so19428205ota.7
	for <qemu-devel@nongnu.org>; Mon, 08 Oct 2018 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=D554nSMIBaRlcQ0G+C0Pmp2GKu4Ft05HpQE4cGfMXn8=;
	b=ZCXi/uQGEAnRDr7E9BMcbT3nGbtqhw8myltOW+sRsFVKmPuycS1ncfZjzBPlUGIJRH
	nzqM3A0ErTMwBPiJaWRCTAc5XADAYYIAb6MVB7r1H8+pnxwAb3r1fjDDHtu6YDvTK6bv
	za+JT1dMeBx/vEqlvMMNNEXsVlc8Gv16f7n7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=D554nSMIBaRlcQ0G+C0Pmp2GKu4Ft05HpQE4cGfMXn8=;
	b=I3mAj/wsdXbqLq2rAZnBh2onpaSqHSg0Di0ky+aK6HXVH6X/wlDVYRHcT0CwVSnJk2
	EkA4QwNt8wbfPrPsSexRSeHR36k5+uG8pd0fk7Hq+ktrrt3aSn0giPfr4FFf20OK5zXX
	xZ4oHNtXfVJaFta2X6xVk2tv/lqv4oBU1HyCzzYr6O2ZEaVtZ9HZkv2wPYVlUFvrXn4l
	CO8RVRjfcw4KdVMgC7hY58o7UQxnofL5Nloa06VBWBAPurv4a3OCunBCT74DbtVcutLy
	xy+snY0tqHJsX0fjtoQAXSwafnPHZvU0+dqgUUPG0hTuHu4GvqZJnVfkriMq4zKh89om
	qlDw==
X-Gm-Message-State: ABuFfog9N1nzUgayXH7yaJGNmZWGQG5YxmaQLpwghib4r/8Ic0N87PdF
	n7CVnNHt/SR6pcl+XX7aeUxNCv3jZ7m4FYGZTGjQGw==
X-Received: by 2002:a9d:2377:: with SMTP id k52mr13939225otd.238.1539002516890;
	Mon, 08 Oct 2018 05:41:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Mon, 8 Oct 2018 05:41:36 -0700 (PDT)
In-Reply-To: <1538579266-8389-10-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-10-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Oct 2018 13:41:36 +0100
Message-ID: <CAFEAcA88T=VWXq5aSY2srgbo8PF7tLFJn-28nNpt3=ZGh5xM1g@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-devel] [PATCH v1 09/12] target-arm: powerctl: Enable HVC
 when starting CPUs to EL2
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: E2n+11iVjhlw

On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> When QEMU provides the equivalent of the EL3 firmware, we
> need to enable HVCs in scr_el3 when turning on CPUs that
> target EL2.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target/arm/arm-powerctl.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/target/arm/arm-powerctl.c b/target/arm/arm-powerctl.c
> index ce55eeb..54f2974 100644
> --- a/target/arm/arm-powerctl.c
> +++ b/target/arm/arm-powerctl.c
> @@ -63,6 +63,7 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
>      struct CpuOnInfo *info = (struct CpuOnInfo *) data.host_ptr;
>
>      /* Initialize the cpu we are turning on */
> +    qemu_log("CPU%d reset\n", target_cpu_state->cpu_index);

qemu_log logging should always be masked to a particular
log kind (either via qemu_log_mask() or by explicit check on
the log level). If this was accidentally left-in debug, you could
just drop it :-)

>      cpu_reset(target_cpu_state);
>      target_cpu_state->halted = 0;
>
> @@ -103,6 +104,16 @@ static void arm_set_cpu_on_async_work(CPUState *target_cpu_state,
>      } else {
>          /* Processor is not in secure mode */
>          target_cpu->env.cp15.scr_el3 |= SCR_NS;
> +
> +        /*
> +         * If QEMU is providing the equivalent of EL3 firmware, then we need
> +         * to make sure a CPU targeting EL2 comes out of reset with a
> +         * functional HVC insn.
> +         */
> +        if (arm_feature(&target_cpu->env, ARM_FEATURE_EL3)
> +            && info->target_el == 2) {
> +            target_cpu->env.cp15.scr_el3 |= SCR_HCE;
> +        }
>      }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
This is definitely required for PSCI and I think it makes sense
in other cases that end up in this powerctl code with EL3 set.

thanks
-- PMM
