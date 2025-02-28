Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp792515njb;
        Fri, 28 Feb 2025 01:36:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWMGe61s3OE5IGgSivUNK4q6KfT4qIaoIXbdI4WfAR/QCTsRCsMvQdrms0TyAh35SmIa8MM3S7X6+8ENw==@linaro.org
X-Google-Smtp-Source: AGHT+IEZgh1dVJnn1ZsGMnFe0TE+wKwuEd+n8uMFp0c5jQxpMlykKUQmEdDEzB60o/pWyOi06jhb
X-Received: by 2002:a05:6214:c4d:b0:6e6:69e4:825e with SMTP id 6a1803df08f44-6e8a0d97486mr48068936d6.21.1740735404535;
        Fri, 28 Feb 2025 01:36:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740735403; cv=none;
        d=google.com; s=arc-20240605;
        b=IvlsE5+nQQWl8Uc5irbtWsIzElhE/tf04QGdTKHCoebSj7+/MEAXMut1Q1pRc3T6Ja
         D4lch+OKpME+Ul/sSnZH/jx77CIglOqwtduq/nZs1rLISXTxKjlbJiLci9z7iXoGejTg
         lvZ4iiDGf4R81kxFy3vb6Rk8XNAzErJOQsUjvPFbcVX4LWXTg6ocwLNHK/iYobjD/INT
         cjE/m0ruFMoH77ZRr/WQsR2iSxN9t1urHC12jAjF+XBireWxLfV02VkqXQZ+js/BjAKt
         wIY3ZEWO7hqZhaec0mDEbAhEoNXwjYKMevQxa8InLy7d755TkDqjVcvdiXzSn4xCXV7P
         EmhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=x8k5TiU2IsESi7dp0HVWeskun3gK9D4CPiMDTRUx6NI=;
        fh=7rPA2xcvlJOrvWOa87eKq1HlmP4s+CaaJvZY6puHq4c=;
        b=UpUP5SNchWW3IcfJ2BOl0+7w63nIltM/vDydmRpPQAcNsUp5lgCubZDDEsJ8hZenDA
         xGlz8EVLh0N7GK0RXiVmXU2jJayVeBotZCet9kOD+ZsXkAAbuifA42C0BipsOEUr6TBf
         qlIKr/3l6ikPKUHToMx+jyCYsvwoGCNrMLDf7+x1lE+YS4HooB8/otfRzTtVqKbjZQLt
         JbTqalP1HRvjDmyXi7HFEMWbNy4bnlVOkVaukfwzTYpTLJORPdPMi0raWa6bJDn+Q8Ye
         4ftuqXoK0X7gt5n85Rcw1Cjo4ZXksMPujdcGBsrADWLcLV0rspWKv/oZXMQD/2z43XPD
         pxJQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8976c0bc7si28506186d6.212.2025.02.28.01.36.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Feb 2025 01:36:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnwnI-0005J3-TF; Fri, 28 Feb 2025 04:36:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwn7-0005H6-Lt; Fri, 28 Feb 2025 04:36:22 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tnwn5-0003yp-Re; Fri, 28 Feb 2025 04:36:21 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z43131C69z6M4fN;
 Fri, 28 Feb 2025 17:33:27 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 919A5140B55;
 Fri, 28 Feb 2025 17:36:16 +0800 (CST)
Received: from localhost (10.96.237.92) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 28 Feb
 2025 10:36:13 +0100
Date: Fri, 28 Feb 2025 17:36:08 +0800
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 18/19] docs: hest: add new "etc/acpi_table_hest_addr"
 and update workflow
Message-ID: <20250228173608.0000779c@huawei.com>
In-Reply-To: <445f7d41b01ffc5bd79d6fd83bc7c4c621bcbc85.1740671863.git.mchehab+huawei@kernel.org>
References: <cover.1740671863.git.mchehab+huawei@kernel.org>
 <445f7d41b01ffc5bd79d6fd83bc7c4c621bcbc85.1740671863.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.96.237.92]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JFluTK5QM8cm

On Thu, 27 Feb 2025 17:00:56 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> While the HEST layout didn't change, there are some internal
> changes related to how offsets are calculated and how memory error
> events are triggered.
> 
> Update specs to reflect such changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
One minor editorial suggestion. With that or similar tidy up,
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  docs/specs/acpi_hest_ghes.rst | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/specs/acpi_hest_ghes.rst b/docs/specs/acpi_hest_ghes.rst
> index c3e9f8d9a702..4311a9536b21 100644
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
> +    contains a GPA for the beginning of "etc/hardware_errors".
> +
> +    Newer versions place the location at "etc/acpi_table_hest_addr",
> +    pointing to the GPA of the HEST table.
> +
> +    Through that such GPA values, the firmware can send back the guest-side
This confuses me.
 Via those GPA values...? (maybe?)

> +    allocation addresses to QEMU. They contain a 8-byte entry. QEMU generates
> +    a single WRITE_POINTER command for the firmware. The firmware will write
> +    back the start address of either "etc/hardware_errors" or HEST table at
> +    the corresponding fw_cfg file.
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

