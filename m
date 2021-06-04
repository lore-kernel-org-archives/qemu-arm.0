Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1370252lfa;
        Fri, 4 Jun 2021 11:01:36 -0700 (PDT)
X-Received: by 2002:a17:906:2c52:: with SMTP id f18mr5446371ejh.258.1622829696010;
        Fri, 04 Jun 2021 11:01:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622829696; cv=none;
        d=google.com; s=arc-20160816;
        b=ZtUQ6YyFOysBpPbG/b11On/yCQxrpAK8J90I3hurqdLrw5GbZjRAwk1cl39F1ow1m3
         n71H309EvBQt+rDREvMg/P3MkqXWRxJlBxEcEojmvd/01MB6MhzQXgpHZIgBK1RLiZHu
         CzckcamDU3KC15fnzbr3i8cUbuC+ImUR9oEKvmESa7VU+W48K/JmflOaaK2xr3lXzgYq
         qXyUgOM4nWUY01b/j6QxbZeojZL8JjbfzQBKAyTFRzyrSjTF4s8NmVjKaxsVBIAhrIbF
         r/8550tTTavWkEs56bArrbI87uSZ64JzsMGg5KJY6Mo2s9Dad+Kf/ajrl3ch0KhkRyg7
         f2Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=x24ZIztqLfe5brbqebkbnmpwp7FeQCCWMk5tF7Z8QYY=;
        b=Dokytpos7Z0nC2KNJowfii4GP/VWoJyYeMrUG6HbSAZR6B0iogUDpI4fg8RMtA7zbM
         Jz4rdzHTGPhbJ3Drx/imXsvt0O9SL0MDjuK0UbK+0yZZNFbDd5p7EFCWpdViyyslxQ0u
         3NU9gvnoBE+6dJcn3pIrTmZt1N40tzHs0VxZrzkwa4ag5wolP5XL2WChLYKC19JgiBuc
         yrjsRHTESc0zDkCUPJmvN1XlYUn2wjVrCZ8Vgo/xoJXPQtCSZJQ30I5F8voWd3Wiezo/
         rHPABijgKT4u1Q1hLmvJtLTApENi14lNmiiAjNdi7j4sjD3qGFK8fGIrIf/p+p0oacEc
         AY2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="aUnu0/2E";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q17sor4163591ejf.91.2021.06.04.11.01.35
        (Google Transport Security);
        Fri, 04 Jun 2021 11:01:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="aUnu0/2E";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=x24ZIztqLfe5brbqebkbnmpwp7FeQCCWMk5tF7Z8QYY=;
        b=aUnu0/2EO1DKUBtZeCzPJob6upaK32OOk/pDm2JaBIYQccvhv1gm5+DyQI6CiAX30R
         iAp6bJd3zZSV+3HNiQk4YbDGxs4juC8YVLC3W1WpElunL1NgpL3/nIrkB1Gvc3E3zQbq
         z7nMr2uPnEb8orkZ5GYpxw4Mkf1ZkDUjpsksxk3Nbt7ZNxbMDlM+YoUF3w9ekyTWvStz
         pISdknknUHzKzE/lSkKbr3ZQqlOz1RTmvrd0CV700acKH8zKiBgmIHXKHF5dtu1qmNpO
         5cW6XtX283ONYTsBRkr4ujIVnu3z++vVc//NKcpzueVcuWUUOui/iMZEPH89htKgoK8u
         I1vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=x24ZIztqLfe5brbqebkbnmpwp7FeQCCWMk5tF7Z8QYY=;
        b=bqKNrLWpKWX0gHFApID2jkCQQ7M0l9P0aZEODW/NcM+orj7uTnoa3Z4V9hAoaMWufF
         hk3wF8J8mX9JcCWTPQJ2RpC4/IS7k0LA2s2PSwYY54qQb8PFcf80M7UcY+QMJA+qQpQQ
         i0BwoITHHmqM9XaWEzyYtIbWVtzugMCvD8LTv33UIaEJzYws59+UBwMag4Jab8QzQEr/
         vLd2FvQ5uZ8DsBxEciBxCfP4u4IcaAKT0IGHtQcGw1nyLBzA3ZvphGeO9S1DhvlNcu9y
         q9mMd2tfBWtV7fFzvnzq+iJtHd0Q8vxn3zZLZ0JaDRfiXg3wG6zAy03dSh2ceAd7Mz5R
         PYKA==
X-Gm-Message-State: AOAM533Hv/hzILOpcfPXDz5MXro3MrBf0krCJeCjzkzSIaagCL1Ef7SO
	yXoHgQoefswxD8ZnLNCoSjI=
X-Google-Smtp-Source: ABdhPJx6qo5pOQzm/YfgRaXRHhb/Fgk35xyPwDkNcygNiIotPh6zBvmbnCE9ZErLIbM5MVDC7J0x6Q==
X-Received: by 2002:a17:906:4c8c:: with SMTP id q12mr5466132eju.254.1622829695647;
        Fri, 04 Jun 2021 11:01:35 -0700 (PDT)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
        by smtp.gmail.com with ESMTPSA id q22sm3068640ejj.98.2021.06.04.11.01.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 11:01:34 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v16 13/99] meson: add target_user_arch
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, David Hildenbrand <david@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Claudio Fontana <cfontana@suse.de>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b2582589-c02c-cecb-024e-ed461e4ae1b8@amsat.org>
Date: Fri, 4 Jun 2021 20:01:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: G79GHIo7Sgbe

On 6/4/21 5:51 PM, Alex Bennée wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> the lack of target_user_arch makes it hard to fully leverage the
> build system in order to separate user code from sysemu code.
> 
> Provide it, so that we can avoid the proliferation of #ifdef
> in target code.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> [claudio: added changes for new target hexagon]
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> 
> ---
> v15
>   - remove duplicate ss.source_set for mips

Either add it only on target/arm/, or on every targets
but then revert 46369b50ee3 ("meson: Introduce meson_user_arch
source set for arch-specific user-mode")?
