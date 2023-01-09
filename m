Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2161525ejc;
        Mon, 9 Jan 2023 03:07:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu/ETGGaHoi9EXuBW9/J/eiJ443YT8yDtVx9IL8GXaI9hExdgtsemleAODni9L4WWhLWxgE
X-Received: by 2002:ac8:5557:0:b0:3ab:5b6d:1add with SMTP id o23-20020ac85557000000b003ab5b6d1addmr95542759qtr.66.1673262425007;
        Mon, 09 Jan 2023 03:07:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673262424; cv=none;
        d=google.com; s=arc-20160816;
        b=aZb3ztSvUa83YpLl7dD5nAwyD1b82PIJ6TlFoOzUjaX4aJhS6NDP5xv8HwcyBD6BMw
         RblHp+aXOvhbLExYZFVxbbLE7P78q7ds1wSUp5fdYvROoKlDnpUi0s5GKkgKJR+MacZI
         elqj8Gw0QQ4sTTw2asMyz//KUh2Jh0iDxtbnfAIZtL/Q+mqDu+YZbuHRzuwXCPUmIILd
         WHJlPLBY/4kWgWOrNSiXKXtdUaiplDkmPXMv67z6WXY7fQUFcylM7SH0WEIXu2Usiv8o
         Pws8CwPebHLm06okKFj5vCLAkhT/aNv6Gn0ZzIAo/cQtzS3egVwo/rQQmG5FwdnUWeUy
         q+bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=k5s4idfe83F5vogJLuR3WncBIoZZmGepM5no3pwxFcI=;
        b=fVCx7OFeVhRYYYDYC0ZpKETqgxCVqSsGiD2asEEjE6cwZ4Hu2IbPZwJjeUtJcsUIZ8
         6Y0h7c2yFHUYwbpKZpQTxcOA9FFIgR7Rv7gZ7w3RPEJzZZAVH3HZ8tae09fqGoHckiAT
         0xN9kHxmgdpDQTOkYoXtsqsKhvU5uE5q12m2InwYDdFEEea73Mq8zgGQ/vLFHcneRKYy
         n9GhriGQrxljCzgYP+uFlIjHI8cL+q7YC9/ientxvuKdZSz2xxlTxgJ+H69BssxcY/Pa
         Qe1CXKFfAMgVxr8S3ZHVvpKljKo3PhsuB2y6sBABHPoyYt0PUmHnCydoCjltZqXq+6ZF
         AISw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZ65M9Rt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z14-20020ac8454e000000b003a563efcf70si4315617qtn.779.2023.01.09.03.07.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 03:07:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UZ65M9Rt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pEpz4-0002UJ-FA; Mon, 09 Jan 2023 06:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEpz0-0002Tp-Bl
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:06:26 -0500
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pEpyy-0001CV-6r
 for qemu-arm@nongnu.org; Mon, 09 Jan 2023 06:06:25 -0500
Received: by mail-pl1-x62c.google.com with SMTP id c6so9117964pls.4
 for <qemu-arm@nongnu.org>; Mon, 09 Jan 2023 03:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k5s4idfe83F5vogJLuR3WncBIoZZmGepM5no3pwxFcI=;
 b=UZ65M9RtnJoPiNi8VJ5/Ir1X/57+eDVXJculIGBJvEHQ4p71vefS4RnfurLfRTNcOY
 2cMuCshJJ57hhsu9Op/t7kXH4TcwlbhvuN4mP1Ys0+3RZs5N2aBRFRlTD34utyN7ibXp
 RwWUdBnGKK8kfaUFuEC/VlLKGCeGNhxJNPf/QEkJZ8T8vaHY1kiDaJaRIJou+pIZZGBB
 CItiPh9gsSKQ5SHu12Z1t0uh34ewFdEWy+hK2GcKvh1DR9sKgCNtRTAUgYB+JfhfuZD5
 gxwot7CVa+JsCZ1L/De0tyRvKhiO2Zjen+LY8tBrTelS/O1keFBrV94zkpja7Ok3QvWr
 7lvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k5s4idfe83F5vogJLuR3WncBIoZZmGepM5no3pwxFcI=;
 b=1Wed2Pf5a/rZBpyI0D5aX0kVRISVYSAvpXLJUq7bPabfXdmN2SPjx3ZYWakJ2MW0RA
 r+0DEeM17Hj/BKh91AgPxi3jXwic84CmvAFtPDaDV3nIGwTWwSsT0dFNDDdcfCbBWUQQ
 /0PrFOGq3pZSJn5teVsrKv4B+XO7Z1zplAASyndiO+QU3/vrs8tKfRkE/AYpM/G1VMG2
 4KIxq2ca4SRN6zUozDfJL7lgBJ+2Wy65TfTHLon8jUtOpx/POvIjPRXPQ95z7tNuT3L1
 Xz6C5wsxHHNWi0gKRDIW0I5fv3ST9dgtrIJa7WI1Dczy2eofU0xD11qBYZhgJSaH504z
 fgUw==
X-Gm-Message-State: AFqh2kqHSlnM1wuK5ZWzXU7yCGjk4vAUfEA5hNaF2V8yHJZ4C2xj7vDa
 OmJ+QQ5l+mkeqN9Q1nWWdWcJTEt6NFcb90TyTiDfZQ==
X-Received: by 2002:a17:902:efcf:b0:192:ea33:5092 with SMTP id
 ja15-20020a170902efcf00b00192ea335092mr1562678plb.19.1673262382510; Mon, 09
 Jan 2023 03:06:22 -0800 (PST)
MIME-Version: 1.0
References: <20230109092617.80224-1-philmd@linaro.org>
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Jan 2023 11:06:11 +0000
Message-ID: <CAFEAcA-OZ6E5GdibDH=Fzb6dDBG4bSRU6Cx92HJKiXAcTxcqZA@mail.gmail.com>
Subject: Re: [PATCH 0/9] hw: Convert simple devices from SysBus to QDev
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jan Kiszka <jan.kiszka@web.de>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>, 
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: f+aFAbFaHS7l

On Mon, 9 Jan 2023 at 09:26, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Various simple devices (usually GPIO related) don't access
> the 'system bus': no IRQ lines / memory regions exposed via
> the SysBus API, no memory region mapped.
>
> To reduce complexity, remove the sysbus onion layer from
> these devices.

This will break reset for all these devices. We can't
do this until we've sorted out reset first, I'm afraid.

thanks
-- PMM
