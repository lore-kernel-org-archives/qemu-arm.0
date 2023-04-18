Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2569854ejm;
        Tue, 18 Apr 2023 07:46:59 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y9BojhyazvPxSJ4Kp0hO/AXqsEqRFcynXOiks0qJgBrPaqQzMp7QNJR6/aygyTdyOs/k5K
X-Received: by 2002:a67:f9ce:0:b0:42e:6ad6:cf90 with SMTP id c14-20020a67f9ce000000b0042e6ad6cf90mr3164664vsq.27.1681829219297;
        Tue, 18 Apr 2023 07:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681829219; cv=none;
        d=google.com; s=arc-20160816;
        b=lamS1HpzrDGfIJck3nK7pXPQf7OAEjgdJv3THrrIMnh07zynYi+EePMOjAIM5uLq6R
         f4Pn1wGOPIku6bPE84sUoLAJDVjokah3oemkHr9qT4M1rzyAf33uSA7iFrWHHeXpTkTZ
         2dW0mpEGTAI7qhsumybofRdqy3l9z0IvynPcG9CA/rGHzwHyUMGD5OzYR17yuiyIFWCa
         c0JASnO10RAuSPGZNwZfILiPzqkPnITt5dgN1oxG3rWgCpYi3JnBjONY7/ugL+fcMUhl
         YvnH2p4QLb1LTm6Cmh021/enKsvrcnNZ1JlrAbcr/W8DhA245W11mpNGvCZUHoTKAwR4
         xkBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xGSnephk7yGNx+eOoVYchkNcgUbIw9bj/YqG7sC0utE=;
        b=BTj3fmiJLCQ5jI182GDoh0hzV2ekVCZCBBbBfKr518g9UBBp2j0bLQVccTBm1k/YM5
         1ZnsQF50oOQsylRBiZesBKfCEL+pJR7HlvY1GTeNNaG7PF9vetGTPEPBHpcFXDGcQava
         SeOHB4jkKQnANQ8OfrQbYX77vRtj9oIt2qtVvjO+bJx2U6aZ6sTnkuMu+JXdzq+Y8BcW
         puM7v65F+gF3ITRQImdnvLSaRSEZ+fR1+JyJj+TXNylqbEZuAAA9hSd52ooW/J14IKFn
         tKoT3JI+OqBUlzgbrA2EuHBvWSJgjdqWDWu3MqyLvOwJv4alVvNsq+bEC1gI/yFh9BX+
         yWvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L7WIg9El;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b130-20020ae9eb88000000b0074df6d005c9si2514246qkg.121.2023.04.18.07.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Apr 2023 07:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L7WIg9El;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pombe-0006SA-0Y; Tue, 18 Apr 2023 10:46:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pombc-0006R7-MK
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 10:46:52 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pombZ-0007Xh-S9
 for qemu-arm@nongnu.org; Tue, 18 Apr 2023 10:46:51 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-506b8c6bc07so841237a12.2
 for <qemu-arm@nongnu.org>; Tue, 18 Apr 2023 07:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681829208; x=1684421208;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xGSnephk7yGNx+eOoVYchkNcgUbIw9bj/YqG7sC0utE=;
 b=L7WIg9ElBozqmcZB8JVTzq5cKfIgqQ1MgaxS9Um+nbqyKHSnG6WG64epjxvxbybXvB
 Pb9eaCnAp0w8lCvFJdxC7Gv/4cdzYAACR2D1e/Y+XTEy3SCt947A7N+UN/OqHkm0EdOh
 dd0xeEyrfBOgXjrWjxe7JgJdSdUKHgVe+ziyRg4CIfAYioydKBEBmX9jqMgGvWIr/L/3
 Td7fZK6uU2Gaj/ZHzM3IaitXa+4fOG/OUGbjXxQyqvI2VUphUq3ppieasBZ7kIhTOnn0
 hgWuDINiPlCUOBco9rqEIdw7jt4I6RVxVisDtIqZKd8301ZNwo0fqvztFGFyp4QkpC5L
 JoQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681829208; x=1684421208;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xGSnephk7yGNx+eOoVYchkNcgUbIw9bj/YqG7sC0utE=;
 b=XuHoKUQlP7wHzc+sKnkKZm5k5M7M/91nKSV5I66oNbi0MmTd1T1AVA4CwKDtaMdPDi
 o/swAW7yk0dRzOpOM8PGkw3wC+rF86GvV9hRsNwrzsmW4XeFSjJDjiLLlW8p3JxmrbBa
 R46K6iy03HgYGAj3b/n5vSiJIco2HfeOl+ZWMKNXEyMsJjLlo6Peo+2pJwvnj+Adexnf
 NhGRi/QrPfDArZ86DW6dYAZpoJCAlIYr7cpO99ZU3XoS1eKkOSpWDiO7bK3RLyyaRdm2
 2d+80ElRUDR6JKZ04kHjcUY/Zg5rxit9JQuXmHMGJh0lC7wJ1epPoH6NKI7vcI3+bhvH
 8Y9A==
X-Gm-Message-State: AAQBX9fcz/joLA6YGG48Mk58/GjW7HDzTb9j12//j+oLApMvn23kR872
 YbD+OUnwEHaUv6SE1HHegwfSj+VILWKtSRWS40MFZg==
X-Received: by 2002:a50:9fc7:0:b0:506:8d91:89c4 with SMTP id
 c65-20020a509fc7000000b005068d9189c4mr1277922edf.6.1681829208192; Tue, 18 Apr
 2023 07:46:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230315145248.1639364-1-linux@roeck-us.net>
 <CAFEAcA-ZpQCS33L4MaQaR1S9MN24GgK+cH0vcuiz_7m+6dO4cw@mail.gmail.com>
 <c24f50af-1dbb-6a1b-ca21-414039c10602@roeck-us.net>
In-Reply-To: <c24f50af-1dbb-6a1b-ca21-414039c10602@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Apr 2023 15:46:37 +0100
Message-ID: <CAFEAcA9VQHa=Eenyon-kaiabayM5YY7FHEJsEWOzjzj3rXaSaA@mail.gmail.com>
Subject: Re: [PATCH 0/5] Support both Ethernet interfaces on i.MX6UL and i.MX7
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean-Christophe Dubois <jcd@tribudubois.net>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: +JXf5I0xbmcp

On Tue, 18 Apr 2023 at 15:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 4/18/23 05:10, Peter Maydell wrote:
> > On Wed, 15 Mar 2023 at 14:52, Guenter Roeck <linux@roeck-us.net> wrote:
> > So I was having a look at this to see if it was reasonably easy to
> > split out the PHY into its own device object, and I'm a bit confused.
> > I know basically 0 about MDIO, but wikipedia says that MDIO buses
> > have one master (the ethernet MAC) and potentially multiple PHYs.
> > However it looks like this patchset has configurations where
> > multiple MACs talk to the same MDIO bus. Am I confused about the
> > patchset, about the hardware, or about what MDIO supports?
> >
>
> It is quite similar to I2C, a serial interface with one master/controller
> and a number of devices (PHYs) connected to it. There is a nice graphic
> example at https://prodigytechno.com/mdio-management-data-input-output/.
> Not sure I understand what is confusing about it. Can you explain ?

I guess I don't understand what the topology is for these specific
SoCs, then. If there's only one master that might be connected
to multiple PHYs, why does one ethernet device in QEMU need to
know about the other one? Are the PHYs connected to just that
first ethernet device, or to both? This bit in your cover letter
makes it sound like "both ethernet interfaces connect to the same
MDIO bus which has both PHYs on it":

>> The SOC on i.MX6UL and i.MX7 has 2 Ethernet interfaces. The PHY on each may
>> be connected to separate MDIO busses, or both may be connected on the same
>> MDIO bus using different PHY addresses.

but maybe I'm misreading it.

thanks
-- PMM
