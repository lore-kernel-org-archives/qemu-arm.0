Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp2232506njb;
        Tue, 30 Jul 2024 01:40:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWl7R8nWGVPJDINfSgiSu6H2WECjQf8A8t1dMRE/kU4n/DrhMDGvUEVTae6AvC9xUuNf5wEYZLAyQpMv7KicLsxr4KfycrL
X-Google-Smtp-Source: AGHT+IE4/gbeK0KcEtmPpDm80WNyvFJpWXlSjFRXPNNcsATyiDGGRIAEL9biNwTji24u9ouut5FX
X-Received: by 2002:a05:6102:38d4:b0:48f:e9df:ec52 with SMTP id ada2fe7eead31-493fad17f7emr13246038137.20.1722328844207;
        Tue, 30 Jul 2024 01:40:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722328844; cv=none;
        d=google.com; s=arc-20160816;
        b=H9wg6i93KuEN0JfbFfKeCyFJeMz+3UEy4YMxnVOonr0vYTdzFNz8LE/8Q6OYjK9V57
         OdapjVeevsbZ1J2lST3O+LQ2wfbbwNLrkRSA+924JJboragJUWZibY7kBR2n+UH7VPpu
         XT2XUCU/7jJmi7UI6tZMRcCYOnnjAh1t48oismjg51RsVAd9YyRhUNMqkf6LOIgb9Fv7
         1Md7h71WtX4P4ktL7W3MClqIO12IpR0DQUoLhprmF7bF0ISOTshZsgkxMtaBmpa4woH5
         iabC4YAy0dKDEpXs6cR+aheBq/RMvZ/Pl3Cdc33NhGJ8CKcSfxsBNm0594CGN794yLnk
         i/LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=Bx38A0XpDP06oxe3bl+pZoWbefbgYUyRCc/BaKj6xL4=;
        fh=LzwOj0CfkEcH+FgGBQVbAKhVUgH3NZn2KYDv98Xaw04=;
        b=hv/rzpqhOSR8xNC60ESjShQh9H1OhZoTwSfap6+cDz+4kA58d8qBM+UwnkY8AVuMN+
         i26Hph1yRtTiWnvtxkLb6Ck8XOmX5BxilhmRktiAlC3290R3EQOc38u94MbNyJMWCQ26
         Qs3eEkBz/YY1cZIu/2Y3SfWwb/RwuqD5j2Q0nAGf+OVZjN8mXxGGnQxTpbQpvJA0O8mf
         MhJJ5Rugf8GY9rKvLEXWstaSHwUnyvIjYiZccMZxKYJDlNGhbuHIfVHD1xymkylwXost
         zGjAkWZHWrPPy/oe8EtkxTW07LWmhwFfaPXqEuQmf3MWQwbLyOBBO+tDaZ+5IdVjNE74
         WffQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YKxZKtve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a1d7446279si1257866685a.297.2024.07.30.01.40.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 01:40:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=YKxZKtve;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYiPO-0005FI-TH; Tue, 30 Jul 2024 04:40:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sYiPL-0004xi-PP
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 04:40:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sYiPK-0006m7-7G
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 04:40:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1722328833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bx38A0XpDP06oxe3bl+pZoWbefbgYUyRCc/BaKj6xL4=;
 b=YKxZKtveXy+8Q7U1C2InZJJ7tZLf2BiBGdgfdL3CZdOg8DZ0gBdZAbilfDIIIbimgC3uTj
 5n/XQkHw1EnOnky5eLfOvmYGlQ/HFwAcT20JBdMUiXLT3Ze++aOmUBjNgmfX5ah2aPEncD
 4YGdygG8C420jros6LcsD9TpEBh5phs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-218-ScgyxmvCO62RfHd90fTyOg-1; Tue, 30 Jul 2024 04:40:31 -0400
X-MC-Unique: ScgyxmvCO62RfHd90fTyOg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-427ffa0c9c7so34833195e9.1
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 01:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722328830; x=1722933630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bx38A0XpDP06oxe3bl+pZoWbefbgYUyRCc/BaKj6xL4=;
 b=Qri+vudGqOXtis2l1daPi/wp6g5EmLUtJpo6QFRPAqwHrHW/jBCTSGBXvWEbkO00Ge
 2VKyUmWm6644GvsUgjLvcWprlw/nus1sDzQwi5IjObS89N/r95oLGKBe7nTY9aRry8uJ
 m7djfTWAvNMEpJNGjo3JSnesxyj50aTpKIGoVSW/GWK20G+AVJwOwUDOa3I7tiIHx9p7
 dk5vW6+Xjh3NNPN+YkzCmnF5cUUPDGNXk2pNLXlS4l2kajNkKlxZ0CDMpoBpuffXDpsU
 dqe6fRtrlXYYDQZznJIKsySbojlN4Kob1xkyc88cRWe2Rq5xkHam+QvLKGfJvk3YqRf2
 5Yww==
X-Forwarded-Encrypted: i=1;
 AJvYcCWl5WXLnEBHlaWpNbjpbYV2DbE8+ZOMfDNfyLQVJaIVz18ElfFf1ufRNG1Nv929i4AIOqp1WMJiPy8YmA5csM/V293W
X-Gm-Message-State: AOJu0Yy527H+ad0eD477R2zjOWeug6rsp4uI70+63EqfbZb3YZnyrFsB
 Vs4dWEKZj64psh+s+r+dhS9Z4tg6Xq4EtV+qv1bG0Inmj/fzej9xc3LwiFc5hl00QDGBEaywGLR
 4l9hmOZKyfuwv49v6sT3viXJyiK7Z5IU6AvszaTCkmlSOn7w+Tg==
X-Received: by 2002:a05:600c:310e:b0:428:15b0:c8dd with SMTP id
 5b1f17b1804b1-42815b0cb56mr77206185e9.20.1722328829630; 
 Tue, 30 Jul 2024 01:40:29 -0700 (PDT)
X-Received: by 2002:a05:600c:310e:b0:428:15b0:c8dd with SMTP id
 5b1f17b1804b1-42815b0cb56mr77205935e9.20.1722328829115; 
 Tue, 30 Jul 2024 01:40:29 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4280fa9a30csm136438785e9.30.2024.07.30.01.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 01:40:28 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:40:28 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v3 3/7] acpi/ghes: Support GPIO error source.
Message-ID: <20240730104028.4f503d91@imammedo.users.ipa.redhat.com>
In-Reply-To: <64a31a09fe6b11bebad1c592ad20071a9d93fee5.1721630625.git.mchehab+huawei@kernel.org>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
 <64a31a09fe6b11bebad1c592ad20071a9d93fee5.1721630625.git.mchehab+huawei@kernel.org>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.125,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-TUID: mXws2iF6mUGR

On Mon, 22 Jul 2024 08:45:55 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> 
> Add error notification to GHES v2 using the GPIO source.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c         | 8 ++++++--
>  include/hw/acpi/ghes.h | 1 +
>  2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index e9511d9b8f71..5b8bc6eeb437 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -34,8 +34,8 @@
>  /* The max size in bytes for one error block */
>  #define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
>  
> -/* Now only support ARMv8 SEA notification type error source */
> -#define ACPI_GHES_ERROR_SOURCE_COUNT        1
> +/* Support ARMv8 SEA notification type error source and GPIO interrupt. */
> +#define ACPI_GHES_ERROR_SOURCE_COUNT        2
>  
>  /* Generic Hardware Error Source version 2 */
>  #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
> @@ -327,6 +327,9 @@ static void build_ghes_v2(GArray *table_data, int source_id, BIOSLinker *linker)
>           */
>          build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_SEA);
>          break;
> +    case ACPI_HEST_SRC_ID_GPIO:
> +        build_ghes_hw_error_notification(table_data, ACPI_GHES_NOTIFY_GPIO);
> +        break;
>      default:
>          error_report("Not support this error source");
>          abort();
> @@ -370,6 +373,7 @@ void acpi_build_hest(GArray *table_data, BIOSLinker *linker,
>      /* Error Source Count */
>      build_append_int_noprefix(table_data, ACPI_GHES_ERROR_SOURCE_COUNT, 4);
>      build_ghes_v2(table_data, ACPI_HEST_SRC_ID_SEA, linker);
> +    build_ghes_v2(table_data, ACPI_HEST_SRC_ID_GPIO, linker);
>  
>      acpi_table_end(linker, &table);
>  }
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 674f6958e905..4f1ab1a73a06 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -58,6 +58,7 @@ enum AcpiGhesNotifyType {
>  
>  enum {
>      ACPI_HEST_SRC_ID_SEA = 0,
> +    ACPI_HEST_SRC_ID_GPIO = 1,
is it defined by some spec, or just a made up number?

>      /* future ids go here */
>      ACPI_HEST_SRC_ID_RESERVED,
>  };

