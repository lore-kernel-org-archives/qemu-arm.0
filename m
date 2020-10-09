Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2440133lfq;
        Fri, 9 Oct 2020 09:43:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxvyP1HgC8ZKC3AqoF/eg0t324ejKBItSrTgxtp21tkoJnqC9p9ANyDzMW4BTcEQIQO1eT
X-Received: by 2002:a25:ca88:: with SMTP id a130mr19060784ybg.165.1602261824616;
        Fri, 09 Oct 2020 09:43:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602261824; cv=none;
        d=google.com; s=arc-20160816;
        b=SINQfvmD5bTxCvYnBHCw02ctLqcaeZYaA9hH2Py6n77y7YdShiGbsxs97KCdzeGgVi
         aNgcv0Tmb3DucJDn4F9LZUjMGFWeI+cvIFjt4hR9IFvEtLme/ljbCfnJ0iX5t51CcR94
         aKE47WvOGKMKodDkduqw5wGBtYtm7dfsCh0ZGEeGmY81z9kqiTQYIeRb167U8/0TpSBL
         K6Y4QHXzGoHX6VGuamcNO+lmvxgm2Q3lY4Uitu5oa5Ye6EPny4fb+mkH0MaKSPP/R13V
         7VYd968kstiwsQnciLouSzURZfC/h7ycNU3wu+/Ev1DMPJhybYSZ9mdLm7fvt8SFc1Og
         t9Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:user-agent
         :references:in-reply-to:subject:to:from:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=bLU9un8H0M+vcq4axdrtMf41P0F1VdgUfM6cAkMNfWU=;
        b=Og/l+FcFBqsI3Aqtu6b6ey7phMQOPfhFFy2srk7hjve+hZv61zO60YPKUO2n6ZsKIH
         eVbLldfFMH1yV/UAg0viLhZmTa12bkVjQI+U76bEq6Ww2WaytzrVvPHL6k9MYn4hrhYX
         iR2EasA7+7QyBZtsJLO8+/LAeNNFF+VQWUZyeCEc2cxJFC+C30aQ6pbiVBC7eYB5bJ2q
         frVf0W5rA6dBbzRli0s1w6JvDzcV9qnbsproFSsviyJgioEnO1efVW3Huhxv+3AaBlFM
         zQ5/+OkWLP2mIssYB+SM7DHbRUZMLA6EAlMa4A63cqWSeGBwMSo9aSiLbdPUrhvrOKnl
         dOOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=2TX8s9cw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d130si7333799ybc.251.2020.10.09.09.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Oct 2020 09:43:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@kernel.org header.s=default header.b=2TX8s9cw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from localhost ([::1]:35120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQvUe-0008Ia-0M
	for alex.bennee@linaro.org; Fri, 09 Oct 2020 12:43:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1kQvQn-0002lK-Lr; Fri, 09 Oct 2020 12:39:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:53426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maz@kernel.org>)
 id 1kQvQi-00069n-Ls; Fri, 09 Oct 2020 12:39:45 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC3B92227F;
 Fri,  9 Oct 2020 16:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602261577;
 bh=BijnUXUSrlZuxdom+hiKK3koCT7tWTVCca3CcvH/Y0c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=2TX8s9cwrskazcYgdvvXIEk1DLTJqwZr1JhsmophCYTijzvSx5vfJ956ZuvG0j/0y
 LkVpYsTvQWy9p8LqAvnwiWhJHqVuPnPTbaatggXKqw4ECGfnPbTrldxaspcthIYvmh
 zVcJhlBlRNyDxbLvYNji6aYWjH9iiSw3rR6xXRPo=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1kQvQd-0014Lz-Rd; Fri, 09 Oct 2020 17:39:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Oct 2020 17:39:35 +0100
From: Marc Zyngier <maz@kernel.org>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] hw/intc/arm_gicv3_cpuif: Make GIC maintenance interrupts
 work
In-Reply-To: <20201009153904.28529-1-peter.maydell@linaro.org>
References: <20201009153904.28529-1-peter.maydell@linaro.org>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <849e61faa6da0bdc21845f0e95a516e5@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, josemartins90@gmail.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
Received-SPF: pass client-ip=198.145.29.99; envelope-from=maz@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/09 12:39:38
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Jose Martins <josemartins90@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vGh684hd4jnB

Hi Peter,

On 2020-10-09 16:39, Peter Maydell wrote:
> In gicv3_init_cpuif() we copy the ARMCPU gicv3_maintenance_interrupt
> into the GICv3CPUState struct's maintenance_irq field.  This will
> only work if the board happens to have already wired up the CPU
> maintenance IRQ before the GIC was realized.  Unfortunately this is
> not the case for the 'virt' board, and so the value that gets copied
> is NULL (since a qemu_irq is really a pointer to an IRQState struct
> under the hood).  The effect is that the CPU interface code never
> actually raises the maintenance interrupt line.
> 
> Instead, since the GICv3CPUState has a pointer to the CPUState, make
> the dereference at the point where we want to raise the interrupt, to
> avoid an implicit requirement on board code to wire things up in a
> particular order.
> 
> Reported-by: Jose Martins <josemartins90@gmail.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> 
> QEMU's implementation here is a bit odd because we've put all the
> logic into the "GIC" device where in real hardware it's split between
> a GIC device and the CPU interface part in the CPU.  If we had
> arranged it in that way then we wouldn't have this odd bit of code
> where the GIC device needs to raise an IRQ line that belongs to the
> CPU.
> 
> Not sure why we've never noticed this bug previously with KVM as a
> guest, you'd think we'd have spotted "maintenance interrupts just
> don't work"...

That's because the maintenance interrupt is only used in KVM to trigger
an exit if nothing else causes one, and we end-up suppressing the cause
of the maintenance interrupt (by turning the VGIC off) before actually
coming to a point where we'd handle it.

The lack of MI would at worse delay the injection of new virtual 
interrupts,
not something you'd notice unless you start looking very closely at the
delivery latency.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
