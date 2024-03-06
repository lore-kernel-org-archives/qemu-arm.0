Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp536993ejb;
        Wed, 6 Mar 2024 06:33:23 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzosraojklmiafM7brTF3iO/V+Bj/KsvR89rGFtaGbyj0zEMBbau4xYSKtIxgy1+yOKc+er0gHFDQyAekSp7GdUm1Ce1Y+
X-Google-Smtp-Source: AGHT+IFkuDT8do0K/EmnyCQlNEizCLCbnhNs0Df7gl5xEdtNuMV6ntb0wlz1Mh42pZ/dQg/3FnSJ
X-Received: by 2002:a05:6830:120e:b0:6e4:fa90:2549 with SMTP id r14-20020a056830120e00b006e4fa902549mr4342866otp.8.1709735602804;
        Wed, 06 Mar 2024 06:33:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709735602; cv=none;
        d=google.com; s=arc-20160816;
        b=jSW1WbcheTwE7Sq1ATr2bZTHGFj3OLLbnVI0NWxMBZjVsdtH9QphpUoSiE13CKrBT3
         egHBpAVqJm+yfdytzgrbpLpqP7/d8Q0Q6qkggzeq8Gfjv7rTiXe4Il5fNkVa8BlW2vAO
         o1kOGQDHJKT6PfjQYCgbr/+TujjKm6gEl0/9QBS1PDXWX2P5HRf7hoLnmHzR+WpondZq
         bfpA7uYtZSmZ2S4SwdV5Pve1wO8+vmbFGqDH+xsJS/PkmoEMB/E4yfGFJPqmzFR6BQjQ
         li7/E0fr+j+iD551lApfkKE4/zDUk7ObP7V+QLjeDehOfvOlC/y6tuV1V/EuvfuniF53
         q7og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=2A+eXIP61nOObie+6hF7GYVPiixHlwF90K4X7zcmbs8=;
        fh=YMcGnXI8dopA66xeAUBsqmhr6RTPMBovNWjsfS8LR0k=;
        b=t/E93s4/lOZaPBKuwPwYu8dWy35k/lQ00tyU8/CrFDjZdpQZx4T6/Ncu+pc5Iefb71
         ScpluISh5RXbOgnlkQFgVQl6JC6PHIZpJ0e6PQa1GZKub5mepxi/bmzcBy2N2DpJub+u
         f9ISVvvP3Lq5BmL9SDpRGNMICxcAkacE8WDs8jzbIgXFUVcsCW9QzxQIMTPL5N31EVrq
         dHBkSRZEmIlBpg00RcbXDW6fanXVSwIh2DZklhyHscIhIK6v8J0cdGgxOCoI3/DIUfJO
         ZHCAIA7Sm3w6mwupGxlzlruNPfB0aZWNPsFPUvGch63FVywdy/wXKLX0RnhSeoy+L7sY
         VVcQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=E8Eef9Hs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c11-20020a0561023c8b00b004707228fa09si2598254vsv.769.2024.03.06.06.33.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Mar 2024 06:33:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=E8Eef9Hs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rhsKO-0001mG-5R; Wed, 06 Mar 2024 09:33:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liuyb845@gmail.com>)
 id 1rhnBE-0008EC-T8; Wed, 06 Mar 2024 04:03:16 -0500
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liuyb845@gmail.com>)
 id 1rhnBC-0004aq-SP; Wed, 06 Mar 2024 04:03:16 -0500
Received: by mail-pg1-x542.google.com with SMTP id
 41be03b00d2f7-5d3907ff128so569051a12.3; 
 Wed, 06 Mar 2024 01:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709715791; x=1710320591; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=2A+eXIP61nOObie+6hF7GYVPiixHlwF90K4X7zcmbs8=;
 b=E8Eef9HsppaxwHN+fcIumAjCYNeP5my8Ty3L3RJxcKVw3vkKpQvXR9vjpWc/1uAwhc
 Pzp0yH0vEwNHwodsPEJYxetfQTqnB4jH9NjZmNSrF/k1O3HKvJbS9EOiNtZTx3pf8iLQ
 VkzQGRyLDDdwHN3PvxtKpFHQeC1dC1IDWHiDpy8vy92PaIzINl97y1eowE+sg6xdQQDG
 toD+MPWgxZ+dFpfk2qYkQ4qvE5cOI6yMoY4mI+ggND1nckTmyO+KEfuMeNr630Qpp2QC
 J69TdXS7V1fcZSExvbU/ibLciNOFlVanrZgiLYmXTaZtANF3iKK4cqA8AHEuuVRcJyv+
 Op7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709715791; x=1710320591;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2A+eXIP61nOObie+6hF7GYVPiixHlwF90K4X7zcmbs8=;
 b=B+QjjH6NzlAXYqqkMCK9YXwTQhVRbCZltkoeBMBXa7k2/Byxpc30QZEdE7talLapG1
 szua+5fxgB4IR6mKjb1SbzYkVk60qlAqcOtqfTI3OnTDali2A0Z4gRzL83+QGehVz2u7
 2iNGh8XjhM+/mX2tyNLChF+otJFx+PIqDkC4UDtTfg62avQQj2RdYYkGsMpjzWB2749P
 EK5EmGLhtcyS6wQSfhg6yzAGNDkIjiXJnEMKGmm/En9qnFPIRVppVC1HT+mzzeBty5nf
 i2DfqMMryiHUpcVcJdgGBeu6oodRpFT07buKvHElWw8YVzuldeCF+o8t9NjjVW+pZxC/
 ovDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyK4ttgKchIG4DGtndEGAGUeKdngJ/88AgPPyMLTbs7F94ndu7UTMOzBPXqd72I7QmUUFaJQDETkXXIjl88wgYUBEOULDlMwNt3YiMT2xcOXxlr+9JO3H2qSg=
X-Gm-Message-State: AOJu0Yzzq0Xs1wpYHysUH5LlopdAZTuo3SMG49NTyibWf92VPPVKwUkE
 FmC+QqvJ3VJq2HICbfLuwX3VF55LrC11AdiIwF84pIEEwgei3IKei2ra31sEsS1SHj1Wm3rO6AX
 y2T8c7ACoL6LLxGNHcwZzNtOWHIp6GD602g1VnQ==
X-Received: by 2002:a05:6a20:7343:b0:1a1:3515:7006 with SMTP id
 v3-20020a056a20734300b001a135157006mr4819695pzc.31.1709715791417; Wed, 06 Mar
 2024 01:03:11 -0800 (PST)
MIME-Version: 1.0
From: yb liu <liuyb845@gmail.com>
Date: Wed, 6 Mar 2024 17:02:59 +0800
Message-ID: <CAKstcpWLhcNswkippmDyQQz2bPKSN+w9F0jZzcZRGpuNWvW55g@mail.gmail.com>
Subject: QEMU Compatibility for Cortex-A55 AArch32 Firmware
To: qemu-discuss@nongnu.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000006a1dc10612fa3aa9"
Received-SPF: pass client-ip=2607:f8b0:4864:20::542;
 envelope-from=liuyb845@gmail.com; helo=mail-pg1-x542.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 06 Mar 2024 09:33:02 -0500
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
X-TUID: U77nMNrGUuX3

--0000000000006a1dc10612fa3aa9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear QEMU developers

I hope this email finds you well. We are currently facing an issue related
to QEMU and the Cortex-A55 architecture. Specifically, we have compiled a
firmware for Cortex-A55 and would like it to run smoothly on QEMU A55 in
AArch32 mode.

Despite our numerous attempts, we continue to encounter an "undefined
instruction" error when running the firmware in QEMU. Our question is
whether QEMU supports this particular use case=E2=80=94specifically, whethe=
r it can
handle A55 running AArch32 firmware.

Any insights or guidance you can provide would be greatly appreciated.
Thank you for your assistance.

Best regards,
Eric Lau

--0000000000006a1dc10612fa3aa9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div dir=3D"auto"><br></div><div dir=3D"auto">Dear QEMU d=
evelopers</div><div dir=3D"auto"><br></div><div dir=3D"auto">I hope this em=
ail finds you well. We are currently facing an issue related to QEMU and th=
e Cortex-A55 architecture. Specifically, we have compiled a firmware for Co=
rtex-A55 and would like it to run smoothly on QEMU A55 in AArch32 mode.</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">Despite our numerous attemp=
ts, we continue to encounter an &quot;undefined instruction&quot; error whe=
n running the firmware in QEMU. Our question is whether QEMU supports this =
particular use case=E2=80=94specifically, whether it can handle A55 running=
 AArch32 firmware.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Any i=
nsights or guidance you can provide would be greatly appreciated. Thank you=
 for your assistance.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Be=
st regards,</div><div dir=3D"auto">Eric Lau</div><div dir=3D"auto"><br></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><br></div></div>

--0000000000006a1dc10612fa3aa9--
