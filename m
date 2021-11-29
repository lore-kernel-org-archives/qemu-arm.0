Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp4119508lfk;
        Mon, 29 Nov 2021 12:59:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRfLrIaN3ZdXTbCFvGoQUEjAkhaXie885UIeFi5eFEYkUEzO/7fAac8MqeMqXQQeDvg3/n
X-Received: by 2002:ac8:5712:: with SMTP id 18mr37731753qtw.584.1638219567930;
        Mon, 29 Nov 2021 12:59:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1638219567; cv=none;
        d=google.com; s=arc-20160816;
        b=Na5rWANLoVRVfor3uYB6DzBk1gLFTSC/E3mDUOkdKXxaEOswDatFs4RURgpdasxYEA
         VLdX4Lb0gQsGM4QQdXih7Ts6J7Gb0xVyXCPTKnGXbAHSbwfrvAAqMIX61j5oQm0B3OWa
         apdKlwYzCbNPkw1fMXtp4IY1ZeqDdJFsucqorjXtjamGInNhQjCOD6vRq2H+/HxBOtEn
         R75YAwQt+8IDHcUKZnchqm/M8lh1VKNlJXijDV7xGi2rpPeILvOmIBxlZTW35Oi6AFJb
         Z/7tbKqn75bvBce7WNgwvhllFNreUefE8ggvxa+aM2HnFaDIt479/gpMHtWqLYD27s2W
         gyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nOMHFaD9kmkt+xIs4AZJH2PN3VPbDuw5b9wWDjTOyPY=;
        b=R3VfDSnAitKIUMlu+G6wWRc7cWCH3E1caOyPUbJfrD62T/hQ+tbrjcgfpgNbaYfjfq
         0JnfoQMV4aa5PsRZDaNboeC/tBi+K/NMPi0SMwbRx+T5nLBB0DOH0HFGpIQo1IlGTVvU
         Wm6rHTgSRCYaeCqDBBMZKDrZI1cNYFkFrwsra6ZdSkoP1D+H3dCjkTTgPZtDAbJkUUJG
         8Myx053aCLdtFtWKokCjF/y+kGcIb+pw0D7/uyf2OvL3vrmPM1xZvimOwG+h8qLmwH2l
         jyjQpAnihZ5U1qw5128CLXsvhLMi6Ow+oAqWf1jBsm+jDwwE0IQOBkXgZCTTaPPJoruD
         LGzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hr4eoPPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11si15035319qtb.670.2021.11.29.12.59.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Nov 2021 12:59:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hr4eoPPC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mrnkF-0008At-7Z
	for alex.bennee@linaro.org; Mon, 29 Nov 2021 15:59:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrnZa-0007se-L8
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 15:48:26 -0500
Received: from [2a00:1450:4864:20::42b] (port=45865
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mrnZV-0005vX-O9
 for qemu-arm@nongnu.org; Mon, 29 Nov 2021 15:48:26 -0500
Received: by mail-wr1-x42b.google.com with SMTP id o13so39460987wrs.12
 for <qemu-arm@nongnu.org>; Mon, 29 Nov 2021 12:48:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nOMHFaD9kmkt+xIs4AZJH2PN3VPbDuw5b9wWDjTOyPY=;
 b=hr4eoPPC69qUVOrkOI7xlZG66LBIsnuqAEmIFmRI51QxGIO4ApkGHGm+WeFhM+04vR
 TtYtxb/0Wz1aMMA5MWByR1DIiKNR1dax2wdNL06QTDQvBc1wtgkVpgH6C6GIR1NMPu2m
 EercVq54A8bbWZnZDv85gOn6aaff1lRmYWq0lNQKo8u2GNH0YtclXgmrh7SyWNq4qfay
 I41EPBFO6JELpqjqpSpVwEM+Ta6zmOo5AdGSnLRyGEG2csDFLrKHW/jwinLtwA0N4WxG
 N3Vo78BU6oX5+J8otKveq7t1pncgHWIw5jBh3vDCIguHWmvhq75ZFxsqJTaHB70GJSr+
 ZZDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nOMHFaD9kmkt+xIs4AZJH2PN3VPbDuw5b9wWDjTOyPY=;
 b=OBdIehzJy7G9eqENSLlTT/Kr8h6fhXUHDMO2y4g3ehjsAafH015BBrIYY1sRZvaa8I
 NHuSQoRzcRZvTL7WWfr/IN4AqqAa3JaaT89MwZs9DWLBbAT4ggpHRRe92dH08l+NnxqY
 wQULhUyZg3Dy66PWv+6K6ei3yGJ5WAzb0hFasMA+/snurgagME8AXKm67RwpVKFEXsQ9
 d6WlVMIdFARAa1e5ZNMW0ZltUPvZhVIrVAbBDbnMVh1fpQRF5iqyDGTS9mJiV4HYfGGl
 lohaH2gdsCr/JjLNFaJ72nDUcRnBAAgy8MoawO9Q1+767cgxetBVeXK9lsFMoUek5BzE
 r+Cg==
X-Gm-Message-State: AOAM531vBPvABZrPjeBtVqpleYKVgfkzkHPs/fVLWYVzh6s1DKMQ+H27
 JETGtHaUKE/SNcUMBLyhJrKfEaM4NkbbRMOna52dlRtrS2A=
X-Received: by 2002:adf:ef42:: with SMTP id c2mr35378849wrp.528.1638218899836; 
 Mon, 29 Nov 2021 12:48:19 -0800 (PST)
MIME-Version: 1.0
References: <20211129200510.1233037-1-peter.maydell@linaro.org>
In-Reply-To: <20211129200510.1233037-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Nov 2021 20:48:08 +0000
Message-ID: <CAFEAcA_ognVQ=7-pE+MDwkJCtcD0FfzPL0Vnb7vTgzbVSpnrLA@mail.gmail.com>
Subject: Re: [PATCH for-7.0 0/4] qemu-common.h include cleanup
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Sergio Lopez <slp@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NffkZOcJVULt

On Mon, 29 Nov 2021 at 20:05, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> qemu-common.h has a comment at the top:
>
>  * This file is supposed to be included only by .c files. No header file should
>  * depend on qemu-common.h, as this would easily lead to circular header
>  * dependencies.

As a side note, that comment was added back in 2012 when qemu-common.h
was bigger, included other headers, and did some of the work we currently
use osdep.h for. As it stands today qemu-common.h includes no other
files so it isn't a source of possible circular dependencies -- it's
just a grab-bag of miscellaneous prototypes that in an ideal world
would be in more focused individual headers[*]. So there's an argument
for deleting this comment...

[*] A cleanup that would be nice, and I'm about to send out a patchset
that splits out the rtc related functions; but the grab-bag at the
bottom of osdep.h is probably higher priority because that header
gets pulled in by an order of magnitude more C files.

-- PMM
