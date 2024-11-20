Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3979668njc;
        Wed, 20 Nov 2024 06:25:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVkZf/uU09XvKOomjW22d9xPDSrWp8mg2N4vMGwZuAcdLfpmGYmCx7AHH4621gtR4qVm6B//wWDrV3ueg==@linaro.org
X-Google-Smtp-Source: AGHT+IHGkSqw2X19RQl5k7OXd8fqusGHe2u6sgLTDD2nJJ9d2vWI8VKCtNAeGyMuV5GtLcjY4WJC
X-Received: by 2002:ac8:5e4a:0:b0:463:64b2:2e0c with SMTP id d75a77b69052e-4647965fc2emr27183021cf.42.1732112704701;
        Wed, 20 Nov 2024 06:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732112704; cv=none;
        d=google.com; s=arc-20240605;
        b=OVBmsBhEOUcJsQWFj3hVAoCM3HRqk2OCk5mQHvkM+v3RvdKTDNfY+o5XRuFf+T1PEw
         lDoLuTw+Wg5xfIFL5Cidv2R5Wa0NI2YtXx236duPxzM38b5BZkoQbIVFL3zOomGx/26q
         aKIctlUBy0xJRzuSQNWau/Q3aGGZoyVRdcCN1kI4th0pFgyWA2fxgCspms7lKBku3lT1
         U5Q0f/am7aeo1uo5LEo2+0NdQglMrVGDnvwi/5W1HQ9tVJf8JrFb5/VNoArs1fauthJA
         TFCAZSPyFtft+5kouTwS6IIpmpvnVzEw2gs0vsUeoiKBIaLUw7qCIuufLfXAfa7quS2H
         74oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=+FvfECyHYO67lellTLy07Ieob93F/v89untpuQ47zxw=;
        fh=sk20niJjP+LyGcAC6rY5I61AlgNCIPpR6UIhxIWLYTI=;
        b=AU3i1oSWXHtWPSa+LU3oZUbkbHyJP6pAZGHXPWQNE+DtSpTJA13w2ws7CxmPG1q19K
         r//Fxo009jSQenofQ0cxVu84GW1C7blO+yuyBCuplvDGseHpWYgxRQo1MVgzEHf4qBHm
         ln1gYko1iJLV8pGdLpYp8M3qKbEW4eLx+NPjTO9o32hnWvvsr3pxwarsQl+3rciqYvBl
         9/Kb8rrFzjpGyXYXlq0bBhtkyQP+/o8sSkqZV/sOfjeboRNg1ANaq8FVnQ5PMeSrlbhV
         j6E6iTBF7o04Zn8rpfUk4QjABxHrVQSotQxfBfEGNAF4NqnkaflVwp1zDptg8s3O1+Db
         ZDxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4646a63fcdasi18745771cf.561.2024.11.20.06.25.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 Nov 2024 06:25:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tDldd-0003Lw-Lm; Wed, 20 Nov 2024 09:25:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tDldc-0003LQ-4X; Wed, 20 Nov 2024 09:25:00 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tDlda-0001JO-Jm; Wed, 20 Nov 2024 09:24:59 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xtk7T0qzJz67mSm;
 Wed, 20 Nov 2024 22:21:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id 9AD8B140AB8;
 Wed, 20 Nov 2024 22:24:56 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 20 Nov
 2024 15:24:56 +0100
Date: Wed, 20 Nov 2024 14:24:54 +0000
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>, <linux-kernel@vger.kernel.org>,
 <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 14/15] acpi/ghes: Change ghes fill logic to work with
 only one source
Message-ID: <20241120142454.000020f5@huawei.com>
In-Reply-To: <3cf3d0f0253faf8d2497175e8473431d8ef25810.1731406254.git.mchehab+huawei@kernel.org>
References: <cover.1731406254.git.mchehab+huawei@kernel.org>
 <3cf3d0f0253faf8d2497175e8473431d8ef25810.1731406254.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: g8XcGu7+rrFU

On Tue, 12 Nov 2024 11:14:58 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Extending to multiple sources require a BIOS pointer to the
> beginning of the HEST table, which in turn requires a backward-compatible
> code.
> 
> So, the current code supports only one source. Ensure that and simplify
> the code.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
One trivial comment.
Otherwise LGTM

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---

>  void ghes_record_cper_errors(const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
>      uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
> -    uint64_t start_addr;
>      AcpiGedState *acpi_ged_state;
>      AcpiGhesState *ags;
>  
> @@ -418,11 +416,8 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      }
>      ags = &acpi_ged_state->ghes_state;
>  
> -    start_addr = le64_to_cpu(ags->hw_error_le);
> -
> -    start_addr += source_id * sizeof(uint64_t);
> -
> -    get_ghes_offsets(start_addr, &cper_addr, &read_ack_register_addr);
> +    assert(ACPI_GHES_ERROR_SOURCE_COUNT == 1);
> +    get_ghes_offsets(le64_to_cpu(ags->hw_error_le), &cper_addr, &read_ack_register_addr);

Long line. I'd break it.

>  
>      cper_addr = le64_to_cpu(cper_addr);
>      if (!cper_addr) {

