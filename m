Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp662625lfp;
        Thu, 14 Jul 2022 06:12:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u8jED7ZgHMf4nIuSwoKFW3r11T/Ugd1iJMa2dg1ZRfxT1RIb1BRfBTYkgo/8hEytFVTrvm
X-Received: by 2002:a05:6214:19cd:b0:472:fdc3:9226 with SMTP id j13-20020a05621419cd00b00472fdc39226mr7752443qvc.81.1657804374861;
        Thu, 14 Jul 2022 06:12:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657804374; cv=none;
        d=google.com; s=arc-20160816;
        b=DBLpWGYjzTuViz7jborAE9iBcOfIxSFupKYCR2zrbvrrCsBpu9ljoxI/wU2aDB8uJS
         tbxEQJCRdfqa5u+K5138CHjB7v0sgYScQ8T1MyRnR26ruvpefTpdmsiJiAmItUZKERkm
         9dI+NB0spNAC+dE88AMS9UTL+Bud3iOFYXpBwi89zMTUfUT9C5V4xwKdc4O8hmH11ygS
         HMJo4Yig7SVpbiq9fAhQeGayK5Dt1hfKi+WPpHEtFl02ebsxz4ej8cvchJSL2QST1NW3
         s+oI/MS6r9PxT4If7EXcCJiHuVzoYOGBeq31/3kGKRJAttOJLG00IPZFyjwH/6/k5ZyX
         Qovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=QD27bBhlVdE43TqgGMIodY/Vyoldr8oJUxuP7kDOwK0=;
        b=tV2dMqmjwjVcjMQsWYvCZcD0nViMqvGry4gGxSIKiREkZg9PMyYVmRia62yeLJTTCh
         gV1/n4sYxqMnt296JW5eg3VHsJv1raS0P4uFbz7FG4FTLXe/aIuoBUsrOPr8kR3CjBXw
         aS/E81vqiYYs8iJT/6FIYC2ipwR2c/Ey0LCZyscpdRrGoAPGnjr2qGk6Tcl8MyLoQnh8
         +vRKeEEQo1+3daIg2ukgyxXfmzERQNQnXzAqQEyo2l3U+P0/ni9OQPYjkwxLXzoRUZJd
         syvliWZToMprart/tO69Q+VdArIVxFLHLEwFG+dnwxbtZTqcasR+xt31A4jkRL15EoL5
         +VRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFjn7Icr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9-20020ad45c89000000b0047059799e9bsi911310qvh.70.2022.07.14.06.12.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jul 2022 06:12:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YFjn7Icr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oByeE-0005up-Br
	for alex.bennee@linaro.org; Thu, 14 Jul 2022 09:12:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oBycg-0004Yb-Qq
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:11:20 -0400
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:35820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oByce-0005CV-KQ
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:11:17 -0400
Received: by mail-yb1-xb36.google.com with SMTP id e69so3132202ybh.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 06:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QD27bBhlVdE43TqgGMIodY/Vyoldr8oJUxuP7kDOwK0=;
 b=YFjn7IcrGhGB9m8tzO5pr+RDoH0aYApgzsYuffUtiplp+o/Yj80NawojA3iQ5LZz8n
 yDMUr2fPreXUqW8T+2TYimEtsko5rlzaolYqOke4rQ61KgDQxuryFnFhJpMMTsflWMgY
 OPAymon6CKC3MvtlrPSuQlyplGwI/KeO254gQAwLr3eFL4GIU0xR73j7yPkWLxadIOU3
 4hZBNNUHY7EZNQsngWIUvasI6igtJy/ltSfkBvx6a/9ma0vPa6/ULpm/RG9fuooVcm1k
 j4k08RyDnCIAkqPhg4an9mcvezp1ixFu+UCSp8Y25i5PXT7uHDanXpiWoRUOXaJrKRsK
 1caw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QD27bBhlVdE43TqgGMIodY/Vyoldr8oJUxuP7kDOwK0=;
 b=ccEo9nRsU3I8uLWhUNde1WCsjHhslJnbfV7zhOb+oMK5ByiOFE9BMtHW4589/S6N39
 3U1VzIpQ/D7ojkyeh/JVRB/j/QIM1frevKXdTqgnjN6rd9tqLYXiEIW/22GM3zd+llcj
 A4DZFnvADz/KYg60DVIyS2F6Tq4VDLb4+JSpjzEJztenZMj51q+PpTK+fBcbikdFiN/F
 s96+RnblrtkT3Bi+JX0RulkwfqGWy1V+8um5Uoq/wXwXMVA2DGKz9QKLamiGf0VXBwEZ
 tZgHrT5iOSD97WTZeRimv6AuZlguZY0006fNXAhgozWu907rLeuvW9ESCNYJMrt3dh68
 R10A==
X-Gm-Message-State: AJIora+elDfY1la0XqRmaRFObXvETNboYp7NGoZs7tJxrtsgYxIOZrpO
 DAJo1ggU4eb+8QrzQDfFREeQHVqUtlU45DpJjWU6TA==
X-Received: by 2002:a25:2f58:0:b0:66e:cf9a:6a2 with SMTP id
 v85-20020a252f58000000b0066ecf9a06a2mr9364834ybv.193.1657804274749; Thu, 14
 Jul 2022 06:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220714015637.817066-1-quic_mkurapat@quicinc.com>
 <20220714015637.817066-3-quic_mkurapat@quicinc.com>
In-Reply-To: <20220714015637.817066-3-quic_mkurapat@quicinc.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Jul 2022 14:10:35 +0100
Message-ID: <CAFEAcA9MZ-yNSY0c7MiXex1U-t3XNzQRUwXiMhJg84tYVMeyiA@mail.gmail.com>
Subject: Re: [PATCH 2/3] hw/sensor: max31785 : add fan status, tach target,
 and tach input object properties
To: Maheswara Kurapati <quic_mkurapat@quicinc.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Graeme Gregory <quic_ggregory@quicinc.com>, 
 Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb36.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nBqmU8Ext75L

On Thu, 14 Jul 2022 at 14:04, Maheswara Kurapati
<quic_mkurapat@quicinc.com> wrote:
>
> This fix adds object properties for the FAN_COMMAND_1 (3Bh), STATUS_FANS_1_2 (81h),
> READ_FAN_SPEED_1 (90h) registers for the MAX31785 instrumentation. An additional
> property tach_margin_percent updates the tachs for a configured percent of
> FAN_COMMAND_1 value.
>
> Register                property
> --------------------------------------
> FAN_COMMAND_1 (3Bh)     fan_target
> STATUS_FANS_1_2 (81h)   status_fans_1_2
> READ_FAN_SPEED_1 (90h)  fan_input

This commit message is missing the rationale -- why do we need this?

I am also not sure that we should be defining properties that are
just straight 1:1 with the device registers. Compare the way we
handle temperature-sensor values, where the property values are
defined in a generic manner (same units representation) regardless
of the underlying device and the device's property-set-get implementation
then handles converting that to and from whatever internal implementation
representation the device happens to use.

thanks
-- PMM
