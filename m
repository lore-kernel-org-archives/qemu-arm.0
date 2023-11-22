Received: by 2002:a17:906:3119:b0:a04:79f0:9a0e with SMTP id 25csp146658ejx;
        Tue, 21 Nov 2023 23:45:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7UVYjzdUxm2z6JkPfOZbEuGJFwVKhfP6vPbf3mBqeG5TwqJdxQjlP1RrDEDobISoG08rX
X-Received: by 2002:a1f:6283:0:b0:49e:2145:1651 with SMTP id w125-20020a1f6283000000b0049e21451651mr1809788vkb.6.1700639132863;
        Tue, 21 Nov 2023 23:45:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700639132; cv=none;
        d=google.com; s=arc-20160816;
        b=FgzX0mXJACCiajfDju1GyXWQURtsjXCAAcjDd9EQcNKnlpfCS/ZGJr4I81fG45mogB
         7xU8vSnH5bzR9QDiXAo/d4oS5XYuXxhxSCMG63MpL3Pk0Tu5wFD+TGB0Hrm0I+zUJhcv
         yD8hOsZZxcpOmGvGJDbLb2CYcHUztvZWXMK5s4VXZu0XlULQ5fn0apHRxi2qHHFYQhNC
         Gb+uI8YRRHCpR8oUfr4+29gGVRHqXqW3DFoaZgPpj9yLVXhEQCVFNZFF4FQ4ane234ZY
         go93l+OIX/VWIyAd+5s997Jm5KevIMA1P5A504yQs226T8vUCDjf8B9eGbjj0bzdmDrn
         eFbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:in-reply-to:references:user-agent:subject
         :cc:to:from:date:dkim-signature;
        bh=6mZfcRg456myMBgJkUslOltohJvtY8OdkQIrhBoThf4=;
        fh=Ra5PvCfSUev6oGHdoWNDPcCXRSJ/lYtzDTGefCjfN6k=;
        b=DMh+sdwN+OMTYilUCNMX2OMwMX2q+i8EyONKMKoE80NXx67RIxo/D821RHJKgOY53M
         zsTelgt6xSRFvEXRm+BSEeTok354fbyvANNxgvJCEH+VQSp1T6NKcixpnuosyp09h8vB
         Tto1fh/gx5v51PY2LDY8rMPaqcWtgsppOfLTUXMxQm4XfGXNqACrLR/Vr8816WhkCAmu
         RXE1RKa7MjG+upy6Ok3uckM6/CbiLsdSMMauz9xVIMJTvpOPEbxuBjzCzbG5OivPpnCl
         rl57gzcw8ZnlwZpvQL4UyK+6JYZecGMO8bch9WKuHruEgPu1D54pb7/WVN5PiKSS7zGW
         MydQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U+Lu94N3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020ac84a11000000b00423735315f1si2108839qtq.442.2023.11.21.23.45.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Nov 2023 23:45:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=U+Lu94N3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r5hvH-0000FP-Ix; Wed, 22 Nov 2023 02:45:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hvD-0000E4-18
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:45:21 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <manos.pitsidianakis@linaro.org>)
 id 1r5hv8-0004GI-Ve
 for qemu-arm@nongnu.org; Wed, 22 Nov 2023 02:45:17 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32f7abbb8b4so4338728f8f.0
 for <qemu-arm@nongnu.org>; Tue, 21 Nov 2023 23:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700639112; x=1701243912; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=6mZfcRg456myMBgJkUslOltohJvtY8OdkQIrhBoThf4=;
 b=U+Lu94N3xGFYKGDghRUVtEI+O0dmBngks2XkWehQN7es6vt3ZErnVQm13S+AUC80Si
 4PIWB8KeCutMwVqe5IEfzgYTZ3TR/Tcg1fP/e5W7PDd9qeczZ7s6tHvP7frpuZ0O8OCj
 LU80oYzex4KbJNXVu/AQtfI+OB/PML5e6PXa8Uv+bzytpn9qxfjOAH8bXgybgiu0M2e5
 chAVOoRgxzlXv0rupANNaTc8DTFJEK7UZtnWmV/ZSx00iKd6PsZlsbhUUEcKMR1Q66Ly
 3j8Kcue7YgKnvlLojXP6Og0bUcmy10oC1TWSEJeRre4T7nzGGKHCsRUEvp+04Z7HjDBc
 ummw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700639112; x=1701243912;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to
 :references:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6mZfcRg456myMBgJkUslOltohJvtY8OdkQIrhBoThf4=;
 b=VlWSRsEDNWnn0+cwfgLofpobf48Q9OwU+L+H7HwKTiQGJ2ZVlFqV1yleCDC0AwTNVb
 m2e0Ozbo2vUF82YJDIuS2aeCDt4pm+fFZEt5FUSQeWG48N0u4CJYen0km+piBe5Y5+J8
 GGWN4oDi0vSw1ZrNUqZ/GzlvwKdIN7QtCQZgivUIlbPNEdZr6MUgHd8d1yex5mNFdc6S
 2tzIUXEg0/oV2OISBZP+EDSgUL/JcCuhYD0ucDcQUjUgvfewwjXPY/UixvLs5AfwosMM
 Z/GqmMwTK1HVVVPtD/f1HsMsJJkk98oLl+BQqS0WzdDBXNsx+3XfBZ9XvM0Ddv5ZeD0s
 PJJA==
X-Gm-Message-State: AOJu0Yzy3bhW+YJ8crOHe7/aX3qi7q+DknTyX98Qzkgru/yYtH6HRA8+
 eeuWpAvGdrprEc3UjJf3qJJLpw==
X-Received: by 2002:a5d:5f46:0:b0:332:ca7e:29c6 with SMTP id
 cm6-20020a5d5f46000000b00332ca7e29c6mr971692wrb.48.1700639112254; 
 Tue, 21 Nov 2023 23:45:12 -0800 (PST)
Received: from meli.delivery (adsl-195.37.6.2.tellas.gr. [37.6.2.195])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6489000000b0032196c508e3sm9139879wri.53.2023.11.21.23.45.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Nov 2023 23:45:11 -0800 (PST)
Date: Wed, 22 Nov 2023 09:43:44 +0200
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: qemu-devel@nongnu.org,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>
Cc: David Hildenbrand <david@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, qemu-ppc@nongnu.org,
 C=?UTF-8?B?w6k=?= dric Le Goater <clg@kaod.org>,
 Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>, Jean-Christophe Dubois <jcd@tribudubois.net>
Bcc: 
Subject: Re: [PATCH-for-9.0 21/25] hw/arm: Simplify memory_region_init_rom()
 calls
User-Agent: meli 0.8.2
References: <20231120213301.24349-1-philmd@linaro.org>
 <20231120213301.24349-22-philmd@linaro.org>
In-Reply-To: <20231120213301.24349-22-philmd@linaro.org>
Message-ID: <4ilja.gbu85vei1kfw@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=manos.pitsidianakis@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: R+TtLH3f1Qg3

On Mon, 20 Nov 2023 23:32, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>Mechanical change using the following coccinelle script:
>
>@@
>expression mr, owner, arg3, arg4, errp;
>@@
>-   memory_region_init_rom(mr, owner, arg3, arg4, &errp);
>    if (
>-       errp
>+       !memory_region_init_rom(mr, owner, arg3, arg4, &errp)
>    ) {
>        ...
>        return;
>    }
>
>and removing the local Error variable.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>---


Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
