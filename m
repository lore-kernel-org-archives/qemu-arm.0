Received: by 2002:a17:504:7fd7:b0:1be9:327d:8ee3 with SMTP id hj23csp421397njc;
        Thu, 8 Aug 2024 01:31:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWKSJ6NeWLcdYSqhQyhnGRlDl9UaHly0l85rpbCrXAWy1qkT2AzTTT3iY3DrZ8+6ZFM33om9p4E9INTLPErQLx1zqczGCK3
X-Google-Smtp-Source: AGHT+IFcNCPMJvNelftEGhR5TwrBvgXOw5P8eXDvE1YS8y75rvUMiuZBp1MXeBCp2rGQ2bh56KQB
X-Received: by 2002:a05:622a:6209:b0:447:d4ce:dd26 with SMTP id d75a77b69052e-451d42f5935mr11103701cf.56.1723105915081;
        Thu, 08 Aug 2024 01:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1723105915; cv=none;
        d=google.com; s=arc-20160816;
        b=lIi/eWn4E3SYYCOS+iZ8vEyUdRGFYYIbkpIlHdBjlDbbTdq7IjaC4kTNL+AuGtUfGZ
         THWuYe1fux0aEqb/SK8Qzaz/sBsDjMg19xLxIABHlL4/fVajlmlF2KnYAeSkbR9eJ7fp
         1IdXkUbRIgvMtjdy1haOTm4G7FW2YJ7RbqyDOMjqcLEoJB1BaubbJIvADp5Ai0cf6J6g
         kILWJnzaExoVk8bkMqubsx/eNGiYWYZlKMTeJysMC8GuQJR50TNKDPHdYXTWs8aPmTo+
         bqwE5HcUUqciQS3KJHmwBNZ7ETnFO4eDWprN/MAluL3sebTMMZTesy1O8TkLptrDcuDz
         whsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=6l0Gy8dFEgUlxYu0trH+/uJ82XK8LXdOH/uUXeKp2PY=;
        fh=0G2XxG0FJJU2g88GjlI46GipVJoQnXKdEREDO0S1mbg=;
        b=BzAR0zvpfW+SmPkKaJIZT0QIBbfqAU/OUtJYMucl4Z1fBJT/NBVAa50WhCByUtA6y7
         LRAUJ3uH53N4W0RSzW8NIh9nvx22dFrT8So+QYP0/gNSPSweaxbb/SCY0Lu8UnTXyPik
         7CBy6/yZZVcwC2uPkmw4YsQ259vMkzOxotdtTXske7naeMH+ZUYwTDlXaV2HPUyfmVsI
         DIJNIH82Wg6iPMsybzuVPlDoc/EtNM5GPxHc/pEKzpIK4C/hhsXDc/nTeo05u3nl2uL6
         6QPE+AkUwfAv+69ZUiAIyLW1BN9gGSyIbSAMQxdLpOCVgv05mxzblu9rqDrZjzmJuH+1
         bLaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tik9HMIp;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <pbonzini@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-451c87d71e0si36800621cf.317.2024.08.08.01.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 01:31:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Tik9HMIp;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723105914;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=6l0Gy8dFEgUlxYu0trH+/uJ82XK8LXdOH/uUXeKp2PY=;
	b=Tik9HMIpe2TCjKnxJLJe16cJa2ed/adW66u5y3MI2Aw5Gq06frvRUpU9IdDfTnZtWUOLr5
	jehcUlOz793vcS751bsrKSbGYL3pJGWNeHXr0jGHZ2Le9bxEM28BF1ERb/Sb70gab2Sn39
	FjIq+1mahkV5VswDGLypqL4hNwXOuks=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-359-JP1dxlk4OTWQ3c9Ibu75Hw-1; Thu, 08 Aug 2024 04:31:53 -0400
X-MC-Unique: JP1dxlk4OTWQ3c9Ibu75Hw-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7a8281dba5so62661166b.3
        for <alex.bennee@linaro.org>; Thu, 08 Aug 2024 01:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723105912; x=1723710712;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6l0Gy8dFEgUlxYu0trH+/uJ82XK8LXdOH/uUXeKp2PY=;
        b=rN1XTE4SAIV0jERi81cxadYOoN+BlTpWcolHbT3WSjX6HB+d7zS/IDF6FV51ryvOw9
         xoFRYUveKcJ8BO0t8O4mjaENGp5q/iHvMSxqqZKl3HcdG1m9bfPgZp+01+awaPGwH2hH
         xXCC91yPdsE5CgMCEgXFaBKB1lVQf9dJ2j5CCL6kRywH6cVMyCKsT9A81WismwqvuFZK
         WDt0fCr7IC5pLaMQBqs/paCdwnCh9SMt/xh39b2ptLjHZpZckCMMlWk18Fq+lUiWKCCB
         h03IZGS5PipJP2eWFzkk+Mb/PEqM01p9EnWvZeVxSVI9h5z6h8onWFWxQ4ScVO/ML32e
         RN8A==
X-Forwarded-Encrypted: i=1; AJvYcCWu+1LQx1mjJNRW8RXoCuVs1yRs9TPZevFAqV75yKPJueW0OlMCgk40++GPw/Qruqh66SSWaVdvfiozpqQ66gCaiyrcMchJ
X-Gm-Message-State: AOJu0YzDD4BFwWKpeWfJvwnvFHQsRN2UG3xQkzR+29lqSMnw9qVEAx/+
	dOc/J4NaoSk2WhksdKqrNWFGQE8++ffE2TeCiYAzFyia3Ee7VdSkKJ65YvkSfKeiK5e6hI4rTqA
	9FkQtsqoAj1oIattCZE2AXDrzVO9nOHlm+5MU50/62WG6UfntN86Rhg==
X-Received: by 2002:a17:906:bc18:b0:a7a:83f8:cfcf with SMTP id a640c23a62f3a-a8090dae6f9mr75520566b.35.1723105911948;
        Thu, 08 Aug 2024 01:31:51 -0700 (PDT)
X-Received: by 2002:a17:906:bc18:b0:a7a:83f8:cfcf with SMTP id a640c23a62f3a-a8090dae6f9mr75518666b.35.1723105911402;
        Thu, 08 Aug 2024 01:31:51 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from [10.168.67.37] ([131.175.147.29])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a7dc9c0ca17sm717473766b.84.2024.08.08.01.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Aug 2024 01:31:50 -0700 (PDT)
Message-ID: <9a83a260-4f4c-477b-a6e1-c8d78d1f3039@redhat.com>
Date: Thu, 8 Aug 2024 10:31:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v6 5/5] rust: add PL011 device model
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>,
 qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Zhao Liu <zhao1.liu@intel.com>, Gustavo Romero <gustavo.romero@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, rowan.hart@intel.com,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <rust-pl011-rfc-v6.git.manos.pitsidianakis@linaro.org>
 <rust-pl011-rfc-v6-5.git.manos.pitsidianakis@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <rust-pl011-rfc-v6-5.git.manos.pitsidianakis@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: O2wyufdR4zHe

On 8/4/24 23:04, Manos Pitsidianakis wrote:
> diff --git a/rust/hw/char/pl011/meson.build b/rust/hw/char/pl011/meson.build
> new file mode 100644
> index 0000000000..a17a823cf5
> --- /dev/null
> +++ b/rust/hw/char/pl011/meson.build
> @@ -0,0 +1,28 @@
> +if not config_host_data.get('CONFIG_HAVE_RUST')
> +  subdir_done()
> +endif
> +
> +add_languages('rust', required: true)

These five lines are not necessary.

> +arbitrary_int_dep = subproject('arbitrary-int').get_variable('arbitrary_int_dep')
> +bilge_dep = subproject('bilge').get_variable('bilge_dep')
> +bilge_impl_dep = subproject('bilge-impl').get_variable('bilge_impl_dep')

The subprojects also need to be added to scripts/archive-source.sh and 
scripts/make-release.

In order to simplify a future switch to Cargo projects, this should be 
something like:

subproject('bilge-0.2-rs', required: true)
subproject('bilge-impl-0.2-rs', required: true)

bilge_dep = dependency('bilge-0.2-rs')
bilge_impl_dep = dependency('bilge-impl-0.2-rs')

with a corresponding

meson.override_dependency('bilge-0.2-rs', bilge_dep)

in subprojects/packagefiles/bilge-0.2-rs/meson.build.

Also in bilge's meson.build:

> +arbitrary_int_dep = subproject('arbitrary-int').get_variable('arbitrary_int_dep')
> +bilge_impl_dep = subproject('bilge-impl').get_variable('bilge_impl_dep')
> +
> +lib = static_library(
> +  'bilge',
> +  'src/lib.rs',
> +  override_options : ['rust_std=2021', 'build.rust_std=2021'],
> +  rust_abi : 'rust',
> +  native : true,
> +  dependencies: [

native should not be true here (but it should be true for the 
dependencies of bilge-impl: either, itertools, proc-macro-error, 
proc-macro-error-attr, proc-macro2, quote, syn, unicode-ident).

I've placed my updates at a branch "rust-for-manos" of 
https://gitlab.com/bonzini/qemu/.  I left the fixes unsquashed for your 
review, but feel free to merge them and post the result as part of v7.

Paolo
