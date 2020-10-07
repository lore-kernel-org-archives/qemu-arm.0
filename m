Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp430907lfq;
        Wed, 7 Oct 2020 06:57:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkSn3FCQVdiBc+xAFWHIsP1XEv1o4hz/obrLfauqYkjsTIENOGLDy8FTtJY6RXxipTG/zQ
X-Received: by 2002:a25:d45:: with SMTP id 66mr4136511ybn.231.1602079036701;
        Wed, 07 Oct 2020 06:57:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602079036; cv=none;
        d=google.com; s=arc-20160816;
        b=oiDNIDfA/ApcJVvMAC7fno+MdlrWQ5wDVXsJHRuPdrT6CxAX8+lu2O804a7hI25DjR
         hUBKmqGzXkgKT3uzpLvPKq/qpAGRfEoNIZ/6QDU+cZ9UG8rj5FBOor8QmItIqV8Sg2/S
         gRbqkqSEoZ1ij7wkr51dRNafz37A+XLh41Gc/JbxCMT68yaFvmj7h+5/duGHWnv6OVxt
         KBTZQG6QceayIIVaJvwKjtkDPjpZVy5CKiqgosHrCwUxaeyfR8ls+gsl1ihvtMR6zRzu
         emkbSwu9FY1oU8h/mAiiDFNlAHYMQIJoOhre+NbyxaVkUmc7Yc2SLN44WOtqXMvT3SFI
         vdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+9rNT+iiAfWSu6aL5L3R1Fn2fnsuD64gg7o9yydA8y0=;
        b=B/RFzf/w3lCsJ65AJsbW2ut61jvFXYJJtkykOwPysOWvZtzPoG/g8dOBNRaTG1/NNv
         wMS3vPFHwSJbJyxKS2FnKzclfdIc6mkfg1KtlAM4/7HuZRCrjQOr2hx588UZn7Q/Glv+
         FB8DkFErzqmuoRHQMBH3MnvtVHTHMgIvy5H5+dPlamNadWsNBTnBdkQhWE+nu5ALwZ65
         SuzBVceNixwDRPuYOdYWgvMvsrZB5nk3phMsjN3jla1ps3riir2HqSfYwKMAH6bZJJHV
         Nrp0B8AqLIN3B1BHDNa8rpJ7wgMP9Ab8etvYQCj+rzZJYhJSRY6THMA16b8DLTivKOAV
         SSDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i+htwH6S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y17si1897367ybr.148.2020.10.07.06.57.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Oct 2020 06:57:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i+htwH6S;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kQ9wS-00063C-41
	for alex.bennee@linaro.org; Wed, 07 Oct 2020 09:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ9vO-0005Aw-3r
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 09:56:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kQ9vI-0008Ne-JQ
 for qemu-devel@nongnu.org; Wed, 07 Oct 2020 09:56:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602078963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+9rNT+iiAfWSu6aL5L3R1Fn2fnsuD64gg7o9yydA8y0=;
 b=i+htwH6SPBO8+XGYv3godjd0otQaNVYTHZ3JvJ7nqhZqtX8M1xQ8CTG8+TI1vZwuzUUbeg
 Dh1l5m4y2fIo2ZDw8tFBPNT0AfuXZvn74M25r1/7vw144H1GxJYFwfLDA3fWjLa6aSHWFJ
 VKoFRGIfKiJgiXkXyT2jEssJne2aLoQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34--UCVPnlaPuqRliOxwV08pw-1; Wed, 07 Oct 2020 09:56:01 -0400
X-MC-Unique: -UCVPnlaPuqRliOxwV08pw-1
Received: by mail-wr1-f69.google.com with SMTP id 33so1036551wrk.12
 for <qemu-devel@nongnu.org>; Wed, 07 Oct 2020 06:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+9rNT+iiAfWSu6aL5L3R1Fn2fnsuD64gg7o9yydA8y0=;
 b=RjKGHQv/AUPixQrdYRJDKnh8hz6+5EA/KLpP6W7rLAX84/73GiafPpW89rfRQ02MA6
 w5cDMcqTfJtJSa6qc7ddESVGqlmGcdAk91kGGsTenDjaKuCcYzl4LVbVi3A7HsS8ljrt
 fo06Znb5iIVRW8+mFOp2Y5liUdBEC3VBBEtNlUMmlxXVuAJ+QWMyNXmINcKvID7hB5oQ
 wmA2vTgLICVcl2q5ikM0D53/pWl2kGu8sN4ZAubeNyeI901cffoyWwzgHyaunqyNSxUc
 rgxzqZzK4GQHQuS/193IAl6B6XUJJVBrjNFa3AmPUc0H1KdB2OTyY7Hvtx5bDHnaeE8c
 tQ8Q==
X-Gm-Message-State: AOAM5317xrCd+e9QnWncOltykeQldOU6I4IFiF2ZxZXBT3vnXuTRQs26
 HEkCfZLZXfT72hZncTvhJU9lDDBSe4F5Z83SK/jEEiW9jTwHiRqzRvwhBeQlTVIWiSWF8dJPZr4
 6wShsvRkc9f3/vww=
X-Received: by 2002:adf:d08e:: with SMTP id y14mr820850wrh.424.1602078960658; 
 Wed, 07 Oct 2020 06:56:00 -0700 (PDT)
X-Received: by 2002:adf:d08e:: with SMTP id y14mr820823wrh.424.1602078960382; 
 Wed, 07 Oct 2020 06:56:00 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d2f4:5943:190c:39ff?
 ([2001:b07:6468:f312:d2f4:5943:190c:39ff])
 by smtp.gmail.com with ESMTPSA id w11sm2897366wrs.26.2020.10.07.06.55.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Oct 2020 06:55:59 -0700 (PDT)
Subject: Re: Purpose of QOM properties registered at realize time?
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201006220647.GR7303@habkost.net>
 <a6e652d9-548f-4d4e-e451-48e3f5e11031@redhat.com>
 <20201007130240.GU7303@habkost.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <659289e0-4133-b945-45fd-25e759c18b03@redhat.com>
Date: Wed, 7 Oct 2020 15:55:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201007130240.GU7303@habkost.net>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 00:44:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZICOHMePIfzw

On 07/10/20 15:02, Eduardo Habkost wrote:
> On Wed, Oct 07, 2020 at 02:04:23PM +0200, Paolo Bonzini wrote:
>> On 07/10/20 00:06, Eduardo Habkost wrote:
>>> Hi,
>>>
>>> While trying to understand how QOM properties are used in QEMU, I
>>> stumbled upon multiple cases where alias properties are added at
>>> realize time.
>>>
>>> Now, I don't understand why those properties exist.  As the
>>> properties are added at realize time, I assume they aren't
>>> supposed to be touched by the user at all.  If they are not
>>> supposed to be touched by the user, what exactly is the purpose
>>> of those QOM properties?
>>
>> In the case of GPIOs, I think they will be used by other devices that
>> are added afterwards.
> 
> Do you know how exactly are they used?  Is this always wrapped
> behind a specific API for GPIOs, or the devices can look for the
> properties directly?

It is always wrapped, but (as far as I recall, because I have never
worked with GPIOs) they are intentionally QOM properties and not just as
an implementation detail.  It's meant to be accessible to the user if
only through qom-get/qom-set.

Paolo

> I'm concerned by the possibility of having QOM properties as an
> undocumented part of an internal API.

