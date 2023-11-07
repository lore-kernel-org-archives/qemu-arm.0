Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp242697ejv;
        Tue, 7 Nov 2023 03:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE4ktrfSikgWo1Q/BPQcoU4MLsAV3LkEgM+rSr4D+7HFUV1q4SnYHMpUSNPhP1qmTrgW4EK
X-Received: by 2002:a05:6214:21aa:b0:66d:6586:f2b4 with SMTP id t10-20020a05621421aa00b0066d6586f2b4mr37251842qvc.21.1699356382767;
        Tue, 07 Nov 2023 03:26:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699356382; cv=none;
        d=google.com; s=arc-20160816;
        b=YD/3uLrROMvt8uRY6TRsTsxwn2rqc6FUJ/AiALl0LlPLcRKnVyGU78GlMYQNJEA+ya
         /sF1xmmOpA24fE9ecQG//1288BUwPXvtbOP6M1hsG9nQIZC+PE8jNZKrwS4Vdu3zAkt0
         IuBkSJ4mTGFTCAQ7Bv2m0ncAD4JogQdg1BQQrIIsuZIMK45ql58IPjYy/qpuSh/tEa2w
         qSrPJMeV4EAa47KLXcuy5Ps5AznurvtUJsruT+a6J/hUWAgcqrqjNaFhynkJ413/oSMz
         H2DBwZe9z6QaBuKTkja56xPfvt+ZCN88nHdX/fj0K+60wH+wWRwDolX7p6cVHzkJDeX1
         qIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=ORNEDFI9RqhLx/HRTgMGoDJrd1LTn93L8793jDfz29A=;
        fh=6hblrBvBi7rG1faX3zh9xMJSpVgzaTtBBn4+gASQ0lc=;
        b=dOOWUWtW1/ups9jji5xt0TJtJPloSeq90fXQujOY5N6uNe6Kt59VVmaE8u5/zPkqVJ
         rjQBfAs7c63ldXR2zEFaFii3LB79RY28R9MIHumaioxLmBRtYmllAxHbRJmckk9u6cFN
         QGh9embinWoi17I9pz1qHCUgzk6sIRbdhTmUV82+xc6ogxyj+/qScGtbZeY0NM/sQXoX
         56tQReqkUfcAiwhUK6zn+cUvr2oCXe6vc0HsnmZQnat+k/DJfCbdujUQ8HRr9oI2YhCY
         W2kIzD3ifB5tUCbJAJObaMwzipb3SRzRQqMwbW85rS2JyC9ipMNyB5xL+Ql7KIB8KPw7
         szug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L5Ak7NcP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17-20020ad441d1000000b00670bd5a370dsi7124472qvq.215.2023.11.07.03.26.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Nov 2023 03:26:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L5Ak7NcP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r0KDe-0008D3-KU; Tue, 07 Nov 2023 06:26:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0KDP-00084O-7O
 for qemu-devel@nongnu.org; Tue, 07 Nov 2023 06:25:51 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0KDM-000074-Mj
 for qemu-devel@nongnu.org; Tue, 07 Nov 2023 06:25:50 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-543c3756521so9209950a12.2
 for <qemu-devel@nongnu.org>; Tue, 07 Nov 2023 03:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699356347; x=1699961147; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ORNEDFI9RqhLx/HRTgMGoDJrd1LTn93L8793jDfz29A=;
 b=L5Ak7NcP9zOenat5w+NMpSM3pMkQ9xU2m4velUagm4a+Kwo8wkk5IamcNakjYM+gDv
 Rxe6Vpcd1/IS0V+NcDUwmdesnOf1ZkZj9TdlTk5srgg4arjjCYlVu6CIfdEKXnPhUtsO
 mpzc5kkrySluJTNfq6O69ZnQR2KfRZWJtZNMI3H9N6MYuy66b5N4TZImBgVh75tsFZlj
 x4209j24AcmcJHwB3ulunfXITnZD349IgQYPHrRmGhnFgUqkDDhINh8Fnb110d0pnEvx
 PEcc6OCCwL5+HEUD54fUfqTq0OGMw4QIs9Lm6F9nbX9HxDfibPSPprH4PPRgviFaa+7w
 UQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699356347; x=1699961147;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ORNEDFI9RqhLx/HRTgMGoDJrd1LTn93L8793jDfz29A=;
 b=Ed05PjrC9sYzL6W2yoFXqtQh4GjaSkd0LpOe64mEwr0ByIDpnkD7Oezc1AUjvCQ4J5
 Yd12lX0YP1BTJkdQvCsVVnr52UOfdHijqYlZ19O4bEmlWYF+KcOt5b/rzkYIowFr57oL
 Zxshp+Eb8MIxnE8UO2K3ZORoXMcZZ3Ru/4vCMw5Bvg+YDT/nFGrvkeoguceuXe0oVTM5
 gfh7BH0UC7FtD8a+Bx+vD8DOSg3NqI2yTSBa0VuzmB1n2JNnolwrcLBh4VLIQC2saO1c
 1pVHuE17W15eXfk94FsjIu85OzqBsQWAJ2evKLKhGL2j+NKx3rEJLLFQUnvBW1GcNSIe
 dlgQ==
X-Gm-Message-State: AOJu0YwOUlAHZs98eOXB2puPGAzi3JElm3Cx8GjCfO35nX+5Cf1GORS0
 VEuPQXU/68i9qx8Jk1rE0VMQFPgSI21iaZimppk=
X-Received: by 2002:a50:d5d4:0:b0:53e:98c6:5100 with SMTP id
 g20-20020a50d5d4000000b0053e98c65100mr26559515edj.30.1699356347052; 
 Tue, 07 Nov 2023 03:25:47 -0800 (PST)
Received: from [192.168.69.115] ([176.187.216.69])
 by smtp.gmail.com with ESMTPSA id
 b67-20020a509f49000000b0053d9f427a6bsm5488119edf.71.2023.11.07.03.25.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Nov 2023 03:25:46 -0800 (PST)
Message-ID: <4bcede6b-3673-42ea-96b2-a4caa3a0c12c@linaro.org>
Date: Tue, 7 Nov 2023 12:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] MAINTAINERS: Add hw/display/sii9022.c to the
 Versatile Express section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20231020060936.524988-1-thuth@redhat.com>
 <20231020060936.524988-4-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231020060936.524988-4-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HrRxcBP8QCVC

On 20/10/23 08:09, Thomas Huth wrote:
> This graphics adapter is only used by the Versatile Express machine,
> so add it to the corresonding section in MAINTAINERS.

Typo "corresponding".

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 34f9036df8..4a7339130e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1006,6 +1006,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>   L: qemu-arm@nongnu.org
>   S: Maintained
>   F: hw/arm/vexpress.c
> +F: hw/display/sii9022.c
>   F: docs/system/arm/vexpress.rst
>   
>   Versatile PB

