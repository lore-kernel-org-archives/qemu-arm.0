Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp1846955njb;
        Mon, 29 Jul 2024 08:16:51 -0700 (PDT)
X-Received: by 2002:adf:f052:0:b0:369:b5cc:58b1 with SMTP id ffacd0b85a97d-36b5cf23b8fmr5610578f8f.18.1722266211183;
        Mon, 29 Jul 2024 08:16:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722266211; cv=none;
        d=google.com; s=arc-20160816;
        b=zLGZFMxRxSSssUPRNAj4fCjo7KLHKembsiMLU1w+3OYCGv/PrWfJCvAqG0tq/Z+krB
         3YhytRRxGoMVdBR04AXI8UytzrNxATmtVF2VdDxN9sYDfHS9PGL4cC7VoCFp5e9W/jXZ
         PpPlD11iZqRGYwsKYQTQrPJFSEqaSIqfhJyixlOjMG3afvQzaSlJ0CDXvXctmWx+f18d
         ToxcYdhplOirD0k/YJef4nRmN7bCPuNPVOkJ8hLdRuOBYPa7/QPKH+CGGlGg67+7MeBB
         OP99i950odBu3SlF70XJ/dfCE6gCp4+Hq7vPRIT9kOSdypIxwioSOfLrm+4NzOpi0vGZ
         b+sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xvL3BQalaYHs4MQ6olvlQNu2RsDNFqFTsx9/slDdZE4=;
        fh=gUW4hSboMkqtq+LmmnwlQ2YvzO5fDItH08Zl3PXREgo=;
        b=skRhvnjEuA+WgsOoL3wswJ2FFGX5vtdO+lkuWUjDQYgwWmYPRePJwbaw0pMywe4yKs
         wbTuo3bcRsk+6BDfegILUkBfi698igaou0pjSXR8JvJLc+S7xI9rf8KC1NPCxuRtrwTK
         RmtJ6BiR+OgS7Tg6P/CexCAAB8x7yRnAuiAeaIwTY3YATvYvHnbl/Wak2zQ+oVXTb0tV
         tEFO5cLzjguOmD2AVxuKMyDE3t4PvfHaF3DK3qWOatARUbddn+iYbmIuCNIG6VYcGmqR
         NxWuLae1xyn4GLAm7VYSotrEILQqyoCIgPyqcNSD+fd1yqvS67sUZRkdgzMboJG0tRsu
         H7uw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+1tPyOa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-36b3685d1d1sor2725589f8f.8.2024.07.29.08.16.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2024 08:16:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L+1tPyOa;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722266210; x=1722871010; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xvL3BQalaYHs4MQ6olvlQNu2RsDNFqFTsx9/slDdZE4=;
        b=L+1tPyOafOaw+RcALDwBioedqb1iMrHxN0cl2hLfst0Ueovdlv1qYVzaT2t57DThj4
         uXsoD7+fpQbLEUPr1Q1qMyTmLjIbi4/wNOErTrwfL3noyBeLR7cCOGBZKriPSSRpGGdt
         ndldHQXi4jqkUFi8fKZg/enlJn5WG/2yYYN9rvdzqodeCmVzkfMLP6FBHzwzgA6TdgYr
         VnF+V/uhEQF3vRn6nff55lXzMvDVd/OnMsMEPN8VgtD6Etubda8EOUrgHPIU3PeUPxPe
         Is+q7Z+2/7Wrizu5r478HmGcXXxaHBLRE3thhcqyq5ScwJReAHWAvMCr3dwy1y7aoQRE
         q7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722266210; x=1722871010;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xvL3BQalaYHs4MQ6olvlQNu2RsDNFqFTsx9/slDdZE4=;
        b=ebq0L2TXfl3Ltk/cImOc2PQKZ95tjoUMOQthycgzPLQJjd7bwCtdCbrA9wgORlsQgQ
         8OBGlZ1CY9g2EkilXoJUgSI+Eqry3bGIokloJOHigfPezcSxI+ugHuChzeJHWC4vzvS6
         LsdOiA0BQKt6f52TU0Jb66+Az6ZxZDP/yeGFWgYdOIptBLx+EbHpyfiiiryklWhFuwx5
         w15guD3Ohxy0A0J9f96V3LE51dFnWXriKFmmvUBssoJ6uBK5iIcebX/QhLsAke5MPjfQ
         AKSByAPiiqW4wrtfdHNAJov1YRTkcCGxOMkC7CA0idEStTlW96WydSI1kvEu7YBPfANB
         Oe3A==
X-Gm-Message-State: AOJu0Yz0fjH8mlp8a0dobbFOOM90uSPBU7qZ8Eq09r6wioHQYVl4VnFd
	DbmZVjUkoQ6KfYDmupZyl/C+GHrl+XBIxPMF4TFc/T/9yIHH36Rnw9ZpC/WzCdmkMG/T7ED2Du+
	UaxU=
X-Google-Smtp-Source: AGHT+IG6WKzTJHL+PolVkv8m8lc0rPpWUSEcyIp7ciOyFdIjfKhGp9MSOUfJ0ZsJA1lOLg5pvdmCkg==
X-Received: by 2002:a5d:6a02:0:b0:367:40e6:46bd with SMTP id ffacd0b85a97d-36b5d0cd807mr6028852f8f.61.1722266210106;
        Mon, 29 Jul 2024 08:16:50 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.173.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b368622c3sm12483658f8f.100.2024.07.29.08.16.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 08:16:49 -0700 (PDT)
Message-ID: <b6e1e3f6-53da-4771-9a09-a6a60da626c9@linaro.org>
Date: Mon, 29 Jul 2024 17:16:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] contrib/plugins: add compat for g_memdup2
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Bin Meng <bmeng.cn@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, Weiwei Li <liwei1518@gmail.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, qemu-arm@nongnu.org,
 Alexandre Iooss <erdnaxe@crans.org>, Song Gao <gaosong@loongson.cn>,
 David Hildenbrand <david@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20240729144414.830369-1-alex.bennee@linaro.org>
 <20240729144414.830369-14-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240729144414.830369-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 45KoFcvO8F8T

On 29/7/24 16:44, Alex Bennée wrote:
> We were premature if bumping this because some of our builds are still
> on older glibs. Just copy the compat handler for now and we can remove
> it later.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Fixes: ee293103b0 (plugins: update lockstep to use g_memdup2)
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2161
> ---
>   contrib/plugins/lockstep.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
