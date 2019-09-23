Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp3002427wrp;
        Mon, 23 Sep 2019 11:51:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXqA5waKa5mwDn3/qaNFfqR4dcYQypdZhCY4BJlL6Onmty9BtWhRJJIOhWHI4y3iE+vFCp
X-Received: by 2002:ac8:3564:: with SMTP id z33mr1537201qtb.291.1569264716054;
        Mon, 23 Sep 2019 11:51:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569264716; cv=none;
        d=google.com; s=arc-20160816;
        b=Zwx/rD7mP6+uyd17JdPxg/zqH5Q+zRUsTGjVyFyCy2XljOYy7Gas+ISmQUhRbJoJyJ
         Atgcxqghc1RWp61dDAGUu1092v+wFst3TKq85yxMWdyfwLQzVdJIJa/+2lJy8yjaWXsk
         +og6I8MFkUnbmLrf0s0TrfGRnDXgB8ebmfqHfuFqNBB7y3c32XokQJikrLJGAOp2WJqt
         otcSvMp0vxdR1YCDdki673yDI8zzVkEW3yJTbMHbRfVCkHeLGps2H9Iw5oD6zcfckmPs
         JZREfy1rH50LnevWxkSzbm4eeP5+4BYz/G0YC0pczBp+SgNcqlZlSEMFVkjnNBIxnRZs
         dHJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:openpgp:from:references:to
         :subject;
        bh=KnuO8wbc/+TQlqNeITuVX+D9dc13WLRWPMjw/bFZyBM=;
        b=lmC0SxoYxoUQeOvJu7yF+RwEhrv2kY9+ckc+vFdlm9cOWe1OGxA+7zFcZDw/+zAEkw
         l8MwJ+g2qJTs1brEWFfCjkbWWbAnFtGEw/RjIJiishrkWz/sUVKe4SIqqd/PNn49uQnw
         40WQdyElqh+ygkgoTLNCyWDqAHa9s3HvI9YymmiI1CVupgQKLLdG76KMnwhBmiMDyZDr
         uXrlGM9xLEDu/1sArxiRyS4y1maqJ/RWn2S0Z2XecLWywYanxKiawlxkb6RZ20je7laY
         RePxA8GwkXOGBhqJVX7odVszC+v4t0uMX0qkNnN/bhV42V7DiR7l9ePxjfLU3VOVKMCC
         3YQw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g91si9565746qtd.265.2019.09.23.11.51.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 11:51:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:32948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCTRD-0003mH-Ce
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 14:51:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54121)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1iCTQv-0003iz-KT
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:51:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1iCTQt-0003fA-D4
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:51:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51344)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>)
 id 1iCTQr-0003eF-8c; Mon, 23 Sep 2019 14:51:34 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1FD2318C892F;
 Mon, 23 Sep 2019 18:51:32 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-120.ams2.redhat.com [10.36.116.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1D52519C58;
 Mon, 23 Sep 2019 18:51:24 +0000 (UTC)
Subject: Re: [PATCH 2/4] target/arm: Move cortex-m related functions to new
 file v7m.c
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-3-thuth@redhat.com>
 <bd6efd14-9200-98e2-4f76-dda101f85274@redhat.com>
 <8585b93b-e239-829b-d634-b89941f27aed@redhat.com>
 <CAFEAcA9k59CRG23qP-o5PF0mdXvXpszhuxx+GpbpWO+hFdHOOA@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; prefer-encrypt=mutual; keydata=
 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
Organization: Red Hat
Message-ID: <4841d83d-4d91-eef6-28aa-c920cb10d9c9@redhat.com>
Date: Mon, 23 Sep 2019 20:51:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9k59CRG23qP-o5PF0mdXvXpszhuxx+GpbpWO+hFdHOOA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.70]); Mon, 23 Sep 2019 18:51:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
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
Cc: Auger Eric <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kxLqQTtyJJFc

On 23/09/2019 20.45, Peter Maydell wrote:
> On Mon, 23 Sep 2019 at 19:09, Thomas Huth <thuth@redhat.com> wrote:
>> However, there's one thing I currently don't quite understand in this
>> code (since I'm not an ARM guy, sorry) : There are references to "v8" in
>> m_helper.c, too. Is that related to a separate CPU type, ie. should the
>> v8 code also be available when CONFIG_ARM_V7M is disabled? Or can the
>> code in m_helper.c be disabled completely if CONFIG_ARM_V7M is not set?
> 
> QEMU's naming conventions here is a bit confusing, for
> historical reasons.
> 
> Architecturally what we have is:
>  * "M-profile" -- this is the flavour of Arm architecture for
> microcontrollers; it has some big differences from A and R
> profile (eg the exception mechanism is different and it has
> a built-in NVIC interrupt controller). All the Cortex-M<anything>
> CPUs are M-profile
>  * "Arm-v7M" -- this is the v7 flavour of the M-profile
> architecture, eg Cortex-M3.
>  * "Arm-v6M" -- this looks like it ought to mean "v6 flavour
> of M-profile", but if you look at what features it has it's
> more like "cut down version of v7M" (fewer instructions, cut
> down exception model, etc, but some things which on A-profile
> don't appear until v7A are present in v6M). Cortex-M0 and -M1.
>  * "Arm-v8M" -- v8 flavour of M-profile. The big change here
> is support for TrustZone. Cortex-M33. v8M comes in two
> sub-profiles: "mainline", which has all the features like v7M,
> and "baseline", which is cut-down in the same way v6M is a
> cut-down v7M.
> 
> In QEMU, we implemented Cortex-M3 first, and then added -M0 and
> -M33 later. So mostly our function naming convention uses
> "v7m" when it means "any M-profile"; a few v8M-specific
> functions use a "v8m" prefix. Everything in m_helper.c is
> M-profile specific; most of it is used by all M-profile cores,
> and a few bits are v8M-only or v7M-and-v8M-mainline only.
> 
> From a CONFIG switch point of view I don't think it's
> worth being able to #ifdef out the various flavours of
> M-profile individually.

Ok, thanks a lot for the explanation! It's much clearer to me now.
So I think it likely would be best to disable the whole m_helper.c code
instead of introducing a new file like v7m.c (but that likely requires a
stub file instead or some #ifdeffing in translate.c).

It also sounds like CONFIG_ARM_V7M should rather be renamed to
CONFIG_ARM_MPROFILE or something similar?

 Thomas
