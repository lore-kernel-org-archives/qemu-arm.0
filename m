Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp2131862lfg;
        Mon, 23 Aug 2021 12:03:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyynp7nunN1cj1Rh+cLfL4FY3Sj67tAOj7Z1AAFrEDlKP9HERSrscmV77sRvTafxuIIklmi
X-Received: by 2002:adf:dcc7:: with SMTP id x7mr15226377wrm.173.1629745433687;
        Mon, 23 Aug 2021 12:03:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629745433; cv=none;
        d=google.com; s=arc-20160816;
        b=ZUtdSdUsyglkXf5kZFvKfLrEvrVoftgR1wd5m+4Mo95iCx2Eqw6PtI2a7A4C/SxBy0
         moCITvy3kFSvLEzvhYfL3q0zR+C8AiX3L4QsAreMU1UB14GoeSlBNIJSZMWZKqKePPsf
         PF6euFYhUZtacAad4Jvo4dhcPgVmhC5uYXu+BbH7SCjMIHwCH4PXgqy11oNUP33ojcuu
         lnz7l/wMk4XWQzPP8HlhU6ANSZMs2BmvQlJwIwnYjrLoZ16rZ1tgDZhTNr6nhVDU08r3
         CxoC8dQny5fSfwgefNJafnhAxNvWGXTZLcKWpOThb8WW3RyYAr41ySEgBAnu/XS2waKv
         gVFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject:dkim-signature;
        bh=EPSnTnUbDrQeN3FhSK/QZa4Xmec0PAXj74jCIRoq5WE=;
        b=S5M61n+FTFRJw7oUXviA9hnbJQhliW97CP5EJmn0ceZHv/wHcTPMNuluiCN8ij2k5q
         crWzDok5QVUK4Nu8U8dgBdjAuExHl286r+vZac4h8N1viyuDGgLqk/Ikrlfcc/KrHwUq
         4H9v7A7fRYnuhdTSJoZrRpC3FgQWA5HQtxnq/rUHdTHoKs7m9WGgfgC69RETWIzOdO6D
         h4XyHnBaZCmwLj9hULFcJwq2Zin+fIpdCIDerc2MskIOt03tsguEir9Q9TJlra1O3O67
         pFX9kBhPQPD+Q6qiE8YSO8Tt7BHLsscw3nls7gjE/c+umEfjGiNjF7BVJL1PY7BZRD8V
         RJLw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RQxJZFIX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15si4503310edd.40.2021.08.23.12.03.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Aug 2021 12:03:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RQxJZFIX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mIFEe-0006sG-P5
	for alex.bennee@linaro.org; Mon, 23 Aug 2021 15:03:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFEU-0006od-Ac
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:03:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mIFEO-0001Ja-Si
 for qemu-arm@nongnu.org; Mon, 23 Aug 2021 15:03:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629745416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPSnTnUbDrQeN3FhSK/QZa4Xmec0PAXj74jCIRoq5WE=;
 b=RQxJZFIXWaa3h9CtD/ew9vMhx938lD53vAQE2z0MZfQxuXo6TafIDvzMKzT6nk//quSj8d
 oRB++PSQk7SEC6LZ5Otq2KhPedQBDy3dJP2CCuogFwSRyzOHUTyxE+twGsToW6Y5Sxc9Tm
 Mv0lL3wepicL73lhHZy0Ge4bz7HwslE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-0rb2kfAnMjSk2KslN_7ftw-1; Mon, 23 Aug 2021 15:03:33 -0400
X-MC-Unique: 0rb2kfAnMjSk2KslN_7ftw-1
Received: by mail-wr1-f69.google.com with SMTP id
 p10-20020a5d68ca000000b001552bf8b9daso5206077wrw.22
 for <qemu-arm@nongnu.org>; Mon, 23 Aug 2021 12:03:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EPSnTnUbDrQeN3FhSK/QZa4Xmec0PAXj74jCIRoq5WE=;
 b=WxYN3ikaaXR8f3KvuOVkM2XNCuzBGP8CE2ZkhFqFYgVZQ4oGV7xyI0fX+5H+dmgy8X
 +MEiMOg91Zp7C1Sf3CR4997OKRT837GZhxJs6dDFrw01gohQJSIDtzYvs5pWKvQwWHDA
 0ETaPRfpcbVu+9zjL2Pp3RSC+jWrzA0uVwscW7Avbq08CP1ImqlsaX8kBYZTWsuEM59v
 qTOqePZ8z2c19BEXp58ILRO16HPU+XhT1FsoU/nEz08zttM1BuYqJ8lxAzGyOy+vIWLq
 D4xOFO5ssd3LlWdfuM/ix6C1WvEE2A3p5ZkbLGxWKWuArlmg7pdr8favoJ+EONhpZRgV
 iMPQ==
X-Gm-Message-State: AOAM5311we55nwVFyM2x8eAaZ+cUGegDstrGJc3v+mcGxNyh+VYdj6wi
 5VR7jd1/buBmCRgObwKcCG0IdIODtbt4z6p/JHqqDyagCdmKAdGP/H/6SiDoOoq1xKnPofzwdvV
 JPIYAPm/yx+tb
X-Received: by 2002:adf:e30c:: with SMTP id b12mr14977745wrj.347.1629745411781; 
 Mon, 23 Aug 2021 12:03:31 -0700 (PDT)
X-Received: by 2002:adf:e30c:: with SMTP id b12mr14977727wrj.347.1629745411658; 
 Mon, 23 Aug 2021 12:03:31 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c60c6.dip0.t-ipconnect.de. [91.12.96.198])
 by smtp.gmail.com with ESMTPSA id f7sm35822wmh.20.2021.08.23.12.03.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 12:03:31 -0700 (PDT)
Subject: Re: [RFC PATCH v2 4/5] softmmu/physmem: Introduce
 flatview_access_allowed() to check bus perms
To: Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@redhat.com>
References: <20210823164157.751807-1-philmd@redhat.com>
 <20210823164157.751807-5-philmd@redhat.com> <YSPsNA2WW8Sa0LCE@t490s>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <2160a13d-211d-5e3a-3a07-9d412a257eba@redhat.com>
Date: Mon, 23 Aug 2021 21:03:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YSPsNA2WW8Sa0LCE@t490s>
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
X-TUID: xbkTNnhofyyH

On 23.08.21 20:43, Peter Xu wrote:
> On Mon, Aug 23, 2021 at 06:41:56PM +0200, Philippe Mathieu-Daudé wrote:
>> Introduce flatview_access_allowed() to check bus permission
>> before running any bus transaction. For now this is a simple
>> stub.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Shall we squash this patch into the next one?  It helps explain better on why
> it's needed.  Thanks,
> 

I'd even go one step further and squash 3-5 into a single one.

-- 
Thanks,

David / dhildenb

