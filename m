Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp884642lfb;
        Fri, 4 Dec 2020 10:28:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynBUnu3c+Nxqo/aD/V3q2FcMc4u8czmc1RiKAXExAngpYXHnIw869hWg+L4PsVEwnTrjdZ
X-Received: by 2002:a25:38c1:: with SMTP id f184mr7080788yba.41.1607106530568;
        Fri, 04 Dec 2020 10:28:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607106530; cv=none;
        d=google.com; s=arc-20160816;
        b=h/I7epZ9FdknOYgW89zkte05MWsKqXzzwnNDTwrt0EfpoPWgqQeCitC50x4vAs3rUo
         1wCzeJyI33hMhEs873LF5vm9BPiZAOfEhd+ge/P6f2SsKxghXlITijdTHSsaxIbRdhFu
         4epVUfDriWCLV4op7Cup5BnLbRO6Sg1E8eBkQQ6FjSDqBuNO9bSt3OHeEcX7qlBSmU6e
         9D9CvKMm1lwH8JO1g3cfEvs4JHTM3dJLOTbHlb6ms7eVzB9bTce/RNM/XJ1RgGwzc7kr
         HKQGbB4RdSrtXD6MkGdWZj4JWpZHhRWKQLJCrbcB8L+Y7IJrQ0/B4AXOCXdIHV0nFfB2
         u7BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=OdcOvQcqju/gNXvXCedGRLNYk3Ps5dJiIDBrNHIoHNI=;
        b=vWyGx37aHqG+kLNSqhCujWtYUGR/UCUUg8l/BtjgKKqn8q5Whx/higv62mWsMZsp+8
         2vn0rrU9oZzym4NEnVI9jO7WEeAXcMJQKCQXiwTNxBz0i1BRkE/Ut89z0PhABj5k84hn
         I/iFYs9/925BHTYroMb0M3WdeGHbNB32KFYj+wmrmmGhh2YP5h683moPzj95tkDanPOc
         otE2lPpIgFN2Y40S0zbyJpYZOCiTeMH7s2ciE+H92/lROSyyP6xjUOxuTjhT/g2Nzd3A
         BLupbTuCzcu5HLwINbPI+2XOOEKxG9QldQXU/F/0Ls01J5/h1/x7hofAOMl+FOnoeCpq
         U1wQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=Yy0NtjOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o193si2226990ybc.10.2020.12.04.10.28.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 10:28:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=Yy0NtjOF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:34094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klFp3-0004iX-Uo
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 13:28:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klEU5-0005NC-JJ; Fri, 04 Dec 2020 12:03:07 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:45716 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klETe-00045M-7u; Fri, 04 Dec 2020 12:03:03 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id ED313413FE;
 Fri,  4 Dec 2020 16:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607100935;
 x=1608915336; bh=jIBSju480UcLf/h3gPPorKERNfUU2zkCa6PWtD0sIEE=; b=
 Yy0NtjOFyK2+4tjPzL03w3DuW3powIIZiF20vI+iy7YHuGywzHUWnLApOPRbwm7Q
 53RQUf/7x3g5oXsrKWkYyk5vLi0DybUAmOcYEqBnQjTaA5L7ZgkYHGNU18gHrIaT
 Rl1CkuH1ZAK68XI/TPcfKYL44OcS096S+CslEs6eLfs=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VR7wdhEitFRr; Fri,  4 Dec 2020 19:55:35 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id B7F5E41373;
 Fri,  4 Dec 2020 19:55:34 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 19:55:34 +0300
Date: Fri, 4 Dec 2020 19:55:57 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 00/11] hvf: Implement Apple Silicon Support
Message-ID: <20201204165557.GK86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-1-agraf@csgraf.de>
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
X-TUID: n0eZq01ceF8M

On Fri, Dec 04, 2020 at 12:48:46AM +0100, Alexander Graf wrote:
> Now that Apple Silicon is widely available, people are obviously excited
> to try and run virtualized workloads on them, such as Linux and Windows.
> 
> This patch set implements a fully functional version to get the ball
> going on that. With this applied, I can successfully run both Linux and
> Windows as guests. I am not aware of any limitations specific to
> Hypervisor.framework apart from:
> 
>   - Live migration / savevm
>   - gdbstub debugging (SP register)
> 
> 

Perhaps we need more eyes from ARM developers to review it.
Otherwise, it's a good christmas present for QEMU users.

Thanks,
Roman
