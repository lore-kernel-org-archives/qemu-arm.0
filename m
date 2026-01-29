Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A05D6101A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Jan 2026 14:57:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlTSY-0005ZA-Fb; Thu, 29 Jan 2026 09:57:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlTSX-0005YA-34
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 09:57:25 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1vlTSV-00086Y-KF
 for qemu-arm@nongnu.org; Thu, 29 Jan 2026 09:57:24 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso9184925e9.1
 for <qemu-arm@nongnu.org>; Thu, 29 Jan 2026 06:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769698641; x=1770303441; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BXcITGy9w0W3fyqFhyVbdgg7cvIr1bgdc45oKr7ecw0=;
 b=rh4TFy62SOxCRsSKgTIhNLby3TMTg7vKE9UDWLJbrEU2NOW6eMVy2E47Poh0Uk5Zq0
 m27zoPeVR6PguQfgduObjiSca+iYGW0dfHVP4+560/0djn7B/NPhao1XimTU4g8oDfLe
 /Lfqznh9IVZSJ0IleRDwWpHGup7lNtceG2k5tLyw/e2Bf9ODxrZrYqhpdlCey7KPtGLm
 3YcYtQWcXosb5hANPUc54IKfMhzfXd1AD6AlWWr0TGQaDqWz4Aznj6E7YhAddSDf3kcF
 xq4N1sNt07nm4R35FOXEn+eT4B641/B7q8XVB8WAq76aybdR3Oy1iCkYcoM8uKW5k/lz
 DrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769698641; x=1770303441;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BXcITGy9w0W3fyqFhyVbdgg7cvIr1bgdc45oKr7ecw0=;
 b=IekIpkLhjnvmwXscjxlzwl10X42gQSVZbfkEYjmC8n9ukbrNY9YUtdAeTH/1u/xs6d
 J6wQ46I2Lt9oZYWNO5riT+4Oa+kTMkvdcYJdQUR8ew26rGB9fmgM8D5FEzHDpmM84Op4
 S5ftNS6C3GluMf4uT8svRSLprRTDGMyHVeOTrJMlu5gCyLupHZTQfJ9HBCMUCQZkBER1
 jMu+gM03RfQkYbcvJ+jVNiEh9mBBN6DNF3Agpiv9CZEGrDIetjrQ93VqQQ8D1oixN5q9
 5VrZ65p5jSgo8uc0YFwdvBOU4zA7/Z++wrJNA8mcpKLks8dzVmKwsW+DvqpVT+2mwM3W
 g6VQ==
X-Gm-Message-State: AOJu0Yy2wU+2i0hne4M8GlMJpBo1lvLGVUBXSyO3PxavJKws8T+3haBI
 5I41TGOUNaVnUJePiWSx4775X6pJ4rVknB6qMlYroPg2MJVWtgeyGQY3yDyVcYjWonA7gyvZF2i
 dptEh3Bo=
X-Gm-Gg: AZuq6aK3J/oqNEmUwcm3MCD2cBJPhzngBRu9x1C5zCH5qm/9E/802l0VZSFCk0PovGy
 5/ZBq6Tavd/+D9iOI3909nqWY/PTNwpTtTFB4WGYzFyPtJ2PIdwrg9IQpNWXVcmjCyE26YVcAEU
 C5E6VXbrkWfi7Bu4ofWqO/KLq/6+4vofIzVrS0+uegQTuUqEKfYBIJsuQpaYuyPOHj7/T1t6pwi
 2i1eaOYJ9MEbCJ6rexyVqm9hcGqkmvrCEJyKf6bVcTZPksoLwTRKdzK6AF878vAV134anJyq1D2
 ynGLyH1DhvLTPTA3l/nAkFG8EOw/IxPA4oqXhE+t10S+nzRZY3iu+MlxOsn1ejpzG0X6ceHJpDG
 hN4ZCjKlBejMRKd4wAHplI/BXef/LbaXZ3kLtOXtS9nbtL5T2l4+Oe7VN0igs1Yd2FOKDXwp2cz
 pFZwqQ7Y1YmfA=
X-Received: by 2002:a05:600c:6092:b0:47d:586e:2fea with SMTP id
 5b1f17b1804b1-48069c3a7abmr113593505e9.15.1769698641399; 
 Thu, 29 Jan 2026 06:57:21 -0800 (PST)
Received: from draig.lan ([185.124.0.126]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806ce4c515sm132828375e9.11.2026.01.29.06.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jan 2026 06:57:20 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id BED8C5F878;
 Thu, 29 Jan 2026 14:57:19 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org,  qemu-devel@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  Manos Pitsidianakis
 <manos.pitsidianakis@linaro.org>
Subject: Re: [PATCH v2 4/6] target/arm: Handle SME-without-SVE on change of EL
In-Reply-To: <20260129113455.1283266-5-peter.maydell@linaro.org> (Peter
 Maydell's message of "Thu, 29 Jan 2026 11:34:53 +0000")
References: <20260129113455.1283266-1-peter.maydell@linaro.org>
 <20260129113455.1283266-5-peter.maydell@linaro.org>
User-Agent: mu4e 1.14.0-pre1; emacs 30.1
Date: Thu, 29 Jan 2026 14:57:19 +0000
Message-ID: <87cy2s8o1c.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

Peter Maydell <peter.maydell@linaro.org> writes:

> aarch64_sve_change_el() currently assumes that SME implies
> SVE, and will return without doing anything if SVE is not
> implemented, skipping a possible requirement to change
> the vector register state because the SME vector length
> has changed. Update it to handle SME also.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

