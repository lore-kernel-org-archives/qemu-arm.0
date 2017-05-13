Received: by 10.25.0.6 with SMTP id 6csp824877lfa;
        Sat, 13 May 2017 15:41:56 -0700 (PDT)
X-Received: by 10.200.36.10 with SMTP id c10mr9852073qtc.160.1494715316889;
        Sat, 13 May 2017 15:41:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494715316; cv=none;
        d=google.com; s=arc-20160816;
        b=PyDEvB67dvyseqG2NaXbpGZLZ+rBXpB8k54tznpvvx25m568Vom2bD0Fhqul5eDi8s
         zZ3iG9cL3sj/Wt8sQuNBgYUZ++mu6OC0Q5eNZDSbk+Hm5Mw5xNabK5I9bs4iGuVsqgIy
         k23YOB8yE807+8cQ3QvHWbG15hE2+Tzu4iAS5vmo8WkXm4DF/nCclCQNWXmjQnvKMIWw
         NHcRpzF3Hd1nWIXCJcx8gwzowjCh8DDyJioyXw3WpVnN5KU7N4LD2pti4x37lZi74Oym
         HQ2TR66xdFbNlysc7UEPvkP4Vmx1ZMhB8vWJUp83DIB4TnOC371jFoociILSyGzWNvqf
         zSkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=gTvr/0V9hDQPou298WRv96QgrF73YuVeQeZkFeX3OMg=;
        b=HCjWJg9Zzu4KmCXG5PLiizGBwDLCauL6JFy1TrKHmfcZDC0wYw/n0G4eKwk2bkGrBq
         Q0Ze0m0aouOs7B4/cPYeevfi+BtyAnQX08Mz6b9tFDOzVUPul5OLXmywfAYY0FVdw468
         SXhyDJt3PvadqWpqaVSE8U8ZR4W0tsl/AnFPhLt3w6QpPSinAE4wEQ+KjF/5tLSWs+hD
         Ghld95X6yXGj50V3cbzQyMVSRXKI3LDz5chPZbck0iGmWPLq5gxLtSFJrCYb9++VHD6z
         VQARdG++RVmrdxiFsXZJIGAQbi8LBme+4tM/ihYSvmo8pWVB9LfapSr3vxcewBStBFS/
         rB6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q10si7161163qta.105.2017.05.13.15.41.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 13 May 2017 15:41:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59024 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d9fjW-0005Xf-66
	for alex.bennee@linaro.org; Sat, 13 May 2017 18:41:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38396)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fjL-0005Vq-9l
	for qemu-arm@nongnu.org; Sat, 13 May 2017 18:41:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fjK-0007uU-H4
	for qemu-arm@nongnu.org; Sat, 13 May 2017 18:41:43 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:35342)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d9fjG-0007pi-9F; Sat, 13 May 2017 18:41:38 -0400
Received: by mail-qt0-x244.google.com with SMTP id r58so11167845qtb.2;
	Sat, 13 May 2017 15:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=gTvr/0V9hDQPou298WRv96QgrF73YuVeQeZkFeX3OMg=;
	b=Tkg4hmbh3GrQ+9LkjpQI2785te3h3Ctl0FBN5v+oRVTpNEd9FNjwUHGTDggCfsufam
	i1zm5eN+GHKdGvsI+Pf2CHeOMonWCnWDrwYmD7ofEYIJHqEXwXrN6NMyowUSqY6rKzGU
	DydbqrazML0bv3pqBSR058KFnYZ4jvVh+J4Tu4DC8An2X1LVv8/9t1wgchHX1ag44U6r
	ir0c/kEHYKaKKGO+mAY4lL0LWWG/SAQHDXdAM2AcgzIUkHneAa1nhLRxoIcrVW/kUTIf
	7SmtmhjSASZo0E0NjAmXBeB5MaOiEY5nbKHMfxhCBccC3W0wT6NwChllyBJ9ii6lg03W
	AKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=gTvr/0V9hDQPou298WRv96QgrF73YuVeQeZkFeX3OMg=;
	b=ZT0bfFf5BNJmGhJFcJow+0/Us51V8JCFfb8cKL+mYoaN0osqx4ZaWZxGc4Ka/GKrfv
	fvzXajXTzZpGQSlnlWIRZJ3kUU9yh+3TqJGQJVtqjcrBvJ0eb4QVK3Rk99FSKsoDzQkg
	NnFoQTdnd3EtdGqUs4CSW/yN3E23kGvMUqcVbagwm/D7sgrjH7/016eSa8v/Sq/gfrk+
	DOXR4ALmJAgYLwLo8IxM0YO09wEysO1uRu1cAWXdE/LGrVcmpqc0fuaa/evUWUiITaQs
	avUJCa4oV9aUdlb87ET7v2iChz0Tlmiq2Xd5iHagRfBufzihM0dBZk4D12GleeoEqLbS
	em7g==
X-Gm-Message-State: AODbwcAahRvdyYYUqYsz3VLsNY8wWp3xaSwaVZ0/zN18RV46kYU7FLb4
	w7a/VZkDOs8+bQ==
X-Received: by 10.200.35.110 with SMTP id b43mr9947314qtb.24.1494715297673;
	Sat, 13 May 2017 15:41:37 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id m11sm5448043qke.8.2017.05.13.15.41.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 13 May 2017 15:41:36 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1493122030-32191-1-git-send-email-peter.maydell@linaro.org>
	<1493122030-32191-8-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <8211c8bc-4181-bbac-3688-d5ad2eb2dcf1@amsat.org>
Date: Sat, 13 May 2017 19:41:34 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1493122030-32191-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-arm] [PATCH 07/13] arm: Remove unnecessary check on
 cpu->pmsav7_dregion
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
Cc: patches@linaro.org, Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1ta82Jsw0Fex

On 04/25/2017 09:07 AM, Peter Maydell wrote:
> Now that we enforce both:
>  * pmsav7_dregion == 0 implies has_mpu == false
>  * PMSA with has_mpu == false means SCTLR.M cannot be set
> we can remove a check on pmsav7_dregion from get_phys_addr_pmsav7(),
> because we can only reach this code path if the MPU is enabled
> (and so region_translation_disabled() returned false).
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  target/arm/helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index f0f25c8..5c044d0 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -8227,8 +8227,7 @@ static bool get_phys_addr_pmsav7(CPUARMState *env, uint32_t address,
>          }
>
>          if (n == -1) { /* no hits */
> -            if (cpu->pmsav7_dregion &&
> -                (is_user || !(regime_sctlr(env, mmu_idx) & SCTLR_BR))) {
> +            if (is_user || !(regime_sctlr(env, mmu_idx) & SCTLR_BR)) {
>                  /* background fault */
>                  *fsr = 0;
>                  return true;
>
