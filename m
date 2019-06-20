Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1871506wrg;
        Thu, 20 Jun 2019 05:40:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwlNT3ezT3VB0/0G31NnWc5EqCICUMfP+ZC4R0skemHZKLBIhb1JhdwwkZzILZ1gk+ldquo
X-Received: by 2002:a50:9871:: with SMTP id h46mr120430042edb.69.1561034455739;
        Thu, 20 Jun 2019 05:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561034455; cv=none;
        d=google.com; s=arc-20160816;
        b=ZE3SZGOH5nhIL6ixBCi0yEQ5i1NYPJaZPb1LvIyXiCeuuS9ZOl3Lu8KwVVaRqQm9H3
         lTZsSqLh8YxNwjrDlKjfwhFtBT5wLefzMiUrP/JUFLYMHFvNbckK31nLLtZKd4JHbk95
         T80iC6BUKTZvS71gv/Sjo8qzXWRZ4OLwEoezh0UYNgfvHQZx+t1Pv64mtfzpGOMqbWC/
         eORCUk8Chtmxb8YnGLs8iuIzskLeZ3hdiNY6h9mFfySj5pEiy9/rT801taoxnYaTmiqf
         Nco8T51R/mC3weZgiIdqqJ5HuoWHidwduuvlMpl5xAnCasFRa6hcZUDcSLyWuX1Ah51p
         Trrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=mgGsWZ7RpLieNPl1OdcvTd7XUUPmgnrTmm2SW/IfNVU=;
        b=NbwLo4hQjCGnXwFhxjwrSDFq2Tke/LAr7GVSwm4UHaKgriQD5yrD0MIkQq8cYPgBqj
         FSG9dkjeQxpRXXR+Eok+CXaMOVEV4aCKm290ttc7Se1ZYqgEKrunvvIBpZ3BCWRYcnNs
         75Hu+mHkLYnh/5Ho1lwa4ru6D7mxrakiHl7YiBB48Mg0jQ6Kev34i97rz0fu2y3EIdz+
         smOaPSKe4wOWmtJQSkEmqVb/hI8ib7KBE5v70u1PaPnMzwYiHMq+VIxSHiN9INdpOObl
         jsxLfX9NEJSkl67BIoYOkLTRlqodqzRUgS2aZWVbaeFjExFQ2MHbFdPZ/aX1qii9zxuZ
         PXPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si15674064edd.21.2019.06.20.05.40.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Jun 2019 05:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47376 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdwN4-0000Zv-Ps
	for alex.bennee@linaro.org; Thu, 20 Jun 2019 08:40:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hdw70-0006KH-FM
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:24:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hdw6x-0001QE-IS
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:24:17 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42727)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hdw6x-0001Lg-Aa
 for qemu-devel@nongnu.org; Thu, 20 Jun 2019 08:24:15 -0400
Received: by mail-wr1-f68.google.com with SMTP id x17so2796213wrl.9
 for <qemu-devel@nongnu.org>; Thu, 20 Jun 2019 05:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mgGsWZ7RpLieNPl1OdcvTd7XUUPmgnrTmm2SW/IfNVU=;
 b=hmHyuXFdxAEZl6Pr7ZT00vfm13kvtzcl6YzZzcWbdsaJjA2K2ExC1biGr9TJWEsnBZ
 UrI2HRDJ0CegaLFsiNyE6GoC6sHjM/TLQ/v7FOMMt9Jgd0NxfFu+LAiLZ1vEehH0J5qM
 Qi1f69N9RRt80rGbuFfY+3ysPmgmWJ2ynNihKs5v3PvN97YAdQR6ORGp3YdoYb+2CkGY
 IHdTgB2/qomv5GyaD/L7ghuJhHiNoKyAzEIU/0odarTbSMcK265IsM/NGky/1eGj3RMh
 vsj09BgIlXTbtECqBSKR8o0G6s05VVSDPJ6+iAM0ft1uJNYUZi5GA8Wpmnh2RP9x6gKu
 DVQg==
X-Gm-Message-State: APjAAAV9wMaGGgi8NcL8yQFQel/MNGNzhSmM2fzFtQi49yD7heKcATjP
 Zw+sASb5alM+kl4A7XrICSDVTQ==
X-Received: by 2002:a05:6000:112:: with SMTP id
 o18mr4521498wrx.153.1561033450967; 
 Thu, 20 Jun 2019 05:24:10 -0700 (PDT)
Received: from [192.168.1.38] (183.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.183])
 by smtp.gmail.com with ESMTPSA id z5sm21126219wrh.16.2019.06.20.05.24.10
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 20 Jun 2019 05:24:10 -0700 (PDT)
To: Laszlo Ersek <lersek@redhat.com>, qemu-devel@nongnu.org
References: <20190620121930.9729-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <fcffb9f5-3723-2f4f-3898-9f5584d3696a@redhat.com>
Date: Thu, 20 Jun 2019 14:24:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190620121930.9729-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.68
Subject: Re: [Qemu-devel] [PATCH v5 0/3] fw_cfg: Add
 edk2_add_host_crypto_policy()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0aDKird03Jf8

On 6/20/19 2:19 PM, Philippe Mathieu-Daudé wrote:
> Hi,
> 
> This series add edk2_add_host_crypto_policy() and the Edk2Crypto object.
> 
> The Edk2Crypto object is used to hold configuration values specific
> to EDK2.
> 
> So far only the 'https' policy is supported.
> 
> A usercase example is the 'HTTPS Boof' feature of OVMF [*].
> 
> Usage example:
> 
> $ qemu-system-x86_64 \
>     --object edk2_crypto,id=https,\
>         ciphers=/etc/crypto-policies/back-ends/openssl.config,\
>         cacerts=/etc/pki/ca-trust/extracted/edk2/cacerts.bin
> 
> (On Fedora these files are provided by the ca-certificates and
> crypto-policies packages).
> 
> [*]: https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
> 
> Since v4:
> - Addressed Laszlo comments (see patch#1 description)
> Since v3:
> - Addressed Markus' comments (do not care about heap)
> Since v2:
> - Split of
> Since v1:
> - Addressed Michael and Laszlo comments.

Please discard this cover, series sent again with patches properly attached.
