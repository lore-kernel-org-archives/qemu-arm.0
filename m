Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1879083ejc;
        Tue, 14 Nov 2023 00:06:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFs6TVHHQJ54vW84KLziP1UQSE/wM6Al2L9uxpDivEGb6252LCmOVAIK7APMVXOGrPXw8jy
X-Received: by 2002:a05:6214:403:b0:66c:fcfc:9174 with SMTP id z3-20020a056214040300b0066cfcfc9174mr2302585qvx.41.1699949204769;
        Tue, 14 Nov 2023 00:06:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699949204; cv=none;
        d=google.com; s=arc-20160816;
        b=iGswI6YsnAdvF4fJ5OgPFMgwAV96VJCYGk9NzYJbrc94CVr31vDIO/f65ofNBLTWom
         bvulmlZZQEGvjB3XhH1b6+dOLdsWyaYixpJ1mWdV7icyj2fRE0RF+/mVdJ9+jFZQVcgf
         xF4wyDQ/K8+oIB+dtk5dW4jRa3hC7UUmVO5PrF9xbMXyHlmvJolTaGzOGTKVOtPepcas
         2DNCVKtJ2DKaUFbOshKN7M9C5Qd7u+BdIRBfYDNiXK2UVoRl6frzWNBapQmw/zevEXo2
         nxAJo64/zuS+SHeJmYD6pJqnyz7lZIRBkQq6P+ZD8bxe7olnpiptK/uvomHZnN8qKVM7
         Fs0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=0dlB2NsadnZ9Yd+KC6Sc39j/+NRDom1XC8C1tzRqZhQ=;
        fh=Lt5L+E1Sm5iIYPnMKc+oATQH1KB4krGzAB6kyn6hYAI=;
        b=nsGqT4aPQjnNm81i+Z8Wwu1JfWHqJYISYz/m0wTzzIPQ981sqUHUXC0TZCpO2vKfqY
         QdZCXx5WCdtZEqk4b8e0qu31pXHUp++4HU04KawQpCQQQ8kKWjso5TEfnPZwfeSoIh2K
         7UPn6t19Ny+z87M/sqrzNAuhXd5XQitGSiK19HJKlmFZIkrvH0e+1xLayudNwittPr8T
         o1ZrdkUUwoCm54dLPWmIBvt9GB871nRWU9sAvBoIfQRtelSbxA3k7eNYS69BWV0t3HSv
         +CTTRO5mpHlBONk8rnHd1OV0WiB7jAtFaRw1s/YdEwVEDDToS4XDkgVsY9zfDtHjayLX
         H9jA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XcL+ndb+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id eu20-20020ad44f54000000b0066d127c27fcsi6119184qvb.553.2023.11.14.00.06.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Nov 2023 00:06:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XcL+ndb+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r2oRF-0003sa-9D; Tue, 14 Nov 2023 03:06:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r2oRD-0003p8-NB
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 03:06:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1r2oRB-0007Wy-UH
 for qemu-arm@nongnu.org; Tue, 14 Nov 2023 03:06:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699949181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=0dlB2NsadnZ9Yd+KC6Sc39j/+NRDom1XC8C1tzRqZhQ=;
 b=XcL+ndb+/bmTMPuKeMa2i9gL3nxirJI+OuovYlsJDyv6tUOUyEJFus3Zcsmq6FhAg5uN1T
 r77WhdTn+MLmDcpumjHaLq/hPhlAkHE0xY7VzV/5TsO+VAcMckxmPQOlqB6HKr257RyZaK
 f8PGxYiTE8auSjEOhU5+7eGFmPg/OJg=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-ph-jxDJvMXGwzLmMHKiOzA-1; Tue, 14 Nov 2023 03:06:19 -0500
X-MC-Unique: ph-jxDJvMXGwzLmMHKiOzA-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-77a3fb5b214so639145185a.1
 for <qemu-arm@nongnu.org>; Tue, 14 Nov 2023 00:06:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699949179; x=1700553979;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0dlB2NsadnZ9Yd+KC6Sc39j/+NRDom1XC8C1tzRqZhQ=;
 b=FrBYyA7CW9NejN3O0L1jIMQprdczGhq+aLrKEbcxDXMxwEWUH3G8RsOSR7pksq7tCm
 6F/mdqqdvJqSktXhexcwQAacnTiA08agPy2QtWEvr9qR9KYDis2hlJYjIa3oKqPVXOP0
 eZrWMEyw1iCLQRcG+bpzoGV1jDwJhNAinu7NCICniPWAU7prCC40xfFkImzy+ldb2vOZ
 lXlnqabnikh4+C8Y6uUaJVOBD7LrxNNJ9gAd8oQeLtWEgsnqT6+Z12X/5sG0EmxQ9k2r
 yn77NnwRhKodbQx/FicEXxCzACopCdfrwreoIOjzTXGxmGY33U67afqy7ngUp805YE8S
 BzFQ==
X-Gm-Message-State: AOJu0YxmQDELBG7nrnZ6mK4xpu10L8juK9HETfm9gAsbnT2jCKgaKRvB
 maYXMawtFIXmzV99Rp91zj/go+N8C3YpjHFKdmmu16albrJCrOj62SzFkf6fcoBorLObanIa7vs
 dFkG2mvLnXqfA
X-Received: by 2002:a05:620a:8c14:b0:778:8676:fd4 with SMTP id
 qz20-20020a05620a8c1400b0077886760fd4mr1431145qkn.73.1699949179469; 
 Tue, 14 Nov 2023 00:06:19 -0800 (PST)
X-Received: by 2002:a05:620a:8c14:b0:778:8676:fd4 with SMTP id
 qz20-20020a05620a8c1400b0077886760fd4mr1431140qkn.73.1699949179248; 
 Tue, 14 Nov 2023 00:06:19 -0800 (PST)
Received: from [192.168.0.6] (ip-109-43-176-122.web.vodafone.de.
 [109.43.176.122]) by smtp.gmail.com with ESMTPSA id
 bn40-20020a05620a2ae800b007756f60bcacsm2463795qkb.79.2023.11.14.00.06.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Nov 2023 00:06:18 -0800 (PST)
Message-ID: <fb41ec92-d953-4536-b217-8c06f63115ef@redhat.com>
Date: Tue, 14 Nov 2023 09:06:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Replace anti-social QOM type names (again)
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, alistair@alistair23.me, edgar.iglesias@gmail.com,
 peter.maydell@linaro.org, francisco.iglesias@amd.com, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20231113134344.1195478-1-armbru@redhat.com>
 <ZVIo3FsmwpfHzsh8@redhat.com> <87y1f0hjdh.fsf@pond.sub.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <87y1f0hjdh.fsf@pond.sub.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ukUY/LXMpDjF

On 14/11/2023 08.41, Markus Armbruster wrote:
> Cc: the other QOM maintainers
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
>> On Mon, Nov 13, 2023 at 02:43:42PM +0100, Markus Armbruster wrote:
>>> We got rid of QOM type names containing ',' in 6.0, but some have
>>> crept back in.  Replace them just like we did in 6.0.
>>
>> It is practical to add
>>
>>     assert(strchr(name, ',') == NULL)
>>
>> to some place in QOM to stop them coming back yet again ?
> 
> This adds a naming rule to QOM.  Right now, QOM has none whatsoever,
> which I've long called out as a mistake.
> 
> I'm all for correcting that mistake, but I'd go further than just
> outlawing ','.

What prevents us from fixing this "mistake"? Is there any compelling reason 
for keeping the current lax naming rules of QOM? Would there be migration 
issues if we'd rename the current offenders? (and even if so, couldn't we 
simply fix that issue by curating an allowlist of old names?)

  Thomas

