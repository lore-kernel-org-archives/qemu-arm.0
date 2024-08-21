Received: by 2002:a17:505:917:b0:1be9:327d:8ee3 with SMTP id hq23csp168959njb;
        Wed, 21 Aug 2024 00:24:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIJ8Q01ij+Ehi1YYhhvLzE5sTTZpJEeVm7i6H7rswr5OuwAMEQoV5EpO/xFl0OpslNDNVHrHDYdwtpLA==@linaro.org
X-Received: by 2002:a05:600c:5493:b0:427:d8f7:b718 with SMTP id 5b1f17b1804b1-42abd2449f8mr11849235e9.24.1724225075403;
        Wed, 21 Aug 2024 00:24:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724225075; cv=none;
        d=google.com; s=arc-20160816;
        b=lb0ZjftDmFjfh72rQG3XQMVgg6QZMw+eyRlxnZucgahAdPmSIQFxrna5XIk01UQbLM
         cxRGmPGJmnQW4OLFr4uNRMUxePgXY3fZxzT6TPl7NIg4zlIXzhLU/gPd71w+BCDdCOZF
         z3vaLcRfP+ycWxMyekrfZvic7qWDcxKWanzKa4yjAUzjC98p9x/3tVtdMQZnMUclpXnJ
         703WQSJ3IGtgA5pep27Ep45+xVN2yDY1l622L4HM2t2akaCPOU+f7bUZRhk5ZsVnmqEN
         LdcXHEHcV3Xlm/+KzRDZ+km2yowOdNvAbNLxzCQFJh+OHCiUtUq0ob0BgjwS3CB8g2rN
         9qWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:dkim-signature;
        bh=jGjcH8Pmwuc7DxR1Lmg/Gb1PDCFtSLxYhj1L8wOnRoY=;
        fh=wtekWp7T6IMvCOIkLZTjSL7omlzmfv0FoDRCXGmgWvU=;
        b=PNI+R2ceBD/zPXp7JD564cbH3hoZGTqm0/5taQyoJEMDl5XrjnPLIlCoZNzMgrIbkb
         Tkz77m/Nztb2ZEpQ416tRc0Rw1DTZAjqp3cSt2vhY51jKZdp1GGo1uGeZSl9sDQ8KomF
         Z5i+G8jWfByMO1iubdWG2CeQ2jW+DPBK2LDpFBqtYZ3KybbDUnbGTSpSSf1eQqT3dkFr
         ZrBz906UVlx2R3SnFg6lwMDDuvVnMARmfNWQQI0etsSowWr9yGAOYqnr57cOxMVGoN1o
         HxO3nyXHLtigZTHuW5kAe8NWs35sBuR2QCJ/RIbOnjjwpvFcyra2kVVmirOSj+GCGJ8o
         alpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H8jDtOw5;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-429e805a744sor44690975e9.9.2024.08.21.00.24.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 21 Aug 2024 00:24:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=H8jDtOw5;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724225075; x=1724829875; darn=linaro.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jGjcH8Pmwuc7DxR1Lmg/Gb1PDCFtSLxYhj1L8wOnRoY=;
        b=H8jDtOw5tJNO11FJlEy4OPkxNpNNY+R1PRsAoU0QtxKpKCnimAYICZNkIX957EsAgD
         zYW5MCKXJ1c6NXfMimrYEVpuqKuITjRMAeHzOpmaUD9gcZed0DY0UEeuHaoYGEYT8P+p
         0p6cEXLZBkcb8iJ3HsR25xHudDdMvlS44ZTBGUli4VbU/QW2+LvJkesCyjFr7zdPVnwp
         0xPQKsBtliMHQCWGEH7BtXOHhj01vIJRG+W1tttqbukCbiWyfLKjR+S8HVoyMtesqhTL
         nonOV4h+sDgvYi0r0aJiuvt8F0VZcNoBfj1V1IiX8MZfm+Dlw9BNi+dE9yXZOQKFNloW
         25vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724225075; x=1724829875;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to
         :references:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jGjcH8Pmwuc7DxR1Lmg/Gb1PDCFtSLxYhj1L8wOnRoY=;
        b=tiYCfpU/Kb0+wGEjCeIyhXbsG/bto0OR2EoHaYaCNEcbrGO6hSTc38MPh+0hvcks3l
         QrOASvWwKoo8MkqbFwOk6qtURY6P7bkim0nWFVwiuIBvyemCSXOEZ4XwVBHdb3fTUXeU
         C0VGtFuT9XdL80uGB8nXduJipoZjkrpWv4N+srXXdxmjcijh0JN+Lu63fbF0UzfETjsl
         MRxsiiSEoN45gZ0L5ShtEte/GcRu94BBSjk7xg7wH/hMvQmNi7eB+7Za1QEF/r2mUbLK
         SVWMWc0bBeu1/KZch8vJtTy8gPAXyiginTbTYT5292AXCXiBInFaplAe6cphe9yKqLpl
         U71A==
X-Forwarded-Encrypted: i=1; AJvYcCWq3ELPwaes8A819Cg0swem8H+y8OADK8arxByST9+4Xyp/TrsJuK+ZMQZSufILsg1Ed8Vxe3FPn0cRAQ==@linaro.org
X-Gm-Message-State: AOJu0YwJPRPV42Fl75Hvu4xgd0VHWD3EpsUVnVLUZ0OfivKD0Uc3i/sO
	PJzq0fegiYEdI+pGtE/CZUF+HBUmFWXa4ilDxqtUe/x7DVWcqws1st68Of1KJvPVbA==
X-Google-Smtp-Source: AGHT+IEApsZUZvXZmgHBhgCvsPSCVM+K9OZrjqwnH7zX5X1lNf6RAatwQBOuZk44gIYfgz1bRz5oaA==
X-Received: by 2002:a05:6000:2c2:b0:371:9360:c4a8 with SMTP id ffacd0b85a97d-372fd57e737mr1019209f8f.6.1724225074517;
        Wed, 21 Aug 2024 00:24:34 -0700 (PDT)
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from meli-email.org (adsl-122.37.6.3.tellas.gr. [37.6.3.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-371898b89bdsm14861983f8f.112.2024.08.21.00.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 00:24:34 -0700 (PDT)
Date: Wed, 21 Aug 2024 10:24:05 +0300
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
To: Philippe Mathieu-Daud=?UTF-8?B?w6kg?=<philmd@linaro.org>, "Daniel P. Berrang=?UTF-8?B?w6k=?= " <berrange@redhat.com>
Cc: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Marc-Andr=?UTF-8?B?w6kg?=Lureau <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>, John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>, Alex Benn=?UTF-8?B?w6k=?= e <alex.bennee@linaro.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>, Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>, ARM TCG CPUs <qemu-arm@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, Junjie Mao <junjie.mao@intel.com>, Pierrick Bouvier <pierrick.bouvier@linaro.org>, Richard Henderson <richard.henderson@linaro.org>, Gustavo Romero <gustavo.romero@linaro.org>, rowan.hart@intel.com, Mads Ynddal <mads@ynddal.dk>, Markus Armbruster <armbru@redhat.com>
Bcc: 
Subject: Re: [PATCH v7 6/7] rust: add crate to expose bindings and interfaces
User-Agent: meli 0.8.7
References: <20240815-rust-pl011-v7-0-975135e98831@linaro.org> <20240815-rust-pl011-v7-6-975135e98831@linaro.org> <9f6c96fd-bb0c-4014-bba1-70986f4bb384@linaro.org> <Zr4ZbOHR9Sc10YSX@redhat.com> <6f009629-fbad-4868-bc12-21a18de379b5@linaro.org>
In-Reply-To: <6f009629-fbad-4868-bc12-21a18de379b5@linaro.org>
Message-ID: <ik4kw.0ewrm1y9xy4w@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-TUID: O2QORGz8l/j9

On Fri, 16 Aug 2024 11:34, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>On 15/8/24 17:06, Daniel P. Berrangé wrote:
>> On Thu, Aug 15, 2024 at 04:01:17PM +0200, Philippe Mathieu-Daudé wrote:
>>> Hi Manos,
>>>
>>> On 15/8/24 13:42, Manos Pitsidianakis wrote:
>>>> Add rust/qemu-api, which exposes rust-bindgen generated FFI bindings and
>>>> provides some declaration macros for symbols visible to the rest of
>>>> QEMU.
>>>>
>>>> Co-authored-by: Junjie Mao <junjie.mao@intel.com>
>>>> Co-authored-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> Signed-off-by: Junjie Mao <junjie.mao@intel.com>
>>>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>>>> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
>>>> ---
>>>>    MAINTAINERS                       |   6 ++
>>>>    rust/meson.build                  |   9 +++
>>>>    rust/qemu-api/.gitignore          |   2 +
>>>>    rust/qemu-api/Cargo.lock          |   7 +++
>>>>    rust/qemu-api/Cargo.toml          |  23 +++++++
>>>>    rust/qemu-api/README.md           |  17 +++++
>>>>    rust/qemu-api/build.rs            |  13 ++++
>>>>    rust/qemu-api/meson.build         |  17 +++++
>>>>    rust/qemu-api/rustfmt.toml        |   1 +
>>>>    rust/qemu-api/src/bindings.rs     |   7 +++
>>>>    rust/qemu-api/src/definitions.rs  | 108 ++++++++++++++++++++++++++++++++
>>>>    rust/qemu-api/src/device_class.rs | 128 ++++++++++++++++++++++++++++++++++++++
>>>>    rust/qemu-api/src/lib.rs          | 100 +++++++++++++++++++++++++++++
>>>>    rust/qemu-api/src/tests.rs        |  48 ++++++++++++++
>>>>    rust/rustfmt.toml                 |   7 +++
>>>>    15 files changed, 493 insertions(+)
>> 
>>>> diff --git a/rust/qemu-api/Cargo.toml b/rust/qemu-api/Cargo.toml
>>>> new file mode 100644
>>>> index 0000000000..51260cbe42
>>>> --- /dev/null
>>>> +++ b/rust/qemu-api/Cargo.toml
>>>> @@ -0,0 +1,23 @@
>>>> +[package]
>>>> +name = "qemu_api"
>>>> +version = "0.1.0"
>>>> +edition = "2021"
>>>
>>>> +license = "GPL-2.0 OR GPL-3.0-or-later"
>>>
>>> in particular explaining the license choice.
>> 
>> Semantically this is an overly verbose way of saying
>> "GPL-2.0-or-later", so just simplify this.
>
>Indeed. Manos, please use GPL-2.0-or-later to keep it simple.
>
>> 
>>> Should all rust code use it?
>> 
>> GPL-2.0-or-later is what we expect all new QEMU contributions to be
>> licensed as, regardless of language[1], so this looks desirable.
>
>Agreed.

Thanks, will replace it.

Manos
