Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp156362lfp;
        Wed, 29 Sep 2021 01:27:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxDMhqMxrPnJrWU13n4pl2CTwWW0CxiOo8Mt/xEmNG+hXFRrETH6SZ1wisjpSXDU2rx2ei
X-Received: by 2002:a5d:9d44:: with SMTP id k4mr7141601iok.112.1632904079407;
        Wed, 29 Sep 2021 01:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632904079; cv=none;
        d=google.com; s=arc-20160816;
        b=CLErDlvYMdu6ySYKpeSPugmE4QbRhkXWiVZ98aVP1+Dm9EnJN0U0DpW2EWT1zWqI1b
         aHsNa4sH7DAdVxN2Hcqc97H1XpE8Q/hUO3vR4O9KPK8ugJje9gzoFWqboCmN3tHG6uME
         A73WVQEYGcfGsBW+DNK9gKAPaRRPkDwBqOn1y4NmxSG/eIE7VDWWaqUZ3IPFMAvoSxgC
         2PH1L/2/6S4cAF/alDhIohc3TdLGXFQVkdEI8POcKiM38KbLwatQKNMmT72Ta8Y6WJhq
         PmFPVfRZp9AwkyMgo1MM1vHbl6ieKmqPVleN0qmfMBglv894wvIFKo47GP7uOjBSuo+g
         w/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=JK80QiRkp9DfSYaoajSkIpKcWjbC0I7y2mRBAX2sFwY=;
        b=QjTpVMu5KY/VU1P2ye4WEmP/EdqRRqJR4/Wv6ySzUysGnYARBqdOEBNgu2e1s3+o4K
         7HhrhyRIfeeTm7G2Jmx1ojPvNCunHIMNeHZimIjbh79EFBo8kyvsjZn1MFPbm0f5vJXc
         X0vvi0476nJ0b9Nx2KkfUY7N3fvngRWtRz9wgsQ2CeC50DFbSj0jnXEGBShyBqQyIVxm
         q6kuntaCxbEygQJt0bOEdWyUOQR0nKIHzsTdUDXgaln9IBvTcsNXIqwDSP30UB5ECniX
         GNozinDD9k6zxOfYzcOLB7LIjVYTKxp8PhdyIc9fi9ov0YX/9sPKm5s8AzRv7JnDHxkS
         tqfw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Em5/8Eja";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si1928967jaj.65.2021.09.29.01.27.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Sep 2021 01:27:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="Em5/8Eja";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mVUwY-0001G3-OB
	for alex.bennee@linaro.org; Wed, 29 Sep 2021 04:27:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVUwF-0001ER-Vj
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 04:27:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mVUwD-0004WD-0m
 for qemu-arm@nongnu.org; Wed, 29 Sep 2021 04:27:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632904055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JK80QiRkp9DfSYaoajSkIpKcWjbC0I7y2mRBAX2sFwY=;
 b=Em5/8Eja6pjqlXIGO3TEqdKNoOV2kMkObzX7RWj+Z8t5Gnv/VTuvV7m9ellJ6ZzRjsDH9t
 TyqCOgZnMbK3eH8Mll455nYmmRHk+SDWHq0Ik3UJmHxFbGfhRON4lALUs7AHR2I9rpbNy6
 AOrSrYxxaFxuQmw/YPhsFFIVPKXDQfM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-574-Bd_JLGYLOwmogLiMPG-yLA-1; Wed, 29 Sep 2021 04:27:31 -0400
X-MC-Unique: Bd_JLGYLOwmogLiMPG-yLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 a137-20020a1c7f8f000000b0030cda9c0feeso857470wmd.7
 for <qemu-arm@nongnu.org>; Wed, 29 Sep 2021 01:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JK80QiRkp9DfSYaoajSkIpKcWjbC0I7y2mRBAX2sFwY=;
 b=G2KFvDKBAVnj6F4tpZFCAuLL2tUhKGtHQ1eprjWybew5bKAXz1WmczgZ8LjH4Sf77D
 Mi93mTlzBpN4vAnxKi3fqzcD1nielPFCswnjtY+xQyxn7E0bgtKgDhztFts/1B+JOa3G
 ojTJYs7YkqdapIrMHsO1lFqce27hARluqJvP0H7Jr7rPZQoYd3joeZi5R2lDke9HEEdY
 TW3VPRjoZCCKiHB98uVclRXc7E5ItdJN8sZfgqsGDOxeVnh1rwJSS5jCpQe008m/uZIh
 eraOtslscsu6pCA8Tq+2/duoLeHcZ1WR9GaQ7aAHPGZB0EzKEGwGx2jqKJbcmgR6nCfA
 ljaw==
X-Gm-Message-State: AOAM530J1QhrRdVz6C3Tbgw4OUnwaPwQ/ibhTIJ2643qF15uihish40h
 6W6jjkCTCoXzS5nWI+FtH+V5kRlQ17kQxnd5lEPOP5QcCQvxMFNj7jxvwz8CCwX6NH41W38+WpZ
 m9+HczrOAaa+M
X-Received: by 2002:a5d:6506:: with SMTP id x6mr3491249wru.255.1632904050709; 
 Wed, 29 Sep 2021 01:27:30 -0700 (PDT)
X-Received: by 2002:a5d:6506:: with SMTP id x6mr3491228wru.255.1632904050567; 
 Wed, 29 Sep 2021 01:27:30 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id d16sm826703wmb.2.2021.09.29.01.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 01:27:30 -0700 (PDT)
Message-ID: <c7312892-33e3-6c70-b85c-7893cc1936cc@redhat.com>
Date: Wed, 29 Sep 2021 10:27:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v12 16/16] machine: Make smp_parse return a boolean
To: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>
References: <20210929025816.21076-1-wangyanan55@huawei.com>
 <20210929025816.21076-17-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210929025816.21076-17-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.562, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Pierre Morel <pmorel@linux.ibm.com>,
 Pankaj Gupta <pankaj.gupta.linux@gmail.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, wanghaibin.wang@huawei.com,
 qemu-ppc@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h05ue1rYhetp

On 9/29/21 04:58, Yanan Wang wrote:
> Quoting one of the Rules described in include/qapi/error.h:
> "
> Whenever practical, also return a value that indicates success /
> failure.  This can make the error checking more concise, and can
> avoid useless error object creation and destruction.  Note that
> we still have many functions returning void.  We recommend
> • bool-valued functions return true on success / false on failure,
> • pointer-valued functions return non-null / null pointer, and
> • integer-valued functions return non-negative / negative.
> "
> 
> So make smp_parse() return true on success and false on failure,
> so that we can more laconically check whether the parsing has
> succeeded without touching the errp.
> 
> Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/core/machine.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)

Thank you!

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

