Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp1694212njb;
        Thu, 6 Feb 2025 09:29:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWB9bmy3WiWEzjCYcJ49rkPc+cEHHU8Q6yZVp40Csd1CURs+SwSoW64oB2jBtjnn6SFAlY4xR8hl6Gd7g==@linaro.org
X-Google-Smtp-Source: AGHT+IE0t8xftfvdSo9Iib5lM11gvcA5fOffA3da26PgFMnh+2X+pBjB2tiUwWVlIN+I6F5NQBtr
X-Received: by 2002:a05:6214:21aa:b0:6e4:4274:aaf8 with SMTP id 6a1803df08f44-6e44274ac4bmr16039446d6.17.1738862982829;
        Thu, 06 Feb 2025 09:29:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738862982; cv=none;
        d=google.com; s=arc-20240605;
        b=IGLBjmZxsyCZzVUsH8+QJOi4gh69txc8An2A0QOqbAcyOzGkMEQB6fDdycBSVMO7fL
         2moLtjnR5XmbDjcpCmpdnoNdIpjteogKr9lhHaJJu7asapFFG3frKWqV2ibUdlWMLWun
         TJRLIuJYPr7iAfYdldGjUNO73yv+z2UJ9FSD9NhVVWehJmY2vnR2JG7bs9RX6HL2YulY
         LpkcUmb/1wrV5rCrGGOVmwtjbU/1ApcjnZXVYAh7DukS1sAjUpyQzOWliFlUCJa+2zX8
         SK762uUK1+FKE+OtnOIU9aKF8Dx1U/hmVucuKnTLOsdscPE/bThA+YlPRL9LwS3vxUcL
         3tDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=LtBFBQ34iQ5GlvLvrgRafbPTcpDdZxt65lIrC0bLP4g=;
        fh=9R228b9//eerPboaB1557lUXl9KHnsqJO5vyQVpJ3HI=;
        b=Afs8froQlXGuNQYk9EhIln+NtEYTFO36Wtf2QjCbg9xoDqfbdqD88bPDXEuCW/Qrgp
         JJ026dp11262q+BsAlpLzy+GyqFKqeSgk8yjdNajjztpDKwW48w6wl2eJj6b9B7cC717
         GeLUNJor/7unlKSYZDQxtCuOhlztbJhab6wblZFG4ff4LgVFz1RXBjIkScB9ddpsd6WV
         35ASxmONHcssoRYbuSoaNH8qbmJ4vwgPCLfDFIC0Roj++cFmrHxyVhL1B8MJCTI9F8pf
         lQNDcgD9xPOp63AimxhaqR6cQNOp31v1l/W+vTBXO/YHuEuH9KZP7URF7b9ueM0uDQBE
         y2sA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OqK/pO9z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e43bafbe27si14635736d6.413.2025.02.06.09.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Feb 2025 09:29:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="OqK/pO9z";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tg5h0-0007Yj-TN; Thu, 06 Feb 2025 12:29:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5gy-0007Xp-EJ
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 12:29:32 -0500
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tg5gv-0001kL-VM
 for qemu-devel@nongnu.org; Thu, 06 Feb 2025 12:29:32 -0500
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e5b22d35268so1104809276.3
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2025 09:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738862967; x=1739467767; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LtBFBQ34iQ5GlvLvrgRafbPTcpDdZxt65lIrC0bLP4g=;
 b=OqK/pO9zMmolCvU4jvyb0Vaco+TMDDaYnuFW1WiHh5oU9jujFf8HScUlgWtSVrcZbv
 P4IfWBwWBjAbXRreTjpcOPW+7JNifazgMQXDhJO9xv1uMfWnoYM4ZOBCBsWVEKUs+rgr
 APs234BnSvyEJ0Ou0oZqBnRF3oILSyKR0YkRFDKvJV9uWpZTmdJFWwsxIvAsmq7USem8
 HbUSuPXFSJs3rZgGoxRM7uReS+rN+r4mlhzOS6vZwh/RQMBa5KQilROXEH0F18bkAYzB
 /uF1iSjdqGrShePbQ9LkNo/h2lFPEdHfCqamMuNzTa49Oacy/9aip/NvrNAtFDIelweF
 iYsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738862967; x=1739467767;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LtBFBQ34iQ5GlvLvrgRafbPTcpDdZxt65lIrC0bLP4g=;
 b=TdPJL2NjIEN35RC3qQmgLhp/c+mOTTPErlmeik+vI+IPCABe6bvQMJHIy+H7l85xX+
 xNMQko5ZLTc2aYDXCMcg9J7ngyKxdP3oZSck9ivia5GVQVML+g/fSc26lAKA5ltwxc/U
 UmIsg9Xe7eS1HFSmp7vbrw01s9dlvf+qfgn+IZbhnmTL1/5uxCEMlqsWIXu2ZrRc/No1
 mv6HyYmL3FxO6WxsHrbMVisYynmy7hoScjFF03TvlJXq43g7FmiWf8AY0WLRNHQQfY/u
 B3TCtQ3ywUBy6CbIVWtvCzU90rHVHNOOw6he5iL0PikmaICClggb4not43fT5gqZLibW
 eNTg==
X-Gm-Message-State: AOJu0YwCDPLtHkJkrnhYT26hC4Esd+NTBlfzo/wJj+xHuB2bwC5PEHSO
 7JxF9ll0RVbev8XaiCU+zXhG/zStbB6SjzNdsvQfNQ+wfUx3n+x2er5a6lGbYIzpNAiZ8jnmKwS
 2Y6pX/wbUUS9f3z27/Ev9UlAAza1t5GgoMp4Ilw==
X-Gm-Gg: ASbGncvnwYIqaB7YYrg5VeDt1wgdja8R02N8yQXPOjHVTh80DLjh63oUZ8iT+NDW6NB
 J6wzq4EOOrwPTFWV0rZLtAZyWuj+QlZi+yDQh71LzA+kx22H5irmBPVhU9IzMgtnknfjnMGKDpQ
 ==
X-Received: by 2002:a05:6902:2505:b0:e58:3741:2748 with SMTP id
 3f1490d57ef6-e5b259cf95amr6764564276.7.1738862967626; Thu, 06 Feb 2025
 09:29:27 -0800 (PST)
MIME-Version: 1.0
References: <20250204092112.26957-1-shentey@gmail.com>
 <20250204092112.26957-14-shentey@gmail.com>
In-Reply-To: <20250204092112.26957-14-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2025 17:29:16 +0000
X-Gm-Features: AWEUYZldbr2gTqQzb2phM5bIu8583UkV2mcRBeWC2rXbGqIIXY9m9HQvLcImmbA
Message-ID: <CAFEAcA93kevhjQHWjbZFMRaka2LSTr+jYcT7aA_AyrTDsKcubw@mail.gmail.com>
Subject: Re: [PATCH v2 13/18] hw/arm/fsl-imx8mp: Implement gneral purpose
 timers
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: YOFChwVWb8je

On Tue, 4 Feb 2025 at 09:21, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  docs/system/arm/imx8mp-evk.rst |  1 +
>  include/hw/arm/fsl-imx8mp.h    | 11 +++++++
>  include/hw/timer/imx_gpt.h     |  1 +
>  hw/arm/fsl-imx8mp.c            | 53 ++++++++++++++++++++++++++++++++++
>  hw/timer/imx_gpt.c             | 25 ++++++++++++++++
>  hw/arm/Kconfig                 |  1 +
>  6 files changed, 92 insertions(+)

Typo in the subject: "general". Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
