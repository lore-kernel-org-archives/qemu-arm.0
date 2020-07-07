Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp623564lfm;
        Mon, 6 Jul 2020 22:33:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlWlVRV1MyFY0nphM3MjEzoUGyJ7zPeuTXKdRhPlC66zdhNA71oytcffw5FA2WkqAeI2qW
X-Received: by 2002:a25:73c5:: with SMTP id o188mr557989ybc.6.1594099991570;
        Mon, 06 Jul 2020 22:33:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594099991; cv=none;
        d=google.com; s=arc-20160816;
        b=AXhuhhm6aNo4XXZvG8BXGJhs5Yfe8673A6+SFUDkiROYvL6Fn5Q2WaUsv9CM9N06l0
         INpJWZ8scVYk8Xp0x7Mevn4KFPD9r54gpYIkX6rnP8FGLcIUjyR1NjhDMGWouDt6iL7t
         UrydtPEzTyywT+J+aWB3ohEUO//D9uTi1TxMJLdUJloMPPhowcrx7aXVAbfaOYW9+IU1
         NQqEWUW3mS0WJ437pUA04+6e3GoDn4gxrx7HOI0nIDRP/PCHYjg6NvG0H+ryLzoNbJqB
         i8jH2BmFGJag/XwyXvgvgmxfAne8rTPthui+pYLJMajr+N2EVh79jDkaC7zasQ59LJDl
         2gxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:references:to:from:subject:dkim-signature;
        bh=06T+kuWqJ3FHvRYdNLCjqmABGC3pzPSfu6BAy1hmaOw=;
        b=zhzV2YVIcXkvrgo5HByeDzACpkevm0TH0xnVBs6+q2f7YLO15EhCK+GT1pIQq21W5A
         t1MGlrCVtDNZqYmP919mB3mcQKwZlf+6ixUb0pzhD1sd+MQMDobU1GaqF+fSSb4mXBxF
         jbnuPArb2Ed1E88ZcJd/ZyW5w3p7ip2vwAMCAOAlCctxdkVn8QrWOLSvY11RRiLuVLc9
         Ny4oyzbeRqEXd65SPrUsJ1yqhMfujyOtaQF5C1j/ccb21odcIZLFJoxwbpEQ2+i/IbyL
         rkcA+U7n4kj9Ov7DCL0rzOCbzEzkPjLs4GWQEAALTWgaIxPA9Ei/A8m2+6HRQpNcRyyL
         YmYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fTQqoKy2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si14459097yby.21.2020.07.06.22.33.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jul 2020 22:33:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fTQqoKy2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsgEB-000588-0D
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 01:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jsgE2-00051S-Vy
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 01:33:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38247
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jsgDz-0006QG-S2
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 01:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594099978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=06T+kuWqJ3FHvRYdNLCjqmABGC3pzPSfu6BAy1hmaOw=;
 b=fTQqoKy20fFn29bUqHaCPfIOgPRDt5Yp1SlxuzozpEisaQVM0X1cI6dcScfn5/CIQYRXU8
 4BHf6eApcH7XxL3CEKt4Jg0xQHlQV8XR7vxba0YzxkWgg3Vx28Ok2mHLfAdZLxxx1AJva6
 bBvQd8+zSv5kSHvzCyb3f8SkHmUrfsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-B9dIumXdNd2sHIRzHKwfWA-1; Tue, 07 Jul 2020 01:32:56 -0400
X-MC-Unique: B9dIumXdNd2sHIRzHKwfWA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C574818A8222;
 Tue,  7 Jul 2020 05:32:55 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-77.ams2.redhat.com [10.36.112.77])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 874E42DE6A;
 Tue,  7 Jul 2020 05:32:54 +0000 (UTC)
Subject: Re: Test failure with Smartfusion2 emac block (msf2-emac)
From: Thomas Huth <thuth@redhat.com>
To: QEMU Developers <qemu-devel@nongnu.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
References: <e010da48-cfbe-9616-d750-a922cb463a94@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <f457f5d9-2405-4456-4a26-b3a9784e2cd9@redhat.com>
Date: Tue, 7 Jul 2020 07:32:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <e010da48-cfbe-9616-d750-a922cb463a94@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=thuth@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/06 23:10:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L3OV2OWpG+ex

On 07/07/2020 07.18, Thomas Huth wrote:
> 
>  Hi Subbaraya,
> 
> today, I noticed that there is a test failure with msf2-emac when
> running the device-introspect-test in slow mode. Either run:
> 
>  make check-qtest-aarch64 SPEED=slow
> 
> or as a shortcut:
> 
>  make tests/qtest/device-introspect-test
>  QTEST_QEMU_BINARY="aarch64-softmmu/qemu-system-aarch64" \
>   ./tests/qtest/device-introspect-test -m slow
> 
> Then the test fails with:
> 
> Unexpected error in error_set_from_qdev_prop_error() at
> hw/core/qdev-properties.c:1251:
> Property 'msf2-emac.netdev' can't take value 'hub0port0', it's in use
> 
> Could you please have a look?

The problem might be related to m2sxxx_soc_initfn() in msf2-soc.c. Looks
like you are using nd_table in an instance_init function. This is almost
always wrong, and should be done by the machine code instead (e.g. in
msf2-som.c).

 Thomas


PS: Maybe also have a look at this article, it might help to understand
the idea behind instance_init a little bit:
http://people.redhat.com/~thuth/blog/qemu/2018/09/10/instance-init-realize.html

