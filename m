Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp757527lfa;
        Fri, 23 Oct 2020 11:35:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymMJLVMmjhcRJVsZBRxwwEIensW3X+WIQzz610duuGcoffBI19jc5zAwWF6EyvKwc4nJ+y
X-Received: by 2002:a05:620a:809:: with SMTP id s9mr3703286qks.57.1603478121760;
        Fri, 23 Oct 2020 11:35:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603478121; cv=none;
        d=google.com; s=arc-20160816;
        b=RckP9gRnHLvXcHNYFNZTSdZWwlLc6PlrOeEfszUVXQFEphw6aX52aRy20RwPM8mPC8
         6NUl/3XbRDFTHKHqa7CyDjQ+wkDdfvXITgp5ebOQq9DQ7mA2085NWEHoioFqnipEnELT
         oUD9e8LlYo8g8mW511lLNv11KuLGhqwtrhesWmcqrOgoBQXW2cGjXXUYBvcQxsF8LDB7
         ZMj81FS5010NowrYysdWQdEpYb8Y9dISJeHi39X22xG+00vlRzdz5+InqtIWAzZ6ZAB0
         V693qvu7nhkEn5A1pw7NO0piJCLRSsyiUDkGQcjChx+GQyG5rbn7SDvkI/MrVS4joQOd
         Ho9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=54vRvNP2niJDvIDEZu13+zYc34Xn7omul0lVlg8bNo0=;
        b=QqunR00D4dxX9ejNlgc67StA2zg6WWrwkBCrYin5/TKwfXYGM9iR2DB142tfiv/0ih
         RdAqCZlhQZl+ZCjWRy8W7b8b0zi+VNa9FiBBrZddU8GD8bNaUhUd3X7iDoP+ae6xFKZJ
         O4tMskY0qHtEcdxFwJ8pNDhmTcqB5d6WqPNm2V8C8QujhMT5ospbaoDipzATmKyl9Aod
         NKCLnCdnaBVIAA9fC5qhlpgSx5UX0tvniafej1kxFQuJ1iOPIsmukvQUiOSasg0uyA01
         HviIN9a5BXUFomnc/hEgogCoxFOZ2D/XAGMMeT3gIGyEHiCiKoa1wcSE7Xv0opiTbBzq
         244g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ykr3zp6x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k19si1300945qki.63.2020.10.23.11.35.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Oct 2020 11:35:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Ykr3zp6x;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kW1uL-00073V-6Z
	for alex.bennee@linaro.org; Fri, 23 Oct 2020 14:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW1tk-00072y-Ro
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kW1tj-00018x-Bv
 for qemu-devel@nongnu.org; Fri, 23 Oct 2020 14:34:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603478082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=54vRvNP2niJDvIDEZu13+zYc34Xn7omul0lVlg8bNo0=;
 b=Ykr3zp6xwhzbZiKHREGTVrZMQYuAKAAJV27TXlFiRNMl1Z9/U4MpqVffv6Z6UFVoxytBEB
 s0eAxr1nbBxERteRqn4M0cETiiEEwAY26Zs8kXZ2FfYArafyXHHbvb9VMKHQ8TZ4Pzen1f
 dLnyD4NYHNQvBylZZmpruRJlDjBewZY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-MbzMEwoJOkqfVeR6sQbnKQ-1; Fri, 23 Oct 2020 14:34:40 -0400
X-MC-Unique: MbzMEwoJOkqfVeR6sQbnKQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB08018C89CE;
 Fri, 23 Oct 2020 18:34:39 +0000 (UTC)
Received: from localhost (unknown [10.40.208.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC91260DA0;
 Fri, 23 Oct 2020 18:34:37 +0000 (UTC)
Date: Fri, 23 Oct 2020 20:34:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 18/24] arm/cpu64: Register "aarch64" as class property
Message-ID: <20201023203436.1f6d5d87@redhat.com>
In-Reply-To: <20200921221045.699690-19-ehabkost@redhat.com>
References: <20200921221045.699690-1-ehabkost@redhat.com>
 <20200921221045.699690-19-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/23 01:44:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XdMUN5XsQ8ea

On Mon, 21 Sep 2020 18:10:39 -0400
Eduardo Habkost <ehabkost@redhat.com> wrote:

> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>  target/arm/cpu64.c | 16 ++++++----------
>  1 file changed, 6 insertions(+), 10 deletions(-)
> 
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 3c2b3d95993..349c9fa3a3a 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -758,15 +758,6 @@ static void aarch64_cpu_set_aarch64(Object *obj, bool value, Error **errp)
>      }
>  }
>  
> -static void aarch64_cpu_initfn(Object *obj)
> -{
> -    object_property_add_bool(obj, "aarch64", aarch64_cpu_get_aarch64,
> -                             aarch64_cpu_set_aarch64);
> -    object_property_set_description(obj, "aarch64",
> -                                    "Set on/off to enable/disable aarch64 "
> -                                    "execution state ");
> -}
> -
>  static void aarch64_cpu_finalizefn(Object *obj)
>  {
>  }
> @@ -786,6 +777,12 @@ static void aarch64_cpu_class_init(ObjectClass *oc, void *data)
>      cc->gdb_num_core_regs = 34;
>      cc->gdb_core_xml_file = "aarch64-core.xml";
>      cc->gdb_arch_name = aarch64_gdb_arch_name;
> +
> +    object_class_property_add_bool(oc, "aarch64", aarch64_cpu_get_aarch64,
> +                                   aarch64_cpu_set_aarch64);
> +    object_class_property_set_description(oc, "aarch64",
> +                                          "Set on/off to enable/disable aarch64 "
> +                                          "execution state ");
>  }
>  
>  static void aarch64_cpu_instance_init(Object *obj)
> @@ -823,7 +820,6 @@ static const TypeInfo aarch64_cpu_type_info = {
>      .name = TYPE_AARCH64_CPU,
>      .parent = TYPE_ARM_CPU,
>      .instance_size = sizeof(ARMCPU),
> -    .instance_init = aarch64_cpu_initfn,
>      .instance_finalize = aarch64_cpu_finalizefn,
>      .abstract = true,
>      .class_size = sizeof(AArch64CPUClass),

