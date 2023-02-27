Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4820829ejc;
        Mon, 27 Feb 2023 08:50:27 -0800 (PST)
X-Google-Smtp-Source: AK7set+EEsPcvDC0i/gy71W1oyM3wHtA1QnmNhFhW9urEOAkPgQsrVLVBCZg+4waeba+oNB3ms8k
X-Received: by 2002:ac8:4cd9:0:b0:3b6:93fe:443c with SMTP id l25-20020ac84cd9000000b003b693fe443cmr23509063qtv.32.1677516626792;
        Mon, 27 Feb 2023 08:50:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677516626; cv=none;
        d=google.com; s=arc-20160816;
        b=nsuTEAFRUnIOuEYUy21y7ppgPDYutmRcuCHDuw7PYm9NsylzVHp6ZC1851nxdmyAde
         MdaBj2RUa54PnVVQu8VVsfMZxZL8KIa/rTnBTGty84uAGtgxJGt1HsJR0lpffQBUn4YH
         5dHSMr6HdVZXr63WlK3A+Im3I/H/9egypOI4/o/S/NANlSulXHtcUuGDYMrKUhfP9HAL
         E4Px6+N9hVNGJ/S6giO3p/qx9UI+bsQW/xwNjBF7sgFsHLwlCWO5Cdzf811bdvIq74P3
         PihlPt+J500R9I7ZBWdfxR3UgaObBrhbm3y9HCmfT9z1Qqrd6KsYSu+TyV660KBdUN3/
         +tSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=l7gAfPxjYy1ZF+2eDrtb7tn+rvsV2iQvicqksHVx7l4=;
        b=k1f1JmBUq/JckdhoY+fwG7aPxJuz+HHfoNIGtwtiXjQ0ZpdNTHaS0wFCBbfhRqbg2g
         MUwX/ueCRPTtJe4KaCNBg3FH559wd5nS/C5bQIqzC/V31ArOM0ZFWYuU1+hp9hiaYCn0
         lxBAgi0N0xzzPR8HYVzqmn1g98VUz4B9n34zxme4lvR8DjKCnfmIDf8jB6OXSE0M4rrk
         uqEadGbpWIGiLUC6DnKEUABdmq8b1W37q4icKQos4NgNXCynUfhsSejMn26pc9R6wW9c
         bIPaj3Od/g+gmJNawbMigVEqpTnFLCEcBhyXafNDJvO4jLh099xWVLP3SRlH7UvKHY4C
         5dtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GIl2DqX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s6-20020a05620a254600b00733f1926964si7040625qko.723.2023.02.27.08.50.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Feb 2023 08:50:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GIl2DqX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWghW-0008Er-BS; Mon, 27 Feb 2023 11:50:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pWghT-0008CK-4V
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 11:50:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pWghR-0000Xv-GW
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 11:50:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677516602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=l7gAfPxjYy1ZF+2eDrtb7tn+rvsV2iQvicqksHVx7l4=;
 b=GIl2DqX74UMgU26ve53X2Lb8NnSXg9jDQN9h0ULzZvn0xYQM5KmCFYE+elzsfb3j7q7Bry
 mQWwcFKGC0AS4g6JpgMMCbBOGQPgddy3/1NgBEvkN9PHdR9LDfvlPSrXg1+WO0HJ/dEfRL
 r8z3tklgP4ijPr9qkO52vav6crZqh0g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-iXQANjHrMdyknHDWa6E6mw-1; Mon, 27 Feb 2023 11:49:59 -0500
X-MC-Unique: iXQANjHrMdyknHDWa6E6mw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8DD0610115E1;
 Mon, 27 Feb 2023 16:49:57 +0000 (UTC)
Received: from localhost (unknown [10.45.226.217])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3621D4044B30;
 Mon, 27 Feb 2023 16:49:57 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Miguel Luis <miguel.luis@oracle.com>, Peter Maydell
 <peter.maydell@linaro.org>, "Michael S . Tsirkin" <mst@redhat.com>, Paolo
 Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Haibo Xu <haibo.xu@linaro.org>, Andrew Jones <drjones@redhat.com>, Marc
 Zyngier <maz@kernel.org>
Cc: Miguel Luis <miguel.luis@oracle.com>
Subject: Re: [RFC PATCH 1/5] linux-headers: [kvm, arm64] add the necessary
 definitions to match host kernel
In-Reply-To: <20230227163718.62003-2-miguel.luis@oracle.com>
Organization: Red Hat GmbH
References: <20230227163718.62003-1-miguel.luis@oracle.com>
 <20230227163718.62003-2-miguel.luis@oracle.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 27 Feb 2023 17:49:55 +0100
Message-ID: <87v8jn3vf0.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: hjghDGrYHz/d

On Mon, Feb 27 2023, Miguel Luis <miguel.luis@oracle.com> wrote:

> From: Haibo Xu <haibo.xu@linaro.org>
>
> linux-headers define host properties needed for the VMM to interact with
> KVM, so let's include them *while* they're not available yet on linux
> upstream since aarch64 nested virtualization is still a work in
> progress.
>
> Ref: https://lore.kernel.org/qemu-devel/636b5932e4cf061b6f97516e82d4319c1d29b871.1616052889.git.haibo.xu@linaro.org/
>
> Signed-off-by: Haibo Xu <haibo.xu@linaro.org>
> Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
> ---
>  linux-headers/asm-arm64/kvm.h | 2 ++
>  linux-headers/linux/kvm.h     | 1 +
>  2 files changed, 3 insertions(+)

Can you please mark this explicitly as a placeholder for a proper
headers update? Just so that it doesn't get lost :)

