Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2494860njk;
        Mon, 27 Jan 2025 07:01:40 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVj9ijR5YfOLyRPEbn1IYG9ps9K2GZdSce+5cVuTlblll20WM/GAIdO57w/fZS3FrTTd+yICvRVkeT4FA==@linaro.org
X-Google-Smtp-Source: AGHT+IELsj70BmgzLUEJsGfy/yB8ZviO4fjLfNZrw9NC7dfT02p/g3VKPtp/7j35OhWbSd/kv37Z
X-Received: by 2002:a05:6902:1005:b0:e57:fc0a:fae9 with SMTP id 3f1490d57ef6-e57fc0afcacmr21325330276.5.1737990099558;
        Mon, 27 Jan 2025 07:01:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737990099; cv=none;
        d=google.com; s=arc-20240605;
        b=Dc0EtQYhm/d8yAPJW07nS2xlmZh/i9YykGdh464F2z8bG9OCor05C65cJS0fybdvOG
         eJULGhugHfCuFFJz0fmnIoOCQykFBjUJDvJzsgR0Zc1JSG9bkPGw5vnyklyePxH2SSJh
         qRx2AsikYNKvgNXIQ1bkyJSLX0jeqiG6VesHufb1SzBHFhShPjNdvrE+4q5n/5B+FuJM
         BIj4DUuUH6+kL7nUXxXLx7AaG3TNWCSB4tvrLsf837F7Vq3k4Z/4iSULMxLM0lMcNR3d
         4fDaxmSibiHWwp6vl0bROHDYU+eva7HpzbgJ4hDodkK7AnPufSqab57Q0MStPQL/DlgX
         rXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Z+C5I7CFoAxs4fjig91TFCyeC8lhhlKttbQmuiJJyAI=;
        fh=o+/u3dYUtB94MU9J2o03YQXrfLWTwmw7YFlsIG/pMPI=;
        b=W1ZQ5ovwrvwINMIe03EewrXeFM2cm8aOc4/pVbbaKON09P1OaOiiYUXN8BTz1xlzex
         cvcrp61PSemgEH8WBJTPJxVc+0yMc8AiagfAkQLpFmhlvypoEfKjG013TzCKBEOw6yGO
         1D3wStVZvZklRWyiZurjkBnuNhG6Isnf30b66643FWrKlWqKv1ZJzMaQVBSsxox2hFQN
         cDib2kpCleh0n9ulUOqDtHV//bGTudIYak1Y8Q97qXdzOOfR3/S0APbU5C0Ho4GQuURB
         LSUA5r23hXbXu5Eq9wGWSpiXjVnMCr4t2lzkJJLkTDNgADJG3KLggasCSyDUqwR3QkJR
         MN4g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Fbj/n41Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e583b748a28si5564147276.71.2025.01.27.07.01.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 07:01:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Fbj/n41Q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcQbv-00036a-U6; Mon, 27 Jan 2025 10:01:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcQbo-00030m-Tw
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 10:01:04 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcQbn-00008x-49
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 10:01:04 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id
 3f1490d57ef6-e46ebe19368so6367498276.0
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 07:01:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737990062; x=1738594862; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z+C5I7CFoAxs4fjig91TFCyeC8lhhlKttbQmuiJJyAI=;
 b=Fbj/n41QOsqLyc6ucPpBd0b8zI4Cu1VvQMy/h22T/LkLIUA7r4HyFkfDhPWVUuKElu
 4nhnEpWWBooiyMyy9gszilTACH/t/JSISKYHQXXhUxJhEYusbcM5h8E+M6ah/77nEsDP
 yqfbTCtZKpjdGzoYb3uiyoTHbt3Fn6b4xxHJImVgAXAdyMMh1EyPPBd/PDkjQbPvUKLn
 hSAxf9YQJN4aPNdd2mOn0Ct0cLQ7rNgGg++oVN/hZbq2sybsSi0V8ZukpUxZHWxD6LJg
 EVCwue/QZUnV37qs9KDZr3J+mXs/GFvCFDjvKhs7EiwQTMqtEJeCk5cJpIBTMVNayyBr
 muKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737990062; x=1738594862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z+C5I7CFoAxs4fjig91TFCyeC8lhhlKttbQmuiJJyAI=;
 b=G6/jvlZ8EBoJc4tLU7laPmM41Wf21F6kZ0yWiCXWrG9el/7imYdwMNvnbjQas5BLBe
 bhubk0qcaBVDbboPGvukXvCfcpGh8Wa8N9vh/8wqub1IxWOUZFe+8E6VdYwRLbvFoR3s
 tYh0S/F53k0Dr8ypO1Z5cxxnulTKDU5bFvCcjLfblIIdWWoOGvAAzbwUNr4BOEqv2wQ6
 GLVldrjjT+0b4u3Lyb+JJZ7yqjQi37M9tC8U/myT9ldg4sfrMDBnRi8XySXJj0tBQX5E
 jOTmj3a4r6dQqN9oV9rzeG99bJwk20zJ9mf7jbgbJjWOkCwcsvdrI3KhX4VSWIBGVpPt
 Kz4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAxlWXbf6LwFLcz6WpsD536/lfozgUYox2fmNw2IKYH2WhmPuLB9e58F8ZcuhBzH6a9LKXBTWFAg==@nongnu.org
X-Gm-Message-State: AOJu0YyiJuuLk/FuaKNCazBZEhjdS3K0zYfQKTbodT3HkyXwW9nQfBEY
 Ae97EFp8NuolUfq4WVmVQWJ59R9Z//Nke3vIrIwM82HHOEHFqEvjLe7alWCx9x7HshYS+XEoq6M
 ZwelO4nBDa+vwvFkPVtLQ+p5yYLjk49ZKELdQ9Q==
X-Gm-Gg: ASbGncsQ2y0Fm9ssAlfiyCxhjqQjbZsgrOxTgEbRu+cpLFqshvLnaE90InmYCqbQLOj
 l1SHMB8kJ7ScQUCvg9ESwzbNm7+NRg6M1EirFYLvDtiULHRS/wUTgs3P4kDUXeaY=
X-Received: by 2002:a05:6902:2b8e:b0:e57:a314:cf2a with SMTP id
 3f1490d57ef6-e57b1047a16mr25669177276.16.1737990061479; Mon, 27 Jan 2025
 07:01:01 -0800 (PST)
MIME-Version: 1.0
References: <20250124101709.1591761-1-thuth@redhat.com>
In-Reply-To: <20250124101709.1591761-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 15:00:50 +0000
X-Gm-Features: AWEUYZn3aSKleID4eXj9a_tVllj3b5eCTUPBsh8-6cqEBIGegnJd0Jxa2lCy6lM
Message-ID: <CAFEAcA8R00Y1w2W6NnUTORXvCkMijb59kyXLnyLXPWuG3-a=Pg@mail.gmail.com>
Subject: Re: [PATCH] tests/functional: Add a test for the arm microbit machine
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hpO4AQiMxg/o

On Fri, 24 Jan 2025 at 10:17, Thomas Huth <thuth@redhat.com> wrote:
>
> We don't have any functional tests for this machine yet, thus let's
> add a test with a MicroPython binary that is available online
> (thanks to Joel Stanley for providing it, see:
>  https://www.mail-archive.com/qemu-devel@nongnu.org/msg606064.html ).
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  MAINTAINERS                           |  1 +
>  tests/functional/meson.build          |  1 +
>  tests/functional/test_arm_microbit.py | 31 +++++++++++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100755 tests/functional/test_arm_microbit.py



Applied to target-arm.next, thanks.

-- PMM
