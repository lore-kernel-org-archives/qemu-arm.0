Received: by 2002:a0c:e741:0:0:0:0:0 with SMTP id g1csp672666qvn;
        Thu, 4 Nov 2021 10:37:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzavw4vrR13V5eCDvtQ+z3ceb50NPWswpXyS+d/OyfsUcOElk/BkGoT2olO2IhaSvZXnbXo
X-Received: by 2002:a4a:e14a:: with SMTP id p10mr3498201oot.69.1636047429005;
        Thu, 04 Nov 2021 10:37:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1636047429; cv=none;
        d=google.com; s=arc-20160816;
        b=cRRgdAFBbJeF06ze61ZyOuAOs7GXx63g++X7RuWY0lPFd8MOHfHYzhiSMAV4qq8AM/
         7f13Dy3PO/tiP+RqQfjUFZOUSXBov+i6j+iYh94uV1Kh+tPpIiR50Mu2xTYhisuGLnCK
         aakD2MISsPkpQQaecv3HHBP5LwuTwWAU5U5ZLiNxy7hHi2kMb6oQyx9PWXTq0l/5uMWs
         CDa4wtoEgoRLVaA3eXNwDGlN9gafnMkdzoT8SD8FizSSZsDKZxd4w6AH/MKjiQD6w6lx
         SGRNC747wr9rxsGaxvb8b5/hinCmAxbKVxxRie8s6Nf+2LstAdMVROk2w87Pro4xKOpG
         4oAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qOK+ZnlJYUqOa7P8mwVBDoh7r+LrTIicXeAaDvDGRmQ=;
        b=pwbdM8DJidV9C1M90whKw0/grWNILV6ji0J3XbKPc/ftb5ztFCrHTC9mq2EB5z0eie
         SMBL/CylEzrvcti2YIVoomAhopWLUDIC+zjlcTrUFltN8jL0BKmFtaTdxz4KDW5BC4IR
         ywa0Ku6VlHoexYjaPvsjEzd/lpuTkduonfJyHWonVXafrq6pNk+72SlcAZbjEazg2ikY
         uyVc4ZpgJP0Yln15em2NB+PM5AICaqlF9X+Yar9tQgZqaHsyBbgvTVXuNmhQbTUpsNI0
         XfKABn2riQd9Bv7fCqDzxRXx0moXM4ifmUw4fnb7KVncAg8deRrDHql7UNL0qOh73jBp
         D6/w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q3dK4tsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h26si3429290otk.43.2021.11.04.10.37.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Nov 2021 10:37:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Q3dK4tsf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1migfk-0000Lo-Fh
	for alex.bennee@linaro.org; Thu, 04 Nov 2021 13:37:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1migfR-0000LR-1U
 for qemu-arm@nongnu.org; Thu, 04 Nov 2021 13:36:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1migfO-0000zo-5r
 for qemu-arm@nongnu.org; Thu, 04 Nov 2021 13:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636047404;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qOK+ZnlJYUqOa7P8mwVBDoh7r+LrTIicXeAaDvDGRmQ=;
 b=Q3dK4tsfAiSOLJK6uCyiuVsU3SQS2R0kXGQFp7IgL+P2NMuyU5f6+oqnHFyXCXog8U7ayy
 OWSp2C32pC8OAYXGEjpFSuqYOs73x3iYR5RqA/wYuma/AslEfiVHPM97n7bSQMquBIV++i
 bZ2Fdg9JrRuNUSo85NeyhDeEIaCxSUA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-483-bSyXFERAMteEtAwI5_e-vg-1; Thu, 04 Nov 2021 13:36:44 -0400
X-MC-Unique: bSyXFERAMteEtAwI5_e-vg-1
Received: by mail-wr1-f69.google.com with SMTP id
 h13-20020adfa4cd000000b001883fd029e8so618150wrb.11
 for <qemu-arm@nongnu.org>; Thu, 04 Nov 2021 10:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=qOK+ZnlJYUqOa7P8mwVBDoh7r+LrTIicXeAaDvDGRmQ=;
 b=OL0100PcM1IzgvvTGCjNMblRa+UXX6aGmZFIsN9YD58cX2ni6Sp64hePQpm7+BI6tw
 7XWzgmGVrNx+8KEZvvYbLx1igGtTdEXGUjI5OlbkZ/oDjT+CKEVtDRoWc1VIicEn2Maz
 ghZhBFK3pqhDrQZ9nWddfO4pscmI80I7O+n1Axi1Xse1Tv4DF/WKiz7tGbDNlycgw68q
 9IfJLG73tofmW11IUE8eYzT//m4vfhXcqDRjqt5/Y7/S67Hd74/LzSRBYCLwAATsNOMX
 LCZ769F/BV4QVrEX4HCeAda1IIG2HOK7tI/+/nyRoR2xBa0NvqE5Oc+fx07x0CRVOYMF
 kwvw==
X-Gm-Message-State: AOAM53080DJZqv3QgzBF4QmBh7DapdlKE9ZTTGHDIVeV56son8CuE0Sv
 aCvmIyIL+/mt9uMZM0ejcFTipWc8gwMzg3r/K3eqkK9ys+srCKvsAxwKPkZR+v5alRgoIlpEyz6
 mievLVY1mc3t6
X-Received: by 2002:a5d:6702:: with SMTP id o2mr50210010wru.108.1636047402827; 
 Thu, 04 Nov 2021 10:36:42 -0700 (PDT)
X-Received: by 2002:a5d:6702:: with SMTP id o2mr50209963wru.108.1636047402477; 
 Thu, 04 Nov 2021 10:36:42 -0700 (PDT)
Received: from [192.168.1.104] (rm-19-28-6.service.infuturo.it. [151.19.28.6])
 by smtp.gmail.com with ESMTPSA id
 i20sm2954077wmq.41.2021.11.04.10.36.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Nov 2021 10:36:41 -0700 (PDT)
Subject: Re: [PATCH v5] tests: qtest: Add virtio-iommu test
To: Thomas Huth <thuth@redhat.com>, eric.auger.pro@gmail.com,
 pbonzini@redhat.com, lvivier@redhat.com, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211101184858.15223-1-eric.auger@redhat.com>
 <5e8c9e6a-830c-5f47-3b19-e878f021fa6f@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <4356c06b-ee33-3763-cec1-f9f9500fb98b@redhat.com>
Date: Thu, 4 Nov 2021 18:36:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <5e8c9e6a-830c-5f47-3b19-e878f021fa6f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.648,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.093, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: yLyo3jQLk7m7

Hi Thomas,
On 11/2/21 1:58 PM, Thomas Huth wrote:
> On 01/11/2021 19.48, Eric Auger wrote:
>> Add the framework to test the virtio-iommu-pci device
>> and tests exercising the attach/detach, map/unmap API.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>
>> ---
>>
>> v4 -> v5:
>> - remove printf and move a comment
>> - Added Jean-Philippe's T-b and R-b
>
>  Hi Eric,
>
> I tried to add this patch to my queue, but unfortunately, it fails
> some of the gitlab CI pipelines, e.g.:
>
>  https://gitlab.com/thuth/qemu/-/jobs/1739091817#L311
>
>  ...
>  Running test qtest-x86_64/qos-test
>  qemu-system-x86_64: -device virtio-iommu-pci,addr=04.0:
>  pc-i440fx-6.2 machine fails to create iommu-map device tree
>  bindings
>  Check your machine implements a hotplug handler for the
>  virtio-iommu-pci device
>  Check the guest is booted without FW or with -no-acpi
>  Broken pipe
>  ...
>
> Could you please have a look?
The test requires to be applied on top of Jean-Philippe's series
[PATCH v6 0/7] virtio-iommu: Add ACPI support (x86 part) and especially
36efa250a4  hw/i386/pc: Allow instantiating a virtio-iommu device
which allows the instantiation of the virtio-iommu on q35. The series
was merged so the problem should be resolved now.

Thanks

Eric


>
>  Thanks,
>   Thomas
>

