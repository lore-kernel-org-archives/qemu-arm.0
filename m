Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp962856lfb;
        Fri, 4 Dec 2020 12:11:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzDyta6VXOC9dL4r84B9OHvRERGWYjLK0lvBtOxBdHMiJTuvksWcwGarZBu8upKsdVK3f2r
X-Received: by 2002:a25:ce50:: with SMTP id x77mr8923195ybe.38.1607112716163;
        Fri, 04 Dec 2020 12:11:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607112716; cv=none;
        d=google.com; s=arc-20160816;
        b=juBF/1NaAgpsXKiQCQVd9cW83C2g8+WqCzlFBxPcI6f8ffUPrNEe0jTnufeDlJKGHL
         SIdMdsCvUYGkw5E54dcioXNvBTUtAUMJ0N4qILHDPHLzcJ0SzTMqpaYXRIRWVn/fLjnD
         Q+icH3p8o29Wma0jLOSbLuduLHhF8XsS0lnZDF8dlYyLGJ2DGvbHimdh2678T/Rvnvlh
         DlokQdCjNLJ7OFc6MPAjgUwI4QRHQ4pY4IGGqZT+xQLNfti50rTOuenbuzUSSK0hWylH
         pLkF3sWgH1s1utsxRWvlymfWz34Yb9bbrm9/5ghg0esPgOka5PZk68D3J5FaA1p1ei58
         cUWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=0NZtmLJCQq+FfdUn0vhH9OF1Z8gDNIHszO35SldcxHA=;
        b=0UjMHnKnDM0/H86NG9kDuow5NGjRo6JxAD7OoYzM+4icGKqq83f0KDKWmLcXu4Z2Eq
         QKIhaHiPb2Vz3KLF1FYu/FZSDP0NFj999aT13Vryp9UkW8bvxSk/xnP8SGwqqdvc7aOm
         4qfQZ+L2rN/oM6lsLtwKJYOrrm4206aWgdKKSZV6gjIrMeG+F3bAMn5cXF2DlLdt1RiT
         mCNKDEU2h8r2cGXuAEpTqzf68gGYRbyiq+P5kLvoNmet4Q+7zg06NwRU8aDxDO1SZXvf
         V4ijyEASRSNNjA0cTDjvdc/Un1uMWvW3BLw4r83cbPb41eXt9UBwxobE2z/sEuz02eJ6
         KGlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=kPyokacX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si3337905ybk.378.2020.12.04.12.11.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 12:11:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=kPyokacX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:40582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klHQp-00085P-HR
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 15:11:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klEkK-0000AL-S9; Fri, 04 Dec 2020 12:19:55 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:46242 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klEjW-0000zq-OK; Fri, 04 Dec 2020 12:19:39 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 4426E413EF;
 Fri,  4 Dec 2020 16:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607100078;
 x=1608914479; bh=+chenhLr10LuUBvAGCBgnQJzSbfU2H/hqR0t24bg7zo=; b=
 kPyokacXcSdebzuDM/PoJ+Sght/EpxJ0U8jTYefqg/D+CGioF5R3QW+Oj2mpzo0D
 PMxDCpQavQ9LYltWoZOWAGCrx1pcODWBtCuc0nMLbVyLrO5/vhHFOMF32FLThChV
 u1imGCpt8D7WJPda35fu16ilhHXBkzxsP7y1DK48Eng=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqpNTrOp8pbi; Fri,  4 Dec 2020 19:41:18 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 05ACC41373;
 Fri,  4 Dec 2020 19:41:16 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 19:41:15 +0300
Date: Fri, 4 Dec 2020 19:41:38 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 07/11] hvf: Add Apple Silicon support
Message-ID: <20201204164138.GF86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-8-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-8-agraf@csgraf.de>
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
X-TUID: Nx4uWw6GQ9Ra

On Fri, Dec 04, 2020 at 12:48:53AM +0100, Alexander Graf wrote:
> With Apple Silicon available to the masses, it's a good time to add support
> for driving its virtualization extensions from QEMU.
> 
> This patch adds all necessary architecture specific code to get basic VMs
> working. It's still pretty raw, but definitely functional.
> 
> Known limitations:
> 
>   - Vtimer acknowledgement is hacky
>   - Should implement more sysregs and fault on invalid ones then
>   - WFI handling is missing, need to marry it with vtimer
> 
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> 

For non-ARM specific bits,

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>

Can't set Tested-by because I have no ARM machine yet, but x86
build/execution is fine on Catalina and Big Sur :)

Thanks,
Roman
