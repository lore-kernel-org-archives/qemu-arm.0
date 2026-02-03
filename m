Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E062E83047
	for <qemu-arm@archiver.kernel.org>; Tue,  3 Feb 2026 03:14:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vn6ru-0004zt-VR; Mon, 02 Feb 2026 22:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn6rt-0004zD-UN
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 22:14:21 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vn6rs-0007VA-5E
 for qemu-arm@nongnu.org; Mon, 02 Feb 2026 22:14:21 -0500
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-2a09757004cso41237965ad.3
 for <qemu-arm@nongnu.org>; Mon, 02 Feb 2026 19:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1770088458; x=1770693258; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k8y0Ur4c1ycmWmli80FOWvHrOLOPYukHs01JFDWgQW8=;
 b=EgNEivWRcqA/PDcgtKbz8zPFY/DtrP/gv9AB/+mJ6Y1slb+0gRBt3WY2XRUIrTlNZe
 yP9B4ivS/5lq7s/ERwfDn7Avmj7WqvyIUas6hO+dySqr9pZNVLPfsQHpmuasjs1e1akh
 DykskQk7+2ljOZzN9JLWgXzVoiaBCYqHsWmkR+LiCgKihVfnOhBdrM1Zj/+k6Q1J0fGB
 xH0I5lcoqa2KpaCRL5v7UpKTbqyo2jmhhK50BJDXlypuoLNVPODB/S5noLA+Uflopamj
 p/gyNRWeNHbx4cq8rEY0KiMzISGTPFuObOe5IX9QVgqB2U3yZNkDPrX32BFR5/mcNIWS
 vu7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770088458; x=1770693258;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k8y0Ur4c1ycmWmli80FOWvHrOLOPYukHs01JFDWgQW8=;
 b=SIPqAKk/41eCnpdH7GrHYdLH4CqmcPyW3XwGB7u9nzg/9DUrE2uATbEGeR1Up+hVGS
 i0tdHFYUbvY8fUzKfdeBbxD5Z7+ZsV0o0ZqKPE0SZB8irULibwsaAbT0ZEz5ViQqu6UO
 2GcawEYe3hp9Y79K2t/MU1stWJDUlgqrzbzMbGk19y0tJqV/EIOtmT0zEmovzL86WyXb
 JTwxo0pR04JfeJoepoQO/RAmf0KXMEo9tcZKBWO65QPB93bvEGxON57mec758DKO6N/M
 N7myoFlHaAdNH11zT+sCQvFVF4rjE/TwDTQmFwBoK+sgwgTwFObe7RDbb2WdRk5Odrha
 eGSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd7PUDrz8URKbHwTomRwr1eMD5jwzA/T+T9BT6ooA0VLs5mcRI7urY8Z/mi2x2C0Mj705c1j2H6w==@nongnu.org
X-Gm-Message-State: AOJu0YzSeCxHxondZU8sXrKVohSugdxuKDXG0OwtP8UyOgaCYe3qL+Cv
 c+qgU31XVLyJqv2TAUKgv7WQRQ5ntnE3CieXeCdmewe3Nf5Y36OuYLwDfKSMmsZcRS0=
X-Gm-Gg: AZuq6aIJ2ftt6zwwChPz7RfmwlqfWM2ethrBgsIZKkXBgQUPxkbsEsSqaMdXv+4rtYZ
 OKOWVS2XRoSiZC5isATtDYrhhsZ01mqynCotz/+HV3lMVMH0niAHsvENjEJjherR/3YElteAF4D
 2Si7ohDYgM/DjAfB2rGxAlFCYEWqj8oNr3zOKVUvDFo+nfOOxcjFpUtpQemCm0LSCp7wBNFJyOM
 L1jt14SQGovC1pEQrwSYeKUcOuJzR0CqSPyMXd34CIPnhN7gqFQsjShsPRazzlY79/BWFdwrQUR
 swEXa/bcO+DZvK/mf0WgUQEBMpt5uhqN4GfO2LsduLaPmloOWM/WQmevjBQX4reB7RecVF43cMP
 sxNqVo/q1abHjnqhsMnbfHo/5p9IX3yU4+FSmHE6IAsH+AqCOGx4dWnvLfWmoujG8A34J6rkBUt
 gr7qThRQqPej1cLrMEic/DrXOhwHPucMdUjxeSS0lKJSC/gcd5CKQkVsM2p8iNaCMF9QXG629z+
 qoobN7dICYsgQKagECU/qBUvtC1jA4ffNs6to4Wcw==
X-Received: by 2002:a17:903:1cb:b0:2a0:de4f:c9b with SMTP id
 d9443c01a7336-2a8d959aa6cmr137909145ad.4.1770088458248; 
 Mon, 02 Feb 2026 19:14:18 -0800 (PST)
Received: from ?IPV6:2401:d002:dc0f:2100:1047:c02f:591b:6a5c?
 (bg30dhzn7h1zhjqnvj08.ip6.superloop.au.
 [2401:d002:dc0f:2100:1047:c02f:591b:6a5c])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b426e3csm166594315ad.44.2026.02.02.19.14.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Feb 2026 19:14:17 -0800 (PST)
Message-ID: <d9114c73-e1b5-4e2b-8b11-b7023c206f38@linaro.org>
Date: Tue, 3 Feb 2026 13:14:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/15] target/arm: Don't let 'sme=on' downgrade SME
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20260202133353.2231685-1-peter.maydell@linaro.org>
 <20260202133353.2231685-6-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260202133353.2231685-6-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
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

On 2/2/26 23:33, Peter Maydell wrote:
> In our handling of the boolean 'sme' CPU property, we write this 0/1
> value directly to ID_AA64PFR1_EL1.SME.  This worked when the only
> valid values in that field were 0 (for no SME) and 1 (for SME1).
> However, with the addition of SME2 the SME field can now also read 2.
> This means that "-cpu max,sme=on" will result in an inconsistent set
> of ID registers, where ID_AA64PFR1_EL1.SME claims SME1 but
> ID_AA64SMFR0_EL1.SMEver claims SME2p1.  This isn't a valid thing to
> report, and confuses Linux into reporting SME2 to userspace but not
> actually enabling userspace access for it.
> 
> Fix this bug by having arm_cpu_sme_finalize() fix up the
> ID_AA64PFR1_EL1.SME field to match ID_AA64SMFR0.SMEver.  This means
> the "sme" property's semantics are "off" for "no SME" and "on" for
> "enable at whatever the default SME version this CPU provides is".
> 
> Update the documentation to clarify what 'sve=on' and 'sme=on' do.
> (We don't have the equivalent bug for 'sve=on' because
> ID_AA64PFR0_EL1.SVE only has 0 and 1 as valid values, but the
> semantics of the property are the same.)
> 
> Cc:qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/system/arm/cpu-features.rst | 10 ++++++++++
>   target/arm/cpu64.c               | 15 +++++++++++++++
>   2 files changed, 25 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

