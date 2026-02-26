Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85918FC5926
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Feb 2026 10:30:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vvYdR-0004Zv-Kx; Thu, 26 Feb 2026 05:30:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvYdG-0004Qz-DI
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:30:11 -0500
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vvYdF-0005pE-4E
 for qemu-arm@nongnu.org; Thu, 26 Feb 2026 05:30:10 -0500
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-64ae222d978so470853d50.1
 for <qemu-arm@nongnu.org>; Thu, 26 Feb 2026 02:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772101808; cv=none;
 d=google.com; s=arc-20240605;
 b=OsDKRmW3DPihSMSzkf4lZtbm5v6DbOGNleOKeRUyyyC82rba425ao/ZkigAIZliVgQ
 UKyTQyVNI6rfwwYHjUPKE7rCo71m2cJJZCmD8QzNqXTDhQ5h6p6LLmjquuNU3bfuQJcX
 mS6VEi+m7SYljQJFjleuBRngV/74/x3mkn45RCYLu1112xigLrDVKkVGkcT7QHzONBVj
 5Wf/b3aZXRV/BxbcMo0TuuEnRQvOT3rTxXtUvO50bv5ZnS7ID59AUkCoTGJFTF4BniVW
 TJPbAWSd2wXOCDl2uGj4x/K98roO14FqsoKKE3G5aNKK6evhKIbQvJuoV8MFZs36D7HA
 bbXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=uwliuucL0KOD/ELHr9dIgi1S2N2clXrGO4EYwIzujPg=;
 fh=Iwz5rTQxigDfAzSekSCnENINyocgW95EuD/tFliDJb0=;
 b=edjfmMYxt+WO8yHaMzZtjFFmlp3bGfXofeBD0Exd1Xo2zqppOZPwIENHSZ7QM8lBBe
 m1dlZFFmAIbbW69s/ANSAiPzi1sPCbLbtYIQTI7oITcTzKXHATg9wehKuPcvFzHHQZHO
 LjCCGqA2ea+uWhwCHnT1IDkDSUabEHywsYD425GF42mGlBJwmVDilGQpn18DmToAL38W
 G6PkscEdjlYHHKPcuZMC0gj0/hahrmWYQNBWtE1g+1y9+98ZY5OXH4c/iHt2tweAClx2
 m0WiF6vBKvgk2vmkXKPR2ldKVofYBQqWCI7xOy/CepXyWKquVD+gjhsx7DJlt8+sIP6q
 n/Rw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772101808; x=1772706608; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uwliuucL0KOD/ELHr9dIgi1S2N2clXrGO4EYwIzujPg=;
 b=hkPeH33gy4NT3xfklfOBC+jVZ3Qn8kXhlv0Jrl9wqRfsax5c2KbgSPBHU06DqwwAZJ
 itwRxpCw7C352PPJe99i1QqqcxnaUIBxdHoteQTNrqRzKOQLQlCYwpSoBYNWlbnrD5N+
 vEnFoBVnsYtZEHmqee9C5kv6oMUkLx8QytpCo/QHn2NAx0EQGLguRTatN9IF+nnnTeQm
 41v6X3qwh8zMFZpLaTZhgIdcQq7e0/alxghiXQgz1WLIKTiyXFgfMyuYEr8g4I1iai9W
 bP+9V23ZpzdUcdCVCF6h901/A8HFtX8r/aQyCxeYIC+y/MczNE28AWY+trg74Ti9mb/A
 tVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772101808; x=1772706608;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uwliuucL0KOD/ELHr9dIgi1S2N2clXrGO4EYwIzujPg=;
 b=bROzJA0EQ8x3S9+hdwtIxAwH74LMO7QVRytnDAeWLK5CHU+qpT3yxtmL5GvpIZz4fl
 oKNUtB/22InJUnnReAmZ8JCv2arA3WtTq1BNAsUZpJMMtZFWtyloZ2hUi06EFFR8US2t
 666ZhAkgo3Yul7mvV8IqiAPvASobuQXl9bRdtU4KB+DW/Fpg3D6lzT1CtXBn8Ssf8xWD
 rMDqthsBG1mqHtiwrKDDhVHsY06NHzcCftbIk/FxAC0K91/EaJyhBNI3di4GMXMJsQiy
 YkMPOlsjW87207LmYHtwM/lkkya9b1rzpu1ZB7t9DQWNje0p/9m1XiyhFvMKw+83LlrF
 xGOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYuP04NwowMU1r2E3Nu8WuyTH5vwSpftaJzQaZMbxssUS0rTfkzN27Pg4saGU/TEZk2AxqDL8zuw==@nongnu.org
X-Gm-Message-State: AOJu0YzvJw4kl8i6mz0kIh+HIAzT7nO0UmOsdC0dfi2tokXVk3dbtYmm
 QLZQIafW+JPIp3ctX4WA4TLWudpEKI/K4REleDUSUssMQeGu7K6oit8CfnC2mANuKi7CK0mIIDM
 hKM7u519LwXjYUx/hoZawy2wm/eiG43OWzTUo7+WecVW1OseSItv+
X-Gm-Gg: ATEYQzzq5YY88LmSzMY6A4fFgsppmS+st9hZ5mMcxkN0C6ra0jk3UMbFR3o4YZAfknR
 n5fGbEpuqts31bLOX9JxyQqQzYJWLeDFri8YEJ+oZhZrUXx85JwG0eWdERzn3vQe1c+cfDBB4v0
 zstc8bM1xaR4x1wvXNqfDQBjs46EBPTIgNnjBZZ1EF3O9RFun2lc7Km9VJZHo4lHzl2k1epBj5X
 ex7Po/oA36Ddgi95UTMYnlvJ3ZRQUMtFeYv9FWWIe85trHedonYVfgKH7cBJxvcY8sV1YQYviVC
 MsRY/RUYF9RYnxGGKq6nywEDy45HO5MhlwDO/AuJs67//TucjxAaQCC02qLgKBv86B+xfDS962p
 SsA==
X-Received: by 2002:a05:690e:343:b0:64c:9aa3:b241 with SMTP id
 956f58d0204a3-64c9aa3b6c7mr6332174d50.66.1772101807633; Thu, 26 Feb 2026
 02:30:07 -0800 (PST)
MIME-Version: 1.0
References: <20260224154347.344219-1-alex.bennee@linaro.org>
 <20260224154347.344219-5-alex.bennee@linaro.org>
In-Reply-To: <20260224154347.344219-5-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Feb 2026 10:29:56 +0000
X-Gm-Features: AaiRm52tAKbDJ_VbkHcj2VyrZbdSxZCT6J5lSiYGWKpbuR8xR5h8XXrxUwRAU-I
Message-ID: <CAFEAcA9qrNt=ZrGUFJhdCiT+AX0OVmG5jWXGmaupCLV4p2TVZw@mail.gmail.com>
Subject: Re: [PATCH 4/4] target/arm: report register in WFIT syndromes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Tue, 24 Feb 2026 at 15:43, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Now we have the register number we can report it in the syndrome.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/syndrome.h      | 4 +++-
>  target/arm/tcg/op_helper.c | 4 ++--
>  2 files changed, 5 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

