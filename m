Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp2036290njf;
        Mon, 19 Aug 2024 04:43:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX7oIgu7a6IKyZZ5316kEPlz0Hp3qUhSdvIrazTkB5afo7YKxE1RNO+s0vGtmbZFBv6L39lHEyMEIEoWQAg0pk3BxawkO5d
X-Google-Smtp-Source: AGHT+IEz6p7pHhPRYRnx4H3wCbyWpWKk0NHMPOCsCyUn/xNvNOYwWXwDgmiuGIBc6KZ8oaUElQp0
X-Received: by 2002:a05:6902:1692:b0:e0e:499f:3d88 with SMTP id 3f1490d57ef6-e1180ef62b5mr12288290276.26.1724067806472;
        Mon, 19 Aug 2024 04:43:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724067806; cv=none;
        d=google.com; s=arc-20160816;
        b=Dt3Y/EI7G2x90XljaYij0jQeQHD2qr/1IJZCuBFAM5aBiNdN8fwfN0taXVJfIy8Nh4
         RstDGnC9mg/KA6+6gl/kptYDsEEHqrs5K6Zu6BaZtZazpGqxTQM3qAiCRuwjFj193nSk
         5yinX7cM6eEy9lV1auLQ+Pa62xLQSRdIQ8lBISPkS3qw29iI+1xSb6JQteYMm7u+dfho
         6UbLdth4IlJB7gIn16MvVxpQt6LoS4nuW+V1bLnrx5wFLTYrT5IyseOkH4LVLI6zNRLR
         +kMJhekfiUSTtdSHaA6qBlHiTX2wxOvBCRC6llbX+/2weMPPp2Si4UlqMqkjNhwenMbQ
         3CWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=17jyWeoONpjyGGI56CQoEQmnYqkX6odmOILY01oA+ic=;
        fh=7lMeEb4Rz3C6ZEtf++nQZz5qAvbO02MfS7KSnL9BNZo=;
        b=hu/fRE61AY73iLocrQOUCji/G0yhMGzsUdm1x/v/5FlP068lLGcC+WahPJEq9/GjG5
         cpbwxvc5N0zlTL3jzbV/4eM96dmrZBdq6kMbHIE39Ftjvpyn4nPJYp1NcBlebUAlKWBT
         JHv/OcTCIa4nqQtTEz04FSrH5jWM7eOqMIEe4ldFH7JUAJgJHmwmo0wAkeNlAr2a0ELt
         otmEgW55lT10mnuqDECy+TuS66fP1UzWuljJc+mHvHlcjf+bOCBVq9/cDL62rh37Z1Pq
         85vuZFWtJDwd1fZhOMcBjahhH+ucy7oBllzzz54QuiU8B3q/6MRJVe1MX+IuCcFXABem
         bLDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GZl4Ck/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bf6fee752bsi105436876d6.324.2024.08.19.04.43.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Aug 2024 04:43:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GZl4Ck/i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sg0n5-0003Bs-FT; Mon, 19 Aug 2024 07:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sg0n4-0003Av-6a
 for qemu-arm@nongnu.org; Mon, 19 Aug 2024 07:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sg0n2-0001F1-93
 for qemu-arm@nongnu.org; Mon, 19 Aug 2024 07:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724067790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=17jyWeoONpjyGGI56CQoEQmnYqkX6odmOILY01oA+ic=;
 b=GZl4Ck/iZlZYOIbDKpnqRLp/rhRCB2sLRRFJLK+DTVeN0oYcBJ0HjWRKSlPYE6x8LR9w/P
 Yqi+uwbtgBZpG2ZwsmPFVm11sBaU87xU3duevj4oKW24SPkgxMKnGdfDh8vVejYQFiGeZ/
 ynMzyuGK0Qi/Lb8FO/RYV66eoV8c7/E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-hVvTKh7KPD2tp9B2voPQMg-1; Mon, 19 Aug 2024 07:43:07 -0400
X-MC-Unique: hVvTKh7KPD2tp9B2voPQMg-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3717cc80ce1so2602339f8f.0
 for <qemu-arm@nongnu.org>; Mon, 19 Aug 2024 04:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724067786; x=1724672586;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17jyWeoONpjyGGI56CQoEQmnYqkX6odmOILY01oA+ic=;
 b=Y+7qUAN0bvfGxIxaY0XRr+UV8tylSwCYL47VKw9H1Ff9PzS5kCFrrxT15txcbsbrLT
 lLzOmk8trHwhqYMHUlPapI6ZqCkeFwC5IBv0FE8939pPQ0SyaJke73fN79cwiqRHTxX/
 EfJ8vd6BJc83W6HfwD9vyMCvDwZD+fvyhqrLym3VN53P0QuWBcVyhM03Oe5FEVDNDA2c
 LrchNs0AFhrW0xg8O6Ekh5hsgY+DN6ZOs6RyOiecd/zYLozPFWP9kN+yfNXCs/0XO/Eh
 Q/Xy5FypNTlNeUFCG3Sj4i5/5KBpdbm+TsRGeBc6X3Eo0WLiZdZb5IV/c69l4FZfWTvE
 1tgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwkOtBYV6KBbD8cB5BK+bVsUeH1gEt+W0gnxM3/T6qIqt2j7JgYhBp9l4OgHKPk6n1pOx52xcCzUU/+UxEHbDsrs2J
X-Gm-Message-State: AOJu0YxRFHTgdKXSqLJooCmqDGmH2ZTHnB1Hn56ginmlYBXF0L+/9U8K
 QGDd9JPWTjl2vAahvMz7RW9Uk0RbkfDMchI9wAZCozeBdTHXIxlYC8QT5DgQXmXII2PJsf4bHz0
 JBypoCYTULCiBHbAWdu7+E5rlGtytG3Yrr1/XC9b9I9LP5OugSw==
X-Received: by 2002:a5d:670d:0:b0:367:9903:a81 with SMTP id
 ffacd0b85a97d-3719469fac2mr6086916f8f.43.1724067786437; 
 Mon, 19 Aug 2024 04:43:06 -0700 (PDT)
X-Received: by 2002:a5d:670d:0:b0:367:9903:a81 with SMTP id
 ffacd0b85a97d-3719469fac2mr6086901f8f.43.1724067785934; 
 Mon, 19 Aug 2024 04:43:05 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3718983a2eesm10352516f8f.19.2024.08.19.04.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 04:43:05 -0700 (PDT)
Date: Mon, 19 Aug 2024 13:43:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v8 03/13] acpi/ghes: Add support for GED error device
Message-ID: <20240819134304.68c54eae@imammedo.users.ipa.redhat.com>
In-Reply-To: <ba1864f1aa7073abe090eec0c31915f187967140.1723793768.git.mchehab+huawei@kernel.org>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
 <ba1864f1aa7073abe090eec0c31915f187967140.1723793768.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.134,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: HJNr2ykdqZPK

On Fri, 16 Aug 2024 09:37:35 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> As a GED error device is now defined, add another type
> of notification.
> 
> Add error notification to GHES v2 using
>a GED error device GED triggered via interrupt.
 ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
This is hard to parse, perhaps update so it would be
more clear what does what

> 
> [mchehab: do some cleanups at ACPI_HEST_SRC_ID_* checks and
>  rename HEST event to better identify GED interrupt OSPM]
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---

in addition to change log in cover letter,
I'd suggest to keep per patch change log as well (after ---),
it helps reviewer to notice intended changes.


[...]
> +    case ACPI_HEST_SRC_ID_GED:
> +        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_GPIO);
While GPIO works for arm, it's not the case for other machines.
I recall a suggestion to use ACPI_GHES_NOTIFY_EXTERNAL instead of GPIO one,
but that got lost somewhere...

> +        break;
>      default:
>          error_report("Not support this error source");
>          abort();
> @@ -370,6 +376,7 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
>      /* Error Source Count */
>      build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
>      build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
> +    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_GED, linker);
>  
>      acpi_table_end(linker, &table);
>  }
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index fb80897e7eac..419a97d5cbd9 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -59,9 +59,10 @@ enum AcpiGhesNotifyType {
>      ACPI_GHES_NOTIFY_RESERVED = 12
>  };
>  
> +/* Those are used as table indexes when building GHES tables */
>  enum {
>      ACPI_HEST_SRC_ID_SEA = 0,
> -    /* future ids go here */
> +    ACPI_HEST_SRC_ID_GED,
>      ACPI_HEST_SRC_ID_RESERVED,
>  };
>  

