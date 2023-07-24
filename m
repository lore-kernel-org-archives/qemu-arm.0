Received: by 2002:a17:906:b78f:b0:98d:b2f5:1316 with SMTP id dt15csp1715902ejb;
        Mon, 24 Jul 2023 01:47:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGOofZu6hZysDl5KHH6N5zY95GnIDmFVUjUX9YfZonNRpBopC8UKkUf1/yf+mpy669sZbNf
X-Received: by 2002:a05:622a:30a:b0:403:afe6:c173 with SMTP id q10-20020a05622a030a00b00403afe6c173mr10006794qtw.8.1690188473403;
        Mon, 24 Jul 2023 01:47:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690188473; cv=none;
        d=google.com; s=arc-20160816;
        b=QLYoNH9rOSuk8aMCO3u+fsFMr4qWyPiMOepWt4aB5AddOcYQYiTLNPY7tdcCH0m5iw
         Bra6CQJa0mzKXNRpRYKmiyi6Q7DfSeIm/hXx0iogjbIeM6fqe9pYVJYYGo+aW6ekW5DI
         buVcqPsktj1lGUu6RC8Nr6O/ahNOFBlv3wbyaZ2q8WlMVOmcx+gh1wvg81O0OTMM+fob
         XhnyR4ca3/XpNHZwqxl+b1T32OkPmdB1/1EUKAhabYQtRmMEJkWjuvUeHRM8E9m9xW5t
         +pXqBr+hN1ENLc/LFhy4eFehp+0E6qa4aA9KSP/E7qhG56InTTm2mVrMsPgV5qqFw0VW
         xHvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=Mhey2rfScVI0ERO3qifA2o1FZHJDtGw8MJL1bWmGkcM=;
        fh=mtFkLDLvVWjLl+Z5ctdN30FnmxKYGkHHDXyuwFy73YE=;
        b=ntM1ma+n0VOpu8/lSnU91PyRP6WayI88bc0ztxp+wp4Sx8/8a+h5+rO6frj3SuOE9k
         Hpwb9jMScE7xkj3ABGETnJLPYaNVxArJgtOAZyYPvZ02Y+WLDXo4fHeVPTS9gr0+uP7s
         zPwtHLxcUhI87RY70aDko6BSZlaR+Yy4yB0FcJ8dHpnCgvhoY4vfKcYY00dgl1xCo5mr
         p1WAO89YeCglJ+VCl9hpyXttQJxJixk/QmT1ZlUeKo3m2nWI1deGxOhG30lh8hJ8jAcS
         i0qkLHyVGUCZJNtnAMQ3AdRiXk7pO1BpljXIqQ5QVz+1DeZYwz1H2StD/JJ3A+8R/rVh
         cRMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QMOc+/7w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u35-20020a05622a19a300b004033859d205si5001132qtc.167.2023.07.24.01.47.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jul 2023 01:47:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="QMOc+/7w";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qNrDq-0006Xe-9M; Mon, 24 Jul 2023 04:47:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qNrDo-0006Wu-Hc
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 04:47:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1qNrDm-0007Vj-Tn
 for qemu-arm@nongnu.org; Mon, 24 Jul 2023 04:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690188433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Mhey2rfScVI0ERO3qifA2o1FZHJDtGw8MJL1bWmGkcM=;
 b=QMOc+/7w9Sz/cDY09P11cFOSD7Zj7/DDfc02hzw/KuWlIhw+XAWA6NQxef8bSF2tEjzXRK
 PjZwe9SDQ6a7eWL7QpTJy5idAXhfJ7oiPAWAFIiC8gSUuqWiqsRSSGb0GQyXCT49LUykNK
 gG0QaF8De/4I7wHuJRpBsGwkoRs7EOw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-355-oT7Jp7WnNZWZ-rw25rGdYw-1; Mon, 24 Jul 2023 04:47:09 -0400
X-MC-Unique: oT7Jp7WnNZWZ-rw25rGdYw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 05582101A54E;
 Mon, 24 Jul 2023 08:47:09 +0000 (UTC)
Received: from localhost (dhcp-192-239.str.redhat.com [10.33.192.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B4782F782E;
 Mon, 24 Jul 2023 08:47:08 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [PATCH for-8.2 1/2] arm/kvm: convert to kvm_set_one_reg
In-Reply-To: <a5b93992-5576-04cf-3af0-2c237831f5c6@redhat.com>
Organization: Red Hat GmbH
References: <20230718111404.23479-1-cohuck@redhat.com>
 <20230718111404.23479-2-cohuck@redhat.com>
 <a5b93992-5576-04cf-3af0-2c237831f5c6@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Mon, 24 Jul 2023 10:47:07 +0200
Message-ID: <87bkg1g0hg.fsf@redhat.com>
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
X-TUID: iQUKxz1esqWq

On Mon, Jul 24 2023, Gavin Shan <gshan@redhat.com> wrote:

> Hi Connie,
>
> On 7/18/23 21:14, Cornelia Huck wrote:
>> We can neaten the code by switching to the kvm_set_one_reg function.
>> 
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>   target/arm/kvm.c   | 13 +++------
>>   target/arm/kvm64.c | 66 +++++++++++++---------------------------------
>>   2 files changed, 21 insertions(+), 58 deletions(-)
>> 
>
> Some wrong replacements to be fixed in kvm_arch_put_fpsimd() as below.
> Apart from that, LGTM:
>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> @@ -725,19 +721,17 @@ static void kvm_inject_arm_sea(CPUState *c)
>>   static int kvm_arch_put_fpsimd(CPUState *cs)
>>   {
>>       CPUARMState *env = &ARM_CPU(cs)->env;
>> -    struct kvm_one_reg reg;
>>       int i, ret;
>>   
>>       for (i = 0; i < 32; i++) {
>>           uint64_t *q = aa64_vfp_qreg(env, i);
>>   #if HOST_BIG_ENDIAN
>>           uint64_t fp_val[2] = { q[1], q[0] };
>> -        reg.addr = (uintptr_t)fp_val;
>> +        ret = kvm_set_one_reg(cs, AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]),
>> +                                                        &fp_val);
>                                                             ^^^^^^^
>                                                             s/&fp_val/fp_val
>>   #else
>> -        reg.addr = (uintptr_t)q;
>> +        ret = kvm_set_one_reg(cs, AARCH64_SIMD_CORE_REG(fp_regs.vregs[i]), &q);
>                                                                                ^^^
>                                                                               s/&q/q
>                                                                                
>>   #endif

Whoops, I thought I had double-checked these...

