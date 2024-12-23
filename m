Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp4362546njk;
        Mon, 23 Dec 2024 15:06:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRPOQ5s1BcJnTmL4+BULut4az+9kZjfhLK7Z5C21RDb0lzKzJapYxvxafgWz/8NJosvEFrK4WPdtcx9A==@linaro.org
X-Google-Smtp-Source: AGHT+IETEpPh0Sl1WDolBOwWeMmx/K5Vn6CTRhcvW2VhLIlxklcpw8/0QenGTWmZUY9aQW8M4f/+
X-Received: by 2002:a05:620a:2807:b0:7b6:d631:2669 with SMTP id af79cd13be357-7b9ba79aa8amr2911169985a.21.1734995187228;
        Mon, 23 Dec 2024 15:06:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734995187; cv=none;
        d=google.com; s=arc-20240605;
        b=GLa0K714S0JE/2haDUg94/L9EuOPVsyxd5LjFqeAfAR/QSXLP1DRHhLSuCFQDGRxSx
         wsTN85/QeLuHeeJKNyVa0U2XkckOfF4gcKe3P1yJVdlLztXlShwo5GvEkd3mCRdk5S5d
         DrItZIk0rrg/0GUS1JTjWD3drhYVEUYxsXg9CaNMXDo8gEQc8LXvCc6HSi6A9Oiyv8Iu
         slBDC+tSZkr1Inwg/p9X7QE1pbs5n5dZkcbImN3qRwi7Htsn1KJEt/y/N5s+JXmpMkmS
         WXaSlsj74aUn1leFthXyDmWIxw4eQiWlekiWNDAL6J80NEi1QyQO3/BOSIugW7G3IP4d
         c/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=8wirB2oxzEwBCtv2tOsMsgvv/9t4T7GgUtSDc9qT4ag=;
        fh=mp4cHzS2HmN9GSiPgTm5z7IQYXkN5cqwoBKfI+S2AY0=;
        b=HAj/BTXRSpIu3TcxUCv7YwVgPU1Vf5r3qmp0hVUGM8oBaroLN55jUfUgROYkfeBfiV
         DhN8zpJhmZz9t2O3qN3KZxm7D1ASuPmiTV+MREwivDVtp1xHDH4zmjyUGZ6SejDHYiH2
         n3OpLN1d9O14quCTAmI9okzoe1KXFSWQripQuEE2D/hl0oL+LtDkq9ZRDdrP5OwOERNi
         ZTCha4xbdoQ5b7hhfKUGE8/5TR6P5+DkQX01v6Pg+UInbq+phk+kmellfeEhcyesddAb
         SIZ0BGob4bWsUIk7By6FV9JDteErKQEYQgaQJvfl8vvWl4J8sqaJ1p5UircLtBvmeGN3
         bJsA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVqNaScc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac4794c6si1355267585a.216.2024.12.23.15.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Dec 2024 15:06:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WVqNaScc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tPrUj-0004ij-Ft; Mon, 23 Dec 2024 18:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tPrUh-0004hv-MR
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 18:05:48 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tPrUe-0003kq-Hd
 for qemu-arm@nongnu.org; Mon, 23 Dec 2024 18:05:47 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4361e89b6daso31853885e9.3
 for <qemu-arm@nongnu.org>; Mon, 23 Dec 2024 15:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734995143; x=1735599943; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8wirB2oxzEwBCtv2tOsMsgvv/9t4T7GgUtSDc9qT4ag=;
 b=WVqNaScc5QLoVTQd56omK1D00jMBPVO+R8s4kDiTQJzteMxRT810kzyCjfTa5Sleu0
 w1/4D3+FE0Ts78TOJEJFE/zQxbLgeozjFDS3ZwdP0ldyYoLeOgtdp9vAA8tWzn1uiGG0
 sjYkwtMmrRbNX8yHwNI9NH4kfcT9S9SNJr1lX7rjwtzF0aFgGE4seZOf74OKsRWTdo1Y
 SDlcBgxJ9Wk4FAQavuZum02u76s0gxi6ziFYQFv7ZlEXHQXoVcEl+dhruRAUNxG6bJK6
 WqxfE6WwDELmMOU6zmTLzV9EPctWVsPrgqWQHsLbym56Eq57I1Hot9QcUHU2IDlz7Rtn
 8kpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734995143; x=1735599943;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8wirB2oxzEwBCtv2tOsMsgvv/9t4T7GgUtSDc9qT4ag=;
 b=sQH/HUqe3EYNo6QwdKRQT7coMP0zVqai9ZPbwqJdT4/RIX7SoPtMKzwCVShJEBfYsN
 KXThEchbfaNnyDHAOViPBmXL4Sa77irflBjD3WyLj/uzYvTHmyljsXfcaicNouSAroC5
 Fbxp2mU+GtlTh11wZVlx3GcmolvpeQUWmuOQbqm6MCpaWqbGDjS6FOxq5oRZn4wcvoYh
 T7hdrytFEACU3r1Ntk0UL3kFa+jcwux5j7JWONO/S6tjB32qDXZpnag973RZ+E/SzfLi
 KWIXBIfocPFc0H47Nz9jwD+poccgbG8MSlqXlXwJFwh6OdsCyCK9Uyh6XKYpH7lfKYIn
 ZGiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVN9sDGJ0a9uUZuMOTABA95nrY9ihUGdxgU1sJW3OyCG8mbjN64hU6h6IkNLB9I75nC+LKk2VBN+A==@nongnu.org
X-Gm-Message-State: AOJu0YxxtV0sV37XNlaoEyKyYoLAMCWhXnqVNqdgX/KQEQJCLFCZ0RLn
 dfo90Ty7Rnx5dhPNW654MijaXzKeNqQAuw0x21AP8hsram6pLdz8P79/e5iktqQ=
X-Gm-Gg: ASbGncuhV3AHzggZV9yhHuRoglRo7+DKam9wx16+TzH2Jo7QKjsfbU8tkOvFtw/h/W0
 n0foTtAXd5KmoUGRcI71ZG2Ewz8Rr4mvcJmoI4aruTsuORSLUkeXx0IQGsAAu4w19mniD33WIM1
 21SjgZd3NcErZQi2iJvVUYpwpBG5JVmlu5bRz/XcdQwsw6E0+pSoTKUGOmlJNlqnYa7gP9Ku7Fy
 nuw1RrC11ijRIaky/FKmwt9o3eTCxAvxLH5KCNbi0z0jj10EewioRogYeufFEpEAFc=
X-Received: by 2002:a7b:cb93:0:b0:434:f270:a4f0 with SMTP id
 5b1f17b1804b1-43668b49981mr106293485e9.21.1734995142660; 
 Mon, 23 Dec 2024 15:05:42 -0800 (PST)
Received: from [192.168.1.117] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c847dabsm12370921f8f.59.2024.12.23.15.05.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Dec 2024 15:05:41 -0800 (PST)
Message-ID: <cfe36783-9353-45c0-9f4c-6aa1879ffd70@linaro.org>
Date: Tue, 24 Dec 2024 00:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 15/15] hw/vmapple/vmapple: Add vmapple machine type
To: Phil Dennis-Jordan <phil@philjordan.eu>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org,
 agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu,
 Alexander Graf <graf@amazon.com>
References: <167ca349-980c-43a7-82f2-264b2f7250cb@linaro.org>
 <50ABB5B0-4B7C-4F32-A956-82BD76C235E3@philjordan.eu>
 <CAAibmn1sJ8cCyExHaEw853bek1hUt8QrA4Lv5=1R=zX=v=51QQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <CAAibmn1sJ8cCyExHaEw853bek1hUt8QrA4Lv5=1R=zX=v=51QQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: wxcZ5/On4V/s

On 23/12/24 23:17, Phil Dennis-Jordan wrote:

>      > Do you have other changes in your v16? I'm quite happy to
>     integrate this
>      > v15.
> 
>     The ones proposed by Akihiko are the only ones. I’ve already
>     implemented them, so I’m happy to post v16.
> 
> 
> OK, rebasing on the upstream master branch has revealed it's not quite 
> so simple: there are a bunch of clashes with the recent sysemu->system 
> rename and the removal of DEFINE_PROP_END_OF_LIST(). They amount to 

Yep :/

> pretty trivial changes, but almost all commits needed adjusting, so 
> pulling v15 would be painful. I've just posted my v16 (including all the 
> changes discussed here).
> 
> Thanks for taking an interest in this patch set!
> 
>      >> Adapting this giant macro for each machine type seems rather
>     error-prone and the kind of thing a computer does better than a
>     human writing the code. I can't help but wonder if we could define a
>     generic version in boards.h and only implement the
>     DEFINE_*_MACHINE{_LATEST,}() wrappers specifically for each machine
>     type. I've created an issue for this on GitLab: https://gitlab.com/
>     qemu-project/qemu/-/issues/2744 <https://gitlab.com/qemu-project/
>     qemu/-/issues/2744> <https:// gitlab.com/qemu-project/qemu/-/
>     issues/2744 <http://gitlab.com/qemu-project/qemu/-/issues/2744>> I
>     might attack that once I've cut down my backlog of unmerged patches.
>      >
>      > Do we really want the vmapple machines to be versioned? I see 3
>     options:
>      > 1/ No (simplest)
>      > 2/ Not yet, adding versioning when we see the needs
>      > 3/ Yes
>      >
>      > Personally I prefer/recommend 1/ or 2/ ;)
> 
>     I didn’t realise these were an option. :-) I was just inheriting
>     Alex’s code here and assumed it was the standard thing to do.
> 
>     I could imagine we might change a few things to get better guest
>     version support and perhaps the guest iCloud support that was added
>     to the Virtualization.framework in macOS 15. But yeah it seems
>     unlikely that any of this would cause regressions.
> 
>     What change would you propose to remove the versioning? Is there a
>     specific machine type I should use as reference? Or do you just want
>     to change that yourself, if I push my v16 code to a public repository?
> 
> 
> OK, grepping through the code base reveals there are quite a number of 
> the "smaller" machine types are unversioned. So I guess that's a no- 
> brainer then. I've worked out I essentially just need to move the compat 
> properties registration to the main init, the "desc" field on the 
> machine class needs to be set, and the type becomes non-abstract. 

Correct.

> Everything still appears to work when I add that back in after removing 
> all the macro definitions and instantiations. Change included in v16, 
> but I've still got the reverse of the removal commit around, so if 
> anyone has good arguments why we need it, I can easily add versioning 
> back in.

Great :)

Thanks,

Phil.
