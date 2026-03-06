Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37618FCC04F
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 17:31:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyZ1I-0003CV-Eh; Fri, 06 Mar 2026 12:31:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vyZ10-0002wL-0A
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 12:31:07 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vyZ0w-00040u-A4
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 12:31:05 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-829b2018c94so25269b3a.0
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 09:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772818261; x=1773423061; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mLwxm/0SwTsmpyOBjsOJSBHPToEMdtQpxNwBuwSAc9w=;
 b=RGEIEC5ps5lG+D6qOZQKmMW5JOE/RZMF/44gSFCtSirLCtoCCHrIBJYTaNeHjp5yKR
 O/YKIrS60IbR5rak3KJM6pwilOI1WoyEUPUuaF9KcS+IUP4waMCYzuebAMN38oS3ivm+
 WN0fK+IsRM+2BaVWT5tK5W3RI2YkyHTqfSWMjyqaa5EigDhixRGa/9iJs21aaf1z+nnU
 eBl4xQr/Tb60+X7nO1Mwb1cPBZ4L1WGN9EZ+ub32nwX54vyLChVaSY7y6xNhch5PgW0I
 BwDOo1HmSZBgaegRu4oXps1rMWWxeoyuJR4Otu70fZAq6bFNbbrdQydvQaOyCPzG1eXR
 FbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772818261; x=1773423061;
 h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
 :to:content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mLwxm/0SwTsmpyOBjsOJSBHPToEMdtQpxNwBuwSAc9w=;
 b=JpYBKLZB1W+6FpMtT7erdKnQm6XYl/uUGmQ0G/eY1lxAPNjfiOJnWncb86jv4MivoC
 avB4RI0igDyDWShnhaD/6yTenVMzuFBnjSoFE2hHptmyilxMLprZnGDCNKxW/VctDbKo
 dPkY6N2yI4lkN2uGl9lhsVsJiT6kJDrwx3J9c2uXShb9n85cehU6e6GKO/VjWOHHxQhK
 wfF0wyGGQS0Fs9CmqL+QompAwRnYYW2jhpvO6i5Jt8zO+skkdUNLc+nnjAw64B5MVUTZ
 YB/5Mft8UEEGwRXgRIxddpTk3FdDFcfl4xKGkKq9K6ZTDGK2ogDObLpJSM777TD+qfSk
 SvfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhf+Q6Dyigp2g3HxbCqkaRBYLNByaXcMjDyXk6U+zWJUOO2xjHhI3oaKwY9abxMpNufEmqzFIfvw==@nongnu.org
X-Gm-Message-State: AOJu0Ywavt+DlVR9djD1SmBgXFRM979kwK00Dy0o1hofwRk5DvuYwPFG
 adM+BlZlEKYTSQ1jo8H3nuFmVQx08iuz/4zoDcdpF46LdgqofMoE+Emkv8F7ALWvjiY=
X-Gm-Gg: ATEYQzzhOayfYbZV3OwQnWXXxh2ec4c9DRlZ+R3ghERvFeHr27St/YKjJ/QrwkjpPcj
 drHeFGM80XmOqjwvKPg3htZEoLmJctlT7Jrsz+xxUFM0OxKUYQ6FhpTM8AZd0TFbF/gT/6ZJuN8
 H656KL3MsKPID/ABmZYpobknM/2AuWA4jqF7ZpbrPiw+1FFJKMopkxLBmdl4a7I2xFdpIgrqPFg
 bF4X1tU0lEHfugIUznrKBOBJU6YjMQMHTSQnV4K0sNfUgWVJvM6ZhznXMkDchk1/wbH5LbvrLVL
 LBbx/CwY8Blp2iV8SUYRy9YE3yM3yDWL9Hs+8PS0G3zGMl52q5MpS23gz0vaN9fBWgtK8PG7KFT
 t8GpzYdmNBCSvwgEZwrn51i1OoX4WOJv+tkiXL9wcH324+Kqq0U1vOEXBYGiWE8iIpUy7L6+lBn
 nc+unLei4+UNd/xF0P49SwZeMUxOkoniRF+Q3x5OfcyWFcNkqwF1I4s9JVZmBKR5Eg2qrgy4uJ+
 bk3QZQ=
X-Received: by 2002:a05:6a00:18a7:b0:821:70e7:b10a with SMTP id
 d2e1a72fcca58-829a2d992bcmr2666818b3a.8.1772818260680; 
 Fri, 06 Mar 2026 09:31:00 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a465743asm2329022b3a.15.2026.03.06.09.30.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Mar 2026 09:31:00 -0800 (PST)
Message-ID: <af25f0bb-72d0-4cbf-89bc-0720c78131c6@linaro.org>
Date: Fri, 6 Mar 2026 09:30:59 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tests/docker: add gdb-multiarch to all-test-cross
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Brad Smith <brad@comstyle.com>, qemu-arm@nongnu.org,
 Kyle Evans <kevans@freebsd.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Warner Losh <imp@bsdimp.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>
References: <20260306161728.2657486-1-alex.bennee@linaro.org>
 <20260306161728.2657486-2-alex.bennee@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Autocrypt: addr=pierrick.bouvier@linaro.org; keydata=
 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
 ZtfdHNZotF092MIH0IQC3poExQpV/WBYFAI=
In-Reply-To: <20260306161728.2657486-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x432.google.com
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

On 3/6/26 8:17 AM, Alex Bennée wrote:
> This allows the gdb integration tests to be run as well.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/docker/dockerfiles/debian-all-test-cross.docker | 1 +
>   tests/lcitool/refresh                                 | 1 +
>   2 files changed, 2 insertions(+)
> 

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>

