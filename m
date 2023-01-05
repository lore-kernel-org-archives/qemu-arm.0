Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp471205ejb;
        Thu, 5 Jan 2023 09:22:53 -0800 (PST)
X-Received: by 2002:a7b:cb59:0:b0:3d3:5709:68e8 with SMTP id v25-20020a7bcb59000000b003d3570968e8mr37059584wmj.36.1672939373719;
        Thu, 05 Jan 2023 09:22:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672939373; cv=none;
        d=google.com; s=arc-20160816;
        b=JryalE4M1+1MxOj4Mn50Fp5/7Rm9qajqQi7+OAhkYQXbvpuXu45wntXBgoBr9Pur0t
         61razgVzMeE2E8MoK9BrWi1hk4rGJJXQf6qZfXVTg0jXf5nfE4YZFeX9Rxgua9iQTqjx
         y7YEpaSGRTO9n8VJz/2CTu1bcbqitR9pHYqTw+h6L+xpj8JPmOM2VPOXgm+jYV0YcNcI
         dJPiXHTZcMacCVWWOpl/Vz6SkV4yv3T8vwfQTOePKNO2rmXbP+0VuzA9LDzncr1jrNSd
         a7c1r72B/ZD7ZkDB0Jy+p6CxiSyKoiEDZ9M38LyPRQYZV5ll4YZn04klsyaKcGv07xf2
         CPnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ylKcpkWHZgkHqciFS3PTc6pROI+nTj0vsfG4lupU4fc=;
        b=097ishTQqBRFvrSDzooglq9H/w+xP75svCYwY2qEPdbNsyn/MEIwfn8VlUAhzEsVUX
         JQCyj0S6KR/+yaB+b1gtp0keKMZjJ6kRHEiEAc9HspuWp5Kw3hrKed2Ic4ZJfnZPlvN+
         +kXb4ZMhLXMC+t5Lyv0qgLc1ZgultsgMLj1OKIK/CliZTUmHobwhUIsBXqFkVVjpjIdg
         dSjq1suoXQz7g5MS4a1d8dQszFE8ZsZOEARxAjDimZz4TmNpnwPHS3m4YVtcJgYmPRPu
         YUMevVTyhg/LHjd3fVupVYD9Mdahh1nXErXZYmTm+hNtWJNVNnq2LBRrbQwGatoKyoQr
         szYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qtak04rD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id m7-20020a05600c4f4700b003d97a16322asor801669wmq.23.2023.01.05.09.22.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jan 2023 09:22:53 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qtak04rD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ylKcpkWHZgkHqciFS3PTc6pROI+nTj0vsfG4lupU4fc=;
        b=Qtak04rDs48iN0UbCFzj6sXIS7Qf/4vd8+ZYPRl7qUEI2qkDAuGraPFkMW72WV9dyC
         XK/4BswCGE1EJq8kGp1RJPwtiewgFtSfWlSzjZNUvUVzmVpPR9x+31W00IcFjgtWZNsi
         nwj4WdKjtJYTsfJCd8HSjnXlGHwhhu9TFwz5UwY9pVZsNqK8p3qO0KqS2TAfMnE515VA
         e67hNR1sW1Q9tgN3U7VwNVR/A2vQtVK4bkteholyPmnRoNWkCi9DRzAAcVpE57SWE82i
         Mdc9yJmNXgRiyhiy85dlj+9uDNNy8zEJqfTftJ9B0Vfba0BeQVjuQcxVlp+lL7tC96vQ
         aQxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ylKcpkWHZgkHqciFS3PTc6pROI+nTj0vsfG4lupU4fc=;
        b=zrjCHcSktyxv8hkyXWyXJWSDafBUhH4SLqtDO9ALOznKR1fEbGvTn6cMRmNSp0jHyk
         yVzTgyi8jrh14VgCz9s/4cd9qF565W0FxUXYWUv8A15rbcaMOUtdYz5LeZF9OKRIL4SQ
         AiUCnB7C2CbERPnLxMvGCT9WEpF9iDzYCldOcPT6Q6eFZgC9USUllc9DMtB5EO4iWmpU
         T5KihnWY5GRaY9MSXfb4Hk/8n3NQ66IuXCr9/kHQ6EQL6mw99w8GNwky65vL3nu1GBXt
         6fCkXV0jx2aHy1QEpROJ4g13z8VIDNyBSW5rKlWjIQyGivnCX9dQV3nNLhohUXtHQLCI
         hj0g==
X-Gm-Message-State: AFqh2koxloubZQF8u89bxruWkpmrX+vwy0PcANhIaGZOfIimxiIOv8X8
	tnBlf9m8T2mzqCbJYkbYwZEnbb+TiiEZDSmYhnM=
X-Google-Smtp-Source: AMrXdXvEeWn7Xu7HP8yM4dJdtXlej7ArIR+fWdPsZg+GugRgOgv1vRf8kEtdaVGKN6RzWw2EgFN/WQ==
X-Received: by 2002:a05:600c:34d4:b0:3cf:a39f:eb2a with SMTP id d20-20020a05600c34d400b003cfa39feb2amr36839330wmq.11.1672939373107;
        Thu, 05 Jan 2023 09:22:53 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id l14-20020a05600c4f0e00b003d96c811d6dsm3321992wmq.30.2023.01.05.09.22.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:22:52 -0800 (PST)
Message-ID: <3aed1547-aedd-7856-7ab4-4d2ee9176c1b@linaro.org>
Date: Thu, 5 Jan 2023 18:22:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 13/21] gdbstub: specialise handle_query_attached
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org, alex.bennee@gmail.com
Cc: David Hildenbrand <david@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz
 <groug@kaod.org>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Song Gao <gaosong@loongson.cn>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bin Meng <bin.meng@windriver.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230105164320.2164095-1-alex.bennee@linaro.org>
 <20230105164320.2164095-14-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-14-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: rZOdsCb2evoR

On 5/1/23 17:43, Alex Bennée wrote:
> In both user and softmmu cases we are just replying with a constant.
> If the linker is paying attention it may even be able to sort optimise
> the call.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h |  4 +++-
>   gdbstub/gdbstub.c   | 15 ++-------------
>   gdbstub/softmmu.c   |  5 +++++
>   gdbstub/user.c      |  5 +++++
>   4 files changed, 15 insertions(+), 14 deletions(-)
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
