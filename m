Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp906971ocs;
        Thu, 29 Sep 2022 03:28:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM49wf38pOEC9hZvcVV1Y7XAwdCmK4Af7jcHeFJOfHmF72hsZc8je78ftbVr2wBu5B3lwV21
X-Received: by 2002:a05:620a:248f:b0:6ce:a3c7:abfb with SMTP id i15-20020a05620a248f00b006cea3c7abfbmr1605628qkn.112.1664447337954;
        Thu, 29 Sep 2022 03:28:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664447337; cv=none;
        d=google.com; s=arc-20160816;
        b=lrGtJncXsdXXnCHfEEB0jioEuTuegOLNZyFW9qFBxhnXZBXrSv87AuP3OLT+nkUWUR
         TXg1pq5doj+dklnbV/f03dTyRmX6xmEIPnO6VSj65K742sHo+WpHh+T+RIYyGIHf/pof
         kNrflNHIzhj8jLjxspdGrTwRQqzpWO4tOW3vFO2unoDCbeYIzXEYc/jdJmAeHmyZQiv5
         rltBl+mYwcTe31xfiO6o5SFHzJnsOzIBzL+shJbqmX3+ano2+4vh0L2BZOXBer6mi1/0
         oXMeQD7QEPLJjMVrj1o+9jvfO3R6NF0EHpl1q9vy1Hfei9nwYIa0eLamWooF438ozH7C
         AYXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=S2MTmuut3UpFN8JM4EGneIMhXbXwpb8297pJeuov8nQ=;
        b=ehkeOjLukNz37pwhrgMgjUEcecouFHWTliI22qdKfXBg2JRd0ImESv3QdtRpnlBCtX
         Jp1yWxPapnuZXdEDKTbjui/GZQjPra69NxVGDkQAh+qLwpWru7JIiM4Qj+Wleo/o+E3x
         hO/NxRi2Sx+nKLbZchG3E6EE6rln4+BT5hGOMIEAIBhmg7vgOym5gqgF2YfwZ0ronzy+
         JE9g24QqfiVbs0Kmv4fshf13Q9fF7vgg0N3RyJfPFRRww7e4Nbagwqbzw0pXUgwUpDsk
         Dr2qImt/Xm2VeluAKI9EdDQ7VWocjuQ7tQBX1nk2U1vqBs9hmVHc+kO0D9vtjRfRbYgp
         BvXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dILNhJvR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a05620a0d8b00b006b2543c5866si1294477qkl.18.2022.09.29.03.28.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Sep 2022 03:28:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dILNhJvR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odqmn-0001IE-De
	for alex.bennee@linaro.org; Thu, 29 Sep 2022 06:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1odqlj-0001Gq-CQ
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 06:27:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1odqlg-0002ag-2a
 for qemu-arm@nongnu.org; Thu, 29 Sep 2022 06:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664447264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S2MTmuut3UpFN8JM4EGneIMhXbXwpb8297pJeuov8nQ=;
 b=dILNhJvRVeQogBx1gsdu4nK/Ll5v+NBYocGT4PzRkEGLYLV8ukLvsGyXkPT/SWu5Plg4Ar
 vIFSuowhCm/IWX6zIbFlFYuTP1pbxeoz3V1WxY1zIqVIiomIw627bAxJn/NtowjK43Pq2u
 ZXMHITshDfAANrG+3RgeHBu5VMwUQ40=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-ZID10jGnMYq7njBpvdre5Q-1; Thu, 29 Sep 2022 06:27:40 -0400
X-MC-Unique: ZID10jGnMYq7njBpvdre5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB3FE88B7A7;
 Thu, 29 Sep 2022 10:27:39 +0000 (UTC)
Received: from localhost (unknown [10.39.193.68])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A64A4EA5F;
 Thu, 29 Sep 2022 10:27:37 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, eric.auger@redhat.com, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, maz@kernel.org, zhenyzha@redhat.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 shan.gavin@gmail.com
Subject: Re: [PATCH v3 5/5] hw/arm/virt: Add 'highmem-compact' property
In-Reply-To: <7656c827-58ce-85c2-87fe-e88206d6f022@redhat.com>
Organization: Red Hat GmbH
References: <20220921231349.274049-1-gshan@redhat.com>
 <20220921231349.274049-6-gshan@redhat.com>
 <2e8ace49-b900-de7e-2d81-7bb6c081146e@redhat.com>
 <7656c827-58ce-85c2-87fe-e88206d6f022@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 29 Sep 2022 12:27:35 +0200
Message-ID: <87bkqyeaqw.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MLLiW+u1CnJz

On Thu, Sep 29 2022, Gavin Shan <gshan@redhat.com> wrote:

> Hi Eric,
>
> On 9/28/22 10:22 PM, Eric Auger wrote:
>> On 9/22/22 01:13, Gavin Shan wrote:
>>> After the improvement to high memory region address assignment is
>>> applied, the memory layout is changed. For example, VIRT_HIGH_PCIE_MMIO
>> s/the memory layout is changed./the memory layout is changed,
>> introducing possible migration breakage.
>
> Ok, much clearer.
>
>>> memory region is enabled when the improvement is applied, but it's
>>> disabled if the improvement isn't applied.
>>>
>>>      pa_bits              = 40;
>>>      vms->highmem_redists = false;
>>>      vms->highmem_ecam    = false;
>>>      vms->highmem_mmio    = true;
>>>
>>>      # qemu-system-aarch64 -accel kvm -cpu host \
>>>        -machine virt-7.2 -m 4G,maxmem=511G      \
>>>        -monitor stdio
>>>
>>> In order to keep backwords compatibility, we need to disable the
>>> optimization on machines, which is virt-7.1 or ealier than it. It
>>> means the optimization is enabled by default from virt-7.2. Besides,
>>> 'highmem-compact' property is added so that the optimization can be
>> I would rather rename the property into compact-highmem even if the vms
>> field is name highmem_compact to align with other highmem fields
>
> Ok, but I would love to know why. Note that we already have
> 'highmem=on|off'. 'highmem_compact=on|off' seems consistent
> to me.

FWIW, I initially misread 'highmem_compact' as 'highmem_compat' (and had
to re-read because I got confused). At least to me, 'compact_highmem'
has less chance of being parsed incorrectly :) (although that is
probably a personal thing.)

>
>>> explicitly enabled or disabled on all machine types by users.
>>>
>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
>>> ---
>>>   docs/system/arm/virt.rst |  4 ++++
>>>   hw/arm/virt.c            | 33 +++++++++++++++++++++++++++++++++
>>>   include/hw/arm/virt.h    |  2 ++
>>>   3 files changed, 39 insertions(+)
>>>
>>> diff --git a/docs/system/arm/virt.rst b/docs/system/arm/virt.rst
>>> index 20442ea2c1..f05ec2253b 100644
>>> --- a/docs/system/arm/virt.rst
>>> +++ b/docs/system/arm/virt.rst
>>> @@ -94,6 +94,10 @@ highmem
>>>     address space above 32 bits. The default is ``on`` for machine types
>>>     later than ``virt-2.12``.
>>>   
>>> +highmem-compact
>>> +  Set ``on``/``off`` to enable/disable compact space for high memory regions.
>>> +  The default is ``on`` for machine types later than ``virt-7.2``
>> I think you should document what is compact layout versus legacy one,
>> both in the commit msg and maybe as a comment in a code along with the
>> comment in hw/arm/virt.c starting with 'Highmem IO Regions: '
>
> Ok, I will add this into the commit log in v4. I don't think it's necessary
> to add duplicate comment in the code. People can check the commit log for
> details if needed.

Rather explain it in this file here, maybe? I'd prefer to be able to
find out what 'compact' means without digging through the commit log.

