Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp886895lfb;
        Fri, 4 Dec 2020 10:31:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzG+PAP2TBwIeYWtn2b7ll/4pn9aiPVZcSQ1Z3XQAghh3oHHlshy90eFw748gmtLeScXD3C
X-Received: by 2002:a25:7481:: with SMTP id p123mr7381614ybc.167.1607106702068;
        Fri, 04 Dec 2020 10:31:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607106702; cv=none;
        d=google.com; s=arc-20160816;
        b=jRBw0fE5T9P2T9TJivQKPFKbA6vdvOps9dApxuo+8SuvuoJQW7yFcgKZWlIleTly9r
         boYKdzfhYd/FYZOgOyY4Bbehyvxg0Y13F3hbGPa/TOB6PHDqmK1DQBow4ycDXXM+cin9
         FWskLIyhKkLJ/WztaWTpI3zhNLdQZ+eg5MfUkwwcyUIYAopVk7hadv+rBCDadbKc5sl1
         uT9keZmrbUOH3t7p1LM6/dN3znhFlLdW44Cvm0kfspSUW/zgkbOCplMkVG0chV73hA/M
         4wJkKXMWN4IhBdFYjjwQjIyISrnuKsS/cyiP7ik7IueUil2gt/ys1JKUEb0sPVa0okbU
         fGPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=fzVTT/kW3+QvsQSx8+RSSRTXBtnu8bow+cdrvApFSX8=;
        b=aMMojmZ/qtdfE4m+hrdW30gG3k0ox2eGqZ58LFYvAUon29HPxiK7et5Vs5+N3alOrg
         HKkBct4x2ESdVcbMiwMABom+/T2uiaasE8dTS3jZAMovdd5M7HYoAe3gqGXDbOKCiBJs
         zrUb2fAp/v7mSrfuJq1t6lOO7P+GMXDQIAXZMR8MeU9vRGHnnaASumioBClhAk6DadD6
         Zojj7BgrywyX8jmuTXSQbGBZBd4yuOBNWGZmVoa1ULnLj/SH/Ay+aYK6rGPDkovfeY9y
         V2bOiryv5Hgc+RclcYgah8YaHqnOa67aMkodpE2KkA4IEO/v9EhBzsQ1JTIwUyEid2sZ
         6NqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=JLGNj2uQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a92si2560523ybi.115.2020.12.04.10.31.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 10:31:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=JLGNj2uQ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:37942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klFrp-0006fa-DM
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 13:31:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klEUQ-0005RK-3r; Fri, 04 Dec 2020 12:03:27 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:45712 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klETg-00045K-Fq; Fri, 04 Dec 2020 12:03:14 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 07098413F7;
 Fri,  4 Dec 2020 16:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607100301;
 x=1608914702; bh=UbfJ/R++S0L60KE+xUkKolPpBmDX+R7YWJSa5+nlIzY=; b=
 JLGNj2uQbuKZ+MlNwTyArg9BcoXlIvjND5tOqSJFhjdaKGKaqq3+Dfu+3jZW/f5K
 WneWeZD9bsOk3qCHxyqNAi8x6V6Xmver11fAJ8o9myW5wVDKdgGULcS3JOx82qw8
 ion8YXvaKa+B4scdIwbgALRcojFMKGZ9cfPSfJN7kN0=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XOyTdGIO5xOp; Fri,  4 Dec 2020 19:45:01 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id F317F41373;
 Fri,  4 Dec 2020 19:45:00 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 19:45:00 +0300
Date: Fri, 4 Dec 2020 19:45:23 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 09/11] arm/hvf: Add a WFI handler
Message-ID: <20201204164523.GH86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-10-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-10-agraf@csgraf.de>
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
X-TUID: BY9/alDV8Orb

On Fri, Dec 04, 2020 at 12:48:55AM +0100, Alexander Graf wrote:
> From: Peter Collingbourne <pcc@google.com>
> 
> Sleep on WFI until the VTIMER is due but allow ourselves to be woken
> up on IPI.
> 
> In this implementation IPI is blocked on the CPU thread at startup and
> pselect() is used to atomically unblock the signal and begin sleeping.
> The signal is sent unconditionally so there's no need to worry about
> races between actually sleeping and the "we think we're sleeping"
> state. It may lead to an extra wakeup but that's better than missing
> it entirely.
> 

Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman
