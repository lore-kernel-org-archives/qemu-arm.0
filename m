Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp341037ejx;
        Fri, 18 Nov 2022 07:36:34 -0800 (PST)
X-Google-Smtp-Source: AA0mqf65dxY4eQ5WSQoF+twmzOk/pbMXcZrAWpicPJG67WAnkBQzze/Mu5z/EFzoZy+eiE73eZOh
X-Received: by 2002:a05:620a:8009:b0:6fa:88c:50e5 with SMTP id ee9-20020a05620a800900b006fa088c50e5mr6155299qkb.186.1668785794225;
        Fri, 18 Nov 2022 07:36:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668785794; cv=none;
        d=google.com; s=arc-20160816;
        b=twfUNbqTszkd1tvnNFWN4/o/+0lZxMzZQLB+AU/HbWWJtWf29zyl66zdp/9FhXEErC
         XNao3ao/2plCgHJApy3tP38ef/XOu6C4D+64zmVWAFsy7Ph8aQ2ewsikM/wyYqAR8QE+
         8PfV0Xo1VDdeGHu9tT3c3msFyM3c0Z3CnFGuUEYynD7K8iuk77WB+yL8F+6HAB4INE15
         DJqgG8vf9Rw3EJaPdJyQJD7FSd+2v4gUTyupkGJPsYMb8rH8FXJU/kpMpiMdC2YWmhcR
         qgaXKKJth1biquHzSm3Ts6GkBeY1n9/H/P58wbLnJWQF+2Kx8lxdALqTP6/S2N9Eeizq
         DXIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ofhv7T5rhXIOp5AAOhVjXl1IVUWEWCNX6+KkF4r09pA=;
        b=xXMkIl9d1qCvpt8M2dDrPbV+0Wp0jjICEPHh+7iFZ7TLdadIpclYnJsznVWwIQuAKP
         SaOBqOUTBDj8KXhkykP4ia6epK/vyMg5kq2VrNLMFBKfY81c8EszNrFmQw2JhOe7LSE/
         xDw1+BnmOvlw1FOVrrUOsnoI01vDkv7zUDA9jU0bUaeGNEtM+Elgt0fBy9j9onpnZ6zk
         ueTQcEXFLUk4TvGFR/lEf7gp0jfQ+HIiOC02ZuE/vl0v7NufFPBXc8ju11dI+M8j0NIH
         kgJ1pzydE7yatWIx5gjl4pds/DTrududEyLescvb72eMAbNqY3grZOEyyvhGF7OLTbPo
         cMNQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W00/SdLH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id cd13-20020a05622a418d00b003a575a9bc72si2074894qtb.340.2022.11.18.07.36.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Nov 2022 07:36:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="W00/SdLH";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ow3PT-0001Fc-0I; Fri, 18 Nov 2022 10:36:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3PQ-0001EP-Fd
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 10:36:04 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ow3PP-0008Ei-1Q
 for qemu-arm@nongnu.org; Fri, 18 Nov 2022 10:36:04 -0500
Received: by mail-pj1-x102d.google.com with SMTP id h14so4804353pjv.4
 for <qemu-arm@nongnu.org>; Fri, 18 Nov 2022 07:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ofhv7T5rhXIOp5AAOhVjXl1IVUWEWCNX6+KkF4r09pA=;
 b=W00/SdLHKItRlMOEZ7/LJoibrwzguB+7x5Y0jAPIX5zpRyjfE3PCgIBhEepUQB/RON
 +uIJm16EbHWuM/zQQkGy2C98VSklS2av5XKsPcdjAw/rammpI5uHGtYPq1coMHYb1w3u
 XraCSX3NIRIeBKAq8GjYaLA4hpLdJkkOj9N+BgFAbpe9j4UeoSmz51PAL5UC7G0rOoIr
 fH5i/Fh7CpjecFYd/2sNlndWabAzfMztPMIstoN33+6URVLFvE7AEVvuenIcXRpRQ5Wm
 xnnjw4tbf3c9oCxoz1JZs4Xav+til7YmW2PvPXFN4gQWl/Rj1j3peAxfZPXjOiq/yUcl
 KABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ofhv7T5rhXIOp5AAOhVjXl1IVUWEWCNX6+KkF4r09pA=;
 b=hq8Pt+nSza9YNX/vHhUXcvFxbFK5ApHPmNpclfvQTQJca5mRP/JzzbSBjQHrKoDJaY
 6VK9W7zoqLT94QTuTMzQSwzL1GgNhwuDPYDBw3e8nQydaCdvsJ5YrF98zIggNzjvsGRj
 vdkvH1d9oZ9RPCsU/relNCt3BvYQpEktGf6J4p0/0buUc1MCf3fznbaZ6KS6Uf/9fMns
 64llsXrx45TVSb4pFrfqA15Leh6t8gxjHpcSrM4hzF1uRQOT6SaLPB44qLT6JQmX+DXt
 GVyjiCDufdexFZh990O5OlScRYonKgVVkE5L4eVQWw+tfwE92kP/PewiBNVUSASWEoNj
 Moew==
X-Gm-Message-State: ANoB5pnrKv1Q/Oqfs3b0KbV9GhdmxbD0u1hb47j24x55gAtrJtf4RTqs
 tert9Aqe6lZMMYzeZWBaX0mO4He4v7C3S0Rt4sjtXQ==
X-Received: by 2002:a17:902:b18a:b0:188:5240:50ec with SMTP id
 s10-20020a170902b18a00b00188524050ecmr8003733plr.168.1668785761140; Fri, 18
 Nov 2022 07:36:01 -0800 (PST)
MIME-Version: 1.0
References: <166783932395.3279.1096141058484230644-0@git.sr.ht>
 <166783932395.3279.1096141058484230644-2@git.sr.ht>
In-Reply-To: <166783932395.3279.1096141058484230644-2@git.sr.ht>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Nov 2022 15:35:49 +0000
Message-ID: <CAFEAcA9txkkRb3J8U+L=PsdiS+RzdScK7NYF4BUyOYff=7CGVw@mail.gmail.com>
Subject: Re: [PATCH qemu.git v2 2/9] hw/timer/imx_epit: cleanup CR defines
To: "~axelheider" <axelheider@gmx.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: vcMbwq4ug+RX

On Mon, 7 Nov 2022 at 16:42, ~axelheider <axelheider@git.sr.ht> wrote:
>
> From: Axel Heider <axel.heider@hensoldt.net>
>
> remove unused defines, add needed defines
>
> Signed-off-by: Axel Heider <axel.heider@hensoldt.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
