Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2117813lfc;
        Sun, 15 Mar 2020 13:07:37 -0700 (PDT)
X-Received: by 2002:aa7:9416:: with SMTP id x22mr25382146pfo.100.1584302856860;
        Sun, 15 Mar 2020 13:07:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584302856; cv=none;
        d=google.com; s=arc-20160816;
        b=ci4qGDLuAkbHgb3k9+EaSo3tMYTBAtFTtk6AB8Jtx3QKsfhZRPb/8eNdlpXfTZc90n
         FvDS2duBAv0Pnj0L5cSaMMuhm2xKRpsOvk4WW0K0OIGlUM/vOUxx2+E02coqauDTdsNR
         gldyTbglRygA67YQoQ6v6s3NQQZHSHnB14g/NOA6L0A+49ftoBpjOd60Cm4LtfzJVhkp
         OESK76oAgyswjDVxMWOK3DGlJNnE/kvY5DrZA+3QPHKF9wUxdVdjN7t1Ao/PI7yZyiOu
         RmcSDhOg5TMRfO+wT7tz0bhyLfAkQjr8xOohfmJ4ucUTAzN7KmrbbO+KorogZAyDX9Qc
         o31A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=AfrTK/b6k0acUn4IW674vAyc76w/gBDaEBHOCoRtH74=;
        b=nn0s2pvKEW4k+AOYVrZGKepKE9r6x5EEzA2CBxQCFaUheedKek7wLMQFAuRfUfS4YO
         3MoEyLUxrSB+c0JFf/ERiCeReQZ7WAZgdnUVh8DxOdfjxcjueIHKIUaQFpZ9SYfYS9nI
         0bR3bA4pvvWICUSlphylTkIcvbyJdc4ocxDpt5/LoKm7kkodYhxzUUilEODRde/MNfrS
         4ZIZmn7s2j82WtaW0Wn1w+FJfPtCC/ObDXST4kldBLH9eZklh+BaT7CWBVWVQDN81d4Q
         GAdvlTyXzrIx8FBUNcQr3BmRwJmhFMByGWGQM87bPqQbuxsazktfuCGEFD3UkwZeKhfL
         aZOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tOe3XXuB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y67sor17989421pfg.60.2020.03.15.13.07.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:07:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tOe3XXuB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=AfrTK/b6k0acUn4IW674vAyc76w/gBDaEBHOCoRtH74=;
        b=tOe3XXuB2QWgliU9Opdz9RfD1OXqF1tgipkrV9v9NFtP22NecnEdyP3zBsS9dv7uNU
         FmTm2pnPTuXBX8RPsRtlb5hioIrWDoJKfidDtD9sGmit06pNvrEDJ8dBI+mEZte+aZjr
         nN91N+MCX0eJEunBEonVF3g+6a5Ab9JP8NKJuS1Ep0bH0ykLDfXpuCaB1EtuLCIPIJTM
         CLgw8Cky2PK0LYDLxZNSxEP3MqKuVyRMm9tMeMk6JEs/PoJb8TxY8rddHNSsIF4ZrdtX
         V2n5m7Bkp7yocw7uRoYzTIu7RRsmUhh4QkFae6gIs18h55I/9EkMzxjX+3UzLgLzVhdv
         41Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AfrTK/b6k0acUn4IW674vAyc76w/gBDaEBHOCoRtH74=;
        b=q9duKE3vTpBgjHlCHWyWDmu9hwvYSxnyHwa0vIiiKX76sRNZJJmwX4gYjHTJPA990B
         GmkSOCSVAYZh6KvsGwNqrqLV3Ck3Eqa1de+43ablBulxOfiQ1MF/kwItnGDDYcskYmiY
         9acrfbmGeSyGEZJtM3YrtZbeTxxQlSYFZ6SN/4ShHxXYfJralEz1/S2xsbQPo4xy9S2/
         3QZy4lnqYYbTlVzF77257/7sNNUt+ZmMHxlUe7HTbm0OO7MhrXBMXy1U61kFugZlotxG
         Jl6ROricJ01R1jJLzxQ1rlSOaz5HpSpht9kzyWuBxc/o1wuTtWuRriCQvnKZtwZSOfjc
         v/dw==
X-Gm-Message-State: ANhLgQ1LnldLWiynxgM2k2NZj3b2knh1ktF8iVHisGve7N0vTQbzqYk9
	OOChgofQk8eaUGklX/mj26Fq84OqeQHCRg==
X-Google-Smtp-Source: ADFU+vsueR85ye3lPcPONMF5ThCBFNP2R9hCqzd2OsZCP01oFAPFIc7A3zZ6pvPCcmNbjyEOYngj0Q==
X-Received: by 2002:a05:6a00:c8:: with SMTP id e8mr21563883pfj.131.1584302856321;
        Sun, 15 Mar 2020 13:07:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id s25sm4460709pgv.70.2020.03.15.13.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:07:35 -0700 (PDT)
Subject: Re: [PATCH 04/14] tests/Makefile: Restrict some softmmu-only tests
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
 <20200313183652.10258-5-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <942d57d6-b272-c2c6-b2df-405d81d03996@linaro.org>
Date: Sun, 15 Mar 2020 13:07:32 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2gFsVHgFQ2Hm

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> These tests fails when configured with --disable-system.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  tests/Makefile.include | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

So... they don't currently fail check-unit.  Did you mean to say that they
*will* fail once other files are disabled?


r~
