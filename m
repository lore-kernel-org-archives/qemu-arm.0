Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp880155lfb;
        Fri, 4 Dec 2020 10:23:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxJltgjOZcM3U8GOq54uWsN8yYoGCvWkc0JM7ETC3EGsHV8A2Ha494gjh2byg/N8DNDyep
X-Received: by 2002:a25:f20a:: with SMTP id i10mr7432175ybe.37.1607106180071;
        Fri, 04 Dec 2020 10:23:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607106180; cv=none;
        d=google.com; s=arc-20160816;
        b=FP5W5DBf4sqFhz39ics8obJGdr9sfOXnctsmEM6jGctB6hMfIMCQbjH0cPRk1gmk43
         p4fCx9B6CYynXx7mZNhgyp9YDxV1D0unrlnFM5JJj+OuMbI+1tHsh92oxPwnlf6hYlEv
         bTs3k7dn1AIf/PglGPgmg4/BamUGWaowCGNJhqDdine8WLn4G4lv/r+FP70RIV6zZfFB
         trxuhtF5734UWL6GTyY2vSCif9Aig8b79fUx7dghBherGjXFedNGSOoxdVS7L+eve74Z
         mmQj3DkQ7knXHZY+S5GhMwijXxCjFPss4PDNhOlR48fE8svpdfrKCh1tmqFrGrwbjTbn
         YZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=AnLZqXRO5WW5VY2MOwqadIK02xPsLNlIMLIc9l5aa50=;
        b=SstXRzW3dqHpcpJtG0aZfTat6U6dc62nByh3cpEBRhnocu1f8Ubzo3DnlGJqSgXm2a
         zHXbFwW9vwcotgDdUS4vAUOPG1Gi3zgwEwHUAx1DM1r8YdLrqNvXXGPVk/0k9Z9ZU3fC
         e1F2Mw8YMUyo10Nx3U51UFMrabvQ0NGUJtMiCVz+Mw0eT5ofRPfpBA8fvj1AYdObxIGp
         a3jD+5cByU5DG0WfAHiHVs7cAaUXJ0kwE8oyfmxWL3s1YhsQmnrEAn7T8m6wPBWRRQ5F
         S9BdEyF+vFLotRSaUXH9aetrLmMVgGzkXUod0YnI8pcEKxzzMdI0InmXeebUPKxRZxfK
         ukHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=hIuSQNzJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n81si2177825ybb.186.2020.12.04.10.22.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 10:23:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=hIuSQNzJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:55736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klFjP-0001mk-G6
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 13:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klEUQ-0005Ra-9r; Fri, 04 Dec 2020 12:03:29 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:45706 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klETe-00045J-OT; Fri, 04 Dec 2020 12:03:12 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0FA5C41399;
 Fri,  4 Dec 2020 16:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607100239;
 x=1608914640; bh=xZTAvaMkziR5oqHxZJHWNBOucEX10uaVyqILZoOqZeA=; b=
 hIuSQNzJu2BeM9LJqEflQS8LPPUWamNJp5FcE1zKtgNHr/hzVNoS//rVoJ75b5Yu
 rG8XpYL6sgPF6pH2AeaWJa4GeCNsg5fQ1LMcmZGO1XQWnE6JmJXOlom0EmyIZ+bZ
 9GST/8dxQLFsYBov6JwmIRP1kKZ8mK182uiKBqc3OLs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGqOVryWcyTi; Fri,  4 Dec 2020 19:43:59 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 0189141373;
 Fri,  4 Dec 2020 19:43:59 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 19:43:58 +0300
Date: Fri, 4 Dec 2020 19:44:21 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 08/11] arm: Add Hypervisor.framework build target
Message-ID: <20201204164421.GG86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-9-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-9-agraf@csgraf.de>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2+FeOKiY4pYs

On Fri, Dec 04, 2020 at 12:48:54AM +0100, Alexander Graf wrote:
> Now that we have all logic in place that we need to handle Hypervisor.framework
> on Apple Silicon systems, let's add CONFIG_HVF for aarch64 as well so that we
> can build it.
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
on x86:
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman
