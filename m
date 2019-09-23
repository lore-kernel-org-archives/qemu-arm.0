Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2978629wrp;
        Mon, 23 Sep 2019 11:27:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqylFEK8vjzzf4KGjgXIXF8jC2kw5ie2RDCRCpOI8hcuDDsHpnHmF4+QpbpD72SvGVC/6UgQ
X-Received: by 2002:ac8:5344:: with SMTP id d4mr1470967qto.258.1569263270899;
        Mon, 23 Sep 2019 11:27:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569263270; cv=none;
        d=google.com; s=arc-20160816;
        b=cbitfKKs8ewoYTZ229C0Z1+enw+op98z1/NafyWHcZY1V7Sg2axnwOv0S1A2+XOdhd
         1JqYevrfSzNvYUsnZXp88XLG5vui5p+1erX5yo3IXfBoT2TwpxSN2OcDPkmDxPngMGCU
         ZfP/4c7MlDtr1HfD55Bo6pZBXk4I9JR7YBI72Ix8fx7FQ+QYeP4lbkbWCpwRZkjOBhQM
         VobHjddUZZboy7xubmJ8bP5QyWeK9yZ31o9zstBPJ8sS4SJmcwCEpYpLd8x6D1ZDw7K9
         30xJcTT4u/WOaetuszFAJjHrQtyJcb6oFmk7bb3tlD2mD3aSmpBtR7j3AKUajpItiIhC
         o8gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kE6GTsnxEsnSOYqZoVxiBRcQ9jMpOE4rFqMDVVkm1lg=;
        b=lfFdiFiq6a5hwLcsHDxUizziuI1mi7sRrMQiEY3mAvfAQ1N5zPsNsDNUECJ+MBR02r
         nDND6QUibHtcMVptaDDzDYUC+nFHkK75/Q4m5VG1vYWMf15v5r7REqtVAKY2VjtBXx2G
         DI201OFw+KqSPTYOXOwhKAg+DBVihlU+jYNQVWzOfJPmwpa9/DDA3YEVMvvkIEsEI+Fi
         jxBKn91fKv5Cryh9bXdrr8pjoSIxrPBDDpVvz3EKyPXrSbYMvm3JcZrXgHln/CkT6dHe
         SZAXvJnIQMbI8fvkAgjeCAC3UUVCwS8c1kY5stKgJcE7aqCWVzCLxDved9CUygC3Grvy
         DNFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UCqEsrfy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z37si9409996qtz.50.2019.09.23.11.27.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 11:27:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UCqEsrfy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCT3u-0004h4-84
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 14:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49657)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCT3Y-0004go-NS
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:27:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCT3X-0007Xd-Qy
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:27:28 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:35914)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCT3X-0007XQ-Lb
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:27:27 -0400
Received: by mail-ot1-x342.google.com with SMTP id 67so13046497oto.3
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 11:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kE6GTsnxEsnSOYqZoVxiBRcQ9jMpOE4rFqMDVVkm1lg=;
 b=UCqEsrfy5zkY+UZnwpriH4g5cs0zmvxd6WR/yB6p+hRusOXUxrDo6qVASIGlFXdwK9
 5r4ASzCYEDjm/CvvwSm0xlyPivfixI1MNls0JqO5gwjRYuul9XsJ7VzD4ZsTHDO/rF+N
 aUfJnucgDqkdCbfXMpdwMpzf8xR5wWPOg8K9JANL+kAlegvH14O34EYer43CLl4u9t8l
 QY5neyzHTufOGnFPfCI6gGWHutsO9g+RDHlESRlXhwhcCA84uuvEyfLWS6KgpaYvghqY
 2lG4M+zNDnubLo0eRVLoRXv4XDyV9vSKHDDv9d0JIrAyv4542DAhfktv1D77jSVxNt/0
 9zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kE6GTsnxEsnSOYqZoVxiBRcQ9jMpOE4rFqMDVVkm1lg=;
 b=tPCtn4GP8+ZKuLN9N+1L6Q+5Xx0pV4dvSMw/eMH4/HknnWBv0VLJ6caHXeoaf0TG70
 RddG6dtMudsLH4DMFvjzpcOXSYXV5PH3DiqnvMuuM1bEAnp8KR5lukLohCcRmX8iS0W+
 PNfD1IPHq6JOvFMPs6/yfr6xzdrLXHZC32Ndd3H0M8MEZwXxuHcvew7CGOxsng8SLpjg
 diIS4enErUZSpjBiszl4Xy+5Mfx/WVG1hHrH3EOSKg0tHRFclNwIY7O1kY59DIITMtZL
 0kqwB+pIReQ7zVQssgvf+rubxWLPRDJrblJv9rWIq09nDQJku5YRTrKzVC+IYndbS94s
 SwQw==
X-Gm-Message-State: APjAAAXF9/jw1nSBtgoT7xZoe1azvrAUDfaUwPXACb2/bUTMS/hzexax
 LpAh2h+SO7wl3TCdCUQhug2OlfMevk4ys8zSoxbjIA==
X-Received: by 2002:a9d:5e11:: with SMTP id d17mr1032382oti.135.1569263246759; 
 Mon, 23 Sep 2019 11:27:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-4-thuth@redhat.com>
 <CAFEAcA_6UxMBeyOMM0iT5cnCQEpWXfRO2XMuV9ez_0Su2osXNg@mail.gmail.com>
 <0389e9dc-7f78-5b27-4764-51f0bdef5bef@redhat.com>
In-Reply-To: <0389e9dc-7f78-5b27-4764-51f0bdef5bef@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 19:27:15 +0100
Message-ID: <CAFEAcA8XSQs=fw839O4+tTUqy-DpNh-jdHxQsfYQxm-nTbvH4Q@mail.gmail.com>
Subject: Re: [PATCH 3/4] hw/arm: Move armv7m_nvic.c to hw/arm/ and always
 enable it for arm builds
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bsqA/cPi282t

On Mon, 23 Sep 2019 at 18:54, Thomas Huth <thuth@redhat.com> wrote:
> Ok, then what would you suggest to solve the problem that this file has
> always to be linked into the binary? I can't use "obj-y += ..." in
> hw/intc/Makefile.objs since that would mean that the file also gets
> compiled for non-Arm boards. Would you prefer a bunch of stubs instead
> that get used if CONFIG_ARM_V7M is not set?

I thought obj-y was for only-this-target and obj-common-y was
for all-boards ?

thanks
-- PMM
