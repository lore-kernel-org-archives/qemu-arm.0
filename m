Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E2A3CA5FA2
	for <qemu-arm@archiver.kernel.org>; Mon, 28 Sep 2026 12:47:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xBAlE-0001nC-UG; Mon, 28 Sep 2026 08:47:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBAl5-0001mN-8m
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:47:03 -0400
Received: from mail-yx2-x0d.google.com ([2607:f8b0:4864:41::d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xBAl3-0002Ri-S3
 for qemu-arm@nongnu.org; Mon, 28 Sep 2026 08:47:02 -0400
Received: by mail-yx2-x0d.google.com with SMTP id
 956f58d0204a3-67408b109e3so1046015d50.1
 for <qemu-arm@nongnu.org>; Mon, 28 Sep 2026 05:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790599619; cv=none;
 d=google.com; s=arc-20260327;
 b=K6mMqCUZi+gDWUA2wO4hjiBn5MDmLWnY/yAe7rGpDKwbu7h8WL/EWW+2jASibUe+4p
 v7R2DDqXBo8rhWsKQ2Jp6xe1ARKf1LyJTvgecNFK8QsmVLKN0BYriZ/r3kfmKVI/Sny5
 ZwElY5SfBZGWxKpEtN3ZKjGI112Wi0rw2stNK3oYfKDqyJrXCYjgvld8ZuTd4AC73QGE
 RtqoFgIcUQbLQ6E8/FntizCeMhDVNw0nl0xhoGureZ15cy2V5sJfE+sfrLmUQ/MLL2yH
 sNDlgdYsJB38OxoMAyO7zI80NciMAqDyepLEorLK2I1s4AUFWSBbG8mzkQRYuIBqHY0O
 ISCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=1+VGnfe7ib3gQRob+y51DwBtrmpQpMtEkJB8abEMfHI=;
 fh=QaFozlaBnrGE9IutEwpriLyk4Fmfl3ElgT5QaUyhSqM=;
 b=HCNN0SCAUlVKTcUXPMQIRDK4VnIRFvOLDFeAegvJRfmzGqurXmtp6CsvexrmGovSGu
 OgM9+rBATZEg4gvJh0+dxzp6oqRsoYBuZfgRdnX1lJH5gZwYZW/EoA6eFmUGtZScX9QD
 3v9AH88dqkrUYHdvn3szODix+5PfkFWuHi8HDzX4lq4Q1tsG/Mo+3lTs/oVq0Gc6WnZ6
 JpHiDu/SC2Tc1qj1Y0+SlE7+6WoJ0Um4eT1TRPhI4SN+ZzkTCocPAzZbxqMiP1UABPUJ
 dtyoemASdeAmugeoWUW2zwWv0yyXWyEraWh5bUZfBLXw78tzO4Kwuf25NET2kTGrkUmK
 awPA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1790599619; x=1791204419; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=1+VGnfe7ib3gQRob+y51DwBtrmpQpMtEkJB8abEMfHI=;
 b=TTqPhQxKTHe5DMnnQAlI8u9yWG+m3OGO+lDEBm7ckCA81Vy0cSZPWciObuuotlS3R7
 3n9RDAJMDg2fccpxrUoMWPyJoK+U6pVj8TYZX02ALtYgDoCvhRs4w87ppc/ijtYGMJNd
 gVMEOO9VLS9xoRp1GuSshDEy77NPUQ2SUIvPZRlPUourokZqMa6Oz7IurukJ2Fog118a
 NB05RZjslL1rJyoEVCOhmdDN20Fv0e6psfj8xvP9TLI2bBOzgLiG5zWDPXmrFUGEP1VP
 g4SWIxobw/8Vq2lY1fnb1gEGGLM8PgKBqW+IgljjJJmLvJ6BfAKA6bjl0rxkJu8oTbOK
 yp0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790599619; x=1791204419;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=1+VGnfe7ib3gQRob+y51DwBtrmpQpMtEkJB8abEMfHI=;
 b=swGOqgQGXBehmahCCSN6mrM87Uyd55cSeMHWEHK4FIQBkFoOmY7okCtgcSy7yneF19
 MR7eypPZSS2MIiRpooOPa9RCExjMfHMtTF/v2OMzfj+dQUmplus2PNqphIUkRq8gCrnz
 08iBu1aEi5ljRTrGHgTIKByE3ZXGq4pXPKd0ZERM7aYEAbfU54OEMTm461KCN9jj6zTS
 fIZXN1T5NWPV8at7FImw8eW+Qlxfm5WGAeUFX/IvBwGK6M8qM4txwwSAOCM1M+UQE1Cx
 rY5mhAL/tX/BPxxOd/5DHDJ2vWIFRirdQTKyG1yNxa5IBOnALlMDSR5vCunQBm0SNBUc
 8tYg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzxaM0cxJN4l526jaP50EArvVQHqB4Sz4N5UaElLJ165Jh8I1hbc9am+Ph/CstWK3OK5PQYkT1s2Q==@nongnu.org
X-Gm-Message-State: AFq9FYKo6ngh9TuhN5Um7XtpG3Tk3bKI5xfwR88pQnj6YB+hNz9ol/rW
 7diWbSsRcS55T0o+K4pDcFm+H4a6ZfPPI0QGHt6JmgmCVH3gR3ScPUsQUGftU05aIHabTNNrhpE
 RTvVULG5BrFWo1BggHfXgH8JasHlqtu0ISxbuFqOGOg==
X-Gm-Gg: AYBFou1UtvhwWGtAaMM3DLaDJKZUBMnHD+D4uQPaThASqYk1jScCnH0ByJSf3ldUAHW
 IQeL+x5BumOuM8Y/sGDrwcPRnk0gD+OmHrkKguGg6oawNjHzK5wAWpYwkUaWJ1kF9yRoP1CjK9Z
 UcRJfRNbhpC4AVM8S5m9znOtA9WVvH4Wrngbw7yTig8ucAcyjgT7SRgAqatM68a17xA2Hi/qxKH
 20bn7sfdllji+146jEzhLqRohZnClmrihaGwQGmAlBdooUbTXY2RO+t936BkEkb5lpXWbXL/M+k
 jahPgBaqTN5pImxvOQ8jdHgB5FULO5ZwW/scl5TfcL416Lo/ewwc3CDvOIXLW8CCYnmLzVPrG8F
 ybAh3gkfIh5giM+Sj5Xrhu2bp+F7Xo+vp61pcs3E=
X-Received: by 2002:a05:690e:191a:b0:672:b59a:3784 with SMTP id
 956f58d0204a3-672f82be77bmr4530233d50.28.1790599619037; Mon, 28 Sep 2026
 05:46:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-allwinner-gpio-v4-0-b1ee1d09c9fd@gmail.com>
In-Reply-To: <20260915-allwinner-gpio-v4-0-b1ee1d09c9fd@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 28 Sep 2026 13:46:47 +0100
X-Gm-Features: AclHuK8MQJ5VUUQArtFEHdvd7zJe6_nFwFZL2uYShKGj2cKjGpMO_aiSMW2-jUM
Message-ID: <CAFEAcA9_=TV9xxkgBC+30xAtbqX9A9EJ8-1sO_ei9U1SB3qEiw@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Allwinner A10 GPIO support
To: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Jack wang <163wangjack@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x0d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 15 Sept 2026 at 21:27, Strahinja Jankovic
<strahinja.p.jankovic@gmail.com> wrote:
>
> This patch series introduces GPIO support for Allwinner A10 and
> Cubieboard.
>
> The support is focused on input/output and interrupt functionality.
> The qtest suite is also updated with tests for implemented
> functionality.
>
> Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
> ---



Applied to target-arm.next, thanks.

-- PMM

