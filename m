Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp5646484lfm;
        Wed, 26 May 2021 10:42:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdo3wdI5JwnCcjYVCA2RGhaKsPddv87sBAAxh/gYP4lN+FC5wjrek5EdqC8cz6qw2lMnoz
X-Received: by 2002:a05:6102:7c1:: with SMTP id y1mr33435105vsg.34.1622050971641;
        Wed, 26 May 2021 10:42:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622050971; cv=none;
        d=google.com; s=arc-20160816;
        b=So/L0n21f52n5LN4JwItsQGUycBd8Kz+D4hkccSLxXPeNFK0EgrZ4Li/Ai871bOylh
         Xxfb9eaQ7g+RkNy3bVatadyjtpD4S+fiuLVB14fBeBJ42begJ0+HNlNm7U+15qarRH9i
         G+KJjewaa0LPyxPq4oycMZHRlZrUbvAQ0SC1dG1f0vi48hT365UKyzRXIYlQ0ySLcFI+
         H7IbwErYSh4ynOgfVNlk3ZUad68GgjbuDlmOsS0dz45KiOXd5mpy+k0CexijJMcrMcWa
         ANFz6HT9D15NbXUKsY4fWV1wv2c2/KmD9wjVGjG1VEkYEO0XtMZic/LVaPS43h3Njlk3
         mQDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=+YpBknw/207Qu5KvgUM/SwdlbggoFYE84KUhsln0seg=;
        b=D3udviIAeP7Y4W5aEHGTmK6Je933UttuMZUiPxcQQSQFLBO+pUU73IMQgsHUwtWUtO
         GzhVMf0ucPHb0xF93m7spljI1148FdiLuXC61UcpmLGtYYrs9fAtTxzAutFQsvu7/gg4
         NjR6Y2TFVL05UPmjlisqZoCInJYtuMs+KMoB1YlJo5/5+Kt8/Jf/ShX6fexctNqTJdQa
         0UOb+QKmAgPJphjVGY3HouJcei1FcaYQEXZZ2CHJOG0xtUBm9CYxkDVo1ghwMwxkTS7X
         Kj5j/pj1P6f34g00ztf1K1+TQpggnkBebR8B++1fhr8vqRSvcHocepK9ca/3/T9Szg0Y
         xS2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IgrAsHh6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i132si5882521vki.59.2021.05.26.10.42.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 May 2021 10:42:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=IgrAsHh6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1llxYQ-0007cQ-WA
	for alex.bennee@linaro.org; Wed, 26 May 2021 13:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llx2U-0003ub-Bj
 for qemu-arm@nongnu.org; Wed, 26 May 2021 13:09:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36605)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llx2S-00068Y-Hx
 for qemu-arm@nongnu.org; Wed, 26 May 2021 13:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+YpBknw/207Qu5KvgUM/SwdlbggoFYE84KUhsln0seg=;
 b=IgrAsHh6bIwOHEKEAxgF0gM6pe9Ze7o4ESFbsCh0NGKUUy3Go6CIVDJP4D7D/ycxgmMhjQ
 l5x4fItKUXpv6v2CirAvjGpftHJbwyf9ZI47B/q5eza/jn6xELcgB8XcVz+yoJ9z9V9DGm
 FWvLvD37pq71J4ZvZqdiRzyOQbibv5w=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-LIaTi6sPMTelRhjVItQ2CA-1; Wed, 26 May 2021 13:09:44 -0400
X-MC-Unique: LIaTi6sPMTelRhjVItQ2CA-1
Received: by mail-wr1-f71.google.com with SMTP id
 a9-20020adfc4490000b0290112095ca785so603464wrg.14
 for <qemu-arm@nongnu.org>; Wed, 26 May 2021 10:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+YpBknw/207Qu5KvgUM/SwdlbggoFYE84KUhsln0seg=;
 b=IHMOu0LbYEoIyb8xuuyeHnK2xhQPP7Xv432ulUhUcf94KAlfXU8X1/8z0kFIKj8KQD
 bHaQBxp35IFHtdEqzRCbDGpEX5/gq9mRsfnxhjtkr97cJ30p0xYVEwsgzpNehDBUoIn4
 EJbbjwKo2JA5qZk7hu9kpfsQzmjWYbKakW8pP/Uh1VgPxIOdIRKluwY2z7q1Ehebp66t
 sXhFAFCHYEZAl2c0mGyrhBeEdk6tURBBhrQVM+5AKMdk0EqgHet1GL3okYiDaqzFfQnU
 v04zd/3/wpWYDSmwFddGXc7x7F88UZPyqkMbHTBW6XYcy/q8UKIG8nwIC5xpafd5AiWB
 LGGA==
X-Gm-Message-State: AOAM533evVkYSNvy/Ja6wfGhM26nhxJTCe7VoQX65AuhqqObpuwTrQEl
 9emP6Sm0dzCODbAObrtwnmeLj64rv1g1gMS2CF/lErM8rQk7bqXpEFOg53PuotQ4VS884j9qPf2
 I5yGzKINVvp5B
X-Received: by 2002:adf:ec8d:: with SMTP id z13mr22280634wrn.113.1622048983527; 
 Wed, 26 May 2021 10:09:43 -0700 (PDT)
X-Received: by 2002:adf:ec8d:: with SMTP id z13mr22280612wrn.113.1622048983377; 
 Wed, 26 May 2021 10:09:43 -0700 (PDT)
Received: from [192.168.1.36] (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id r5sm18170688wmh.23.2021.05.26.10.09.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 May 2021 10:09:43 -0700 (PDT)
Subject: Re: [PATCH v8 00/12] qtests: Check accelerator available at runtime
 via QMP 'query-accels'
To: qemu-devel@nongnu.org
References: <20210526170432.343588-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <269bf39d-816f-1e75-2cdf-45cd9cd5764d@redhat.com>
Date: Wed, 26 May 2021 19:09:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210526170432.343588-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YfI7ctgXJP57

On 5/26/21 7:04 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series aims at having accelerator-independent qtests
> by querying a QEMU instance at runtime to check the list
> of built-in accelerators.
> 
> First we add the 'query-accels' QMP command,
> then we add the qtest_has_accel() method to libqtest,
> finally we use this new method to allow running
> bios-tables-test on KVM-only builds.
> 
> This series is expected to be merged via the ARM tree.

I forgot to carry MST R-b tag:
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
https://www.mail-archive.com/qemu-devel@nongnu.org/msg807421.html

> Since v7:
> - Include Markus code (see patch #2)

> $ git backport-diff v6
> Key:
> [----] : patches are identical
> [####] : number of functional differences between upstream/downstream patch
> [down] : patch is downstream-only
> The flags [FC] indicate (F)unctional and (C)ontextual differences, respective=
> ly
> 
> 001/12:[----] [--] 'MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs=
>  section'
> 002/12:[0048] [FC] 'accel: Introduce 'query-accels' QMP command'
> 003/12:[----] [--] 'qtest: Add qtest_has_accel() method'
> 004/12:[----] [--] 'qtest/arm-cpu-features: Use generic qtest_has_accel() to =
> check for KVM'
> 005/12:[----] [--] 'qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm te=
> st to KVM'
> 006/12:[----] [--] 'qtest/arm-cpu-features: Remove TCG fallback to KVM specif=
> ic tests'
> 007/12:[----] [--] 'qtest/arm-cpu-features: Use generic qtest_has_accel() to =
> check for TCG'
> 008/12:[----] [--] 'qtest/migration-test: Skip tests if KVM not builtin on s3=
> 90x/ppc64'
> 009/12:[----] [--] 'qtest/bios-tables-test: Rename tests not TCG specific'
> 010/12:[----] [--] 'qtest/bios-tables-test: Rename TCG specific tests'
> 011/12:[----] [--] 'qtest/bios-tables-test: Make test build-independent from =
> accelerator'
> 012/12:[----] [--] 'qtest: Do not restrict bios-tables-test to Aarch64 hosts =
> anymore'

