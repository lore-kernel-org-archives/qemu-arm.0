Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECA9EDEBE6
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Mar 2026 18:44:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxUj9-0003Cm-8O; Tue, 03 Mar 2026 13:44:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxUj8-0003CP-5v
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 13:44:14 -0500
Received: from mail-yx1-xb135.google.com ([2607:f8b0:4864:20::b135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vxUj5-0006YB-NL
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 13:44:13 -0500
Received: by mail-yx1-xb135.google.com with SMTP id
 956f58d0204a3-64ca423ad53so5350110d50.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 10:44:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772563450; cv=none;
 d=google.com; s=arc-20240605;
 b=VGGF0QUhA//XW3eXQaT+3M7350gmlxvxxLi9O32k58p6dyfvCZbs2qnKhmU6BF9vcW
 UXurisqSFV4MnKoT+ojxkHUMesokAwhgXB84jU1nFxfO5oxQFEF4Syf1ym3nReVoxeXr
 04PmbDY95ELgKdih3nBAZiThQyhOGQ2YvfZAhx93eje18IWbQNtmEUGYYMXbw0ZR6zbF
 CfYcmzYf4tbOCc6rX8pGrAXZXr8bi/2yrNBS8lK55NKLPfpdwsG5AJofdHAIXx3ssCpK
 MM1Jvof19jfMIvUCWEmIm08qv1+XhxLn79/4nufQTRmrjptYFbfP4Jst/nmy6kqkL4Sv
 3vWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7yQFde6shSEuD6xHB0wkTMivUqLOg+eUFfbOLCED0oM=;
 fh=1OODLDd8hizKJGqjJ/o17a/Bux4YCNllu0SYxbO6PhE=;
 b=k7z1YaK5UveYDoHSet/HVv9Tem6yG7bdKhhQhhUN3xH4Av38cl/CGHnW+LWULIEvtb
 D0Mv2Ab3STJWAqzQnfiBU+LZG4s0Y7b3hWp3hnhthqn65H7fl9c6NM89dER2gecCw0EB
 3vo+SOR13jvGKgNvshvY6HEs5xPw1+lY79OH5KstQSCwbuFI+qsf4svAvjwa9p0GQPw3
 0x+KFoX1eFS6UuXSREi7TkBdAfqHAi5CwosT6ic88bTA/VeuS8UJoNUQwNbqljMZLyqa
 UEge9YpTHuVBBmJQ4ZqxQzHzXRsUUZcEUx0aR1SAkwqwovNybUEXkKgr/nFdtE8jsRI9
 2JHw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772563450; x=1773168250; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7yQFde6shSEuD6xHB0wkTMivUqLOg+eUFfbOLCED0oM=;
 b=N14ougJ2wM3Iu/+zKYsw2mLq2yfW6033UdztK/8sRH7xJLjlTSrLoP0T/6MzC8g877
 rf6/ffw2WTmsD1qyrruQjL3/5cuTNH4kak43U9kVRa0rpa5JgnkxvefegX+RXBs8F8Oj
 +fAFdZ+Ht6/rBNAhcHD1PfNATTw2PReEFhrNNKHc1Uh1kK2I4VRkYFpzzPBqtb/X2UD+
 slKEoRIyxreUQApi/1FfZx3Z1I8/7cRq31657HvfdK3YdCJSnrwFaEvjqewgaPlGWief
 v1EUxp0COeL9hrKnsZOtCaWAvHqFH5fkS52C2vcNsB6ZorkBWBwxag8TWynKgec5GHFh
 K7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772563450; x=1773168250;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7yQFde6shSEuD6xHB0wkTMivUqLOg+eUFfbOLCED0oM=;
 b=ivuoUU7RwVstl28YGtmaeMa4oFxb/5yVzNdoGJm3WNfvt/wlsoK/nxGKf0W3rqZDf2
 fpSWIvOfcov8YDghUPJ9khOG+uxT/iH4QVKRlGVusc/Qrhzg0pGxIm4XABXrcqe7ScT8
 kt65tro7fG59B5+2d+dtcB5O6Oufj9fZtixTNFjBrk7m8vjKJ8Ewv6zyVjWJWVI9kMc7
 p7HeRgyCtoBrYF92flx13BQVzXe3p+3B0Zk5NoRXVx+tj+GkhF7aC1YMQ2zCd6RJROWj
 NQf/jbcdEIE3brJmXfy7ffdO0U34ewqMUhM7GmhTDCfjM0RXkI8M3pL0qJ7DMIS0Y049
 MaZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCULQk1zHSYwekQDyNDsYOgavtfy7xiknn7/eUJ05X5fGXYqDffWkah/yISTieCVabTFF7N0WnUacQ==@nongnu.org
X-Gm-Message-State: AOJu0YyPYWot/l+Bc8Zw9V5miuzoU33kQ/3YdN2fYYX3VLkgnSqD3CDn
 +9KzFHu42DlXbVAFrJsKlNyC0ZK3GzEHKnOZYp0qIZsYuibeMJxB5eg8tzkhagJTS/hTkhSgeTZ
 NQCHtnH82V06ponSUDUWbknUo+YV41WiDJvT+fVTYTw==
X-Gm-Gg: ATEYQzzlTcIstDPyOMB+XSxFwMlk4Mg6zn7zbWWdhKQPakfhZfexLWFVVdiUZc/HFJO
 lLpka4Fw/CcLEy65WV0+774LQyOSDq6ax1lkK4FngOGyCUPQ6ql0KggyXODXyhjuP5MPPK3EwnE
 tTvzhxhcG7kmc5cOtbDFV/zPMTaEUjZz0q+QDJCO+5RenVZo2JV59XmAGgMrtzWOozDW8JzF7CC
 BnavtW0Bjk2dQCflRc0jTZ5fHkF1l2P+w6rjdBJ/0b2vDqL6Ppj3aHjrSzz3J1SXq8oeRL/qzEu
 Sm5sTjT94tMns4FikHxOzmN43xhNTbjuG+Wu91tpIa7kKIcLbo8uMzZbzqrdWl/omZ4=
X-Received: by 2002:a53:de46:0:b0:64a:e7e0:a717 with SMTP id
 956f58d0204a3-64cc2193e32mr12863824d50.37.1772563449997; Tue, 03 Mar 2026
 10:44:09 -0800 (PST)
MIME-Version: 1.0
References: <20260212104432.4168886-1-kchiu@axiado.com>
 <CAFEAcA_u5B2RdVEaGycCQ6gCx1pQuT8rvGVGZpoKLTK+2s72+w@mail.gmail.com>
 <69691e3b-1605-4a5a-8ad5-0eec56ce3eed@axiado.com>
 <CAJy5ezpcvp0Qy-P9gE46oDtsxZxNO=xMV1k-GC3WF4yY3gARGw@mail.gmail.com>
In-Reply-To: <CAJy5ezpcvp0Qy-P9gE46oDtsxZxNO=xMV1k-GC3WF4yY3gARGw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 Mar 2026 18:43:58 +0000
X-Gm-Features: AaiRm52REslOrhSITVVcQNhoEBm3OTMsDQQ6NBVXPx9_BfEaeYtFF3-8OrutBRM
Message-ID: <CAFEAcA8mC4TkicLy9bcS8NYMDNcSUjsataGGmkMpViw4wBvmCA@mail.gmail.com>
Subject: Re: [PATCH v1] hw/char/cadence_uart: Add BXRS register
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Kuan-Jui Chiu <kchiu@axiado.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, 
 pbonzini@redhat.com, marcandre.lureau@redhat.com, alistair@alistair23.me
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 3 Mar 2026 at 18:32, Edgar E. Iglesias <edgar.iglesias@gmail.com> w=
rote:
>
>
>
> On Tue, Mar 3, 2026 at 2:33=E2=80=AFAM Kuan-Jui Chiu <kchiu@axiado.com> w=
rote:
>>
>> Hi
>>
>> I was referring this commit of upstream kernel which xilinx added BXRS
>> register in Cadence UART driver
>> serial: xuartps: Adds RXBS register support for zynqmp =C2=B7
>> torvalds/linux@3816b2f
>> <https://github.com/torvalds/linux/commit/3816b2f886d0918d8a8ae593b2db20=
3ab905a889>
>>
>> Peter Maydell =E6=96=BC 2026/2/16 =E4=B8=8B=E5=8D=88 06:53 =E5=AF=AB=E9=
=81=93:

>> > Where is this register documented? The cadence_uart.c file
>> > references the Zynq 7000 Soc TRM UG585; its URL for that
>> > is out of date, but looking at the copy on the AMD website,
>> > there is a table giving the register summary for the UART:
>> > https://docs.amd.com/r/en-US/ug585-zynq-7000-SoC-TRM/UART-Controller-U=
ART
>> > and it lists only registers from offsets 0 to 0x44.

> There's documentation here for zynqmp:
> https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/Rx_FIFO_byt=
e_status-UART-Register
>
> I haven't looked to carefully, it may be a register that didn't exist in =
the version of the UART on zynq and was added in the version of the uart in=
 the zynqmp.

Thanks. On the subject of Xilinx specs, do you have an opinion on
https://gitlab.com/qemu-project/qemu/-/issues/3297 ?
Our Xilinx AXI ethernet device model lets software write to
the PHY registers for the PHY ID, and it's not clear to me
whether these registers are supposed to be read-only or not.

thanks
-- PMM

