Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2202125lfk;
        Tue, 6 Jul 2021 07:10:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyd7EnR9DpkQINw7EiiyYUsKWw5BiUfVRP0Zfw/AAsXMhRDBylIc8r0V9K4nBG+X2N6Cq84
X-Received: by 2002:a05:6402:1acf:: with SMTP id ba15mr2915478edb.167.1625580633829;
        Tue, 06 Jul 2021 07:10:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625580633; cv=none;
        d=google.com; s=arc-20160816;
        b=wpQjv99iWY3lPwv2blQxw0EFh1nNBOd2VXmvFRjE4l8fcBBiP4Ei7e1bkrlxBJkMD9
         iy6ptIRcQRyvENmIyfcdSDasWK3FWZSuOVSc93HTKV1BW9JxN4G1HFDi7AuhMqMVHDDI
         BUGOZ6A3Ga0WiBW12SDauOU+QDn1kLXDWtS6D3V1NWWOA6UqRHJl7e0VQWoGqYdtuPsY
         4f5DOkVqvtoCI8pzyNngS36/j1foeZWOqDe/StpZysqmT5KbN7swzyfVf32Qx24je8xE
         ay2WeqdtbhPS81yyDYXYrNEZNcAm9orFGJw+w8E9EmfDY5BOjCGvF00Ubog036shNXwt
         1Uqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=sMhf1pK1/uSE/+8hBf/hwUXUVfbcpcv7frCVfZrN2+I=;
        b=swfMxGPNVFN6mXn0IcFoY3FlV93lJ7Ls5dYte42279NCtckvmOI2XOLyLc0Or09GlO
         AGzJXBJYNEalKPQTqJ+2D989TMR5g0zT7YcxrPHhmbKmeuQRcTMLdhUXnLPHsujYtui/
         LL0/32Th8Bv7Af7ieVQMvqYpyPa3Icj9a7h7acQtlPOXZqMgS7mmdvxtszDDSR4smzxl
         ULt9raFdGxU5bCQy2hls9n+eBujFgOeveG4UdqYEwLx9BKbzcLP3qL+T/MhQR4ZIkACn
         To+WXELItBzshcZBv67MeFltFR9P0AtMXiiYQkcRY5o9A6CmkPfReWijQ4/FI+nQ768X
         UB/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=V3NsLb7v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v17si1813353edy.2.2021.07.06.07.10.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 07:10:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=V3NsLb7v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0lmS-0008Ew-RI
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 10:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <priyabratamishra1996@gmail.com>)
 id 1m0dco-0007ZU-1V
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 01:28:02 -0400
Received: from mail-vk1-xa33.google.com ([2607:f8b0:4864:20::a33]:41791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <priyabratamishra1996@gmail.com>)
 id 1m0dcm-00008K-HG
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 01:28:01 -0400
Received: by mail-vk1-xa33.google.com with SMTP id p134so1344726vke.8
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 22:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=sMhf1pK1/uSE/+8hBf/hwUXUVfbcpcv7frCVfZrN2+I=;
 b=V3NsLb7vMILIL9bGR8TQeCNH86YhEqoyyb2UidCtygywvnmpA2MkI7N6oi4haz6ElU
 DzjTR2t+tbcZPz/xwbYOaKzdhG7ghgtZNU/ZczG81VcnOgttYW7vBbcwArNpOfuZTaU/
 zEbUh4/il8y2oUSZEW2Dh7vezvpivAMJbZi9MX1XNqL2eEP2A1yZrEJHcp6Jgo5KH6A7
 TOD0ty6JSMLmc5VrjsJcxSHPIf3WFWbPn2AfMdVd2Z6TuPj2R2hMbh4LZwhGSTK6UUqB
 G27MKY7nkVD4+lPWKHsWu6P6A7xIjBy2elSpKHWpeypUkd8RL3TnkMlHgcxTETtLiXaV
 qOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=sMhf1pK1/uSE/+8hBf/hwUXUVfbcpcv7frCVfZrN2+I=;
 b=dcQzbZ0l4ufbl1wpOyupKM5VPk6SNC7M4E8oUBWLYMnzekrfZACgabkUvYy8m8251A
 diW9kGYZzjbslcgvkeBAlehMyfi2Cqoeg4So8u/2GQh6F53+im0b/dbApW1tOkORJUYT
 /iAXUbXcyBJXhbuhgmo7ZSnh01uCGUjshl8vmTIY8nt3vTbrc+2OXufM4A5GfCOSqyZ5
 EPJUsABeBrbfxAOOC8ATQB17+cfZhcvtJts1qUlwtCUD1KORVXduUIgq2nyR04alEe/6
 YJvh30wyNgzkKJDy0jxfVZ5/CnfEoLzZ6mgvivCeZGU+PPG2goxSYTLAig5K215Rnkzd
 Gc2w==
X-Gm-Message-State: AOAM530PR7Xp85DgvRTacFiapekEH/Xu57sxQU7EVgx6kgbhMQ0ecfkB
 0NkAtOzHYLS/JQTXRGf8aCeY49JYLW8yzgdqIIVpdqgR
X-Received: by 2002:a1f:26cd:: with SMTP id m196mr11712308vkm.9.1625549278741; 
 Mon, 05 Jul 2021 22:27:58 -0700 (PDT)
MIME-Version: 1.0
From: priyabrata mishra <priyabratamishra1996@gmail.com>
Date: Tue, 6 Jul 2021 10:57:45 +0530
Message-ID: <CAMfJdN_Lv2F_E7jL=OutFyGuSGp6XpYc++xQErM65jOR0Lu67A@mail.gmail.com>
Subject: Need help
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000053089005c66daff2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a33;
 envelope-from=priyabratamishra1996@gmail.com; helo=mail-vk1-xa33.google.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_50=0.8, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Jul 2021 10:10:22 -0400
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q4vQ88xtRtJE

--00000000000053089005c66daff2
Content-Type: text/plain; charset="UTF-8"

Hi,
This is Priyabrata Mishra exploring QEMU to integrate with systemC based
simulation environment. Can anyone help me in this regard?


Regards
Priyabrata

--00000000000053089005c66daff2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi,<div dir=3D"auto">This is Priyabrata Mishra exploring =
QEMU to integrate with systemC based simulation environment. Can anyone hel=
p me in this=C2=A0regard?=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">Regards</div><div dir=3D"auto">Priyab=
rata</div></div>

--00000000000053089005c66daff2--
