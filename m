Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB0BFF885A
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 10:42:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKDDn-0005MZ-Ku; Tue, 05 May 2026 06:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wKDDn-0005MQ-5G
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:41:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1wKDDl-0002WN-4G
 for qemu-arm@nongnu.org; Tue, 05 May 2026 06:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1777977703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=V//fsfMUxv1ZHb3OiX3nESqblOeGIFfGzDhep/Lup5c=;
 b=BECKLgQbc+6xA7GgOmXTeH442HmC6gczkQaPRXyLeUgeEGJFGBnlGw0BhAdOsP/zK2OAKC
 nJQlEjRS0Pk27JQzsNv+sU7C54kpirrBE7rqu4zCNeJ2W0g2BAop0UH5I8IURamoLDaRR+
 BKbTBEmQdfRYjhaa/a+vs8gw3BwYUrw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-OjT2pO7qN1C_zcKSIwmHKA-1; Tue, 05 May 2026 06:41:42 -0400
X-MC-Unique: OjT2pO7qN1C_zcKSIwmHKA-1
X-Mimecast-MFC-AGG-ID: OjT2pO7qN1C_zcKSIwmHKA_1777977701
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-4411a1f9601so3786094f8f.0
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 03:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777977701; x=1778582501;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V//fsfMUxv1ZHb3OiX3nESqblOeGIFfGzDhep/Lup5c=;
 b=cD9y4aP32khUV0R8Z1tKlI88rOo0DaOF5UeVVT6vC4XaMnjcmrXKI44xNv/CaW+Wu6
 vBLNkIRRZtxogwuDRV3EQVo1mixrQ7S/MikA7sBOvhVvxg3/doxgJ75B2FljagnjvJo4
 BUpn4qwIvhwavS4liGAC5UlEvIo8A6GtZxjcaxPXdBdaxU7duOxJFf5ZmCWzXF+cy6qJ
 oWbswimpx2psPiJAst7Zgky0f1eLeQSukHJ+5To8dXg/gidEX0KArSA9J7zi480oGPLY
 OvDnFf6zcEm4sLYsLKR2Zr4QOBKqYa8JSq6lqyOQjcRYUPTzRHbJNAg1mnIW7gzDagc3
 DGTg==
X-Forwarded-Encrypted: i=1;
 AFNElJ9OVNjJHIxguxIi9y71NExz5YbkBnNsBsjgHl7DfWiKGf+Iyu6IWNaTits9okknFzjUFQzAE9xoNw==@nongnu.org
X-Gm-Message-State: AOJu0YxSwAGLWKLYvZQsA94KzOcRbopy0a/jKHKEWXFRy/Vy7ze4gLyv
 8FP5Cg6Ef6OMUZt6KKHj/CWc/qnk4C1NvQCa9KxvueeacPeG7ROs/r9ph/jfqwLuJK4j3ZIOfrD
 9SPxJcSWmfQCRib7kHOtR7Gy0MePLFpFCSh50q0gB/B5BYRi+GexXeg==
X-Gm-Gg: AeBDiesOVdt8RdyA001sFX4kDNIkCnBW0DKAbX84rgQJGtCxoo2xI6PlHFTF7sOKHzC
 RT9jJ5oMSDN4sZa+WUQxIwJfeIZnZ1X5DvqWM4yE/LekBBwxixymaUfCshpPSMo5yFpq1M9Ioh+
 qQVSaY3FXWK6GaVZJ5XM/g1fIzf5ysqhhIQ0SqXh7e4tkarNU5wEF6VlAZvu16/7mzRFEqCWpQn
 KyjDra0I6rFbm57MmZLtSlnBQvsyoZ6Oo3+OTdKqlT4qei/VbdKFbJXdkgHjfsyCzrOmMPx6dhP
 dPleJu+0lGALX5hqtm/Oy4vPO1OoZtKli/8ZoPduyXHpXZ43f/H92nuTBonxgKZ+vbOHWRDy0+J
 KHFxTRAfeYNM8SzNW/XrV027Vc6LoSw==
X-Received: by 2002:a05:6000:24c3:b0:43d:761d:5423 with SMTP id
 ffacd0b85a97d-450041b05eemr4772915f8f.16.1777977700985; 
 Tue, 05 May 2026 03:41:40 -0700 (PDT)
X-Received: by 2002:a05:6000:24c3:b0:43d:761d:5423 with SMTP id
 ffacd0b85a97d-450041b05eemr4772852f8f.16.1777977700579; 
 Tue, 05 May 2026 03:41:40 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.115.164])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45054b02802sm3530487f8f.17.2026.05.05.03.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 03:41:40 -0700 (PDT)
Message-ID: <d74d057c-f0de-494f-ae13-eae218469620@redhat.com>
Date: Tue, 5 May 2026 12:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ci: drop cirrus MacOS build
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <th.huth+qemu@posteo.eu>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brad Smith <brad@comstyle.com>, Fabiano Rosas <farosas@suse.de>,
 Kyle Evans <kevans@freebsd.org>, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20260505103649.68361-1-alex.bennee@linaro.org>
 <20260505103649.68361-4-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20260505103649.68361-4-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l0BLJpTbuM01kFhku4WSbokQ7Jgc6l5-lvu02XZG1s4_1777977701
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.443,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 05/05/2026 12.36, Alex Bennée wrote:
> CirrusCI is closing down soon so time to migrate.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   .gitlab-ci.d/cirrus.yml           | 14 --------------
>   .gitlab-ci.d/cirrus/macos-14.vars | 16 ----------------
>   tests/lcitool/refresh             |  1 -
>   3 files changed, 31 deletions(-)
>   delete mode 100644 .gitlab-ci.d/cirrus/macos-14.vars

Reviewed-by: Thomas Huth <thuth@redhat.com>


