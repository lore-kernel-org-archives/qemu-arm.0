Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1846164ejb;
        Tue, 6 Feb 2024 06:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFfKYVNyyPDYp+/jcxjHwSwh9WrnWuZ59z28aGnnoZ6/U24QQF47FECaoIxvaAikoTd7UP
X-Received: by 2002:a05:620a:25c2:b0:785:556f:373d with SMTP id y2-20020a05620a25c200b00785556f373dmr3063902qko.14.1707231257017;
        Tue, 06 Feb 2024 06:54:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707231257; cv=none;
        d=google.com; s=arc-20160816;
        b=QvCrTxWtGyW0ZspnVHhNtDT6mIM/eiRja8FIG6yW9AF2Z0JY9sNirysSBFpCbewF5r
         UOSoRhZz6LJJQjc1hfVOGELE/8f9OtOqv/P3vAhB0A3Oen1bBWD6l0Tp+BGnQaCBaJ/9
         f+1TJcTNlLp+Cz569qMiwqpNWiC/OM1NJc7NJlzKHX8QydKivsA7F+EJ+zM7g4AH9Axk
         jS+9Ux20bIm8PCdhqkelakNeXfarrcCQzSJvxUBRDPUAPYCUhIBHIW5846E32oEcpagE
         8aLcRxYySQqJ+LsvgIvwxAuRp4KRCfEhJ/rC1feefP8+KdN36+NI3VYIi7g7MJzXBFpt
         6vyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8x4futTWw4A4d6/viIwlKHb4D/ab0/ZFVnzEgOcE40E=;
        fh=UZ/Xw51A/mSN2yZlw/5CAdLKHlrchSidGVWkei+CGQY=;
        b=kiwpn+lNviY4OikWb2X1g93iwcROV0a11MwXxpFZWCP/9pngLY4NuhKTAjFEnsQ+4A
         tXflK840tfb2jPsyqqNNimlhxgMMfX/AcAzdnJfk484tqtrYKHgydtjFcl9FZK4iZciJ
         s90OXocKipn1zBah3eBcO9HesIt6BSq9t0P9kBpMI5qm2HTVY2IOnSDw1PBkXcSqoHDR
         OrbNeQ5PJxH52T9THf0+6cRjZgiS9fiXKLuwiXD8uKAU+fzHXGWh4WCkDHqvSrOaEfO9
         jAW9LXMiriUAylS2cPNVpXzZn5Gk6HDn6S0HOCyAoLy+222+zp5g6Qqnj2SZ345vX9lH
         b5IQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F0StHZDh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCXTDyW/pjvFhtsXhhqlrp/OgfMy+mw68OKIrUqPDhkBJcmwnlEppGZyMBGOZSTGy1YgybWR8YFK9ZSr7EUPlor52OdWv8mu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g27-20020a05620a109b00b007858c70dc01si1771521qkk.113.2024.02.06.06.54.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 06:54:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F0StHZDh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXMpm-0004BM-HM; Tue, 06 Feb 2024 09:54:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMph-00044r-7B
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 09:53:58 -0500
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMpf-0000xx-Lv
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 09:53:56 -0500
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-511538be947so2211816e87.3
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 06:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707231232; x=1707836032; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8x4futTWw4A4d6/viIwlKHb4D/ab0/ZFVnzEgOcE40E=;
 b=F0StHZDhMtptWV0oRKlLjwcakkbC1OHHbto3RD2CjpcMKZmp0Nzk3YhkFYUK2lkKny
 NhqyJdAQYqrY4HxtCdG5Fkf/JP6BN9yQ5mNVPR/Mqz23HMvJ9mvh0PudWl6LnweaM/lo
 k66IIcQidDqp1VZBa3bY7zbiMdC57COATRQqLq1oNe5XA6HQo0H51wT6Q8O2hNu6Ls79
 iehHOoSo/KgDc+OSzB6Kd6NTP4/TkmdwYZMmlK2DalQ9f+fB2eBKDe/MaRppVjCAzTI3
 UBdrrFOCA7fhWmpyXVMr+j2O1rqxBucnBfABE8UgIZH70noNZGgGJuvfgAYCMT7U5VJb
 WItQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707231232; x=1707836032;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8x4futTWw4A4d6/viIwlKHb4D/ab0/ZFVnzEgOcE40E=;
 b=TlzmrDUW8bW8se5kApd+661kvhL1OL93id0BD0s2zgfeOGbrU97MjwrN+MQR+F8c4l
 5ghd13mSPb7VCNAsKjz4RRLvxwNpitJrM1Po3BTLdUfLN9Iy+66NyPGfMxTJIiOEUCkC
 JpMt0tybDvVFlpAoTyJzzeQ0ZqGb43LmBBCLWNyZQmmoJQYv1j1yeRp6XCm1qzGaAkER
 pdRKLfsIOyelGut/izz3TGOkvwOav/UMuHK/9jWqgFtkeXKRfHdfZHWpxNmYjOslZ66x
 txTgF2QBii6PAEfBUkH69vHGu5sW6J7kwc6X75pUadks+xUsGK+jTRaoT89lzvOqOjwV
 FEjA==
X-Gm-Message-State: AOJu0Yxvxr8fH/6VyJD/nKCcSbjoF3ltZel3VosA7HdcX7oisRHTdzpa
 rzT8grv3WsXKhvi5wqhvqbp6/g4e4rbrphuYXaX5YjaWGlGG0O9V8tzA7GOEaVbFcUAJy/cuukK
 CRDkj+jzJJmPBdyoSDJokuDnCSLONabdxWiaxAc8IbnQsjeGp
X-Received: by 2002:ac2:530c:0:b0:510:a34:5121 with SMTP id
 c12-20020ac2530c000000b005100a345121mr2058828lfh.52.1707231232014; Tue, 06
 Feb 2024 06:53:52 -0800 (PST)
MIME-Version: 1.0
References: <20240206030527.169147-1-richard.henderson@linaro.org>
 <20240206030527.169147-6-richard.henderson@linaro.org>
In-Reply-To: <20240206030527.169147-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 14:53:41 +0000
Message-ID: <CAFEAcA8bJdofftvnPdYdZcUOR=e8ToNGm8HZU5rRcEuKNEgWtA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] target/arm: Handle mte in do_ldrq, do_ldro
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x130.google.com
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
X-TUID: bx/56D1fpRNe

On Tue, 6 Feb 2024 at 03:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These functions "use the standard load helpers", but
> fail to clean_data_tbi or populate mtedesc.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
