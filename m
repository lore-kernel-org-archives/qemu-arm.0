Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp345587ejt;
        Wed, 14 Jun 2023 15:10:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4b43Yxb1bzO+6DO3Z91eswV22jpvMzXySxmNgqIsHf5mGbU5v4N9FIQfzYfoV+YdA91aV7
X-Received: by 2002:a05:6214:20a2:b0:62d:f25d:e55 with SMTP id 2-20020a05621420a200b0062df25d0e55mr7350585qvd.55.1686780617567;
        Wed, 14 Jun 2023 15:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686780617; cv=none;
        d=google.com; s=arc-20160816;
        b=tYdx2tniqleRMJ7kDy0zLdrk3qHc8Hi3uThJ1V7HPPg/u/W8nqNLOXYuIdEg3Llf4V
         I3CcI+qUTBITaifPijaLbi0KdjV5bnkd0BJPJliQBmu9+RTFrYYVRy4VBeyd4LrE/9y9
         9PqSnBAQyyVgdi/KJqoFDg8zyhOSh0a2t5F3SHDq851wETUmHZazgkNO7UnDpN+OXqnj
         ywFGSX/XPyG05vrE/wyBk8XB3VNpQyLtMIwhZk8TRVGTw72cBmmcra5JOBDDZL38FQQ+
         dP+J7/pmHrQng/JMCn7U7KXTIowPqeIneCO+Ix2T485IoA9zdl1BhXlUmj2n/ee3yvyT
         OUNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:feedback-id:references:in-reply-to:message-id:subject
         :from:to:dkim-signature:date;
        bh=IRFyDQFMpbui5QrZymgWx4uYDGbjgkC+EPjWaE6dThE=;
        b=EJbMMJ04oqU5xushOo/yCsYRACIPPMspnK3gYDdxG95nNmGpZ+01UK4DM38WAnWj89
         ArQcjkB5AnXTD2Fw3UZiL6f1WnQ+vcScuq2eJN59l9NQqCaPf0VgTNFqv5lFrUPBb5Vy
         8TVOqnbJJkQ+TvsRGbWCJfHBLWeByV0c9hqnpuyThXot5EOA4YzjBubjWCKnYerXw7Vc
         sot5vNOeKdMWM/oV0pLWjd3PmO1DWC8RsjU80fWPKhY4WK6pzTgRIoSm5zE8TCqXNZUD
         Apayv4g691bg/C8DYemor4Sv1A+iauvHaIqbcjPYq9sJoDwev19l7XDt/6wPj1cj+oie
         GEoA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=iXOStvvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 14-20020a05621420ee00b006262e2d208asi8944842qvk.534.2023.06.14.15.10.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jun 2023 15:10:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@laplante.io header.s=protonmail3 header.b=iXOStvvG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=laplante.io
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9Ygn-0001C6-Cm; Wed, 14 Jun 2023 18:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1q9YSZ-0007ai-6O
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 17:55:23 -0400
Received: from mail-40136.proton.ch ([185.70.40.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@laplante.io>) id 1q9YSV-0000qg-Sd
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 17:55:22 -0400
Date: Wed, 14 Jun 2023 21:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=laplante.io;
 s=protonmail3; t=1686779717; x=1687038917;
 bh=IRFyDQFMpbui5QrZymgWx4uYDGbjgkC+EPjWaE6dThE=;
 h=Date:To:From:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=iXOStvvGEJhT50JI8K/TRkoto3KzzWZHKUOwr/IG/2VAZbOBXT32MLwXV+zi52HyL
 BL378AeglepvLXCjNrxyENeFo0388pxrRxgzMsr2VswhBt0EVWZtTiCpeND9h77ucf
 nGSp3WwE/YkiEiiSaxhnn6DtvVIETXBN6wN52qsVYCKIUZ0cfRJCNxRSfXmlQ4cZNt
 FfiZhqFPkJxW9pBMXK0aW8Q9cONPTiBdBD4N5z+U1jQBK+8pUOzhuQd/JjqyW9l6G/
 X8CDSyBKBcvPRXrrQuvbF/nuSHFqXJVeNyn8/u4atLYPvc0Af0TRS9BNmUqsX1PLHN
 cLtESnv3Kh3IA==
To: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
From: Chris Laplante <chris@laplante.io>
Subject: Emulation of 'System OFF' mode in ARM nRF51 SoCs
Message-ID: <izD6sAXWpYfpewN2jyWfMdg0uECGzn_OPIfdTK8mA9r_FnyDJUOiyKrESjRg0NIIqtS6H5jsajA8sdLwMP2MY1k7asGdG6SfsRfxhCdgovU=@laplante.io>
In-Reply-To: <j6_NJPGssQ1eBAedcPGs0eURXeMcehbzMcwJtaGvzN_FdUbQKyTP1cyEJWC759G72UNSVpX-QmQ4u6iJvZmt2c_vRO7rhryDQs9icVy5iEI=@laplante.io>
References: <j6_NJPGssQ1eBAedcPGs0eURXeMcehbzMcwJtaGvzN_FdUbQKyTP1cyEJWC759G72UNSVpX-QmQ4u6iJvZmt2c_vRO7rhryDQs9icVy5iEI=@laplante.io>
Feedback-ID: 43500449:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.136; envelope-from=chris@laplante.io;
 helo=mail-40136.proton.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 14 Jun 2023 18:10:04 -0400
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
X-TUID: ieLQj3h60CpS

Hi all,

[I also posted this to qemu-devel but should have CC'd here too]
=20
I am working on improving nRF51 emulation. Specifically I want to implement=
 the special "System OFF" mode. System OFF is a power saving mode. In this =
mode, the system can only be woken up by a reset or a handful of peripheral=
s (most notably, GPIO via high/low level detection on configured pins). Sys=
tem reset is triggered upon wakeup.
=20
I've been digging into the QEMU mailing list and source code and have come =
to the conclusion that deep sleep and low power modes are not implemented. =
There seems to be support for turning off ARM CPU cores, e.g. as used by im=
x6_src.c. But that doesn't apply here because I only have one CPU.
=20
So ultimately what I think I will try to implement is what the nRF51 refere=
nce manual calls "Emulated System OFF mode". From the reference manual:

If the device is in debug interface mode, System OFF will be emulated to se=
cure
that all required resources needed for debugging are available during Syste=
m OFF...
Since the CPU is kept on in emulated System OFF mode, it is recommended
to add an infinite loop directly after entering System OFF, to prevent the =
CPU from
executing code that normally should not be executed.
=20
Does anyone have any guidance on how to implement this? I don't particularl=
y care about fidelity. As long as a GPIO level trigger can break the CPU ou=
t of the infinite loop (which the reference manual tells users to add) and =
jump into the reset vector, it will be good enough for my use. I don't real=
ly care about masking out other interrupt sources, for example.

Thanks,
Chris
