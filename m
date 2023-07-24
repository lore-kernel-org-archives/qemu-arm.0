Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1716470ejb;
        Mon, 24 Jul 2023 01:49:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEZ/lD3BwaqI4uWexEUgo9pUdKBya8b0D8JPL/IKYzbHMLwnA4yzs5KlR9nFAkgCI2x57R/
X-Received: by 2002:a05:620a:2888:b0:767:dcd9:c785 with SMTP id j8-20020a05620a288800b00767dcd9c785mr6684213qkp.66.1690188556277;
        Mon, 24 Jul 2023 01:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690188556; cv=none;
        d=google.com; s=arc-20160816;
        b=JB4EcB8IgiKejX26LSDfk4hyWqIf+ec+4x2GakoChpeFqmYZhJJf2zFTr+yyIaDH3N
         ccNq0818uWawLHezQjFwyVh42yrEgblqTG9xewM6U/5EkzkKS93sN636iBL2pQIPaamn
         mQS40B3kxyw8+VGWBIOx7KWKA6s6PBTaEu1fd/kAW8LDGhN3mfZDWD67XQJKf99Ypes/
         niJQK6rUrKqXJJyKYR7quZKaZ+IPfOL5YyYGHbLbSKix5oOE9Nf9tFUy6KS+eWeNY6m5
         gFkJSLoKuClwOgX+NUvt/ojwYqqAVNjp0kDCZ1fST8w3tWk1oVgXh2rT+RZpUkQ1UgpP
         BzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=CJ6ZG+0vLUsia/tm0ndIdy96+hJ8O488N7k/b0KMW2M=;
        fh=mtFkLDLvVWjLl+Z5ctdN30FnmxKYGkHHDXyuwFy73YE=;
        b=nT1fLs4FmGtzdd8y84iqeyosHdkte6V9A3IIiO41Z9rtSd9HHRreHWJtGaAZ6sizGF
         KbxE0A9/BipyKzZl7ItOQ9xvBd3pmNBMgkhS61VVG9XxspCGBsNcq8IYUIVSTrEpB5C9
         DXoIignf9Pe3sa07HDsGfR1XeGKgj21E9uiV7azxXH4RsTNjZHmRYRo6VmdpsZV1R+oY
         N1DTztsuDA9mIUVvmdp6VRYMA69aqCZoHzaGGbyKQe4YjL+zg1/R9Kb7+qDX0CW9uCZ6
         W+5GixItHybnZ2hPTXXKZYfOZbm/gViQ8VBujQ0OT7ZhHRj+XUHbr+tz6I5k0apvcPSe
         39FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J8rg0IB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay19-20020a05620a179300b00766f9f2f7dbsi5019445qkb.317.2023.07.24.01.49.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 01:49:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J8rg0IB+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNrFG-0007Eg-UT; Mon, 24 Jul 2023 04:48:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qNrFE-0007Dj-Gk
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 04:48:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qNrFC-0007nP-Fc
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 04:48:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690188520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CJ6ZG+0vLUsia/tm0ndIdy96+hJ8O488N7k/b0KMW2M=;
 b=J8rg0IB+qbQyoPRe06GBhNqtIwxF+zCS2YVaJ/GV99suQp8afhwWd4IKPEG/ywkHdM+O3g
 44WBJZPJcjuKkb4yGAP6R4K8eM2efdMSA+qT4Lj+bUqJTkzJeQXOj25qEVlV33g5BlgdRz
 3z5EZTGmqMUfsgpV0BVWKeipW51gKTY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-613-l62iWj7YPFuKhdCBjfwx4A-1; Mon, 24 Jul 2023 04:48:37 -0400
X-MC-Unique: l62iWj7YPFuKhdCBjfwx4A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06DE7104D514;
 Mon, 24 Jul 2023 08:48:37 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C46FAF7833;
 Mon, 24 Jul 2023 08:48:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH for-8.2 2/2] arm/kvm: convert to kvm_get_one_reg
In-Reply-To: <db578c20-22d9-3b76-63e7-d99b891f6d36@redhat.com>
Organization: Red Hat GmbH
References: <20230718111404.23479-1-cohuck@redhat.com>
 <20230718111404.23479-3-cohuck@redhat.com>
 <db578c20-22d9-3b76-63e7-d99b891f6d36@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 24 Jul 2023 10:48:35 +0200
Message-ID: <878rb5g0f0.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: pKiR9DLh7fnk

On Mon, Jul 24 2023, Gavin Shan <gshan@redhat.com> wrote:

> Hi Connie,
>
> On 7/18/23 21:14, Cornelia Huck wrote:
>> We can neaten the code by switching the callers that work on a
>> CPUstate to the kvm_get_one_reg function.
>> 
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>   target/arm/kvm.c   | 15 +++---------
>>   target/arm/kvm64.c | 57 ++++++++++++----------------------------------
>>   2 files changed, 18 insertions(+), 54 deletions(-)
>> 
>
> The replacements look good to me. However, I guess it's worty to apply
> the same replacements for target/arm/kvm64.c since we're here?
>
> [gshan@gshan arm]$ pwd
> /home/gshan/sandbox/q/target/arm
> [gshan@gshan arm]$ git grep KVM_GET_ONE_REG
> kvm64.c:    err = ioctl(fd, KVM_GET_ONE_REG, &idreg);
> kvm64.c:    return ioctl(fd, KVM_GET_ONE_REG, &idreg);
> kvm64.c:        ret = ioctl(fdarray[2], KVM_GET_ONE_REG, &reg);

These are the callers that don't work on a CPUState (all in initial
feature discovery IIRC), so they need to stay that way.

