Received: by 2002:a17:504:3a8f:b0:1be9:327d:8ee3 with SMTP id g15csp196558njf;
        Fri, 30 Aug 2024 03:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWfJry4AqpgZsSqoO7m2dF74fbMzMLuvejxl6DK2y0K4ZOQySSLgBqiB9IXNkhQue+nc2Aulyg7GcSMGA==@linaro.org
X-Google-Smtp-Source: AGHT+IGEpZMbgu7ex09ELuDQ0y4lfIwMRQgWnzGhXpjQxq58QFjkFQNH5R8dzzA5UOr86QqkTohB
X-Received: by 2002:ad4:5007:0:b0:6c3:46d9:1310 with SMTP id 6a1803df08f44-6c346d914dbmr20338466d6.35.1725013127523;
        Fri, 30 Aug 2024 03:18:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725013127; cv=none;
        d=google.com; s=arc-20160816;
        b=EZm9Hl2J6znGosio+12j4dznHZcaINrnjhs053cxuaOIQjhc98DRsLfNcSgrxOnv4b
         gKXcblaJALMiVdnGkMCUDGhZcvWNOmlneX2XvDS7kXnmSWEl8NsEbZkkH4akN9SZW/fZ
         cogD9EQevd4V0bqoDvMMPK8Q4upEHr41U/RCgExd0nBKxTzqz9tGt30aWqQO75O2IvrZ
         gT2Yp/0SnLHzYoFj089TajLD9UV9gDp9cHq2x3nMikrnXCxTFDwBnI8zwRQEX/V8TLk5
         uDibGUoLlG5PSmFzrMNdjjY0nSflsTz5Jh3nMYBcA+4r9jEjlzWpU6EmqPYDMo3XS2Ok
         L0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=KfMbdIEi0AO/Mg8rHQAJxOYGzzHnxDHzVnkVepPfesw=;
        fh=4bP3KmM5f2bkyd+hXcmFP4uqxDe3cRFg9u0vbKmMt/E=;
        b=ASOTC6735HUvVJpbtYYKn0JN7PcZfzJ8UrovA2A8ph8fum2xY+eCc/97y9uk1X1EeS
         vRXpNFq7alfzFYbsNaPciPQ7sbR61SRBIDo+slhEZibXVK5cscyP1pn6wPvoYGaFJRAa
         oPmymLgs2mRxbdv4bXETjGBHheOINRaqcvXK+7X0ttolpWpz6T/UvWoqfgX+jV4DqBcV
         YUMVKvCSY2U7Y1rclt7gd9IUusk0ryzkRpO1PKqJxOoXgtF+8FSXez6x0GcntXcQDVDm
         gqh+SObCKXStspCDJcY2eW5fAOHpmc4S5g3NXkopPwnv30x+kxzA8NFMpDV/kvDJe6Hp
         F9rQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B3E4DLUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c340ca58e6si34067996d6.375.2024.08.30.03.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Aug 2024 03:18:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=B3E4DLUE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sjyi6-0004CQ-RN; Fri, 30 Aug 2024 06:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sjyi5-0004Bt-E7
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 06:18:29 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sjyi3-00009z-H7
 for qemu-arm@nongnu.org; Fri, 30 Aug 2024 06:18:29 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5bed83488b6so1774594a12.2
 for <qemu-arm@nongnu.org>; Fri, 30 Aug 2024 03:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725013105; x=1725617905; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KfMbdIEi0AO/Mg8rHQAJxOYGzzHnxDHzVnkVepPfesw=;
 b=B3E4DLUE9l73MJF8HKqolkTheqg5bStgRMrh+66BpfOZbHJJab0wZDoV816yjbQ4jl
 lPWhHNLu9rWAQnxI4pZgwPPpVSTX0CX0Bt9R3sXZ9xMF3CKDhlCvHEKr000qPn2y4A8F
 ANY2V2B6mIdoV/zx687mnafxgD2Ug/UAlMy7+S+0RIV4EnInxC7e1xiV3nWc0pctWjOW
 JkIs74tvo9it139aDDfXZmdx6ClhXShVrxIKRXONhVirMMnJna30I4DD30Dpt1VTCDSE
 NPPMLyAKysfWAaeEkgkmfu7I5oMzVVDpN2F41cb63NvioR94hra/WIbfKOaH0ZcAAbw0
 aGPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725013105; x=1725617905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KfMbdIEi0AO/Mg8rHQAJxOYGzzHnxDHzVnkVepPfesw=;
 b=eae1unvNJQDE25Njy2p96RWVkZ8qBt/FNICitj7TfLx/HZDd0aJXRAfymMm9/MQaKw
 Gs3pFu5mOLGRd4wyX1dCOrMcek2PIDTnIPwqc+f2X9i4Cl+5emv42q1VmUEWQEmg46SV
 eNIjP5Uj+YehjgwR5+p7WYTwPFTEhT37KxU6tyju2q1+zTLPr37pv/+0Y7dyxg5BubOg
 YPJh2LjOEFJir+vwzKxpv+Gl432LzV98NgPOdrSuUE90xGEMyfHgMi73FUrzZPhjK2Hd
 lTL/7T42HSr/+jWMIDvIHGDIoslgPMDQxy6jpKHWVNsFhKCGZbifoOByxaRNfQV3jQyr
 6kvg==
X-Gm-Message-State: AOJu0YwA/hffWXIY0Hv/Xg5m/Ntc7Tv5cRQ0gT5a4pkPA02toMbsPQz7
 q2idp7pmCE8w8dI+Ju0bSij4TAalmbg49aY+TWE20l5SMDpJvSHgBszVfkrlaBLzl6qGtpQZOsu
 fL3B6BdIuUbWOVzXu/HWL3LWAL1nenrkGrGq8uw==
X-Received: by 2002:a05:6402:2350:b0:5c0:a8d0:8c59 with SMTP id
 4fb4d7f45d1cf-5c21ed8a150mr4262391a12.30.1725013105308; Fri, 30 Aug 2024
 03:18:25 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_3E0F9F905031BE780D8EB329DA00C7EDFA0A@qq.com>
In-Reply-To: <tencent_3E0F9F905031BE780D8EB329DA00C7EDFA0A@qq.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Aug 2024 11:18:14 +0100
Message-ID: <CAFEAcA9zizTZ-qtvEf31eDYj9ognKHpaSkM6OsJxug-_e1JE5Q@mail.gmail.com>
Subject: Re: Troubleshooting Data Abort Error While Debugging U-Boot on
 mcimx6ul-evk in QEMU
To: Guy <guyqqcom@qq.com>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: 3d6ynu12Pgu6

On Fri, 30 Aug 2024 at 05:11, Guy <guyqqcom@qq.com> wrote:
>
> I am trying to debug U-Boot code in Ubuntu 18.04 using the mcimx6ul-evk b=
oard in QEMU. I have successfully compiled QEMU and U-Boot using arm-linux-=
gnueabihf-. When I attempt to run U-Boot and debug it with GDB, I encounter=
 an issue in the get_cpu_rev function:
>
> struct scu_regs *scu =3D (struct scu_regs *)SCU_BASE_ADDR;
> 2cfg =3D readl(&scu->config) & 3;
>
> This triggers a data_abort error. The log displays "Invalid read at addr =
0xA00004, size 4, region '(null)', reason: rejected."

This is because QEMU does not model any device at that address.
What do you think is supposed to be there? The Cortex-A9 has
a snoop-control-register at that offset from PERIPHBASE, but
as far as I am aware the Cortex-A7 which the mcimx6ul-evk
board uses does not have any SCU registers.

> I've tested multiple versions of QEMU (7.2.0/4.1.1) and U-Boot (u-boot-fs=
lc-2016.05/u-boot-fslc-2023.10/uboot-imx-rel_imx_4.1.15_2.1.0_ga). When I r=
un qemu-system-arm -M help, the Supported machines list includes mcimx6ul-e=
vk.

By the way, 7.2 is now a moderately older version of QEMU.
It won't fix this problem, but in general if you're building
from source anyway you should use the most recent version.

-- PMM
