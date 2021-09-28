Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp4758646lfp;
        Tue, 28 Sep 2021 04:08:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzCPaOpPS+Dz+rKb3QiBtPGsBi/LvkV/dI1+s8/z9SUsCu1jAsnG3JWe2YDwDx1qXYmZhFu
X-Received: by 2002:a67:741:: with SMTP id 62mr4170788vsh.52.1632827308275;
        Tue, 28 Sep 2021 04:08:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632827308; cv=none;
        d=google.com; s=arc-20160816;
        b=tJc44iAwCs3L5mtML4lNNiswGgqDUndUuPHu8ejl4hNggNOUkY1cFrJfpNBS/GNiDy
         JBkrZO+fTZ7iaOW9O0XoHz/sa7X7S9THfVF8KeR2e6uZDuxsa4cd8Qvj5q6F+bbaeOnI
         UyCm6vFh0V7kOb51Sbpr+dKF5hr977g4RiUDDDOHXqIUiz1NTIAmSJFxRCLN0mbncBMC
         DxxmNsZwqj+sEKofUMmiu91+gjepHwuo/71+L78MR1HEF2fQIhmu2iDr/CQrcTT4O4Hu
         YpxxyihZ5EMWp21FWfhrZHtwZMpD5IJEU3sO348l3LO7pWw0JFzNSFuACMHdyA1zz0Ps
         rcag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=1+yOt0WiPspryEx5AGixJ03Jo6YXDu6P2uhPaytnRLQ=;
        b=HU7WkT+H8+YQrkh685jfnw5x4P+XdOXSkJ/PqSE1ndScdoLGSUMCTAEpnVvPTh8Zl0
         TtcoPZELP/r8c4x2y9ah5yC9Jw0hgjHT5YxS7FrE9iMkSLKKY91NqXKUKAI89weDKgDB
         WLF8jd+h93qU53Yc0MnpuPJY1/qCwjia8KcrRkLztkyMmjWV6KwMkC/DKhTSdue+NENx
         DxQe3HjfSP2NvTWX0FSOeIANYLiDnkIQJb8v2azLewPKtMA7k/uzmYyMWgqALM4lyLId
         71CYANhz1J+aWbyIlqddmRmTVjCNUuF2B3QSfQY2Hrdxs4jlMU3dDnejAxPJthMfPumA
         AuJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="U/j7WfWv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si10000247vsg.116.2021.09.28.04.08.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Sep 2021 04:08:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="U/j7WfWv";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVAyJ-0005ws-Hl
	for alex.bennee@linaro.org; Tue, 28 Sep 2021 07:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAsI-0006IH-Ub
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 07:02:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVAsF-0002mX-NY
 for qemu-arm@nongnu.org; Tue, 28 Sep 2021 07:02:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632826930;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+yOt0WiPspryEx5AGixJ03Jo6YXDu6P2uhPaytnRLQ=;
 b=U/j7WfWv4PWLcZGYcBmoMyPW8UW20jOWqiONUCHGyAq/RABpcWLzGNt/wv7g9JcqpVsqyL
 sS7V2K0uOyMJS+DwZMVF2Ij5xAk7m8ewk4+J038yOUgzGF3AIDIRVZ+8Dpt6DYPo0DZQS3
 hPKK13dou+k5UwMjakh53bPTvLwlYK4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-eGVpVQKqPeyb5xHlcXF_xQ-1; Tue, 28 Sep 2021 07:02:09 -0400
X-MC-Unique: eGVpVQKqPeyb5xHlcXF_xQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 70-20020a1c0149000000b0030b7dd84d81so1833040wmb.3
 for <qemu-arm@nongnu.org>; Tue, 28 Sep 2021 04:02:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1+yOt0WiPspryEx5AGixJ03Jo6YXDu6P2uhPaytnRLQ=;
 b=cbUeMEluEwCPLjwHNB/UDif2hVQ9x1Pu9juYsCTi7qYBtoBx8ysotsW89KXFtwR7Zo
 lRFtg4swPwTzakrQwgNM2qbCM2ADSobjTL0gBS5ICGtR0VnlDbVlNz2Qry05ZxWbh4Ez
 V3TCER9BnJQ+6zA++1cW1mBoYO5KhauasrnDm4765qd3VWxQlrWEfrsLUJSSnLU05mdz
 aHL822LV8dI7yJa91NXS8Wwl97PCrT0YXBXfTBFlB7oakx8cwouGm5acqV/gCd0eMUg9
 ufiYNNZO8mXwhJPSm8QSkRXFn5TksgS8/G68HLY1Fsx6omxese2pCm7Ot9pv/EZfseB3
 ljbw==
X-Gm-Message-State: AOAM531hKWtl2axzbrvlsAuJRADhPkAMEGzvpDE8M97UH2M3bWT6hxbC
 cf/ddDSZNO7NAQbXifJjoi0zbQ/IcntFqyz6AF7M9kWnrPrz+h5neHn9rJDKE4ssybKwVVENP0W
 3IbymdYS6UR9Z
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr5547373wri.284.1632826928028; 
 Tue, 28 Sep 2021 04:02:08 -0700 (PDT)
X-Received: by 2002:a5d:64cf:: with SMTP id f15mr5547351wri.284.1632826927878; 
 Tue, 28 Sep 2021 04:02:07 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id j27sm2550812wms.6.2021.09.28.04.02.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Sep 2021 04:02:07 -0700 (PDT)
Message-ID: <9aabb237-c256-757a-90e7-681f947fd2f4@redhat.com>
Date: Tue, 28 Sep 2021 13:02:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v11 11/14] machine: Make smp_parse generic enough for all
 arches
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210928035755.11684-1-wangyanan55@huawei.com>
 <20210928035755.11684-12-wangyanan55@huawei.com>
 <2652509f-97d7-f999-a36f-47fc3b5ca346@redhat.com>
 <YVL1UuCQ6+KiPwfR@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YVL1UuCQ6+KiPwfR@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, qemu-ppc@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Yanan Wang <wangyanan55@huawei.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 wanghaibin.wang@huawei.com, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LjPH+VJyDeMK

On 9/28/21 12:58, Daniel P. Berrangé wrote:
> On Tue, Sep 28, 2021 at 12:57:21PM +0200, Philippe Mathieu-Daudé wrote:
>> On 9/28/21 05:57, Yanan Wang wrote:
>>> Currently the only difference between smp_parse and pc_smp_parse
>>> is the support of dies parameter and the related error reporting.
>>> With some arch compat variables like "bool dies_supported", we can
>>> make smp_parse generic enough for all arches and the PC specific
>>> one can be removed.
>>>
>>> Making smp_parse() generic enough can reduce code duplication and
>>> ease the code maintenance, and also allows extending the topology
>>> with more arch specific members (e.g., clusters) in the future.
>>>
>>> Suggested-by: Andrew Jones <drjones@redhat.com>
>>> Suggested-by: Daniel P. Berrange <berrange@redhat.com>
>>> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
>>> ---
>>>  hw/core/machine.c   | 91 +++++++++++++++++++++++++++++++++++----------
>>>  hw/i386/pc.c        | 84 +----------------------------------------
>>>  include/hw/boards.h |  9 +++++
>>>  3 files changed, 81 insertions(+), 103 deletions(-)
>>
>>> +/*
>>> + * smp_parse - Generic function used to parse the given SMP configuration
>>> + *
>>> + * Any missing parameter in "cpus/maxcpus/sockets/cores/threads" will be
>>> + * automatically computed based on the provided ones.
>>> + *
>>> + * In the calculation of omitted sockets/cores/threads: we prefer sockets
>>> + * over cores over threads before 6.2, while preferring cores over sockets
>>> + * over threads since 6.2.
>>> + *
>>> + * In the calculation of cpus/maxcpus: When both maxcpus and cpus are omitted,
>>> + * maxcpus will be computed from the given parameters and cpus will be set
>>> + * equal to maxcpus. When only one of maxcpus and cpus is given then the
>>> + * omitted one will be set to its given counterpart's value. Both maxcpus and
>>> + * cpus may be specified, but maxcpus must be equal to or greater than cpus.
>>> + *
>>> + * For compatibility, apart from the parameters that will be computed, newly
>>> + * introduced topology members which are likely to be target specific should
>>> + * be directly set as 1 if they are omitted (e.g. dies for PC since 4.1).
>>> + */
>>>  static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
>>
>> Can we have it return a boolean instead?
> 
> That's unrelated to this change, so ought to be a separate commit if
> done.

Sure, fine by me.

