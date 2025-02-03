Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2019287njb;
        Mon, 3 Feb 2025 02:53:52 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVbG0fcqqXSo/5A8gQxvZKuTCbEXd2wYK7AseeNPIdTgwkGnJi1+qQ4qXTIpBQi4oIWPlHD1MnfRgUFZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF5AxlkQct6YLxDUx3wXeNDN1LWt231h73a0K2jcdzcboAYUZGqoDq7KCk0NJAqA/ZqnoEA
X-Received: by 2002:a05:6214:1c4c:b0:6d4:22d4:f5b0 with SMTP id 6a1803df08f44-6e243c678b8mr305745386d6.33.1738580032368;
        Mon, 03 Feb 2025 02:53:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738580032; cv=none;
        d=google.com; s=arc-20240605;
        b=SUZkePwyHlxB3xngxein/blkB1klcyCeWuLw19ZcGtnncqDRMMbFCrHuK9AotrWFLF
         T0jo3tN59Q9vanu+0pIBgIKsLHUu8/5+vzmxVmgqScs3SuRDQpsWuZOknq8t9mN1lEXx
         wq6H3Fj+3JL1xFmWMsjBJP0MSPC3X+Z3GugepaF7a5Wt4+03pkEsIMjWirWaH0qsy5mr
         AWxPA2Q2LWmMjoXHtujv0CNnBHTODW3JDcUuMVR/qTSzTzz/iyC/OaWeQywZey5Rb6OF
         kA9ifwaagzd1315CeEatNG5rjAv+xTEjwI+WuePhSsHfzVNcJoNV95A1dUqIswtz9pg3
         0/3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=CWKwx0X5Bg1LqBJDXJHxBqc38Cb7t5iKZ1DHNAwUcTQ=;
        fh=t/xybFWV2B884dK2bO1HGz5LnOWlFKzKgenI2zgFzYc=;
        b=HGj0uxOn/15ufbgoOF273oTZU5lItqY09zEU9QFNrh4oce8OGWNRtxFtyYc5Ph6wdK
         QdOSecZ9ijruR2xyDmuLxvAO/A3Yrklo2g3jsE4VhyqpU6DbTB+IEGT6wiBdUU8SfEKp
         khG4ctoEc4u96XPGitwo3SKCzSZOVDj30P1Vne/1nXDL1FwnVR1z8va6QwGALeal0NXN
         wkZeXsF9BeZvQER32Y9MkSxefXj85zRA/KQNCcBEpZFYuYbKqEJUm9DjYYQYcffgb5lH
         zso3YEvQyBDvH/dgOKVUf6PYpwciemCc/Q4WDbcML75J+CLgSXrMX+LDs7EjKJ3Rv4J6
         qC+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e25481357fsi91883586d6.97.2025.02.03.02.53.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2025 02:53:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1teu5E-0002rs-IY; Mon, 03 Feb 2025 05:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1teu5C-0002r5-4r; Mon, 03 Feb 2025 05:53:38 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1teu59-0001oP-3u; Mon, 03 Feb 2025 05:53:37 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ymjy24lQrz67CtD;
 Mon,  3 Feb 2025 18:52:42 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 30758140155;
 Mon,  3 Feb 2025 18:53:32 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 11:53:31 +0100
Date: Mon, 3 Feb 2025 10:53:30 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 12/14] tests/acpi: virt: add a HEST table to aarch64
 virt and update DSDT
Message-ID: <20250203105330.00002c99@huawei.com>
In-Reply-To: <343a2a84c1cf4a3998d40a188658bd42bc689602.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
 <343a2a84c1cf4a3998d40a188658bd42bc689602.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.01, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: Ndmd1IjU6AKT

On Fri, 31 Jan 2025 18:42:53 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> --- a/DSDT.dsl        2025-01-28 09:38:15.155347858 +0100
> +++ b/DSDT.dsl        2025-01-28 09:39:01.684836954 +0100
> @@ -9,9 +9,9 @@
>   *
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x00001516 (5398)
> + *     Length           0x00001542 (5442)
>   *     Revision         0x02
> - *     Checksum         0x0F
> + *     Checksum         0xE9
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPC    "
>   *     OEM Revision     0x00000001 (1)
> @@ -1931,6 +1931,11 @@
>                  {
>                      Notify (PWRB, 0x80) // Status Change
>                  }
> +
> +                If (((Local0 & 0x10) == 0x10))
> +                {
> +                    Notify (GEDD, 0x80) // Status Change
> +                }
>              }
>          }
> 
> @@ -1939,6 +1944,12 @@
>              Name (_HID, "PNP0C0C" /* Power Button Device */)  // _HID: Hardware ID
>              Name (_UID, Zero)  // _UID: Unique ID
>          }
> +
> +        Device (GEDD)
> +        {
> +            Name (_HID, "PNP0C33" /* Error Device */)  // _HID: Hardware ID
> +            Name (_UID, Zero)  // _UID: Unique ID
> +        }
>      }
>  }
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Diff looks good.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
