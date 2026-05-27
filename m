Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88ADCD5BD0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 16:02:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSGhH-0003eK-8V; Wed, 27 May 2026 12:01:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSGhF-0003cG-49
 for qemu-arm@nongnu.org; Wed, 27 May 2026 12:01:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1wSGhC-0005UG-VX
 for qemu-arm@nongnu.org; Wed, 27 May 2026 12:01:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779897685;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RiPe4Prk+kzBu6QwStAHXAFHar9zGaaOXhVcZMTjvIk=;
 b=InSfSIITf6PtvpAWstrUivlYBVPOnRFE65AqNPD0nAWzj1DpfhkC5itNpZVF2TzpxM8jDt
 4HhPhmgSHTDLcit5oSxlSZBy2dTovn5vpDNMtgTeEiMhwl7bFpKYnSvz+0mHLE6acr5+WH
 1FDBoio1/nK6jX+6XMkt1tOV43c1buk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-499-zqS2gqsJOMyAedOAKW0giQ-1; Wed, 27 May 2026 12:01:21 -0400
X-MC-Unique: zqS2gqsJOMyAedOAKW0giQ-1
X-Mimecast-MFC-AGG-ID: zqS2gqsJOMyAedOAKW0giQ_1779897680
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-44d9ace59efso7003216f8f.1
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 09:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779897680; x=1780502480;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RiPe4Prk+kzBu6QwStAHXAFHar9zGaaOXhVcZMTjvIk=;
 b=pogC7rTiaKSsADK2AV69cprrvtLoOO44o+QGsEFl+9kii3PsxIaOBiOx70DWlPvr/b
 qLetLmJ1ChaxIqRfhe6J2Kw1J5xclJWZGzHzcpgnP5WAMt3NX65zVdrtK0K6EO3Zxonn
 F90hwWO0CTt5ohxmFCawkSXK/GrfcyIPUarYbUuiQg23aZz6ksu2YmiZwyK85ylVdtp5
 PsLJBVGhTReARfOZNwf9L1TnLrwZrb4ywBJN6VM5he6eNV9FwE5JWyGWOI9OeOFwV3qX
 Uto91NCx4iZ7zQhnM3gGYtHz3k+bkYaiqz2B/luYWCvCXpoww4XCY9eJSGkZMl6/91z1
 uagg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9Bmo8VJ8t81RvY9Pwls8jHoQ5VOwyvzvQZ7YDNqlNKvzxczVBtb2tMoMyEsWpqTcYVYEh/keh5Dw==@nongnu.org
X-Gm-Message-State: AOJu0Ywl6sf1v7l+QKDoFXlLI1tHYNwZhxJHnsmI/ETcZK/RqoqVMWuV
 smBa8RuNFWa3gcsfCEXZG94qdOldI6QoIwbCNhgib1shXnF6nFPTV0qzf38lkz6EySffANvAd0K
 SmH1JzRLQWP0nWOYhUbDqT897V5kxC3af5egDnDbRYyStyVx7ojJ7ng==
X-Gm-Gg: Acq92OE1Gedhoj5bHDZ1GSawVW9yJhSMKw+bS0q2RiFTavZnid2H5cGyjikr16nN7N6
 AI2bALCByupzYpvpq2x40nyD6aFkvJm2cSHaU8CRvU/TyrFZcCmV7321NGJgHe66kNZDarrb2OG
 eX1j/TqPsyS5WZm4KSTJbd9ayXEUCU/qdPueosgDb4pDrz77zr2DbUsC936aa4sjjezWty/JD5l
 ALhVBm03uknjKnMp9crsYFRwQ62MacIheTTiMkTrkLfh/Rc/DBwsIiUYIWPpE49MmG7bUbDc7TK
 iti5s6wDdOyPNny3C3Pk8krL50JLx4YHaISfkvgF+4jiZf9BxVjtpfl2TbHCa9lLAHvXzimJYk/
 dwSTQ6YRehNdUTHsi4gy2k2cWMtZbAAXnP2ZYax736vv6VFIpTOnzrqBtQbReYQNDsFN8CQ==
X-Received: by 2002:a05:600c:3b02:b0:48f:d1c0:5cd3 with SMTP id
 5b1f17b1804b1-490424b3189mr405188755e9.13.1779897680114; 
 Wed, 27 May 2026 09:01:20 -0700 (PDT)
X-Received: by 2002:a05:600c:3b02:b0:48f:d1c0:5cd3 with SMTP id
 5b1f17b1804b1-490424b3189mr405187915e9.13.1779897679614; 
 Wed, 27 May 2026 09:01:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4904527f7f7sm601871475e9.7.2026.05.27.09.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 May 2026 09:01:18 -0700 (PDT)
Message-ID: <72f22825-d810-4fa1-8fc5-123ae06af91e@redhat.com>
Date: Wed, 27 May 2026 18:01:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/18] target/arm/kvm: Ignore some writable bits that
 shouldn't be
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: "eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Shaju Abraham <shaju.abraham@nutanix.com>,
 "yangjinqian1@huawei.com" <yangjinqian1@huawei.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "sebott@redhat.com" <sebott@redhat.com>,
 "skolothumtho@nvidia.com" <skolothumtho@nvidia.com>,
 "philmd@linaro.org" <philmd@linaro.org>, "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "abologna@redhat.com" <abologna@redhat.com>,
 "jdenemar@redhat.com" <jdenemar@redhat.com>
References: <20260519132905.145643-1-eric.auger@redhat.com>
 <20260519132905.145643-16-eric.auger@redhat.com>
 <E5402D74-AE00-4088-801C-C87A749E17C9@nutanix.com>
 <80fa5157-2376-4010-88b2-deb6ab50f87f@redhat.com>
 <6CA1EBCE-BA44-42A1-81D3-1A723C6F0CC3@nutanix.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <6CA1EBCE-BA44-42A1-81D3-1A723C6F0CC3@nutanix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OBDeGFz-36FYzBHzhTcakF5zediDTualATgJmysm4mo_1779897680
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 5/27/26 5:54 PM, Khushit Shah wrote:
>
>> On 27 May 2026, at 9:15 PM, Eric Auger <eric.auger@redhat.com> wrote:
>>
>> What would it change anyway, if we detect we have a writable field
>> matching a RESx field, I guess we would continue raising a warning, no?
> At-least for named models we want values for each bit in 
> ID register.
but if a field is RESx why don't you want to overwrite it? Are there
cases where a field is RESx depending on a condition?

Thanks

Eric
>
> Warm Regards,
> Khushit


