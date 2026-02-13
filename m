Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C260EEDF14F
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Feb 2026 10:29:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vqqPy-0000Qi-7Z; Fri, 13 Feb 2026 05:28:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vqqPx-0000QC-0u
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 05:28:57 -0500
Received: from mail-yx1-xb134.google.com ([2607:f8b0:4864:20::b134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vqqPv-0000MI-9p
 for qemu-arm@nongnu.org; Fri, 13 Feb 2026 05:28:56 -0500
Received: by mail-yx1-xb134.google.com with SMTP id
 956f58d0204a3-64ae222d87dso869228d50.2
 for <qemu-arm@nongnu.org>; Fri, 13 Feb 2026 02:28:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770978534; cv=none;
 d=google.com; s=arc-20240605;
 b=Fs8jF8yI7sVfPxeWMVkffsS7FbDDNlwroAwdDz39q+C5uR4J+I3Ju2m/cbE9ftfTDA
 gXnUHzDcyjmbDGM3Kp+sTHy9S2Lz86tlYsr34e5LCsT6UEqneVrhX9CgHYZBYDG92hB2
 KfMTLYzGCHq9AqoEy0RIt64KvM753sgW238X9luf3OpbLJswS1QEJVk4xecg0fK/Enlj
 wD1ol/kyFP8QWZlAti/WbRWDHbNTRu/I1zpxn5Wo+Xf1zAFzMimCgTGUjTbT9eBXkf2L
 5oo8YySWpiye4ngLP3UprWNiA4z3KBb48bvCpp5bc1RIZ2eCZuCLIPjog0iRn50xjt6w
 EbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=71LwTNqT/NNqZ4a8HGvV/q/9xhMcMJWfeFJpDgLViVM=;
 fh=qiZPS4UC8WZTyfFCFo+5R+0C+WhFaVgWm6qQmIOAEaI=;
 b=lIhOOnH8cm3wRq2KcAT8O9WCLcbMOZXVot09l/o9LhSbWFEbUPF4HQPJlcdSCNHcFC
 VeKt0HECCRWalQwYyuY902CqddAqOKP9z2C75PRY/2ZGrif9A57vUbe9yS05Znr8NZRo
 8H9JIGu3DhVCoZW9CQJmq+ONHddgYJYvOzECb7gZzlalz8aKv8A3cnijrB3T7tbZvlIg
 y6FfgzPquS9d90lmA/I8sPn38crP3wAIn/vhTVdwQ/TDqWldesb6nB5KXiJopdFRFYUI
 rB69URE/esjS9CeEb6yU4Tof7aswidPDYInay1/CD7d4xH90fLNRzU04nY8d++R7ARSo
 HMlA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770978534; x=1771583334; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=71LwTNqT/NNqZ4a8HGvV/q/9xhMcMJWfeFJpDgLViVM=;
 b=w+TWO/01rOIqwR8Hs4hNfHxUWl0ER7l0RDlF6t2YtlKZMPsaRV2vOIAIOwE0TZ1jGi
 tZL8Lop4yXQeeL1brmCfRTrfF9XoBlYIlMQN6wBsWq3jzeS7FkNyYmaqb8ezt7/haQWx
 kg62u5EHPFCX+ULw3Jh7YXqCNR/FqPX2U+BPOqqSjnN8VU6ohTREFR6bAEu0qtjAS0TW
 DnpMp1BhtnujbeXeTzEI4e4NyZEnVT4aLX4z/xc0oPMNaiCb7ju8PPAtZBCizCto7MC0
 Bux1IZevM05Ft66ADtnm5fkPEkYUvhu1eyaEZvpzGAxP7RO5Td+G+mIKPZlPzm1wsePa
 fbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770978534; x=1771583334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=71LwTNqT/NNqZ4a8HGvV/q/9xhMcMJWfeFJpDgLViVM=;
 b=WXPbA6sCVwmbqnIUgadNOpPRJJ+6z2X2Jl4sVgjbAIHtBR/650j1RJDfnyvq0ThbXK
 J0KDCQB22am1CzMQcoDEco/8wKXE1qG//Oyf72EwnlGeP+SjANF9CY8vf8ud0KSWJlET
 CYuuZHo03jx3L83ZLWKWKyElOAs+Y3Xh+3jvBcBNDnvubTUmgq9ronYLOPp0ipw7YTlx
 QDPGA+u/4SPh1y6LkgvX/MI9F0FrDxvX9mx25JqUJPczQYhPOttALik3NQiDvRZ++Wk5
 J84gUmg6dBMXvgvj/eLFT9M5gSzGe+kQE3wciokrgcJlyMj9sNhXsgeBNgzGw7BwJtSl
 pQqQ==
X-Gm-Message-State: AOJu0Yy/pG33zp+gIFpFOVieSLvlUvdEIVbNqVXgN7IKeQysn8J93xLP
 Iz/Q9rcthzhQKRw55YtpfcIBhIcBYH36WipmOnqkMhacT6aMrV59vWHV496xouILM4En6yp4Ha3
 Z7ITjStN8w0VS/E+P02Xx9TlC/uRcPAbZRyX6ctCB2g==
X-Gm-Gg: AZuq6aINJvcTB129TvyTseSw7c/RhBpZ32I2c4jRSPdvo6XQrGLJ6715s/+fbAHWRVk
 xPbfDVUfbrfo3lrBfOFszCAb6UBYtvOF9lkVgK5AlJ7XFZVrFonX16iDHbs41NXna77o52anwE+
 TU0VgU301x7vsSKn+OdbqNpgKATHogoZtOJOV+me0oKsWLG25v7hqDsn+2BKcX08fEsAO6a3lKk
 lEugELiR+JAPwFvgcKDAQ3HMmbCaWoZ4akdemjYz2gC0ZJ99/c+G5RMCvqEEXheX7CkTfwVc53V
 hlF7JdX0bXLmxWgP8IWD46eXIp07grtPnOnhizB+exxDiROjKEoJMZfgJM8h496j+is=
X-Received: by 2002:a05:690e:1342:b0:649:468e:3673 with SMTP id
 956f58d0204a3-64c19b44ab0mr893630d50.72.1770978534145; Fri, 13 Feb 2026
 02:28:54 -0800 (PST)
MIME-Version: 1.0
References: <20260212213955.2225662-1-clg@redhat.com>
In-Reply-To: <20260212213955.2225662-1-clg@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Feb 2026 10:28:42 +0000
X-Gm-Features: AZwV_Qi7lJMeFO8WaEXJECZPAHqmgLNbKiFuWVx9CJheba_nzKBTlVnL7qlXpvA
Message-ID: <CAFEAcA_Bc+TWkjOHGCt84GboQfdubxjSmsxUbDWeP8rY44m3EA@mail.gmail.com>
Subject: Re: [PULL 00/16] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Thu, 12 Feb 2026 at 21:40, C=C3=A9dric Le Goater <clg@redhat.com> wrote:
>
> The following changes since commit 039fae56bb79af1124619daae60e01c257fcb2=
ee:
>
>   Merge tag 'pull-request-2026-02-12v2' of https://gitlab.com/thuth/qemu =
into staging (2026-02-12 11:52:31 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20260212
>
> for you to fetch changes up to 1b662879513fa9823a887cac9cfc3d91b9d3f616:
>
>   tests/functional/aarch64/test_aspeed_ast2700fc: Use AST2700 A2 SDK imag=
e for FC tests (2026-02-12 16:06:55 +0100)
>
> ----------------------------------------------------------------
> aspeed-next queue:
>
> * Adds support for the AST2700 A2 SoC, including a new machine and
>   a functional test
> * Enhances AST2600 OTP functional test
> * Restructures Aspeed ARM tests into separate files for better
>   parallelism.
> * Includes new SDK tests with Linux 5.15.
> * Fixes Aspeed I2C models
>



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/11.0
for any user-visible changes.

-- PMM

