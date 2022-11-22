Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp3530385ejx;
        Tue, 22 Nov 2022 10:27:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6FC55ltEPIJECi2ZXZfNGh8kjU5KUkTFlLOQm/ADZNsufXQq0Z0qjHTx6ChIVJWsw5dzyM
X-Received: by 2002:ae9:ef93:0:b0:6fa:8a0c:ff59 with SMTP id d141-20020ae9ef93000000b006fa8a0cff59mr21875786qkg.785.1669141629707;
        Tue, 22 Nov 2022 10:27:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669141629; cv=none;
        d=google.com; s=arc-20160816;
        b=lnxC5UaDXJwc9/CZVKnfkhbTlhi0nOdP0lbJiBv7iNjkaAMKkAgoAKqj1n6A1QAjmR
         OjCR7N5rEGgWdDBtDHwHMLkC4nbxcVCyX96CpgbbTS0dzdZgth+mrO/vEkJeD6c9SeM3
         GnoiAj4qSH8VmAABBR93dx568r/vNUIEJl6/8/3eBgvt3AFLJFE/2V69wRcnWkYuTkxO
         jaAJRFui/1XFYBfBGAirWRU9fAh+yuOMdN2gderXPRKt0MA+Lf83DzKd+ab13cJTKsX9
         sn4FPur0nlLrx3OTLT8fUTFNBVwfuMpmFJYtKfNL4uwtKpR9ExW0/f/X1JhigSXdGiSx
         AsAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=14pywuwH1T0Z1TFG62pzJ880c2fj33OabHssQ5MWNgE=;
        b=I6GSTayw7wuif5JQCUjd6zZ+RnlDeyFox24G90f4/fuJCXrq6TIOH5BYZXNEMN+zHG
         1gLrPEiTMFllxgCu2/AO/dSXB33KgjMRuHdoLWaSp5RuekAwLxoDTAivykPV1Da5H1IC
         /B327X5Kla3tx7nBNK2Y//bUCpab390nUPGqiwYFuXNjVx5/+/72gxWcePLKtUOe/zq9
         cJ9BN3156CffmCVyJv/M2D40Z55HdBflUroQr/1JxIdzIYxAmxqEqo6sS6gcnA6Jtnmr
         fvXkmI8lfl+GD6v5qYs/2i8smWSAayKvileiQrMCqa8RP0X8VniimwDiyiUWpiqEh0h7
         8XAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZ91z5XO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r3-20020a0562140c8300b004c642e8b272si2229206qvr.558.2022.11.22.10.27.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Nov 2022 10:27:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kZ91z5XO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oxXz7-0001re-5d; Tue, 22 Nov 2022 13:27:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxXz5-0001qo-2a
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 13:27:03 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oxXz3-0007Je-72
 for qemu-arm@nongnu.org; Tue, 22 Nov 2022 13:27:02 -0500
Received: by mail-pj1-x1032.google.com with SMTP id g5so5444469pjp.4
 for <qemu-arm@nongnu.org>; Tue, 22 Nov 2022 10:27:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=14pywuwH1T0Z1TFG62pzJ880c2fj33OabHssQ5MWNgE=;
 b=kZ91z5XOrPqvjbaMDwOV4k3ecIH3iaTAkGE74kxOYoEeX9QErfufX/sNmhx3aBQ95x
 Or2qpM/oTx7OOoySXNHoMnRbhRZvgu8Oe5iySgV5IIyJXyxT/NeiOspqTzI6nd6U/Gs5
 JWUlJa1NESX/BVyC6uF5nLqEZ5YXtR+4kwszU8djzZ75udHVCKVs90+EV+uGFzBYaZ0R
 aEOJUdjXo2+sEDuSxblTv+/JL45W79HFz7+8EozOrEroXLI4Uiz4YX28IPT5FkqRZlU+
 CeFsHubObcCPzg2WnZuSpMA+7IETnjLTAFRzTFpNhZV9pLUOiS8FLwcVPo5tbmRw5E9w
 jSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=14pywuwH1T0Z1TFG62pzJ880c2fj33OabHssQ5MWNgE=;
 b=HwcYCHjGLNuPuf3Ub2ujOJHmYI9t5xP14Rxz/i6mXyV0ZM25mGnSs/RB6znG4OB4ng
 7SZqY5Zhp5WmDZRKVukvwSuMTNlOJW9vm0xDP4PFXXbje7wd4yhF6itY6TF65nU3WT0g
 n/+uQc0d45aZ6tBDANhINbECLk+9NwGt9X7HLBAw1GWHhIn4CFgn9hszNpWzRgOvFqvb
 VGuxOPDOv0DKvRLBZbqA+tqfmFX4LOmCpd70uaGCO1cW+WxIT6furLK3PnTZal9RX9/4
 2BT87QyweSa6552WWvBYuSw2mGWtksOrnSSDyhNnzgH/usKpPxHTQjs9uGPAajIIv9ca
 53LA==
X-Gm-Message-State: ANoB5pnFAo7h4y+/S4xbc9FNNpeszV+mw/BKcHxxchDYlX00dXlYt43U
 t69UpiawAI3BWKkWjUBgs2CXMdwBjlZAFD/DOFdjY7Lvztg=
X-Received: by 2002:a17:902:6505:b0:185:4ec3:c708 with SMTP id
 b5-20020a170902650500b001854ec3c708mr7961391plk.60.1669141619714; Tue, 22 Nov
 2022 10:26:59 -0800 (PST)
MIME-Version: 1.0
References: <DS7PR12MB6309CF26249A273C1E2A6AAAAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB6309CF26249A273C1E2A6AAAAC0D9@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Nov 2022 18:26:48 +0000
Message-ID: <CAFEAcA85sSz3bvAvz6XLqa4TxBSgYWRG-oXTCr7Q4tNYRk+GEw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: align exposed ID registers with Linux
To: Zhuojia Shen <chaosdefinition@hotmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: VQDkhK4O4+7F

On Tue, 22 Nov 2022 at 03:05, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
>
> In CPUID registers exposed to userspace, some registers were missing
> and some fields were not exposed.  This patch aligns exposed ID
> registers and their fields with what Linux exposes currently.
>
> Specifically, the following new ID registers/fields are exposed to
> userspace:

These changes don't quite seem to line up with what the kernel
documents that it exposes:
https://www.kernel.org/doc/Documentation/arm64/cpu-feature-registers.rst

> ID_AA64PFR1_EL1.BT:       bits 3-0
> ID_AA64PFR1_EL1.MTE:      bits 11-8
> ID_AA64PFR1_EL1.SME:      bits 27-24

.SME not listed as exposed.

> ID_AA64SMFR0_EL1.F32F32:  bit 32
> ID_AA64SMFR0_EL1.B16F32:  bit 34
> ID_AA64SMFR0_EL1.F16F32:  bit 35
> ID_AA64SMFR0_EL1.I8I32:   bits 39-36
> ID_AA64SMFR0_EL1.F64F64:  bit 48
> ID_AA64SMFR0_EL1.I16I64:  bits 55-52
> ID_AA64SMFR0_EL1.FA64:    bit 63

This register not listed as exposed.

> ID_AA64ISAR2_EL1.WFxT:    bits 3-0
> ID_AA64ISAR2_EL1.RPRES:   bits 7-4
> ID_AA64ISAR2_EL1.GPA3:    bits 11-8
> ID_AA64ISAR2_EL1.APA3:    bits 15-12

GPA3 and APA3 not listed as exposed.

thanks
-- PMM
