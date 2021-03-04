Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp6235353lfg;
        Thu, 4 Mar 2021 05:26:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwKSv1SWR+ym7E7fjanA/CgLdFi4EWXgdXp+mjfYS7ky11PNxu6oftZBcRG1cuQap8sJorU
X-Received: by 2002:a05:6602:737:: with SMTP id g23mr3585238iox.130.1614864382367;
        Thu, 04 Mar 2021 05:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614864382; cv=none;
        d=google.com; s=arc-20160816;
        b=dc6Ejptkad9qSijCOt1/x13AYkUbnfEVhrVMVUxRlm7ARTLAQICFoE8MAFfVCA9fAh
         mmiYGPw0ik7svJEm634JF120F8uiQ1M8LH40aB7RZZr6xCGl/xxXiIWp1MZWDhPwXmoC
         01Fut6WZ3GP8fxTPr/DNBQ5GKFL35urnHNs2w7Wd48XHsKzdOfO01arEvcsaE8ntKfkr
         AL5i4Ys7g7eA4YqRFBr5CKk7hqd9CLAPX1r1s8ygqNJJ5n9wLgPuvUyG2xfdP7JGM2aG
         uo/StNwnVoSpD6jV6frhgzjHmVyFNzwA2PxY2Y2ZSVbPlrykkhUjOAiTCY1+W0EvOtL5
         10FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=epVabmFghWRYjAezRywLsA7F665VoAppwPqPKAd51DQ=;
        b=eELlO+Ugd7dDbKiiE/QFpKo7nmHFlxMSHj2scbixyx2swvdrBX7rgshdA/NemvZYP+
         SUDyd3zz5CqJNntQGqidB6u6LE25CZCoAnJu4dmpwu2JSrBX0PDiZITL3PbxRjusWBMl
         H2K8SFikDobiFrnvSZaSb0HyVH64OOdKsBILm+zpOxwrcYO9WGjtlDYMNigXEtJIsJPT
         TVVKhjg+njT7F5FeoS67WowHcwfQzHpWyYenINS0nYU9bKnqWa5jTUhWeB3ojhf2thHL
         WxmCKFC8HpRWfYACJUL58bHAEWoAqKS/N20g7MLn3d4d0o5EQPuremSOFhamY5LSd/Hv
         wiNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JPoyeanj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a18si25751682jat.23.2021.03.04.05.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Mar 2021 05:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=JPoyeanj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lHnzh-0002nA-NY
	for alex.bennee@linaro.org; Thu, 04 Mar 2021 08:26:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHnzZ-0002la-8u
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 08:26:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHnzW-0003rD-9R
 for qemu-arm@nongnu.org; Thu, 04 Mar 2021 08:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614864369;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=epVabmFghWRYjAezRywLsA7F665VoAppwPqPKAd51DQ=;
 b=JPoyeanjHqcVvRt2/EWloUuhJBXTmfQ+b9q02rV2osAmwf0qc6JG8K2lfkC1MByVjYx4/d
 nkDD4y1XDhL5KbyWWUupWBW3JI7EibDliKwNwnzN1jeh46st64n8jrj/7R+iR671Kh/Ler
 EWIaEFr2tblpGywZV7q7yVltk0/7d20=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-DmzX4cRpPuqiSJejK6R32A-1; Thu, 04 Mar 2021 08:26:08 -0500
X-MC-Unique: DmzX4cRpPuqiSJejK6R32A-1
Received: by mail-wr1-f71.google.com with SMTP id x9so10498875wro.9
 for <qemu-arm@nongnu.org>; Thu, 04 Mar 2021 05:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=epVabmFghWRYjAezRywLsA7F665VoAppwPqPKAd51DQ=;
 b=LCoIrSuRKLLZkeTeQ9sZHekAsYb8y1g27YYyw5sPfojd77fwT2Rzw9TSn36znZj2sc
 wW5SQD103dtS3wNLOJDOYx73lTN3XIKxT3EKW9T4mGJjARJeeHJ29ePoS9hBoUAW6XBz
 nqzvNXs7/tb98PBBDi33MNzj2vGmYGN6Pvlro132SUP/1yXd9NlTsPtURXtvealI9CgT
 6fRtl6fqd1AYNP9DUaMC7lU91tL3SvTFO1F8oNkZtT5rBaqI6m24HgbH+bk8NWnMqCv1
 z48Ck8bqFJV7HPm3fAXAPi4EUKcuw7SoYD2tGw/WH15xI3GmNsPi8K/rDYz+MTOGi4AG
 QhYA==
X-Gm-Message-State: AOAM533Gd9iWtJt+kqeoyIAT03RjWRw8o6HJjV/VDgy3+fdDDt26o0Yz
 DhJ4E36GWqx2PRTdcMQzHaIk0RoDxom3PV1IuoUEo8p56dvi/VB9hVZhYpahJvPn5Oyl9vZgwNr
 OFqMMqxU2Ma6q
X-Received: by 2002:adf:9148:: with SMTP id j66mr4187991wrj.124.1614864366782; 
 Thu, 04 Mar 2021 05:26:06 -0800 (PST)
X-Received: by 2002:adf:9148:: with SMTP id j66mr4187941wrj.124.1614864366510; 
 Thu, 04 Mar 2021 05:26:06 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id g11sm24741248wrw.89.2021.03.04.05.26.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 05:26:06 -0800 (PST)
Subject: Re: [PATCH 04/19] cpu: Croup accelerator-specific fields altogether
To: qemu-devel@nongnu.org
References: <20210303182219.1631042-1-philmd@redhat.com>
 <20210303182219.1631042-5-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <be8823b0-3d58-e7d1-d2a9-447d78bdb50e@redhat.com>
Date: Thu, 4 Mar 2021 14:26:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303182219.1631042-5-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Claudio Fontana <cfontana@suse.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Sunil Muthuswamy <sunilmut@microsoft.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cmoUIUZ1ax0s

On 3/3/21 7:22 PM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/core/cpu.h | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Typo in patch subject "Group" ;)

> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index c005d3dc2d8..074199ce73c 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -393,10 +393,6 @@ struct CPUState {
>       */
>      uintptr_t mem_io_pc;
>  
> -    int kvm_fd;
> -    struct KVMState *kvm_state;
> -    struct kvm_run *kvm_run;
> -
>      /* Used for events with 'vcpu' and *without* the 'disabled' properties */
>      DECLARE_BITMAP(trace_dstate_delayed, CPU_TRACE_DSTATE_MAX_EVENTS);
>      DECLARE_BITMAP(trace_dstate, CPU_TRACE_DSTATE_MAX_EVENTS);
> @@ -416,6 +412,12 @@ struct CPUState {
>      uint32_t can_do_io;
>      int32_t exception_index;
>  
> +    /* Accelerator-specific fields. */
> +    int kvm_fd;
> +    struct KVMState *kvm_state;
> +    struct kvm_run *kvm_run;
> +    struct hax_vcpu_state *hax_vcpu;
> +    int hvf_fd;
>      /* shared by kvm, hax and hvf */
>      bool vcpu_dirty;
>  
> @@ -426,10 +428,6 @@ struct CPUState {
>  
>      bool ignore_memory_transaction_failures;
>  
> -    struct hax_vcpu_state *hax_vcpu;
> -
> -    int hvf_fd;
> -
>      /* track IOMMUs whose translations we've cached in the TCG TLB */
>      GArray *iommu_notifiers;
>  };
> 

