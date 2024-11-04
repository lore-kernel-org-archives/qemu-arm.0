Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2116345njc;
        Mon, 4 Nov 2024 05:50:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhFK+dKzsBEcOaPCtQoo9CPU3pgd4ZrYDTIBwjgWMgmUlNZOlvIMY52rfFzrEOso9MZ1U0CRLoeaoWyw==@linaro.org
X-Google-Smtp-Source: AGHT+IEMbcjTTQQ+s1fctW52pwdFj186lpFjFtGDyfr6EfD3LWoMyy3QLesx+A4ggwvHI5OuLaaW
X-Received: by 2002:a05:620a:1993:b0:7b1:45be:2e87 with SMTP id af79cd13be357-7b2f24dcc7cmr2295117885a.18.1730728244011;
        Mon, 04 Nov 2024 05:50:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730728243; cv=none;
        d=google.com; s=arc-20240605;
        b=iZ8iW57jD9HLJRFnxbJQB77Xd3TWK5bPajUtnNMlxptJM1VuSP+pHcCov1x4PxlaFs
         9H/pzN+vYpLkXgf4Fc46DZFg6zcyNtlnqqj7BUmGTF8z6OfXCXvEqZbPu6qiZyqQFhJn
         tuQkAKrTW2mwNdgGa6w09BbDM/cgHET01QwOTcibYF/W6hK3VRR6czJpOPmU9aG1n6fk
         f2XJJDzU0RZ6oVJ6qlt1MUI5kL36VJYUa1pAMQAnKQ1Lz88pTZJ+STNsVVOCJYVsJ+ol
         OL+U9JFqThBDwUiynQGYhdgsyf0xYgVmbnmnsbDD0B/Iqzrx3Vtn5LPqdJtwuQI5LR9t
         W1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dS1gayiJU2kFB+GNxmbWJy3bmw1afim8OPvFaUJ+fX8=;
        fh=2NL/sGWtyDyFM0jhcB+y48S8TkgAAVqMJxBJqtzF7p0=;
        b=knoS57X3SIgfr5M6ZGyeLpNBxqa995l7dlx7ObchAdGx/EWbnnPnFPrKrnqO73LC3g
         Q0FxEaxey70oQ42AQQASY1/DSwFtiM4BhC6i5bUcsZElR2VO1k0q3YjzRMOLmeTlDJpB
         a+hOpWJY/DUfe97KAcuZKl36wojOFu0+3odVs4yIvdThhiS1Nbps0Cv60ijG0HqxIw2G
         YAkD7vZXItunZ+b/E8LT0xHXhuF9DlydZUgIJHBYfkIPalNDvHVZaw4qL9jgNE8gdN/Y
         jNsEJ/sA2m7jLLDz7yvGI/B5qGoU21aFxGUZRZvmIGFVRM0EtKtk8lgFPNtB5q7Lcu0a
         9H2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JAEPYEMX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b2f3ad5786si1076023685a.720.2024.11.04.05.50.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Nov 2024 05:50:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JAEPYEMX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1t7xTS-0000pJ-Ng; Mon, 04 Nov 2024 08:50:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t7xTQ-0000os-Ii
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 08:50:29 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t7xTO-0003xb-LD
 for qemu-devel@nongnu.org; Mon, 04 Nov 2024 08:50:28 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c9454f3bfaso5482198a12.2
 for <qemu-devel@nongnu.org>; Mon, 04 Nov 2024 05:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730728225; x=1731333025; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dS1gayiJU2kFB+GNxmbWJy3bmw1afim8OPvFaUJ+fX8=;
 b=JAEPYEMXsajplrHf9LIN/3MIN7vbdCAYUk1M9e4AkAC62vMGoxZQ29EJUq3zgFUdLN
 x0mjt9g+StvjAEAZk7jshjuFpwnfOGuGKx2OAG+1WM9Au9j3WkvQzmuXlKEUkU/dVYgW
 dzkC0tsqQtCTGi8bwuhkSmtAnBfKixuunJ5Dn84XSYI0wR/WZCEkcyTwl9xOvdw+OSod
 ujN+P1g/uhmaeTa/abgIruQchHUr/NFIZvV4PzZ2qspMn1htJgHdO5lZFKNYKdBvRuI8
 fe1Z6qGnDbmO1Tc69x6g7UatCluWlsC0n8SI9KgN6aSNeyJSYE5ogMEwcwS9I3JAsJxQ
 tY3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730728225; x=1731333025;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dS1gayiJU2kFB+GNxmbWJy3bmw1afim8OPvFaUJ+fX8=;
 b=lNpEkmxydSEoEDSS97koTs8/Dw6uRSHMZc9CTpmVuNzpiU27DLj3gk83saiI9GY9E7
 fzy1HlSe3m8rrEw6+FZcegRY/XfOCFSwAQ/z+bNhNBggivXExd/3mDsZOQwXQYA/+mnD
 YeiHhXtDHN/v0rbCZCJ9ZC1WSiv1aLl4PkQ1zC0VjzsDYDZv1kfKmZ3l3EsbBWZ6W7k0
 w/YDpwiibRY5V2gAQKq+dsys31WbHPk44u8z7naGqy9FfJvrNtKipv9ODYaxnRCMRG6S
 GvmGjY2KwrleQpY6W41QBkXPl7qoHYJW7oRJlnqUXCr6cH/vjYeSg3wunaP82yLcm8zM
 gk4A==
X-Gm-Message-State: AOJu0YyruH2XeFu+YQoNSHPXKh0j8P75YAoivfBrj8d+Xtnmuhr6Ugte
 3oynEctxmO23PNjGNwUZVLaP5aBxy74al5hI6oaauDJ1jftfTwU6s2GuDIZHGv3ayWJ2PrPIWov
 /iHgF/HANFELVAYQTvfzoYqjo4tvdhvSmIPo8gA==
X-Received: by 2002:a05:6402:2695:b0:5c2:6d16:ad5e with SMTP id
 4fb4d7f45d1cf-5ceb92a7bc4mr9226036a12.19.1730728224900; Mon, 04 Nov 2024
 05:50:24 -0800 (PST)
MIME-Version: 1.0
References: <20241103143330.123596-1-shentey@gmail.com>
In-Reply-To: <20241103143330.123596-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Nov 2024 13:50:13 +0000
Message-ID: <CAFEAcA_6TTBzuP=wcweMZLJKSNVz4qxT+yHOVUmPqZU-VmWPQg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Trivial ARM changes
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
 qemu-trivial@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: sVdtRyifosJ9

On Sun, 3 Nov 2024 at 14:34, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series improves the tracing experience in three devices used in ARM
> context. It also removes a duplicate statement in an IMX watchdog.
>
> v2:
> * Fix format strings in trace events for imx_gpt (Phil)
> * Add patch for tmp105 which improves tracing
>
> Bernhard Beschow (4):
>   hw/rtc/ds1338: Trace send and receive operations
>   hw/timer/imx_gpt: Convert DPRINTF to trace events
>   hw/watchdog/wdt_imx2: Remove redundant assignment
>   hw/sensor/tmp105: Convert printf() to trace event, add tracing for
>     read/write access



Applied to target-arm.next, thanks.

-- PMM
