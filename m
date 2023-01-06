Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp394224ejc;
        Fri, 6 Jan 2023 08:08:17 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsg+ZQGcDaYiRBA8pCWYi7sPoof45E5+wM84Zum0abGwOlgNOZhVNqi7T+eTJOZaOtk5Kkj
X-Received: by 2002:a0c:f30a:0:b0:4c7:26a4:9099 with SMTP id j10-20020a0cf30a000000b004c726a49099mr84715705qvl.52.1673021297073;
        Fri, 06 Jan 2023 08:08:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673021297; cv=none;
        d=google.com; s=arc-20160816;
        b=PAjypMTLPalPl1dr8oFmm5YtI0l6diCgY4I7al7MDdtU1iCkBQUa37SnYlDxIfXu2F
         Z8I8a4vVtc+ApYroOUZnKPgRMPWRZmVQ3Iq9b5yLh1vVPr9sUeaEXJ2sGyF+fDpX/5/O
         uP0nMvPXVT2hinywJDOkcFCmjgrlPnbI7Uy0bjt9rVrZeWllOVw+mbBGH/IRr9MoR0We
         gc1+53dlunb46ngHNpkhQp25+DJywjz+VK1HH8s75uiwuwfU0bKc0ap1N4+gHwNiZSFV
         bijzBNZTKzd9EIvEhKfU6YA+0B+Lrsftwx7HaEFU66F8sZLheDI6ywEt5UQjMBXFTGvG
         tQxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=RgmtWPPr1d7crRdwnC6Mc08eBHGHpiQuFlj7p4O4+0E=;
        b=cNb5BcKtZl8TqFOJ0NwiHR5ey/41qTiB86maxvWQOboSX6357mHf0NJKkSq6Lq+C5D
         htO1SedKOtdvEtPWKIac/0lvPZiWGQfJUgDjDypYYmWAmIffBcRR+uKtRNNLCdCp2/cF
         kki8byKhBiZYEod3498zcZPVHh7NFo9Bn6SmrJFz4PV0cVT8Z1mNX8lXF3s8urYo/PdZ
         bRZFiK8owmS4fw/A4VwJ/9e9ccSu6uYPff9su/kia8XzC3HhYFzPD5aOob/c+Nt9eWh5
         GM5XeMTE7W/TJkCmtvafEjA9C1v02mj+Iei5uC4NmvT52TNAHmY3QgXW/O5nO7PjMfE0
         dyqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X1LNwI/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id im8-20020a056214246800b004c7047c04f6si809819qvb.127.2023.01.06.08.08.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Jan 2023 08:08:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="X1LNwI/6";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pDpFe-0002dr-3d; Fri, 06 Jan 2023 11:07:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpFc-0002dS-9v
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 11:07:24 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDpFZ-0002sn-VP
 for qemu-arm@nongnu.org; Fri, 06 Jan 2023 11:07:23 -0500
Received: by mail-pj1-x1035.google.com with SMTP id
 o1-20020a17090a678100b00219cf69e5f0so5598596pjj.2
 for <qemu-arm@nongnu.org>; Fri, 06 Jan 2023 08:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RgmtWPPr1d7crRdwnC6Mc08eBHGHpiQuFlj7p4O4+0E=;
 b=X1LNwI/6MuSYf6wnbBZFx9LFJ0vm1J+7WR9MvpPRzW1P3ttayhnhkp4QkTMX8Vjdpe
 lUOP6gq7L6atlNdeBr158qk3EVvXTX1INH+dpVFhZFljazZ+71Wb+Fs5+aZ1hFlSc9SH
 sDUvj7Qefcp/S+6IS6pm2rXjwc70MAzYC6lUuoRwCmuUKTxx3qwZERXqSCpyFySSTLOl
 n+BF+Huc1iZ0mklWlTiiwZWYwrp2pupAMvGqRU+7taYlerrdvKCd41OoiyYSN4pek8Kp
 OiN/y0ynMoRo5ooV9CQ+2GNkwUwFtAqFAgxqUYyuFJHjNPRy+Ow2gRfh2AhsDh2echgE
 Pb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RgmtWPPr1d7crRdwnC6Mc08eBHGHpiQuFlj7p4O4+0E=;
 b=7mUt59Ya4nn5C6B49wjfpq42vHiOJ4DcObr4S6SQ8JjIvuvc8CgnGjrzcCXOtWHNCp
 f4jfQLRKL5gOhrxe3AtuUEdlRm6+TSQMwdnCIwv6/ytXDBq218T8Q6PbxCMc/obxXu7R
 BMANjJchMBYEmFajkyBk1m0xIH0PxHKKii+zMu6OR3UhrZ2fY6uMQUvez9XDiOfnKkg2
 nHG3Cr0SIBWLIKVhv+vcc1as4kQOu43NCiSWbLsmk6HS8gVuM9Z7qLq2iUoyxc9RxqRz
 SX3A+sv8938QbTG/JXr7g54UCxVYdy3/1HwdGMYBMJG4kEsyvmJ3ITA8+hSKNcPCkeJy
 /QwQ==
X-Gm-Message-State: AFqh2koGm4xAaOQlqM/bYxBncHG/WgPmm12POGpYAi8vY6kQkKHzGDk8
 6bb4Nl3TQSxlCZKHaFgy6VWL60SQweqUqZC67HvIoQ==
X-Received: by 2002:a17:90a:b010:b0:226:b783:67f with SMTP id
 x16-20020a17090ab01000b00226b783067fmr712951pjq.215.1673021240416; Fri, 06
 Jan 2023 08:07:20 -0800 (PST)
MIME-Version: 1.0
References: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
In-Reply-To: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Jan 2023 16:07:09 +0000
Message-ID: <CAFEAcA_a=B=BGdCgJL-owidGT1m8fpLJ1aw5wK1aBiXK4ZV4-A@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] Enable Cubieboard A10 boot SPL from SD card
To: Strahinja Jankovic <strahinjapjankovic@gmail.com>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, philmd@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1035.google.com
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
X-TUID: xoUA4sOf+lUB

On Mon, 26 Dec 2022 at 22:03, Strahinja Jankovic
<strahinjapjankovic@gmail.com> wrote:
>
> This patch series adds missing Allwinner A10 modules needed for
> successful SPL boot:
> - Clock controller module
> - DRAM controller
> - I2C0 controller (added also for Allwinner H3 since it is the same)
> - AXP-209 connected to I2C0 bus
>
> It also updates Allwinner A10 emulation so SPL is copied from attached
> SD card if `-kernel` parameter is not passed when starting QEMU
> (approach adapted from Allwinner H3 implementation).
>
> Boot from SD card has been tested with Cubieboard Armbian SD card image and custom
> Yocto image built for Cubieboard.
> Example usage for Armbian image:
> qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img



Applied to target-arm.next, thanks.

-- PMM
