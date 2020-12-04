Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp936325lfb;
        Fri, 4 Dec 2020 11:36:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx3bJa8rpR2QazGmkMPSeV3b/nq2pz1krwBnUcaS7oLp14FabObmFlgBzh+BCrG0xIYXc+n
X-Received: by 2002:a25:2646:: with SMTP id m67mr8090069ybm.392.1607110592503;
        Fri, 04 Dec 2020 11:36:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607110592; cv=none;
        d=google.com; s=arc-20160816;
        b=XHLr0uB2a5jhtwiRQ9IxbkVbnpY/3OiP+vAq/0k608/tndKXMpO3T8J8CbNgyHGDjx
         IONZu1FG+a3bQ9RAEp446SpSgnCiSS1gb5Rt1Odb0NOSeA7PvuG+6xBbgC1QUpLjxzac
         1O8o1XfydOrqqehyrrareOkRIkO39rbrUIH25rXmyDMzGx8w81DHWZzQEvlE2wkM5Duz
         9ZdLIJypXepUKGB+RHqypOfLafztO17c7PjwxiJBH8p7Lcu4i5yb9b5U2dTCBNSJ/WMY
         /S1kO0Mj5LNVXGKS+TG/UroeTC5Jfm0v99ey4MOKkBqGLtV+WX/hrq1RO8FBl+w6TATK
         PWUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=a9114har9Ig1XG6QAtYgQu/yvW92bN8K/VYQfnqpvb4=;
        b=qfVe05Vvmep+iRKTE1bXRN481UiwwoureSEEfx5L5bJ0GA3lxXZOK0hfBqmPzgP17P
         ndfVt+xJXiLjMiTKDltPXP9AsPLSSl3JNA7ygwHCDPp8au483570koVqC03fMngpqseG
         AH8uy+ITifrPKnUz5XjpPDBatkcZbAdvxf/FQMJ/sOiVPZb3yYVNww26XpUZZxg12Gxm
         nJJyMTu70Xdt4I9lcTYIc5CEwtaiq3M2ncfpc04rCrJqOE6AQQ0ylEgh1/uJqq72J+xl
         NG7guB5EChiZdNA5UdfitZouwZxeAajyepnnlBtMn/OvfhTq2xKlAXDIqOmgUWfKrM5s
         VavQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=vvfYmjeF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o190si2140285yba.455.2020.12.04.11.36.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 11:36:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=vvfYmjeF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:50544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klGsZ-0003Hn-T7
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 14:36:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klEcD-0007ND-Up; Fri, 04 Dec 2020 12:11:34 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:45944 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klEbJ-0006Ax-12; Fri, 04 Dec 2020 12:11:17 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 96D06404AD;
 Fri,  4 Dec 2020 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607100453;
 x=1608914854; bh=psRQv4ZkNR7JiaP5tTZh80gdAnVKprbL5I8VmOtT+Ws=; b=
 vvfYmjeFBtmuRwuRyrJE/y20SCcUsloXBI0Dhvh3tWPZaTK8JH4pz1uu1Wb5in4d
 mNpw82qVZ7rl7pQsIWONyOC5g4hRhdx4QsM9RHdrbp2+Obp6Pa9roYfUJT1lxEZ7
 ktf6FGMT4h91Vx9GJwRmxrypMCpq4UMSwoCgxAAZSj8=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UnmOkgqDweGZ; Fri,  4 Dec 2020 19:47:33 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 95429413F9;
 Fri,  4 Dec 2020 19:47:33 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 19:47:33 +0300
Date: Fri, 4 Dec 2020 19:47:56 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 11/11] hvf: arm: Implement -cpu host
Message-ID: <20201204164756.GJ86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-12-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-12-agraf@csgraf.de>
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
X-TUID: UVKzPG9AJM/n

On Fri, Dec 04, 2020 at 12:48:57AM +0100, Alexander Graf wrote:
> Now that we have working system register sync, we push more target CPU
> properties into the virtual machine. That might be useful in some
> situations, but is not the typical case that users want.
> 
> So let's add a -cpu host option that allows them to explicitly pass all
> CPU capabilities of their host CPU into the guest.
> 

Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman
