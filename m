Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp2518152ejb;
        Tue, 28 Mar 2023 02:54:33 -0700 (PDT)
X-Google-Smtp-Source: AK7set8ZRKqQk+udugp7vyqpitLTg8xFhTCa5HNUPRJMlQC2uJrVAUE//sAzjoHUa7cuTP4w7bui
X-Received: by 2002:ac8:5802:0:b0:3db:fba6:53f8 with SMTP id g2-20020ac85802000000b003dbfba653f8mr24981692qtg.25.1679997273262;
        Tue, 28 Mar 2023 02:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679997273; cv=none;
        d=google.com; s=arc-20160816;
        b=sYYz5yKcWa/sJA5OM22ZyMGbD8J4SlACaqVx7t8dY4eJF+spd8V7fZIOFcM65CDq9r
         AiYf/siFN8utg718eDbDLOuP8IWRgS07XPfCTfm4HFnMwZ/7DStx5ZOIVjnTt2Hko8XP
         /Ly+jYHoszRAA3brbMxI4yjj7Nf17RGhwZTogAI9Yh0pEr273A5q3tJFRzg0kr6lNvr/
         a8XtAnw8bQlA/LbOT3QaL9OAMIPBXTCUJDuBgDaDiu041uZdqdtCvGvsaYa61EfynTwV
         HpbRydmQhv2DBcFZ1WYC/ceSoAO24oBFywvSsnnhh/CzxS0t0U9fQvfdIoHlldDwK6Nb
         KoOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=5W6XbogdsrnH50TgZwRnKlQeZUo5dHnNr3koSPp9Phg=;
        b=KoIOJknTeFi/kX1ki4EpN1iDvz97rgbghEnkCFiGQiWEUVAy9DV8itHrZ4nwLjwbYn
         brWKO6KKFykmE6RzcVKBhuZswrjUDX+scT7w52MhDGQTqPhbksN0++JT4QkmKPxKHSI9
         SlXYXpdfK1qq9I/T06Slp4T/qXTRn4Xaj4Axn61soK805S+zsWWib1+EONtDzP7vlLWJ
         lU3F68a7YSPwMZB8rM7Zcpr2hiPw1fsfv5iqGpyig8ahgyWzdgMCjkxGRzDG69QgafJj
         QTGCgUqM0GGea5p+4pEX466klfdowbnV2Z94mESQmyIO/OUkucckAX/CaRHE8ie2a2fa
         PKVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NxE4WE7o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bm26-20020a05620a199a00b007468e733c05si16278488qkb.635.2023.03.28.02.54.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Mar 2023 02:54:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NxE4WE7o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ph621-0006AQ-FE; Tue, 28 Mar 2023 05:54:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph61z-00065V-CG
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 05:54:19 -0400
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ph61x-0003q7-U8
 for qemu-arm@nongnu.org; Tue, 28 Mar 2023 05:54:19 -0400
Received: by mail-ed1-x536.google.com with SMTP id cn12so47170284edb.4
 for <qemu-arm@nongnu.org>; Tue, 28 Mar 2023 02:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679997256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5W6XbogdsrnH50TgZwRnKlQeZUo5dHnNr3koSPp9Phg=;
 b=NxE4WE7ogBHSd30j5G6G4w44rA/V8xOl+XqjkRxqQbsmaDThF02jAT2/OwNl0zqUl7
 03DEMVGgBzitGnEk+bztLAP2J/jCnuZ+wAOL5Ikd1AGccn0tSajFXlOxwtBVdrwgmrsC
 1B7mrJrD5R7aA8vEewEBk45NS6Kd2qsEJ0+RYzy+/ACm/KjNshMgI4Yyu7p0f6Y8tKS6
 utjpVUIiqW16vRQQsaYaHrRNy1Brs4pO6CCCQBziDA7gTQsETVZbBT+7r5UC4PRYecKN
 Os3HsMKJ4rj7D1EMoK/EM/upBrSkg7EJWizeKMryk4yA9JmW7GslwgZNsvrH4IYuuHAZ
 MNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679997256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5W6XbogdsrnH50TgZwRnKlQeZUo5dHnNr3koSPp9Phg=;
 b=Or31yT249G17JevEOrCrx/yiPSoTmSa8lnm3HN8uaXAvmFalKrOfZkhGRaEfGljXuY
 h6saHGMLRPcyqeNxH1bE872YDaPYHU/6JnEDwMuQilIxSio+BIL0PSTw/6RZySOLCk41
 8UySFy9bx1tIoerrS8b2ALTO915GcNARFT6j40DvAGmrvk8Db3h3IQv0Up53yWvc/ikA
 vAkGYEmtfQ7x+dii1GcMjvxxPWpOjHNUD/0TLqF0iQcXn0/dPZcLj8OYgdUJVTAndYFe
 kT9HZ1I5MTdTw+m2NmZUlgXY//zuBVpvy5+gBC2FeGal6PSWQr9Zfa8qp0DbhoAj+Yue
 Ps8A==
X-Gm-Message-State: AAQBX9eH2VVOsjx/SEBESI5cnxmkvxXmOX4HWoBSJe9r8oGb4hsgUQFN
 uXyJQVsOgt6jxFGnI+GFiWD80y9hXKzQnDOsDNpz/Q==
X-Received: by 2002:a17:906:6a03:b0:930:90ce:a1a6 with SMTP id
 qw3-20020a1709066a0300b0093090cea1a6mr7510267ejc.6.1679997256367; Tue, 28 Mar
 2023 02:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230322142902.69511-1-philmd@linaro.org>
In-Reply-To: <20230322142902.69511-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Mar 2023 10:54:06 +0100
Message-ID: <CAFEAcA9-+bfGxN3+3sCpA3XB8T8f=RKPC7LUwdK8-pPj-h8xig@mail.gmail.com>
Subject: Re: [PATCH-for-8.0 0/2] target/arm/gdbstub: Fix builds when TCG is
 disabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Fabiano Rosas <farosas@suse.de>, Claudio Fontana <cfontana@suse.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 34w41q1gWGxZ

On Wed, 22 Mar 2023 at 14:29, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Fix when building QEMU configured with --disable-tcg:
>
>   Undefined symbols for architecture arm64:
>     "_arm_v7m_get_sp_ptr", referenced from:
>         _m_sysreg_get in target_arm_gdbstub.c.o
>     "_arm_v7m_mrs_control", referenced from:
>         _arm_gdb_get_m_systemreg in target_arm_gdbstub.c.o
>     "_pauth_ptr_mask", referenced from:
>         _aarch64_gdb_get_pauth_reg in target_arm_gdbstub64.c.o
>   ld: symbol(s) not found for architecture arm64
>   clang: error: linker command failed with exit code 1 (use -v to see inv=
ocation)
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   target/arm/gdbstub: Restrict aarch64_gdb_get_pauth_reg() to CONFIG_TCG
>   target/arm/gdbstub: Only advertise M-profile features if TCG available

I've applied patch 2 to target-arm.next; thanks.

-- PMM
