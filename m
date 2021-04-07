Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp710317lfr;
        Wed, 7 Apr 2021 11:31:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyL5BimkUGaCiSbJ2zZLWmWfylLDTzyWYGP/RQM7O03AVCCR4AcV39DMwOrWj/nSqEemxy8
X-Received: by 2002:a05:6638:1a6:: with SMTP id b6mr4910869jaq.116.1617820297582;
        Wed, 07 Apr 2021 11:31:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617820297; cv=none;
        d=google.com; s=arc-20160816;
        b=qtCsJvO/2j2c45KwRtIFK2SZSFVxTKHA+DutoL6sSHkb+gYxPmGsBjG2S0h3ElmQrh
         53oflcC3vK2k+ltJsloyCzHVBMEfI0+vjyJIYVoGF3FtHJ8zWElZJK7YIIHY3685YCSI
         gHoho6kTZ3qvI/as5I3w16pScME4LM1BB22f4aWaS3xhYkmiC87qWGKKWeL4FR/TDwuH
         XwMld3EeeCXFNLF7zKCjtfbLYIslxZgrjNvOdbFMAoF+t73srnlPskZgPB3sv4IKhnpd
         OKMs9yVghiWSqMVJ/tZHr7exucJ8U0X1F30ZAep5I48CfM05tQdbV68FZCJJhHn2AjQL
         rnYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=leELXv5FVxkDo1qW5sohXz8hGCf4cAci2lhWN9QRgDE=;
        b=HFmkifalLpRSN/XidTRbFlifmL7xk24/E997HFpVcDHoG3WmqY7K+hCPS/Cn8VMVVo
         UamNW0cwAbEROs7OT42FUCGOziGsJmNSF5eLfXJ1Ri8aOg1C8px070F41DCfawsDWJVv
         8neCeRxblEWyC2c12rnDXLhfCw9k54Pjc7AZsObEdVm93svezC4TDJdAqTOKj9QABbu1
         gSwc44PbPFjVbyfkj875QLIhDzkjyDXCGWi1bWohZjZIWMECRPT+iqQRSyX7gZGXkJ62
         5g385UNd5vpKGJ6ZWzDwDCexAuBntlAvZt26oErSRvfiJaa65sLf5Q3mn9wwlajuKC0Q
         2Lrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yjARTOad;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z18si1798743jan.106.2021.04.07.11.31.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 11:31:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=yjARTOad;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lUCxk-0004Ra-Tp
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 14:31:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUCwA-0003u4-B5
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:29:58 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:40793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lUCw7-0002ew-7l
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 14:29:58 -0400
Received: by mail-ej1-x62c.google.com with SMTP id n2so23035531ejy.7
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 11:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=leELXv5FVxkDo1qW5sohXz8hGCf4cAci2lhWN9QRgDE=;
 b=yjARTOadfsxoIMq6qdvfqmONogSDMxqJgKoSHOhNoSJtSpJwSeD+HLo6BYVJKnnPLB
 lKHKmgEqsTOxh4E1NH3CrCEkX/6gZllvzhF91mkJW3FmeJT+IneIxmF92yo032r6SkCp
 vSNLt3lVjSZhg9hp7yGynUF0Cp47/yfJHnT5QjFtsM6ljMe9iP7Nsdf/zEOR1dg00CGS
 WX0qZ8ho0kHKX3ByBkGjbWG6XbKEKY6yl84N7+JPQk4Za+jqbIAkVF+5by7sdDl3OYev
 g+DPrHMYEG18OtaAgIkFicAyaBwfXvwChx2dPbApmXVsU2jUhZJjM5LRMwYbfFvDI45U
 cSsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=leELXv5FVxkDo1qW5sohXz8hGCf4cAci2lhWN9QRgDE=;
 b=r5z8kwrCp47fD45uBHjQ39/1OVHzgVyNK8tqPQc+7SngHi/kw9ADyr/x8an61FlVZn
 PTQyVdfB9jwfOq7BuTwhIOaxm3nd1QbmEUXZyZZH5/xGOw04vBedVV9YWL3/Or5YufyJ
 7PdKj0VF5jyayeoBwrF19YBTq3fUyUP/FSS06WSFuzn/6wXIa9kOEYZQO9hMaG2bKGaX
 pqWy/wvjlaAetHh/h9KiD7JDRVY9VOKvu9ay3m9+hnUhvSlBWF/BR1iOTLiAVxLOxkji
 3F64V4oWZdCf/thch0dU9u4TJrn3W+J7HZntJ/OsfGNRnEQvEU4hZJURyrE1ECNUMVKF
 riJA==
X-Gm-Message-State: AOAM530iHakAERQSf8oJVtOlhMg+YM/lFhV0N+xpvz8K0FM/UszUZInV
 b4MKY+TPFzG1ic9WEGD6mQnFTZFf9qNsTIhy2J6gYw==
X-Received: by 2002:a17:906:ce32:: with SMTP id
 sd18mr5348406ejb.85.1617820193955; 
 Wed, 07 Apr 2021 11:29:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210407171637.777743-1-clg@kaod.org>
 <20210407171637.777743-18-clg@kaod.org>
In-Reply-To: <20210407171637.777743-18-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Apr 2021 18:29:14 +0000
Message-ID: <CAFEAcA9LEO2BzghgCvp5hfFvRx1YyL5XZxY70FHPGwHeHxZZhA@mail.gmail.com>
Subject: Re: [PATCH 17/24] aspeed: Remove swift-bmc machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Adriana Kobylak <anoo@us.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lfy2WNVxYco6

On Wed, 7 Apr 2021 at 18:17, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The SWIFT machine never came out of the lab and we already have enough
> AST2500 based OpenPower machines. Remove it.
>
> Cc: Adriana Kobylak <anoo@us.ibm.com>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

We've had QEMU releases with this machine in them, right?
If so, then we need to go through the usual deprecate-and-delete
cycle, we can't just drop it immediately.

thanks
-- PMM
