Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1966726ejb;
        Fri, 10 Feb 2023 07:35:50 -0800 (PST)
X-Google-Smtp-Source: AK7set/WOwV4pIY7TM5+JqPC1G5PGW79zs5Weq2N4xXVY3X785V3tGm7Lqw2FihVkrReqdt81KRX
X-Received: by 2002:a05:622a:188a:b0:3a5:1ea1:bae2 with SMTP id v10-20020a05622a188a00b003a51ea1bae2mr26618928qtc.34.1676043349964;
        Fri, 10 Feb 2023 07:35:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676043349; cv=none;
        d=google.com; s=arc-20160816;
        b=pXGAOVDNCEbMVpd+w23kO1dNFlgnjwCgO6kCd4K1efM7d+SvSxBJXH0vCA9BqelSWV
         apShCZ+wcn9966/A0zzGdJWsp6FhWfD9i8OO1Sbnv82efVJ4wkSByhoTzl7ScMaQyXDj
         /Fethb5c3Ab674JkBzPlL5rmOXkykpJkXefRSf5cwbmkIz0ZQLpq47eFM7ffDMaXg6+H
         BLrVhST+RILJohg7BZPHC+Qvf7XwWDC2O9vKjahor2mOyW1R4Fipbx9luYnOY8q5Mg5a
         E9TsLr4SrIRo7dFfooFkDq2UM3LWSXd6aOgIFQHF56/tFWeP5ZBiZrxphDX9fOaUzGi/
         jBlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=yD+2gE60M+uKlrJhZdt8CF0rRtAY0FIoY/ThDG+iZnc=;
        b=n2MycTRPRlBVtB2Mb6jPJGOZENshl0GXwiDxIoAOHykhVDshqRKHT3Fw9Gt1vjwbfm
         OO4YGdM9KEAEnH11tuQJGGmu4W1XBxLi2UuYUQNdHVK++yIDQq9zIbpMXHXyma8H7wi9
         IcHW/S3EluKGzwN6w15yw4QSyw3cEZLrarXw5K0SylW88nNnIjrNGBhVwBwunSUtAsD8
         FBlF2HyqkAj6BVSBBKcI9v8PzrSoR1dVHte7efhtHIVOEY0qTXaUxM3uxc3u4Edx7fHy
         b0ME2f+iqEfGzu1zgMXBM262OQgvvwV7XqVH326FXnwVO5U6sv4o1vZxFWdS/ADwd41j
         ez+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WPpu01Ki;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5-20020a05622a11c500b003b63c3333easi4072328qtk.158.2023.02.10.07.35.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Feb 2023 07:35:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WPpu01Ki;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQVQq-0007DD-5u; Fri, 10 Feb 2023 10:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pQVQp-0007D3-3G
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:35:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pQVQn-0004yE-J0
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 10:35:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676043320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yD+2gE60M+uKlrJhZdt8CF0rRtAY0FIoY/ThDG+iZnc=;
 b=WPpu01Ki6tTZO9AYkcyvyDaBUpbIyYO+PHjuTPNXqPVlJDnHvmZLjLB2wdtBW3zStgruD0
 Kyb/hfw5jV7FW5MgcrGN3mmCR/WUrqQD6odltGS77vCmNBGmqYqgUIso8XU+XW+ph37ePp
 cDs0D9pejBGHxQYh+Oidzus1UUlbXmE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-356-A78AAalSMGiI61LPQ_uTJg-1; Fri, 10 Feb 2023 10:35:14 -0500
X-MC-Unique: A78AAalSMGiI61LPQ_uTJg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 395FB811E6E;
 Fri, 10 Feb 2023 15:35:14 +0000 (UTC)
Received: from localhost (unknown [10.39.193.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E83261415113;
 Fri, 10 Feb 2023 15:35:13 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>
Subject: Re: [PATCH v5 3/3] qtests/arm: add some mte tests
In-Reply-To: <a7904d6e-c8e5-055b-34f7-8ea2956ec65f@redhat.com>
Organization: Red Hat GmbH
References: <20230203134433.31513-1-cohuck@redhat.com>
 <20230203134433.31513-4-cohuck@redhat.com>
 <a7904d6e-c8e5-055b-34f7-8ea2956ec65f@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Fri, 10 Feb 2023 16:35:12 +0100
Message-ID: <87h6vt8rf3.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5EfHdL3INlNO

On Mon, Feb 06 2023, Eric Auger <eauger@redhat.com> wrote:

> Hi,
>
> On 2/3/23 14:44, Cornelia Huck wrote:
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>
> Still as you need to respin I think adding a short commit msg wouldn't
> hurt ;-) Add new cpu MTE feature tests with TCG+virt tag memory and
> TCG-no tag memory (default) attempting to set cpu mte option on/off. No
> real test for KVM because ../..

Ok, I'll add some lines :)

>> ---
>>  tests/qtest/arm-cpu-features.c | 75 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 75 insertions(+)

(...)

>> +static void mte_tests_default(QTestState *qts, const char *cpu_type)
>> +{
>> +    assert_has_feature(qts, cpu_type, "mte");
>> +
>> +    /*
>> +     * Without tag memory, mte will be off under tcg.
>> +     * Explicitly enabling it yields an error.
>> +     */
>> +    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }"=
);
>> +    assert_error(qts, cpu_type, "mte=3Don requires tag memory",
>> +                 "{ 'mte': 'on' }");
> Sorry in v4 I reported I preferred the pauth msg, clarifying now:
>
>     assert_error(qts, cpu_type, "cannot enable pauth-impdef without pauth=
",
>                  "{ 'pauth': false, 'pauth-impdef': true }");
>
> Here would translate into cannot enable mte without tag memory.

Oh, so you mean that I should adapt the message generated by the code?

[did not get around to the rest of it this week, will try again next
week]

