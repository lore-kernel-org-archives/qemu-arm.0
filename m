Received: by 2002:a17:906:c0c2:b0:a52:4db9:938b with SMTP id bn2csp1177137ejb;
        Thu, 25 Apr 2024 00:43:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWDaXajJAwBDxnp0Y4Q0HJ4SHGFhZQMNjyKamdpwY2ZgamwFB9AeHXXE/Pp2fQLxOwzaeY9VRDctoxsPwqeBkUSJaZSXwzt
X-Google-Smtp-Source: AGHT+IFJQLFym+Upy243K4CdhFaU0n7tONX5kim5pFcGKVRmuvnTYHV4XQrmcVJ2IjcDo/AKoGD+
X-Received: by 2002:a05:600c:3496:b0:41b:4390:5b9a with SMTP id a22-20020a05600c349600b0041b43905b9amr861914wmq.35.1714031026994;
        Thu, 25 Apr 2024 00:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714031026; cv=none;
        d=google.com; s=arc-20160816;
        b=SiwrjFHMre5cNAR75ZEfWz3wp2PPTUvowzrbYwAKI7DQgUUrs9aws31rvU3rJHCjrD
         aGdMmtpoCxEcrdz2IosbzMhkLcq5WoRxtuOrnsKursAg+jzE+186gk78Hyj5AJ527MNM
         Ji6oaord7PQgUWCmF9qstHwXFrn9G8/sQTyqqKsW4+kXuhMv7sbwPdFfMLV9fn6MbbQ4
         pK6LZO6j+lJl8H8xx5edIZX27kLY5/8luOhhdQ0V+f4uDDaQgJeB/gWcx/U70PfqfJ20
         tU7WGBfsGBR/IsjfHT7jejP8HuZIgug5fcJBai8aCbd3vPtRvFl0sGiCNFI7sJQl3uli
         cNqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=am18teMx8U24AJ9aSkcT4YQ9QLX2qf+QDdtlWpX0jBw=;
        fh=G8qkGh+WXGYcdeGgVCNTc0lUhXFvYo/NuvCv/EU9Gqc=;
        b=WQlRWfwZVYksuLQtXdb4n9oiy+WeQgSE0av929t6Rq3BoC5M28oQW749LB37zQ/zqN
         yY1jNhkGvdHwliOaAD3AFmX4/4NOw08qasFKPmuzx/+HradxiN56hwBCVvkrtinoBmNd
         /WZKpWGebXBBcVxKyom4mG4wAgPb9sXGqgltYrHcssyFyL+IpAQOo3theWIyZ5wdh0xt
         P+cr/CYK8rlHhfWynAGfKp8zRuhJgfByxEiS85iwAL9oSxArcgoMVwlQhfYXVmxMc4TT
         5YvXHoLu7Q296O8f5vJKs2RVnyyIqEYtdCvon9vrO/ciBI+kZ/0wz0TQwaCQd7f5j5l6
         Oj/w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=O47Edotd;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
Return-Path: <anjo@rev.ng>
Received: from rev.ng (rev.ng. [5.9.113.41])
        by mx.google.com with ESMTPS id f11-20020a0560001a8b00b003478339cb67si8065872wry.1045.2024.04.25.00.43.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Apr 2024 00:43:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) client-ip=5.9.113.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@rev.ng header.s=dkim header.b=O47Edotd;
       spf=pass (google.com: domain of anjo@rev.ng designates 5.9.113.41 as permitted sender) smtp.mailfrom=anjo@rev.ng;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=rev.ng
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
	s=dkim; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive:List-Unsubscribe:List-Unsubscribe-Post:
	List-Help; bh=am18teMx8U24AJ9aSkcT4YQ9QLX2qf+QDdtlWpX0jBw=; b=O47EdotdTynrQpS
	1nl5btETq0xQRjMhjtvjl2eDeBfroi4CclyxNh4vRsBf6CATbRS4jCy57UZCD7niKe3CV75eI9wH3
	+YHohE20I6BWJcUyd74cRh9C9efa6fDZW54xFm37TFyqxw9dX9Ktf3xxhkjSR2z1QVljx+EKMB+lx
	P0=;
Date: Thu, 25 Apr 2024 09:44:57 +0200
From: Anton Johansson <anjo@rev.ng>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, 
	David Hildenbrand <david@redhat.com>, Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH 16/24] exec: Move GUEST_ADDR_MAX definition to
 'cpu_ldst.h'
Message-ID: <jrsx5qi2a2guntx5got2rnwjxfeluilrccyfzcmdgvkuoeucxm@jc7n4ets73c7>
References: <20240418192525.97451-1-philmd@linaro.org>
 <20240418192525.97451-17-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240418192525.97451-17-philmd@linaro.org>
X-TUID: J59CD6XUN87p

On 18/04/24, Philippe Mathieu-Daudé wrote:
> GUEST_ADDR_MAX is only used in accel/tcg/user-exec.c
> and "exec/cpu_ldst.h". Move it from "exec/cpu-all.h"
> to "exec/cpu_ldst.h" so we can avoid including
> "exec/cpu-all.h" in accel/tcg/user-exec.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/exec/cpu-all.h  | 34 +---------------------------------
>  include/exec/cpu_ldst.h | 30 ++++++++++++++++++++++++++++++
>  accel/tcg/cpu-exec.c    |  1 -
>  3 files changed, 31 insertions(+), 34 deletions(-)

Reviewed-by: Anton Johansson <anjo@rev.ng>
