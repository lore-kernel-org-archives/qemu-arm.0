Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp41902njk;
        Thu, 23 Jan 2025 01:57:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWAj9uA5hQhbjo1OUF52NfH3RPFA4qeGHeDbr/dm3sgum3qdEkkJTMgqKOtQzPFbxhIBDVN6nn6UE+d7Q==@linaro.org
X-Google-Smtp-Source: AGHT+IHKXrHdPzreUnP+sAU/etxxru2+VkyReF6ggk6Xst+4gZZ5GAdprON7StrywiIu6GO68hyt
X-Received: by 2002:a05:620a:3712:b0:7b6:d998:4fcd with SMTP id af79cd13be357-7be6323cc04mr4859108485a.25.1737626222625;
        Thu, 23 Jan 2025 01:57:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737626222; cv=none;
        d=google.com; s=arc-20240605;
        b=af8fM1bJ3EA5d7peuvShKvG2OKAhdKAFk8xqLbm+w7E2kYyHkXR35A8pV91h9GUSCL
         r/YU8MiHy/YCiSl2FYjpkuygt5dLSXmpB6Ttsp4H9CXkc6jdGCX98UWezzbEgX3dV7Ik
         FjiUibLK4rSxHzc55mTfEumn5LTu2DXv/rfWSAGQLXJlJvH2kJk3uZyJ9h6+HkGpgDqS
         FoGsbv4Om8ztYxpMp9Yxy3YZq+p4d0xxA1+pPIlwRtHnGUVV5fYmyyCLsl375GbZtqAi
         mzRfb+N1xNiVDz0rXT+/enAwAj0sTItuBKM3sG25Yq2ezE67NHV9uOK+JJfxytNZgdd/
         B6aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=vFxVOi9KSe8L1Ich/2E/B8vlEViglPgujoqHW71Mn3U=;
        fh=bP94an9DK4jgLeBJl7yHrV9jAfaxcB/GDtPuHgUsSso=;
        b=L58XmrMc57dVUjLOKB/VKhGpgQhqPCpqgNNUm4OfPgsP5Hit4dSXope71xpSDrfymw
         wA3puM4CCtX79uIhGDsV8s4Dt9TyG8QSiMXPjCl6x88fReGKx40O/NIvel2PTB9LB9nu
         MW1s1ypYDdMNXvOTI1Yn/8DFOQu4q65IJv5zPl5MnPKQNBlbor8V+4gLgb4WLXXwrLz9
         TLVN/dYYP0ozaiOrFQQ3sd9iuiH5Di6zdU0AGqFzz3mCvbQvd33CHXoqyX9HuYahZcAe
         +bSPUaWRZ6X/WoUK2BXBoQAEq//+1f10SWKmZw2LJiXSOkzFloqw3Fypf4fD3IRTlTIl
         vWiA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be614c03c5si1687172385a.262.2025.01.23.01.57.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2025 01:57:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tatxJ-0006IR-QW; Thu, 23 Jan 2025 04:56:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tatxI-0006IE-Fp; Thu, 23 Jan 2025 04:56:56 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tatxH-0003qw-1o; Thu, 23 Jan 2025 04:56:56 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YdxDJ1WVxz6K9N4;
 Thu, 23 Jan 2025 17:56:32 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 8E128140A70;
 Thu, 23 Jan 2025 17:56:50 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 23 Jan
 2025 10:56:50 +0100
Date: Thu, 23 Jan 2025 09:56:48 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
 <gengdongjiu1@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, "Shannon
 Zhao" <shannon.zhaosl@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 01/11] acpi/ghes: Prepare to support multiple sources on
 ghes
Message-ID: <20250123095648.000063a5@huawei.com>
In-Reply-To: <781c65c9188c4649821885a62b6f6370ff7874d2.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
 <781c65c9188c4649821885a62b6f6370ff7874d2.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.043, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
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
X-TUID: cLspS4p80Iq2

On Wed, 22 Jan 2025 16:46:18 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The current code is actually dependent on having just one error
> structure with a single source.
> 
> As the number of sources should be arch-dependent, as it will depend on
> what kind of synchronous/assynchronous notifications will exist, change

asynchronous.

> the logic to dynamically build the table.
> 
> Yet, for a proper support, we need to get the number of sources by
> reading the number from the HEST table. However, bios currently doesn't
> store a pointer to it.
> 
> For now just change the logic at table build time, while enforcing that
> it will behave like before with a single source ID.
> 
> A future patch will add a HEST table bios pointer and change the logic
> at acpi_ghes_record_errors() to dynamically use the new size.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

