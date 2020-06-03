Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp420817lfc;
        Wed, 3 Jun 2020 04:39:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAYyH560pb8FsTKstClbHh39Hs5EN0v4iLNEmD6bSu90yHS/1Qqjk5IVhYd0FcMUp1miaY
X-Received: by 2002:a25:c554:: with SMTP id v81mr17306158ybe.206.1591184397861;
        Wed, 03 Jun 2020 04:39:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591184397; cv=none;
        d=google.com; s=arc-20160816;
        b=Ek3c8pXwl4hUWNvpi5OBWFqKvyl0IuufGm5W3G2v/tByTYQDqf7UnyKTrPLxF2EQtZ
         lT6RbV6/x/VtgvangN5AvOuepLWqqRgn61xPX70hnw/Tuiys5c7CNHzCXErpIxWmP+E/
         gn3gjNeXgrOo2QKuv5/vIKP/yYxfIDojs+2UqLiohRVqdxh65yWxtGvVSFXVmTisqUpM
         iufXBzab/IEaswkp8isbUqJQMJy7/mszAyM5+pWqF3NPzY4J9kmDn4toEeS7sNQJxtTm
         g+9irS5WtYfVGre0A9xfClVve+41uzLMoqpfWRvX/cyHsU+ujERCIF1s8499QnHLh3Nd
         TzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QcD+UtSE9nD24NSYXdL2r0s5dL2tS92+BkOAI85FaCE=;
        b=DVyOoi/o8TxIE9OJqvChsDq43D2s1MQnsDWIDOH26q9H8SPRsSEOIc+qX/6N/qk4Ba
         rX0pjm1AJgx+Qsnn+rbP1Y7r9zZTFc7qrMo0fUwXRs8JY6Y8IdUIDclaQ0aYsEFSmksP
         XAibR+82jj61NJMyxV2DcCB72Q+D3c0nV/wam5PMqw/fWRYTj0QIhwRUPmh2HGPL8ibB
         hQDoFzKpYjc44seNF4jWbmobtbw5l08dlkCAtXR3qUx34FVUWjpb1nYAKVuxOBIEpULt
         C5ZoltBZP8eOxTXvnwZTx7ohsqwxZAE5fR/HZDXkUHF8HVNEPq93K+B4Sce8BoKx/ixF
         A3rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TtSe/HmN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si2144973ybt.337.2020.06.03.04.39.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jun 2020 04:39:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="TtSe/HmN";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jgRkT-0006rr-6Z
	for alex.bennee@linaro.org; Wed, 03 Jun 2020 07:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jgRkL-0006qa-U6
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 07:39:49 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38057
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jgRkL-00013X-86
 for qemu-arm@nongnu.org; Wed, 03 Jun 2020 07:39:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591184387;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QcD+UtSE9nD24NSYXdL2r0s5dL2tS92+BkOAI85FaCE=;
 b=TtSe/HmNc8oUDEt8xl4wFA3HaWL7JvjKCPPf3q1D5R6fy496k4Avo7svci1AIuU5Eiq0YW
 f6suPsbz7W3X/CLXR82nkprQ/a8aQjEssvzz/fIu5zX7HVCAhd30aGcwscvNt2RBOiYNEj
 8nEIY2vYayxzWo13Thnu9wGQZIZhNNI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-7M1RZkTPPTq-CFTvAMVvjQ-1; Wed, 03 Jun 2020 07:39:46 -0400
X-MC-Unique: 7M1RZkTPPTq-CFTvAMVvjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3012780058E;
 Wed,  3 Jun 2020 11:39:45 +0000 (UTC)
Received: from [10.36.113.56] (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 70D805C290;
 Wed,  3 Jun 2020 11:39:40 +0000 (UTC)
Subject: Re: [Question] Regarding PMU initialization within the QEMU for ARM
 VCPUs
To: Andrew Jones <drjones@redhat.com>
References: <b2e401cd17fe49d792d09b31bd726e35@huawei.com>
 <20200603093745.dwfb55ny34az7rez@kamzik.brq.redhat.com>
 <fb9cf73c-e94b-b7f9-1d11-dc0353dd3996@redhat.com>
 <20200603102116.hbo4kmaitvh2kofl@kamzik.brq.redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <684088f1-cac6-59f3-46e9-65f039f468b8@redhat.com>
Date: Wed, 3 Jun 2020 13:39:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20200603102116.hbo4kmaitvh2kofl@kamzik.brq.redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/03 01:04:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Salil Mehta <salil.mehta@huawei.com>, "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jtxflb9IFWyS

Hi Drew,
On 6/3/20 12:21 PM, Andrew Jones wrote:
> On Wed, Jun 03, 2020 at 11:59:23AM +0200, Auger Eric wrote:
>> Hi Drew,
>>
>> On 6/3/20 11:37 AM, Andrew Jones wrote:
>>> On Mon, Jun 01, 2020 at 03:04:33PM +0000, Salil Mehta wrote:
>>>> Hello,
>>>> I could see below within function fdt_add_pmu_nodes() part of
>>>> hw/arm/virt.c during virt machine initialization time:
>>>>
>>>> Observation:
>>>> In below function, support of PMU feature is being checked for
>>>> each vcpu and if the PMU is found part of the features then PMU
>>>> is initialized with in the host/KVM. But if there is even one
>>>> vcpu which is found to not support the PMU then loop is exited
>>>> and PMU is not initialized for the rest of the vcpus as well.
>>>>
>>>> Questions:
>>>> Q1. Not sure what is the logic of the premature exit and not
>>>>     continuing with further checks and initialization of other
>>>>     VCPU PMUs?
>>>
>>> KVM requires all VCPUs to have a PMU if one does.
>>
>> I fail to find where this is enforced? Do you know the place?
> 
> kvm_vcpu_set_target(), called from KVM_ARM_VCPU_INIT. It ensures
> all VCPUs have identical features selected. The PMU requires a
> VCPU feature (KVM_ARM_VCPU_PMU_V3) to be set.
OK thanks!

Eric
> 
> Thanks,
> drew
> 

