Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3392368wrt;
        Mon, 8 Oct 2018 05:30:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV626fQRlWxZ4sAHNdfJ5UHRyxxD9SnSwtJYg43opy4wi++1kTf+xDTcHWyW62rXbb9urIB9h
X-Received: by 2002:a37:90c5:: with SMTP id s188-v6mr11072486qkd.104.1539001852571;
        Mon, 08 Oct 2018 05:30:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539001852; cv=none;
        d=google.com; s=arc-20160816;
        b=0FtFmnQWLKmaArpaNbx7BMNlB22QZc5ITSnvFrZfTyIW8USk882TbnGnjT1iU2mtmx
         asGB5zKibpJM3GxbiJxrFtuupmzVBuJ7F4CUPZO7qujnHCFfpn8xjz67kt2ZbPGoEj1n
         DW32bJ/zJ6b0EnaeM1FgvGJXgh+CLmybmKB7hulo1sApmOeOxh7ImUvxHuAcf6dzvPMj
         nq686MIw20nXQsd8LwMwEVOPXS8b5Gt+Wafp1TXJA63keYW4nUfDyNPBZYH5INigB/21
         MBgFeulzFsBvfH3TP84lR5lXoMJHJvdcmdpP/ydnYcR2gq0ZYYPLf3V9KS6p5eXUo5lh
         pSXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=7ZP5PHp62dg1qKa8n5pITfSIlHVzEM/8IV9tsr+XW/Y=;
        b=hwGuszIV/A9hGMGC313kwCHopNEbxNvZ5SJQ1dTY8pYHAsWJXUW2ztSiaA7nFzP5kP
         1AnyIuu0NfaxqH4ALS4qNqxxwl1SOqiTowvNLJXaS9hv2lT0RI3qL0A5KuOPf80i4TMA
         W+nT77x0VtMYrl9f3Ft0HtaFM4j2YAF7QDnRxyDuSoXGSNzFRZCxM5qkkerbmMSdmYB9
         faEEyruytdI3lWdEqPYtXZZ2o7LcFBXofTaihn0OguuWVpooUkODOQCtWVX/YZeOeUMR
         6ASBULtZIGSGMOjVeurrEZvzfLMdduycwolMUxuxS38VcFiJokpIYQ+FHkpD2nIHI1/d
         i8Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KXsBg626;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13-v6si9509908qtt.38.2018.10.08.05.30.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 05:30:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KXsBg626;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45949 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9UgV-0003gd-U7
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 08:30:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59496)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9UgM-0003g8-SE
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 08:30:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9UgL-00078a-RF
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 08:30:42 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33729)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g9UgL-00077K-Cq
	for qemu-arm@nongnu.org; Mon, 08 Oct 2018 08:30:41 -0400
Received: by mail-ot1-x343.google.com with SMTP id q50so15271307otd.0
	for <qemu-arm@nongnu.org>; Mon, 08 Oct 2018 05:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7ZP5PHp62dg1qKa8n5pITfSIlHVzEM/8IV9tsr+XW/Y=;
	b=KXsBg626eeLUkME8McMOhcnHWPZAZfFoSbs94xCnlnnTQOaesTXe6Rmr36ustFUZWx
	hqkq+lL5IDP+EHpOI9C78PSWDPGrGqGWIRrOthOodNDbLyTeyM7lPx4efDwjp07ZeP7V
	WDObjiqhwETFyQB45qOZH17/EwIoVY/umNyJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7ZP5PHp62dg1qKa8n5pITfSIlHVzEM/8IV9tsr+XW/Y=;
	b=WHf1kuw7rByF/XayjDNZ+d1iWSzU8dsSjdd2YIkQuTY6JD1ybLxa/F8Dxm1Tj7Q8OA
	08AGi6z4lRv+On0N19wPq3gd1loITlU1iU7iDpL68AhhzFfMoj9iEDstQkJNJiucCZ1X
	ytOEUY5gvlhCPfsxTLRp2ZR0jrJkpZgmqa4zsHec9ovxFXohDP5xO+IpboBzlASLfaH2
	ZOh9o9Fu45vCX0WHXkvRpaA75wNw756/nMdRvOmYMChs9Kmg7As/rzUSQhL/u2JvB1Jg
	BfrxmjkJVjT4Cv6r6yeksVE6s42G4JOw3jNu3dnjjc6W/FbrzhxCNfttQiQut4vMIMWX
	OcCQ==
X-Gm-Message-State: ABuFfohsmHQ5o+FUvrtRgJJGUFp4hsKGhS8pltvZAMwcrxA+tnRAYUeS
	YCB48NUO9WXDMIjJZhbsbu1Nlyc/Nv+h7xzjigu1ezdYXNI=
X-Received: by 2002:a9d:2377:: with SMTP id k52mr13911901otd.238.1539001840598;
	Mon, 08 Oct 2018 05:30:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Mon, 8 Oct 2018 05:30:20 -0700 (PDT)
In-Reply-To: <1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
	<1538579266-8389-7-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Oct 2018 13:30:20 +0100
Message-ID: <CAFEAcA9_EOFV=5i-4S1GWVgewAa89hJDTegnf9Ot3w7rfkZWYA@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v1 06/12] net: cadence_gem: Add support for
 selecting the DMA MemoryRegion
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pz/AEskxNrlS

On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add support for selecting the Memory Region that the GEM
> will do DMA to.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  hw/net/cadence_gem.c         | 63 ++++++++++++++++++++++++++++----------------
>  include/hw/net/cadence_gem.h |  2 ++
>  2 files changed, 43 insertions(+), 22 deletions(-)
>
> diff --git a/hw/net/cadence_gem.c b/hw/net/cadence_gem.c
> index 759c1d7..ab02515 100644
> --- a/hw/net/cadence_gem.c
> +++ b/hw/net/cadence_gem.c
> @@ -28,6 +28,7 @@
>  #include "hw/net/cadence_gem.h"
>  #include "qapi/error.h"
>  #include "qemu/log.h"
> +#include "sysemu/dma.h"
>  #include "net/checksum.h"
>
>  #ifdef CADENCE_GEM_ERR_DEBUG
> @@ -835,9 +836,9 @@ static void gem_get_rx_desc(CadenceGEMState *s, int q)
>  {
>      DB_PRINT("read descriptor 0x%x\n", (unsigned)s->rx_desc_addr[q]);
>      /* read current descriptor */
> -    cpu_physical_memory_read(s->rx_desc_addr[q],
> -                             (uint8_t *)s->rx_desc[q],
> -                             sizeof(uint32_t) * gem_get_desc_len(s, true));
> +    address_space_read(s->dma_as, s->rx_desc_addr[q], MEMTXATTRS_UNSPECIFIED,
> +                       (uint8_t *)s->rx_desc[q],
> +                       sizeof(uint32_t) * gem_get_desc_len(s, true));

At some point you might want to add support for handling "descriptor
read/write failed", incidentally: address_space_read/write return a
MemTxResult which you can check for != MEMTX_OK.

thanks
-- PMM
