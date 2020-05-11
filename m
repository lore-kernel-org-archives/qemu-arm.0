Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp47003lfb;
        Mon, 11 May 2020 03:02:35 -0700 (PDT)
X-Google-Smtp-Source: APiQypKCmdvpDMWwMtss4w+bY8YmsnPhRNiTUf6RaMPCSWh9WtM0K8y1/E83YASIwd3sZYCDQafa
X-Received: by 2002:ac8:6642:: with SMTP id j2mr15484840qtp.158.1589191355554;
        Mon, 11 May 2020 03:02:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589191355; cv=none;
        d=google.com; s=arc-20160816;
        b=0LzaC22M+LEzlP/l+eGUCA/ZUenDbOqZx2rz/BkhYRoydaHwsF0QArj90ZhJGBcQYL
         CBwurbYy/F+Tf/scvXjTZ2kR1jbb0+erAK+S5kRdVnTsTgZw0CuDj0JJXLS61UMWc6qE
         95w/Jy8lkpHhrp3yXrIbIO68c34AmRTSSgUUuCp+MfoFgHpxcqsmJ8UFpAbsptfPmETf
         Zqp+irzMMDlZPTHZ2dq5VOaXr6GjhU0WATG3aCb7qXTee+h725FpmgPKFgj6X++8+FUn
         Em19+QSGfN6msDbh+38q3e7qBOu9COoqoDgsNuxcjmow4oIML3G/sxRsWHhuIIxak1se
         h5Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8UekYAM1/5RxUAc4jSid3+PRVfxCfJKQ6eC9ocSSB5g=;
        b=p9yQgY7GLO5uUAErmKim91LS3iQ2BE52rlCKitQFI5rnSDEh51L4+fhGDkqwkP9EiU
         9Jk/KrEmHw91RdNF+EL5EFmyxn8r3zh1lVtB44cfRDckRF8kNnaOr/ZBrN5DSOZ8dXNb
         vNPM/hrqTxrIQ/maakbV9wfaXvtGcWWEngrM8umwGTfLqqq0XLqFZiOGnybVhLAuukZS
         QJZACJ1KlJSfcep5lEJIpobzElOcYmyT8UN3yTPd4eM2rmo2eb33BmZCmKUFuZYi17uq
         ZFGCZyScMwkmPTx86Aps4uFNvd82WsTtx9QAK3Ld8jcaifjC47pn3alCb+78w6OMyX5A
         oy0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Nn/co+0i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si3229437qvz.15.2020.05.11.03.02.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 May 2020 03:02:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Nn/co+0i";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jY5Gc-0002bG-Uy
	for alex.bennee@linaro.org; Mon, 11 May 2020 06:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY5GC-0002Zq-Qg
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:02:08 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:36334)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jY5GA-0006PA-QB
 for qemu-arm@nongnu.org; Mon, 11 May 2020 06:02:07 -0400
Received: by mail-ot1-x342.google.com with SMTP id t3so7061035otp.3
 for <qemu-arm@nongnu.org>; Mon, 11 May 2020 03:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8UekYAM1/5RxUAc4jSid3+PRVfxCfJKQ6eC9ocSSB5g=;
 b=Nn/co+0iDbXT/X+Mq1a5m1GL2v2tRT40ULEEWSdEaB44lvOX/d62WfV3IK+rIEP2Ld
 YFqSNuLlZn87MBbnyViWXh3D+kohM0BXSLHs5m+ybcIJr3L2CKwxgHOz9XAq+7Z5cTQm
 a0PIXMdiIOs5xuAChUl232ifchg/nlVef2OraMfokS8tqob1ajFbfrad0hYJ/O2SsqMx
 IDNQsxHRsJWeYMNRUmWDDvKPscn9A5W+K03QvBIU8r4T0ZnyOgTn5zbSRDPubUhpO+U1
 1nktZJ6MEcEXsRlxzXHzogQhpDLdB8zQF39QzTmNCHN1/B4UlXx3T5/8A0PpXPJJUk5N
 tRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8UekYAM1/5RxUAc4jSid3+PRVfxCfJKQ6eC9ocSSB5g=;
 b=avsO2ClXqPoIVuVGr35VUtqzu6Gz2jlOA5PI+V8q7yRVmpVPo/M6xHNNrR8spAGl64
 F6DmZ6QPfz+2m8dWzBFydYLcI/S5IqDnCc1/sTOo6HRn5nXT51w17xecTA9iIPa5xSa7
 FrwkP6WQ1gNPKxRx/UgAAtXE8jvB2Noej/4iliy/GwwSjPquVj3jskbjKIS/sHE3TF/K
 FH2Oq6tG6S3Swelc3pS/NlgNN3Mz8m0kJ4w8nNSxrBMHh6qotvOYT63zA1foHJE4PSpd
 kzH2mmr6AXuSiVAgQG78EYw62rqtt1WQEudth6mdjt1Xevd9CnOAm/skQJf82nKuOO4E
 Fs6w==
X-Gm-Message-State: AGi0PubyYlOVC4oCGrVrNtbFkPANq1t3RKbAdE5AtXqVBI63wYK+vUW/
 eU7fncBo3fSdIzVQEtvouXSbRC66yajp/FnMs5WAFw==
X-Received: by 2002:a05:6830:1e4e:: with SMTP id
 e14mr11801230otj.91.1589191321968; 
 Mon, 11 May 2020 03:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200505090136.341426-1-joel@jms.id.au>
In-Reply-To: <20200505090136.341426-1-joel@jms.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 11 May 2020 11:01:51 +0100
Message-ID: <CAFEAcA91CuKCL0v4U3eKjmc46eyM4bsBfk41ZYzUa61-Y09fXg@mail.gmail.com>
Subject: Re: [PATCH] aspeed: sdmc: Implement AST2600 locking behaviour
To: Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jkQlyxgvu9dP

On Tue, 5 May 2020 at 10:01, Joel Stanley <joel@jms.id.au> wrote:
>
> The AST2600 handles this differently with the extra 'hardlock' state, so
> move the testing to the soc specific class' write callback.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---



Applied to target-arm.next, thanks.

-- PMM
