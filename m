Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C4ECAC5A8
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Sep 2025 11:57:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uzDFQ-0007JV-M0; Thu, 18 Sep 2025 07:56:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uzDFN-0007Ak-LA
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 07:56:22 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1uzDFK-0004or-47
 for qemu-arm@nongnu.org; Thu, 18 Sep 2025 07:56:20 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45ddc7d5731so5432465e9.1
 for <qemu-arm@nongnu.org>; Thu, 18 Sep 2025 04:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758196575; x=1758801375; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ea4dGLZwkNAAjB6aRS/oVWq8L6qzJHadECqmXARy89A=;
 b=KPx+iMM9ZQEGQeTuwDW/WJ63Z+mwphiSCu7LeFClH52pn4EBG4A+6aBjlDd8YTt8X4
 WeJoMWywqANbGV0QsbEBuAo3j7H+B8Y64fLW9PEupr7kXUPqDJrBNXBvkKhedmdDdpTj
 witkmlJSn7mqk+DvCtZqlPYx7/BxNKRjWCdEueVkqskvnOBsgk7EGQ1dSKUI96mjtwU7
 HzC+Rcp1fc2DjBGRCJehLpUH0ZDR4damy4AB3tev7rPlO3FcN2ty7NYWdrM6/dSAgKcG
 dUf/33xyMhwaD6Mvapf7pgxPMAOu/qUMZ1wUQzwTOkCFl5iH6e2MEURrVUbyWYkSUIQC
 MjuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758196575; x=1758801375;
 h=content-transfer-encoding:mime-version:message-id:date:user-agent
 :references:in-reply-to:subject:cc:to:from:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ea4dGLZwkNAAjB6aRS/oVWq8L6qzJHadECqmXARy89A=;
 b=QgFQMovgVen8YzH5UmHPrbi3hM6d2+Lut+guNhOz1cqvZpwY641vmQBXM6VoOkSFbP
 CdxNcKrUguEJSAy95jq0QDp6V68eh2UERWiRkyz7jBhknj5hWfkPqj0PNPBJ9rICDizN
 y3uuIVIVN4xjH55HdEd1A7B4cWw5LaVQ6AV/972I7Tri2sbeyOJ8H4mvcAO/IF6eQ0gy
 omHWHdmfDxukbmDj1HEauDADh2D3RvM2UBctY/WRg2N4GmMtN1SLcO6hihbVUie1kCfr
 Afoj/uNakH+DJR4kFG3P5rLSYDco2Nu25M+3YhO6MGLSM8PAIjQAXR2Aeh9fSxwfQHs+
 DUjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbn3jJ/v1iV4AEVDWMxYBYsYcFLb2P4Uxw9x13cL/xVBCvOMNpUyv8yB7pJRcEm5v9UPoRCIz4dA==@nongnu.org
X-Gm-Message-State: AOJu0Yzpet1/hjDuGIdBXK9MMiY6jXOt3wUeuVx0cGfZMp7MWFAtz5t/
 VwVyPz6trrIuA3/IwnAS3/bdZaYExkl5hxpNv3rxwFi6uxtrYkwyzzZRVS/Gy/M9YqQ=
X-Gm-Gg: ASbGncvjc+38YDTHVm4VbX7yGK5UtfxrOT9l7A5o7XC2TGwpbstsYRxPvWOH6wPW37z
 wJ+7JJvWaOzpph6iKspyMsUEEurgUuPw753GqkELx/GVfaX3uMDJlqBKqP6L0wI19KWbUGvZUST
 SS8tkRnVyGjWCF62WYXBTJMEMYfqkb2NcCVtQcZFq61fznbdNZqnelBrQbXhqNfaBIBikN7svIb
 ZZXuqbkJpfC+ll/xAUoQmO33D36WJuqc3ZV/Ekh4ZOYX+d6QkyeXwi63A2tQUVNIpqu0fwHpOiW
 4y4pfLbOb8rnzsL9EyJW0WfCHzu387pb5B9cOoMZpSjwo1/ucf7Y6mVzJDwvjThmirZLE8bISik
 4eBj6jghhipjU/eRNSap9KhFp/yKokjNx9K80LijX/g==
X-Google-Smtp-Source: AGHT+IGVamkNTcu9utD5pHxzuFfZ+jhfrZ9TwzK/0zXfYIby6q9QLkSPedCiw9zxurwYCpq6P6JcTQ==
X-Received: by 2002:a05:600c:1991:b0:45f:2869:c3b2 with SMTP id
 5b1f17b1804b1-462072d723emr55655395e9.33.1758196574857; 
 Thu, 18 Sep 2025 04:56:14 -0700 (PDT)
Received: from draig.lan ([185.126.160.19]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-464f16272e4sm43170925e9.9.2025.09.18.04.56.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Sep 2025 04:56:14 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F02FC5F8AC;
 Thu, 18 Sep 2025 12:56:12 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  Alistair Francis
 <alistair.francis@wdc.com>,  Weiwei Li <liwei1518@gmail.com>,  Palmer
 Dabbelt <palmer@dabbelt.com>,  qemu-riscv@nongnu.org,
 richard.henderson@linaro.org,  Daniel Henrique Barboza
 <dbarboza@ventanamicro.com>,  philmd@linaro.org,  Liu Zhiwei
 <zhiwei_liu@linux.alibaba.com>,  Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v4 00/12] single-binary: compile once semihosting
In-Reply-To: <20250822150058.18692-1-pierrick.bouvier@linaro.org> (Pierrick
 Bouvier's message of "Fri, 22 Aug 2025 08:00:46 -0700")
References: <20250822150058.18692-1-pierrick.bouvier@linaro.org>
User-Agent: mu4e 1.12.12; emacs 30.1
Date: Thu, 18 Sep 2025 12:56:12 +0100
Message-ID: <87ms6sm0tf.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
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

Pierrick Bouvier <pierrick.bouvier@linaro.org> writes:

> This series compiles once semihosting files in system mode.
> The most complicated file was semihosting/arm-compat-semi.c, which was ca=
refully
> cleaned in easy to understand steps.

Queued to semihosting/next, thanks.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

