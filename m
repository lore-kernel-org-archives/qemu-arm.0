Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1413674njf;
        Mon, 28 Oct 2024 05:07:34 -0700 (PDT)
X-Received: by 2002:a05:600c:35cd:b0:431:52da:9d89 with SMTP id 5b1f17b1804b1-4319a55f003mr61272275e9.1.1730117254596;
        Mon, 28 Oct 2024 05:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730117254; cv=none;
        d=google.com; s=arc-20240605;
        b=CRbPEGQpn6h2qRtoqQfLh4mUbA2nMm6mnX+T72xQrMGEuiTgcWtCOC6XQYiCgAktli
         h9XjhZCIb49S5eak0iytMYAGJdQK3y/Zrc9ZerN1fLfbTVLDIpvBvuWiKFD5Zr/vM59N
         0jqBQnKfHLH1OjdTQdbNXS9Z6JxlNZGrtlyopJYjPK44OAY12Se7g/XnuksuS2JcKowZ
         oNuJyRb1ozeHQvsa20HFhxIGTDGbSo8pfivM/lursJFKuwNDwBAGXYC6nY57lEbmw+Mi
         4ow+tdBioC9Cc61M/kkbNNOFWU2hiLSfhgL2NOPFds9/KkpqbaVlCIDz44Rr5MFO4tj9
         mQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=X6Wx3Ft4RvGHGnrjLN/OFmKjuZS1W//vEqGNZNt6GJ4=;
        fh=cV0x2MJ9gtIrfnrUMYB6k0QkF3vl+EU6F4WwtejqRuE=;
        b=W7X+QCiTOa51vxIKIDduZzbSEudOYHtWUTdTj4xIsU+xB/FMqAjiWAfAO4k1K9ZKxG
         vqxdDk0Qs6LlZUPrjW5L1t+Brx7JMxZxb58Dl3yRrpEmL5PckPxOCiJqYa/ho9VsANEC
         E5URmZWdWxEl2BtsCPUVly5DjSEb9dc1Gq2podONRjz4vbTcR2NuBRpyabRgWyqmS5XD
         t6OOIkcwJ/fTv6ITrWAapjvdFt6dZdgSH8XLFQcY6NB//7mCJDX/vLVvj8CPGv+fzM0q
         Gx4qFMH7clDV5pd7zOXQ3eWqKUCHTc+9+lMJEJz8nRyh2ne2eqEjTe+XnMnxi/3txEw1
         foYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YeIFvv7X;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-4318b570c35sor22680955e9.3.2024.10.28.05.07.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 28 Oct 2024 05:07:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YeIFvv7X;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730117254; x=1730722054; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X6Wx3Ft4RvGHGnrjLN/OFmKjuZS1W//vEqGNZNt6GJ4=;
        b=YeIFvv7XV6BrcVjbiOEQLfGcQChN/GnVXAqMQKDh2wUj8gsOvUOZa474yR76zk9zQe
         5673b2E/qoEuAIU9t4yC4A+UdhmHITSrZbfFrRkM048wsXdtogVafoflQQ8IShdf6isl
         oEh/4XJm8MYohsvwvOIJKIpPGZ7S/krP7Q3aFkjthAUUvrSiQtLOBj4r6VXhFGe5GU66
         K8XyWjb+kccxmsV1+5qSPHQYQtfIQdRYNRrxcfLmVF8qbDmp/lYMsUgurWhJ3c9Jlj20
         tJFmPXw1kRmlQ6ErJ3y9afu8VLNNH17DAgzqo+j6F9GnfDKuwx7OQkxmzToL7t0eSiNu
         crVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730117254; x=1730722054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6Wx3Ft4RvGHGnrjLN/OFmKjuZS1W//vEqGNZNt6GJ4=;
        b=mcF7dLONLSvYB/gxLOrzkIdb2sztaGo59eyqAabzX2gXyszt+maL3xpJ6ozBPxcNdw
         MMKptj+eUnn8+zOEs+lRvOjCTX1DEIUrkLSpKyHfoO/c1kIw2ADZAPFcE9x3QKs8gQ9t
         dXlujQNo1QPsIuWK9ziYy99CQ5ZBeu/iJ56H0e3ZtlhwGMeTfSTcLfKbnPzL61S9eXmb
         ige/8K0HMNccAk1p4QyFDxCMsOMbSbD0RNZBOpPKvWwgGSFCx0V8KfOjWBbt3Q1cLmL4
         4T5CQaYmJDWYCHbUY0xpzo0xIc6HgLKMDlpunxMidyzL4nnmwIzK8NqA4IB92jqcH9ke
         0dzg==
X-Gm-Message-State: AOJu0YxxvWxFV23SMnKOjXpESldPb4lvZlQXTW2cTxiU+fHW/pvoj2OB
	4a7JGbZahqVv0Vcsb/WyFzQ2uLXYAAkPKya1wMz8gwHu+MiMMB2jCwTWJGxlMlQvFA==
X-Google-Smtp-Source: AGHT+IES/MuXIwTkWTiHcJbqDLRiWEWFoqeXYdFmixdyHC6J9JYlXCnzXq7mg6x/6e/s8HqwByAxuA==
X-Received: by 2002:a05:600c:1549:b0:431:405a:f93b with SMTP id 5b1f17b1804b1-4318b5b2c33mr109449265e9.10.1730117254018;
        Mon, 28 Oct 2024 05:07:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.21.227] ([90.197.151.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4318b56742asm137432575e9.21.2024.10.28.05.07.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 05:07:33 -0700 (PDT)
Message-ID: <4ab2af89-4e1a-4658-ae0d-6721df2a3b91@linaro.org>
Date: Mon, 28 Oct 2024 12:07:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] softfloat: Allow 2-operand NaN propagation rule to
 be set at runtime
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo
 <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20241025141254.2141506-1-peter.maydell@linaro.org>
 <20241025141254.2141506-2-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241025141254.2141506-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: MJQR9Qnh21Ar

On 10/25/24 15:12, Peter Maydell wrote:
> IEEE 758 does not define a fixed rule for which NaN to pick as the
> result if both operands of a 2-operand operation are NaNs.  As a
> result different architectures have ended up with different rules for
> propagating NaNs.
> 
> QEMU currently hardcodes the NaN propagation logic into the binary
> because pickNaN() has an ifdef ladder for different targets.  We want
> to make the propagation rule instead be selectable at runtime,
> because:
>   * this will let us have multiple targets in one QEMU binary
>   * the Arm FEAT_AFP architectural feature includes letting
>     the guest select a NaN propagation rule at runtime
>   * x86 specifies different propagation rules for x87 FPU ops
>     and for SSE ops, and specifying the rule in the float_status
>     would let us emulate this, instead of wrongly using the
>     x87 rules everywhere
> 
> In this commit we add an enum for the propagation rule, the field in
> float_status, and the corresponding getters and setters.  We change
> pickNaN to honour this, but because all targets still leave this
> field at its default 0 value, the fallback logic will pick the rule
> type with the old ifdef ladder.
> 
> It's valid not to set a propagation rule if default_nan_mode is
> enabled, because in that case there's no need to pick a NaN; all the
> callers of pickNaN() catch this case and skip calling it.  So we can
> already assert that we don't get into the "no rule defined" codepath
> for our four targets which always set default_nan_mode: Hexagon,
> RiscV, SH4 and Tricore, and for the one target which does not have FP
> at all: avr.  These targets will not need to be updated to call
> set_float_2nan_prop_rule().
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> Reindent means a couple of slightly long lines in comments,
> but those will move again in a later patch, so seemed clearer to
> not re-wrap the comment and then re-rewrap it later.
> ---
>   include/fpu/softfloat-helpers.h |  11 ++
>   include/fpu/softfloat-types.h   |  42 ++++++
>   fpu/softfloat-specialize.c.inc  | 229 ++++++++++++++++++--------------
>   3 files changed, 185 insertions(+), 97 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
