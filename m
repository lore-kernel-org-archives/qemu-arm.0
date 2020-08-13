Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp405650lfy;
        Thu, 13 Aug 2020 04:01:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+2JdA0FYEvIq7fqtyeSaXMlgcL8zkFf5AmTaPouQ2zAJ6AwiWqZqFbUkVTpoXMBvxXigZ
X-Received: by 2002:a25:3355:: with SMTP id z82mr5872964ybz.445.1597316478660;
        Thu, 13 Aug 2020 04:01:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597316478; cv=none;
        d=google.com; s=arc-20160816;
        b=eNvrV9JHHKe+X8PyHIlZB1Xy2YofuhTaQV8FG0RVHKjjIW5CQWYhzqMC2lw6vH1x2k
         /YqLsTy/rMeHKoXo3z5frfJ1JhoId5COrU7R09QIUJwU6dJeqXvDU80Ww5LKRRx80JL9
         XESD72VCnqoweOiX8AfhEvQiHYPBLptcNxrj6G9B4aF3GxfV6vTC8ZinVL5EglJpNJdq
         ME15sOptwLZRzoGZUoZx9X+4JtC9zYmwufewFjpKGqkBr4zlnE5KxllKspTYNhrhjl5n
         zL7JtBO1tl9h6B1BE8ZHxFxBTmZp968kImTcpk58oyG9aDChJB7WuZGNF6c2zl/BAGPo
         1kuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:organization:references:in-reply-to:message-id:subject
         :to:from:date:dkim-signature;
        bh=Si5NhwS7GcEPQi8MCfcvnQD3matxk43KbKWlT99iNXI=;
        b=XzKFe61hUVBHHRASseQpL8r1+1HTrlDVBMtjscPSJxKkzSsDxx6Z2RL7glUJ7HPGWc
         umSeI/STv2BVPCCd/9iPkjc4hkatVrPQL/99s00qJXmu5IGpJUwwg+1fGsiRVLmw8rq7
         TK0b6BwTuMY1S65z6UhHKPFJ11To8nITadL4aPTrnuD3KlGg1igLgQtmluF4DCCvM6Ly
         W9LLSWb9W9pbTJfgHzH1yvNm2VWJ6p2M4PWOsyp/J50VYO7psU804+X2ktb4PwYtsY+y
         EOHUrLtPvw2SNTYH1SlH3tobGWqblbX+Js12G/AZLES8l5qnVtDEdAtxC9SgYrAZOKzS
         EWjQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nf5ySvBH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n1si4838238ybo.80.2020.08.13.04.01.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Aug 2020 04:01:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Nf5ySvBH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k6Az0-0005s7-20
	for alex.bennee@linaro.org; Thu, 13 Aug 2020 07:01:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k6Ayj-0005qV-5o
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 07:01:01 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60424
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1k6Aya-0001dZ-Sx
 for qemu-arm@nongnu.org; Thu, 13 Aug 2020 07:01:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597316449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Si5NhwS7GcEPQi8MCfcvnQD3matxk43KbKWlT99iNXI=;
 b=Nf5ySvBHqhpinYHO+Q1qH1FyJA9i6njTeRlOpkWwS2n7DqE2mTdWo2RMDQzM/b6QUJ1o79
 A5afhT1bHjUaYNJfvW9NQ34i7Cmh1hFNnH10XwXmozlU0nOsfY+dPdHJPY8D6y3zLCAmZy
 hThdQOUadU+EeGLE7D/SdCA0ObjP65c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-405-dwc51L4QPm-Ri5owmeuDbw-1; Thu, 13 Aug 2020 07:00:46 -0400
X-MC-Unique: dwc51L4QPm-Ri5owmeuDbw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 037C4801AC2;
 Thu, 13 Aug 2020 11:00:45 +0000 (UTC)
Received: from gondolin (ovpn-112-216.ams2.redhat.com [10.36.112.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 73D6F629DD;
 Thu, 13 Aug 2020 11:00:37 +0000 (UTC)
Date: Thu, 13 Aug 2020 13:00:34 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Peng Liang <liangpeng10@huawei.com>
Subject: Re: [RFC 6/9] target/arm: introduce KVM_CAP_ARM_CPU_FEATURE
Message-ID: <20200813130034.421b3368.cohuck@redhat.com>
In-Reply-To: <20200813102657.2588720-7-liangpeng10@huawei.com>
References: <20200813102657.2588720-1-liangpeng10@huawei.com>
 <20200813102657.2588720-7-liangpeng10@huawei.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=cohuck@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/13 03:45:42
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com,
 zhang.zhanghailiang@huawei.com, mst@redhat.com, qemu-devel@nongnu.org,
 xiexiangyou@huawei.com, qemu-arm@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: llOB+8qByqRP

On Thu, 13 Aug 2020 18:26:54 +0800
Peng Liang <liangpeng10@huawei.com> wrote:

> Introduce KVM_CAP_ARM_CPU_FEATURE to check whether KVM supports to set
> CPU features in ARM.
> 
> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
> Signed-off-by: Peng Liang <liangpeng10@huawei.com>
> ---
>  linux-headers/linux/kvm.h |  1 +
>  target/arm/cpu.c          |  5 +++++
>  target/arm/kvm64.c        | 14 ++++++++++++++
>  target/arm/kvm_arm.h      |  7 +++++++
>  4 files changed, 27 insertions(+)
> 
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index a28c366737..0b83d2b4bb 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1031,6 +1031,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_PPC_SECURE_GUEST 181
>  #define KVM_CAP_HALT_POLL 182
>  #define KVM_CAP_ASYNC_PF_INT 183
> +#define KVM_CAP_ARM_CPU_FEATURE 187
>  
>  #ifdef KVM_CAP_IRQ_ROUTING

Please split out this header update into a separate patch so that it
can be replaced by a proper headers update once the kernel code has been
included.

