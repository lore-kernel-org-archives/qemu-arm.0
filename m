Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1388634lfq;
        Fri, 25 Sep 2020 09:03:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyObry/Ka9XF2BWPH0Ydi5pnZklf3prxE44EuxBZ4adm71ICJKIPwvDS/DHpl2NtsA+FCUi
X-Received: by 2002:a25:db4b:: with SMTP id g72mr6441551ybf.238.1601049796340;
        Fri, 25 Sep 2020 09:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601049796; cv=none;
        d=google.com; s=arc-20160816;
        b=om9n/AiRMhtl34YGYWXh+f+o8od3SB6FC9A37cPpnnoJml/5ZhvK4oj5bGkceA2YNO
         D5NKYHwpxjMC/y+8LE7DQVcICFMHUhHmfVLBqInFIXdnTK/r0lE1ejkZOkHDfy94Hnpi
         YrgWxP9aWfDG/+P17Zbgfuc3JiPm0kLDKBHZbmXubxpE07s1RQef15tB3/ZUJek2xUr3
         eMRc1SezR9VbmSODjBvuIzNLspx7/UN8a9V0cBBp/uXmYnXw1Xsft+WP7Bgl9Y88S7W7
         bwPpCvYvQ2pWUGf2T7otxeDl0uq5iOhU+KSVYzaI8pVaAXuDR/dsplktxX8FBuZiUsxO
         l/Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=l3yBKQeQJqiG97QgfxJaOgdMpk+Ofs6lr0suBJktfUo=;
        b=LFZmAzzbGu+I1vKPKoIDb24UH4+tZ77OWFeC3vu6Q/GDS1lAQ7RD6LbIA2z6k1hz9Y
         4ZHgEIE7zsrYD3ezR0N7oMPoYPnpkLLvRoU17q3A8FJeqdK2+vcwk5Npsf7/iCB11DIA
         +YqaF0/Zr91avsJ/T9bAswLLwdGIjhd3pG1ysZehdy3bAuMh67Y9g7o7M+6fW3RqxaWN
         8Xfv38zV65pg4mKDAJVCVOmHZ/561xcRIq8kx7ZSx7y6G8McPfZjF/V65V8fkgwfMRlF
         VPma5Uh67HWYCWX9wCzwHiT283CpsYXaHSdIiQrrMFA/biXrPZn2b3L4AF4J7Zt6+Ohj
         jFug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TDXtfHLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v197si2959241ybv.255.2020.09.25.09.03.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Sep 2020 09:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TDXtfHLD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kLqBn-0007Hj-L5
	for alex.bennee@linaro.org; Fri, 25 Sep 2020 12:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kLq2f-0007SS-3T
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 11:53:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kLq2b-0001Oe-1F
 for qemu-arm@nongnu.org; Fri, 25 Sep 2020 11:53:48 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601049222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l3yBKQeQJqiG97QgfxJaOgdMpk+Ofs6lr0suBJktfUo=;
 b=TDXtfHLDxK+TbSH674SwKEFmjS1TZ3a65DktZaWZYJQ+nwck2ynO+hu/17QKqGfC7JIP8W
 2rs5xdq1Oo9v2xd5Q9VsI8KVMMemRpshsfxN3JOjgYZDS9LZ57aCpOtuxOdCex/+XI2DVS
 e7Isvb63XM0/62MlSYGarv/S4MDhcSo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-erweG6DWOKyjRsq6abyIcQ-1; Fri, 25 Sep 2020 11:53:40 -0400
X-MC-Unique: erweG6DWOKyjRsq6abyIcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8235281F02F;
 Fri, 25 Sep 2020 15:53:39 +0000 (UTC)
Received: from [10.36.113.81] (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A72335577D;
 Fri, 25 Sep 2020 15:53:22 +0000 (UTC)
Subject: Re: [RFC 1/3] util/vfio-helpers: Collect IOVA reserved regions
To: Fam Zheng <fam@euphon.net>
References: <20200925134845.21053-1-eric.auger@redhat.com>
 <20200925134845.21053-2-eric.auger@redhat.com> <20200925144307.GA3809989@dev>
 <c2a4750a-dd33-2170-d450-3879e98210b5@redhat.com>
 <6ed38e381e57237c1dc84cc07d54f48895ccd517.camel@euphon.net>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <effd18e4-b8c2-c6d8-8108-a6e311ad33b8@redhat.com>
Date: Fri, 25 Sep 2020 17:53:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <6ed38e381e57237c1dc84cc07d54f48895ccd517.camel@euphon.net>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.238, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
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
Cc: lvivier@redhat.com, kwolf@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, stefanha@redhat.com, philmd@redhat.com,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MlldPmBf/7LS

Hi Fam,

On 9/25/20 5:44 PM, Fam Zheng wrote:
> On Fri, 2020-09-25 at 17:23 +0200, Auger Eric wrote:
>>>> @@ -365,8 +430,12 @@ static int qemu_vfio_init_pci(QEMUVFIOState
>>>> *s, const char *device,
>>>>      if (ret) {
>>>>          goto fail;
>>>>      }
>>>> +    g_free(iommu_info);
>>>>      return 0;
>>>>  fail:
>>>> +    g_free(s->usable_iova_ranges);
>>>
>>> Set s->usable_iova_ranges to NULL to avoid double free?
>>
>> I think I did at the beginning of qemu_vfio_init_pci()
> 
> Yes, but I mean clearing the pointer will make calling
> qemu_vfio_close() safe, there is also a g_free() on this one.
Oh yes, got it.

Thank you for the review.

Best Regards

Eric
> 
> Fam
> 
>>
>> Thanks
>>
>> Eric
>>>
>>>> +    s->nb_iova_ranges = 0;
>>>> +    g_free(iommu_info);
>>>>      close(s->group);
>>>>  fail_container:
>>>>      close(s->container);
>>>> @@ -716,6 +785,8 @@ void qemu_vfio_close(QEMUVFIOState *s)
>>>>          qemu_vfio_undo_mapping(s, &s->mappings[i], NULL);
>>>>      }
>>>>      ram_block_notifier_remove(&s->ram_notifier);
>>>> +    g_free(s->usable_iova_ranges);
>>>> +    s->nb_iova_ranges = 0;
>>>>      qemu_vfio_reset(s);
>>>>      close(s->device);
>>>>      close(s->group);
>>>> -- 
>>>> 2.21.3
>>>>
>>>>
>>>
>>> Fam
>>>
>>
>>
> 

