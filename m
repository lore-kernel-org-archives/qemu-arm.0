Received: by 2002:a17:504:959a:b0:1be9:327d:8ee3 with SMTP id e26csp789366njl;
        Wed, 2 Oct 2024 05:47:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYOI2tvJyh07T8mQ6hsNgdtsQWEhYdO3K23og9pRTXhME0ONiG6IdWHCu6PYllZDydBvHdyC4nqpYE9Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGi03ZRSvbgDo0xdMe9WQSfbkvC1GnPXN1NxWJ4pyPuu0hPl0hrUqCYwuaIYjGv31W8RL4a
X-Received: by 2002:a05:622a:4b14:b0:458:5fd0:964c with SMTP id d75a77b69052e-45d8055d084mr38134421cf.50.1727873224830;
        Wed, 02 Oct 2024 05:47:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1727873224; cv=none;
        d=google.com; s=arc-20240605;
        b=ForM/C0Pen5tvCxntWZPd8oOWiSuF0rxOX8CSypWvDaOS4UGHSNlldTo1ivJuyskgq
         4IUpt0wqPYTtqgKTvwIp2LKNHfRE77hnjvKr9GOSsiFwsvCYzIBXgma9HKXiafRbvSm5
         sxN3OP9JWOIMGNF1W2QWpx/y+IHYsF57MqJPqmuPlOlkADfmOoxa06ligKKkK9ad6P5A
         0R4r82dG10vVPZBoERiUsvaWGNYUlz59pclb2ncioU1FJfhQKVlM5Yd57Wl4UbRG3J3M
         SArD4SxS1GoawPRZ1aE0iIW0GZUxed8Bd9OjTMVwWlQQHRKIJbgIcmmSutr07xvt8+aW
         vfyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=DRd2IPTTLSDR0JY8la8Jnse8DqiuCfGZKtSPqIBVrXM=;
        fh=pcmAgoO78pb1CVyNN41pmcMd9k0ofkUa6i0ZZ2N18m0=;
        b=N/cR0JP86DatwAyxMinq90Qwra/Qc2BENY5Lgv1KouaUlyJj7wfGC5I8WzDRIMG7Ev
         5zHATrDSnmvyKc4ayVEOJPngaT/5c6ewCoPFPd8LGV96Rk8YEYds76fYu46fZeWDjaJl
         mmS0GzEMYxmeGLcxNIwaj43h/kQ2xZhAPA0vzro4ALMpdJ6RdRztJusgBLVqlzrpWKdG
         cEkUT/b9qOB+W1YmgTJyqbbkPqpXOdYrALhlI60VxSqEbxXpLpbdNDJq9JfHmRWrskzJ
         rXS5Ta6x9xUBKbnH2tYe9MVJd5t0iZj2Mu/4DfTXOFAii0GUxN2jbcba4/ITu1Ns/tUO
         5hOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MzLwmOU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45d8645f1fdsi10385611cf.231.2024.10.02.05.47.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2024 05:47:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MzLwmOU7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1svykf-00052R-1v; Wed, 02 Oct 2024 08:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1svykX-0004th-61
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 08:46:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1svykV-0002m2-8d
 for qemu-arm@nongnu.org; Wed, 02 Oct 2024 08:46:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727873194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DRd2IPTTLSDR0JY8la8Jnse8DqiuCfGZKtSPqIBVrXM=;
 b=MzLwmOU7bPTc5rA7/fLESHz/LA3zv/KskZ3HRLcaxUhTBNtmV4Ea6E+BR5AJCYKtt7hsZI
 3K/asLMO6DiVoTEzc4P8o7pEvzKZRavyoJftiNmwYembFU8P3IhTt3G9iSGHTN/gDHLpz7
 BNDJEvqK5WXQOr81lNxVqPpBefpI0uI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-izMsmD-NN0-TWFJgGlpWMw-1; Wed, 02 Oct 2024 08:46:33 -0400
X-MC-Unique: izMsmD-NN0-TWFJgGlpWMw-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-37ce063895cso1821844f8f.0
 for <qemu-arm@nongnu.org>; Wed, 02 Oct 2024 05:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727873192; x=1728477992;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DRd2IPTTLSDR0JY8la8Jnse8DqiuCfGZKtSPqIBVrXM=;
 b=m3sri9aHDirDyZOUTn4q1IIa7IUdpAXo7nf9fK3L7GK1qLQqxP7ieOSL4WSQf7ENgo
 cAXjjBy2HhfMXpLCYMhzcvk7Iq424ZW6DqKNgzeKW+uyWp253gh0Myp2b2Bdd1xiY/X1
 HEpkkVHQltA2r2e0QKdmYa+Fbyqb5ZJ6xcwzoy/R7r0PLsH9+mn/HmJWKODD07lVEUCs
 17d53TKKbeOxay6sjzp/HCMl3ALvzxRSBYsabCcEyz6a2+kyaRshY7SguWscUYPWZ7Wv
 oZmqHPuALC3fhGLROCtSzU0OuevRcFUhQu9B/BH8uCH2wSAFhRGrL3UwjelZc5CIbzr6
 eMlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCURxzQDdt5phlI7aDRpUkIwqx0ZOHlMPHrl7tlkyDivMpJYDA8kEa5lHUNaaw7V2OpxAlmKWj1XuA==@nongnu.org
X-Gm-Message-State: AOJu0YwcQVkDi5IUzJ9u76Fqbdt3l8G6wzFrPugFt55GTmHlRVRQDvJi
 d5ro10fBf1IbT/ys3B0c8D699zE5D9mGiM4UY2ib5MIQs5AV85e7t/dwvZHNz2/Jay2pA2+hwZR
 cQuJ3A0YbXOpAIL4dyp5nOwVNh04/MjLUSOIkKCag45WJW+sz1w==
X-Received: by 2002:a5d:6283:0:b0:374:c942:a6b4 with SMTP id
 ffacd0b85a97d-37cfb8b567bmr2019744f8f.20.1727873191656; 
 Wed, 02 Oct 2024 05:46:31 -0700 (PDT)
X-Received: by 2002:a5d:6283:0:b0:374:c942:a6b4 with SMTP id
 ffacd0b85a97d-37cfb8b567bmr2019732f8f.20.1727873191343; 
 Wed, 02 Oct 2024 05:46:31 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f79ff6e28sm17615235e9.37.2024.10.02.05.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Oct 2024 05:46:30 -0700 (PDT)
Date: Wed, 2 Oct 2024 14:46:30 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v2 12/15] acpi/ghes: don't crash QEMU if ghes GED is not
 found
Message-ID: <20241002144630.1f8b68c1@imammedo.users.ipa.redhat.com>
In-Reply-To: <18c69e8c7a6b6ac365397fe1f442f3ba0cb83be8.1727766088.git.mchehab+huawei@kernel.org>
References: <cover.1727766088.git.mchehab+huawei@kernel.org>
 <18c69e8c7a6b6ac365397fe1f442f3ba0cb83be8.1727766088.git.mchehab+huawei@kernel.org>
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
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zidPMUWJ2Kty

On Tue,  1 Oct 2024 09:03:49 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Instead, produce an error and continue working

s/^^^^/make error handling within ... consistent, i.e. instead abort just print a error in case ... /


> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 3af1cd16d4d7..209095f67e9a 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -418,7 +418,10 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>  
>      acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
>                                                         NULL));
> -    g_assert(acpi_ged_state);
> +    if (!acpi_ged_state) {
> +        error_setg(errp, "Can't find ACPI_GED object");
> +        return;
> +    }
>      ags = &acpi_ged_state->ghes_state;
>  
>      get_ghes_offsets(le64_to_cpu(ags->ghes_addr_le),

