Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C7DCA1007
	for <qemu-arm@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utYze-0001j0-Aj; Tue, 02 Sep 2025 17:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1utYzY-0001hE-2N
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 17:56:40 -0400
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <titusr@google.com>) id 1utYzW-0006L0-HZ
 for qemu-arm@nongnu.org; Tue, 02 Sep 2025 17:56:39 -0400
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-5607a16639aso1242e87.1
 for <qemu-arm@nongnu.org>; Tue, 02 Sep 2025 14:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756850194; x=1757454994; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Tah2V2riAE2Uqzf/WVMwVVg298L2YC/w51UexRMz0XY=;
 b=M7JixF6MZ7KOIIGU2MnGyW/dOJznv1C+L87FkoGhPId6RPiBEzsl969B4KFjCWtfeX
 FF85JMW5h/ZPdVe2QvjOuMIlwW1Z4/qa861+igqQc3Kyq6FTG+OkC8mZtQ9BvS8YbTvR
 Y3cNb4ugsDzENfw9M80I8m37p+vBYtinnlj3kizMylCNbgnPtRTSAWC7x6XcrZBoG+PM
 Xs5I/zXxe7PdcBOWcbPydznmOd9p5ILSFNMsh7yt8byqKK7mxbU4wUEl63IsxR+SgMhZ
 NPZSa5DKAYdpFqBNKEEnOajpNI/PRYUTADg4FHqQ7AAOUPUAi9W4JoSDltv3/cO3YTR6
 /aUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756850194; x=1757454994;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Tah2V2riAE2Uqzf/WVMwVVg298L2YC/w51UexRMz0XY=;
 b=XhCpf+MGC8L8f08gDiWSZWEdHrBIUel520NFvcbzHC64TmPgPfqvPIsnIvAsFZFESu
 03ljE2+1coxO861ei9tc5uzqVUQK3R+No7tPv+LK/cFdi4kiZXqBrzd9dD9UKfdOLVO+
 deUpYr/woMlmOgqsj/lwm3QzFqZWWNw2afQtrougdcWBjQxLvp1xZCIP6SNm9LHqrzeY
 xF/W1KgaRJpU0Ifkk25+wmyHHXpZbzx2ANEKN9B6+YiKVSbg0438sV+Sdfq3O9NoVrmO
 TE77QJNSEVDJiqDGj9D7qqzPF+1pl3a5ygUudvhqIjQtfuHfANK2LDMjEtke6dbOTJi0
 DqVg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWX8wGyE6yhdAN1vX8frMLg+DN5Ln/Qq80OtkKii2+6I/5qUsmguhUMTWJJQwBJe/M5K8QUmAzbMg==@nongnu.org
X-Gm-Message-State: AOJu0Yy4CTB4P3fLEF6Ro1B5xLw0ylUcu49VCLORTnTIUEOe+Ac+ctRw
 a4sNf9O0UPZBjGtUbJZU2fQR28+ThApA/4W+Opsm0sgB2fJpPG8BRXYxK/WuDyPNYA1lPTkDyYD
 POkBGmXHqd7kFe/iWf0y6tj+/Kq/RT2QGGm3tGybL
X-Gm-Gg: ASbGncsySbAyzN4lYfnjCy8eX7ilJwCauQz7+U5UtoQ/vDFhZakRtNuHVTqfiiM8vkn
 oSwFT4KJurSf0OE+eiaVVP8HQIk8NW08p/2VPN/ZkFRN+N2iUH/ISlIJ4BRGdQDwKDPrjBQuA1i
 PaSeNhcY7Hw86a1QHAlwflpicvblppz4npDczqQ4vDG+50PYRC7EKAxbtS7lbUpiUQa+cunjHIz
 81QfKXfnSOqgFtwxnOHJGp6X1+jWiTzul+CfQ/5lNzwcu3+NOxfbvRMTPZzr21ADA==
X-Google-Smtp-Source: AGHT+IEvE1lU4welKEar8+/jKqhBXu9NpWeN5jZrhcfEGxLctYIykYVql4WzHB3B5791H9a6bqN1vafou/PhCucYPUQ=
X-Received: by 2002:a05:6512:1050:b0:55f:6ac4:c3b2 with SMTP id
 2adb3069b0e04-55f6f26c598mr904864e87.0.1756850194343; Tue, 02 Sep 2025
 14:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250902215320.1455816-1-nabihestefan@google.com>
In-Reply-To: <20250902215320.1455816-1-nabihestefan@google.com>
From: Titus Rwantare <titusr@google.com>
Date: Tue, 2 Sep 2025 14:55:55 -0700
X-Gm-Features: Ac12FXxhw7sMDjxLLh-E_PB9K2k1eaPSHP0Frgx5V-6Eygn9TYlOs_K6EO7xDRs
Message-ID: <CAMvPwGoQ9QgwG_CZi+3CZbVp84AYj4aSbcwKnuisze477gcKOg@mail.gmail.com>
Subject: Re: [PATCH] hw/sensor: added MAX16600 device model
To: Nabih Estefan <nabihestefan@google.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, pbonzini@redhat.com, 
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 farosas@suse.de, lvivier@redhat.com, qemu-arm@nongnu.org, 
 Shengtan Mao <stmao@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=titusr@google.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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

On Tue, 2 Sept 2025, 14:53 Nabih Estefan, <nabihestefan@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Change-Id: I5947e071fc27fd0d01c2d365545a81fda8131d32

Please remove the Gerrit Change Id.

> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> ---
>

