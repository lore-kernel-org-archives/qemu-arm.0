Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp54909njg;
        Tue, 17 Sep 2024 02:22:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUx1olUMWVYUwsOOZX55yqW1SGjeBbtcErNWQv8ENqS71cEga4hpOvX8xzPFIGzpVSmkpqNdqIpwDaYaA==@linaro.org
X-Google-Smtp-Source: AGHT+IE4IHJTjKI5i8VtTpoFv/KrRLYcyRFODoi2LN5vfB5ppm2QJzVf4wMa005g35JlJHLUZx05
X-Received: by 2002:a05:620a:3915:b0:7a9:a23b:9d0c with SMTP id af79cd13be357-7ab30d1258cmr2601955285a.8.1726564975978;
        Tue, 17 Sep 2024 02:22:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726564975; cv=none;
        d=google.com; s=arc-20240605;
        b=aABoJJVTppumL82IrSK3/qADsHxFPfbGdlE3XSEh4sCfND81TSzf+g4BAZPT4x2Xb4
         CfH9Ol0LLfZUtd0ATNkJXiAWncP2f/mAdcjmOqsFwr3iQDE/EHK0rHqwZ4NJs9ey7WZA
         uQ6Ryfc7Z2wz5o3ZT8WyaK8qv5eulsEJiQXLMoOozzFQWOWzMUY2B5kQHo6Ti9Xy0GUE
         CaJcXsoQeROJvgFUmYKavhb02uzGmF40uHWufOCGbxRcPf9w2U7OxGao89MoRcwFswQW
         272Q8GwkpCUZ/9UZcSx50V0ZHecDFLChHsgfYHPKaJ4rUuT/opgyutRBNdz64jmSlxXw
         z1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=gM6/s5JzlURtImk2OaK1piumzBONmsL9B4dUQRIQefk=;
        fh=gQh8L5Pz63QUPoH7LxC11PCiJ0S1MT7wq9AyYOxRVmQ=;
        b=RYSWlNsPJ6EbXAOkixnxHYe7oTdB2T1aGAKYiHdXqcWsuGBG/fb5fplpH+wiBlIPAq
         5ediQv4v4ONIdMG4WqQtgmG5aSdo0baxr+FE8+wfuN9BrLvaZF4y1FToc+hulctN3tdU
         5bkBb7JklI5FjGYptMGrrmmCWQwzLRTEsifJierwrYHjDtIGeHVwdsZ3BFes5JrtNcJ7
         gw0zGNBfSLT4syIiUZQRTVI9MHS32IIoihnwHDRKo9o1QSo4caAsjFWjxCmML6sQ2jM9
         fuu7eeKu377HHLRx6CVc5Ppgdd4YZ3xaqGD9goTZutsqfXNWc3zV/Oe3br2wRUrlnXkP
         pc7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ARPFIflb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7ab3eb63b14si786480185a.387.2024.09.17.02.22.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Sep 2024 02:22:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ARPFIflb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sqUQ4-0000Rs-RH; Tue, 17 Sep 2024 05:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sqUQ2-0000Hy-L2
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 05:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sqUQ1-0004hA-2y
 for qemu-arm@nongnu.org; Tue, 17 Sep 2024 05:22:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726564964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gM6/s5JzlURtImk2OaK1piumzBONmsL9B4dUQRIQefk=;
 b=ARPFIflbk25XJsmYE/eg/nLDTEknavw1FworF+cnDbYvpnjBMhrXSfI9nbqdy5OHEnBU5D
 kiD3K7Qb9qIWM+xxJr4mJv2kE/XwAKtOScVeF7zxsmGF96zsXaVstXydBAgAwVDNJQnehJ
 hZp96+iPWv7BIDo52/W0aXZhEyi18ok=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-d65tAqsFMLq6d-sc3XsW2g-1; Tue, 17 Sep 2024 05:22:42 -0400
X-MC-Unique: d65tAqsFMLq6d-sc3XsW2g-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374b385b146so2743963f8f.0
 for <qemu-arm@nongnu.org>; Tue, 17 Sep 2024 02:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726564961; x=1727169761;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gM6/s5JzlURtImk2OaK1piumzBONmsL9B4dUQRIQefk=;
 b=o4RtZZPbQLi48xy4TbSP2xl9d7KKKEYjze4PN2PRRFJpX5w08FdCUxlD5hFAgBZ1a3
 VsmDb5d0ldK+Yev5T7K+ixn/lEpeZUvY8e+fgw+We/n2FQ9wzctyFmyJJHMZrFcQNfHd
 Izr9paRL6lq2zFPkovY6AQb61fIL0HdD1OdTez+sZnowSXhIjlDMFm0ghn2GKDnp4972
 Si3U0VUfBy0yYVZMNcfIERWZWrwsOPhScfOqAOYEiJVP2kTtvFvzpQfh3UjceM+enxGa
 4S1sjNfQkY/oZa1/VMfUMDVtO8vnfqXVsJ2Vrtvj0eprwo5zCjzGeSXPyCLmbrRYheM6
 JICA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRm7fT7MYp5qZxV0IS/ohKgux/5Q9eOWmVx4GD0G46kBGrG9bqdLcFi9MEJ4FSqEsRINJYg4F2HA==@nongnu.org
X-Gm-Message-State: AOJu0Yw1fCltI4aIl0jURciTW8mP7Qqt/cXcpDXTcVqgNWWzW2xSXxag
 6sLNpdWAO8fM0UAKfng9/5Vat+kZgeg1wJg4W/JI3zPMIeElDVcFzfHawF3b9KEPb///NHuDR9d
 0DQ+9+ITNWsfewf5YnQSlKJCt1taFY/ykAEj6r9nAoWlO7Pp42A==
X-Received: by 2002:adf:efc9:0:b0:371:8a91:9e72 with SMTP id
 ffacd0b85a97d-378c2d119f7mr12005832f8f.30.1726564961565; 
 Tue, 17 Sep 2024 02:22:41 -0700 (PDT)
X-Received: by 2002:adf:efc9:0:b0:371:8a91:9e72 with SMTP id
 ffacd0b85a97d-378c2d119f7mr12005812f8f.30.1726564961052; 
 Tue, 17 Sep 2024 02:22:41 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378e73f62dasm8971910f8f.49.2024.09.17.02.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 02:22:40 -0700 (PDT)
Date: Tue, 17 Sep 2024 11:22:39 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v10 03/21] acpi/ghes: get rid of ACPI_HEST_SRC_ID_RESERVED
Message-ID: <20240917112239.503b2a0b@imammedo.users.ipa.redhat.com>
In-Reply-To: <eb07ac97c57f4fbab413eba8a47150037b5a7684.1726293808.git.mchehab+huawei@kernel.org>
References: <cover.1726293808.git.mchehab+huawei@kernel.org>
 <eb07ac97c57f4fbab413eba8a47150037b5a7684.1726293808.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-TUID: EuXnYOHlpgni

On Sat, 14 Sep 2024 08:13:24 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This is just duplicating ACPI_GHES_ERROR_SOURCE_COUNT, which
> has a better name. So, drop the duplication.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/ghes.c         | 7 ++-----
>  include/hw/acpi/ghes.h | 3 ++-
>  2 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 529c14e3289f..35f793401d06 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -35,9 +35,6 @@
>  /* The max size in bytes for one error block */
>  #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
>  
> -/* Now only support ARMv8 SEA notification type error source */
> -#define ACPI_GHES_ERROR_SOURCE_COUNT        1
> -
>  /* Generic Hardware Error Source version 2 */
>  #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
>  
> @@ -411,7 +408,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
>      AcpiGedState *acpi_ged_state;
>      AcpiGhesState *ags;
>  
> -    assert(source_id < ACPI_HEST_SRC_ID_RESERVED);
> +    assert(source_id < ACPI_GHES_ERROR_SOURCE_COUNT);
>  
>      acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
>                                                         NULL));
> @@ -422,7 +419,7 @@ int acpi_ghes_record_errors(uint8_t source_id, uint64_t physical_address)
>  
>      if (physical_address) {
>  
> -        if (source_id < ACPI_HEST_SRC_ID_RESERVED) {
> +        if (source_id < ACPI_GHES_ERROR_SOURCE_COUNT) {
>              start_addr += source_id * sizeof(uint64_t);
>          }
>  
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 28b956acb19a..5421ffcbb7fa 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -59,7 +59,8 @@ enum AcpiGhesNotifyType {
>  enum {
>      ACPI_HEST_SRC_ID_SEA = 0,
>      /* future ids go here */
> -    ACPI_HEST_SRC_ID_RESERVED,
> +
> +    ACPI_GHES_ERROR_SOURCE_COUNT
>  };
>  
>  typedef struct AcpiGhesState {

