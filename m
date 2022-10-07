Received: by 2002:ac9:4144:0:0:0:0:0 with SMTP id u4csp318048ocg;
        Fri, 7 Oct 2022 02:23:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4Nesfsar5zAus9mWeqY4DOUrnv/+o5oz5AjeP4seKIo+FhueAqgTDw9hkLu6hEo5X+3ixU
X-Received: by 2002:a0c:8107:0:b0:496:a715:dc8c with SMTP id 7-20020a0c8107000000b00496a715dc8cmr3110462qvc.96.1665134637927;
        Fri, 07 Oct 2022 02:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665134637; cv=none;
        d=google.com; s=arc-20160816;
        b=PyKRe5dbk3De1WXeFVr62OzX4kBhLGZ4DnWCjym2U0+VZyRwEhoBPj2h/B+K7DYcvk
         a9QIzGDMvJp2gypV+l9Z8od93bm4JxKxI+hVZD7xQWaqKEd9woT3wnByTdfQx5tasqMo
         GTb+E71cfWJlPpH+e5+BkgX2wfAquR1jui2TAbyosro/DIVQXYkIvw7YN0mZ1ptFaGXv
         k4GoATsqbn3aRHGfH9td4yc/qjNr4DVLoeYJ32TH5K1q8drgSJVlkjctUe/JpQHVel04
         hJ0RlgtaPjEF0uXRQUzPaT8MjZCOp3HU5pvCsNF40hOUPoxSHFPeY7gAXPyNnHTDCAlN
         LK9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zjTiAxnroHllDuDUYv0y2RcsUtSKHQC++2RgiWaaxJU=;
        b=F1t5OMyb6o0AI+BbG9xnMFSW+7CchMZVmFj5YUMHNnT+Z8KqN0JueJCWTQYV/dr5B4
         YrhHib4+CkAm0mJi+M/R9L2Vbs85Ytt4mh2/IlrEPR8JgUo/sl7D4Z11kSHAsRHyyb8u
         /34WNh2pyhXGBFH02pntq3qXEsBfV4yP7tZrlHr7Mwy8/ZUR0nfwXWCw0Y9OtOzmJzrM
         9fS72XWEQr3Ktt8CSAgKq5ay2uksms5SlhY4CD/QfmTSyJ/KgUTxWT3fBfnBqK/XkrSt
         NoKKokfhEo9HBJXvMv8rM1f1GDFU9CbRqVeneWJQxFTKAzo0xPUwdJfr88H3LX92lA3E
         9ZoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eK/QYA4c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b22-20020a05620a271600b006cbc44e8a14si613435qkp.723.2022.10.07.02.23.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Oct 2022 02:23:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="eK/QYA4c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogjaH-0005u8-GU
	for alex.bennee@linaro.org; Fri, 07 Oct 2022 05:23:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjY6-0005gj-IO
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 05:21:44 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogjY4-0007YV-VT
 for qemu-arm@nongnu.org; Fri, 07 Oct 2022 05:21:42 -0400
Received: by mail-pg1-x534.google.com with SMTP id c7so4116625pgt.11
 for <qemu-arm@nongnu.org>; Fri, 07 Oct 2022 02:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zjTiAxnroHllDuDUYv0y2RcsUtSKHQC++2RgiWaaxJU=;
 b=eK/QYA4c86BJA2WYs3k8QtX4HZ09c1uIB5SQmlgxMZyJVudB1ContygosRiFqOMIun
 JfmQNgREPz7QCxLDgGKbsgCJRwEbAuEhKNGgN4bwMEFocVg4h5xAvEeanrOzrvAYqt3k
 ONjarn4gkGaerQzLPx9tCr+xasNK3/WDoSeo6S2fwkmiIkp98Nl9JC5updhlLWRgGjRc
 XKODuV3yG+CeKNkG3mhTn6YZYiZm8zv0XudkunH+i+EMlIcYjUd7UXneS1pY77SLay/d
 uCiR1x9P9kAje8zjEaFwanYphoAMM30pbJJP8xNXyxQblZ1yfzcYH79q+cj+skeEwYDZ
 85cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zjTiAxnroHllDuDUYv0y2RcsUtSKHQC++2RgiWaaxJU=;
 b=RdjaS5fl5fplv4/g1ErSzpBFqGO2szNpJ+WcNXIMju1P+TIymJKiE+4o21u/ivOv7E
 DdaZEEuKdUm72QJ6zHD2I/3xYp5zBIZacMTbjAlehaWaF2VojMRHegrKLvyUO0pLxqb8
 tuWwO1ALDcTBXUxwLBpoiH+0sgj1j0GH5rKe0+M5lvjJcsvIdFG7uB4+Lgb7XmueKaHH
 CgX+CBs6X+XMwlcJb+a6gYZqkuwiuJhB3SmP4ZyC20s0L2F/9oUKx2zkDAPvm5bwfh7h
 GUrwcWtfIYt9f9J3qbpu9gEahU7d3qS6umraYGkCGTINV6YJ1DNrevhouXoxMZM/Fzjx
 Eibg==
X-Gm-Message-State: ACrzQf2HJXqVw2FhVxm6RSvbjZLlm7aYZHyNCU9Lzo7krAWiVkB93+PT
 59R2yY7XcGxVNvJBOkR1lzhzRtuK49oH4gkEVDCUwA==
X-Received: by 2002:a05:6a00:1584:b0:561:e48f:9faa with SMTP id
 u4-20020a056a00158400b00561e48f9faamr4281261pfk.51.1665134498061; Fri, 07 Oct
 2022 02:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-32-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Oct 2022 10:21:26 +0100
Message-ID: <CAFEAcA9JZwfFW6b8cTtB0rJW2AmkA3LdL1obrdkwC6TRcF9rqg@mail.gmail.com>
Subject: Re: [PATCH v3 31/42] target/arm: Add isar predicates for FEAT_HAFDBS
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0BdqLjVNNjfv

On Sat, 1 Oct 2022 at 17:55, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The MMFR1 field may indicate support for hardware update of
> access flag alone, or access flag and dirty bit.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
