Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2132568lfg;
        Mon, 23 Aug 2021 12:04:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa+f4dRfMD6lCsheIx2YW+cM0oAUeFt3rbp/6wxB+vUKXeVDCl4mtEE//BxBEnBFKhstfF
X-Received: by 2002:a05:6402:424a:: with SMTP id g10mr38202689edb.326.1629745478458;
        Mon, 23 Aug 2021 12:04:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629745478; cv=none;
        d=google.com; s=arc-20160816;
        b=Ow29JIjEoyiV1ZneQlDI3aIcPp3O50/hf7jm3qaRC82+boqGFBZygvPnjMAOKmehRG
         p50WNbTQQKqoU77A/MXsAMXzfgdJQaLd7htiS1b9vJhZUZntAxYlXClHLrTzsy/MJ3aU
         dwEqbeLOvlEjAgsScJgy+oRQAw8D3nGPQtPTtpeDbecCylAc+QrR1qUhloxtzjoPUT81
         cvkXH0JRpwSwuhE0rEFvcI/04pTJPTHvwFsHZ7KLRt1UtK4033WeRgVPubgvtec1tYIu
         E8ahwyTsVSOWD3sFx5lYOmp2cbHgNEPfQ+ZFoCgnpFMFYfv6UYkMS8GPgSgE5Asddz23
         R+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=s6azossO70ZeKGdG3ddTZqMsgn9VE+bvA2VK/PPLQXg=;
        b=jrfHOK5/91Fi3oTqubotV5VADo8nRgDUrzGgmSQwQTvj0qOjx5edHQ58d79qF61XdD
         Xa5huso+2GATGC1MuQZEkiCcCNFBax7mvvzrofnNM/NBNKMafY2CsZt7m34zqZdZKdmK
         yd9M601C9Y8MEJaWwvjwJ96kTyIBz9YmvCEhWgKQfdif0QRheq1iTr/Ee6HtewetscD5
         oURxE14cyK8QfOT8aRDaQYRDaIL3pPZjrcpVErOz8ywt09/LxLFnc2ZvZl5wvB1vnJ8w
         ixSuGCdZ/7uK2rm2/taXLw54v+33t3kCc2sausfiO66FXAFHDI+exjqvLYsnoMvGHMRc
         9bTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HZ+pQuHe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l7si18575965ejk.475.2021.08.23.12.04.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 12:04:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HZ+pQuHe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIFFN-00088Y-FY
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 15:04:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFFD-00086F-I8
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:04:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFFB-0001q2-Vb
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:04:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629745465;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6azossO70ZeKGdG3ddTZqMsgn9VE+bvA2VK/PPLQXg=;
 b=HZ+pQuHewibaDKKIxlNDMYxrd8YC4Y2BSMhYRuiNswdnJoL1PupC/YsGt6Y5h3hKWnQWYS
 vxwUthHKR1Kpz05S3iVEsIxO0XBK2WDbNTS7u4s/onZUnOL/wxV3nuMk3p5kMA5+jXvGBV
 kh0kcETPsA7tZHKOOv4AB8LAi985pvc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-AAsSV5nZP8KPY_pEZvDevA-1; Mon, 23 Aug 2021 15:04:22 -0400
X-MC-Unique: AAsSV5nZP8KPY_pEZvDevA-1
Received: by mail-wm1-f72.google.com with SMTP id
 c2-20020a7bc8420000b0290238db573ab7so80885wml.5
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 12:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=s6azossO70ZeKGdG3ddTZqMsgn9VE+bvA2VK/PPLQXg=;
 b=Ob5sDf27MiydfAV1ywgjARo5N8JRo9CobiBrMASeJTDjs+FpjRqh39L0LKiT9N4/0M
 vg0JKa4oQ/pzqh5g/TM+P+N8ko4lOHHEsVseZFnmlTBG2Xssxx8e7X7u4f1JTATPHze3
 +dknujeitGKGIqNveRREfv7ZkZhJ9dKdVyW2erJghBA9d991NJNMeVmkVfDC0ACyVGQh
 kioa+mQgy9OAgNQXlxj4ZAXpMZe8XR8VtPck2E294JLVzpS55uIfhG664/1iiH39qPQh
 1fh4ScJSMpAe9jBJlO3F+8vUN+sYKkZUUsUf2KUJgLf3ZQMun7DBKiK+yPpKInGMEDPl
 qcfQ==
X-Gm-Message-State: AOAM531tkrMDxtQ0NWOPo2RGpOJYh0tjC7LUxcbC1KDgBs+ce1yeWnJG
 +b/+fH/azcyerxOEK5S+GuGRlcJxC5E6t0m119bXuq8LKneU1sNhTKPEKKA2PECh3Dn7PQ2YVhu
 9KQr6S/SViBpB
X-Received: by 2002:adf:fbc9:: with SMTP id d9mr15188504wrs.152.1629745460851; 
 Mon, 23 Aug 2021 12:04:20 -0700 (PDT)
X-Received: by 2002:adf:fbc9:: with SMTP id d9mr15188484wrs.152.1629745460711; 
 Mon, 23 Aug 2021 12:04:20 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
 by smtp.gmail.com with ESMTPSA id
 z13sm15969870wrs.71.2021.08.23.12.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:04:20 -0700 (PDT)
Subject: Re: [RFC PATCH v2 3/5] exec/memattrs: Introduce MemTxAttrs::bus_perm
 field
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-4-philmd@redhat.com> <YSPr6dN+iKKFlCxy@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <922195af-f70d-eaf6-2aa4-b924f8196076@redhat.com>
Date: Mon, 23 Aug 2021 21:04:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSPr6dN+iKKFlCxy@t490s>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.743,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.023, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Li Qiang <liq3ea@gmail.com>, qemu-devel@nongnu.org,
 Qiuhao Li <Qiuhao.Li@outlook.com>, Alexander Bulekov <alxndr@bu.edu>,
 qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gX85lUZ+C9Vy

On 23.08.21 20:41, Peter Xu wrote:
> On Mon, Aug 23, 2021 at 06:41:55PM +0200, Philippe Mathieu-Daudé wrote:
>> +/* Permission to restrict bus memory accesses. See MemTxAttrs::bus_perm */
>> +enum {
>> +    MEMTXPERM_UNSPECIFIED   = 0,
>> +    MEMTXPERM_UNRESTRICTED  = 1,
>> +    MEMTXPERM_RAM_DEVICE    = 2,
>> +};
> 
> Is there a difference between UNSPECIFIED and UNRESTRICTED?
> 
> If no, should we merge them?
> 

I'd assume MEMTXPERM_UNSPECIFIED has to be treated like 
MEMTXPERM_UNRESTRICTED, so I'd also think we should just squash them.

-- 
Thanks,

David / dhildenb

