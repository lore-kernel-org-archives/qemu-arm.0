Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp346057ejc;
        Thu, 26 Jan 2023 02:58:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXthzQuskEMDj+kOPP6E0bETvNJ0GqF/rxABLo1jY/kMnz4W1+5aSCt2uyzuxhFIh5g7br+j
X-Received: by 2002:ac8:7156:0:b0:3b5:bd73:12bd with SMTP id h22-20020ac87156000000b003b5bd7312bdmr53372774qtp.29.1674730708942;
        Thu, 26 Jan 2023 02:58:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674730708; cv=none;
        d=google.com; s=arc-20160816;
        b=S3zz2xR7Jdd3zxc8Dsl+rDxgPDHUIZKp1JwQuhjgdW8VvWXtkFqFk/PlZqJRK4dxgJ
         10VQvahnCiRluyaaIYT0T1Q+B2ssZ/PZDToaeaZOYHLonuTHtsEaMqD5fRWOiipwSIFJ
         h6ajUooLEk3zebNrvIFcw/G9rToIeULIjQHWlcKINf/tsEAflhnyZQBTz5Q6TWzo0Zqh
         Y9Q8Ip2BQnJhkBY801H1473op7Nzanj0YA0rDbNdD1iy4EUWyqlKkADZCyjPFdanAw/I
         abKOBs3aShXqizkrGhfVq2aX7UkOC+7BUYQHYhbs5EDB/UrA4OPlWRVSdQDphlb10EKu
         qjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :user-agent:references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=pUtnlRWuSV9rzF4bHOmBDZppyOE20q92Y5J7hglnV3g=;
        b=MRsTnMNvYz7o6n/IZqVFEwA22rtlNkz8rPt4Nmc/JfRg/i+wthYQAWsXTmHDiAOGx8
         3JRmOT6aTIYuYQuiC3PknvEQAPZVP8ZNMlTyWCXFtig3CtvqvZm8WdCk57+oX2NiYxbU
         GwRXWz/df6/FFasZHkHm5bhkCC/hx9TTejozLiYbvYu7EZ1QnbY+u9v1pB1EJvVh0+hS
         XifqBFPGET7bmjyg7FbXnt5TMirJbtcFbIJ4wSEd+kmsJNkFjJbM9UeCnm7dQ0njmk60
         gF1SNnKD5ukPFUpDlUwM8S+6XjfwLo58G31vEfgt75Fh7t+CteClxhyuktL5S1Nl3sK/
         LB5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VHNI9aeT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i3-20020a05620a248300b006f5f43caac6si910289qkn.176.2023.01.26.02.58.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Jan 2023 02:58:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VHNI9aeT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKzxJ-0004iZ-4N; Thu, 26 Jan 2023 05:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pKzxG-0004iJ-QW
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:58:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1pKzxE-0001QS-EI
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 05:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674730683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pUtnlRWuSV9rzF4bHOmBDZppyOE20q92Y5J7hglnV3g=;
 b=VHNI9aeTcD0SuUzDK2QnodciB6/jidUvbogDPNgSxDCNoNf1oPXZ3ltY9y9lWzShPORR9x
 fPK7KhWtKwVVarTBNJUKrwIPPeXRgoAIAOjJUj3zi85pZOdVLWW/22U6P/g7oIV8VOwauK
 m/yUWH7rRnZndnbkthHlAUc6yJ7llzk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-0Lo4XJvHPPuiSLgXNcAMGQ-1; Thu, 26 Jan 2023 05:57:56 -0500
X-MC-Unique: 0Lo4XJvHPPuiSLgXNcAMGQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5603F3C025C6;
 Thu, 26 Jan 2023 10:57:56 +0000 (UTC)
Received: from localhost (unknown [10.39.193.233])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D3DC4C15BAD;
 Thu, 26 Jan 2023 10:57:53 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Eric Auger <eauger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, Laurent Vivier
 <lvivier@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org, "Dr.
 David Alan Gilbert" <dgilbert@redhat.com>, Juan Quintela
 <quintela@redhat.com>, Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 2/2] qtests/arm: add some mte tests
In-Reply-To: <be81e9e3-1669-4627-562e-30ab0a98c8fc@redhat.com>
Organization: Red Hat GmbH
References: <20230111161317.52250-1-cohuck@redhat.com>
 <20230111161317.52250-3-cohuck@redhat.com>
 <be81e9e3-1669-4627-562e-30ab0a98c8fc@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Thu, 26 Jan 2023 11:57:50 +0100
Message-ID: <87a625y34h.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 99KPmy8aRkAk

On Mon, Jan 23 2023, Eric Auger <eauger@redhat.com> wrote:

> Hi Connie,
> On 1/11/23 17:13, Cornelia Huck wrote:
>> Acked-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Maybe add some extra information about what tests are run. Also you
> could add an example of test invocation so that any people interested in
> can easily run those new tests?

Hm, it's just a part of the normal, standard qtests -- not sure what I
should add there?

>
>> ---
>>  tests/qtest/arm-cpu-features.c | 76 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 76 insertions(+)

(...)

>> +static void mte_tests_default(QTestState *qts, const char *cpu_type)
>> +{
>> +    assert_has_feature(qts, cpu_type, "mte");
>> +
>> +    /*
>> +     * Without tag memory, mte will be off under tcg.
>> +     * Explicitly enabling it yields an error.
>> +     */
>> +    assert_has_feature(qts, cpu_type, "mte");
> called twice

Ok, that's probably some kind of rebase artifact.

>> +
>> +    assert_set_feature_str(qts, "max", "mte", "off", "{ 'mte': 'off' }");
>> +    assert_error(qts, cpu_type, "mte=on requires tag memory",
>> +                 "{ 'mte': 'on' }");
> nit. with pauth_tests_default form: cannot enable mte without tag memory

Not sure what you mean here?

>> +}
>> +
>>  static void test_query_cpu_model_expansion(const void *data)
>>  {
>>      QTestState *qts;
>> @@ -473,6 +539,7 @@ static void test_query_cpu_model_expansion(const void *data)
>>  
>>          sve_tests_default(qts, "max");
>>          pauth_tests_default(qts, "max");
>> +        mte_tests_default(qts, "max");
>>  
>>          /* Test that features that depend on KVM generate errors without. */
>>          assert_error(qts, "max",
>> @@ -516,6 +583,13 @@ static void test_query_cpu_model_expansion_kvm(const void *data)
>>          assert_set_feature(qts, "host", "pmu", false);
>>          assert_set_feature(qts, "host", "pmu", true);
>>  
>> +        /*
>> +         * Unfortunately, there's no easy way to test whether this instance
>> +         * of KVM supports MTE. So we can only assert that the feature
>> +         * is present, but not whether it can be toggled.
>> +         */
>> +        assert_has_feature(qts, "host", "mte");
> why isn't it possible to implement something like
>         kvm_supports_steal_time = resp_get_feature(resp, "kvm-steal-time");
> Could you elaborate?

I really should have written that down in detail, but I _think_ that's
because of OnOffAuto... if the prop is not set explicitly, we don't know
what is supported. Unless someone has an idea how to work around that?

