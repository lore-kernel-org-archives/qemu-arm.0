Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp1179648njc;
        Fri, 14 Feb 2025 01:54:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWRbEMq+yxrnC22ZPcpQvIkJHdvvn5ZxXYMhkDLg4LT1nEcqu3F6i4d7ZbtkCCOGJYxifp2GzaW71TDbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IESAd3bY+ZGEmBXdlwYvV1Wvaf/HS2A2/O2xeDR0Julw3xbPUMBfG/uO3yC+fEzVBcem5s1
X-Received: by 2002:a05:620a:4805:b0:7c0:6563:3674 with SMTP id af79cd13be357-7c06fcd99b0mr1732814285a.58.1739526867703;
        Fri, 14 Feb 2025 01:54:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739526867; cv=none;
        d=google.com; s=arc-20240605;
        b=I4XNg6nOY3SFXixC6eRFvfVNbncaWsZ4Mqahoz/ccUC3f246LTQSIGTzAOOeKIlK/C
         G5NI0VdrYd44BW8tPhUWpsgILwRHLnZZdwAFYtn/KKbI6XBMLFeNM14qUoGapjesVgff
         JAf88hRZKHKAuL4Sy+lg+bNp+eL8CRHFzQ4lFj2aLh1G/F3acMYh2UWU36MEZYud5FpR
         rmzq8pWfvvsibMLZxOqwcuzyRXpLxnewJqWTFCN8beJowjhuN86YN7d2ONJRfyc0vBLI
         bZLBlF37n5PY7hN80Uud2UW7clfXzN88acN0lyQFntN/VLivErCj12+V1wUjQHNX/vsn
         ytjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:date;
        bh=53FmKZULxoQcPry/mB1cPZTl/If8F8YdkkgBmkSmmdo=;
        fh=+Gn7RQfbvwrMCtaqcQOuEUOtmtO8a6rtmsDzsu042WY=;
        b=T7j/CS0DjQI9f4MCk51q8gJf1wKogq7YwRYLfWL0541av7l5Uhw6U2z+zi7cSrPrBC
         RlHkKPmiAOL6TCq1jO2gixMlAaKPLhcsIQgrSXQv24KGd0W8BqUE9OkwhNwhqAcVjzu2
         zdY1zLQWbd6nSdIFWpfXj7PM++n/w26syoWI6+SPvNqKgiQP90GnE/F+why5Y793FUuT
         VmOYVkk5gGeq0nYVhaK1lhiVIA/3YwMkr3e84X/yMBwbgAOdNdniJWTuvswIFhAl8Y7k
         TK1aDXF+TbkijzOLjVc3qWTKvQunaSuYc8wC+TZItJuy0JUIeZMoczYXD03WQ5I4nt8H
         bejA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c622a85si308419785a.59.2025.02.14.01.54.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Feb 2025 01:54:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tisOp-0008N7-R1; Fri, 14 Feb 2025 04:54:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tisOj-0008Mb-2k; Fri, 14 Feb 2025 04:54:14 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1tisOd-0003fd-UH; Fri, 14 Feb 2025 04:54:10 -0500
Received: from mail.maildlp.com (unknown [172.18.186.216])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YvS4G4LgYz6M4Zs;
 Fri, 14 Feb 2025 17:51:26 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
 by mail.maildlp.com (Postfix) with ESMTPS id A28C6140A78;
 Fri, 14 Feb 2025 17:53:54 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 14 Feb
 2025 10:53:54 +0100
Date: Fri, 14 Feb 2025 09:53:53 +0000
To: Gavin Shan <gshan@redhat.com>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <mst@redhat.com>,
 <imammedo@redhat.com>, <anisinha@redhat.com>, <gengdongjiu1@gmail.com>,
 <peter.maydell@linaro.org>, <pbonzini@redhat.com>, <shan.gavin@gmail.com>,
 "Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 0/4] target/arm: Improvement on memory error handling
Message-ID: <20250214095353.00007afc@huawei.com>
In-Reply-To: <20250214041635.608012-1-gshan@redhat.com>
References: <20250214041635.608012-1-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
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
X-TUID: fT4nXkqb82n2

On Fri, 14 Feb 2025 14:16:31 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Currently, there is only one CPER buffer (entry), meaning only one
> memory error can be reported. In extreme case, multiple memory errors
> can be raised on different vCPUs. For example, a singile memory error
> on a 64KB page of the host can results in 16 memory errors to 4KB
> pages of the guest. Unfortunately, the virtual machine is simply aborted
> by multiple concurrent memory errors, as the following call trace shows.
> A SEA exception is injected to the guest so that the CPER buffer can
> be claimed if the error is successfully pushed by acpi_ghes_memory_errors(),
> Otherwise, abort() is triggered to crash the virtual machine.
> 
>   kvm_vcpu_thread_fn
>     kvm_cpu_exec
>       kvm_arch_on_sigbus_vcpu
>         kvm_cpu_synchronize_state
>         acpi_ghes_memory_errors         (a)
>         kvm_inject_arm_sea | abort
> 
> It's arguably to crash the virtual machine in this case. The better
> behaviour would be to retry on pushing the memory errors, to keep the
> virtual machine alive so that the administrator has chance to chime
> in, for example to dump the important data with luck. This series
> adds one more parameter to acpi_ghes_memory_errors() so that it will
> be tried to push the memory error until it succeeds.

Hi Gavin,

+CC Mauro given:
https://lore.kernel.org/all/cover.1738345063.git.mchehab+huawei@kernel.org/

is more or less reviewed subject to some requested patch reordering and
whilst I haven't checked, seems unlikely that there won't be a
clash with this series (might just be some fuzz)

Jonathan



> 
> Gavin Shan (4):
>   acpi/ghes: Make ghes_record_cper_errors() static
>   acpi/ghes: Use error_report() in ghes_record_cper_errors()
>   acpi/ghes: Allow retry to write CPER errors
>   target/arm: Retry pushing CPER error if necessary
> 
>  hw/acpi/ghes-stub.c    |  3 ++-
>  hw/acpi/ghes.c         | 45 +++++++++++++++++++++---------------------
>  include/hw/acpi/ghes.h |  5 ++---
>  target/arm/kvm.c       | 31 +++++++++++++++++++++++------
>  4 files changed, 51 insertions(+), 33 deletions(-)
> 

