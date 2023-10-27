Received: by 2002:a17:907:d043:b0:9d0:bf65:29fa with SMTP id vb3csp131882ejc;
        Fri, 27 Oct 2023 04:50:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaJjQpQm5iO2pNKoVZZYJYobyqb4xGbiMJ99MYFXOXRuVsG7CvtudwwigiOwuSYaL31Ovx
X-Received: by 2002:a25:4041:0:b0:da0:8283:416e with SMTP id n62-20020a254041000000b00da08283416emr9379513yba.27.1698407448074;
        Fri, 27 Oct 2023 04:50:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698407448; cv=none;
        d=google.com; s=arc-20160816;
        b=mtTjzpYCpLMU11jKwnCi8b86febM35pOJ+58nD01PTnGTQbs9PY4S3MjtJANjQrUZz
         Z6iyuaYfgQ1dk1iSWmt7mWumNUVPhtXVjnetZ1+JZMDs09O0g+Bd638gdTBidzVXf03Z
         wbNrLr935wLk/Ls9xl+mW2eLi3USEu2ZMQfSsEEc6Nvbfx3gNaJJhIpolSwau1GJ0w6W
         UojyUroMkcI6UX3o8PXd1yZDglOwrhA5E722RJllBJ/sbuy7R/wMSuSiNnayDHB5QkS5
         K5Yq6OW16NtTk+n9JKWqHvVOu+psYTCoShZqNtMzl3CcSkF5Dck2M6JBoYjyEXU/kiST
         2xIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=2oFBLQq+dlgjwGLJDoOXdpoEdOhmXl5xUtjF+mOEJPI=;
        fh=knxAVTfmqMlu+gMQTLfc1jK0Nybs+7dKghECpX40b58=;
        b=gQH4PgoE8U4Fi6r7R8ykYrVL7GuzNlgCS2U1sh9kJvr/GJ8Zq9BhQTyxh/e6jk2KNg
         rt4dspQ6v+3vXqyKR0czt1m6LtRxp8lEQUZiY6FX6XeuMjLsdsYHOUlaKQ4VZKrvtMp2
         uWDG7MFi4dkbE5LG08u6ulcp8MauE/seqTMLpzYZJRJ5Q0JhxUqAoc2tZMm6i40Hxauc
         zPe4/xVm2GMIosJx2/opIPnrVcAaKKnj1cQlFhq4qBTLoyE8b73EcnOaJ02QmoMyNmwZ
         S+itEpZNoKmyr/p9JIKWlFHmy8nOA/yxEamGxsCkqqzCTdfijRmiRZqSbdSsPxKw8FAy
         VZMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lZbAoFi2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 135-20020a25028d000000b00da0ad2b9d2dsi2528687ybc.226.2023.10.27.04.50.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 Oct 2023 04:50:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lZbAoFi2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qwLLb-0000uB-VV; Fri, 27 Oct 2023 07:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLLX-0000tm-6o
 for qemu-devel@nongnu.org; Fri, 27 Oct 2023 07:49:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qwLLU-0007OM-RY
 for qemu-devel@nongnu.org; Fri, 27 Oct 2023 07:49:46 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53b32dca0bfso4080583a12.0
 for <qemu-devel@nongnu.org>; Fri, 27 Oct 2023 04:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698407383; x=1699012183; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2oFBLQq+dlgjwGLJDoOXdpoEdOhmXl5xUtjF+mOEJPI=;
 b=lZbAoFi2YMhVsCBKp+tg4wul0G8M3ksstiA/m2lg5W6DTPT7YruAkeG0CYbSXmTMAd
 p+DQAMtxZ0ZuVEZ3baljEUHHtL2ztClavnlpvBQpW5zdI8eYzqvVSElsb9Uz99UW1OHs
 iwYx1GVdrWNHoADhnfuXtadw3gFATPYbonN/WOVI+foubp97aSJx5/2eESIUFjAlHIKf
 Z9gOsLr91N4odcnUTq4Oe1M/ZWph3baCso1k0toLM6AV+EWaZStZnT+E4Vpii4YjEEqj
 peN592X/PjfGt2vUUic1uQDn1p0IjcC93JIHGjHFeLO2JdH34o0D0J3naNlPJaWe1Bdx
 gGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698407383; x=1699012183;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2oFBLQq+dlgjwGLJDoOXdpoEdOhmXl5xUtjF+mOEJPI=;
 b=BCLt9BFCSMxQB6kY7k/MT0rM0OUs+LfZyHCXjpLO3a/eotOHJu5NCo4Fs9aa7eU1G/
 9EiO7i1nqOg11f/b+x31mRvawjiAyFQSjfcuozGTpEReRyHLE/XFan5SaZ0AjniLwnH9
 nmgNZHyzDCBjXrqW7HtsRsul+1Uh9bPctgMRfhHQhZZYH2PjTjWABZ7mfSZnpQinVwqP
 qDS4JXczWW3WrCEzja4hc3UvBObPj87O1eR30QCqZdleDoywV4iN9kszsLBbZBOHNgQn
 rrhSbG7twSJ8cONMuvvkQkIaimhbhPZYeytk9SgzhGd3b6s5lGbCQUusPI55DGjjhvjo
 TVaw==
X-Gm-Message-State: AOJu0YzoDwDkV+7sBn3C7QdlpX3ii4XorooZ3cV1yQAmXyHhVyoKk6TY
 JTpFodE8YinrZHIsdHQpnAHcSk9+63v9LMaHsnwwhVfGQ7apsJQ3
X-Received: by 2002:aa7:d615:0:b0:53e:2aab:14f3 with SMTP id
 c21-20020aa7d615000000b0053e2aab14f3mr2743280edr.17.1698407382946; Fri, 27
 Oct 2023 04:49:42 -0700 (PDT)
MIME-Version: 1.0
References: <20231020130331.50048-1-philmd@linaro.org>
In-Reply-To: <20231020130331.50048-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Oct 2023 12:49:31 +0100
Message-ID: <CAFEAcA8-uB1978pJJXKfS+bbysTxjXK3_X=26__4cEP8DAe19g@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] hw/arm/pxa2xx: SysBus/QDev fixes
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: lPsoPAy23wln

On Fri, 20 Oct 2023 at 14:03, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Missing review: 6-9
>
> Hi,
>
> Extracted from a bigger series which enforce QDev state machine
> (qdev instance must be realized before external API is used on
> it).
>
> While here, pxa2xx i2c/intc devices received some qdev fondness.

Applied to target-arm.next, thanks.

-- PMM
