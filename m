Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp649387lfm;
        Fri, 19 Jun 2020 07:38:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9KxRz3GwtdVig1ykoqsRZLFa+pFbDbzEkwaxZcHToGT793jVxYYJHf0tihxvclVTFjuxJ
X-Received: by 2002:a25:c74b:: with SMTP id w72mr7163474ybe.191.1592577532551;
        Fri, 19 Jun 2020 07:38:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592577532; cv=none;
        d=google.com; s=arc-20160816;
        b=jLn4P6PlctfOChBLgaQ7AUuvh4w25tMPyq5ECon2pA7VAFb09IMGRdtPD6nzk4oLXj
         j3qWuQuZ67lW2H24YgUNJHFpv+QiB2Jrnoe+uoY8Z6+kv+yDumCqVPbyJ2TkngnAuas0
         cIxMWVIltJ6/Epdvw8/9FI0Ang+YiKMiAbmm6/cnlr60BFqc32rB7KSPYUs4HrRPPJdg
         FW9k5BtIplzcrP86dGHBsWySWCplJAEYrQs81SMwp14VY6Pnb4o7Pan+VONGvrrN4A76
         kbZTlxQ8abh8CRcWpkAxhkmXncnBIhIbLh0RUYyS9UmqTs+7PA3SyK+SWuToW5kU3QBn
         6hxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6ca+3ihsEpy5+fO8WuuhHBOaZ37RpKSlN3VR/yeF8GA=;
        b=Mtzpi78PITq88oxW9hBQEeX0c2x/mm6NF0joM9vZbSir2meg0lAURRddzQUPqKI0Bs
         AWalzC+V9hKd/1dhmqX9ahwzui+Vq1hwOgwPMWUmfAYE4I3UNTQ78QpxuMW4Dl47M34V
         F0n+tfgGlGt9qyhXxcV29Tv1iSfPUcwb0VpYW5vjxo59uY8owQkR0CsI/s3/9pyXl8pY
         va44OYGtdmHSUwA1LKQSf2ybNUMBTQ39uUOZmFwROJMK8Fjl/IntnYHSnEAaS3EeTeUj
         FNpIj5L2bwfawbVsHWSCfG5irk+REbzsMv19nUjR1O0E9i/Z/klAvhBdCpDGoURpWFFF
         jQFA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zPMGQDH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v3si5206383ybk.463.2020.06.19.07.38.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Jun 2020 07:38:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=zPMGQDH1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jmIAN-0008Tg-Ve
	for alex.bennee@linaro.org; Fri, 19 Jun 2020 10:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmIAD-0008Sq-UU
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:38:41 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jmIAC-0001AC-9W
 for qemu-arm@nongnu.org; Fri, 19 Jun 2020 10:38:41 -0400
Received: by mail-ot1-x343.google.com with SMTP id 97so7452902otg.3
 for <qemu-arm@nongnu.org>; Fri, 19 Jun 2020 07:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6ca+3ihsEpy5+fO8WuuhHBOaZ37RpKSlN3VR/yeF8GA=;
 b=zPMGQDH1Nzdde0mKOpGg9q7K7HA7OwcTw0WVJiFdscBQzmUvV0ighc/b+ADAV1c0tY
 F3oLX3rPna6WWi7+K2VVwGqMgUiSiLRnQXFIslBWCy5xNzHCt+n0vGkC4bY2r4NgYkFU
 pcwLrzFzR80eHE25PtcA/VAzBTHeDlZdBguiGPDTKYKthTlXvApa/UJPa2LyG/eufKr9
 EObEP1qGGW8d+210qVS1m9LJzgJKEvnnGzxt30Ogc+0WiEMDk93yo1vLIzzqcprzab6C
 ny/+Q+9gSXClxwJSqiVo1uVxQ4T/Jo0Ptn1OUEyEvXqzNcUHehbofUXwkAqE/e5ulWnj
 Gsjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6ca+3ihsEpy5+fO8WuuhHBOaZ37RpKSlN3VR/yeF8GA=;
 b=QRojcWVhVMOZ78Sxo3DaiGk3LmkqacGXGOieGoFUqU0RcBGfhlexJmAQ4cjczR8kzF
 I/ujsXwcWtu64bJtjqMO5SNGlLigjFiLWJOUV6t+iG8STxezujqXD1LwXNG2+kwbFgPj
 +Aloz044tKy/+I45NUprhUycl/oJ1/9jFp3WC8xI9lxy1XTFfDgCt4/eFevAJZD96M5R
 SNo31oNy7ajwhsQiL1Lz0Oii0BqF4Y9FMP3wgR3XENvGGPAVRwQc66NL8ZAMsU6K4u9f
 f8da0oYoYuZi2sZo4GUoBLKDg9hRQQLY7meMdjMfBQGiVuH4owXvfiBothEdLkCeizvS
 BMLg==
X-Gm-Message-State: AOAM533NuMw0dY7IXqn1757c33JGU/QaVgqxN5Hyto1o2IzrcjILE1nX
 NcUDjYVWnBWGVtFXxevaUfKntWqb9RinqLom8tVWUQ==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr3225296oto.91.1592577519078; 
 Fri, 19 Jun 2020 07:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200603011317.473934-1-richard.henderson@linaro.org>
In-Reply-To: <20200603011317.473934-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Jun 2020 15:38:28 +0100
Message-ID: <CAFEAcA-YS92VA+QXzVyBTQhzskER09Cpp5p9ugi4FbbBPTEoBA@mail.gmail.com>
Subject: Re: [PATCH v7 00/42] target/arm: Implement ARMv8.5-MemTag, system mode
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x343.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TBD8n2gnvvWf

On Wed, 3 Jun 2020 at 02:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Version 6 was back in March:
> https://lists.nongnu.org/archive/html/qemu-devel/2020-03/msg03790.html
>
> Version 7 is a rebase on master, which now contains all prereqs.

I'm now done with my review pass on this version of the patchset.

thanks
-- PMM
