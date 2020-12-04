Received: by 2002:a05:6214:1808:0:0:0:0 with SMTP id o8csp2462102qvw;
        Fri, 4 Dec 2020 10:53:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw4BAUrmYOdvZriTS4nMAzcKWRYBxnlVVRnubUWtlELRLz8hiQtLurvyWqJTVekelsXzyhk
X-Received: by 2002:a25:d251:: with SMTP id j78mr8511103ybg.193.1607107995039;
        Fri, 04 Dec 2020 10:53:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607107995; cv=none;
        d=google.com; s=arc-20160816;
        b=iTcZGzy0aPG/sFh1p9M9hCelxvfnEOnLr6tX6t+vq5+TsSb4BjDS6gsarvxV3+UhcW
         rntoWDN5jEO9hCJi2Onc1zMdvsAcgQx/vrHij3kv667N1m9i5QkY/nuX9FyH01JBAcK1
         5iDhY0CDpv18UtS3IHYyO0uwIeKPhTPExNqzR9m6kpKI3UR84k0bkTfkbE9w8BlNy0vQ
         31iLbd2GBce5PLbPhEYtVyZLNbT53lNgqfbt9hoWHfh7JuBTu5CmpR4AlR7lmJVorOhb
         vWueHUFkh/RxqWS/jS/H8QIx8by+fUD17moaYhD8jm2YKShlGbqHbmPAEWVKy3eQN46H
         mDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=Kc1j7uIfCjI8k1RpXfJrwr9IA3ygp/jM4l9xATkDOjQ=;
        b=S+PJ0q2rydTqaWwzXVBrxI48uv6x6usdCzmZ11F7FLPr6hwIbydcfh1IiL0bK7o832
         rofKhadNeEr0ydsJHfinIKYVkiI8aSQb6iYmxt3IfErzD8YTRtK4vYQ5pPbyxrGP1g8Z
         8W5RQBM88DKw/aEj2Z0zqfwa3HhzYu7oNeaIdKlPBiDNRXIvaPX0qg38thQ8e/qtlji+
         QROR6RLcTsC+3cvpMeVTf72M9U2E04qGZu99nfF50Y8MiXJn+9MhYYkl0HGMYw8X/wG5
         SXZxtdHusNU+/Xf2J+Gnxov6sHXSwVoirI5xpDGudE6PmlVZNld23W06On5Shc7rDVeC
         FExQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=dkqmFsOK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si1440604ybe.279.2020.12.04.10.53.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Dec 2020 10:53:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@yadro.com header.s=mta-01 header.b=dkqmFsOK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=yadro.com
Received: from localhost ([::1]:57338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1klGCg-0007dA-HJ
	for alex.bennee@linaro.org; Fri, 04 Dec 2020 13:53:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59340)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klEU5-0005NE-S2; Fri, 04 Dec 2020 12:03:12 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:45704 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1klETg-00045I-FX; Fri, 04 Dec 2020 12:03:05 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id D64CF413F1;
 Fri,  4 Dec 2020 16:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1607100388;
 x=1608914789; bh=zKu5Ba3IL47IjwL6BwgNxIBKcfTTREa02dE1m39rMA0=; b=
 dkqmFsOKv2y51DzVAejbWNznbJ0vGuBHcOrSrqegFFbl9jPbQIBOwL/J3gUmy8Ut
 acvGb3X3fwNzDG4hQqfLumlAUC8Y1yfWBVreR952P6g5eb8P8SqAkF5tPOs/aNfy
 u9PM3lUFLUrkMbyeIOxiXd9O6Vpg6ypgasOEZ7cQOM4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JG3YqyEU2ZFx; Fri,  4 Dec 2020 19:46:28 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 4652A413FF;
 Fri,  4 Dec 2020 19:46:28 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Fri, 4 Dec
 2020 19:46:28 +0300
Date: Fri, 4 Dec 2020 19:46:51 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Alexander Graf <agraf@csgraf.de>
Subject: Re: [PATCH v4 10/11] hvf: arm: Add support for GICv3
Message-ID: <20201204164651.GI86904@SPB-NB-133.local>
References: <20201203234857.21051-1-agraf@csgraf.de>
 <20201203234857.21051-11-agraf@csgraf.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201203234857.21051-11-agraf@csgraf.de>
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
X-TUID: EJErmLLD50z4

On Fri, Dec 04, 2020 at 12:48:56AM +0100, Alexander Graf wrote:
> We currently only support GICv2 emulation. To also support GICv3, we will
> need to pass a few system registers into their respective handler functions.
> 
> This patch adds handling for all of the required system registers, so that
> we can run with more than 8 vCPUs.
> 

Acked-by: Roman Bolshakov <r.bolshakov@yadro.com>

Thanks,
Roman
