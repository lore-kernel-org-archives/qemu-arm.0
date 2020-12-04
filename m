Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp702272lfb;
        Fri, 4 Dec 2020 06:55:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQGc7fJ1cjg/pBscOwxzN+1zU4dUlpkFafq/b95iqiR+QS26DvzHMEocDp7VTDnj9+1TbO
X-Received: by 2002:a05:6902:4ce:: with SMTP id v14mr6012932ybs.218.1607093719811;
        Fri, 04 Dec 2020 06:55:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607093719; cv=none;
        d=google.com; s=arc-20160816;
        b=NXuhv81atbQCAgFOWrmgZMktqRwHl0A3KJ+PZ0ERB19fwwqnSyvkj8rCNs+ZdUZFFD
         IhVgxJdJboPIoCOJyDsqtdr1g1i+gjdR6SmSxyqf0EqEL9h3CXwVo4tsDO7P8aiQJEZQ
         bs5kYnSbEhmYDxttFdzsyGT8nGfnUaShH/D/LoymTtKrFcHeFhHktaIz4KWIrHmGOFzL
         gVHdfNXvrjz6bE4YsWSa0nR5wRkptnyrpsEX1q0SM1DtBLZR50xDrY7jNemLbFOfaEPz
         TMAUXq8oXrud/d4o+huNfOV+/TEGPUgAamLLvgBtiwqJ98x9wZBLYwstp1Mn71S710kH
         9SLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=5u6AJ9wtV2dk43yYF3UnSogl4zh2y1WdpP70gyroM8A=;
        b=OVyre8LxuIV4VA7zZfFkXMbiVJsOaDJfy3haBskfwqlwa5NkvWKgRKLRCpbpDzMVz9
         Y9P6c/RE2xsKFSMXn27zT1iRSMKeo9sLvyYPRiQYxh43R7b6jCXnGiAsTRuZGADpzJhR
         gkRRtRtPqusUaBc0Bu0typRqFhG1mWV3sJp1gQnxTUq2X+VWaRtF49jsFXPY9kuq6Cex
         exQMIBBmKydPT6/vTq1XlBrx5ddxbIN4/ifcmoZVeHIJMayRO97cU3JEAnS5rRPzfGxv
         03lhVU0/xnAkDxgVbt0vS2cCYFDTzPrAYEAagKzYRgQKGvsAB/yVmKWNF4nWbYpQruYY
         nWTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=Nf4E+CRI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y15si1668149ybb.251.2020.12.04.06.55.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 06:55:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=Nf4E+CRI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:56320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klCUR-00016Y-4M
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 09:55:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klCUJ-000163-CB; Fri, 04 Dec 2020 09:55:11 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:40450 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klCUH-00065i-Nc; Fri, 04 Dec 2020 09:55:11 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 5ACC0413F7;
 Fri,  4 Dec 2020 14:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607093705;
 x=1608908106; bh=GJ+mSliB48VraRjT6OdWhb0m+T/osqmXphNWao/2G9M=; b=
 Nf4E+CRI3+ZBegANPwG1GJGzYiq6vKPS9CckhGK5CDBNHSlR4WL+/3FBSFvGTaMD
 /kxFtZrWocthMMc3rL6JGxhYVjskGznPxODSQyfFM5mf9Fuua9jCwSIzQWYh6+cq
 sgwworfJQy0oje03sJVuvoBcKP5B3snqyfENKqVeQuc=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zfSbWSC9BD6N; Fri,  4 Dec 2020 17:55:05 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 2DFAD41399;
 Fri,  4 Dec 2020 17:55:04 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 17:55:03 +0300
Date: Fri, 4 Dec 2020 17:55:26 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 03/11] hvf: Move common code out
Message-ID: <20201204145526.GC86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-4-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-4-agraf@csgraf.de>
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VnukylFFuLWc

On Fri, Dec 04, 2020 at 12:48:49AM +0100, Alexander Graf wrote:
> Until now, Hypervisor.framework has only been available on x86_64 systems.
> With Apple Silicon shipping now, it extends its reach to aarch64. To
> prepare for support for multiple architectures, let's move common code out
> into its own accel directory.
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman
