Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B77D7CAC58E
	for <qemu-arm@archiver.kernel.org>; Thu, 11 Sep 2025 14:47:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uwiZQ-0000Oo-QF; Thu, 11 Sep 2025 10:46:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwiZ7-0000LV-Li
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 10:46:26 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uwiZ5-0003xa-Hk
 for qemu-arm@nongnu.org; Thu, 11 Sep 2025 10:46:24 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-72c3b247827so6746157b3.1
 for <qemu-arm@nongnu.org>; Thu, 11 Sep 2025 07:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757601981; x=1758206781; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FcTsT/2FVI7V/KcYWRv9dX9PSVwqf/a/qxlTK88yXXY=;
 b=ye5M4tvp6GUKOCbvLrO1mX+YRwqHOX0eKO1mMDF/SN4q8510LOy582hZ75qMe5rQfg
 luh2sh+mok9j0Mpe+Y0q/+3/1/4iQRI8sQUSPwqYQ3WoWNJGbACHcA3+qarBdR7jOFqH
 2v86h+xyFFbEpfh3eXr6v94Pq2igupmeWDKx+jvoXHcdbEaU4Ccd41ACQSv2JN/DGJWy
 IoFHhdbpR2QhJyicpLgg/c2sBDd5egK/WiqGzAbXIlRxITy9tzDZadRIQGD8+EsQhLtS
 1bMVkiEZ/btrrwWD9YIaPSqUTtC4mjaxWEEweGHs5cZsrw67RUdggBsCiWlIqTPv9i29
 zzOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757601981; x=1758206781;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FcTsT/2FVI7V/KcYWRv9dX9PSVwqf/a/qxlTK88yXXY=;
 b=v9NijNfUIJ/MBLjYF1O1b6TnMM4/6k/DZ/lpj8IDy3yNYCskZRaW2KKxCP7HVbeBR5
 8EE6AG8+eEg9vJk1evjxpOKf8+4ere2SvQnF4hMiIHTCv/DUF4zxUiD+Py/3VByI9TW3
 3MmKApLgD9U9/F+sPICYfN2r+zuWuFTO29q1375RGSzxxTjWbfUREE1HHZ7lkIBLT9Tg
 k37CtoVvSAULcFs1z9m5Rh0v66tWeOa7tobhTo1Xv4n8p0UfT7Y539yyBg2jQteSfSOH
 I0GFnY40uv48kZg/sVKJAb+gSMqq4XuWwPFbhL/5Bo3pZCZhYdTphuZNxEqWU8Zm+sDR
 bm4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnfobFUYvuwRJJL35ORBnJ14qUR9sRgy/bZi9dDR387l5RagXMhECdxYhYyIWX1rEDr8Q769w/Uw==@nongnu.org
X-Gm-Message-State: AOJu0YyajKx/D5kI7uzcoT4yCjOaeJEyVRUyCyphgdZ3X/RqMFOF0X+k
 sa4FFLrAdkJBgu6aM9qHH29JXlX5FzdHKWKW1uJq8wCDQgM9SyMw9ch3iui9jvURORrKfvP+5Lr
 8HkEQc8tyWCHeXKqo2QgtflAamhjKsrtNmNG8EKfeSw==
X-Gm-Gg: ASbGncsQ8j5r8GKHDE/Vv2iC9OiyqnYHbiPGG1I3h5mAqFZGX2xgutXC67OntcXg6Fk
 DH1VSvGOADgCr5NfDvUjHpLhbs73Pqp+7QMZYZKuFPbMBcsnJ/KagkOoXyDisR9LxEGNoH1gQ0g
 i644klOhOBtbUu8BVN6nkijtv9uyk4i3CotqQBYBdMOwzyuF4NbI2ivSu2CX6huN159Gr5MM3Gt
 pjIUCXcqQCSTKXpHiqGL8UXCngx/g==
X-Google-Smtp-Source: AGHT+IFyDu42MC95CranUfROhX4o6o38lUqWwTiV5HMA7Ensn9+sjwdyk24ICRGEN/HcoP4ptGH92y6EvT+TKTCCxg8=
X-Received: by 2002:a05:690c:a010:b0:729:f78b:420c with SMTP id
 00721157ae682-729f78b9be5mr122562777b3.24.1757601981232; Thu, 11 Sep 2025
 07:46:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-24-philmd@linaro.org>
In-Reply-To: <20250903100702.16726-24-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Sep 2025 15:46:09 +0100
X-Gm-Features: Ac12FXwzErRf24MAYGbl-qZ8jiJRTUumVQFc9x037jHRbDc1gkrkzef5d4PTXms
Message-ID: <CAFEAcA8Bf90DJ44gdDWaBzc+FdbSY1Nn7Z0VJeWVpt3HMG__8A@mail.gmail.com>
Subject: Re: [PATCH 23/24] target/arm: Rename init_cpreg_list() ->
 arm_init_cpreg_list()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>, Mads Ynddal <mads@ynddal.dk>, 
 Phil Dennis-Jordan <phil@philjordan.eu>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Wed, 3 Sept 2025 at 11:10, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Prefix init_cpreg_list() with 'arm_'.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

