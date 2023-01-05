Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp465616ejb;
        Thu, 5 Jan 2023 09:14:01 -0800 (PST)
X-Received: by 2002:adf:f54a:0:b0:236:611b:e8eb with SMTP id j10-20020adff54a000000b00236611be8ebmr34003724wrp.37.1672938841570;
        Thu, 05 Jan 2023 09:14:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672938841; cv=none;
        d=google.com; s=arc-20160816;
        b=Ci+TmjEFkbaaicLJ75KhaYtSJ5vQ/IEQGhBizIRV68VT77wVwc49FNHJWSk8FIqsr8
         ph1OPL0dIr6hODk7NDwmFAR76pg8t8hw87DoR0ECJrw441FAVKJqSry9AWSuYAqgrJLE
         U9FhIzV90VhIdDDSboDpadWGsxZzD9Uko6N6MnztC4pnC+Kuc7jvAnhEBoS41EUHHGz4
         x3BevP5lXCm+9bkFZ/aNlJ9bqi+3ov85yJftHaPr874tX4erDA+b/tRA+YdhG2apd5t9
         17XvVwb8EyTvlrdsLW2tFreq+WA8rWoNQZ6lwPkI8YrKKLykvvC2bgUXlfE+Rd3W7543
         3wXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Vf8r8dUCl69AOMhjLwN+zUZ5SufaucXG+NCekgjiuMw=;
        b=I7rUGmlvLQFjLHS1rSqAQJxDf5nZxt2nnck6baHplMfZpck7ti0eiciVtT5Xt+tRGs
         d5NFSYK24gQ1YXT0oDRD4L7G5Rq+a9S5JE/h5eDW5Tr33pAVBYcqqqdkQskZi66FuXH2
         G3d662ebJGKVQYhrXPEEM0yAH2D1CSi23C3A5GYwMtnXlZUbFQK9VTwh0P1dJ8tFg9vi
         NpS0zv6EGobYSD2M8+WYWNy9bLv0kW/DvNnI3oa5IIa0/ki11aKtB772sz26hUioWwK2
         Q1i4bpRy6eCVrQmpHgs6O9Wvx0Hg4y6nk5XoPvnHPXTl5tjxY67XsGBxut94FFBFw4N0
         IUCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k+BySVUD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d11-20020adfa34b000000b00298bd4a55e1sor4937424wrb.25.2023.01.05.09.14.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jan 2023 09:14:01 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=k+BySVUD;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vf8r8dUCl69AOMhjLwN+zUZ5SufaucXG+NCekgjiuMw=;
        b=k+BySVUDQFoHBSl+qLgzP5BSNP39RyLjQBeBZdR5cL8TbzSgEVykYQkDupsunTKIw0
         +bYT9R/ep2jNDfxFFL7zZvYewa6VH58UBQCDRb19/JkhOekRR4jD+wavihhtry1zDdaW
         Abwy3BZ+TE8Dqn1qPzvC8hYCx6NXV73JT33kf9IbP2CASWt5qAJ5NuAVsJTEc8+M6Ssx
         Y4ygmEAK+xpktJdvYuJxzR3H5APCQabXsAkljKZpJ2IQujGWe/32jZW+fETQtV4qfDgh
         eJG0Lmo+Am05BR+VTQabeKASFuh2/wveXFcni+G6d9M1bBBNrlHjw1p3Fru6bldWLSF0
         k/yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vf8r8dUCl69AOMhjLwN+zUZ5SufaucXG+NCekgjiuMw=;
        b=SuEtIOWdCbFmWt4PV3MMQaaGRpFFN8xw5woiV53JBcOxAZlHAotT5QyzLLZDJwFRIc
         KI+uUpTR0GAd9il7tOg8a6HgwK/bUooHAq5DBt7jXhYL5MWLkfg4HL2yMELlnR6xnO4R
         8DeyPNpBDwOXHtH4EpJhpBHyk+dm2ykH+f+hKzh6rOIzsWxoHgKsLqRfNhsrnW66BWT5
         +yWWFTBNRM6012mkdKmH1KayY7fVidit0PCN+XY7hfGdNwJFjceKjLo1t6uHutAZK2g8
         inyTGLtpRGUH97jmy+f+BlapEdAd86fsx8gtlH00kuHnvIgwGrR93vPkJ2242DoFH9p+
         zFsw==
X-Gm-Message-State: AFqh2ko/IpK/NnZTbTfPCaPJXFtk8quQeJ2Ewc9anrGQionE6iRr7Tsu
	g649v/F0efQAiXcxFvnJ+P3ktMxakfGPhDMhaSU=
X-Google-Smtp-Source: AMrXdXtblv5x/dcf+pWl6BYX+YPaXXjG7qp/ZPdTsXGXiMVFgjbb5iIBoGu+RgFdu2iYZsDi6wLzGA==
X-Received: by 2002:adf:f143:0:b0:2ae:b451:a0f7 with SMTP id y3-20020adff143000000b002aeb451a0f7mr2479033wro.5.1672938841012;
        Thu, 05 Jan 2023 09:14:01 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id b14-20020a05600010ce00b0023c8026841csm36822861wrx.23.2023.01.05.09.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:14:00 -0800 (PST)
Message-ID: <27a8f6ef-b78e-31ae-6bba-eb3f106de9f7@linaro.org>
Date: Thu, 5 Jan 2023 18:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 12/21] gdbstub: abstract target specific details from
 gdb_put_packet_binary
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
 <20230105164320.2164095-13-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: zLdffU1gtFQ1

On 5/1/23 17:43, Alex Bennée wrote:
> We unfortunately handle the checking of packet acknowledgement
> differently for user and softmmu modes. Abstract the user mode stuff
> behind gdb_got_immediate_ack with a stub for softmmu.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h | 15 +++++++++++++++
>   gdbstub/gdbstub.c   | 10 ++--------
>   gdbstub/softmmu.c   |  8 ++++++++
>   gdbstub/user.c      | 19 +++++++++++++++++++
>   4 files changed, 44 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
