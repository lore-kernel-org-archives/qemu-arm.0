Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp1613266eji;
        Tue, 19 Dec 2023 08:39:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOwg8DFwMJsiQyfqQrEhbT7zP12wVsUGgwh8nHpruWgVoT9lLWPTEmnVclBjD18k8IRPxY
X-Received: by 2002:ad4:5c4d:0:b0:67f:2c40:29ef with SMTP id a13-20020ad45c4d000000b0067f2c4029efmr8502107qva.108.1703003985785;
        Tue, 19 Dec 2023 08:39:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703003985; cv=none;
        d=google.com; s=arc-20160816;
        b=NIP5XbqgDSHXBuP3+e6YIrDC/50mNPa8Ss2RCutq4xD2iAZOddfC3ycBjPGlivqNpZ
         j048j/rbe+VSm0RGvv+fgOwvWD9d7LQ63kxYXbA8Y0EjDNfCPNhz+s4neAFkygPreM+K
         9DXUbPMEhEbpYupxUlmPtdog/WzI0rKAp1ZWvWL00sL0VVzuzrhpsFPqFo6MGxsoU42K
         gehUk537+THK2sMTqWsEkbyxBJCMsMd2Fcm4ciIc9NSV7Smb591gG7GSx3GuasagkFVH
         xck74muvrXeISleUgatY9Q7niq/e+qGuYOVfFMqDFm91VDbEtSOX3vi6zgHlWPtdu8YK
         1S7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zNyVUwo9s2DMl7y4XkvCvSPyuJ1m5Py0Vme19chLdcw=;
        fh=yoHJ/04ooFxbw2Ls23fsQoxX/k15Oi+dv3vjdt3XQa4=;
        b=cU5w75UfyJlmP1eYzKvlBp0TMw82xqZZ1dOGbHtrEYZug8/vJdFmJt/CKLAdc8gXID
         cnI9UmM+/tIVwkO/C0ufhraowY7CQgsC8vnYiHEVhAbYcUzhEYWXalOOJgwDOIb/dQRI
         yIbuUh414jwzlddoS0VCAcLhRq5tDCiWrbG+2FgLZa7H/bFpoe1f1eLaGihIEJm+bFa0
         eD1eM5EA7dnPQUN6I+8gGQnC8YXbowCZpKXDFziUjbhT6MaqqVBZVRm6uBdY2v6X/Z3H
         gkkWFuUcauYoTMnPSvqhASZh7jGJLyitaLBRJlhlZjI6lKt/WXYQzpySyTDcOXKs3IFt
         ilqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qFzyF6/8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d6-20020a0caa06000000b0067f3c4b6deesi5472521qvb.261.2023.12.19.08.39.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Dec 2023 08:39:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qFzyF6/8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFd7y-00042m-6J; Tue, 19 Dec 2023 11:39:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFd7w-000412-Oh
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 11:39:28 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFd7v-0000xE-5W
 for qemu-arm@nongnu.org; Tue, 19 Dec 2023 11:39:28 -0500
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-54f4f7e88feso6515507a12.3
 for <qemu-arm@nongnu.org>; Tue, 19 Dec 2023 08:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1703003965; x=1703608765; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zNyVUwo9s2DMl7y4XkvCvSPyuJ1m5Py0Vme19chLdcw=;
 b=qFzyF6/85dnfs2CL/+E7h89CO4kV+O1HFdjBPEEYqan3U6ilRivexzLULUMYWl5YCr
 +UX8x1jUigPpiBvARXFka6QDfykqtycPLXFWYDPwsfKJS6Y3jcoUb0kVfFkkDeDuEJbp
 Qm1BdkMMjdvG5qOFayFrIlKCY1EdXnY+3EAhvJynL3AHoZdEMy7QzJSrFnD6EOkaTGKd
 1LG4V5QsFdRuzz9s1nEFzkDbz2xG0kGnSyjqDBOz9jIrendVhWQ6Jomobx8nWzKmE3Ur
 6dXJuXv3w9TpnNvsrshJpIBvE7VMQwe58yT07XFSTjhOBRZTlHmJbiDCsfdGHa2CD6la
 D00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703003965; x=1703608765;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zNyVUwo9s2DMl7y4XkvCvSPyuJ1m5Py0Vme19chLdcw=;
 b=f4j/eoPGgR8enSbxu8M+e27pEnl3vGXCb7/ZC4YWar7I7H+V7GHfHVmBLmKUctSOXM
 B077FA6SCoWJDjE7hAHgjfuu+xS0pm6ip1U4SztQBFF2VPWry2g9JbSNOaMtV6b2zoyb
 nGfeoEC7/diLmG3s+LgUmXp+9uJm+h7CyTNBqTzB/1DEdjwyuEXtBg+PsWYA9jdZp3BU
 IhKpCvQSkm5c8dTs1DPFiI/ixJMgo8PwETClbSyRhW5R5sAWVS1MA5aXpxEkeIaqpzDb
 rQhXMa0Aesmtr8e9wmLi2O4UVwTlCIl+5gGR6oDK6k8vWdqTIGzLDhm99pEhwY7Ktbz1
 Velw==
X-Gm-Message-State: AOJu0Yx0m1qqRpXamrg6c7mHxfD7TM6IpZM4Y97Ln9Rg09NsZXvnwdXz
 4p5PsK/P59EAXbTJ/sWt3OVvL5CKd6iax1YTolGQDA==
X-Received: by 2002:a50:d6d8:0:b0:553:37e1:a5a with SMTP id
 l24-20020a50d6d8000000b0055337e10a5amr2527035edj.40.1703003964875; Tue, 19
 Dec 2023 08:39:24 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <CAFEAcA_9yO8kY=fnT8+vn2AFtjyoJN25B4o2tcegaOxS41qhmg@mail.gmail.com>
 <431b825b51524907a3168007fada20e1@auriga.com>
In-Reply-To: <431b825b51524907a3168007fada20e1@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Dec 2023 16:39:13 +0000
Message-ID: <CAFEAcA8QHVy2xYYMxxO3TzLeUWk5AGcq4y6mKvXun02UayBzpw@mail.gmail.com>
Subject: Re: [PATCH v4 00/45] Raspberry Pi 4B machine
To: "Kambalin, Sergey" <sergey.kambalin@auriga.com>
Cc: Sergey Kambalin <serg.oker@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
X-TUID: 2L1EWgfakFzA

On Tue, 19 Dec 2023 at 16:18, Kambalin, Sergey
<sergey.kambalin@auriga.com> wrote:
>
> Thank you a lot for the review Peter!
>
>
> May I kindly ask you to take just a brief look at the first patches of GENET? I'd like to know if I've chosen the right way to replace bitfields with  QEMU REG32/FIELD32 macros.

The FIELD and REG32 uses look mostly OK, but the
second argument to REG32() should not be 0 each time:

REG32(GENET_SYS_REV_CTRL,              0)
REG32(GENET_INTRL_0,                0)

etc. The idea is that that second argument is the offset
in the register file of the register; then the macro
defines you an A_GENET_SYS_REV_CTRL which is that value,
and you can use it as a case label in the "switch (offset) {"
in the read/write function.

I'm a also a bit confused about the use of offsetof() in patch 27.

In patch 28 the implementation of bcm2838_genet_read() and
bcm2838_genet_write() use a memcpy() between a local variable
and memory which I'm assuming is an index into one of these
register structs, which won't do the right thing if the host
is big-endian. If you need a "load/store N bytes to memory in
host order", we have ldn_he_p() and stn_he_p(); also available
in _le_ and _be_ flavours for load/store in specific endianness.

thanks
-- PMM
