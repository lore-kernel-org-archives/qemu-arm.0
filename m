Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp698350lfb;
        Fri, 4 Dec 2020 06:50:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJypMVjHRzko4yFFwVIoE+bXlFnK5U15Bsh/IZGgtHeNKi7qn/9b4GBuXf33zLSjb9SKvkAX
X-Received: by 2002:a25:ae53:: with SMTP id g19mr6140753ybe.288.1607093409216;
        Fri, 04 Dec 2020 06:50:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607093409; cv=none;
        d=google.com; s=arc-20160816;
        b=uTTNnXryplhNojZ5TVinC1wFdIGkmwmqszVrtpUvf+bLINzn/naKs3c68yI6BVPd+T
         DKplhLJHmhrv0x4p3eHRzUEep5nSm9hJtvuAmHu2LLlBsElKLofQAl1f9T3ThJreJNM8
         oOozOJEHFRCMD/i6Q95LhvdvE89KCJWW/1olNubSFw3f48s6rcXl3bShYYt+g2fC9uaH
         ie906+IaxVsFWdcQ+FoPV2LrsHX2fdlsTCHfiLsWWQRFjhG0gi8bWNAOvWocenmxYmXa
         qiHeM2hJ7lJFYFizEcmd0zOSuz+Dv7j+yevWVH/VXagyDIJG+Y6kpnQIg0q/mI2ESBFu
         r7wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=wJaD1CcfrX+gDvYqQT0Wot1QgoVeYjVEBtk9V/P9i2o=;
        b=g3oA09bv443vuPaKYQK/kNE3iTXrEjuV1RizMS+pU2edotwN6FBmDlCrXXVKytJUQy
         JD7jMEPM34DLftr/2TrQ8Jn+5/E9RlLsGHUI55QzVEqcZXgfT76V7dADwZ0HOv75icg2
         z9zNm2Qn7lEoIiYi5XTJsHd/jt+efsEuWMH2yUk09IX43axuk8l+FjYlubkEVO/OlDKR
         XH1un1rsv54c13JrM3CKXRQ/quEtnczfE63OFiCio9vbQ9X3JwEguR7pQtYhFKY0Pb3N
         hJibMWI7jt0/xnZy3kLusrP4YTLmOO3T2SxvXxkGtelRLowtjW+LaIHryK7Tt3sATzO9
         z/xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=pGJvA4NG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r184si1910821ybf.24.2020.12.04.06.50.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 06:50:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=pGJvA4NG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:49058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klCPQ-0006JQ-KX
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 09:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klCPH-0006Il-A1; Fri, 04 Dec 2020 09:49:59 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:40160 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klCPF-0004GQ-Ku; Fri, 04 Dec 2020 09:49:59 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id AF9F841448;
 Fri,  4 Dec 2020 14:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607093392;
 x=1608907793; bh=QldUVOVf3+mraCRsEzt3ld+hk/iPYrp9FUN3ECLUhmo=; b=
 pGJvA4NG8Vd/CsKalzpZSnIzrQVHJhOR7QyfV+nKAkieELU21nfHWCo1EF6HxpSR
 HlJCQ4balnxKXGWWzB2KKPA+g1WCY+BAckdHJDRH8Ja1eOBFs3Q6DLhdz0JfXdJ+
 zbe2evip7uqcoywud4qO2klcB0Ws4YP4KcqePN8WVEo=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i1k4xDQPOApF; Fri,  4 Dec 2020 17:49:52 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 01FFD41447;
 Fri,  4 Dec 2020 17:49:51 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 17:49:51 +0300
Date: Fri, 4 Dec 2020 17:50:14 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 01/11] hvf: Add hypervisor entitlement to output
 binaries
Message-ID: <20201204145014.GA86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-2-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-2-agraf@csgraf.de>
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
X-TUID: JpLcn++7I3BK

On Fri, Dec 04, 2020 at 12:48:47AM +0100, Alexander Graf wrote:
> In macOS 11, QEMU only gets access to Hypervisor.framework if it has the
> respective entitlement. Add an entitlement template and automatically self
> sign and apply the entitlement in the build.
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>
