Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEC7EA8100
	for <qemu-arm@archiver.kernel.org>; Tue, 10 Feb 2026 11:56:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vpmLl-0004mL-45; Tue, 10 Feb 2026 06:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vpmLj-0004hH-1A
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 06:56:11 -0500
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vpmLh-00056j-IX
 for qemu-arm@nongnu.org; Tue, 10 Feb 2026 06:56:10 -0500
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7962119ff2bso40329027b3.3
 for <qemu-arm@nongnu.org>; Tue, 10 Feb 2026 03:56:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770724568; cv=none;
 d=google.com; s=arc-20240605;
 b=UbInQVTSgMhmsKHRz+M6C5qJhdNU4pWPAk9JjPZbu9NaWuJiC7A1rxlUYrAscciEK5
 fyrYbtjAqSpYWPuKuosdl2/nU0HLlEvPIjp0sHrJFDSC4DY6urdSDnpZrJ3nT+iRaGNP
 rE5eZsB2b6AL+69LW/oP/GmWIHp++RZeUplqDj/3uGpWJTiC6A5GymPnaCsD89EE6SWr
 LOMEPB8MKGFEaxwvwQIqY8/ALViz5h6FxNVZRcnAqSIfiwqlnoZZexhxU8HYuMHkMdTA
 zHFsQpQxxNGIneU9AcxQMLy6Xqb1xSdwvxwUhRPpLDPBO4HRPu5iTTS22XdoviqmxM49
 ZF4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hkS99dUrqdgBELzlfh1B1oR51ZL2os6kdvIBc3sjghc=;
 fh=qcb2aFy41zcc6oB2lduK7xK0jRmoVtcGbjLik1RR6FA=;
 b=XQ4pFO+9d1ZSjxAfZ9zxCzN3wc/tmO1teSA+2eCot7YA7rnlvtlIE8xp4svPIZrfWU
 nUW5aTGqH1Bt7guGzwxwMs2593T/jg8PDJvuhUiRJIBtDtW2XhpX5Ps7yTZtYIK1mAQt
 QxwQJPjL4nhPPcciu1Z2+NjxXJk3WU+HG+jUhy2iMhIRb4Bfqsp0alsA9x1Qm8dsNksj
 U6umaRzEIV1GrUzowkPVdbxTWsub4wdCIumR5Ta28CiWeAZLaIp4DpaZHjZWuxLKNtDN
 ZG/j3V7DRkwQHjcpFe/uVA2Y6OUo7m5zSd+LDA4qC9SDYYZOO4aGHwlXVq4u1ttNbp/X
 d32Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770724568; x=1771329368; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hkS99dUrqdgBELzlfh1B1oR51ZL2os6kdvIBc3sjghc=;
 b=EwSMfsvFlfWjM4EdhJMZhdDnekahWI9glhM4A0ObbZ3awTUvVCd4x5y4k+tlGiIcvW
 vJN6PWIkUDoMk6sv6nyYgAVx9d4DRebOuWZSsE59D3ttpo4c4rObw8qHW/Io0EvlkR36
 fLbirr51asgLMC+M5yM4N/vKZef7NWT0tzujnyYSnB6oU76vt3M3U4yDN+uKNexDOGQp
 G3reNxL3vQk3bTgEDdxKecfBHZlaf/fNp2h8HFaQxI2vcov/O0qDiFjRW9o95NL4VKrJ
 Pa6kpLIkLkIz5pYf1LTlvVNELM7JnLsSLJyEpcAcL5ZRR+kjJCyULbEz7z/gM85by1Cb
 wO7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770724568; x=1771329368;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hkS99dUrqdgBELzlfh1B1oR51ZL2os6kdvIBc3sjghc=;
 b=Lb9ulPoV+zMQ9hUpDqxLGAprwCjM0amOaZG4QsOkk1fJCSX5GMCyj4fXg6dKOFFNVU
 fVZVUmcH0Te7JWp+WEFTt9EBV5h0jkH01i01rHrrqEXYqMQQ16nZR6i+2o6XsgAdbezN
 KrLJSZ4zLvphk6cgo0S/QybcxnFKK9ytBU15K1NXIfbx2OTfac+xve36/rrxW/qweXcA
 5osnMhC9MOOYiWLVvKrpYBF0cQm6APDQucPZpRRyvRAZ3nZkazKCoJz6blGvFR0O9Rts
 jdgIgZEZQy+6HlBCxnv/rtC+csKuu2rtcThc0aKyAPG7towkFWc5n+PFGXpSa+feDhez
 V2rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrMAZMH673ROAb1/nSQ139+TuY515+REhGTTHzzX0MDxmG61m/yimBhpdhOJv7IwhB7lQYUg3v1w==@nongnu.org
X-Gm-Message-State: AOJu0YxO4EaUJoYznxhYUZb8d9gzC7/ktRA4BCqbVd8WupaLczpGa9I+
 pYVuluoo45EzT4YFdV24VisE65PestNd7UKwuT9DiKWLC/3NyziYtDQEuQPtu8PGtvFFS78PiJB
 hkRLKgP94DxPXn+at8/+gE0iM1Tc5nmzfU5pzaCK58g==
X-Gm-Gg: AZuq6aLjm0y2PCaaCbjdqL3LQhQS2Kj3crWYe0lq1RoMn/0FmjguCyTQja/wnlgw3Ai
 4jUn3G7TgwPsP2u02VbZbzFilIplAZoUtFJYmJuXbCmlZoYzFa4KtjO7SVbA0Kb7G6/AjuIqNdL
 1WL4zngN8JEgg7jRFUA5881dvAf5WsMfGdfpq4CWOcA1fV+ShNeJijqmTiLpqUeD2xtClowScXy
 SmSDFPQ+3icc6yRRkn28g7s19iqyLiHnPqZZWKkqFoo467dDazPxUsGM1Hd5iKGlfTjGxlV9dwd
 q1kqZ372iQ8FD3MQs5xJZHAXlXMvHm6EhxDWsK/+zybw6AS/GBsjjrXA8l94EeD9O3c=
X-Received: by 2002:a05:690c:dc2:b0:794:c657:7ec3 with SMTP id
 00721157ae682-7952a9005f7mr150486337b3.0.1770724568279; Tue, 10 Feb 2026
 03:56:08 -0800 (PST)
MIME-Version: 1.0
References: <20260205210231.888199-1-alex.bennee@linaro.org>
In-Reply-To: <20260205210231.888199-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Feb 2026 11:55:56 +0000
X-Gm-Features: AZwV_QgX6k0S3ur3Y5AYA4QBbvM4I2lYt9TtgpObrjktZb2yX-C4xmipJSI8JL0
Message-ID: <CAFEAcA_wih_kB_ZJA6HnuAq+of12myDSjC8xUNhGX8yhSi1teA@mail.gmail.com>
Subject: Re: [PATCH v3] target/arm: implement FEAT_E2H0
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Mohamed Mediouni <mohamed@unpredictable.fr>, 
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, 
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Thu, 5 Feb 2026 at 21:02, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> FEAT_E2H0 is a formalisation of the existing behaviour of HCR_EL2.E2H
> being programmable to switch between EL2 host mode and the
> "traditional" nVHE EL2 mode. This implies at some point we might want
> to model CPUs without FEAT_E2H0 which will always have EL2 host mode
> enabled.
>
> There are two values to represent no E2H0 systems of which 0b1110 will
> make HCR_EL2.NV1 RES0 for FEAT_NV systems. For FEAT_NV2 the NV1 bit is
> always valid.
>
> Message-ID: <20260130181648.628364-1-alex.bennee@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reviewed-by: Mohamed Mediouni <mohamed@unpredictable.fr>



Applied to target-arm.next, thanks.

-- PMM

