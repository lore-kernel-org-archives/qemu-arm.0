Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66AF2CCA490
	for <qemu-arm@archiver.kernel.org>; Sun, 18 Oct 2026 10:34:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xIODS-0004cL-Fx; Sun, 18 Oct 2026 06:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIOCL-0004NI-QL
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:33:15 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xIOCK-0000pm-7Y
 for qemu-arm@nongnu.org; Sun, 18 Oct 2026 06:33:01 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-679e6ab6471so19560d50.0
 for <qemu-arm@nongnu.org>; Sun, 18 Oct 2026 03:32:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792319579; cv=none;
 d=google.com; s=arc-20260327;
 b=OXqZHBw3I8tSYJlP9IuSodkb8H5mUiQqJoNSsZZZL6wcqCJlxVRNYknBk6a5f4qH4T
 ciZmSV8cBoDyLl84sow/OfPNJ+S5B1nSR7a/lFOcbPC0ayFfPMW7O8/sIdZRgLalkzpc
 7ORvDw6jzwM8UxS3rX/mda0vWJJTG+dGD4GoYNENyq5ZVe4VLlrmzcUCDiTupOSXsVLo
 cPzhg83RxUQoa6u5PTngIPuXbeKh2tWf+eHOMTecJ2O8B9fE/9qmeS09EcVXGfPtKGmU
 5QWJ9A5acQ/onl+0WkRPZyczB7FZ2vZpNuHYHSIUp37uQOPzlEKnNwvTgDGzllDSbHg8
 0YhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4aR9aHeEv98qhJni0KQ0kmpovdS8XBDkabORswPEmxQ=;
 fh=g8FCxc5is1RCo3POozJWn3/SaL53D537QPGaiqIjx4o=;
 b=Oxel1oQhv2QxNOUNNmgVaChxaeI9v4pO74fl+F0fcwI2kJUmV+2OaWcVyRpnAY9paE
 WR8P7xhF3GFtXmlICumSXaYcfSEGOf1x/K3bkwShgFMrN4tHYOFyYeRKxT4nIqWpgq8V
 VHlAmKgE7ljhWWOODae/eLGRr/8wwsOK9BcenSVMQYjn53/Bf6wrHs9xzs2w2VqlZcUk
 l9xCW98bSvjBSi3JQ+f4j42Q35fzjwrbe+DgmP9qt9gqiOE0YpFUqbEdySVdW3IWXatw
 5CJujMPZ2cXSgRK4xWzWfsZyNfDcREuuU8Rdo/6lb2CPKqshui3+6BykSRs4NxaDM6gv
 15bQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792319579; x=1792924379; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=4aR9aHeEv98qhJni0KQ0kmpovdS8XBDkabORswPEmxQ=;
 b=cVH42vxSP22bMteRRuHJOC7lET4FayhBmL9P48ZXlXJxLeO9mw7f+SdR1vPxPCn2Ld
 V29thbKF7PO/qveHmtSpPInHDaHxzv9OYklUeXCp1SqNMgdz+5vEePY91OJRrMxiSlP7
 38dSAgF1lUQmE5xm5+EhNYdxNyJHz2xpPXNZMssVXutwuDdbPMYitiH5wP8dlbU2e29K
 hn3ZnnMjZLM/irKRkmGAEFvndWeHw8T5gR9wLT3zzpRm116Vkjpp+uA4xvln4EpZzOm3
 XD1a1fA6ma3+7dx7b5XVobUxHiS3HQNLZdj5Q/V9MmiQxI/G7r1xzBiCu8tgNP7hLbaJ
 zuBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792319579; x=1792924379;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=4aR9aHeEv98qhJni0KQ0kmpovdS8XBDkabORswPEmxQ=;
 b=1pmdrx8XIRGm/YHBGlF2Vmf3Md+KeYudtTFb8wSDsG0KJAHs3P6YFJI63OOHbj/WwP
 ZXCyXRTEFwrELkZo56tlBrvPAVMed6ar6ho+Xo4jad3LN5F/vIjCXfq7mVoDcxdy1ViV
 tpwELUIdN+67VdUyfIITQ0GwmkZ9kr6/SuoqDGYY8wMPiGKJYjhzG6Re644a2GbBEgQ5
 fOMnxGziQPCpPjXnXHKltmP6Wsr2uATV3PKNYuaDSgyQOaQtHOUFRyhhU5i/XdWED3xx
 x2lg8wkikBwxsRIBheYNZyGn9OXwE3kRP3AhxmBPDXrSIPCit2Pr6EeUyUlMiWFa+GNL
 N7gQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwEs6uOsThTNZhLAGGq/5Oi9y6ZqbyimaC9TxywQfYxM+G3L2vraQtmKuOWyhW5xzZtfzbLWbXVGw==@nongnu.org
X-Gm-Message-State: AFq9FYK8Oi9MtxySxZY2ugxwZaPiGjxKpJqetId7ydYGROqwl6Ny1Y79
 Aomil5aQ3qCLzcXexnhzxI5Aw3x2GB7Hcl4gRa6wHCxQv1zEAffvL8LUuQw+phs56bjPMySjbaG
 nrrUGqo1nNSyeTt8/Vj2aGaac3+nH2/WCIcSw0hZgQg==
X-Gm-Gg: AYBFou023ENFqumv322gJCVW/cesi4dOhwu//KGPHpfwizq6ElCih7sg0f8xmw1y8h4
 a0Q1UiALZHybIMFXgwJm7YFxl2C4f9j20pgdhGSA2hjKBuzJzRmxXyExyvnvaE+cwIhsZ6KHe7C
 k3rLSdd9RLzqwkWGSdB9ymAJevp7E2BW1M1kwwXkD1oIJtTFX45MqmWVsdzP4DTUXZ8FNXcZjls
 8/flYRXLxlO4sTR7gEjXuxuDoqhpHzuvB1wlS1dUJYf+lRLJWu6FAfDpQLxxvKCwyJ4IPd1TT2Y
 SVAFVKH0BjmzbeyLY37Swsf/wgSV3YUgs17czvH7y+fyftKZ5xIFY5f35gwBtODrPGT777d/HUT
 kSMf01um4PXPbeRJ+oFdEw6a5afacHmKvubZogtsOII4xNLz8YA==
X-Received: by 2002:a05:690c:e3cc:b0:8ae:98ce:5497 with SMTP id
 00721157ae682-8b0e2a9ae76mr26007097b3.0.1792319578927; Sun, 18 Oct 2026
 03:32:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260918101158.42101-1-corvin.koehne@gmail.com>
 <20260918101158.42101-4-corvin.koehne@gmail.com>
In-Reply-To: <20260918101158.42101-4-corvin.koehne@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 18 Oct 2026 11:32:47 +0100
X-Gm-Features: AclHuK__v9N8USXjL6-UaRhKfCYshkZRXswPfg446W8rOZBE63M8TcAUQfokMuk
Message-ID: <CAFEAcA-kYNZwk1nX0Nqb8o+8nfQcusEaVTwgnrG2+TS39ipXGw@mail.gmail.com>
Subject: Re: [PATCH v8 3/7] hw/misc/zynq_slcr: Add CPU clock outputs and ratios
To: =?UTF-8?Q?Corvin_K=C3=B6hne?= <corvin.koehne@gmail.com>
Cc: qemu-devel@nongnu.org, Corvin Koehne <C.Koehne@beckhoff.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, 
 =?UTF-8?Q?Yannick_Vo=C3=9Fen?= <y.vossen@beckhoff.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Fri, 18 Sept 2026 at 11:12, Corvin K=C3=B6hne <corvin.koehne@gmail.com> =
wrote:
>
> From: YannickV <Y.Vossen@beckhoff.com>
>
> Add CPU clock outputs and derive the related domains from the base CPU
> clock ratio. This makes the CPU clock domains visible and keeps their
> ratios consistent with the hardware clock tree.
>
> Signed-off-by: YannickV <Y.Vossen@beckhoff.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

