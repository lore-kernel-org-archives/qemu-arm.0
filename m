Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp1349396wrp;
        Thu, 14 Feb 2019 11:19:04 -0800 (PST)
X-Google-Smtp-Source: AHgI3Ibmk3Sz150o/ZIf698XifvdATfT4E0/a0iwf+4wAUUhptUEcmMU/OhEF7RS/dzaec+Y4Q0G
X-Received: by 2002:a81:34d3:: with SMTP id b202mr4773427ywa.258.1550171944426;
        Thu, 14 Feb 2019 11:19:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1550171944; cv=none;
        d=google.com; s=arc-20160816;
        b=z2Qsk0M/lZC01yK/gLg2TRtODAyCRo8L/WzgxD/3UdzRzGo1Cx35wV1jK3MvLb6oBO
         bamct8QfSPA7h2AcS4ceqsbpUGh0u86tV1PgKn1rusvV+ewrSdgemMQNWMhvbQCw3sdc
         QjnKOgyAfosvg01bdRCaTvozOuYOcX8NVjdO72mMPBQJ1TQyey5Mx2to/xvCzEzXS1UF
         zUJbwBBESzbNW7ZSiXQeKDdm0EM4aeJ2SI+xCdPmY7faf7eznBnPPNsHypil6X/cuaPl
         XMO8zYv1/pPiK4pk+jKl8jVPggC4Pa1ZEWP8vfSGJDDmkxCSyBBMBBCg/dRBOBE5Cr3w
         xaFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Qy4YAcoZYbpBkIfx6vAOq/ldiESyKK0r7enuMTZoxLM=;
        b=owj+xaGdc1TFEW25czbDS7nm4bK0Qpn7WUxnw0gsU8G5wgbkF6NhC9uNcjSOEEGsUx
         7D6+fogCkuDeFZeGhUp9KSDy4QvW8oI/Oj5L0QZLCq/Ucqa+OPyMHsgtu858ksBERXyX
         Ihtqcxtqjo8er4xuOpFfMBQRBtXI4xPSoNFDzkLScdeDM5hh3/bBZClgRlRqQlNnc3In
         aU4p4+YbUL+XqH186IRsL2wYe9QOdlbTkNRyF8kAfcVJMUw43K1qca++xWiAC21eDDut
         MZhmXvboHpL6Qfe5GttS5LHUnjS0te0EiPnA0hxeeIo6izYmmF5KaKE9RSaSYRLrp486
         oI0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TXlgfGX2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w63si1923232ybw.493.2019.02.14.11.19.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Feb 2019 11:19:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TXlgfGX2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:53681 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1guMXH-0000yM-Nb
	for alex.bennee@linaro.org; Thu, 14 Feb 2019 14:19:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56891)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guMWD-0000PC-Ms
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 14:17:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1guMWC-00040P-Ti
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 14:17:57 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:36296)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1guMWC-0003iH-NQ
	for qemu-arm@nongnu.org; Thu, 14 Feb 2019 14:17:56 -0500
Received: by mail-ot1-x341.google.com with SMTP id v62so3610985otb.3
	for <qemu-arm@nongnu.org>; Thu, 14 Feb 2019 11:17:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Qy4YAcoZYbpBkIfx6vAOq/ldiESyKK0r7enuMTZoxLM=;
	b=TXlgfGX21eWMo7dtYQdaSNGYuoW0e9yGQI8tLl0oJPU0NywkaWFYSNvlUoOizoNWp4
	6A5nWgz1SVRX7QQskkWeOD2VO6llRQ8mKFOpBaO8EG4jNIW8QGQ+8bmobbZVqPGh8z3e
	3u9A6/Dfj+j1Pjh7aiL2f9rwD1TB7HEamDidPM67E/eszxtZnQIX7NkYcAEoDDdMpRNq
	L+9yHEOqsOViROUaQRhasiWJd+CWX+UK1BR98c4FywN3bNlCCefsq9kxaEaf8a/a3VBz
	V3yUdslmEB4BpAzUrDODaqs3TiNOsYoCr5usmv/yuAluZjv496Bht3xwfW6Okzk6Chcn
	DYqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Qy4YAcoZYbpBkIfx6vAOq/ldiESyKK0r7enuMTZoxLM=;
	b=hXnTPrlDWmpbX2ByzM1zoNg10if+OiIFhw0bkklOi4oKXr48jXziMGpYhjO7nEJM4x
	6OTOJ2Lf66fMN7zAKOrpaIjWae0OpbCO499g6YuuEdu6xUeJHsJZ3emfsjqPJo00T4xH
	KQmRSTF4wbH/ZoVHjggJ4I9AuE9z0B0O+y6oVrm2YfmdUEaO/RWT5ukSXoUlpstL4IJp
	wgZZSe6DrnaXVCDWvEwVHpXg7UriQI8yheenGpGaNFNAkQ8kGW8TwXPtjtRVuQedBztq
	Rn8hFKc7408i8VixmTpGL6DQYgj+nGUmn03bblgnctA9g1ePvsEOFguA+qI4loLBaT7L
	cdHQ==
X-Gm-Message-State: AHQUAuZunZiHKpd3kZ4zA8moGN1rrNwxCgm+UULvBH9kJJNgfJn+tV9d
	hZD1AM3YsebmxnGmBJhcX0i5QUZdBVwUtbigIwG+3g==
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr3538212oth.317.1550171847166; 
	Thu, 14 Feb 2019 11:17:27 -0800 (PST)
MIME-Version: 1.0
References: <1550047098-1210-1-git-send-email-thuth@redhat.com>
	<1550047098-1210-3-git-send-email-thuth@redhat.com>
In-Reply-To: <1550047098-1210-3-git-send-email-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Feb 2019 19:17:16 +0000
Message-ID: <CAFEAcA8XGsKzS=4=wn7k0ZYRpw7toNUtaxQarcvfmrcp_7LvZQ@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v2 02/25] hw/arm: Express dependencies of the
 highbank machines with Kconfig
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
Cc: Yang Zhong <yang.zhong@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LtCx6tenIn3M

On Wed, 13 Feb 2019 at 08:38, Thomas Huth <thuth@redhat.com> wrote:
>
> Add Kconfig dependencies for the highbank machine (and the midway
> machine).
> This patch is slightly based on earlier work by =C3=81kos Kov=C3=A1cs (i.=
e.
> his "hw/arm/Kconfig: Add ARM Kconfig" patch).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  default-configs/arm-softmmu.mak |  4 +---
>  hw/arm/Kconfig                  | 12 ++++++++++++
>  2 files changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
> index 3baafc4..59734ee 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -6,6 +6,7 @@ CONFIG_ARM_V7M=3Dy
>  CONFIG_PCI_DEVICES=3Dy
>
>  CONFIG_EXYNOS4=3Dy
> +CONFIG_HIGHBANK=3Dy
>
>  CONFIG_VGA=3Dy
>  CONFIG_NAND=3Dy
> @@ -54,14 +55,12 @@ CONFIG_PL022=3Dy
>  CONFIG_PL031=3Dy
>  CONFIG_PL041=3Dy
>  CONFIG_PL050=3Dy
> -CONFIG_PL061=3Dy
>  CONFIG_PL080=3Dy
>  CONFIG_PL110=3Dy
>  CONFIG_PL181=3Dy
>  CONFIG_PL190=3Dy
>  CONFIG_PL330=3Dy
>  CONFIG_CADENCE=3Dy
> -CONFIG_XGMAC=3Dy

Could you explain the logic for when CONFIG_*=3Dy
lines get deleted from the arm-softmmu.mak?
In this patch PL061 has been deleted, but PL011,
PL022, PL031 have not, though all these devices are
used in both Highbank and in other not-yet-converted
machine types. What's the difference ?

thanks
-- PMM
