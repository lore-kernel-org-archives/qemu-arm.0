Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCE78CA0EFF
	for <qemu-arm@archiver.kernel.org>; Sat, 30 Aug 2025 18:24:06 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1usNo0-0004GQ-1b; Sat, 30 Aug 2025 11:47:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thiago.bauermann@linaro.org>)
 id 1us8Iw-0000tP-C5
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 19:14:46 -0400
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thiago.bauermann@linaro.org>)
 id 1us8Iu-0004tR-BL
 for qemu-arm@nongnu.org; Fri, 29 Aug 2025 19:14:46 -0400
Received: by mail-ua1-x92f.google.com with SMTP id
 a1e0cc1a2514c-890190da557so626896241.3
 for <qemu-arm@nongnu.org>; Fri, 29 Aug 2025 16:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756509282; x=1757114082; darn=nongnu.org;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SXA0e6NQn/DMrZIRbXW9RSTecrnWBuqvCvxMokaMr9k=;
 b=u3SlBtpq+ALBI4EWo+IJBcwiZwM7SZUQTC0pgVbN67zMXRli+7oMYwVYEY98vr1sK+
 fK1YTrWnhHOja6zeh49CIspNizTYkiHiDn+gyxJq511hpqARcvyNKuR1cyKFhSQMsfUJ
 yQ88C6tFCFmXh4FI/2r9mKaP65c7diTPjdNlE2UlnxPJ0Yk2zaOpQfEwfe0fb2BsNvlu
 1WC5oj/r7AhT4BO0ZVNbVc7FqQX1Y5dSYqbvcGbpf3YYcAeff7Qb5288faWIthbKXxWo
 gJY6aUqgGfYU07CzKSQngIQSKsxE8/ws9pTZ5D9JSCqKM12LfHYLbk96vOq/0YCkMnXX
 +u5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756509282; x=1757114082;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SXA0e6NQn/DMrZIRbXW9RSTecrnWBuqvCvxMokaMr9k=;
 b=JeWBEZ4cfZ6uSrWsD1yP9KTTJmOmQHkU0ORuC/bf2EjVm0Vux9W9akDnfUPX19evJb
 G8YT0bFnmGvPC17mbi8pwVXeRuBsG9CpR5zFMtk05fFLiSVu9W6KnmsnJO/rgYRNnfIz
 OgMpJAnM+A7uhmy46OY7VD0jRkQCWBOUXsUQMoONpeRLZA0fzUTnfSIREMnKbo3LkcT3
 YcQlnTLyu7HgvWtWE35lWGrUssIa+A7CiTouOPyM0mWAZFhyF484I/zFybcAWQV6qPyh
 AaPNRD3nKGBBQR9Vc7epuOe6kgyE/sLov3WiuPjr8RK9T3KgBwsxqMM/RiLDO3V8dkcY
 kLZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWHBSOTXX22V7JX8ixb2a4ke0NlNnPSsIMldt9qKqsRbpSRy29FZtYg6G73L5wgQHTQftBB87hQFg==@nongnu.org
X-Gm-Message-State: AOJu0YzfA5plzr/wVnB8Tl7ERx25ov1qSEDaMgIBoCuy2USF/BDj2Z4D
 u/4Z3Fvq5xonTcXL8FE9IUHQZb/58kFTt+XlsuFvy7Uuuhje2xTdspnjWMGt9j3Qiy0=
X-Gm-Gg: ASbGncu125jCPpRUdl9P984aBM1ymPpZ7n1l5WG5ZYPDZOeEuBPyP3DbA8IOzMxuB6R
 51TCwG5jF5VtlYmze5Uyc85wVuSgx8Dhz2NL8iQ5s37YC/NJAgvvVPpy36P2FVXer7FuvEDy5eV
 GUCqu9g+T2S0rCW4IBijmadjM2kcxi/oZLqDnCA3C1ENtScm2mxkjo9mp58/dUEPiOSJz+Q9B7w
 33WSbVQ3ZqtP58iZrmVWfR2CCQf4AtL3QdHjW8boknAPjdIlieKWFrafW2PIqkr0LpqjwpotAcb
 +mRSIny2heoWPKhInESjaV2714S3UZ2slD3YAqe1Qslt0whZ7M6jTLBAUWWm83psJPE53i55yUY
 yBA4LXCQZvyfJX2RwYspiOvsCoLGDbbo=
X-Google-Smtp-Source: AGHT+IEvwwMQoEqh0dgnANx6uBLDqYvufu+iEOWsCAJ8SQiTTI0w108A2L1cn+52ntkn1Z3BCvqXEw==
X-Received: by 2002:a05:6122:659b:b0:541:2e11:6738 with SMTP id
 71dfb90a1353d-544a02a9309mr80095e0c.9.1756509282546; 
 Fri, 29 Aug 2025 16:14:42 -0700 (PDT)
Received: from localhost ([2804:14d:7e39:88d6:4d63:9b22:f928:fdc])
 by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-5449131c808sm1623391e0c.13.2025.08.29.16.14.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Aug 2025 16:14:41 -0700 (PDT)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH v3 00/85] target/arm: Implement FEAT_GCS
In-Reply-To: <20250814125752.164107-1-richard.henderson@linaro.org> (Richard
 Henderson's message of "Thu, 14 Aug 2025 22:56:27 +1000")
References: <20250814125752.164107-1-richard.henderson@linaro.org>
User-Agent: mu4e 1.12.11; emacs 30.1
Date: Fri, 29 Aug 2025 20:14:36 -0300
Message-ID: <877bylk9er.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2607:f8b0:4864:20::92f;
 envelope-from=thiago.bauermann@linaro.org; helo=mail-ua1-x92f.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Richard Henderson <richard.henderson@linaro.org> writes:

> Based-on: 20250727074202.83141-1-richard.henderson@linaro.org
> ("[PATCH for-10.2 v9 0/6] target/arm: Add FEAT_MEC to max cpu")
>
> Tree: https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-gcs

I tested the branch above with my GCS patches for GDB and everything
passes. Thanks!

Tested-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>

-- 
Thiago

