Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp788582njb;
        Fri, 28 Feb 2025 01:27:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXFRW06fDOCQjtAsCss9g75JUrj+9mTMEr3eria21tloGWHttBqsqWd5cIzk/6czrhyi0AkR+aR0e8L5w==@linaro.org
X-Google-Smtp-Source: AGHT+IFTVdH6CA/wItm2uVYUODBpNTMpdDsbFUnyewPf6euepzskU5BRildTYcoQTI6HIsxiNpWF
X-Received: by 2002:a05:6214:2aa5:b0:6e4:3cf1:561a with SMTP id 6a1803df08f44-6e8a0cb195fmr33673086d6.11.1740734839346;
        Fri, 28 Feb 2025 01:27:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740734839; cv=none;
        d=google.com; s=arc-20240605;
        b=Tm84sTlNRaFF2vWKqSd4oNOLfH585l5sOfiyMeA/WMw2Jml5zRWVhmXNBXBImebYBv
         M8/2q/4U/mRgFj78skjT3dEAWOEtNJbrMQXeS9ZV71I2DGpMNCUMe9tBb91jiKynJAX/
         iFm2FLmxX9y9bzYMDCExSduA/tWGF7LctW4VI9T5+LTcQKHym+Rj/CVdpRzrwbViiprP
         p3wJu9iOU03adCA5/HBD8ahv649KHTz3VZUlQ81NKIVvqALChVwz/aAlkgLs28vZOQ/u
         C926bc75r+g2A0bzqZzvLtoLqjc7V00bElQwsJvsM5CB4fUoiiiwk2bsFSGz7gb7rhgJ
         QSQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=2oPYF+r+fFsNu+d9Mf4q+xQ4fyDZ1y0vvkySRETt4x0=;
        fh=bP94an9DK4jgLeBJl7yHrV9jAfaxcB/GDtPuHgUsSso=;
        b=dbUcAKEbYeGhvx8iaBH8n705FFRW3opaTcUqmlNAHcCWy06mYwa2ZuYy2piNfmABW6
         wLj88TNQTwVfWO/UzYLYwWst/M/YfAn1sPquaQcyAOO/ElBrpukQ2tHTonNVgS6ggngl
         oMR35OMPT09wX2OLy7IZWSsk3dyc4PSOssk+12JaNwxCfxf6MSsaC7UulWU1MkAHXAVJ
         IzqjNmEwVEqNR+5AQX9BqvumXiXG7SmuCjxSIpcHufmRhEP4Mlaj50yVxIYc8ZLMxdDx
         pKZlLDFwlxzxOdc+fAd+kjH/Ym5gL9wentBaeVviCwQK8dw1RGmi0dr7onklDcFNqX5Y
         4sbw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976c06adsi28497156d6.171.2025.02.28.01.27.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 01:27:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnwdz-0008DE-1B; Fri, 28 Feb 2025 04:26:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwdu-0008CW-PH; Fri, 28 Feb 2025 04:26:50 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwds-00012b-0L; Fri, 28 Feb 2025 04:26:50 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z42p23K4sz6M4dp;
 Fri, 28 Feb 2025 17:23:54 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id D26EF140A34;
 Fri, 28 Feb 2025 17:26:43 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 28 Feb
 2025 10:26:40 +0100
Date: Fri, 28 Feb 2025 17:26:35 +0800
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, "Shannon
 Zhao" <shannon.zhaosl@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 05/19] acpi/ghes: prepare to change the way HEST
 offsets are calculated
Message-ID: <20250228172635.000027c4@huawei.com>
In-Reply-To: <ac3cc2002267e1ad848aea367ff0b08f2c4b5c69.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
 <ac3cc2002267e1ad848aea367ff0b08f2c4b5c69.1740671863.git.mchehab+huawei@kernel.org>
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
X-TUID: WWbNn5CEAirJ

On Thu, 27 Feb 2025 17:00:43 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Add a new ags flag to change the way HEST offsets are calculated.
> Currently, offsets needed to store ACPI HEST offsets and read ack
> are calculated based on a previous knowledge from the logic
> which creates the HEST table.
> 
> Such logic is not generic, not allowing to easily add more HEST
> entries nor replicates what OSPM does.
> 
> As the next patches will be adding a more generic logic, add a
> new use_hest_addr, set to false, in preparation for such changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
