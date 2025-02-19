Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1522494njb;
        Wed, 19 Feb 2025 09:55:53 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU26KaifDWd9BQwN3LeiIUEvxncrMpKfUniGVzLPEKQz3OV1sdvUPeKlEuM/WGogJowUnhfi4cyvpWvHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF8Qv5ijg9xNXD00GE7Z9JI7pOsD66QOpCBnwv155/5bTihiREnY3IqFcb+mHkrWZ2yJ6l1
X-Received: by 2002:a05:622a:ce:b0:471:8cc6:50e3 with SMTP id d75a77b69052e-471dbea432bmr229264811cf.52.1739987753593;
        Wed, 19 Feb 2025 09:55:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739987753; cv=none;
        d=google.com; s=arc-20240605;
        b=HbUg0WXIRft45fHokDIH43OA3yab1jgooPbiUlkZmtzrZi3eDoUC2uUDLQjGJ1mAh5
         Vyv2IHBWWj+4GILcwcyKuKuL++teU7orT4VEU3A84cvJXd1iLxVjJ/SsJUaxHA5VaHHs
         SF2Efmsd96CZPDCn0lLZlZrBVdDCIsBzdLQHJTXVSRacIH8JklkW6Y6L6XaCnAJAsnqq
         0NcwCN5o+U5KwTZc91PdKRe8VnL9y6zJzoMaIA8uMwIW8l19ej0iVTZOKycMU4HFhsMW
         R5OsOB1cSCTveQh7CeUFHWn9z0WAdcxt+aMpNLcsIERo3YfC5fT92qyBIM4Ks3Iozh0v
         t5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=ja272GOSac81WNMuQ/dxI36+9cjnhmMdrmPs6R3fh9w=;
        fh=+Nf3XwFsQgrgwg75DuZAbzqjFbtoSgdE8gWVjtZi2lw=;
        b=SV3rPkUPGqaTlmuJCfkKCKUYSAvafbJ0sNHmXJ1tPYTXWT0Q2meSw+TXBjlMZeYHub
         zsDR1oD5R6M6mUrYLpdryN3Pteo+YZdn3OpZrBg+CcbN2WFhNYAXQwd4WH9wxm/cQ0MP
         kOBLAwZMXwZIlcUGK1JDAf/JRbqRKd1QUfI/lKhDAd866qxmSrOk1ZyKSmpBI3bBcqOt
         4vSLAAqta/aABdpyOIPTYjmsWtGIzhWPx6c1CnjTyfooC1ShcBGiT3JtyiIMxY3pUN81
         Ycr9CYpQPJt6a6YOXs1C/Dv/763Ts8+KTA4KCEagwloFfIlomOPXSPQUPCy1VFuRlYZx
         HQbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cMGNKznB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471fc92b98csi44797981cf.650.2025.02.19.09.55.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 19 Feb 2025 09:55:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cMGNKznB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tkoIH-0007U6-J3; Wed, 19 Feb 2025 12:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tkoIB-0007TZ-Q0
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 12:55:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tkoI9-0001IE-AV
 for qemu-arm@nongnu.org; Wed, 19 Feb 2025 12:55:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739987723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ja272GOSac81WNMuQ/dxI36+9cjnhmMdrmPs6R3fh9w=;
 b=cMGNKznB8rhzZRLhOUqo1LAJW9PpOG6OghIw2AsLSxDApfph5Ck58SXBha4b1HompeEbQZ
 aYRqTHR3Za7gwt6i8cvJ7v8hMyuhjUTx3OHmPPKedTvLWLie6/2lCVlIpv4LZl3+Mt3NJr
 wZziiWhd+EAwDcH57wEszyK3fWZUsx4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-pVhOgMUbMc2Q6eWVVcue_Q-1; Wed, 19 Feb 2025 12:55:22 -0500
X-MC-Unique: pVhOgMUbMc2Q6eWVVcue_Q-1
X-Mimecast-MFC-AGG-ID: pVhOgMUbMc2Q6eWVVcue_Q_1739987721
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4399d2a1331so448005e9.1
 for <qemu-arm@nongnu.org>; Wed, 19 Feb 2025 09:55:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739987721; x=1740592521;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ja272GOSac81WNMuQ/dxI36+9cjnhmMdrmPs6R3fh9w=;
 b=Pf47plEFtnDWgkTAiyXjRiZ2FDCCrFSnFnCl059ebaTUqUF4l/PXtCZ6tC8+k2i/ah
 iR4Qcu7GeDmulz2CfH/3AUIbwGUe/g/y+ohpWryrKSIFZXt7iqKGGaW4irBpKJhiWuHF
 Our68Zwj6mwMYMbLI70NopqX7btu6hG99jn13we4+BdBlHaX5huCrGXk41OcqSKWFKIR
 prJmv85o/qqDaq7WzL7ppi/c6vQQy3pXfsXsMmryG5ipmBX+dEpkeJbEvhz4oSXQ/iPc
 LokkhB0msd/YqhhHdzDjLYS7+TF/PraH6o90x9Cyw1uwFu52v7lRox7vRPUI0zn07Aoe
 qYjg==
X-Gm-Message-State: AOJu0YzFldcz/r08u4LEifyzpe50vVxzNujh5lTOCGTcLAkRQbh58bAz
 6lOpuRKbIUlBqjC4EXLHEvzjEoSLbo9Cn+bonbN6uuiX5YMaHR3nM12u5IcMC7qZ7r8usHRmtXv
 1yfjHZ55CG+UDzv4LhtXY8b5H/EPYk5aJ836MMax72Hb0906gQw==
X-Gm-Gg: ASbGncsB81kE8QdbZhUXcP6NEtsFL+QVoELPRGO1/1lgTkdWoqmiMCKS/+gN5+lraov
 3gTpSyKiwO+PQOsZ/9sbEYZZU7VTF5clne1GxjCOfG3Bm2iiTSzbskBKbTR2ndHUF9BnCYe8kR8
 ik0+040fxuxJoal8t8gtKTCgG13exTzDRjqUP3TH66AU9pLwqrzUNOzgibkAjveUn0CLnsYVldO
 y+FXcEPHbVzs23hp1GbitnfjsvDlmO5yg4cS3R/uxEhZ+jlzagzRMwweOCHQNN1okmFtFe5qfwO
 SgXV3vdW4VJgEioCmzxhXsW3J+wsv/hXEJBzX42y0CcjQN+NlZTw
X-Received: by 2002:a05:600c:1c9d:b0:439:968b:6669 with SMTP id
 5b1f17b1804b1-439a2faf7d8mr1777165e9.1.1739987720814; 
 Wed, 19 Feb 2025 09:55:20 -0800 (PST)
X-Received: by 2002:a05:600c:1c9d:b0:439:968b:6669 with SMTP id
 5b1f17b1804b1-439a2faf7d8mr1776915e9.1.1739987720417; 
 Wed, 19 Feb 2025 09:55:20 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm18117958f8f.86.2025.02.19.09.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 09:55:19 -0800 (PST)
Date: Wed, 19 Feb 2025 18:55:18 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, shan.gavin@gmail.com, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>
Subject: Re: [PATCH 4/4] target/arm: Retry pushing CPER error if necessary
Message-ID: <20250219185518.767a48d9@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250214041635.608012-5-gshan@redhat.com>
References: <20250214041635.608012-1-gshan@redhat.com>
 <20250214041635.608012-5-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MIuluH6dMCOGfkGjMrQ-9vjPTJGqB2mZi1esX0EWOZc_1739987721
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.191,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
X-TUID: Gwirszj2AGbi

On Fri, 14 Feb 2025 14:16:35 +1000
Gavin Shan <gshan@redhat.com> wrote:

> The error -1 is returned if the previously reported CPER error
> hasn't been claimed. The virtual machine is terminated due to
> abort(). It's conflicting to the ideal behaviour that the affected
> vCPU retries pushing the CPER error in this case since the vCPU
> can't proceed its execution.
> 
> Move the chunk of code to push CPER error to a separate helper
> report_memory_errors() and retry the request when the return
> value from acpi_ghes_memory_errors() is greater than zero.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  target/arm/kvm.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
> 
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index 5c0bf99aec..9f063f6053 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -2362,6 +2362,30 @@ int kvm_arch_get_registers(CPUState *cs, Error **errp)
>      return ret;
>  }
>  
> +static void report_memory_error(CPUState *c, hwaddr paddr)
> +{
> +    int ret;
> +
> +    while (true) {
> +        /* Retry if the previously report error hasn't been claimed */
> +        ret = acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr, true);
> +        if (ret <= 0) {
> +            break;
> +        }
> +
> +        bql_unlock();
> +        g_usleep(1000);
even with bql released it's not safe to loop in here.
consider,
  a guest with 2 vcpus
    * vcpu 1 gets SIGBUS due to error
    * vcpu 2 trips over the same error and gets into this loop
    * on guest side vcpu 1 continues to run to handle SEA but
      might need to acquire a lock that vcpu 2 holds

GHESv2 error source we support, can report several errors,
currently QEMU supports only 1 'error status block' which
can hold several error records (CPER) (though storage size is limited)

1:
We can potentially add support for more GHESv2 error sources
with their own Read ACK registers (let's say =max_cpus)
(that is under assumption that no other error will be
triggered while guest VCPUs handle their own SEA (upto clearing Read ACK))

2:
Another way could be for QEMU to allocate more error status _blocks_
for the only one error source it has now and try to find
empty status block to inject new error(s).
 * it can be saturated with high rate of errors (so what do we do in case it happens?)
 * subject to race between clearing/setting Read ACK
    (maybe it can dealt with that on side by keeping internal read_ack counter)

3:
And alternatively, queue incoming errors until read ack is cleared
and then inject pending errors in one go.
(problem with that is that at the moment QEMU doesn't monitor
read ack register memory so it won't notice guest clearing that)


Given spec has provision for multiple error status blocks/error data entries
it seems that #2 is an expected way to deal with the problem.

PS:
I'd prefer Mauro's series being merged 1st (once it's resplit),
for it refactors a bunch of original code and hopefully makes
code easier to follow/extend.

> +        bql_lock();
> +    }
> +
> +    if (ret == 0) {
> +        kvm_inject_arm_sea(c);
> +    } else {
> +        error_report("Error %d to report memory error", ret);
> +        abort();
> +    }
> +}
> +
>  void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>  {
>      ram_addr_t ram_addr;
> @@ -2387,12 +2411,7 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int code, void *addr)
>               */
>              if (code == BUS_MCEERR_AR) {
>                  kvm_cpu_synchronize_state(c);
> -                if (!acpi_ghes_memory_errors(ACPI_HEST_SRC_ID_SEA, paddr, false)) {
> -                    kvm_inject_arm_sea(c);
> -                } else {
> -                    error_report("failed to record the error");
> -                    abort();
> -                }
> +                report_memory_error(c, paddr);
>              }
>              return;
>          }

