Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94E71099B56
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Mar 2026 23:58:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w3jjI-0007rd-03; Fri, 20 Mar 2026 19:58:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <landonclipp@gmail.com>)
 id 1w3jjG-0007r7-4M
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 19:58:10 -0400
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <landonclipp@gmail.com>)
 id 1w3jjE-00008J-M1
 for qemu-arm@nongnu.org; Fri, 20 Mar 2026 19:58:09 -0400
Received: by mail-qv1-xf2f.google.com with SMTP id
 6a1803df08f44-89c452e9cc4so29906886d6.2
 for <qemu-arm@nongnu.org>; Fri, 20 Mar 2026 16:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774051087; x=1774655887; darn=nongnu.org;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ks57RW+en4ONWkRvCJOQSuqmXz/QxxnWhHRzvSJIgHA=;
 b=SRfv5CKPh+ftCShAcPzcQ/06iEKhs1fBl/NXlHkhQkuHpGrNeqDNAvKuGWUi1wSpJQ
 qxw1XOPV8ckZ+zcnVCq1XLwyMwRsXrOm/hEX25VIMUm9kJ/e1rGah6tg5woGJ85pFO10
 45zawzeDmeBHnHtc5YcLgYdjZwgLjrOE3ZUgZ9MkKMcNu/x49Og1H9w1NAgV0nbaIroU
 DuSoXLb+icZTCv8wgYNhvxVGYg8PlhDOG5NDhuIK4K6ZMx/UC+ncvjefdAMIgIRY7SXR
 fHwMIrPYz7mx9gmA4AMdOKlWeeo3DcdUwZe68Wh4lZQHojJeUZ6Ft6Unk2kxWaPSC1LJ
 XlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774051087; x=1774655887;
 h=in-reply-to:references:cc:to:from:subject:message-id:date
 :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ks57RW+en4ONWkRvCJOQSuqmXz/QxxnWhHRzvSJIgHA=;
 b=A5cpoWMJbEBW7oygApsHmcEv3DhzyR0qHnDsh9C+A2GGKRmVICYjvORyZ1ltDJVvU6
 VNbcA7L9zjW13QQESbGR8fTnVGbuVk4qay3H1WaQKIkeDhvySR3tb5i6gIznoYB5LXfX
 7mJINIdgA0nA4/HnoYwWpZnIsURL9Km61NOjNPZEIjVR9CQ7aKZ6a8yblyZU+eqTIL31
 OFJw/T1IfCyCibnmXsQRNEhVt3a4LOjXT9QUM8hmbXhyJw8PnBV9NWXCXEH7a8BRG7q3
 HyI6TPfmLmJkr2ier1Y9k7zC7SbCjR3Xh99f2U5mr1w5yVi0X665C/GaNLhmCaBc2qRw
 mpjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUKjGiUQnXiugjU98w1YKgaohPZb+IHdr4SUlZYjB342yWhiuh5w2JrG6ZRnV4pL3fKSciR1nbfw==@nongnu.org
X-Gm-Message-State: AOJu0Yx02Lxj7kKuoGYuOHRfvkbRYiRhFpOt6E1Z4XE5dPeMD5v5D62+
 d5riOw4Ssr3W76LUozXMWu9y2lp+7gDo/L303rQiwIbdhw3J7y7t5V8H
X-Gm-Gg: ATEYQzwymPeTm+wbjdLhEOxRJXVIt5W+kOCaoOuwJ7CQM6KFTdUHt9yz8wTQI2FaM1S
 PfXG0V5PL9T0y2S93gLF9hW8lh3IVgbF1hOfJK6Zl8Bu3pGAJf6vyofCAVhCSLeqwQG0zKFZnVC
 hTRR9QaRtIgnNVbawApjnNufN8JAkn7ADsHvQfuFIlKIrw2F1RrsTOETSd6gRgTc08SrfggooAz
 pVmfHYrhnl8R18t4I9KUTrWD13BulnQgJ1xRl5EkLGrGgsZ2QBQ+Aw/bsbR9KQ2ykVQJtUONauu
 wriD538NywfOBFWLTqHjGTcDO21WxPskBqO9zrgy+FW9irVnIs17p72UM/NQ64jJobGid3mJZ2w
 mGpQ/Y+HdblMJtlFdpMVt1x6fuRLbl12oF0xONd7mQoBP9r1OCc/iIhaGMMu+KN0W6NCjXGU1rA
 f/FyDm3t7b4lfcF35PQil5Ru/jR9nDqmiUyvqIv/eX1+dGJKhkyLe/4+SafTsBmQ8iadD9fs7QN
 zlMCEWsW6xwTg==
X-Received: by 2002:a05:6214:21c7:b0:89c:518b:9dbd with SMTP id
 6a1803df08f44-89c85a7e205mr83165526d6.46.1774051087345; 
 Fri, 20 Mar 2026 16:58:07 -0700 (PDT)
Received: from localhost (c-71-194-28-115.hsd1.il.comcast.net. [71.194.28.115])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-89c85215210sm31650716d6.2.2026.03.20.16.58.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2026 16:58:06 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Mar 2026 18:58:04 -0500
Message-Id: <DH80MH0YC5X4.2PMVY8O5WQJ8U@gmail.com>
Subject: Re: [Qemu-arm] [PATCH/RFC 4/5] vfio: No-IOMMU mode support
From: "Landon Clipp" <landonclipp@gmail.com>
To: "Landon Clipp" <landonclipp@gmail.com>, "Alex Williamson"
 <alex.williamson@redhat.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>
Cc: "Peter Maydell" <peter.maydell@linaro.org>, "Auger Eric"
 <eric.auger@redhat.com>, "Xiao Feng Ren" <renxiaof@linux.vnet.ibm.com>,
 "Arnd Bergmann" <arnd@arndb.de>, "Alexander Graf" <agraf@suse.de>, "Magnus
 Damm" <magnus.damm@gmail.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Wolfram Sang"
 <wsa+renesas@sang-engineering.com>, <qemu-arm@nongnu.org>,
 <qemu-devel@nongnu.org>, <linux-renesas-soc@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <1518189456-2873-1-git-send-email-geert+renesas@glider.be>
 <1518189456-2873-5-git-send-email-geert+renesas@glider.be>
 <20180209085024.004b6f9e@w520.home> <DH807PW5SQCW.3AA422QQRGVAH@gmail.com>
In-Reply-To: <DH807PW5SQCW.3AA422QQRGVAH@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2f;
 envelope-from=landonclipp@gmail.com; helo=mail-qv1-xf2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

I don't know whether the threading will work 8 years in the past, this is t=
he
link to the original conversation:
https://lists.gnu.org/archive/html/qemu-arm/2018-02/msg00226.html.

Landon

