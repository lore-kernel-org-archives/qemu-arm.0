Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3614108njk;
        Tue, 3 Dec 2024 03:52:10 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUjJ1NUXmQCMUA5HNMZ1IUpE9baaX3aIy86HnspNvBk72VumyuE+OzoEnFCsz75HfDOy9/v5Eb1xolHSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGDMU7MERIgVxl9dRJlIF+NhzDIyU6vR5yPnxHTJBo7PfuabapgWpnsBF+mmNcmLVZEba1a
X-Received: by 2002:a05:620a:198c:b0:7b1:1236:f3d6 with SMTP id af79cd13be357-7b6a5d44a84mr303544085a.15.1733226730394;
        Tue, 03 Dec 2024 03:52:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733226730; cv=none;
        d=google.com; s=arc-20240605;
        b=FqHGvEXMef3xMcZt7hWHYLUmgLP+BJyExhV7tP8Wtgp42kTOpRMkqCuQ3b9ctGgEUp
         F4sigsBqMSM9FttlzrQmAnLOVbGV9mTextBYhuJb/B5hMV0LkVC67DPDaeq02tajp8w2
         XfBKxfzGWBnmsI5h9jw09tjMe2pT1vucypi+PBrcb6ySu9if6rPexb25I8uyoBMuzTRz
         tQMXr8SnRvN2oLswj4jdKVMOkrgM7uk4VXkwmp2i3EdwW8m7A5PHacEiXspkgbeWuxT/
         blJXa33433pD6S7yiiQ68BaI3mBgzgynwShvHobS3hvogCI7l3nL6dBzNu4cskoKH1sy
         4YTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=XQkSGIxzX3VxvHwHfMs8XnHAuI+Nji2BKn26CghMNBo=;
        fh=3qpzh4fl3npCOw6GfhsE3MR1DH/X7ZswU/vUqtA3LwA=;
        b=bPsZvLBmqVz3OjB293/8ans4bQmw2y2RKxDyT7UqHilSAejrrFSUtSChKT1XiCJtMx
         FeG3c/QiGCXyqKlS5gb4hEk8ioiG9DJqqNQEZi9z5nnlutBGHM65qbiWHLsgDtQc0zwT
         MpNZW3EF+N99Xyx+LQeBE4N9KE8nHm3cf5RRc9XQOzf2HwMlDWlgJpDP+DL4ofDDpT63
         QHpjsDG3SgSi9gUK4BCmOd/c6bAY08ot+0RbJJ4EmTEo2MGZ3Nv5Cxrqv4Sd1PaO2VFu
         gsfjoVRyGSny5gvn0BsQoWQ2qSTt5jSAkmobSLxI2lUjCqkui0SGvCj/ive3zKeDrP87
         KCIQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CDMAGZ8w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849e8f11si1341373285a.598.2024.12.03.03.52.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 03:52:10 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CDMAGZ8w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIRRg-00043w-9p; Tue, 03 Dec 2024 06:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tIRRY-00041R-3j
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 06:51:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tIRRV-0002ft-NI
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 06:51:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733226709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XQkSGIxzX3VxvHwHfMs8XnHAuI+Nji2BKn26CghMNBo=;
 b=CDMAGZ8wj1nFK3qadj1OICiiuPv8N8H/BwSUFI57h+6fmzdbUbkP+KReshs/CVXnpWx03i
 FATwh8bzhCdz31XpRRYn+2ELxjtlmrm1feajFomdwu+6YZQi+Qv7hvBjD5Ka6HVVrRLQXV
 U5/lx/F5QoGJxhs+4yECsnYB3KVXEcc=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-mzy-RtgbPrO9FsbOoHiHTA-1; Tue, 03 Dec 2024 06:51:46 -0500
X-MC-Unique: mzy-RtgbPrO9FsbOoHiHTA-1
X-Mimecast-MFC-AGG-ID: mzy-RtgbPrO9FsbOoHiHTA
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385e49efd59so1423682f8f.0
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 03:51:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733226705; x=1733831505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQkSGIxzX3VxvHwHfMs8XnHAuI+Nji2BKn26CghMNBo=;
 b=jgKJdLbZW/Z6LJTkLO2iVdD9FLQXhgslHAlGtZfJNKfiZ1dDw7ImE0JkHGAxMGO+kc
 5ENj97p4AJX0ftNf4eZ+ww7cYhaVRdZrgTZv361emGsObhWOb2a2VHmNEXxAZ1zgF6kA
 kkGw1mIxn4Pg6yv8W6N1diw7Y3dR19/76r2t4zQ7efDlFRJO7GmTMQJmZEt32hX+G0Er
 TnOwpOHHGbX0KIOSlzzbdsb734II89KZD3RHmiAy8w88snJU7tpfJ/K92cVqS0mXMeah
 yli2cXd6XcVlK8+Y3CSEdcqru8AkZRVBjLmUvIbNOTmz2TYfWRGy3h9uiumgJp6ZvT3z
 H9PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU2JBfwYNiu1f6nTNvjkRG/wnX+2r/igUxv/XWmU8kPlAekiY6VuFkLnGc1sey/eYnXDtN5TZgk6g==@nongnu.org
X-Gm-Message-State: AOJu0YwfEdHwQnTK6+gi0pqXebLIv/txtYdWQemi5PwKQMGB3r6ny1nw
 4P30JkfDpsTrWB0wOgJbxOemdoYvSMIafYU2ji5KN1FykfkwaybD9PJEoN4Ol04Zp5gVUluNKWu
 3dpSKxE6sMUIVSW7ruGWsEipl1fZgFTTMLNDyU4xYZxjd6uNpeg==
X-Gm-Gg: ASbGncsRzqR2gNJLfnJMYTGOiUOowEpFGEI/tUBsPfTZ24fgT6WmOSPAqOM0ansxjem
 uFLgbghVQDDWWhHm+kkGtWevE7fgC5i0akF5m0NBm0OE5MV8ZubcDP3JHHHeWb3O23ADuDW9IfS
 lvF3T/HJsCo4MKcy8aUwuSHJnL0/FyzTreUWYoltTj1sfXd7SU58bkpOk8lHaBLpKpTwigugGvJ
 7BnMEbxs7YeiYP1T949OQckk5xx7sDKzN7UmMZoSDuNeOV/8aAIRqx/w5Ld+aedbW4ZP6joCm2L
 qeQz38SRGv3GGtW1sAMupg==
X-Received: by 2002:a05:6000:154a:b0:385:e889:4270 with SMTP id
 ffacd0b85a97d-385fd4365c1mr1756241f8f.56.1733226704796; 
 Tue, 03 Dec 2024 03:51:44 -0800 (PST)
X-Received: by 2002:a05:6000:154a:b0:385:e889:4270 with SMTP id
 ffacd0b85a97d-385fd4365c1mr1756218f8f.56.1733226704383; 
 Tue, 03 Dec 2024 03:51:44 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e3c21ba7sm9704995f8f.53.2024.12.03.03.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 03:51:43 -0800 (PST)
Date: Tue, 3 Dec 2024 12:51:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v4 13/15] acpi/ghes: move offset calculus to a separate
 function
Message-ID: <20241203125143.7171892a@imammedo.users.ipa.redhat.com>
In-Reply-To: <e5661a6383449675b28e15c8479ebca42c939368.1732266152.git.mchehab+huawei@kernel.org>
References: <cover.1732266152.git.mchehab+huawei@kernel.org>
 <e5661a6383449675b28e15c8479ebca42c939368.1732266152.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _Mt9TvEVY2HQURRfrzVVrilMKDlr2o3aaHMYBRRwM1g_1733226705
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
X-TUID: tJuUA5dbgdv5

On Fri, 22 Nov 2024 10:11:30 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Currently, CPER address location is calculated as an offset of
> the hardware_errors table. It is also badly named, as the
> offset actually used is the address where the CPER data starts,
> and not the beginning of the error source.
> 
> Move the logic which calculates such offset to a separate
> function, in preparation for a patch that will be changing the
> logic to calculate it from the HEST table.
> 
> While here, properly name the variable which stores the cper
> address.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/acpi/ghes.c | 41 ++++++++++++++++++++++++++++++++---------
>  1 file changed, 32 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 87fd3feedd2a..d99697b20164 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -364,10 +364,37 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      ags->present = true;
>  }
>  
> +static void get_hw_error_offsets(uint64_t ghes_addr,
> +                                 uint64_t *cper_addr,
> +                                 uint64_t *read_ack_register_addr)
> +{


> +    if (!ghes_addr) {
> +        return;
> +    }

why do we need this check?

> +
> +    /*
> +     * non-HEST version supports only one source, so no need to change
> +     * the start offset based on the source ID. Also, we can't validate
> +     * the source ID, as it is stored inside the HEST table.
> +     */
> +
> +    cpu_physical_memory_read(ghes_addr, cper_addr,
> +                             sizeof(*cper_addr));
> +
> +    *cper_addr = le64_to_cpu(*cper_addr);
        1st bits flip, and then see later

> +
> +    /*
> +     * As the current version supports only one source, the ack offset is
> +     * just sizeof(uint64_t).
> +     */
> +    *read_ack_register_addr = ghes_addr +
> +			      ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> +}
> +
>  void ghes_record_cper_errors(const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
> -    uint64_t error_block_addr, read_ack_register_addr, read_ack_register = 0;
> +    uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;

if get_hw_error_offsets() isn't supposed to fail, then we do not need to initialize
above. So this hunk doesn't belong to this patch.

>      uint64_t start_addr;
>      AcpiGedState *acpi_ged_state;
>      AcpiGhesState *ags;
> @@ -389,18 +416,14 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>  
>      start_addr += source_id * sizeof(uint64_t);
>  
> -    cpu_physical_memory_read(start_addr, &error_block_addr,
> -                             sizeof(error_block_addr));
> +    get_hw_error_offsets(start_addr, &cper_addr, &read_ack_register_addr);
>  
> -    error_block_addr = le64_to_cpu(error_block_addr);
> -    if (!error_block_addr) {
> +    cper_addr = le64_to_cpu(cper_addr);
                   ^^^^ 2nd bits flip turning it back to guest byte order again

suggest to keep only one of them in get_hw_error_offsets()

> +    if (!cper_addr) {
>          error_setg(errp, "can not find Generic Error Status Block");
>          return;
>      }
>  
> -    read_ack_register_addr = start_addr +
> -                             ACPI_GHES_ERROR_SOURCE_COUNT * sizeof(uint64_t);
> -
>      cpu_physical_memory_read(read_ack_register_addr,
>                               &read_ack_register, sizeof(read_ack_register));
>  
> @@ -421,7 +444,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>          &read_ack_register, sizeof(uint64_t));
>  
>      /* Write the generic error data entry into guest memory */
> -    cpu_physical_memory_write(error_block_addr, cper, len);
> +    cpu_physical_memory_write(cper_addr, cper, len);
>  
>      return;
>  }

