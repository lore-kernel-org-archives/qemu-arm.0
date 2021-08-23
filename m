Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2128493lfg;
        Mon, 23 Aug 2021 12:00:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxAaLR16QsO8OyopdW/CR4UhDQncSkFCjzwnx1hB68NxMb5Mnc/v0ra41fjNijiuicu3Xa
X-Received: by 2002:a05:6102:3047:: with SMTP id w7mr5584303vsa.13.1629745200222;
        Mon, 23 Aug 2021 12:00:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629745200; cv=none;
        d=google.com; s=arc-20160816;
        b=XInEqIdoIgAs1+cTb+P5OZcNtFSsrRdE58y5oEjrw9XXMjqY1KOkPwi7+tbF+p6Hfg
         X/uYeveF2+VBEyaS/qcs3EmJZVYc8r6dPGJNFILEsGXd0Y0lr5e0Wyj0Vr5X5lZHDBa7
         +HcwVhumb2FvsydjGwnHrNvQBVONbWymDrR9SMmZ4YZSeOUawzwiyCfP3M/AflrCkEb0
         DvOCpbbuWxiee7/D6Zp/qzfl9WO4Xni9OWM9uhXS+/NBliF+CNfwbKRHxZQNy+kmLcDn
         TYs2SV6DrsfduZhKVtgRyjY7jUovUsq9+kgdgecuCHqsRsgvf5F5acPVhKq/hOiPRCV7
         RCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=bFmigRs8XC+p6jbi5ZgMA+6f5TYnoDYbU94VVUbxvNM=;
        b=OUMQxtEnzsnWGU+WUHyWfPAdSsNIVMb4lVbJCIYXwWfbRBiJZ5KrjLB/FTK3ncbT2O
         MLknKOWF4s6011mvVCeWEuBYCfOA9KfnEQnTJmFXQ+MrHWOuuX5kdVXn0Ro3NweyEMJm
         kiFbZxMQdvQwysdVvCvHIY/GDxPU9Jec8eG9/NbPZyXna3nsAkYoulI892R7Phprs9UL
         8U/Zfsox2/cmrI8hLTp/J9hqeJGIj65a3BMzpTLYzWrEewMrjY0KJx5XPInNKy84wa0p
         jq4O87mai4v95LoCZhyy8V9pAV+Bug4GngY6Q470g5g+7gRudSWHit7fZZou0fbpxZJh
         Bzrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dCRDL3Bb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w42si5521416uad.230.2021.08.23.12.00.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 12:00:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=dCRDL3Bb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIFAt-00014h-IS
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 14:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFAW-00013F-EX
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 14:59:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFAT-00074k-6P
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 14:59:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629745171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bFmigRs8XC+p6jbi5ZgMA+6f5TYnoDYbU94VVUbxvNM=;
 b=dCRDL3BbiSRCvuZd2siTvorbJtF8QxgkbMk39+qrppfdKM51OBjVqmoeGsYzpjed93SQA4
 TeHV8Dn5fpJlfI1p9I5w/yhBisL8vgfjU8cYUuREhfvyUdGk9FyPgce3ccV+kl3+6x133t
 5TSLPZUbQPN2Bx/dFjhiCo9pqi6kufw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-cFJppNVYOHqHwPUqpo3cWw-1; Mon, 23 Aug 2021 14:59:29 -0400
X-MC-Unique: cFJppNVYOHqHwPUqpo3cWw-1
Received: by mail-wm1-f70.google.com with SMTP id
 r4-20020a1c4404000000b002e728beb9fbso62967wma.9
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 11:59:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=bFmigRs8XC+p6jbi5ZgMA+6f5TYnoDYbU94VVUbxvNM=;
 b=DTRvBPCYemoRcJjwLh4hYqL2GG6i/JG5hAvCLmFMKDs00Riz+VbkwAMVVsmxGi+Y7K
 7Lac6u6qawynW0y1c3a9vUAVr+4sGrCXvrPUWQDasKHEnVTkuiE2uZZrk3b7cm/t6Yw5
 Xz8jU7plw4sk4IStWCj3xnZLEvlqTK+RgcB/dgrE3Tpe3qB+rvjf5ZJWaPchWbdkp9yw
 61T17DcV4yRunRl9zdnMju7oeKAu9fT6olMsR5eoIPdCuyZGtDEF3G1H5y1gczvnU64o
 10D6R+63cFtFo0ml3jx9gwNeCxjDMo83p0KmC2Fh4bwyjcjbA0bYJWmx0oKihHu57cMB
 Kikw==
X-Gm-Message-State: AOAM530hybnTec1FvizsV+KTDo4GRgUTW/xDR/vKo9wvKs7yqlK8lFe5
 skeChh6gfXAC5A5FzkyEH4ytMqcU8MHCgXpBuaVvkmBxjgu4CCF4KxA7swr6xlsnbe7JHolBvel
 3pS2YD7ly2dvn
X-Received: by 2002:a1c:7e12:: with SMTP id z18mr55467wmc.60.1629745168679;
 Mon, 23 Aug 2021 11:59:28 -0700 (PDT)
X-Received: by 2002:a1c:7e12:: with SMTP id z18mr55435wmc.60.1629745168434;
 Mon, 23 Aug 2021 11:59:28 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
 by smtp.gmail.com with ESMTPSA id
 t11sm31320wmi.23.2021.08.23.11.59.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 11:59:28 -0700 (PDT)
Subject: Re: [RFC PATCH v2 1/5] softmmu/physmem: Simplify flatview_write and
 address_space_access_valid
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-2-philmd@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8e8b1295-b6ba-0ac7-02fc-c347dccd1ce5@redhat.com>
Date: Mon, 23 Aug 2021 20:59:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210823164157.751807-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Li Qiang <liq3ea@gmail.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 Peter Xu <peterx@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wGv5B+eNEx0K

On 23.08.21 18:41, Philippe Mathieu-Daudé wrote:
> Remove unuseful local 'result' variables.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb

