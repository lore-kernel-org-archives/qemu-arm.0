Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp703664lfb;
        Fri, 4 Dec 2020 06:56:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2/sgGUJbkvbRowAqrmYW3oBCVhQ0CzHiUmCFeQSu1dslOr2RcIfNf+DWb3YBp4V9nhoQL
X-Received: by 2002:a25:35c2:: with SMTP id c185mr2689670yba.77.1607093819626;
        Fri, 04 Dec 2020 06:56:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607093819; cv=none;
        d=google.com; s=arc-20160816;
        b=HIm/taCWzlIxkPpIwaLWaoU3e2eXyDQocvVi01ynHWn3GZcXxr9zT62MsR0++WXWN8
         f+EKMJ9OzMV2Yq7bY3KMYLRiA22OelE7WaflBOBCVFGw53qZKfoSiyax6CQpP+PVH945
         o41x9U1HyJgdh3t4c2fEeE4v9Dg8tpaccolGf4M3Exb5i9XHnuoH1zjrslnURktXutZq
         QzWEVhqNHfCWwxInTIogqS/y2nwsalH115uhGO9mzSiOLZ1Igjx19pQiMsRdbYM0Egm9
         1Dzxw735pfWFizyi2i8Qqc754QPtDlvOQ5XtQM0VJdXew86z5iNGoDntUZX+YAjP3yY9
         59aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=aMTr5ts4WoUMcG4KALnjyK24WMMDCuxfliW3NB8GUnw=;
        b=xeSc7613OWMqnjR7FxU0e8aw7hfUeLlz+pJOieUROQ9RxLuvJhxG3MhD0fly3oEPMa
         uHDZQWSekmZf31K8H0qBeZJ6nyL+in/jQG0sOlN/KMiic2pdWqgdKtaxLtXm90qj5W8e
         pTcD6LBZsuZb9bQTUhTC9mXZwA4wdAUTEUF9jfUp1KuLk5gLjrbkks2tM+7Rq4KLScqe
         1F96yCZ2dcd9oY28GmioBPovFECztEia+NhNp7EjWiaJiT+pyNI6pssEBRAE2xtYp644
         2qbF5Gx9v2se6M47tpMNcBh5wDy7T1/UV6c+K6G9awp8CggIe2YOtOZI/LtDv9s6PRYV
         t7og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=mu8bSOCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j9si1686089ybt.449.2020.12.04.06.56.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 06:56:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=mu8bSOCx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:60310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klCW3-0002q4-1P
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 09:56:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klCVQ-0002Ne-PA; Fri, 04 Dec 2020 09:56:20 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:40550 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klCVP-0006eC-6P; Fri, 04 Dec 2020 09:56:20 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 0D90B413FF;
 Fri,  4 Dec 2020 14:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607093775;
 x=1608908176; bh=MzP0IiDpMCLr9L//kmL4B7PEWosw3rCBj7QUR0sVgME=; b=
 mu8bSOCx/41acwvOKC172ptCkuMdIGJGeUyNCKn0phNjd13RR+qT34XqfCeZwJ9G
 wEZBR1ldJyYtMG74Zf8GAcry9fr4WMk3/AhDqwsOsKewx0zdShyXA7BjHBAXzSyI
 9Ad0DvJxtrE5L2Xxt86xLZzFWHkNhejE2UtJ3HSNw70=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vSlJnY0Obs8f; Fri,  4 Dec 2020 17:56:15 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 697E641402;
 Fri,  4 Dec 2020 17:56:13 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 17:56:13 +0300
Date: Fri, 4 Dec 2020 17:56:36 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 05/11] arm: Set PSCI to 0.2 for HVF
Message-ID: <20201204145636.GD86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-6-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-6-agraf@csgraf.de>
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
X-TUID: 8Sf3ZwKrUzki

On Fri, Dec 04, 2020 at 12:48:51AM +0100, Alexander Graf wrote:
> In Hypervisor.framework, we just pass PSCI calls straight on to the QEMU emulation
> of it. That means, if TCG is compatible with PSCI 0.2, so are we. Let's transpose
> that fact in code too.
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
