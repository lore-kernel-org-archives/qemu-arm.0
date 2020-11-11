Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp729296lfb;
        Wed, 11 Nov 2020 12:05:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxKr2JzFo2myfUUi6xiHFHLru+B0eeNfWudvAHTnq+i9rw1vL8QHgru0wDAfYSDBQMgBjYr
X-Received: by 2002:a25:67c3:: with SMTP id b186mr37060343ybc.150.1605125142857;
        Wed, 11 Nov 2020 12:05:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605125142; cv=none;
        d=google.com; s=arc-20160816;
        b=unnRSxSNFpNYt0uU9eotLojps+bE0/VT2Jy8JVeWnIakDOrp1CvKNktxRAcTECeR5l
         A7NqpWSsZ0fcIvWi4pVAxQFz675UwW0wJGwALfsz919OD9xfVQt3APOlpeDNymZmRvZJ
         jaf8gCKhl2umq5kfu7EL2H5f7uknZbk7cvncbhZ1G3YhFPaY7EL+GfWe/VhB3C13ADRs
         FkWjVwNs8haZ7dIJtVMk+7NMK0XdpBD9veK9iYRqnby9/OY+dzsrumClIpQGKalm4TFH
         H4JkeF8DXUa6e9P8M6+yXB5iUcWOqYV2wJdrpjK2s1QkpGtJF3G6UaOvRQxWAyaM/zmL
         4bPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GQ8VoJzhmbPzY7eNDT8rB/PjtpsOpetR66M5nP7kTMo=;
        b=cAJk8pUG/9wyyJyZRt8PkNzmtfEDkL2crYMafjenzLG8s27jRdPi1td9GuMO05K7Yo
         KHDwDGTSUuR8J+FkxyPm8/JxiGbK2zvRR6bVfp0iAnPxMBoujgJva1CEfds5de+sCti+
         165m+XpIQsfa2c18FJ/airfQb053kdtqNC9stXMyq8wv0nVK1fvVGJ9routnQZmRfaig
         HvCms7vRNyD/Z7LwsEgXS8aKhf4UryBbk8BkdoE+S3BbIKi4FKJXMZ8/wr6idioSuaqa
         Bsh4fcClyTkk4QYMdhefpGHKhg/LsKIXCXntSs3WvyQ3zSsX8uVWpLCqS6dBcQuUDZyI
         iZEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bQgjGcmJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w9si2704117ybk.401.2020.11.11.12.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Nov 2020 12:05:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bQgjGcmJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcwNC-0005MW-3f
	for alex.bennee@linaro.org; Wed, 11 Nov 2020 15:05:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwLu-0005Gm-6g
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:04:25 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:36412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcwLk-0000Vf-20
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 15:04:16 -0500
Received: by mail-ed1-x542.google.com with SMTP id o20so3648150eds.3
 for <qemu-devel@nongnu.org>; Wed, 11 Nov 2020 12:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GQ8VoJzhmbPzY7eNDT8rB/PjtpsOpetR66M5nP7kTMo=;
 b=bQgjGcmJHa8s51Ijab38yjtaf8MjV+kPx45Tews8ooemIBbL80r/LSaQBjsGjulvhD
 35/LRBO8SVla4Lo/fCeDwFC1i1DrMRhP1FAM2s7GEp8E2rIs7M+6K6f94kJ6oG/svMHM
 5sdkU6MNb7/mnhIFNFzJFLBPw1if0MneooDhiSkWN4yU5d4zsAUvoCkxALTJt+hgnLoG
 DtsImmR9WMgr+0k/CstkgiSlJBXK/wT1dDQIJxmALDWIvpydDOPenzV8AOIOuA7x6BYk
 c4ggTMExnQ+qa65QGBVtl+xCjCrlsiL/Ii+Fxc85tnhB5asrKnfmyhmVRvLhSptIG4FV
 N1gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GQ8VoJzhmbPzY7eNDT8rB/PjtpsOpetR66M5nP7kTMo=;
 b=amDlku+4Ek67k2UlG/0soqId4sYuzlqRj9BDbh41r5FBCllzeCe+Mb56pR83U3ErtP
 vjLoYk7vJQD/J0lMZw5CU2zzVYHfqtTt2XBPfidM7JZqzSpXpHnBusyYaX1B6UaKcMNf
 aPwJ0sBMc1d5Crld18mM+m2mYrUlGlB4SK1Wds+fZfycLtTG8w2dispDFNtdDdNYQfPH
 g62Bg3lVJq9FTqDiyprf+BFPrdp3E7j4T0KxkwUpYnC0fdIVNUffoB/W3zeSjA7OlDD/
 PcRP02XdO8X6oRSo9JzFGcP7oo0hJqThgE+MeP6LSiSd/FDEovAwg4aVJbkD9omCQDdz
 EzyA==
X-Gm-Message-State: AOAM531JdLmrNjsTHJ3DIJo7kOTVwH1p1vWKjSokABJ7ij2XylLILJqB
 8xt7mw1237t+gNbEVVgNog4QlU9wulgrAvTgbplF6weqSFA=
X-Received: by 2002:a05:6402:3089:: with SMTP id
 de9mr1357880edb.100.1605125050167; 
 Wed, 11 Nov 2020 12:04:10 -0800 (PST)
MIME-Version: 1.0
References: <20201111183823.283752-1-ehabkost@redhat.com>
 <20201111183823.283752-7-ehabkost@redhat.com>
In-Reply-To: <20201111183823.283752-7-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Nov 2020 20:03:58 +0000
Message-ID: <CAFEAcA9-3wFuT_LOE5HOP00mwoK9Unu4w3cm9fhH_YnU4T740w@mail.gmail.com>
Subject: Re: [PATCH v2 06/12] virt: Register "its" as class property
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: John Snow <jsnow@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oT2PRPrNZrzB

On Wed, 11 Nov 2020 at 18:38, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> Class properties make QOM introspection simpler and easier, as
> they don't require an object to be instantiated.
>
> Note: "its" is currently registered conditionally, but this makes
> the feature be registered unconditionally.  The only side effect
> is that it will be now possible to set its=on on virt-2.7 and
> older.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Cc: qemu-devel@nongnu.org

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
