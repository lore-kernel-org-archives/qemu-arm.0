Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1295440lfb;
        Thu, 26 Aug 2021 23:46:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCymJ8kmEQuhyh3xeVYZui+S0MSsp13LM9feG3gkQsNIAAG5pZh76QcYamgNwVVbDQtm0p
X-Received: by 2002:a5d:9304:: with SMTP id l4mr6335125ion.167.1630046801717;
        Thu, 26 Aug 2021 23:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630046801; cv=none;
        d=google.com; s=arc-20160816;
        b=sl/QewRJrYi/7HLxtPnR5tNg+xWUtUZoCiOQFdg2q/NlBBpn6gi6Xp3mwOKv7pZ7Wb
         0Jc0FP8QcSgyu/nWB8q+It9sozxDNYydbfOdrVkoCr4TOzKWMR+Ki8QLwACvO0tuAdGV
         24EJEBMOu0PCv6o2VV2I0Iqy2US1CoBM+zstr8OpdAtmuV5JMxXnYx3dbluKJqZnpI4/
         IDRvAYqTFDg/UsamwwdGKpMFgCpGE/6v6/We+FkBkGIoXT6ay2MJegy6FLQ6fhZ9IYDT
         HXc1EihKjDpoKfKYmV1ra/mwKXzUcQyKDoGubd6YK5NK2R0PSN2PMfBXsDO/ZPoQmW8b
         0O1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qaiNbsTnDiMoelfOI92WglYxDboJmDaviwsHOxSqXOw=;
        b=BUY9xfgtFv+TTWUsffAetVhtqIQZ+nGKHQV973F2WijseC+DLlFxrLnNHV4//9X5HG
         qRKgV9+G5mB1CokFHHB9hjr4Wh+AzOT+AXY3JiCEu/8TYpa8nMXNL1mNd0bJUIcH29MI
         +h8z3ypg5Ldf4YRH4ghQGmXGkqPHeLFdADd6FczaJmO2KwSo7B+cId+rtg+6aDVIuOdl
         6CGqXUPY089SeU0zAeLFsgjTHsi36J0m5VQeGXF5o7WjE82tKUIhzqakDSLf1ba5tXg9
         MDcikgWeaZrQhYTQ8gyIldvcaRju4re/5oV9JrTEi0um7axPsxiye9h/JUJl94TbBc4H
         BKTQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YhUTmuU6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a16si4869488ilq.77.2021.08.26.23.46.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 26 Aug 2021 23:46:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=YhUTmuU6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mJVdR-0002IZ-0u
	for alex.bennee@linaro.org; Fri, 27 Aug 2021 02:46:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJVdE-000295-7z
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 02:46:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52595)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mJVdA-0003nE-Qw
 for qemu-arm@nongnu.org; Fri, 27 Aug 2021 02:46:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630046782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qaiNbsTnDiMoelfOI92WglYxDboJmDaviwsHOxSqXOw=;
 b=YhUTmuU6Hf5w2gesDL57iRSUZjbbmS2I7L8uwimzfzUACGCIebr11/ACTBRkQwNcL2y8s3
 m7ZMAxqzeA8mbHK17WJEJAj1kci3lqBh+NA2a+D0KC+3Ltr/C/L9pLIBUb+XErlYbtN6uf
 EOKYolOYSHPXoexdg1eruVSWe5wFEcw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-7Vv1G3i0PTqDEf9_Rx7ogw-1; Fri, 27 Aug 2021 02:46:21 -0400
X-MC-Unique: 7Vv1G3i0PTqDEf9_Rx7ogw-1
Received: by mail-wm1-f69.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so5439408wmj.8
 for <qemu-arm@nongnu.org>; Thu, 26 Aug 2021 23:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qaiNbsTnDiMoelfOI92WglYxDboJmDaviwsHOxSqXOw=;
 b=AxMJlwFWsaQ98buZSBSVZCqW5OFM1lgCjOCOJol4hUnGi3m1lyN6sPcAJMHGPh2wma
 KMCqSxvLqaZRrYbLbqpMI1xnX3qN6ya+f+9tebC/LrZt6dR801GrppgXmZ315x7Iw/CP
 te8OfQHiuCnqhTWEGakU9ACtIMyTtXb/PH0OYHRFwJCIodNZT5+DpkxMopLytkyPpd8P
 rcOJRUFu+McF+LtM/J1wNdeNlKgVnRIXVR+iSyOjYdYdcWDezRr3zy4O4+iZgH0QU5cR
 DiSt2y/w7q6x8HUF9Vk6agy6shgPpz/WcxSjSyyVFzZS8jPkopHUKINtVK9sX0YweSYp
 lk1Q==
X-Gm-Message-State: AOAM5315N1WTpqlyMTO0u7ZxPjvAjXpY+Gg068JUChr51fFtF3odF6w/
 8nTlr8ik4ZSD2PKrQ9CORvqobSte4OYV/ax07uosDsrWHSCwp9eHeXa3hRR0ooMnzOLW4Hucqs/
 2ZSnvKECafGdaiAL0iH1VCoOpHPikoP4icMF8OtGwL/JF+KDziM/y5LNjCyXE
X-Received: by 2002:a7b:c387:: with SMTP id s7mr17489151wmj.26.1630046780359; 
 Thu, 26 Aug 2021 23:46:20 -0700 (PDT)
X-Received: by 2002:a7b:c387:: with SMTP id s7mr17489126wmj.26.1630046780091; 
 Thu, 26 Aug 2021 23:46:20 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-148-182.46.114.pool.telefonica.de. [46.114.148.182])
 by smtp.gmail.com with ESMTPSA id z19sm11920427wma.0.2021.08.26.23.46.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Aug 2021 23:46:19 -0700 (PDT)
Subject: Re: [PATCH v3 1/2] tests: Remove uses of deprecated raspi2/raspi3
 machine names
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210827060815.2384760-1-f4bug@amsat.org>
 <20210827060815.2384760-2-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b3ed0ad1-f3b1-0178-7145-dfb1dfed01cb@redhat.com>
Date: Fri, 27 Aug 2021 08:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210827060815.2384760-2-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: libvir-list@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NlisIdHIs9/o

On 27/08/2021 08.08, Philippe Mathieu-Daudé wrote:
> Commit 155e1c82ed0 deprecated the raspi2/raspi3 machine names.
> Use the recommended new names: raspi2b and raspi3b.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   docs/devel/qgraph.rst                   | 38 ++++++++++++-------------
>   tests/qtest/libqos/qgraph.h             |  6 ++--
>   tests/qtest/libqos/qgraph_internal.h    |  2 +-
>   tests/qtest/boot-serial-test.c          |  2 +-
>   tests/qtest/libqos/arm-raspi2-machine.c |  8 +++---
>   tests/unit/test-qgraph.c                |  2 +-
>   tests/acceptance/boot_linux_console.py  |  6 ++--
>   7 files changed, 32 insertions(+), 32 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

