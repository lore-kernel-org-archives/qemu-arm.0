Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp4169143lfm;
        Tue, 23 Jun 2020 08:16:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdosv8S3xu/ynBBJFNAwD0ETAQNnBuqgo3GL44X881Hxc8BdxMS3atr8ze+TZV3pdsktb7
X-Received: by 2002:a25:d7cc:: with SMTP id o195mr36832383ybg.37.1592925360186;
        Tue, 23 Jun 2020 08:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592925360; cv=none;
        d=google.com; s=arc-20160816;
        b=C6mj44xZXK8p5MrF/veeJPPvOWxWXhkg7NXwGeeaqtMRcqH9+h0yqhSiwJvU0Hj4QJ
         4GjTkU18ySjrRW0GRDmMqoKb1xH9DPBlbMAOeRcm9ERDspYFL3xZgzyOpNjpYEBIHwf6
         WsAxy7kc6UmYVcYLBSbPSoU71vz2C14oC+ogHTRKa9vhkVi3ZzltzxWRMRHGvWSMOZqs
         ouZYrKR+ejXZZhjE7TFVvQKO+fuZXV4julWNkhsTMv5Vg/B/SJNVjsamUHqvHzPUVQlF
         bE5eR95Wm8MzSVyOZE9EMzJm0ssVtcohS/SuAXpNTzUE+IwExD7YehdnEjiN2MpoT9D7
         G7Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from
         :dkim-signature;
        bh=nNji3fnmV0Yr7TVzEVLMLP+ZFv2zrXLWKeKJ2u2GAAg=;
        b=ioSAWLQ/h4ULX9BsrVAttMzZZmFO5blV5LW1SwRDlxk6fUHn19So7P1u5YwOaVWAuf
         FPHFTiiFs9VXTn4YfzXDnKMsRxx1wRgmLRhlFXRxr1m6TR/4mdjSvVVZGX85a9xVO/z0
         Bggf08CRmz/MuB6YyVap47JIzIdQu4RiWrbhbJwu73Lk0fJIYTgi9k6Jb4nkCegt3Gy6
         vW3mDxkuGMk3Wnk62aSKgCoF8EhlLwz5uYpZkiSPa/K+8Y2SZuTHmREiXRrkwC/j32BZ
         GhK7NVcEvcqEu67FeVPW08xCXAVCcoSFfeccDUGdQoyVEqA+LCY4R24tM8nWvT4PE1bI
         xGVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I3thIC+y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p143si6048812ybc.408.2020.06.23.08.16.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jun 2020 08:16:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=I3thIC+y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jnkeV-0007H9-Jg
	for alex.bennee@linaro.org; Tue, 23 Jun 2020 11:15:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnkeL-0007Fe-SU
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 11:15:49 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:43678
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jnkeJ-0000Rs-LP
 for qemu-arm@nongnu.org; Tue, 23 Jun 2020 11:15:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592925346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nNji3fnmV0Yr7TVzEVLMLP+ZFv2zrXLWKeKJ2u2GAAg=;
 b=I3thIC+yVMp8QNu/nEysmymMYOQyCXBwdKLbGBq4YATLMdi2Z7bYWc9EpooTY4Ny5O3E0t
 L7o1gE+/vgS90EcCD3x5jVuZcp2dhWYtm9BKQpM+RqGgnj7OvYj45ttI7NLpOgcq5g7lrb
 EOfnfKk1fkzLmGZzYLhXn93BJuGMzCM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-NUv1OQRDObyPD8f760ifzA-1; Tue, 23 Jun 2020 11:15:44 -0400
X-MC-Unique: NUv1OQRDObyPD8f760ifzA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F204107ACCA;
 Tue, 23 Jun 2020 15:15:43 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-121.ams2.redhat.com
 [10.36.112.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 76E075D9E7;
 Tue, 23 Jun 2020 15:15:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F07E4113846D; Tue, 23 Jun 2020 17:15:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Auger Eric <eric.auger@redhat.com>
Subject: Re: [PATCH v3 1/5] qdev: Introduce DEFINE_PROP_RESERVED_REGION
References: <20200611151209.22547-1-eric.auger@redhat.com>
 <20200611151209.22547-2-eric.auger@redhat.com>
 <87k0zzz6nt.fsf@dusky.pond.sub.org>
 <f0ec7470-d683-1bfd-103d-54c57ebd3863@redhat.com>
Date: Tue, 23 Jun 2020 17:15:32 +0200
In-Reply-To: <f0ec7470-d683-1bfd-103d-54c57ebd3863@redhat.com> (Auger Eric's
 message of "Tue, 23 Jun 2020 10:22:47 +0200")
Message-ID: <87imfhhkyz.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=205.139.110.61; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:55:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, jean-philippe@linaro.org, mst@redhat.com,
 qemu-devel@nongnu.org, peterx@redhat.com, qemu-arm@nongnu.org,
 pbonzini@redhat.com, bbhushan2@marvell.com, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Dq2D9IuMWqkl

Auger Eric <eric.auger@redhat.com> writes:

> Hi Markus,
>
> On 6/22/20 1:22 PM, Markus Armbruster wrote:
>> Eric Auger <eric.auger@redhat.com> writes:
>> 
>>> Introduce a new property defining a reserved region:
>>> <low address>, <high address>, <type>.
[...]
>> I dimly remember discussing the wisdom of numeric type here, dig, dig,
>> ..., aha:
>> 
>>     Subject: Re: [PATCH for-5.0 v11 12/20] qapi: Introduce DEFINE_PROP_INTERVAL
>>     Date: Fri, 13 Dec 2019 11:03:02 +0100
>>     Message-ID: <87y2vg4k6h.fsf@dusky.pond.sub.org>
>> 
>>     >> So the "label" part of "<low address>,<high address>,label" is a number?
>>     > yes it is.
>>     >> 
>>     >> Is a number appropriate for your use case, or would an enum be better?
>>     > I think a number is OK. There might be other types of reserved regions
>>     > in the future. Also if we want to allow somebody else to reuse that
>>     > property in another context, I would rather leave it open?
>> 
>>     I'd prioritize the user interface over possible reuse (which might never
>>     happen).  Mind, I'm not telling you using numbers is a bad user
>>     interface.  In general, enums are nicer, but I don't know enough about
>>     this particular case.
> Yep I remember too ;-) I left as it was because I think this property
> could be used for other use cases.

YAGNI :)

A string would work, too, wouldn't it?

[...]

