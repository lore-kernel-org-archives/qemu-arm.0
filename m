Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp2112792njc;
        Mon, 24 Mar 2025 10:35:00 -0700 (PDT)
X-Received: by 2002:a17:903:182:b0:224:c47:cb7 with SMTP id d9443c01a7336-22780b9dbc5mr217534035ad.0.1742837699954;
        Mon, 24 Mar 2025 10:34:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742837699; cv=none;
        d=google.com; s=arc-20240605;
        b=OA0y6wQokiaHy0829xDfllq0F79iEyFxpquw9WZZbD+TcY5h6909sv/5orETp7IiXI
         L7oBZiDRJqqrKyVPtbjRLwODumstShDMSxc5l2wUjf7cOuxW7d1CeZ1JM8zX3/ZphXAD
         1Jry+Vvt5IdhugqbLbEhQtJhV0RHQMTwAH15yQWsZ/kQfdJMjITmT9o76+C/ZSfH/cs+
         OvqSfVQDjemXPpmw/x7ClE1obxuDiK8CE2PJEIZdpNFlVoNNtYstPXNrdzQHnIuyeKBV
         CQZylPJQyUQ+7zTPpmSy6OpBW6KxgO2Cp1fZTx6wChFF5r1J6Ej5CJ5p5mMQnfxICSTf
         HnEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=wL6zejufrEbdATvCG/8Ytmv1LFvg7CVt+hkjoZn7zLI=;
        fh=ovdbSbF25NqXHN8+ozjnsnyIjY+LS/trBWPh5LBor84=;
        b=UuRhPyHbnKh+1NZXJUO4CpUZKNn7ayaRFZiSoINBc16RMtwQwwVtyhgtg6TDanoVhU
         iT5V/5ppkBYyL4u4616/K+sO/GrN05qd/967S9RizpIm/c7cu/0w6iGg1smrUuq0hyUj
         +7OLigmgiJtfhUmYbvJEH1FxjB53H+hGe5NQwJ8l2FN78v1YDnD5hZNUZ1T+LQvZpgMe
         rYgw6VLaXKi8mr0r0hDloZih0mo9Oyd0k2ljSQ7BsrWr2i3/YaTfPSYwodxckI/0qLJA
         gjR4Emup9fLJQUKvcP0AGhWUKizccIJ+BYh60mEMrqma4U+xv/SI+HfIC7WrUNMkvRI5
         +GxA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hE6RScv4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-22780f0ac1bsor40905855ad.8.2025.03.24.10.34.59
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 24 Mar 2025 10:34:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hE6RScv4;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742837699; x=1743442499; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wL6zejufrEbdATvCG/8Ytmv1LFvg7CVt+hkjoZn7zLI=;
        b=hE6RScv4gZIDtoGJoJS+9tIPBJzno8KHfAJR6Fo07aKv4ij+fJTgTlqzQGKPnut3Qk
         vVn5l6wLquhwvM6aboY/30QC66LRnEibcf2wL/1/useBsTm0alq7i1nPMJLQdHJpqHNN
         Au41A0EAgaRhLI59v04LcsuR5qdVsbIFOOFVdBSDhzyQXK8MKeWn+eyGt/vJP1/tVooJ
         Jc2Q7ee+hjcuGnrlX+j0gArIpH2cHn5NQq8IRc+SswHnXjJ+Ud29IHucnRo0pBq15AcR
         M81IhK9JYzC77NUxSC+S+jbHtW6VSByoC+GRcoqcWI8oIy4U1Th3Wf4OhewYiWWvJKn3
         dQwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742837699; x=1743442499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wL6zejufrEbdATvCG/8Ytmv1LFvg7CVt+hkjoZn7zLI=;
        b=wuHGyqwH1whkNau909yPsP4f7jwcVlKMkaGHA6eJMp4GSNUrCCZQDPY7UWxy49vkzD
         AH37kJgDy2dP/Th1N0oarfsVt53gKWLQp3cQYIleP9L+8kOUCqW6snGVLu9mA50nKW/3
         9svchZT+AHuhh6a6mXUwN3zCh4OaCp/kgISchiNSS7ZnRdE7MOxg/fywEmkYS+uyOCF3
         0ZWwyvLBS/XgJtfshKqAlNKt+9KtSvpRFMSQaGgyPdbne/0Q7Gr5DqY6OaeSNE9+sSOe
         Z+2J6BAVDZiEKZ1pegbB/hR3BXUqIWCQ1d7/55Po88m3BlYZDnyplAyPPlChqZZwVsEA
         Jdbw==
X-Gm-Message-State: AOJu0YzSqU5Zdn9fGuyuIqpiJSOPEJYNrpvnWD4mo1KTi6SAkyg3fumk
	OMq8rQdH8MGyLIL3nDQNsNgibgDrWVUGif+rxRPgqztkZ3CpKRJAwxhg1Q6KRYxNILJmkLa3t1z
	Bl/g=
X-Gm-Gg: ASbGncuySJTM6/bSMVFpx1ScR9o7pH61j7PFAhbLpXNX10BYL6eLcNTsP+vnPb+pHr7
	iYXA8yrhZZ/V79bydqxG7DRoJv7Z4JHuD9iyYu1RYzYseRsnuhGI52xMzPfcPAmzZgnyEzyEyPo
	Hw4HahW0jtGzGyg0QUSV0M95Ldc37dYvAQ9btJbeEXXLDX7UGxzLAD7guNH6+TF1EusWIRqsOv3
	4u6U1ynREH/wOGcBtZlmS/PMXT3MVL1S3KGQlfWWqFnM/WBK8APMhxoOvfnUhEsRsY3S96WRk/k
	Ps4Q6aOL1cF25n+jUu/77jcpDbZUE2Df0ajyFYZ5ojF/WZy/KecksGUcGgRubMny6tN+BxFO8Yb
	l6hcTlzBg
X-Google-Smtp-Source: AGHT+IHK17LXfEhS5wnRvUe/k0B5oxmMvO/Q0AAugodo5l3UQAf//FaDqtWy9ttMGzV1DNWnoM/stg==
X-Received: by 2002:a17:903:41c6:b0:224:584:6eef with SMTP id d9443c01a7336-22780e3fb95mr254254845ad.41.1742837699342;
        Mon, 24 Mar 2025 10:34:59 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f4618dsm73839705ad.73.2025.03.24.10.34.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 10:34:59 -0700 (PDT)
Message-ID: <e92e6769-dc30-48e3-ac90-b4f7c4b93aab@linaro.org>
Date: Mon, 24 Mar 2025 10:34:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/11] target/ppc: make ppc_maybe_bswap_register static
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-ppc@nongnu.org,
 Thomas Huth <thuth@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-s390x@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250324102142.67022-1-alex.bennee@linaro.org>
 <20250324102142.67022-9-alex.bennee@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250324102142.67022-9-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: qgszIdiIiwIG

On 3/24/25 03:21, Alex Bennée wrote:
> It's not used outside of the gdbstub code.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   target/ppc/cpu.h     | 1 -
>   target/ppc/gdbstub.c | 2 +-
>   2 files changed, 1 insertion(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
