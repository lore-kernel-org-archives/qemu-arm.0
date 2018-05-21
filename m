Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp345953wme;
        Mon, 21 May 2018 07:34:30 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpeyrzLYSovjyHCniCFwhc4yKEDRZC6poE4GuFjr5vnCYmoAqzzM4c7Ur6A8BKqSIXwlOwu
X-Received: by 2002:a37:52d7:: with SMTP id g206-v6mr17629977qkb.205.1526913270513;
        Mon, 21 May 2018 07:34:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526913270; cv=none;
        d=google.com; s=arc-20160816;
        b=cY1a63YGBRxr3a6lvzpN5NeLYxmGlyXtZUL9r6fPBkLAg3LkkhiqA48/DPU5MyP+Mh
         xmi+bE+MJzJ62t0Q7Ky39djmH+rQfEXGwcYXsd9s7RNq72ykCP++5W4vb6sGPo/6XdLS
         WVaJhTzffA7TSVmkLNmQ/SKP1M2oSZZekyxeM5eKJUqW6+EATSyLm7F86pNQBJvGcF0t
         9z4jkDMwBkOk188CKFKQfFoTy2gpkicAKNBVyvq6ktvH88npM4U+UsDZdNi1E7lIaA2y
         cteol7H767zGVhri8tO5cTCb7YgWJ+Za5bn1D54l3aB/WFmzXyQain5B1b2hCMWfoKFd
         lx1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:arc-authentication-results;
        bh=fc+tpJTlBH+oCEVZ6KicRNygCkYxGJxMOcPLgV5W/sg=;
        b=tXhBCQnikaX0NdWE5gRGr4G+q7s64Y6HMqKpR2kI5ZEQPr2exNlImD/l3Jdov+hrXP
         vKbRVVoxhCjfj/d4yxcG+iG0HvgF35m4Z7EP4PLu2DpCXR7nAJ4oDhk7n/c4viNxnez7
         e/g2Va3Sjmp1/hDq0tCEXC8LkNkACvgo2cWSe0yHxEq0QeWz10un98eiq5D9GJWpJGzR
         tSjaLXofgOKoFxWRWY62tK9GuKPHjHlr4HNlSKuCqs1RX6+CU+trx4tuAP1L1gGNFgpQ
         JAuIYylyCa5wNvhvKma2vj9Lf5pF1Zsrz4InvwR8F0fLTvrRLqU/x5oifULGdtQ/TFBq
         hbMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id v35-v6si457132qvv.283.2018.05.21.07.34.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 May 2018 07:34:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D72A67C6B0;
	Mon, 21 May 2018 14:34:29 +0000 (UTC)
Received: from [10.36.116.54] (ovpn-116-54.ams2.redhat.com [10.36.116.54])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A78892024CC7;
	Mon, 21 May 2018 14:34:26 +0000 (UTC)
Subject: Re: [PATCH 23/27] hw/core/or-irq: Support more than 16 inputs to an
 OR gate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: patches@linaro.org, Richard Henderson <rth@twiddle.net>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20180521140402.23318-1-peter.maydell@linaro.org>
 <20180521140402.23318-24-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <c049f864-304d-f8ee-4b2f-1476a602be30@redhat.com>
Date: Mon, 21 May 2018 16:34:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180521140402.23318-24-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Mon, 21 May 2018 14:34:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Mon, 21 May 2018 14:34:29 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-TUID: 41lFD2UEHt0j

On 21/05/2018 16:03, Peter Maydell wrote:
> + * VMState array; devices with more inputs than this need to
> + * migrate the extra lines via a subsection.
> + * The subsection migrates as much of the levels[] array as is needed
> + * (including repeating the first 16 elements), to avoid the awkwardness
> + * of splitting it in two to meet the requirements of VMSTATE_VARRAY_UINT16.
> + */
> +#define OLD_MAX_OR_LINES 16
> +#if MAX_OR_LINES < OLD_MAX_OR_LINES
> +#error MAX_OR_LINES must be at least 16 for migration compatibility
> +#endif
> +
> +static bool vmstate_extras_needed(void *opaque)
> +{
> +    qemu_or_irq *s = OR_IRQ(opaque);
> +
> +    return s->num_lines >= OLD_MAX_OR_LINES;
> +}
> +
> +static const VMStateDescription vmstate_or_irq_extras = {
> +    .name = "or-irq-extras",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = vmstate_extras_needed,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_VARRAY_UINT16_UNSAFE(levels, qemu_or_irq, num_lines, 0,
> +                                     vmstate_info_bool, bool),
> +        VMSTATE_END_OF_LIST(),
> +    },
> +};
> +


Why do the levels have to be migrated at all?  It should be enough if
the IRQ level is either migrated manually, or restored (e.g. in
post_save callbacks) through other data that is migrated.

Paolo
