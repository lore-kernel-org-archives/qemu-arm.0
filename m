Received: by 2002:a17:906:1c87:0:0:0:0 with SMTP id g7csp241356ejh;
        Fri, 26 Aug 2022 05:13:42 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4XFXbEyVrB1ZbDQKaD3HgvS/BIW2TJ1Y+OMHSXzMROzipyiB03RlUWTFEXnBOPDNL/xq/R
X-Received: by 2002:a05:622a:1343:b0:343:5b7:ffb with SMTP id w3-20020a05622a134300b0034305b70ffbmr7660212qtk.91.1661516022153;
        Fri, 26 Aug 2022 05:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1661516022; cv=none;
        d=google.com; s=arc-20160816;
        b=XAeDR9I0BUES9HNEQi6leKDWJnXt0ltrH7sW3g3D3qKP1aYy4xu2AE7sveWP5D/+K3
         jc9IB7ewYhZNDC5qZoetG0MhPTPnZ2L+KZsYIbR1GUOfmzVJXS0FcoSReRUk/9amJZ9S
         Ol6vDk06TbnvDDOdI43siOdVLSaHKJk/zZPIFMrSUInkXn1qh1yqop8/gO5gJ+LwYuc0
         OQB1lLLB+YowcwKUMgK3PKGcWxhzDcYtQMhNum6701gCmuEAZKznkK/Dp8aHz1go2It3
         +PyxXf/8G0YqSZKWWT8JhKytGGQV+xOTWyAmKHurz3+z0ePteZm7f7JyDYpv3QXly/Nc
         PPFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:date:message-id:from
         :references:cc:to:subject:dkim-signature;
        bh=6LdQIy1KpSymSb6Goznzjmj9STKPdJYTor12NmVUqIM=;
        b=YsRh+ahrCovxfzMnMEFGRIk4iC5LWBYLwWR89vvozPE4WBouUyKR6WLSkYhRSqMXZH
         QzvNZ6sGJvXFOU6wuUM5mW0I41e8vh6L3XiQ/4IMOV3YxFxuO4XySsQZEhv2dZorLoXG
         3AGTvABOpUktRyeDpc9zA6JT+ne1hEyNRa58vFFqb3s2p0LrR4x3tOCafREPyrG10Bcq
         4+Oz4AaTOgf1Ten7SJ6y+snURbOz5U9ooBXHlpR5Oi68GRKsBEcrUhs8Byk42YEe8YUO
         J6VD0DqJFq1IoQ05Dl73dgz0oGWmqH71vgg8Vrxm0965CDhHJSzehLcB/HHdU/MAeWcl
         oXxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OshDwdgj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id az6-20020a05620a170600b006b65a6b773bsi1225892qkb.640.2022.08.26.05.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Aug 2022 05:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OshDwdgj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oRYDV-0004cL-Mz
	for alex.bennee@linaro.org; Fri, 26 Aug 2022 08:13:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oRY0N-0004lk-ST
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:00:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32286)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1oRY0I-00058H-GS
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 08:00:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661515200;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6LdQIy1KpSymSb6Goznzjmj9STKPdJYTor12NmVUqIM=;
 b=OshDwdgjMz+dh0AT3l6Lmq9ktnP+ppltoXauWmrfhhlZgvY+UUsU94+0yek22szaMHgXg/
 oHtsF7vTAQeL3H2OHQbZT1Xe81Bd96iJoOvdfQJyULuyAlAaCllI/E7cn5cGoD8wNEVbAW
 HvftYsk/TPxz7Tv9AVKg+GWh/jGgzSE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-201-oiahhW-INHmZLn3_NlvfTg-1; Fri, 26 Aug 2022 07:59:59 -0400
X-MC-Unique: oiahhW-INHmZLn3_NlvfTg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE7B785A589;
 Fri, 26 Aug 2022 11:59:58 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (unknown [10.39.192.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D222D492C3B;
 Fri, 26 Aug 2022 11:59:56 +0000 (UTC)
Subject: Re: [PATCH] fw_cfg: Don't set callback_opaque NULL in
 fw_cfg_modify_bytes_read()
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: imammedo@redhat.com, peter.maydell@linaro.org, linuxarm@huawei.com,
 chenxiang66@hisilicon.com
References: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <43c62060-7a5d-25cf-91a3-1c391d3a58f9@redhat.com>
Date: Fri, 26 Aug 2022 13:59:54 +0200
MIME-Version: 1.0
In-Reply-To: <20220825161842.841-1-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M/ryou7UTyPc

On 08/25/22 18:18, Shameer Kolothum wrote:
> Hi
> 
> On arm/virt platform, Chen Xiang reported a Guest crash while
> attempting the below steps,
> 
> 1. Launch the Guest with nvdimm=on
> 2. Hot-add a NVDIMM dev
> 3. Reboot
> 4. Guest boots fine.
> 5. Reboot again.
> 6. Guest boot fails.
> 
> QEMU_EFI reports the below error:
> ProcessCmdAddPointer: invalid pointer value in "etc/acpi/tables"
> OnRootBridgesConnected: InstallAcpiTables: Protocol Error
> 
> Debugging shows that on first reboot(after hot-adding NVDIMM),
> Qemu updates the etc/table-loader len,
> 
> qemu_ram_resize()
>   fw_cfg_modify_file()
>      fw_cfg_modify_bytes_read()
> 
> And in fw_cfg_modify_bytes_read() we set the "callback_opaque" for
> the "key" entry to NULL. Because of this, on the second reboot,
> virt_acpi_build_update() is called with a NULL "build_state" and
> returns without updating the ACPI tables. This seems to be 
> upsetting the firmware.
> 
> To fix this, don't change the callback_opaque in fw_cfg_modify_bytes_read().
> 
> Reported-by: chenxiang <chenxiang66@hisilicon.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
> I am still not very convinced this is the root cause of the issue.
> Though it looks like setting callback_opaque to NULL while updating
> the file size is wrong, what puzzles me is that on the second reboot
> we don't have any ACPI table size changes and ideally firmware should
> see the updated tables from the first reboot itself.
> 
> Please take a look and let me know.
> 
> Thanks,
> Shameer
> 
> ---
>  hw/nvram/fw_cfg.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/hw/nvram/fw_cfg.c b/hw/nvram/fw_cfg.c
> index d605f3f45a..dfe8404c01 100644
> --- a/hw/nvram/fw_cfg.c
> +++ b/hw/nvram/fw_cfg.c
> @@ -728,7 +728,6 @@ static void *fw_cfg_modify_bytes_read(FWCfgState *s, uint16_t key,
>      ptr = s->entries[arch][key].data;
>      s->entries[arch][key].data = data;
>      s->entries[arch][key].len = len;
> -    s->entries[arch][key].callback_opaque = NULL;
>      s->entries[arch][key].allow_write = false;
>  
>      return ptr;
> 

I vaguely recall seeing the same issue report years ago (also in
relation to hot-adding NVDIMM). However, I have no capacity to
participate in the discussion. Making this remark just for clarity.

Laszlo

