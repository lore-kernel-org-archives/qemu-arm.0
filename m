Received: by 2002:a17:505:c89:b0:1be9:327d:8ee3 with SMTP id hp9csp1941062njb;
        Mon, 7 Oct 2024 06:33:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOdepsFFjLD5v05WzSY8+xtuerjasXUdqIX80MsI8PV9kGh/Mxtf3kE9eiJZQgTyIh4orX2EI71koo6w==@linaro.org
X-Google-Smtp-Source: AGHT+IG8RYsIJ57hYld9N4aE7nj9R9yNqxEZCITBbC2AJ40+kAiz1sTYVGyI96lM6pzQDoJEHbyg
X-Received: by 2002:a05:6122:904:b0:507:9165:20e with SMTP id 71dfb90a1353d-50c85e631bdmr6151566e0c.0.1728307982273;
        Mon, 07 Oct 2024 06:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728307982; cv=none;
        d=google.com; s=arc-20240605;
        b=T79mXCtiyQxh35vCd7l5Yi8zT7MkW7TTdfWVnnryTifgjWRxAb2o9yFVpwP7BdPsiH
         7uLvB0tFwBLtP32qvRvVJPoGIu7IXMbmIscBsKcrdg8FMGnfsEsEO9YlLBkgF/krml/M
         BZOPKnvkXiV9d7Vz5H6f1l+Z8UZ7WQiI5awZy4vFJGLu/jFEjYfokLU4S42Z80eVAtFj
         oVwotYdCQqh7PNs4/+AsKoSMFcvwwP+SKswhP2338j3lRuJO3EmqtfRvJ2DgRqrq604z
         Jac5WUhP1fLpQa6K3CzgOLechWEFGhZU9UrHfgWXrdDldNFn/ik7RFpvmnGroCGPL8Zo
         mxgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=cFFf8CKcwYhnJ7SdLlxptlTyPvE7fzsa30udxbxBdTM=;
        fh=Pa8FH0stjZYjky2UT0CTsafYYFYJuOhlFYeLbGNWfX8=;
        b=QY9c7ugI+hbZkv1SPuy6eCditpalt73v2ZOgsK722DHE2lWQJvcRooxwbiWzKhQo7D
         //S3g8nEVQs/lZD5+7xU1SuTPDL9ptrB5uWglwV/QUTXIpvskdrurZjDaqE7NYkG6lkr
         ywCdBHlxYJxbjqvTUuamKvsDfSOW1g+2qYYgGYlNYK3PImKNAc4HziSNrxu3j/HYiQZM
         2q7JTvPSZdcYqxMnloBIB9z1hEd9V8cR1g+R/aNCDk8p1YQtuCVp3RxGJYOHe0RXcvTg
         lYz42Y2VCT+eUyRCU8E6+XyfoQ8zaVpwu7/HEi3+UHQ4ban1Gqyw3Q5d7EYvsz2yHqw7
         JA5Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BqcrfzeU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-50c9ad70542si806993e0c.75.2024.10.07.06.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Oct 2024 06:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BqcrfzeU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sxnqv-00041W-Qx; Mon, 07 Oct 2024 09:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sxnqt-00041G-Px
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 09:32:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sxnqs-0003bc-A4
 for qemu-arm@nongnu.org; Mon, 07 Oct 2024 09:32:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728307961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cFFf8CKcwYhnJ7SdLlxptlTyPvE7fzsa30udxbxBdTM=;
 b=BqcrfzeUkH+9jc0/6BY2cQu9TvH+DZPegXFNMG8syBEw5wnyBDEZDA7LuG0t2Ghq7C4QIF
 GsML0jl0ui2v/mKJ1WFmcVXGXhGUMEAPE4G4iXZMY4ZlpDapv+58lJKfDvY8BQcoyXAGMF
 lDYQ8ou3NMtuJVGMUPI0GuevJBGa8z4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-344-oSaxrQXLON-YCVjt-24ZZg-1; Mon, 07 Oct 2024 09:32:40 -0400
X-MC-Unique: oSaxrQXLON-YCVjt-24ZZg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42f310f0ed2so50356315e9.1
 for <qemu-arm@nongnu.org>; Mon, 07 Oct 2024 06:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728307959; x=1728912759;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFFf8CKcwYhnJ7SdLlxptlTyPvE7fzsa30udxbxBdTM=;
 b=qQU15NFkiRV6aj6oHj66/dMQf4mSZoV7YzhgVTi3B4MQvVaN89UEMDuRdijaytTKVr
 pbyEYFCXOjiw/xa0bVJPQMJX3hF/zIQFEBESHODlZpIRgJd+H7HMiXJIrmhEMP1bUNUJ
 vHwitbsXNHx7SXCRAe2C5ydqGpjumKxtzZcqBjIFCKybE7f1dRwQCpozXBd4phdEkDBe
 XRR6GVkOoJcGakMa8FwXUNA2NEzsPVz/OfLsUAxe2HSbuQajFXY9oew1IM6rBZeSFBf9
 OLEqrpwDuTjmCdwmcobUYfuODxU3JYxlsn+zs0D/kcGe/FzruPqXciLVbnn/PiUTCm3F
 yM0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYX/UpKybmozfg5kaL/H2tShtrxkOIb7N7edZgejfEh+tnTpPhzcTsXRyK4wrR5JxoreekcY3s2A==@nongnu.org
X-Gm-Message-State: AOJu0YyonE47D6U90qPx7ZF9ntRAwEKY0NFgo7QUcHsb6qd3JW+CDiPO
 ig8ugqRwSm6u7GYUQt4/SmybmozwrioURtXAmHFl/sL+isuQt6jl0o3Dr/9G3UwLYOl+VkRGBqn
 iWId4TRtIA+WvJ3qKe6fsS6kZNMVgzf/jlgBkeHvqE1w+5F/PBQ==
X-Received: by 2002:a5d:5f54:0:b0:37c:cfdc:19ba with SMTP id
 ffacd0b85a97d-37d0e751784mr12994633f8f.28.1728307958990; 
 Mon, 07 Oct 2024 06:32:38 -0700 (PDT)
X-Received: by 2002:a5d:5f54:0:b0:37c:cfdc:19ba with SMTP id
 ffacd0b85a97d-37d0e751784mr12994593f8f.28.1728307958487; 
 Mon, 07 Oct 2024 06:32:38 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d1695eee7sm5749727f8f.82.2024.10.07.06.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 06:32:37 -0700 (PDT)
Date: Mon, 7 Oct 2024 15:32:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Annie Li <annie.li@oracle.com>
Cc: miguel.luis@oracle.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 dave@treblig.org, mst@redhat.com, anisinha@redhat.com,
 shannon.zhaosl@gmail.com, peter.maydell@linaro.org, eduardo@habkost.net,
 marcel.apfelbaum@gmail.com, philmd@linaro.org, wangyanan55@huawei.com,
 zhao1.liu@intel.com, pbonzini@redhat.com, richard.henderson@linaro.org,
 eblake@redhat.com, armbru@redhat.com
Subject: Re: [RFC V2 PATCH 04/11] acpi: Support Control Method sleep button
 for x86
Message-ID: <20241007153236.2b4d3ad6@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240927183906.1248-5-annie.li@oracle.com>
References: <20240927183906.1248-1-annie.li@oracle.com>
 <20240927183906.1248-5-annie.li@oracle.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.153,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: tOaoMfjl/ROl

On Fri, 27 Sep 2024 14:38:59 -0400
Annie Li <annie.li@oracle.com> wrote:

> Adding Control Method Sleep button and its GPE event handler for
> x86.
> 
> Signed-off-by: Annie Li <annie.li@oracle.com>
> ---
>  hw/i386/acpi-build.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 5d4bd2b710..ee62333a03 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -40,6 +40,7 @@
>  #include "hw/acpi/acpi_aml_interface.h"
>  #include "hw/input/i8042.h"
>  #include "hw/acpi/memory_hotplug.h"
> +#include "hw/acpi/control_method_device.h"
>  #include "sysemu/tpm.h"
>  #include "hw/acpi/tpm.h"
>  #include "hw/acpi/vmgenid.h"
> @@ -1527,6 +1528,14 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>      }
>      aml_append(dsdt, scope);
>  
> +    sb_scope = aml_scope("_SB");
> +    acpi_dsdt_add_sleep_button(sb_scope);
> +    aml_append(dsdt, sb_scope);
> +
> +    scope =  aml_scope("\\_GPE");

> +    acpi_dsdt_add_sleep_gpe_event_handler(scope);
instead of having 1-off function, it would be better to inline impl,
here, like we do elsewhere with _Exx methods.

Also given that, series doesn't support wake,
you don't need to copy example from spec related to operation region,
as dedicated GPE event by itself tells us that sleep was requested.

so all you need to do is sending Notify to sleep button device.


> +    aml_append(dsdt, scope);
> +
>      if (pcmc->legacy_cpu_hotplug) {
>          build_legacy_cpu_hotplug_aml(dsdt, machine, pm->cpu_hp_io_base);
>      } else {

