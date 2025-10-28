Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DA02CCF9E0
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Oct 2025 11:19:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDhjQ-0006Ae-SW; Tue, 28 Oct 2025 07:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDhjP-0006AQ-Hn
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:19:15 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDhjM-0002Tj-HN
 for qemu-arm@nongnu.org; Tue, 28 Oct 2025 07:19:15 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-63cf0df1abbso6562739d50.2
 for <qemu-arm@nongnu.org>; Tue, 28 Oct 2025 04:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761650349; x=1762255149; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NpHM8U3lLFKgz4Lw76Bxs+M3n57MYbLJAUJ43ylwpug=;
 b=szoG7CcfTEFkH2NPrT4XP2eP6aJXRM3vkQzTxZMjFgjrcXFPPwbSHqJ18fZwy2U2j4
 GP6lrDgcdJUTH2e37dZTLWUC69CQiFoi7ZXUU0vJ7qaDc3NCW2P4D6YQ6hx38VE5SybA
 JZw4kX6KKN6I2wt0cb0rSnmORv0kXfpbvieAet2jrIQSDHBMFQQKsbxa2hoBieDWQfP2
 HUW1ISp0aZmi2PL0rshzVXteK0XCOSr+ppnI9J771VwY/BSsnH6Basz51Vo3uT1VY1mO
 QUdCnv2vKvt/3gEkJ3RQ+3gMW6BEnyNyDlC0cAGvsI4KEAb7OFPJKITFnNpWji/cuPKu
 2+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761650349; x=1762255149;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NpHM8U3lLFKgz4Lw76Bxs+M3n57MYbLJAUJ43ylwpug=;
 b=d7AYIG6WQAoSMEHfAdEgdnjkIkGj77niGVcwFqsdef2dXC/qzu7yEZrPsyAMjX5JhB
 q9K14sUVTQdNbAOxU1L7UbyTOiFrhjy2PER/G8SmroNSvPk7RAQ8J3cBKXAOqSqaFhg8
 HgWoZIz2auT9fFJ4FCvFBMSh3u9IZ1ljdk1Qv1gYorYN/89wq4uGtFyOXziTIqDgXHW6
 +VQ1HGhdBMcmeEkVBUiPY7IqpSESWIM2vdql3rZcyDs/oOGdEQd2/WHvTyA/ThPcQTW2
 6pehgdvJ1aAVkrcRqFjqABuqyVX1cxBHol2Vrpz7UmM1RyOHKIPOR4m/uUvQgKcHiPT5
 FR1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVp46Vye730oJh3XW4PzvvT+qZdRBioPiy6x1TIeUhnhCnTjIfCEwzb8666Dei9azMbvIzQvMWETw==@nongnu.org
X-Gm-Message-State: AOJu0Yy9Zw1FEPohQKSt9yHmHkqx+Wzx1CsepHU2BPI4uG8hJ65O0zis
 lvPhPkPbGR5vKoRXRkV719eHnkxRLuJK91ERO+ob2QauOpkxq0V8yq5Rp3lhPZ5sfvgUJ1KGOeM
 YKGi/qYnTUQm4jBD+uMAPNLpTr0aef4qvBiiuacCfGA==
X-Gm-Gg: ASbGncueRE8gZHBts0D0lEwB81/nghEw86HKDeSSR+2eOF7KtcLYivyuXzBbULqtpYA
 OVc5/EUAH7uSInn9aEg/u7K31FK8eIkbD0tonC9qrsIEuOs8itH+U4xeFt5ioZbPTc79+zftKil
 ngACUffvrGbv5ujktapc4lxMivkU+TpwHHYBg0/0ma05E3fuLDLcvasmFWHqgDntQ3DAlXoplZF
 ayraePPCq2iGUgYRZQRzzLU/YUe7MkIu9UU6eDN7XCVVdSdUuxr0ogRCeAKUQ==
X-Google-Smtp-Source: AGHT+IG2cQaWEZTSs0Y5epSzvWv+WKv2OKrWOcpuoYCSKtmeSv8VIghkBK1xbgr5cwszsR58avyIAqzOir9cSlQugMk=
X-Received: by 2002:a05:690e:4184:b0:62f:c634:4b3f with SMTP id
 956f58d0204a3-63f6b9d3132mr2616840d50.7.1761650349242; Tue, 28 Oct 2025
 04:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20251028054238.14949-1-philmd@linaro.org>
 <20251028054238.14949-19-philmd@linaro.org>
In-Reply-To: <20251028054238.14949-19-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Oct 2025 11:18:57 +0000
X-Gm-Features: AWmQ_bn82SuPYVoiy2QwkORg7Xyc1nUDhibjfSmAdY2bG0OnlWp3ry_DXztbzmM
Message-ID: <CAFEAcA9FH86ja0GX_GM1p=2NSMV01WSefpNCgEZ1ap=xHju+DA@mail.gmail.com>
Subject: Re: [PATCH v3 18/59] target/i386/hvf: Factor hvf_handle_vmexit() out
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Mads Ynddal <mads@ynddal.dk>, 
 Cameron Esfahani <dirty@apple.com>, qemu-arm@nongnu.org,
 Roman Bolshakov <rbolshakov@ddn.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Collingbourne <pcc@google.com>, Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Tue, 28 Oct 2025 at 05:55, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Factor hvf_handle_vmexit() out of hvf_arch_vcpu_exec().
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  target/i386/hvf/hvf.c | 478 +++++++++++++++++++++---------------------
>  1 file changed, 244 insertions(+), 234 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

