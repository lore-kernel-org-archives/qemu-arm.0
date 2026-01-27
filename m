Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1477FD2D8FB
	for <qemu-arm@archiver.kernel.org>; Tue, 27 Jan 2026 10:58:58 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vkgmX-0006yp-8j; Tue, 27 Jan 2026 05:58:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkgmL-0006pz-HG
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 05:58:37 -0500
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vkgmK-0005IP-1a
 for qemu-arm@nongnu.org; Tue, 27 Jan 2026 05:58:37 -0500
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-790992528f6so53182767b3.1
 for <qemu-arm@nongnu.org>; Tue, 27 Jan 2026 02:58:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769511515; cv=none;
 d=google.com; s=arc-20240605;
 b=f5J+w8XCbF9pEgryqFzzKiBg2deQHGMhWfQUAdyd63+VK12TZN1rC2AJFpFK88uBFW
 goT0v7aea+Am+Bort+SFng0QjsQu5JjF/BGO6EzlOYSmjrqFB5oaAv+8VUcXbDTblfWx
 bdubhPU9ZRsqtAbWoBBNWN4TOLpND9UeyyEAdMteHANBXxS/dQCe2WJ09xmKNZZ0hoqZ
 dwpr5lVlcTkyOdADhOZI7kWrD3s5z8IglnfR4n0yHptOGGG9eNiQ15qpG3JGAIiPLvIU
 n5F1GUuRE1/KmNdkgDez+HcS6rFufovTzq4posnlq8sb6We8jbZXlOrijRHF2ykcTuLC
 U8ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=w7oYcbs0IosFoZ5vJnqh58adK6OR900dLunCz09q/KU=;
 fh=hU6/GjjjnpJ599pYmhpQ9mcLf2OfqMzMM4mWWp4PhC4=;
 b=jd9Jp5sQ2UE++z+9unkM7RzM0iMkwDcKq0cFvGn7tMl4zXRD5h5sDn29MWqsEsKvSO
 6y+gI6qOlzYIrjcfRNQR7rN5Fb96ALTFK4IKBMyjPoYK/X2xjrxo2dJEayt4jF6rxrnj
 CpfdyfxyphdqthYmRDNUPyEGKdHODnO7ot2foI9krpscaZ6HqLBkPFJphfnexneSLWfN
 kUzDmtIDOjyaFqQX9dI190RMWQ32DZiBiSw7oy8Muay9hmKkuuIPL0WDHOSqTvVSZwII
 Xi0vqRku38g8oDTe55vzaAaRlc4WupBId8pdnFEx75NSaKqFIDBLukXFwRPBGQfF9DSP
 zyVw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769511515; x=1770116315; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w7oYcbs0IosFoZ5vJnqh58adK6OR900dLunCz09q/KU=;
 b=laxt4uaJEwZlKy25atM3k3MWJZlhZRP7Ow6dD0ZMK0QCxgRaaMGAxb7f6nmvNAuHgK
 0SdDwJt0TaoNATT0X5zR7gKE8aesCno87lSrpC7mIyzB/etmmoAXToaPQWwQLzNUVEP3
 IwE18tgIftTaiI/6DwEKS6vHkWjf9UBFWhNII4YZGnNq8B7TE5qKKcECgbLBH04+HB9V
 tWxpBCYtCm1UbHCwoLXyJh6hXLZal3VxE1WjofeaSvy3j7MlHVORoi4SWY0ZfDP4OqRv
 xrD6HAu6rez4dbCqsdcIDXa+j1xuhDgnWGfic9lDYecnnKaOgW+KUZuskOaaAD7edjD0
 HnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769511515; x=1770116315;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w7oYcbs0IosFoZ5vJnqh58adK6OR900dLunCz09q/KU=;
 b=jJpBJ8salp1BJKPwtCXi+MD+yvcp1P7WNZunUSZlmMhqVEAkxaomS3GcTAwKg8agPd
 8+c/u/P2xnUA/WoXSiS29IzSc4WMQUaYva6wTQ90fSBcNl4l1jlKZfvDFpZr6DD92Z5m
 Jh1EzlrJSo7b+EP1C40PwFYf+O+2uY20O1zavjLvSVlqo4vZGQeCUQRjMRfzqeUs1oKG
 SwkgjekyEh+wd/Vw1rs5RGb3VVV2/xSjaw2MkTZ4nErMgpeFXHpEnbFkuAS8YAb6GHx2
 lFWqnOlNoRnPAInPCArNhcb834aCAi19aR0oM2MZKmsbRm7otNB8COPOgN17GNu3MfDg
 hA5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhciASztJx9X6O9cjIrQ47JcpCZOL6pM99Velg/8t/yakhqM47wDwHzXhEpdMuejJPYUehnuIFUw==@nongnu.org
X-Gm-Message-State: AOJu0Yzc0dUNaThmlnIPK7NNJmE7/L1h1JEK4X4HAUXU0sVE3xKn1PRk
 L8OSBzNohXHkwMSdNKlxcNhUBrNQ1bNATHiSOFFnJX0GMXzYodmvV120ic2Uo/a3Ow9p6x0QNfJ
 Q91fFgXBuEC3i5MNG8ETrydL7D80ZMJVVuo9GNyvRZg==
X-Gm-Gg: AZuq6aIBw2RUxVdjGbiwyatw1HaLPYg6bTyfgEz6MRjc0arClqrtBRn6AQReXowNVwi
 OXJSWulWKuxLUNmGK6dVifuuLvrUTMaZCGp2VC9Poq8Rnn1lNkvi5/mUl7Iy4n6raP092dGzX0V
 8Wic0GUOfARWz/wHPweEWKoInLLAVgJ75cNS4qNBzWxENnJ/718jqozigUNkQpSMejcQmuQsr4L
 whFVVWKaEy6RXXoZT9oMXzVZe1GgBAqKaMEyTUwY3wZPSIIdt0oyk+Al1Cd/bZb6VnHZQ==
X-Received: by 2002:a05:690c:95:b0:794:7e7e:95ac with SMTP id
 00721157ae682-7947e7e9a95mr1549457b3.67.1769511514832; Tue, 27 Jan 2026
 02:58:34 -0800 (PST)
MIME-Version: 1.0
References: <20260121134114.9781-1-mohamed@unpredictable.fr>
 <20260121134114.9781-12-mohamed@unpredictable.fr>
In-Reply-To: <20260121134114.9781-12-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Jan 2026 10:58:23 +0000
X-Gm-Features: AZwV_QiXSUqIQikPEVPkAo4a2t43paFFAvtXjE1qY_a-T4kF28Lz4j5kXWMoYEs
Message-ID: <CAFEAcA__gAtae+y8t2j+nsLgGs1cv+jt9auvLwYn+QvjzZDtWA@mail.gmail.com>
Subject: Re: [PATCH v17 11/21] whpx: interrupt controller support
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Alexander Graf <agraf@csgraf.de>, 
 Igor Mammedov <imammedo@redhat.com>, Cameron Esfahani <dirty@apple.com>, 
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Shannon Zhao <shannon.zhaosl@gmail.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Zhao Liu <zhao1.liu@intel.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Ani Sinha <anisinha@redhat.com>, Pedro Barbuda <pbarbuda@microsoft.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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

On Wed, 21 Jan 2026 at 13:41, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

