Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2142967lfc;
        Sun, 15 Mar 2020 13:44:53 -0700 (PDT)
X-Received: by 2002:a63:c20e:: with SMTP id b14mr22642194pgd.394.1584305092870;
        Sun, 15 Mar 2020 13:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584305092; cv=none;
        d=google.com; s=arc-20160816;
        b=En7hrbk5oovbwIkRlemFUiLqBMO2bO8zWXx0BXJ92XHeG4HZiBBbpKcslYFEm4B3LZ
         +ICa/Ev2D0HL29Nfi5m+QPWGQXKayb6ai9xFIztcZZCRGg+5tN6QIDd23t49VlJfYjF/
         vvSg5Rb9tBy8wx+o8LAA5ERF93GLn2Q7v2VMUFGclEk+hiEhZhRgHJbd8l7FIb2yobBw
         2qJTyt/0jFsLJt2bPqHN/46BZrJaR7m1zMkdz8vhKc6GoWY7TqxPm7EsjFAnGvPumPgW
         ZKvReBtt0mjaivVTYwB+MDpt7BcMoc06m9x5pfqJzC7UBMyR0aCdJ0ADPmzV5soDby15
         nIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Bcc33132wue5L6xWl0qdTO+jUBha20tXX4c+HRpEd0U=;
        b=KHd8BpbzHUE2lxIEyoZS8zIErZae5y6yv78EhDOv28dMuUbvpQZmkVnxnkYbnp/c3y
         WYmU7mbMnasYlc2dDb5L+ttNIgBxCOBwdbREByNRFd4uRJKJw/TxhwjUpsFxJlLZ5H2w
         Nb0I3QrAMfGBDXqp9EZ9mncz3Mvpr862f7Ru1Sa7gl5VY3YTMxjzwlWF1dBzjmMOteqk
         63LYAXMwYxH5VOv+ouGw5jruHXtreQdBfIDTeVv7TVDYYO1x9XH4+83tBbgaSeOD4xUy
         awxLIceZ91/SsHGs/wcsQpS5qITIjerUXY1z4Aag8xp8R+G5v2lCI0BgYmeMiGrosWHG
         H2gQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f4e+Q/GY";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n8sor18158244pfq.57.2020.03.15.13.44.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="f4e+Q/GY";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bcc33132wue5L6xWl0qdTO+jUBha20tXX4c+HRpEd0U=;
        b=f4e+Q/GYztxTGgIohU+ZUpbG193GhozninwhFE/Hc40VgjLMvSeo15v8WMRNnNlC4S
         +b1FCeXlnEDCuJ8rojP+X8t3pfiBjX7xq63zwr7ODcl79f9OTnY7y8k1hFMPxFfe1V3M
         dugq6DzDVAzcmZmTE0ODP7TcQlHFWqZ+KbHB9gaB4pEsU6QIwmT/FqEVFUoiXKXHfmIk
         tsaXYfVinietrGXNfON1bBHM3vs8jsi0cknmH7N3lYzzQLtZyqMOP9krPxsfy3SvCw10
         0xug7l7iRtjZfHgo0dqYpFFt1Kptlu6P2rIk+SiHLzJVQV65qmtX9eKlGNWkGOLTL9zK
         c39g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bcc33132wue5L6xWl0qdTO+jUBha20tXX4c+HRpEd0U=;
        b=fWFrkqSXe8G9RwEypNEfLdynkbO2bkxOq13C5aYmcV0wN96m7Cvzcix6y73hzQ2gh7
         oAEMQ3EGsygA1MqsiiCgt/HmB87oIp+v4Mks2qgPIVhoO730i6zy8q/DqXERFLJ2Gk8x
         PuZv+xM5dWfe9zF8gx4uv7p0u8DcbnCmMnl06PXVKC8jXB5v5+TT727Z5Ir582JkaL4y
         cOny1+rYkm3a36fkNHu5JPgSnkrl1wRvb46Nvv8BraInQ1V544Ueyq9tnzSpurTQqzvs
         JcrjpK0k3CXI4o3kxTE53CzzDSRSLIgtxVOY/SW5Y6MYPY+/piIrNbPHp6VrT7j2axFo
         SwSw==
X-Gm-Message-State: ANhLgQ0Is0My+mdTE7Hql+TWWFvJnKwUvoWK1Az9B0xzqv5YHVn2dpf2
	geXLelsCb7WqzjEfZILH04zFPDD9
X-Google-Smtp-Source: ADFU+vvtP3uW9LKERfhJChn5oNpU3hlqP9xmv+mLkTuDEmTJ8JQvz1UJ+xgk3zuIfDnKafJD16j6bA==
X-Received: by 2002:a62:d144:: with SMTP id t4mr11916177pfl.10.1584305092408;
        Sun, 15 Mar 2020 13:44:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id y143sm15475592pfb.22.2020.03.15.13.44.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:44:50 -0700 (PDT)
Subject: Re: [PATCH 11/14] target: Restrict write_elfXX_note() handlers to
 system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-12-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ded109e8-ceab-752d-c938-66d5386c57b1@linaro.org>
Date: Sun, 15 Mar 2020 13:44:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-12-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: a1zuxCH8IIxG

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/cpu.h                | 10 +++++-----
>  target/i386/cpu.h               | 18 +++++++++---------
>  target/ppc/cpu.h                |  2 --
>  target/s390x/internal.h         |  3 ++-
>  target/ppc/translate_init.inc.c |  2 --
>  5 files changed, 16 insertions(+), 19 deletions(-)

Hmm.  Or an suggestion to generate guest core files for user-mode upon a fatal
guest signal?


r~
