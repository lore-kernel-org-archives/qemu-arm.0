Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp325308lfg;
        Thu, 18 Mar 2021 05:42:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0H8MQ/GCt1drhc/ruT3/CSlPoTSJEkoFQZd4AouSVV5YuHO1PiCuC9S3treDhTmg93fYB
X-Received: by 2002:a05:6602:1207:: with SMTP id y7mr10081954iot.23.1616071375838;
        Thu, 18 Mar 2021 05:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616071375; cv=none;
        d=google.com; s=arc-20160816;
        b=nVxYWtMCkRRw4GrX30S4sxwpTyMSwmAdoWa9GgyXxW0RM/c9qKs3ISnrwQugDA8a4Q
         ZzRtvuv90eLkNkl8fbfVOtZPyudOMY21ipNoDZ2Sy+6vyWYnzwiOq04EEM4JXQkvciTt
         hM7oPD51isUN7tUTRsdnQIowBS83sxxW36y1OJAAoU9F2bM95TuhbTGtxO7yd6XKEJde
         mbaTqmvEyTO7fS357AlEvU0KA/0pOgkVFwa0CCidb/9sHB0m5Ng6SjNKYg8GgBn9vGwg
         h9lFcN4xvXGEBMIot/4IfaxJI+lG1D6IstAbmXCCEhqjcpG1d9jwyMhMMbhIldzXwYNX
         EOhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=wHao123BeBppOR3zep/U3EhzPemsBFYV1+ttHhT9sQU=;
        b=Cl43DLulk1dIJHofM5/4ltaXBwNVQ9pjMPgCE2J5QXm0fGgRfWkq0MCNrRCH30hZcY
         PF1JBbiqFm9chzI03POXA1QUP6ae6OIP5XnphmwM2hIAjWJ2OfTIiPSW15l611XNigqs
         oR+MR0VtbDTdzKjKAWjJAaroQHtn/0NLKJA6UQ6+fnai9VZHmcJDfu9Kyojqv0gKaN3i
         4ivED6Inif6Ld5fe7k++N7eWY4kODDdJ5yFkftgVb3QUyzgxlHSPJ+ogFimQMVOzN74g
         KhCq28F5t8m1DHYw70Kv4EnC8qiTmv2RgrSwifPjYgzGT3dWgndjFmpmikHQFPf3h/v8
         TUXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c13si1287529ilm.5.2021.03.18.05.42.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Mar 2021 05:42:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMrzL-0004Eo-6S
	for alex.bennee@linaro.org; Thu, 18 Mar 2021 08:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lMrz7-0004Ee-Qv; Thu, 18 Mar 2021 08:42:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:56986)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lMrz6-0001IZ-43; Thu, 18 Mar 2021 08:42:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DAF5DAC1F;
 Thu, 18 Mar 2021 12:42:37 +0000 (UTC)
Subject: Re: arm_cpu_post_init (Was: Re: arm: "max" CPU class hierarchy
 changes possible?)
To: Andrew Jones <drjones@redhat.com>
References: <11e9d3bb-c94c-4ad7-35b0-b698376c5e00@suse.de>
 <CAFEAcA8T+u6QG9PQWs40PTSZ86SEeLQrciT8WHxFyH3UVbipiA@mail.gmail.com>
 <2e6a5d98-e022-0b39-5f30-92eb74491d3b@redhat.com>
 <2277fdf5-ec92-476a-8fe5-0d4eee23dfef@suse.de>
 <CAFEAcA_j-0+vmNFtPjcxEXC9r4bFrebDfGjq-x1SfguzUG4qcw@mail.gmail.com>
 <20210311191046.ykcelkwq7orajyu7@kamzik.brq.redhat.com>
 <5467e45c-cc8e-6422-0c56-398405a7c331@suse.de>
 <c3397f29-82eb-5a1b-803d-8184c9a8d508@suse.de>
 <20210318120837.cg4gfdpchjwiabav@kamzik.brq.redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <fc769a96-a304-7429-5dee-a65b52179b1c@suse.de>
Date: Thu, 18 Mar 2021 13:42:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20210318120837.cg4gfdpchjwiabav@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oo0O+6rRTpj7

On 3/18/21 1:08 PM, Andrew Jones wrote:
> On Thu, Mar 18, 2021 at 12:32:30PM +0100, Claudio Fontana wrote:
>> And why do we have a separate arm_cpu_finalize_features()?
> 
> Separate, because it's not just called from arm_cpu_realizefn().

In particular it is also called by the monitor.c in qmp_query_cpu_model_expansion(),

which basically creates an object of the cpu subclass,
and then calls arm_cpu_finalize_[features]() explicitly on the object.

Is the qdev realize() method not called in this case? Should instead it be triggered, rather than initializing/realizing an incomplete object?

> 
>>
>> Nothing in the ARM cpu classes initializations ever seems to be "final" to me.
> 
> Some CPU features cannot be simply switched on/off at the property
> parse time. For example, there could be dependencies on multiple
> properties, the mutual exclusion of properties, or other aspects
> that can only be known later than property parse time. That stuff
> goes in arm_cpu_finalize_features().

Seems like _part_ of that is in arm_cpu_finalize_[features]() (in practice, this ends up being AARCH64-only stuff,
ie SVE, PAUTH and KVM).

After calling that, the arm realizefn() also does further setting and unsetting of features, checking previous feature states.

There is a whole lot following the arm_cpu_finalize_[features]() call,
there are ~300 lines of features initializations happening _after_ the call to arm_cpu_finalize_[features]().

> 
> Thanks,
> drew
> 


