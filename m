Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 897FBC5DF66
	for <qemu-arm@archiver.kernel.org>; Mon, 17 Aug 2026 15:39:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvzQK-0005WL-Q3; Mon, 17 Aug 2026 11:38:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzQB-0005Vp-9f
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:38:46 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvzQ9-0000QL-PV
 for qemu-arm@nongnu.org; Mon, 17 Aug 2026 11:38:42 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-66c5101a984so2599628d50.1
 for <qemu-arm@nongnu.org>; Mon, 17 Aug 2026 08:38:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786981120; cv=none;
 d=google.com; s=arc-20260327;
 b=BlOdPkd/U25dYvi/DhigL8Ej+VXzUXuVQC+64WNFg8eASGlhebolbiiKuPfQBqzyue
 9CK3FSbl5S+BVcau4POncEEQARHLKN0M5HILRCRbHp4xtfM+kbTq6xAYDlPFAgPQHn64
 bpnHqJ86ls60+Kw2ePs/JzRcRRCLcrhesCb3sXXcmceL6p/iVldQ+hQ5myzTSz+A2mmT
 EC0HMlDeuH6oBpJGuK5B89wKJy/3uJ0jW/0jSDcu4hSCNzkDz/j4Zgy9axeuPcDwLnDY
 zKuenb0hED5flQv2WUD2ZVbGX/xcN2LdgpJCf+K3wYrLfhktY3wyw83oNoQ45WZYCUoH
 0CZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dTGABPubG33espNLne7rRiXwrTKCCeyueuBOeukfXk4=;
 fh=L9qWVYOkp+L6SSWxSZs+EhulRbbU4UuvTSb83THOG6k=;
 b=fOyNIcH6dwBaith173gmn1SqXeQb8ilZG+EboBuWdLrxNiXelteOlQN2kApWSFYhh5
 JbQUaPfg2CgNjt+1B30wOmFuZnEzbSGiwRPS3+fxPk87WnHPL+icbkDluFUBAqeiUD+l
 ru0frPJ0rZNf6Y7QV4jEvpJYj7aoiZNJNYP4DtO0Zn+2uOjoAwqTt3liytq0ab9n/ZrE
 sRY0P3+oQJ6fOWSAzv2NbyLRAFpMm4lBoa6wFTZggCvb0e1dweXEY+RkUlUKmobY7Puq
 WeY9eYY/7WFtg4S2Ua5LPDoTI+2NR4uhK5p457c2AfVRnvHtACE9ijDSiuFCiK+Dc5E6
 RbUw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786981120; x=1787585920; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=dTGABPubG33espNLne7rRiXwrTKCCeyueuBOeukfXk4=;
 b=UhR/LpbKq4xgmUxxjiAXRYn+ZvAXg3QRPaqBe5iscBtJ3qQ2thwMLfdJTmFUOw8j+U
 Mnr69Xz1MPC6ubRdazLNkZPJbxvZhmx/+ZLJWJSZ/pdXVXf7kmYPxc5LWm2Z1Mbk3jSi
 +rl33g8m2a8iI/qsqE/mFC6edDFlzYNcb/M/3/ierAxYunPMMQ+76tb/pixklaw3t7tx
 48bvTLiq17l2SOIFS0tqpyiuciZdHc0t1oI+5qO1GrkKsQf5mToE/4ZO3+NgsV98lHwW
 T92yw29plA/n+9kOZ19g5YP1QJ7Y43HXCvkqQ37e5IeyvmZQO75OVs3M9Pv6UTQiE1BN
 /s4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786981120; x=1787585920;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=dTGABPubG33espNLne7rRiXwrTKCCeyueuBOeukfXk4=;
 b=JBjjEBkLicvygtKT2vpZO0rdzNLjOO1xqnbRwJbh2EmMfGMlqMdjlJA9K9fzmg9Usp
 7FBc3RlXooeD+vXrYszLHklZBCmSX9u6XUnndhK8hyNx5DsfJr+k7FkLKlewFNxpSn+v
 YkHqCDIucZNaAWHhgx/ug6lg6OFmdGpLro3mN8uMen7su88bpwgXwWZi2cZoXz8aIgvw
 cEjGrIWPdAltbTLseU/smEOykjUZhNgVg5PhF2coH2pGqSWZsa9hMwSL7Ph7We4SJjUi
 ZNf2DM4U5c0ySCIcZBmNUNb3yALG9Ar8kiXjhFEI/vXwFBGeLMqhVG1x0o7/5DUq+9Dc
 cFyA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrBtp1yZcBY25KB447nQUi/jG1yfuKoXkAdDcPpDthki2SgX0yBytoC+4+TGbUhtdvi0DNIXUiBVQ==@nongnu.org
X-Gm-Message-State: AOJu0YwWcDoZYIf9WGzVAcvITz4e0dE4wybPzHME5v6EITJsvnuQJlzR
 zDumbmqSanv8VIVHQ7oRrfDWiZun5hn7E4N8nYtwI+6P7cj/TFPGWXnDCvmKAT8410F2qBhxyeo
 YruE2CmDI2yqTCm+Z5Fm7tzIiPwxcrMaXy59sjgSpUA==
X-Gm-Gg: AR+sD10n9yZsp2O4eNkec2IYBXqwKUc3Nw0urn7HcMVxzmSXTNNPMYbhi9cWUfh94aq
 8IjaN6dDvA8QQF06KPrTQ4nmRKG22Ut2L+bpSBVqq1afQGuyXjWmH93eEcgY4qCol7BtbiswPub
 IBX5i859ZpF85zN2kGmO4X+1IeTKrdmMOO40AjN6c//IXSUzJ+dgEIW/rQ137hiJOFI9yAwS7Oo
 AvzO4KWvtZIcbleLHC65xOfVMWJDTEwdA1u+cPfPqstz6bg6pMUCujyeuUK5nGKuNJFXEbTn8Qp
 Kl6nFV3DSZvtRO7gYDj99xKNtb03F8a9mafQrTL3xabRjNzt2fAzi98uagyeZSHJ4LvC6bEB+tI
 cTvRZUdlOngBT6OXnSfNig0HCCBPZ
X-Received: by 2002:a05:690e:140e:b0:668:180c:bf6a with SMTP id
 956f58d0204a3-66c72d1fefbmr8150772d50.37.1786981119661; Mon, 17 Aug 2026
 08:38:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260805153005.9989-1-simonxhy0404@gmail.com>
 <20260805153005.9989-7-simonxhy0404@gmail.com>
In-Reply-To: <20260805153005.9989-7-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 17 Aug 2026 16:38:27 +0100
X-Gm-Features: AcwNN1U_yGaInUv0xPhw5ad1BoLRurUWHJbZhBgwCoPcfCFkm3OBLNtDaLkO5JM
Message-ID: <CAFEAcA87J51jytkagf8-aqhc2Ac=xbjuEwBHY=y85fNSk6QSmA@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] hw/misc/iotkit-secctl.c: use GNU C case ranges
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Owen Giles <owen.giles@hpe.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 Robert Elliott <elliott@hpe.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
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

On Wed, 5 Aug 2026 at 16:30, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> Replace case fall throughs with case ranges when register addresses
> are continous.
>
> Reviewed-by: Owen Giles <owen.giles@hpe.com>
> Reviewed-by: Robert Elliott <elliott@hpe.com>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>
> ---
> v1 -> v2
>         Make long case statemens consistent with other iotkit files

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

