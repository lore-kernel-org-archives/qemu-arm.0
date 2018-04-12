Received: by 10.28.71.155 with SMTP id m27csp2128228wmi;
        Thu, 12 Apr 2018 09:50:46 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+Sx2Wy/gxar8r5DYkKCxBkU4cu4nLwscWEHdl3rcjp47mkvqDiOwFgQdkc7jFdJzFXn33w
X-Received: by 10.237.40.2 with SMTP id r2mr2412412qtd.330.1523551846564;
        Thu, 12 Apr 2018 09:50:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523551846; cv=none;
        d=google.com; s=arc-20160816;
        b=fahtYwLTO6Yotnq1EgqeGN2hLWGKlYh/dFivZV3KKtuoWVy08uB0wzZXtK8C9Z0Djn
         iIzjReteIywnmBfmqT+1XMTtqZTex7mU9ULTesgRtJJYcgZP8W6s0nk7hHlXvb7ZDsL3
         NRCIp+4p+21OXL1Cdm5UcbX8g8Y8jLOrvO/tlaCWeIFxdMuW3A2TGeMf8+8ffI5wfXE3
         fczGvjBatoO8UWCL7nEYcztL1Kqc21M1ITji0Umq/XzEXAaf9GXhZvNNyueH7kjeTzvY
         DodZNHN4PCW1OtuoVBmstFzQ9r80J41pDrm26Ti6R9ChaLihDh59TaKaYOCvlnWTDryQ
         gVeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=BHVbNb6Ncf0lDmDv8kpJ9z/xrTJx4H0M+nu+sVMP7fk=;
        b=Vepow+CKOBmLA5ia1XJagsdaTG3ojXKWREHGwUugPX3rK0r0+i3C01IBxBSSLeAISO
         3Ri1FUUL4lpSxlN2ZnxQZgRrYhCJSLavKOgLeodjKZXVn6HfKDHdEipWByKjS1L64bhM
         Saof3CQtHHug8No8BsRmPYGfL2yxXUeE98fftFYn8h5JTeETDxnBHUwxAEKW+FWGChXw
         +FWnimMjsajYCadTMnkdiAs+4apdrInRUPz1BaoDF5beYBVVBcmXLdc+AzPRHIy2H0Bb
         Fw5toYbnjpEkp7RFmfh0mXmhobmE/F4p4jQMTzbtq7W+iyqe4ED+O0XunqBRFn+LqtAN
         5+Sw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z4uPfoLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p84si3729089qkl.360.2018.04.12.09.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:50:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z4uPfoLv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54157 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fQs-0003Vv-10
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:50:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36599)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fPh-0002cj-6k
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:49:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fPg-0006Jc-4l
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:49:33 -0400
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:40057)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6fPf-0006JE-R1
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:49:31 -0400
Received: by mail-ot0-x243.google.com with SMTP id j8-v6so6757208ota.7
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 09:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BHVbNb6Ncf0lDmDv8kpJ9z/xrTJx4H0M+nu+sVMP7fk=;
	b=Z4uPfoLv5alsMfcNAQfTSlLBzClgdOeEZopRBMeNxnBY6HeiLd1DhbQiu783GrrHVh
	wxZweJJ11JrCw9Yg2KinKr02SdMJLKRI0pCPldtrQ+JLOshz1QEZxitko2ds9ErvAo+B
	DSfh3UsVsPElX296VgkYxX+6nxLMsZnGlyf9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BHVbNb6Ncf0lDmDv8kpJ9z/xrTJx4H0M+nu+sVMP7fk=;
	b=R9j1MsHz97KzXboYAhkSrZ44SYZye1tjHBSYErl+tyqedLrqzWKl0K507aIvuXaW4p
	NCEZWQPxF7HhWCY8xDG7sDjaLfrMng27YK4mBGvhUgGB1N7hy+1V98BBioCFjJXP+o9p
	mPhpjD8LPcp/z1FqxRFAmpHxypSIE/vBh6GBAHavTqcr/MzfihPL+Ky8qqLWeGzLwXH3
	QQik0b0lzsSOKfpWpqvQKlQhD72z5C8zcAfQ5RF4JlLLagypl+vZ0VEpIOimMcq0bixG
	7bHHmy7Akr3uCYsgOFDVxNdKldDmlKmCXEkhDO2/YQIpvqnk7MYojU+CQ6UB/a22cq/8
	KVpw==
X-Gm-Message-State: ALQs6tAu+DGVFy7ukmanJXvsovBr6dbUH6uFEsCwSg5pLpOfhilKGeOj
	Zj+2iGTiw7UnlErGr82Oqy9kvpUn2DVBW6W9LTv9Bw==
X-Received: by 2002:a9d:2129:: with SMTP id
	i38-v6mr1296194otb.210.1523551771015; 
	Thu, 12 Apr 2018 09:49:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 09:49:10
	-0700 (PDT)
In-Reply-To: <1521232280-13089-10-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-10-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 17:49:10 +0100
Message-ID: <CAFEAcA9UpNW8q+vBKDskhAMVxHh4QUOJ5diP8AR6mpMRk+enBQ@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [PATCH v3 09/22] target/arm: Add pre-EL change hooks
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SEoYpKJk3RqT

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Because the design of the PMU requires that the counter values be
> converted between their delta and guest-visible forms for mode
> filtering, an additional hook which occurs before the EL is changed is
> necessary.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/cpu.c       | 13 +++++++++++++
>  target/arm/cpu.h       | 12 ++++++++----
>  target/arm/helper.c    | 14 ++++++++------
>  target/arm/internals.h |  7 +++++++
>  target/arm/op_helper.c |  8 ++++++++
>  5 files changed, 44 insertions(+), 10 deletions(-)
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 5f782bf..a2cb21e 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -55,6 +55,18 @@ static bool arm_cpu_has_work(CPUState *cs)
>           | CPU_INTERRUPT_EXITTB);
>  }
>
> +void arm_register_pre_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
> +                                 void *opaque)
> +{
> +    ARMELChangeHook *entry;
> +    entry = g_malloc0(sizeof (*entry));

g_new0().

> +
> +    entry->hook = hook;
> +    entry->opaque = opaque;
> +
> +    QLIST_INSERT_HEAD(&cpu->pre_el_change_hooks, entry, node);
> +}
> +
>  void arm_register_el_change_hook(ARMCPU *cpu, ARMELChangeHookFn *hook,
>                                   void *opaque)
>  {
> @@ -747,6 +759,7 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>          return;
>      }
>
> +    QLIST_INIT(&cpu->pre_el_change_hooks);
>      QLIST_INIT(&cpu->el_change_hooks);
>
>      /* Some features automatically imply others: */
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 3b45d3d..b0ef727 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -832,6 +832,7 @@ struct ARMCPU {
>       */
>      bool cfgend;
>
> +    QLIST_HEAD(, ARMELChangeHook) pre_el_change_hooks;
>      QLIST_HEAD(, ARMELChangeHook) el_change_hooks;
>
>      int32_t node_id; /* NUMA node this CPU belongs to */
> @@ -2895,12 +2896,15 @@ static inline AddressSpace *arm_addressspace(CPUState *cs, MemTxAttrs attrs)
>  #endif
>
>  /**
> + * arm_register_pre_el_change_hook:
>   * arm_register_el_change_hook:
> - * Register a hook function which will be called back whenever this
> - * CPU changes exception level or mode. The hook function will be
> - * passed a pointer to the ARMCPU and the opaque data pointer passed
> - * to this function when the hook was registered.
> + * Register a hook function which will be called back before or after this CPU
> + * changes exception level or mode. The hook function will be passed a pointer
> + * to the ARMCPU and the opaque data pointer passed to this function when the
> + * hook was registered.
>   */

I would just have one doc comment for each function, rather than
trying to share. (Some day we may actually autogenerate HTML docs
from these comments...)

Do we make the guarantee that if we call the pre-change hook
then we will definitely subsequently call the post-change hook?
(ie does the PMU hook rely on that?)

Otherwise looks OK.

thanks
-- PMM
