Received: by 2002:a17:906:489:b0:a44:3ba0:e9d1 with SMTP id f9csp2599724eja;
        Mon, 4 Mar 2024 05:54:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXhM7vExj7GN8q6oF6i+a5/fL8fcu0ZKT+SrdsJ9OiApwGrHzsslsnzV6iWyWJivpyk7URCv7eTfT+xc82srO7NsmYokTxx
X-Google-Smtp-Source: AGHT+IE4w/mtauRNbCwH7KEaQVGaZN28MXIqGvikNg7LNI53wdCgRAxf5ql93YxOKFhVvWNkowDj
X-Received: by 2002:a05:620a:1a1b:b0:787:f097:45f1 with SMTP id bk27-20020a05620a1a1b00b00787f09745f1mr12505173qkb.33.1709560493276;
        Mon, 04 Mar 2024 05:54:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709560493; cv=none;
        d=google.com; s=arc-20160816;
        b=m3nl44M+X51Q1LPpXhhIHJS1qiyFh9Noc+11DroWIjMl0nb7yYDI8Pr2JIW20pyFoE
         OTGuMQNPx8wZmeVXL/cQHnP057/x67WDukpOadK2Cjx2LpjMlp7gqQ7xqMCzi7gBKAe5
         WTGA3n1vnizEgCaxwAsP4Gx8f/iYHmv6VImM6xPCPC0ZTqZ1UF1eH80sABx29WduhKLk
         jSvSkgfEb1/px681vzkmpT8KigBebYvsQAibF5b0UN5ovt8pOoH0gSyT1y9220kWdCMz
         BINjo2EGOyFrJ+pfRWdN74KT4+tPm2CMUAOVUTyUUw79sFHznkYIzRiJqjY4lcdqeDqQ
         VfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :references:message-id:cc:date:in-reply-to:from:subject:mime-version
         :dkim-signature;
        bh=3GIJGxh6vwIgUWC2cGg1VjYRjXLh++LvhAThWVmzffc=;
        fh=Wox01sTZlbliC1pH5ro8pWDXI1023NcIMpgaKOPmHw8=;
        b=y/UWZy9kJoJErmBL2qsF9fpK7tefMNr87AE9GTgB7TC1TML4gOi/Gq1vEBODm1D7lF
         CFYpPjPDGDpfIxdOh6mE3ceTWuy5N1D1YoQW54I2rzl/V5l9xmoe0DQemAQ8X6zvhsRk
         GZ+nMvjiq6NvI2L9Em+Ry6Ytu4TlQgyIZH+yuAySlHRh/KJwK4LP0bkOTOE4bMtXzL8X
         FFKYfVfgc85trpBlvupDNplSwLq9Md9ocYEBQXPnRS7vMFyeh5AkJW7kYR5r6lpExk3K
         t82x1lM+6xnbjQVbzeHVAdkZPESekqoim0UWaJcyy3DJpsl1IsAKR3/pSVYAFsmSJncS
         wBVw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CK6awT6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12-20020a05620a124c00b0078822a47301si3577885qkl.184.2024.03.04.05.54.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Mar 2024 05:54:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CK6awT6p;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rh8m4-00020d-MM; Mon, 04 Mar 2024 08:54:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh8ly-0001yP-Qv
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 08:54:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anisinha@redhat.com>)
 id 1rh8lw-0002VB-M7
 for qemu-arm@nongnu.org; Mon, 04 Mar 2024 08:54:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709560466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3GIJGxh6vwIgUWC2cGg1VjYRjXLh++LvhAThWVmzffc=;
 b=CK6awT6pDR84WEfyttw6KB6UQUIlkZfsIJq+H/oGG7f+wccdvy1+Hep8kAWnWH9oqEg+su
 SrikA6zieebvpch/7dBwJuJYCKQG204/80G7VxxrtOAfGLO9n6zKqT8/rRE3m6Kx/7Ri3D
 41/vucRrD072+KbdMEH6iYwJUcw+P7o=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-rYaUB9HjN0KNECjGhOoKmw-1; Mon, 04 Mar 2024 08:54:24 -0500
X-MC-Unique: rYaUB9HjN0KNECjGhOoKmw-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1dcf7d114c2so13095625ad.1
 for <qemu-arm@nongnu.org>; Mon, 04 Mar 2024 05:54:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709560463; x=1710165263;
 h=to:references:message-id:content-transfer-encoding:cc:date
 :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3GIJGxh6vwIgUWC2cGg1VjYRjXLh++LvhAThWVmzffc=;
 b=alLoFuFkCf+DCJDcybOF5OjT25HhyXsrzaZc6OdOqbmXFhg75AzYvmFJWR6K/1F3EV
 LtaIdvjj1GoPp8VjRcH4QYV2xuYfNGVrJVuxQAft6FILhmztORHR8Tc8hjmdL7yp1k0N
 PI3aaXdO5KIM6NFAhmqz0u+QORZbhuVTWlHwjaawLmBlibVlo1lQyk3VKoOA5TAsO5v/
 VF57L3sPbzKoygeUyY2W2zZDCiQQXOvvcEoc8l8NWPReb3Ue7vmF2X3P0cBssyEliqwj
 7m6y5X37kVVu5pEijeQhrGUi+tgSyCbpdkXqOYaNMA8fyB2I+gxpKLog408bBznToitG
 egdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVntyt6wkJ74sxaBWIstxGyQyslxqn2F8QJr2hTyI+Vh3DOIWINVP2Xy3wSO5V9b3oeCqlX3WCaY+nTM8uHPfT5Ch4
X-Gm-Message-State: AOJu0Ywolr/orHd6MI4eZyRBbEy8LGHQYDZ+A2ExXCVcYW1iXlTigA6G
 b5fp3fP8G2EqPUK7quCnIPiP1BVsGi5rl66S3JGa0Butqk2jFpfMrOBUQu5h9hXZMY3AunTN8Lh
 /U/OFZx/f7ya9H+SJTMU7boo0A44q0iAPCsVKZr2CzYp+/GEEhg==
X-Received: by 2002:a17:903:288:b0:1dc:df18:c5c1 with SMTP id
 j8-20020a170903028800b001dcdf18c5c1mr8599461plr.33.1709560463567; 
 Mon, 04 Mar 2024 05:54:23 -0800 (PST)
X-Received: by 2002:a17:903:288:b0:1dc:df18:c5c1 with SMTP id
 j8-20020a170903028800b001dcdf18c5c1mr8599429plr.33.1709560463258; 
 Mon, 04 Mar 2024 05:54:23 -0800 (PST)
Received: from smtpclient.apple ([115.96.159.226])
 by smtp.gmail.com with ESMTPSA id
 mn14-20020a1709030a4e00b001dcada71593sm8544922plb.273.2024.03.04.05.54.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Mar 2024 05:54:22 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH 11/19] smbios: clear smbios_tables pointer after freeing
From: Ani Sinha <anisinha@redhat.com>
In-Reply-To: <20240227154749.1818189-12-imammedo@redhat.com>
Date: Mon, 4 Mar 2024 19:24:06 +0530
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Song Gao <gaosong@loongson.cn>,
 Alistair Francis <alistair.francis@wdc.com>, palmer@dabbelt.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, philmd@linaro.org, wangyanan55@huawei.com,
 eblake@redhat.com, armbru@redhat.com, qemu-arm@nongnu.org,
 qemu-riscv@nongnu.org, f.ebner@proxmox.com
Message-Id: <92FA6B88-CA59-498A-AEFA-9A82E3342230@redhat.com>
References: <20240227154749.1818189-1-imammedo@redhat.com>
 <20240227154749.1818189-12-imammedo@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=anisinha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.571,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: RslpcRZ5sZHl



> On 27-Feb-2024, at 21:17, Igor Mammedov <imammedo@redhat.com> wrote:
> 
> that will avoid double free if smbios_get_tables() is called
> multiple times.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>

Maybe we can squash this with patch 10.

Other than that, 

Reviewed-by: Ani Sinha <anisinha@redhat.com>

> ---
> hw/smbios/smbios.c | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 7c28b5f748..d9ba2072b1 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -1052,6 +1052,8 @@ void smbios_get_tables(MachineState *ms,
>     return;
> err_exit:
>     g_free(smbios_tables);
> +    smbios_tables = NULL;
> +    return;
> }
> 
> static void save_opt(const char **dest, QemuOpts *opts, const char *name)
> -- 
> 2.39.3
> 

