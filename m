Received: by 2002:a17:906:3657:b0:a0d:e0d9:b5bf with SMTP id r23csp2469684ejb;
        Sun, 3 Dec 2023 20:51:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh9eK1jD9KX28tMLq8bbCJGYfBicipF3yPM/jiu7YqHGkUIY/wYbsKIj6XoKZBcHAcQvHD
X-Received: by 2002:a05:620a:86c1:b0:77e:fba3:4f09 with SMTP id pr1-20020a05620a86c100b0077efba34f09mr4889495qkn.95.1701665511896;
        Sun, 03 Dec 2023 20:51:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701665511; cv=none;
        d=google.com; s=arc-20160816;
        b=PmuLphoGSOrAojL3P2MZTx/mFn5ObfUgygJVd28Z9c7SHYY3fieKG5Se+3+KDvlN1Q
         YksGgS91C5+nj2kt/Wm0nulkSg20xNOKj0yOdv66RjjQC1imWVQVsq20DD1Sv1UWLLHR
         7YDtIoTIsgAlUS0Yb/zLfRxybW0IKW7t4CQwVAuc0FhXhEuSdRbgYXAmfKk5455SOWSI
         U+72EA9Ldb1RqzV5wLcOn7AzTDeNLNO3JXmsiXdZ3OGnnEPZR73wBlo8py2g0pO2VuEB
         v2PZtm8v32TQL6NLu6I8nOE4xxmsWwekgOZKyT2XXbkWO4dbt9LvfBee4QJkqjjwKEyi
         KSUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=fVRlTxu0mD9DwLJS+D0xXMDxmFO96NNB6cw7qc2YbiM=;
        fh=7ioxn6LWsCzgGR12WMVU/wASROmAygH/3PvRDFKIzPw=;
        b=x03GPjeMml3B1XFu+xBd+GocE+r4oKbcb8aKUkMCa4KkAVAwak5/FEklyJjzer5tFr
         kWVWkpc7iwtg0tdkBzx0YTzrZhs/qSzXZXyaB/Qc/zF8ee4/dmrdwEyZaKPHNavyC3ri
         GtaMDtAJsCHUNrjbkP1q2GblFc/QAwx8/jwrEM89jxL+WvV93aPOMNLb+d74O3EVKnaO
         XeJUtGcyGEZb1r7qyduQxJc1hF6oFrS/UiitKSj17ajfRPYfW13ypKuRoXJgx+K26SWG
         miW9o0Bt6PMAh63sepfpO3BszkOGjLsgAJV/7L/n4vXxzzJpfF0uSDm12Jics0e2a3fu
         mv+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GX2Idqj8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4-20020a05620a408400b0077d773eb089si9298808qko.374.2023.12.03.20.51.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 03 Dec 2023 20:51:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=GX2Idqj8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rA0vl-0002Vd-83; Sun, 03 Dec 2023 23:51:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0vk-0002VV-EU
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:51:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rA0vj-0004ZN-1I
 for qemu-arm@nongnu.org; Sun, 03 Dec 2023 23:51:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1701665497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fVRlTxu0mD9DwLJS+D0xXMDxmFO96NNB6cw7qc2YbiM=;
 b=GX2Idqj8iuVEoNQfMmJOstxTQP5p9N7eQqguPReYpg/smuQxk+oa/mAyrsaO+yNxriANFC
 d61KD9PzemlyrkUmcD6ZASlgx4zIK3x/UkeFgFuIJWecJrCJOVo/UW1jdd5V1wfkbcnXWb
 3IlTnE9m4C30Q0RRbtC6ZXzsRhDzh1U=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-257-bhv8HA6DNlK12JSfimMJWg-1; Sun, 03 Dec 2023 23:51:36 -0500
X-MC-Unique: bhv8HA6DNlK12JSfimMJWg-1
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-1d05f06d312so11043525ad.0
 for <qemu-arm@nongnu.org>; Sun, 03 Dec 2023 20:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701665495; x=1702270295;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fVRlTxu0mD9DwLJS+D0xXMDxmFO96NNB6cw7qc2YbiM=;
 b=J6hNnn32KjIvUxasiplYa2Xb6R6Qgp+dDps3nKa5Vou/8wu0FSU7VKZ5ITES+/AEFh
 b+ieZk/T33wZuFkNZhOo5LYSQkki9Nt2FaPLpHM7+d9ZHGR2hmNZafUTPD5+psQbhr2M
 iEV4/nUBEJM8fSn58KkZJfz5Yg7TB23HkicGk9yQwz7riqV46ihe+XzGBInE+NMsKvez
 1NF6BGNcoxcJfxzaF4Z+GyhnG19wCTHKsX7jgp7x42II2P7LSib/JFQXu7U5S0mMCfUy
 hObHmCKtGGZe1L3wUr8Np18mpXLeBKZbXsBGWc174nkfQoZZtG+7H6PXh/dJbXjoB7Gk
 +t3A==
X-Gm-Message-State: AOJu0YxlaVgxJ3piQiaz8BPx7qe97J6NaZU0eyMzV5IFuhywupQ1ANWr
 Ix+gsWF26JIpHcawOhWpaxqTaZu2fSslH9nLCxN94n+/Jqm2Qg790hujeyI92r/Mt7KEVfXbIBE
 IXDQICY87tERk
X-Received: by 2002:a17:902:a98b:b0:1d0:6ffd:6e8d with SMTP id
 bh11-20020a170902a98b00b001d06ffd6e8dmr1081180plb.133.1701665495109; 
 Sun, 03 Dec 2023 20:51:35 -0800 (PST)
X-Received: by 2002:a17:902:a98b:b0:1d0:6ffd:6e8d with SMTP id
 bh11-20020a170902a98b00b001d06ffd6e8dmr1081170plb.133.1701665494835; 
 Sun, 03 Dec 2023 20:51:34 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 h21-20020a170902f7d500b001d058ad8770sm5298193plw.306.2023.12.03.20.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Dec 2023 20:51:34 -0800 (PST)
Message-ID: <472a4199-7d52-405f-a412-cbd8c2551214@redhat.com>
Date: Mon, 4 Dec 2023 14:51:29 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 10/25] memory: Have
 memory_region_init_rom_device() handler return a boolean
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Xu <peterx@redhat.com>
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-11-philmd@linaro.org>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231120213301.24349-11-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: e4yvrEvFwaC/

On 11/21/23 07:32, Philippe Mathieu-Daudé wrote:
> Following the example documented since commit e3fe3988d7 ("error:
> Document Error API usage rules"), have cpu_exec_realizefn()
> return a boolean indicating whether an error is set or not.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/memory.h | 4 +++-
>   system/memory.c       | 6 ++++--
>   2 files changed, 7 insertions(+), 3 deletions(-)
> 

With Peter Xu's comments addressed, to s/cpu_exec_realizefn()/memory_region_init_rom_device()
in the commit messages.

Reviewed-by: Gavin Shan <gshan@redhat.com>

