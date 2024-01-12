Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp2540333ejs;
        Fri, 12 Jan 2024 10:13:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHdPp+TkzqpedgKmCT53z840JOIJhtm00cAyvlGsaFTh3h8TnNt2unvPWq5OSp12++9ciC7
X-Received: by 2002:a05:6214:2682:b0:681:d8:a719 with SMTP id gm2-20020a056214268200b0068100d8a719mr1564910qvb.53.1705083233620;
        Fri, 12 Jan 2024 10:13:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705083233; cv=none;
        d=google.com; s=arc-20160816;
        b=GYx4knVmNuXUJLo5l66qZdK1PtvomEQSWNMLaXgvEYMwxwr/N6fCuJCy/NzENW7zPa
         zfKBGiEZZAeONK7RL2xusjIfNIJcpcbx0oJjgGq/TS2M1UwVIWBsL5gCtvyEbWZZU9nD
         3p+heSbQFgluF+TVLiMTMMabZoCofu6WjyrTcyof3MFx0I0E0yl9E/6En+k0foRzJlXk
         7cx8G3rM3ll5Bku/qprsgPmBZuSDRJoWXmVR0UD/tWkXxnxFFhxPkCvisn5kawum13g8
         X83SHKVQUx+7PJEX4vevDHdmxuhLNJqH9qj0uMCO5U4gRX/HXKjyE0r1WJWqOmh27BeS
         w42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=JFA69dXixckMaOLLBw0WEFfpYsDDEMys/YpQXb/K2uk=;
        fh=5PEtRRSl0CL8NYHcihx2ZqN3bdbJRL9xPORA1LkejBY=;
        b=cu1JXW9RRPGWMpqSS3+jgrR0W7vrhWkGNdKzRxSVYicLNvy8JAtqNOohNMdkBgWsEV
         qo+KfksVJQ6I06lAxwgKnLtjSFwskC1aBoa/B+6rLBzMfUG+CRNGZNvlOFF4twO/t74y
         c6Wt0wKFJGp9QtdnHBzrrgrbBZ1EfnUPuanEqC4w2IGpRAkH2un6+nXqYNpL9xYqqrCA
         9eD2IeKUceH14l/0Nc1NeRHrBeZkHiMXbYJGh4mScDVWCq6XO0Cvdq0sHFTI4IoqJ9Ig
         A2T42AQv2QgNhtdf10In0ullK3Bwss77fgA2Kh8ug3rX4dOnG0AfH5xOFRYiJb/bcHZp
         rQkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xZltlSKI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q13-20020a0ce20d000000b0067ee84abca1si3425109qvl.105.2024.01.12.10.13.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jan 2024 10:13:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xZltlSKI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rOM2M-0000ZF-Rj; Fri, 12 Jan 2024 13:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOM2L-0000Yx-6Q
 for qemu-arm@nongnu.org; Fri, 12 Jan 2024 13:13:45 -0500
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rOM2G-0001UK-0B
 for qemu-arm@nongnu.org; Fri, 12 Jan 2024 13:13:43 -0500
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-558eedb6fd8so116434a12.2
 for <qemu-arm@nongnu.org>; Fri, 12 Jan 2024 10:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705083217; x=1705688017; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFA69dXixckMaOLLBw0WEFfpYsDDEMys/YpQXb/K2uk=;
 b=xZltlSKIjDXyDnfhjZd3nrUjGqenn0C9uKdfgK/f1qP356SfPgZ3U9AGXV7WQGcpo0
 QpD19A+84NgmGPITl4RoeY7qUERHD2i6HjUYDNRTsYzg1Av2OHwZehuYDmcg1mHkp/LS
 L+tfaAu1BsUE9d+xmY2/wsWVNd49Uh+xrHXvbRDrHHGmYu6eWLIGMy8y/boxjb1QhWrz
 VrWXWBqEh2wvK/kDVMyF7fb14ChP+x+gf517+/FnAiAo8NN3NpfuD4V/6zIDRDtnMtbj
 oNHNFCu5OKaUpOAcftK0UNjg/oiIKHo0WY1W4GOdUwPqBhGYhN8/TNpkqsvovIh8HzJ5
 jmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705083217; x=1705688017;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JFA69dXixckMaOLLBw0WEFfpYsDDEMys/YpQXb/K2uk=;
 b=JnV/yw67RHQ0iNFRHYv2FgcCwQDqHAjzD6Nb4KAiXJZmm4up/KFUNI1I+BVXnRX7UY
 3Gwwq8XZxKV4//1gs7lRVlXkUfA0oEENG4+rUJ2ujMaIu0RggPE725rHVVuxuQsiYiYn
 idQdX8Yf7kp9FEYAEqp2nB64KT3WsxVkUDy+IvmBtecOwj7ea4N8HP07Z+P5SXxLXhV5
 i9esLTXYeXRYhzVpULhJ0fsuvm6X8UheUVQ4VjMeuekHkcQAlnslTmF0Mt7ASQ7Td/ZQ
 WjiMMwiReaN37eKUrPpUoO5LfD1K/d4rbE927uyFnwGOma9eX/m6lqVxXWhb385yV+GR
 M93A==
X-Gm-Message-State: AOJu0YyYZqm9lJhiIW6XmNT8qnC8Nyjza+1hXN/WnVu0V7j32Fa3hCq+
 BeYhHJeWE9Ga8AbUxPjAMA84DD8rfZP1ui9qir8XFzgQGLNt4Q==
X-Received: by 2002:aa7:dac9:0:b0:557:77db:efc7 with SMTP id
 x9-20020aa7dac9000000b0055777dbefc7mr827506eds.53.1705083216858; Fri, 12 Jan
 2024 10:13:36 -0800 (PST)
MIME-Version: 1.0
References: <20240109160658.311932-1-ines.varhol@telecom-paris.fr>
In-Reply-To: <20240109160658.311932-1-ines.varhol@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jan 2024 18:13:26 +0000
Message-ID: <CAFEAcA_vCA828g_Sz_0iDtEaZAM_Dz0k2HmFYHYVCWzUoYvS7g@mail.gmail.com>
Subject: Re: [PATCH v8 0/3] Add device STM32L4x5 EXTI
To: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-arm@nongnu.org, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: eaY1usR40ZY/

On Tue, 9 Jan 2024 at 16:07, In=C3=A8s Varhol <ines.varhol@telecom-paris.fr=
> wrote:
>
> This patch adds a new device STM32L4x5 EXTI device and is part
> of a series implementing the STM32L4x5 with a few peripherals.
>



Applied to target-arm.next, thanks.

-- PMM
