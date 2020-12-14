Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2423146lfq;
        Mon, 14 Dec 2020 02:20:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzSm/jiUfW2P/H6ZPbVJo+7pbHMZQwashXePOa13m67SWVwcQ+vFMRVFdJXBJvWDeLkh4cq
X-Received: by 2002:a25:ac25:: with SMTP id w37mr32957189ybi.522.1607941240453;
        Mon, 14 Dec 2020 02:20:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607941240; cv=none;
        d=google.com; s=arc-20160816;
        b=wjBLqzqhyizMEKMNCCwj5BFFMLm4vrN02FA0U3E+Q3Tdr9u4JRfRImZ2A+MNauAWV1
         5uL6jdkAreO5MbfBfz/bgA8MGOn5ayc0tZgNZBEANuZcUV07Nb8y4qNJwu2XKrtKYWdB
         CDB+Ijj76rSvvecGNvhd57IAed4QLQQ3TS5c9hTIOLzYuxwSw4chV3MyyE39C14fPf23
         SYoRVw3z1VaUF8NNVrwtex3J4ZlJwgtoqbxKP+qFq+Sepasq1i1+yzlRMqnOXFne5Sha
         7+3XAPSo9p8Y+4gEz/LkZSRciOJcy9XZJOmyBRP6pQPKe1Zlx02sRYkviO66lnpgnzoi
         N7fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=VKJuWEjZ7HEqn+md8jv6dUOfhVZW6quQNiqaNPkOsHc=;
        b=l/Zse9DyTl2bCwWbjnI/Y6UMDR6UWV7kYd875RtmRUeEwlh/gYNDIUUawodsQCAvAM
         JV1BdnLKUsJbFKvohVvuD4GAoLxLTld/kx/5KBocM92b8qpqzNoCOGEeFzTxJoq2bJDW
         sWN17H/rHa+TeEgKTyeRqXFFQBnPRDu9T5MVPUViS4vdxArf96A+/dQCpB4Pc5Xs5Ztu
         UzBrieRjU58xHXuYVPTkPzWme2/4u8dby/kuWaZWimS/jT1RB7QnzU9R/uWyznCU+bRK
         9MjiMkv/3uauDrY73N8Q/sgQUOd5iNmUApL5tAYfp0CVVVVyVUSqh1DBTM2HZWQp/8lb
         5D+g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T5PxpI14;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n69si17102416yba.348.2020.12.14.02.20.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Dec 2020 02:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=T5PxpI14;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1koky7-0004Ej-RX
	for alex.bennee@linaro.org; Mon, 14 Dec 2020 05:20:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kokxy-0004EA-Gx
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 05:20:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kokxw-0000gh-R9
 for qemu-arm@nongnu.org; Mon, 14 Dec 2020 05:20:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607941228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VKJuWEjZ7HEqn+md8jv6dUOfhVZW6quQNiqaNPkOsHc=;
 b=T5PxpI14sCZ1XsiI3RPPOiiU3L9q5vn69dpEIkHiuS0X/jHDrNKwJnbpyCWbN+Au/8LesD
 pTBGQZj9fQ3acRrH4cDXrXOOQB0LWEHqf70y18LsyorLShTawKywkFK7FUAQZ/uO7Fnh3v
 87XUbPaakiZyITQZ0vkKMuvC8yta5E0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-dTetH7YTNp-UmFzrSiqkgg-1; Mon, 14 Dec 2020 05:20:26 -0500
X-MC-Unique: dTetH7YTNp-UmFzrSiqkgg-1
Received: by mail-wm1-f70.google.com with SMTP id r1so6538390wmn.8
 for <qemu-arm@nongnu.org>; Mon, 14 Dec 2020 02:20:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VKJuWEjZ7HEqn+md8jv6dUOfhVZW6quQNiqaNPkOsHc=;
 b=q5zJXxnxDcx30EubR6ZYI9Nz4XJ4R/248I6zmATjgHZEpBd2z/CmmD7ndyu88n/oWC
 JABN8zfZ2NFs5qTiGqswgN5ETzPWSDc3Z+asEdid9OdFNKBjUCY1AtgCoueiP9telZ9x
 NFwyCMZSrvtrHXUMooz8rG1RAyolDqb1CFnQVsAUbeItvdZv1C80vACrFxUnSL3RPfoh
 DFyqtyP0m1oUrbVAYQw/eZNALLIlnjFlSlKFWabh+J808pgl6gN9P75/yDu3Q2YN7b3S
 w7ouIcmRPRF7AkFUs/jtZ7C9wsGsaTfi+285w85RmLXUMa+SbcY5QTsYmrXP3fisUjwN
 aIgg==
X-Gm-Message-State: AOAM533JwjZz94tnvBJ606mPC6ztlwJpw86SR0KGC7ng/uJz1dKuDNiQ
 WpPVF85DsUOFlVYRjPLbIDHDbSj2H2hG7TcgluNCUIL3+S/j8N3FD/zLYZCr+WQuifaulmhT1rK
 Q7AAxPhAqiESY
X-Received: by 2002:a1c:f017:: with SMTP id a23mr26187758wmb.56.1607941225266; 
 Mon, 14 Dec 2020 02:20:25 -0800 (PST)
X-Received: by 2002:a1c:f017:: with SMTP id a23mr26187738wmb.56.1607941225059; 
 Mon, 14 Dec 2020 02:20:25 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id r2sm31320917wrn.83.2020.12.14.02.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Dec 2020 02:20:24 -0800 (PST)
Subject: Re: [PATCH v3 00/13] Remove GCC < 4.8 checks
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20201210134752.780923-1-marcandre.lureau@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9df914a2-cf0a-6cf5-76ee-502a75873825@redhat.com>
Date: Mon, 14 Dec 2020 11:20:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201210134752.780923-1-marcandre.lureau@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IIq7LDZsu3Lb

On 10/12/20 14:47, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Hi,
> 
> Since commit efc6c07 ("configure: Add a test for the minimum compiler version"),
> QEMU explicitely depends on GCC >= 4.8.
> 
> v3:
>   - drop first patch replacing QEMU_GNUC_PREREQ with G_GNUC_CHECK_VERSION
>   - add last patch to remove QEMU_GNUC_PREREQ
>   - tweak commit messages to replace clang 3.8 with clang 3.4
>   - fix some extra coding style
>   - collect r-b/a-b tags
> 
> v2:
>   - include reviewed Philippe earlier series
>   - drop problematic patch to replace GCC_FMT_ATTR, but tweak the check to be clang
>   - replace QEMU_GNUC_PREREQ with G_GNUC_CHECK_VERSION
>   - split changes
>   - add patches to drop __GNUC__ checks (clang advertizes itself as 4.2.1, unless
>     -fgnuc-version=0)
> 
> Marc-André Lureau (11):
>    compiler.h: remove GCC < 3 __builtin_expect fallback
>    qemu-plugin.h: remove GCC < 4
>    tests: remove GCC < 4 fallbacks
>    virtiofsd: replace _Static_assert with QEMU_BUILD_BUG_ON
>    compiler.h: explicit case for Clang printf attribute
>    audio: remove GNUC & MSVC check
>    poison: remove GNUC check
>    xen: remove GNUC check
>    compiler: remove GNUC check
>    linux-user: remove GNUC check
>    compiler.h: remove QEMU_GNUC_PREREQ
> 
> Philippe Mathieu-Daudé (2):
>    qemu/atomic: Drop special case for unsupported compiler
>    accel/tcg: Remove special case for GCC < 4.6
> 
>   include/exec/poison.h              |  2 --
>   include/hw/xen/interface/io/ring.h |  9 ------
>   include/qemu/atomic.h              | 17 -----------
>   include/qemu/compiler.h            | 45 ++++++++----------------------
>   include/qemu/qemu-plugin.h         |  9 ++----
>   scripts/cocci-macro-file.h         |  1 -
>   tools/virtiofsd/fuse_common.h      | 11 +-------
>   accel/tcg/cpu-exec.c               |  2 +-
>   audio/audio.c                      |  8 +-----
>   linux-user/strace.c                |  4 ---
>   tests/tcg/arm/fcvt.c               |  8 ++----
>   11 files changed, 20 insertions(+), 96 deletions(-)
> 

Queued, thanks.

Paolo

