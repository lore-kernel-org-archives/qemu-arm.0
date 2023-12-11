Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp545589ejo;
        Mon, 11 Dec 2023 15:16:42 -0800 (PST)
X-Received: by 2002:a17:903:41c3:b0:1d0:a720:1fd3 with SMTP id u3-20020a17090341c300b001d0a7201fd3mr2709157ple.99.1702336602124;
        Mon, 11 Dec 2023 15:16:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702336602; cv=none;
        d=google.com; s=arc-20160816;
        b=B8CPfh6z3/XOfhl0xC97NnsdLFZ9C+ViKEmlC7iEsrJ8lSRSvHFgkWedCTvnxJSZmG
         RLybGvJJW9MfuUCIadAYTlcWSJBUx8u1yAMQvCUkM9y5G0NcltU/rWm/wINtmA69ldJI
         WGB/8EoBqrZZDW7TSytlLoxOBMV+zvqYEZ9/O9aIzx78x/h/iTHrrCptLb9Uh2sq6gui
         wDtsGFfPb5J20h2QD2KDhrh7FIAg7c8YaUcddWhMBbnPwITZ5+lOj15HXbkH3hbbNRqZ
         zZQvgyEEAlPBMr6gOIA19kR5eMiiQETZWarANx3MSKIT5J6rRz6WoEdD3VQ/b6ADG36n
         2ymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7uDEa0JjOrTmrII77+8YPdYdLQJufCIk9SxhvO5WfpU=;
        fh=ZGL2BzSZT8cx+SUKrLGqcr11tTRrrdXPV/vX6s6EM0M=;
        b=E0bDqF8nIjRc6WGSCXxrP9qVxA5NrOEoX+erd2DuB44u4dkbqYWsr+i5TvX93Sq5kx
         69gF4nxQqbwGHiBRwKmHpMz+9/XoE1QZC/mNKOpOkXHflHSvm2xZroXdZOsJbME8xr7N
         bwtZlB2X0Vu9gjU1ajwTYmAhVP42KXI7kIXaBFiovhEBDLwbWPGwDwuaNYJdyrUK+yBk
         w6Rj4sAWUA92sq/LugEpKeeyOKS0hiXgpggJzYpg3kzWzxabwoSLiaVC9smCH0ipJUxk
         WnQtC0DYCXAHoLI3sJES+nTspqxOVv9USFa1uYggxTkD7B2WepDsck21sLLK1WDNMlBJ
         5khA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G9GYLXIi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id iw21-20020a170903045500b001cf6e3dd8e8sor2685776plb.1.2023.12.11.15.16.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 11 Dec 2023 15:16:42 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=G9GYLXIi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702336601; x=1702941401; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7uDEa0JjOrTmrII77+8YPdYdLQJufCIk9SxhvO5WfpU=;
        b=G9GYLXIiZLzWdh9uVrUPA8g2gEiKVdGsTqGLu9yY41oMXpIDhyeeqzn7oagiKHPKzr
         R33yUMCZWVghBbHPYe58R/A4T+RFyGfruPGchxwSYWHLn5I5GvaWzXcxZbMWoZKmAWmn
         r3+eZ0FJqNSUh/REub7XcvMz2NejIpUC0bsX9gY7NqpOMtyHBdDlPC5+3fld4CIk9hAg
         w89Nf3zCtuFVSh8R9WLVpwpyP3bhf26+WlBnbXMLgFIGPHgkejEdCypA2WdKHGyjLUG7
         de7IlLGVLC9UeXNqIVteDdNTp4Jhs+4MwCdukk6FZTYamaWgLnNUwudgj51BG+BIrW1r
         iwHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702336601; x=1702941401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uDEa0JjOrTmrII77+8YPdYdLQJufCIk9SxhvO5WfpU=;
        b=p/xXUmxxKF0GCLdtCICE1MsU4NsR9BBm/ik5uzY/fFDmLoqEJuw/a2l3Y9krOwT8cC
         wIOUwxpD4WgImC8pkl0SUkhPQwzli6bxoDoSdiv+NS9iNJmFTtxT054C7BJWRFID/OpP
         tbK3vKk1hDaVh6VQKnQUYreo1HF5jqTtFtXtwJ4vpgrSCqHqUZl0/6PrL8L1rxvPM+Ow
         OQMOsPAZroDGbX4hJIkdGye5NztVh4yJgib1+bhSQEDkX21nUjNyQH2LvgAUxXa7m+Sn
         ItMGVDjHG9SAA7/AruDSO5H7hlD8jE7G7AgtsWPK+EoXEeG7ZggBBg8id/Yvh9xOTD/E
         TrrA==
X-Gm-Message-State: AOJu0Yy1VYArI9Y8MWF6ZA8kk0rASZPDbqZVf7/IwUmjTAcLFNtAirAJ
	63E2UcYFQ68AFXgtNFkQyQSud7Qc
X-Google-Smtp-Source: AGHT+IGjIxHtEwMA6yNKqMqo+5edHATNi2Y3lBPtG/LIR6V7yAUI9vDGZrKbeFcCQ0LM4NZnh6Kj1g==
X-Received: by 2002:a17:902:ab49:b0:1d0:6ffe:1ea5 with SMTP id ij9-20020a170902ab4900b001d06ffe1ea5mr2797581plb.136.1702336601620;
        Mon, 11 Dec 2023 15:16:41 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id g13-20020a170902d5cd00b001d1d6f6b67dsm7213405plh.147.2023.12.11.15.16.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 15:16:41 -0800 (PST)
Message-ID: <488571cb-7770-4183-a760-ae4bd6549531@linaro.org>
Date: Mon, 11 Dec 2023 15:16:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/24] exec/cpu-all: Remove unused headers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Ilya Leoshkevich <iii@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Claudio Fontana <cfontana@suse.de>, Brian Cain <bcain@quicinc.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Thomas Huth <thuth@redhat.com>
References: <20231211212003.21686-1-philmd@linaro.org>
 <20231211212003.21686-16-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231211212003.21686-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: cL9XYa+dep1/

On 12/11/23 13:19, Philippe Mathieu-Daudé wrote:
> Nothing is required from the "qemu/thread.h" and
> "hw/core/cpu.h" headers.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/exec/cpu-all.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
> index 9a7b5737d3..b1e293a08f 100644
> --- a/include/exec/cpu-all.h
> +++ b/include/exec/cpu-all.h
> @@ -22,8 +22,6 @@
>   #include "exec/cpu-common.h"
>   #include "exec/memory.h"
>   #include "exec/tswap.h"
> -#include "qemu/thread.h"
> -#include "hw/core/cpu.h"

While thread.h is fine, I'm not sure removing hw/core/cpu.h from cpu-all.h is a good idea, 
and would explain the rather surprising changes to add core/cpu.h to other files.


r~
