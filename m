Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5314129lfq;
        Wed, 30 Sep 2020 01:40:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzdaFavd25jqvMQ9GpZIEa6gR7lWBo+9QAo+S5d7CgDejIpEM4+WYN1joqnEjqwLoHWRvxC
X-Received: by 2002:a25:380c:: with SMTP id f12mr1834992yba.32.1601455209874;
        Wed, 30 Sep 2020 01:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601455209; cv=none;
        d=google.com; s=arc-20160816;
        b=1GX2amjpiOradZ2a2bBTDcgCsYaRLiGxuJlp/4+YZ63d4Z/j7b1O/KOonbxzU/2I7s
         jdr/dvPxmOt5EYlXSYLPJLfp+1eYfSY5zfbmfhTczskZexQkkUmfdp04amK0lb3eLWfK
         H4yh6ZPs6G2Y/JqBYRcy5v7V37vRHbO0Ga41wIHUvP54PpAbBsMHT6ftBBcYQoHqaaLx
         dfZ8hZ9sL3K/yvSIKpVplzgJ1CGTD8m7jOriV8L0SEO7abbB0MUy6JPJm1xlq11ksBfu
         obm2R8bU/huIRse/iW7iXPEHIaklW3RFZLZNzLPQdZWIdmKilGGiTygIEns8JSgD9rR9
         fD6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=oB6nlU7WmT+RsOflDltHGqw0WfH22pUu7yW/2jVbo+g=;
        b=GCNovdamoJ7iLknVdXqGQeqKWoXVj9ee7iWSuBPf6aZjhSgtX+/p7b2mlm5d71KK4R
         gJOgHkbJAIRGXXSSVCT9ztOjwxGgICPWtRzwn+ajdmSEry4U7JoeVJfemanfR59yezCm
         F58DJ6r0Hz69eS8opMiGuQrklADVchwoJFwIvZsEKleqpyMxy5UBTEqipPY6Qj8TEuNX
         5rjlHkhn9pPEfIR7RDYpgHjfKXt8M4gWoVF2IKrVR+8UIOuR9xCpgsxahwbRyN1ixSK3
         Ga4HrBh+9nuxEo0UJDJRz4DdF+L4SZQ5SSo5ZzjveNfj8Gq6i373hzCk2K8dM5tQcHDB
         VkQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EnfvvOTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y123si1114880ybc.282.2020.09.30.01.40.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 01:40:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=EnfvvOTC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:51674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNXej-0000LB-79
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 04:40:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kNXeK-0000Jz-Cm
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 04:39:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kNXeH-0007ft-HO
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 04:39:44 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601455179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oB6nlU7WmT+RsOflDltHGqw0WfH22pUu7yW/2jVbo+g=;
 b=EnfvvOTCHCwaMPAiY3+dTOMEYL1WlVh6KNuhW8jQfXk2fdMFnXJynx8dja9TxR3q2ND+U/
 KJO2tMkjGhxbWw0XvV+SquCBD70Fl7rFJzJMcdQJNwCI6SiUC5WpUT5qlqHlfjVkLMUavm
 3PY5A8LYV3bmjOt43/0r+iMbgRjcyVI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-227-oVwgAJe9OU6_b7DjPiLnyw-1; Wed, 30 Sep 2020 04:39:38 -0400
X-MC-Unique: oVwgAJe9OU6_b7DjPiLnyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 004E3186DD23;
 Wed, 30 Sep 2020 08:39:37 +0000 (UTC)
Received: from [10.36.113.210] (ovpn-113-210.ams2.redhat.com [10.36.113.210])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 091334149;
 Wed, 30 Sep 2020 08:39:35 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] DO NOT MERGE: HACK: Add steal time KVM cap to kvm.h
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20200916092620.19161-1-drjones@redhat.com>
 <20200916092620.19161-5-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <9f0160d2-0f4d-72c9-aa5a-ad699fcc28a2@redhat.com>
Date: Wed, 30 Sep 2020 10:39:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200916092620.19161-5-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:26:33
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.687,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YJ/Otvh1euA2

Hi Drew,

On 9/16/20 11:26 AM, Andrew Jones wrote:
> ---
>  linux-headers/linux/kvm.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
> index a28c3667370b..924672cca1f1 100644
> --- a/linux-headers/linux/kvm.h
> +++ b/linux-headers/linux/kvm.h
> @@ -1031,6 +1031,7 @@ struct kvm_ppc_resize_hpt {
>  #define KVM_CAP_PPC_SECURE_GUEST 181
>  #define KVM_CAP_HALT_POLL 182
>  #define KVM_CAP_ASYNC_PF_INT 183
> +#define KVM_CAP_STEAL_TIME 187
>  
>  #ifdef KVM_CAP_IRQ_ROUTING
>  
> 
So [PULL v4 01/48] linux headers: sync to 5.9-rc4 missed this update.
Needs a scripts/update-linux-headers.sh run.

Thanks

Eric

