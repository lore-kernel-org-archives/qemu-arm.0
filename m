Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp699133lfb;
        Fri, 4 Dec 2020 06:51:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygpqrit2Ujqrqnp6jExSPz7hE9T3dERYGFx2l8ocpqO2m5gkcoIsc4PrjfhfDk8Qisesm5
X-Received: by 2002:a25:6dd5:: with SMTP id i204mr6535095ybc.267.1607093472184;
        Fri, 04 Dec 2020 06:51:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607093472; cv=none;
        d=google.com; s=arc-20160816;
        b=LyPJoj+Y7deQ8wF1couYxsge6Q7Bn0Vx7I2r82xGMGo/PanxOfwv+6ouBdGgvEMC49
         bWKZf8vJvvsd91DucQErJuixlcaD+2YFITxK5JNIo7SvctTi3ggAc5vn+Z4jMu3FsoPA
         mBnlVABlqXz3OzCGoxMGRy22vkMnbrCjiB1NdrYHPTbfrsUyFLjQML69+LjAFV5nEEIF
         AG7DpcTzbykQ0h3y7e26ST2Vd2w6MCxaVwAGAVGkV3N3iBYRI2ap97wAsiEQSo2ycTrr
         eCTUiImAxBfptD701Ly0kiAv2u9EO8JCuMgvBBhEtLCBlINK5pMQIC8BCdrqqz6PgKhC
         hoZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=E8+90RQFfYii8+Yy+msELRq/ZT/Wg/CFhErpICp8IE0=;
        b=C5snYyMBM4VlnxCZAQgJfBAqWMU6wcnDGgguuz8tM3NHG+eGzPD3Srcv2jJFu2wGZU
         TwjCOwZIKvQqNRWGLEqN5cJFS1tzKxpdPfbxZfW67nu/7f4gc4sR4iSacbSPiQTVp1fM
         Om+3ulV4OyeuSvyfs8WL3altrSYG2f97d2ZZ8IlRVkqWdZ2Mytg0eQ4KedYro6lw0hAQ
         LC1VYWK6FwwGHjFic0jXxdY+nQlII+gUGjEyLGFBKrYyaxNCzrPU6lF3XmDoVpwdDjEo
         9W/4L260c08vtCzrNEkTaxaA+U5IvSy+fZfpwAzcRffcLgd87l4Lk9lUbHlgMHUV9ShP
         UFcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=NXGn9w7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x39si2009122ybd.456.2020.12.04.06.51.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 06:51:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=NXGn9w7n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:50600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klCQR-00073P-JG
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 09:51:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klCQI-00071l-6c; Fri, 04 Dec 2020 09:51:02 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:40228 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klCQG-0004jj-3w; Fri, 04 Dec 2020 09:51:01 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id C5D594138D;
 Fri,  4 Dec 2020 14:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607093456;
 x=1608907857; bh=NUTBOoab5b7l2/UYHZzuYZCRGIpYd3V/74ehzFMbufU=; b=
 NXGn9w7nf1IhVFm9/7unPI1SWH8Qu0dBV8DeABDTNOcgXVqQmFW5YH6moYN9Zh25
 03r/6hG4BlnO3YkFwFJ+Zvhh3CWZIRmuIIEZjjBFiZenmTOZ63rXFeaxgvOUjCzC
 VRcrBQcKppEXCECHDqhgTz2bdK5qQu8kvjPuVyQPUdA=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpLddXC48tRS; Fri,  4 Dec 2020 17:50:56 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id CFA0D41370;
 Fri,  4 Dec 2020 17:50:56 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 17:50:56 +0300
Date: Fri, 4 Dec 2020 17:51:19 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 02/11] hvf: x86: Remove unused definitions
Message-ID: <20201204145119.GB86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-3-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-3-agraf@csgraf.de>
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
X-TUID: zPODl2D6ZcVh

On Fri, Dec 04, 2020 at 12:48:48AM +0100, Alexander Graf wrote:
> The hvf i386 has a few struct and cpp definitions that are never
> used. Remove them.
> 

Reviewed-by: Roman Bolshakov <r.bolshakov@yadro.com>
Tested-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman
