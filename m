Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp785686njb;
        Fri, 28 Feb 2025 01:19:57 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWeuptCqN+wflPUaTtZz7MjMbaTk/4RR/I5qYKGQ8hdVsTygicS/J4f9QcgTbJ8IgcxWSn3CNad8QNYhQ==@linaro.org
X-Google-Smtp-Source: AGHT+IH13afu+6a+Xbk/5HS2bNmxjUAUSRd21X65duSfkoKLbcAOnp6sV4OG84dBlu6zcTK+JmCp
X-Received: by 2002:a05:6214:20aa:b0:6e8:916b:8c49 with SMTP id 6a1803df08f44-6e8a0d70112mr48475596d6.31.1740734397458;
        Fri, 28 Feb 2025 01:19:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740734397; cv=none;
        d=google.com; s=arc-20240605;
        b=lHxYngjJ/Jqot+I5y3WhYkO332vjZaTol6hNXsCn/yMGcdRMSiWulsUWaoR0l3TbMu
         PZjXEZ1jAsFmmc+9ZXqFlrwln+GaiYVVgHATCHOYW0hC+Hc+yAhyV7Jd62KqzhdZW7fw
         PVfq6+HAOXe7YgT1hf1xogUWMnuXgEo1sSv7ZOVNMZ1aoGeZHrCcVZZoAGiln+rt8v8W
         Rp/XZkf3Xgzry09UZH+yVWRxdhixcvh+P4WqQ+TJiIcSa9nTwG2OL8sq/RtaCVE9DlUx
         tzCW+aa+KUugBvLQIVdZtZHGlWbLi4siwa+tfkwgeqXlK8r3AKXDfBCCaiclp7IVOEdm
         5A9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=8XBcFXevCO/ogbZirnc2A4+NccYIlwIk8d9Ngmw/8JI=;
        fh=GElvAtW5krGxQdrJKAP/tnSiBEfXCwHwTSAoO/mYfiU=;
        b=elR2F5GWs16ffyGlLyrzOMgIb2YJhuILErUqa0E2FXD3aJpjw61VpCCRK+wILP1qBo
         k18uupsxX9R9RryujSXJi/nZ4vLONwCmzYfFGBb4GddINjapN2MhNijtRKZEyJ0xIUaj
         xTHKG9ocwWBVxBc8wII6QpX4C0gziIwpFMI+6Owye7ivmAq3PIu5RqZ76HFFGz5YwN/v
         8BnC8aLrZB7LqZaBgKLvUJu7FiXnZU7Ynz22XmRq9cjJZC64cBOV+z+s6WmTmdX6qBOj
         i07t5oZdMO/zTPGal3r7iv4eprWAriEAov+/499fJa+cCi8F+5FE63ilvlhIq36YeN++
         jYaA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976c0925si29256806d6.232.2025.02.28.01.19.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 01:19:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnwWu-0002pv-N9; Fri, 28 Feb 2025 04:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwWt-0002ml-IM; Fri, 28 Feb 2025 04:19:35 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwWs-0008OZ-1r; Fri, 28 Feb 2025 04:19:35 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z42ff3zTmz6K9Sq;
 Fri, 28 Feb 2025 17:17:30 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 6F3ED140CF4;
 Fri, 28 Feb 2025 17:19:31 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 28 Feb
 2025 10:19:17 +0100
Date: Fri, 28 Feb 2025 17:19:13 +0800
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <kvm@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 04/19] acpi/ghes: Cleanup the code which gets ghes
 ged state
Message-ID: <20250228171913.00003442@huawei.com>
In-Reply-To: <cd48953a4568b401c689078898a729c3d5cb10c2.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
 <cd48953a4568b401c689078898a729c3d5cb10c2.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: euoq+Nn9V3ki

On Thu, 27 Feb 2025 17:00:42 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Move the check logic into a common function and simplify the
> code which checks if GHES is enabled and was properly setup.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by:  Igor Mammedov <imammedo@redhat.com>
This is the only place Igor's tag seems to have a bonus space..
Probably worth tidying up if you are doing a v7

Jonathan
