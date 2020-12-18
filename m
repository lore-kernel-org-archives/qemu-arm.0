Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2327659lfq;
        Fri, 18 Dec 2020 06:10:44 -0800 (PST)
X-Received: by 2002:a2e:7e05:: with SMTP id z5mr2023341ljc.353.1608300644486;
        Fri, 18 Dec 2020 06:10:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608300644; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0RGIeML4e7nYAOPbaQLfpq9DnxYK0lVWTASNw8+pa0T74Z+/SE8fyw+Voajba0crF
         WQlA/AfHZg2drBa6z4feqNaGN4zC6ls3e8PKz2E/Tf2Uf16nTDEPP1Ma/LCI2vGmj6hf
         lkXWiyjHc+zGededbpQ16i10ZuxidBTQp6RZWPQvOXQJdVbCUGTnVMXkC5l2ktLrAqkb
         sDcuV9XQiGFwgk7166OexTt/5uZ/0n1Ur/+WOJBX2xqqfpngGmf4J5xQmhoneqtWySN+
         Npk8h8CQmky6Q3IZHPbRsDhhgQ2QlD7TQwfQiLzVQgEUEROPBDBY0esYlPNgqGZpQSEX
         7bPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=Icab2t581Ck4QeC270P5fiAfqxwfrPopZCszLQQScwY=;
        b=OPq7f/5N28Mr+nIMMtX8Zkw04UYVW3eGhGdxTK0mTQ951U42gfDxcqNBqYFUI4+uvr
         DfQ1tPJlyOUktC+YPaIKK3PNJC7IO/OL2WyaZiJuYExKBQ7mqckn0tlUV8S/6Wb49AwP
         sQq3WIWZ/3+9D8ZK8YiSPJTN8VYP460Vkdu1D8SDUyWowYi6S5jsC5cdDKHZK3humuCe
         orVxkWnc6FPCmxqLVSEMvYKCqrBhBrhgH73PWo01tj6DcsB247N/dnFp0E7mLjPVed1b
         2iAiGvKK7wiY1NCTDnSmqfDsfHc55pXTfN02ZPz4whI9KBQ2eE5alt2zR21oQsNgaYNL
         vLXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JRT7WLwV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e27sor9225176ljo.34.2020.12.18.06.10.44
        (Google Transport Security);
        Fri, 18 Dec 2020 06:10:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=JRT7WLwV;
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Icab2t581Ck4QeC270P5fiAfqxwfrPopZCszLQQScwY=;
        b=JRT7WLwVDF7J+BV0mV2sQq+vWJa4zYMf1pyQPoemuNg/Ho2TMr889GxT7DfycHMRSt
         l0yByQ4jQrjBa5EDOy7yeQeSj5d9icK9Pesweu8D7CWjdT3E9Mgn9Td+7BLtazbvDz9X
         +W2rIvCE1zxFvRZpRkhP0vdd0WkkVq3opGqaGeoETM/V0fRXNnJeDsO3IdXYWEO4Egs7
         xAtZ6XygqI8VdDLbT57V3eINNvoGCP1Ft/H/6DxYm4GOIBnUHrNFGDhcoFi7TwQpj+55
         ujpEBN2NxyUuL5wiNuXpahFHGSe9SYrp1wzrftMSZ6XFZCnrkJxd3ItCZFP5ZduMM4KG
         15WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Icab2t581Ck4QeC270P5fiAfqxwfrPopZCszLQQScwY=;
        b=bCs7/KlvMxFpBFsj9Fi6Noux70BXWNINwqteqjoVNGcxpBNnd6gPeRzzZehoXcAMAo
         kMneRHNrMoiQjIZdk9noDo8Ex4lAzjNfe2i2k5kyu8UkAFVH4/HrM/bXcNP239LGBl/b
         /3bLAmIdqMAKvan/+OPEORvFEATF+4VMDQsU+Xf5BSRxKSLoYQHWBN+y1cusXK4pBO2Q
         SeVrokZGVFzlPJT6Zazgm2nYdFqc30YWTFuw6XQBYZqg/oFhFR5qHhYacZWeqBKHDZHn
         /l9bEXXeCtdrjUmTrkbIBPb+K5SKioSQ0EOQO3+E9yN0gGoT0DBO6GkJ2xBqG7lCTY0k
         y+fA==
X-Gm-Message-State: AOAM530hcmTTHHPhgljtoM2siDB8CVzivA1yWWPtZ+DTlGzaPopJ4T8w
	un2xi33RPEZpwsEKsgo+52M=
X-Google-Smtp-Source: ABdhPJzusSQcpmaHegR7i1GvQ6Cd6Wvw0+O4nnTnefthvlgcT1V/bRaAwci4oD0qyz3x7tbMm87KjQ==
X-Received: by 2002:a2e:b80c:: with SMTP id u12mr1902535ljo.490.1608300644273;
        Fri, 18 Dec 2020 06:10:44 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [10.101.1.184] ([185.224.57.162])
        by smtp.gmail.com with ESMTPSA id x138sm938286lfa.66.2020.12.18.06.10.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Dec 2020 06:10:43 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v2 6/9] gdbstub: drop CPUEnv from gdb_exit()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Peter Maydell
 <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20201218112707.28348-1-alex.bennee@linaro.org>
 <20201218112707.28348-7-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <abbd5586-655f-c3c8-409a-c2edad3e798b@amsat.org>
Date: Fri, 18 Dec 2020 15:10:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218112707.28348-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: qKnF5cWkFiiM

On 12/18/20 12:27 PM, Alex Bennée wrote:
> gdb_exit() has never needed anything from env and I doubt we are going
> to start now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20201214153012.12723-5-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/gdbstub.h    | 2 +-
>  bsd-user/syscall.c        | 6 +++---
>  gdbstub.c                 | 2 +-
>  linux-user/exit.c         | 2 +-
>  target/arm/arm-semi.c     | 2 +-
>  target/m68k/m68k-semi.c   | 2 +-
>  target/nios2/nios2-semi.c | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
