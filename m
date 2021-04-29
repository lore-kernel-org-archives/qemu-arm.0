Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp1442133lfb;
        Thu, 29 Apr 2021 01:43:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk6val1TfCNb+3yZnTHGp8OrSqJjvC8YKqvQy0cm5gpWJvLqmkG0L0qtC7Tnkf1MNsk2Pa
X-Received: by 2002:a05:6214:9aa:: with SMTP id du10mr12831867qvb.37.1619685782991;
        Thu, 29 Apr 2021 01:43:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619685782; cv=none;
        d=google.com; s=arc-20160816;
        b=Pn4CkyHE7HsH7/jFvsHLOAl8OLjXVIEd2NeLjsZlEwExIqto+3BjWOaodBbT5wh3cq
         q+R40RyvRKHei9cekxaU7vOqt5at3AmEPUzDr1gCUk4FN8RAwnZ4q4WttcfBHZ2fS49+
         QpouvZR7varuQMGacZguSVyzorNCsE9fnHcq3VxPgUahvSpDW18vjYoqqe35uo28S89s
         8hSa++aZGWs4lc/uzw0gMSB4yH/p9KXuqXDel+rHv6pEdxCxTstuAwa5jM+bZH/PBs1j
         MRqbJ8MkCuCmhh//7WZC0Hx8Mbz5yf4Kj/6oQd4n4lwvYoAhAtsGkfknrs0LlR9FvW4q
         U40w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CyC6t67x/LxPHndZ+iq8B50RNoGQdRt0rEPd6RPJszE=;
        b=jBP1irnBCuEIm3EaymmrRn9cv/LXKmESJQ6kw+ZUbGTPR07yf+JqM4MK0JcNSiidVl
         1UaExUAP3vyGYTq6uqH3nFyv9EDsGt4dtrAVY9yFVFXeNv7hI+M/sw8f6VFk+Tiqw2ns
         I6o+ur6LCAJQTMWeoJJ2Lw6DVy7cCpoIA2PLhFp5btbPzimR1ZT3DKELvkvcMeZCdxaO
         QR0Z1jVEnzcFFM4uu1FPyeDTlnTA/3nlSWCPBjYF2O1u9kDVsNUqiEHOZEjDsAozx8wE
         6Y1OMlyNk0/SBeKcXdcDKFdyVbUcZB1CKhVtSJNGbtE8kbY8GmDElyfSku9CbzV8FXo6
         JnVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YOUZlHbv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 9si2058677qvs.214.2021.04.29.01.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Apr 2021 01:43:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YOUZlHbv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lc2GE-0005QK-Bm
	for alex.bennee@linaro.org; Thu, 29 Apr 2021 04:43:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc2Ey-0004ZJ-1x
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:41:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lc2Eu-0006Vz-Uv
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 04:41:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619685699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CyC6t67x/LxPHndZ+iq8B50RNoGQdRt0rEPd6RPJszE=;
 b=YOUZlHbv3qj7wSB4D4obDJ/nJT+gLC9aY1EFTy++ZnowmTeAYSQ2TVT6X1iq0d9dFINiRM
 m+Jnco3+LXCI158cjBqeMH78MQUZJq8zarhjxVFcmumlHMxnf3skjOci7uPmcy357kU2Sj
 ri4Zzl3A4UfOCXu06Dkuic8dnmXhu9s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-10HG4DP7NuaBuoHYydd6Wg-1; Thu, 29 Apr 2021 04:41:37 -0400
X-MC-Unique: 10HG4DP7NuaBuoHYydd6Wg-1
Received: by mail-wm1-f69.google.com with SMTP id
 v186-20020a1cacc30000b0290137364410e2so4416546wme.3
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 01:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CyC6t67x/LxPHndZ+iq8B50RNoGQdRt0rEPd6RPJszE=;
 b=EIrf7MYBmYcjeLTd6YORQas2aF3UfJA+KQOddEZ7RVTvAF9Z+hm9VwY1g7jfXYnIIg
 jBPOvADDjABOLOWBeZtZIs1bHqGWNXCRmPYtNn4DGWmj/xfQYTLQDsqftZvo299N3Is4
 yTk70B2Sd8TN3UcxbgWa03W20hIeSI8XmxkzPZYPtVpsY/vzdKpuXeRBaXVPe20rWLVr
 aclFWlUKk5W8ywlskxfOqcPFrfT5FYGgNm/Z8Xs5v9mF1Dztxjyw1xAyk+02cW+OnGpp
 AaaxbWokOAwpk0AbmA69fNvfMbDXECXRp7IpCZIAXb0W7NgwJub3727XdkVK0htD41IG
 y7Ww==
X-Gm-Message-State: AOAM533EFcuCy87ir2BXyEWfTgbM1yuTv7yrSXn4bE8A76vUqmP2r868
 Tnf76VxD4EqG48A2BGq6Wr8v26qrLTFLeW3CzhMb7a9GFmdLEidfIFvyTe3fnQptuUNw4rV3zMb
 HO8+aFuUIxh3A69g=
X-Received: by 2002:a05:600c:4fd4:: with SMTP id
 o20mr9351871wmq.166.1619685696660; 
 Thu, 29 Apr 2021 01:41:36 -0700 (PDT)
X-Received: by 2002:a05:600c:4fd4:: with SMTP id
 o20mr9351847wmq.166.1619685696493; 
 Thu, 29 Apr 2021 01:41:36 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id z7sm4110105wrl.11.2021.04.29.01.41.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 01:41:36 -0700 (PDT)
Subject: Re: [PATCH v4 10/12] qtest/qmp-cmd-test: Make test build-independent
 from accelerator
To: Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20210415163304.4120052-1-philmd@redhat.com>
 <20210415163304.4120052-11-philmd@redhat.com>
 <87lf91ir1m.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1de6b3f8-7d7c-9280-4cd3-633a19dd9b8e@redhat.com>
Date: Thu, 29 Apr 2021 10:41:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87lf91ir1m.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zdY0s/wwGypr

On 4/29/21 7:43 AM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> Now than we can probe if the TCG accelerator is available
>> at runtime with a QMP command, do it once at the beginning
>> and only register the tests we can run.
>> We can then replace the #ifdef'ry by a runtime check.
>>
>> Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Please read the last remark first.  The other ones are detail; feel free
> to skip them until we're done with the last one.
> 
>> ---
>>  tests/qtest/qmp-cmd-test.c | 18 ++++++++++++++----
>>  1 file changed, 14 insertions(+), 4 deletions(-)

>> +    tcg_accel_available = qtest_has_accel("tcg");
>> +
> 
> When does tcg_accel_available differ from defined(CONFIG_TCG)?

qtest_has_accel("tcg") is a runtime check, while defined(CONFIG_TCG)
is build-time.

Having tests doing runtime checking allow to:

- have easier reviews, having less #ifdef'ry
- build them once for all targets
- build them once for all ./configure options
  (thinking about CI, the a single job could build the tests, then
  we run them using the QEMU binaries from other jobs)
- use the same binaries to test the built binary and the distribution
  installed one
- remove the dependencies between tests and binaries

> 
>>      g_test_init(&argc, &argv, NULL);
>>  
>>      qmp_schema_init(&schema);
> 

