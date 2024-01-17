Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp1405447ejf;
        Wed, 17 Jan 2024 00:39:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFVlDLrtOZnHsGwYOU9OnVu5F8h4A0sCST1LHVZRNQWCPO9fB3srokKEZyngJaulcTSewVu
X-Received: by 2002:a37:e10a:0:b0:783:1fa8:a59a with SMTP id c10-20020a37e10a000000b007831fa8a59amr8886839qkm.32.1705480746839;
        Wed, 17 Jan 2024 00:39:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705480746; cv=none;
        d=google.com; s=arc-20160816;
        b=bF5UMd7rXfvD9465fkVRM10/iuHgRGwqx5bp0UVlr8nehvYZVV9ZsmaZ8Ng2GhGCXi
         KebdaQHmFrCRicDMkHd56N0Dt9vF4X1FSILrU/X8FhNxpQbjtxX4ytl1qFldYE9eX/vM
         NKkLHdhS+fbIs0KRVA+LE0FKQeNCe67x+tUDDNRuSh/NFNyR+Isgiu1REYvJGjCNFax2
         Tg+p3DNr+S0qqqdoGQupoLbP7vVWPR5aEST4IZJWprPSuTe9fbad4hqZRRGl/0IsQ52d
         kznIFbvlwAQXtubfsMeku6btmjtbIrcfqsY3HLt79NeezLQ7L31SvzrzwgR4JtGgsV+M
         3akA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=Af2rR5ZJLoauR5bWUoT60gMoi3cfXo5P5ZHhPEaQHTs=;
        fh=Bj3iOVmu1clgG+pZT8H/mySoK2b13K3HhEi6cJJAapU=;
        b=jOggJphBzOmXO8WZLqzlLdRkoo0w3cwxcNCWeyBXP/3Tl6Gg02otqVDVkroghI55Mf
         xg5XO5NbkatNi6gWprgmzQ7tMb5DSQn0+6Oawo21mUaaM+HrDKwRCKeK1KbhXro47Ie3
         by7z4oXwl5MJH2r1dYZmAfnDqldchd7EDN9x/iwZXnAY/WgYjgdO76qjSwpODpEJT17y
         TQmbc46+yHIIF0px52NU9RKABuRY3GJZil8fuKg+lyB345r/uD53CAF5QFbppWnNtfly
         JPGHkuIT7WyOgW3ChkmBi3/5v1XyhMeaQ2QX9bTS1NjFhWfN80K86OAWQuFr1LA8rqEe
         UHag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TVUypnF6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k5-20020a05620a07e500b0078315f41489si10825783qkk.432.2024.01.17.00.39.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jan 2024 00:39:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TVUypnF6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQ1Rx-0006dk-2A; Wed, 17 Jan 2024 03:39:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rQ1Rp-0006bZ-5j
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:38:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1rQ1Rm-0000V1-Dl
 for qemu-arm@nongnu.org; Wed, 17 Jan 2024 03:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705480732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Af2rR5ZJLoauR5bWUoT60gMoi3cfXo5P5ZHhPEaQHTs=;
 b=TVUypnF62BULsEakdaxObCTWK29Iw+8V/2LNi4FAxiNGrunrE+Rh8e6TfjNXP0n/pq11wF
 QR4xQtcxPeY8AWC0JJRCJW1pcI850B8rXQxHPu/knMy6z7jG7wr7jf1oK/GWGmDHsi68mB
 N2YknB7VBnfSv5Qi3ep6x+4FMkHFnm0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-554-B8O1poKAO2uYYzd4jLqbIw-1; Wed, 17 Jan 2024 03:38:50 -0500
X-MC-Unique: B8O1poKAO2uYYzd4jLqbIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40e4caa37f5so65600605e9.0
 for <qemu-arm@nongnu.org>; Wed, 17 Jan 2024 00:38:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705480729; x=1706085529;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Af2rR5ZJLoauR5bWUoT60gMoi3cfXo5P5ZHhPEaQHTs=;
 b=EV6+Tz7+HuiGUD2wheU6Qqg5fHwKPHWb9xg1f5BkX5GXdmVu4Zz8kqQRplPEVa2jj2
 /0ZtObOrKMOCgGvJODhWfQhx5wbFOGQllRAiLspNRFYK9EdlFOqDJwBrlvG8M+/O4wTf
 0ESDuvHpbssiUdyqRkrKVF3i3HsoJeVzJLjV1qXDajHYu2HvVURw1AC6/1x5NLiAXyQY
 /YBT0kiGbkEyJ/FYM6dHOfVrKtHJCBJh4gqTQagfKVncjTyABGFyvP+fTag07tMP1Cmp
 cO5LYY/e0vmHTPOr1kKYpoN1ckA/hfIjI6k1mKffBnPDcrCdZvtg8wbl3pUM2LsfuAtd
 pIaQ==
X-Gm-Message-State: AOJu0YzeM/g1S2WOXNzc0rAdpvQ6wmWG5Q4hueQxadGTqeu7W6RJumAf
 2y5+5e+bq1HhiyFUIWcf1bdySl8IxJCXDSVQFr3iTPta7hbgstBy/vTdHiOzt5DhKSQYCEYZeFr
 PJEq4Sb+UkYkDESh+WwRP2cL7QLCJ
X-Received: by 2002:a05:600c:2295:b0:40d:5fc7:7a74 with SMTP id
 21-20020a05600c229500b0040d5fc77a74mr4173439wmf.188.1705480728834; 
 Wed, 17 Jan 2024 00:38:48 -0800 (PST)
X-Received: by 2002:a05:600c:2295:b0:40d:5fc7:7a74 with SMTP id
 21-20020a05600c229500b0040d5fc77a74mr4173429wmf.188.1705480728508; 
 Wed, 17 Jan 2024 00:38:48 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 fm23-20020a05600c0c1700b0040e612aa673sm21607653wmb.17.2024.01.17.00.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 00:38:48 -0800 (PST)
Date: Wed, 17 Jan 2024 09:38:47 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Felix Wu <flwu@google.com>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/1] SMBIOS type 8 should use T8_BASE.
Message-ID: <20240117093847.5dc92824@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240111192522.2795498-2-flwu@google.com>
References: <20240111192522.2795498-1-flwu@google.com>
 <20240111192522.2795498-2-flwu@google.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.806,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: AaD3jLJuuiM4

On Thu, 11 Jan 2024 19:25:22 +0000
Felix Wu <flwu@google.com> wrote:

it is missing Signed-off tag a minimum, and also commit message should describe in more detail
what's wrong and what's breaks and how it's being fixed with references to spec preferably. 

please see https://www.qemu.org/docs/master/devel/submitting-a-patch.html
for requirements to commit message of the patch.

> ---
>  hw/smbios/smbios.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 2a90601ac5..7dda84b284 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -591,6 +591,7 @@ bool smbios_skip_table(uint8_t type, bool required_table)
>  #define T2_BASE 0x200
>  #define T3_BASE 0x300
>  #define T4_BASE 0x400
> +#define T8_BASE 0x800
>  #define T11_BASE 0xe00
>  
>  #define T16_BASE 0x1000
> @@ -775,7 +776,7 @@ static void smbios_build_type_8_table(void)
>      struct type8_instance *t8;
>  
>      QTAILQ_FOREACH(t8, &type8, next) {
> -        SMBIOS_BUILD_TABLE_PRE(8, T0_BASE + instance, true);
> +        SMBIOS_BUILD_TABLE_PRE(8, T8_BASE + instance, true);

we can't do that unconditionally as it will break live migration
where firmware reading this might get part of broken tables (on source host)
and 2nd part of fixed ones (from target host).

So we need to use T0_base for old machine types and T8_BASE for
default/new machine types.
for example see how 'pcmc->smbios_uuid_encoded' is used.
unless it's x86 specific, this should be done for affected machine types.
  
>          SMBIOS_TABLE_SET_STR(8, internal_reference_str, t8->internal_reference);
>          SMBIOS_TABLE_SET_STR(8, external_reference_str, t8->external_reference);

