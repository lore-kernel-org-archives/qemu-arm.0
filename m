Received: by 2002:a17:906:3588:b0:a45:b507:d90a with SMTP id o8csp1975757ejb;
        Fri, 8 Mar 2024 09:58:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXpB7P3h1OaL8QlJmxk0VV4zrc092ZrHRywwKxWUKcXnTq4cEWOkBfrCmm9TD3lYEp2UYapSGfuQxOs0HIyPpTq141HVXhs
X-Google-Smtp-Source: AGHT+IHkA+EC+ohYfSQEAog01JRT8pQwc2/RHe4eGRPC3XATwR09OM36JDFgasBJQkDwHpa4Fgqm
X-Received: by 2002:a05:622a:13cc:b0:42e:f023:c09a with SMTP id p12-20020a05622a13cc00b0042ef023c09amr866900qtk.34.1709920707698;
        Fri, 08 Mar 2024 09:58:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1709920707; cv=none;
        d=google.com; s=arc-20160816;
        b=qn1WyO+R7TczGbpiYroTOX9GIbFo7HSngIZrGkwUOFChreq0iA8fiZyLtlQfyiCmc5
         FFoY7a2y3/Uy5EnmqKvbyHPXg0q63/P6xyz6clFb0Ao+N/f0gloBII0dk94JKbWfEMyu
         qq9IKsoxQ50DGYyj8M7DdD93OrK8fO8JZvx86Fd4ruhlZz0JVF00Kh8YobcAWM0iADWb
         0n1BqQOMdEzs0T3Fy6imCaofWHYAkpxbOWdK5W6mVmevJqKSLH7uoaLNshg96Ywnlk5e
         AzWB0zDQTo2Vzlmr/PMuK/miHAv3q0ViubNoXn9L2f17FRSSFVKBavPekorqyr8OB23P
         SkAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MGIj4sa/0a6oJihBsfbSxlcUOeJaz+aH5AZRyH68X5c=;
        fh=GCmZawG7gRXUuVsF8Qi1NJidgdqxyNsi/d1nSH8vGcY=;
        b=0x/9gnxZxzyeD4wORjX+Or/JzjDROs3u/wThRrP4ncRwVhSzIFrgYR2J9VGAkwF8GB
         zqDhYx+xQOubEtrUlPmDFeKbp3i7xtxQnvRmikNq8Hv0NCiNiecaaXP/6gMUwEB9KUw+
         nzK7vpNMKUhSzl2J5udfXS3tvThvFNp5dKb6Vd3LTeyEnsAS8eRMA2gFLEjqgm1iZyP2
         CFoCOmw3N+iMALFHFqtvWwfeh/7Z6ev6e9aWyxC0h/9lFX2D2hMFfs7TTd+Pde5k8smC
         +SHdTNUyW4+4LoXRwtj/qhQ2WVg+62UofWIEqa1KNMdlCR7FCtkSq68NaIUex6Mk7pZs
         Ensg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p2KpLNia;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w2-20020a05620a148200b007882ad62398si11161369qkj.346.2024.03.08.09.58.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Mar 2024 09:58:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p2KpLNia;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rieTp-0004E8-Va; Fri, 08 Mar 2024 12:58:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rieTn-0004CP-4F
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 12:57:59 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rieTl-0003Li-CO
 for qemu-arm@nongnu.org; Fri, 08 Mar 2024 12:57:58 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1dd5df90170so14243165ad.0
 for <qemu-arm@nongnu.org>; Fri, 08 Mar 2024 09:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709920675; x=1710525475; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MGIj4sa/0a6oJihBsfbSxlcUOeJaz+aH5AZRyH68X5c=;
 b=p2KpLNiaNKJRmIGnHvJtUxkzSZ527wXx5yuf/6SlIkLIenV5a4rXzPUyDBwt8piY8s
 8fXnkQgEsF0cReGl6K589CFZNHqTdQCInCkwAmD1arx0K+8Gy6fz36rkPbF7JbnZHLeF
 GB/n+oj5+0m3aLR0b/HQkgx7gPGNR4J8tnTYn35RqGkY001+IHX7le/HRJEugJFhzWuB
 98fOh2uCZtxy6B0yKggV4Kqd98EH8vbltnX1B5FVk/ZkRVFjtLmuSDcNpsCDGETnlkq6
 4FEzzKRn4j2vB0k/DaaMDpRoMk49MmAC2tzJ5Wr2rLAA43ie5gC9L4gHeVghKBnzN7vC
 1Qlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709920675; x=1710525475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MGIj4sa/0a6oJihBsfbSxlcUOeJaz+aH5AZRyH68X5c=;
 b=bz8dGe5WS2czPg6fZg4Z8wIYgyNsLhZsI8y/YgJQLfmjcJyMWV6JD6Op9ZQu+wYEtD
 IJY2WApnARIh3XTd7cQNQC+XnsrFoCuS1OzlkA3BUP/lJSsiwI61xGJIYAUMzIRGvF0c
 FHKuXt5hxvDilt44F9s83vnfhpE3O/nKwi5add40r4KE7Gfdrx+tYfSSYmGR0UWEKJfj
 e35cZoyPiBveK8hNO0hxiZaMxqb06/e05j9hlQxQ/abFmxZQVBJmf4ZmTwIhy6gCCg7c
 WkohhliDZVhChnwF4Rpgx+Tbo6TAcPdJIs+hIOyRwAQcY5UxsyjavVVIIlB5LT2Etras
 stLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6A8wS8WJ8If+23b+jCrQUrPd+yD9P8/kutH6z14479jk0NnlTnsVoJ/NfSI9fKkPQerhaNxjKoxCPT33B6Bzzwwjg
X-Gm-Message-State: AOJu0YwFlLIUf88N3xCU9ZUrQmKpdJd1g2nHBNZkT5TyydjvgUGCUnxW
 sr+Wl207zhlfiDnqUgpB3G3Iy5HSCxonhz+3h2yXz2eDM4mLP+LAmZiqYwzNO2s=
X-Received: by 2002:a17:902:bf46:b0:1dc:7976:b52b with SMTP id
 u6-20020a170902bf4600b001dc7976b52bmr1273743pls.10.1709920675105; 
 Fri, 08 Mar 2024 09:57:55 -0800 (PST)
Received: from [192.168.6.128] (098-147-055-211.res.spectrum.com.
 [98.147.55.211]) by smtp.gmail.com with ESMTPSA id
 o8-20020a170902d4c800b001da1fae8a73sm16560715plg.12.2024.03.08.09.57.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Mar 2024 09:57:54 -0800 (PST)
Message-ID: <467b4fbd-ef2b-449e-82cb-a4d939aa7669@linaro.org>
Date: Fri, 8 Mar 2024 07:57:50 -1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm: Deprecate various old Arm machine types
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>
References: <20240308171621.3749894-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240308171621.3749894-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: tXAVrya/bxqQ

On 3/8/24 07:16, Peter Maydell wrote:
> Mark all these machine types as depprecated.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   docs/about/deprecated.rst | 15 +++++++++++++++
>   hw/arm/gumstix.c          |  2 ++
>   hw/arm/mainstone.c        |  1 +
>   hw/arm/nseries.c          |  2 ++
>   hw/arm/palm.c             |  1 +
>   hw/arm/spitz.c            |  1 +
>   hw/arm/tosa.c             |  1 +
>   hw/arm/z2.c               |  1 +
>   8 files changed, 24 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
