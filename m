Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp214269njb;
        Thu, 27 Feb 2025 05:21:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWv4aFsWKx5OxyzquXccDlp5r/AkuClu7+xKV7ppS2yQJyukEsnEYhecOTOCXaKELc297MvG0LF6yoEVg==@linaro.org
X-Google-Smtp-Source: AGHT+IF0TB+Uf+P737OV291TIy9QPT6d/smhBsZoaauOk3AEqQdkef/pFjnzYApdVRnMV9mbN4UV
X-Received: by 2002:a05:6214:48c:b0:6e6:5f08:e77d with SMTP id 6a1803df08f44-6e6b00e5e7amr339206586d6.19.1740662509494;
        Thu, 27 Feb 2025 05:21:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740662509; cv=none;
        d=google.com; s=arc-20240605;
        b=UdERY8VV5QzfgAgbYi+nGm/4IJR6m2BhyEl9xUC/q3q3pBn+bc03pnV+bwD2Bmj+gd
         tnH35NgTpJitqN6Td3pDkGL9+yQhOkXF1t5bdlG50mJe4obgQ4QbdEXgWmzWRJfuxdhz
         tWTbal8rxt1FotozYLB9ho4YHBsxX852cBMeVc37C3meF0/7IJEDerGlQ762a3o7HfEt
         G9s1nJTc9RMJbBp+CjGjFxZO0XrA6lHEVOwIzxsBt/bTgSdzizAG95gpF9dDxJ7KjO/R
         rf2TZHdmzSz3iN0eYiEn6IgMbl+DK5p81gSFUqB4JapOkT7yJNvB/6lRD2EpVlOD1lyV
         NKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=3g03yAf4l5F8h1WORiHCVOwuwaIh4if8iQdl0nCBRXg=;
        fh=37MmlOK1BudF9tRqwMuisrJ/+lgwmcALzLQVQ3gplRw=;
        b=LcIrEOHsVXadv6bhWFBW52lM4RTK6Db5IcVWyY4SK9BZRKgJn0ve2L59vY8hlTPEC2
         AVCs5gzX4PUlbrHHhW4hrJQIF7tcxepScfweK+SX99pSHyRmJf7/UpvqoHOXX/qTZv5p
         BE7KTeTlHp+gPEJPupjrkwXGKq1qFmaNxiKvGFkCz6PodKz4hQnIO5t93LxcVFNC1WJr
         rR+8Zi7VOT4ZRojsbCyAUE0Q7JbBYfbzkFRA1eQfMHzT+G1N5mxeri0i7ocAd6slHFER
         U//ob6s+mI73nf0D6NMRXsph8nkuw1RXIdxmDTeSCjANscBqWAMlIb7JOu1D725jj660
         cLHg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KvTC/sw4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976c08e3si12992106d6.235.2025.02.27.05.21.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 05:21:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="KvTC/sw4";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tndpN-0004CE-OL; Thu, 27 Feb 2025 08:21:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tndpK-0004Bk-Mn
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 08:21:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tndpI-00019y-Nk
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 08:21:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740662478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3g03yAf4l5F8h1WORiHCVOwuwaIh4if8iQdl0nCBRXg=;
 b=KvTC/sw45LuDJTSwidpZoj27Nd8e91Gvk70feyZs+ug7ViQkjwRiGw/CfUyczfad+Gkvlp
 kHfFos0cZsVDveZa1QqUeedXmevb1hvIM9fJdCWA9O1m562ipT1KgvHrVHp+0hlqkwvFS8
 8aMunLKwRlwaqyZl1gTy3aYJ3K7xXcE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-vTL6qB3sMVem4iv1iiNwKw-1; Thu, 27 Feb 2025 08:21:17 -0500
X-MC-Unique: vTL6qB3sMVem4iv1iiNwKw-1
X-Mimecast-MFC-AGG-ID: vTL6qB3sMVem4iv1iiNwKw_1740662476
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38f55ccb04bso575333f8f.3
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 05:21:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740662476; x=1741267276;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3g03yAf4l5F8h1WORiHCVOwuwaIh4if8iQdl0nCBRXg=;
 b=jYM1SdhJScL6Ji8BlbKx3O4ElkwR6mtt9Q3vkl73IMNCxR1N9u1tDHUdyjKTZppvqp
 25dex5iQqLJxlg1EFiNoWmGJSejM3aHsCIBBpZF//60tRn2l61tDlJBbCtEGXoadZVpT
 8MUDD1QIAIdBFm/njYZ7FCTVKIzkfYQ46jiaSSAvbl1XrDvF+mn5nnu1el4pf2+nztO+
 2p7zmuklPiJCDFyROr4NtLy3/U2pnWBJKXrUlJwVF3/c7y0Xc2cVkKapBCP6T2O+i/WT
 77Bke2VRpnjgH/X6fuFf1zYsPgP3pd5yCHrMTXiRWyFeYily3wMugtd5qZOBNhDFJb6D
 p2Zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhJcUb83Bz9+536i8CZADRKOif7ACcWbuhFWJ6qD7f6uGp5kIq/XkamW+cXvn2OwW1kZnbkjhKyA==@nongnu.org
X-Gm-Message-State: AOJu0YznR/HdcXXbE6Ywm2NJf+D5NBObjWhw6mKwrxjQ01PfH0At+tE3
 ecJ8fnjzoL6ubI+Y/NMulVhwun/tgGu+NuVo0VFxY+foI8OzavNDsJGZga0dgsDUkuHlRVKdhdh
 id4R8cvLfQmOHsd75DGWq9yYdlnAvciaD6da0CSxLIqx3YFlvPA==
X-Gm-Gg: ASbGncsopCcfPzARvNyrfImOE8jfL6xogQ79bN1MdiuZ5c+/dpIJ7SNEPchVLnggI8z
 kvjjZeosOindayG+sP9Ga56hHsWdEaPij+MRLH3izyLSI2Spi2qTLWACsRyFS8vgLPYQjoSARbz
 w+Lq64XHvsef+aGmwll8TAC53zk+DEVz5hgvaMHn4Oet4r/l3r6jJdhed9cGoCSmZrG/kTDHp4p
 0iLZwUkRdFi1JEnkgqydVfsfl1WoHbeIYYhAfzAc4o+R4Yy7xE2rKaXm4iAFEP5T79dbjUqyI4N
 py5kWWRDdmlJzsNl4RqLzkk7ZFXPO72YeKTl+bgcBEjnycrVLsDRn27NPaRhLtY=
X-Received: by 2002:a05:6000:1fa9:b0:38f:4fa6:bb24 with SMTP id
 ffacd0b85a97d-390d4f8b44bmr6722045f8f.39.1740662476240; 
 Thu, 27 Feb 2025 05:21:16 -0800 (PST)
X-Received: by 2002:a05:6000:1fa9:b0:38f:4fa6:bb24 with SMTP id
 ffacd0b85a97d-390d4f8b44bmr6721993f8f.39.1740662475792; 
 Thu, 27 Feb 2025 05:21:15 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390e47b7c43sm2009977f8f.49.2025.02.27.05.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 05:21:15 -0800 (PST)
Date: Thu, 27 Feb 2025 14:21:14 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Dongjiu Geng
 <gengdongjiu1@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 19/21] docs: hest: add new "etc/acpi_table_hest_addr"
 and update workflow
Message-ID: <20250227142114.350e4cd7@imammedo.users.ipa.redhat.com>
In-Reply-To: <205abbc22ce816d88aa6c1c7058607fe35aae1ea.1740653898.git.mchehab+huawei@kernel.org>
References: <cover.1740653898.git.mchehab+huawei@kernel.org>
 <205abbc22ce816d88aa6c1c7058607fe35aae1ea.1740653898.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HuPCxHbRP9K9wi36WZDrhmIzk0Zz61eG4RtbEo-rO1E_1740662476
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.438,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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
X-TUID: 6Fd3vrJLARmd

On Thu, 27 Feb 2025 12:03:49 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> While the HEST layout didn't change, there are some internal
> changes related to how offsets are calculated and how memory error
> events are triggered.
> 
> Update specs to reflect such changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  docs/specs/acpi_hest_ghes.rst | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
> index c3e9f8d9a702..f3cb3074b082 100644
> --- a/docs/specs/acpi_hest_ghes.rst
> +++ b/docs/specs/acpi_hest_ghes.rst
> @@ -89,12 +89,21 @@ Design Details
>      addresses in the "error_block_address" fields with a pointer to the
>      respective "Error Status Data Block" in the "etc/hardware_errors" blob.
>  
> -(8) QEMU defines a third and write-only fw_cfg blob which is called
> -    "etc/hardware_errors_addr". Through that blob, the firmware can send back
> -    the guest-side allocation addresses to QEMU. The "etc/hardware_errors_addr"
> -    blob contains a 8-byte entry. QEMU generates a single WRITE_POINTER command
> -    for the firmware. The firmware will write back the start address of
> -    "etc/hardware_errors" blob to the fw_cfg file "etc/hardware_errors_addr".
> +(8) QEMU defines a third and write-only fw_cfg blob to store the location
> +    where the error block offsets, read ack registers and CPER records are
> +    stored.
> +
> +    Up to QEMU 9.2, the location was at "etc/hardware_errors_addr", and
> +    contains an offset for the beginning of "etc/hardware_errors".
                   s/^^^^/GPA/

> +
> +    Newer versions place the location at "etc/acpi_table_hest_addr",
                            s/^^^^^^^^^^^/GPA or address/
> +    pointing to the beginning of the HEST table.
> +
> +    Through that such offsets, the firmware can send back the guest-side
       ^^^ see my previous s comment on that

> +    allocation addresses to QEMU. They contain a 8-byte entry. QEMU generates
> +    a single WRITE_POINTER command for the firmware. The firmware will write
> +    back the start address of either "etc/hardware_errors" or HEST table at
> +    the correspoinding address firmware.
                          ^^^^^^^^^^^^^^^^ what is it?
perhaps it should be "fwcfg file"?

>  
>  (9) When QEMU gets a SIGBUS from the kernel, QEMU writes CPER into corresponding
>      "Error Status Data Block", guest memory, and then injects platform specific
> @@ -105,8 +114,5 @@ Design Details
>       kernel, on receiving notification, guest APEI driver could read the CPER error
>       and take appropriate action.
>  
> -(11) kvm_arch_on_sigbus_vcpu() uses source_id as index in "etc/hardware_errors" to
> -     find out "Error Status Data Block" entry corresponding to error source. So supported
> -     source_id values should be assigned here and not be changed afterwards to make sure
> -     that guest will write error into expected "Error Status Data Block" even if guest was
> -     migrated to a newer QEMU.
> +(11) kvm_arch_on_sigbus_vcpu() report RAS errors via a SEA notifications,
> +     when a SIGBUS event is triggered.

