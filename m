Received: by 2002:a17:505:5b18:b0:1be9:327d:8ee3 with SMTP id ox24csp354863njb;
        Wed, 25 Sep 2024 07:14:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXEBTjhsGOQFlGyj9iTofpCA0z61jP8wWSbDyUojwGe1CvyaSavg8jrfk7LDiH0kEiny5o3dSiyY6yeNA==@linaro.org
X-Google-Smtp-Source: AGHT+IGef5mPz12qv++eClF/YQZkGOUyxnwBM0ZVpMwb8mcWt2FCtsETbDPCPWyYVfVZhVF8jnm7
X-Received: by 2002:a05:6808:2f0b:b0:3e2:6cc1:de31 with SMTP id 5614622812f47-3e29b663122mr1949067b6e.2.1727273647306;
        Wed, 25 Sep 2024 07:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727273647; cv=none;
        d=google.com; s=arc-20240605;
        b=SSq8P4dmnXaAEfiS0Zl5Z2GUkC0FGGwFdoa4NO8IZ1Z5q6CoiMmbaV8LoTyGmoWuLN
         g8CP1ycDwtw6WG78Pvpmjdo5zdspb+PLoOiHM6xtddbwp96Fx3AR3NJQB9XAHVCQSSD5
         BPpECUOXag7a4QSOk7I/tc+ulwGGokHEVjhy9Yn5fMvrlMWiJmFr4kNxGhBQVMMgnpOu
         DVwW6ZY9Gc0bfkaZ45oZ1/82BXNcKVf0rBH4gd8k79Dy0Z4zvqm8e8Moeb07gc4KP1n+
         mXKrzTSWSLy/5kEKTQgmD1bg0XCu5I0e2dBi02bSy85IWAnPU1gqVLSoD4bRDjiPkv1n
         QUfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=cK5JlxTkHrjVjGod9xx3D4N2Njs4ZwRcmV3FoKnYqEo=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=DvuwdvBx8aCL5ThAuylayQVLvLtC8ZYQL4c7XE0YmusryH0TGq9vVLi1Kxwk/nu57I
         SI5LC8mMNdW0K9DbNULDvK/flWfi78oX1AyI5i01qlnhImygtoIYOswu5dupPVJXdWtV
         oxxhgouQ94A34jNDgQB5si0EKk0LfOuKUCzXvXQKY+72xxHFqp5d6xoPru+xVj+C1PUy
         a2XPC+vdJnvPDEnYz7SCKBvIcQgFtUay2Y5znolwwQ1KBjqbfDKb872ovobXvHj3zSIL
         K7LRHk+w56Mq6pjWnnoWhbyh1nWBLn4fwXru+NwYMC7EfOi+0qAkikF55LlZ5TUS3wtQ
         PhDA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-84e73e53d42si956789241.176.2024.09.25.07.14.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2024 07:14:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1stSlr-0004Pz-6e; Wed, 25 Sep 2024 10:13:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSlp-0004Mu-KV; Wed, 25 Sep 2024 10:13:33 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1stSlo-0001Ed-0x; Wed, 25 Sep 2024 10:13:33 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XDJWZ6Snkz6LCdm;
 Wed, 25 Sep 2024 22:09:30 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id D6AB9140FA6;
 Wed, 25 Sep 2024 22:13:28 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 25 Sep
 2024 16:13:28 +0200
Date: Wed, 25 Sep 2024 15:13:27 +0100
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH 04/15] acpi/ghes: better handle source_id and notification
Message-ID: <20240925151327.0000202b@Huawei.com>
In-Reply-To: <a3b54a74158fdff44e600cf0949a430891c8cb22.1727236561.git.mchehab+huawei@kernel.org>
References: <cover.1727236561.git.mchehab+huawei@kernel.org>
 <a3b54a74158fdff44e600cf0949a430891c8cb22.1727236561.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.828,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: oHpv+dv0R3h3

On Wed, 25 Sep 2024 06:04:09 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> GHES has two fields that are stored on HEST error source
> blocks:
> 
> - notification type, which is a number defined at the ACPI spec
>   containing several arch-specific synchronous and assynchronous
>   types;
> - source id, which is a HW/FW defined number, used to distinguish
>   between different implemented hardware report mechanisms.
> 
> Cleanup the logic to fill those, as they should be handled
> independently.
> 
> This is a preparation for a future patch that will shift
> those fields to the HEST init function call.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Trivial comment inline.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> 
> ---
> 
> Chenges from v10:
Changes

> 
> - Some changes got moved to the previous patch.
> 
> Changes from v8:
> - Non-rename/cleanup changes merged altogether;
> - source ID is now more generic, defined per guest target.
>   That should make easier to add support for 86.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c | 23 +++++++++--------------
>  1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 7b42ed59cd15..7460cd1a8d56 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -284,9 +284,13 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker)
>  }
>  
>  /* Build Generic Hardware Error Source version 2 (GHESv2) */
> -static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
> +static void build_ghes_v2(GArray *table_data,
> +                          BIOSLinker *linker,
> +                          enum AcpiGhesNotifyType notify,
> +                          uint16_t source_id)
>  {
>      uint64_t address_offset;
> +
Technically a stray change but meh there should have always been a blank
line here.

>      /*
>       * Type:
>       * Generic Hardware Error Source version 2(GHESv2 - Type 10)
> @@ -316,18 +320,8 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)

