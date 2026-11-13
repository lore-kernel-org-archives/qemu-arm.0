Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8B0606A336
	for <qemu-arm@archiver.kernel.org>; Fri, 13 Nov 2026 18:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=DTXP2waW
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xRwB8-0000yq-Dv; Fri, 13 Nov 2026 13:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xRwB4-0000sv-Mw
 for qemu-arm@nongnu.org; Fri, 13 Nov 2026 13:39:11 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xRwB1-0004dr-18
 for qemu-arm@nongnu.org; Fri, 13 Nov 2026 13:39:09 -0500
Received: by mail-pg1-x534.google.com with SMTP id
 41be03b00d2f7-cd6028ff33fso905076a12.0
 for <qemu-arm@nongnu.org>; Fri, 13 Nov 2026 10:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1794595145; x=1795199945; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mqpsrxXivXXM3+gNVKLG8qOo7zbWs44mAlSZGRan0mI=;
 b=DTXP2waWk/saI60jPDjXKRPBzGGzJl2z/UIXtdEwG0oVi4WgJlVZcL6XWFD4JAmRp1
 ESmZc8Tp3XniTgpaRdcRVywS0zUEKiCu0FZva15yyA2cKC16h9spZO1x/9JX7YUENk5C
 Ptiu1Des562QQzwUMzFpJ/OdQk6U2WXIIVxmUa6DU4flLzLFjTO0afSFvUqlgAK1UqjX
 npPnMdVkAXFgHm4vuQ6gqO9fRAPpFVtOtjMai0c54LWpZUjDP1G5j4icJKuxXa/DICbF
 MFgWs3aKN7pWDVSAwj0KT+QYXmuoqER+4Y1BkVlrWEihK2JUyVpsswvetv7T0oP9nOgk
 Cm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794595145; x=1795199945;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mqpsrxXivXXM3+gNVKLG8qOo7zbWs44mAlSZGRan0mI=;
 b=smPo1AqSFIcrbJF0w3FikNml2rtyzXsHgyemPcOrC+CziWRi3LwebrbIsNxSuROFw3
 FkGCA5PSTaHpsIK4gRkOki9e1ptRAWlLIrWBL3x8dPBW1kGcgBa0GdQISYa53U+4rnXS
 ZGUJerEke/bZXx0myNyekcx9asgxJBqX+oJwKnLLk5jmdycUny+xVAcbtonpvWy7jllU
 cXRrbDQqidBIjRa83qJqkGh4C4CFAOBvi3BB1747cBfD2rr2IYCKM2r58prn1aAnrxgm
 F4QvTrm9iQXvZ7bY2lqtNiKKWoXJf62dxLQ4WDMUc3In+0+hMtbDG44dr5U1F7fia78m
 vTtw==
X-Forwarded-Encrypted: i=1;
 AL+hErE54HL4Onioe4rGPnNarvIqL+80heQLtm09TfWIWt8xvOrTijmBgqKguFzOhtRPdNheYaiIxbjyIQ==@nongnu.org
X-Gm-Message-State: APuU4Z+Sg2eGYMS1STbWnhgiEXXhhP1MxK47b3dEMU6uLXALR0JFF8eW
 /w9fDx5xTFaOz1T83IP+wOG795wm1VPuzqNl4Cjc4I+R++8nlYnaDIfGAQ9WZKaV6JQ=
X-Gm-Gg: AYBFou29QqHPQ8aqXW3/4oA/s/m4rc1bxoF1ayV0W3xqnNeBCAkvFGFlKdqO7pN9zeE
 PeIka5bUBoxGuKc+w5vi0BDMwZ3ijxsL5cf3LEkpmXqGE5NCsemPlwyMmIib7OCCG2vRbGMg9m4
 AYvSRy3hw4Nh1kP/oKe4QG2wOB+hh4lmNwkWuGHkxtS72G4zcmYXoxcZIDAjG2dYo8LABD7mcHQ
 lMtM/oHSidP+p0bUMjZZJ0r/gfRXXIuTh2MSkgTAGheK9XKvO54YmpuUWtbCpl1273E/zchCfQn
 Z0sJR3w9rIWwhKLDLl5UbCrgsm1lIoE7vCoYREHMIphgu2phgesm6xvJ3geiLVXSdnZ4TBGYdpH
 VASkNOmts1vUz7bumHzneQsFTGqVHg8EmOxNV0+B/M6qHYiVa9aHIqu7ltUH3+GADQn1Zp8O6q5
 VKk0Vsk5O+dFkxeDacEYVceswvbcXHAZ8Lhse6mdER9ddaHLvoNnrZw2kp1mKl2D6GKUfiyeTeE
 kza4Q9EaZZ+f8oKA8z/cawbIZ6p/GnmGHj+XR7bQwAhn93wAqdunmrX4oO5ugy3onNaERDjwymC
 AmshKXrYwcQ7RBkTQdVjt+ulnpA4l71p9PC1b5E7OZw=
X-Received: by 2002:a17:90a:c105:b0:3b0:9976:c1c6 with SMTP id
 98e67ed59e1d1-3b1b0b8752fmr3069841a91.66.1794595144872; 
 Fri, 13 Nov 2026 10:39:04 -0800 (PST)
Received: from [172.31.6.230] ([69.196.88.181])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3b1aed74024sm5612225a91.15.2026.11.13.10.39.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2026 10:39:04 -0800 (PST)
Message-ID: <9b64d3d9-736d-4878-80d7-4caa75eee778@linaro.org>
Date: Fri, 13 Nov 2026 11:39:01 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-12.0 v2 00/12] linux-user/aarch64: Support both
 endianness at runtime
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 devel@lists.libvirt.org, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anton Johansson <anjo@rev.ng>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org
References: <20261112180859.85380-1-philmd@oss.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20261112180859.85380-1-philmd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 11:08, Philippe Mathieu-Daudé wrote:
> Since v1:
> - add ./configure error msg
> - cover ARM32
> 
> This series lets qemu-aarch64 run both little- and big-endian
> ELF binaries, retaining qemu-aarch64_be as a compatibility alias.

Why would we want to do this?  qemu-aarch64_be exists, but is 
essentially unused.  It's certainly not supported by upstream Linux.

Having runtime selection of endianness seems silly within that context.


r~

