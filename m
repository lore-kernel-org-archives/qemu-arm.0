Received: by 2002:a17:504:240b:b0:1be9:327d:8ee3 with SMTP id v11csp476560njc;
        Thu, 13 Feb 2025 02:07:46 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXRpWUkJ8fiLEEFmGfM+czskRJS6xY1FAbyUfFQNl6hhVS56fIi+ERehF+VVuWlh0/YfJx0o8PWdi4TYg==@linaro.org
X-Google-Smtp-Source: AGHT+IHrXHomyB6Nm30Rqr1lNY7oIHwjNQcpEE3d2YNz9skzSK+vodXT8ArxAMOrk6VaqXY07qNj
X-Received: by 2002:ad4:40c2:0:b0:6e5:a0fc:f663 with SMTP id 6a1803df08f44-6e5a0fcf771mr51942686d6.0.1739441266176;
        Thu, 13 Feb 2025 02:07:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739441266; cv=none;
        d=google.com; s=arc-20240605;
        b=QL0sncAcNfzyRugNDj9TvxLpOJHrLljdIWVD1feHXQT7mMMV9ItNuot/NgHA9Yl59b
         Oa5UBRxMM/mVAZ/zSHDYDYP9SB/b3w03w2dPsCBtQsBWA012ephvORWGBo1cgy8g+BDs
         kCoCfmgQY/9PNtz5PV9h8cgcOZJDOJNkOqSHQixvf/1+iBgtyhIWX9l2gUzdpR5io3Gf
         /K8Ep+k9f6SEylhlGmZcOZvUF19ChefLAdP4cjdBQWbHuvWb4nWhpjfrTgWIvvSn4Ds/
         5H7GkUqUR5sO4bGOGLrjgO96B1jit92QKJ0aqJyLTuPxOUXsAwjUKQ+MH/dXCO9Fgwab
         jsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:dkim-signature;
        bh=PZ5dQ17ExUMRMSZCCTuNeXqQv6ynn2YMpbqFuGpGZEI=;
        fh=EeagcBpkGdFfy61hb3XLxCKv1tFpMzl63Vil4scXmTM=;
        b=XxFvoLSWi01edQGkf/8tNyZaJjJqdM4aO6R3K2jtRYXkKg3xYH9bmEvoi1j08ahXAP
         19lA47MlUEPLj5wOMVr165sKY6TZjzAojO1r5132sD7f1aCsQ0e+1TLbQfyZ8Z7JLvBf
         plzu8qxROP0NAWTuQvzwqNcV/HMXffaBOIydDDXhkJ7DIJP+gqsm5Q8N8qD9aWYY8gGC
         SgYWxasDtVdCrKNrqkjO2PJC/9wEt78sixFI4QtDRBruXulY2nchDevvf4ObYripggRa
         xp56vZe6+pR5xSg3EMG7BjpYMT0EyLMHBgH06Vy9y6CEb1R1ASvWjAhMGG4L+K+5BPKy
         vRAg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LV8ZUz4a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e65d734801si10851316d6.66.2025.02.13.02.07.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2025 02:07:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LV8ZUz4a;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tiW8F-0000SW-1g; Thu, 13 Feb 2025 05:07:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1tiW86-0000GK-SK
 for qemu-devel@nongnu.org; Thu, 13 Feb 2025 05:07:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1tiW7x-0006IO-8p
 for qemu-devel@nongnu.org; Thu, 13 Feb 2025 05:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739441238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZ5dQ17ExUMRMSZCCTuNeXqQv6ynn2YMpbqFuGpGZEI=;
 b=LV8ZUz4az/mApP70sMTHbH8LmFPzehtRxq80rkOXfBQnnag5/kPWQiFj8vUJSrWr/8M/IU
 hPRBo+ugxmbkVkbLj3DBlJavQOoTo59YpR0msyndlwCgcQdwEkKmkh/BxZSCJg3VwQkXa8
 cYHAGVB1q8RH4PjWtyNrIL2riUKayiU=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-437-3CTGlvS7MCO7iOfvmpGg2A-1; Thu,
 13 Feb 2025 05:07:15 -0500
X-MC-Unique: 3CTGlvS7MCO7iOfvmpGg2A-1
X-Mimecast-MFC-AGG-ID: 3CTGlvS7MCO7iOfvmpGg2A
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 93F2218D95DC; Thu, 13 Feb 2025 10:07:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.45.242.22])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 00ACB18004A7; Thu, 13 Feb 2025 10:07:13 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3C34521E6A28; Thu, 13 Feb 2025 11:07:10 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-riscv@nongnu.org,  Thomas Huth
 <thuth@redhat.com>,  qemu-arm@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-ppc@nongnu.org,  Sai Pavan Boddu
 <sai.pavan.boddu@amd.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Alistair Francis <alistair.francis@wdc.com>,
 Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v7 01/10] hw/qdev-properties-system: Introduce
 EndianMode QAPI enum
In-Reply-To: <20250212123659.52764-2-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 12 Feb 2025 13:36:50
 +0100")
References: <20250212123659.52764-1-philmd@linaro.org>
 <20250212123659.52764-2-philmd@linaro.org>
Date: Thu, 13 Feb 2025 11:07:10 +0100
Message-ID: <87zfiqi2ep.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: w7eLiOvC31QH

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Introduce the EndianMode type and the DEFINE_PROP_ENDIAN() macros.
> Endianness can be BIG, LITTLE or unspecified (default).
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  qapi/common.json                    | 16 ++++++++++++++++
>  include/hw/qdev-properties-system.h |  7 +++++++
>  hw/core/qdev-properties-system.c    | 11 +++++++++++
>  3 files changed, 34 insertions(+)
>
> diff --git a/qapi/common.json b/qapi/common.json
> index 6ffc7a37890..33d8df19f67 100644
> --- a/qapi/common.json
> +++ b/qapi/common.json
> @@ -212,3 +212,19 @@
>  ##
>  { 'struct': 'HumanReadableText',
>    'data': { 'human-readable-text': 'str' } }
> +
> +##
> +# @EndianMode:
> +#
> +# An enumeration of three options: little, big, and unspecified

Not sure this sentence is worth its keep.  It's consistent with existing
practice in this file, though.

> +#
> +# @unspecified: Endianness not specified
> +#
> +# @little: Little endianness
> +#
> +# @big: Big endianness
> +#
> +# Since: 10.0
> +##
> +{ 'enum': 'EndianMode',
> +  'data': [ 'unspecified', 'little', 'big' ] }

Acked-by: Markus Armbruster <armbru@redhat.com>

[...]

