Received: by 2002:a17:906:6d0c:b0:9b2:89ee:1eb8 with SMTP id m12csp74078ejr;
        Tue, 10 Oct 2023 04:57:45 -0700 (PDT)
X-Received: by 2002:a17:906:3094:b0:9b7:2a13:160c with SMTP id 20-20020a170906309400b009b72a13160cmr16348796ejv.69.1696939064921;
        Tue, 10 Oct 2023 04:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696939064; cv=none;
        d=google.com; s=arc-20160816;
        b=VuG2Mp1gEngMUdcRqao4DmY4aeLRMzx0qSzCYPpWrTxIoo63rpH1IbtRWn0cDJfVXO
         XN0wcExyPWo+SDZsZiy8B4DMJtczgoYTRVGEpuouc1teJBMRKCW4aqUZI1WlW/3K5R+H
         LqLS+JqxLucYso9yhMiHJeEpM1dG7QURhdUgngsHpo59XqugPQ+TtLyhF3gtGXnduOkD
         peoq7yfdGeuOjW8VBk3PyZUOAKEt+sNgI36y6T2Wm+YkCIEtJH929187Zbz7J5xomTr0
         EzCK4pn9UkJZMPAhFuyiP9DKKAHzs+IS9s+Up5bbIqcpSLY7DzNUJd4/iVINCS7jI9WX
         N1Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xGeU3cXek8o+T1iEneqtkwd23YAA4t01QHHMZH8DEJ4=;
        fh=laApbzcyDW67yvaQPTErmWsSK5B0H2U8qOdh4S20ATg=;
        b=xuxqhFTwwpnbAZSF6tpNbNrCzdCfBSI5wll1QBDKWX/Wo6Ym7kS1oXx5psVmkTWwN8
         yi7uLe3SxniIO6SQU5mRkAqqNLYPrxxMggbEfULQCTnT/IMvvyrjqCTIDMzaBGRvMk8F
         cDDIzOPhHJntjPkCKTcZtVPehDpPUfs4YBsDzK9ywki0Pqvf0zexTkwYso8jaGJZZ4NE
         m0AXKIk/KMV5k0qqXJULE5tb/CzkeDxJ13o8K0ze4vCrXbM9rbq9DVDfxZwkCWnUvRlq
         oeop4dcqS8gRzIymijuRP4egck32xc2Y+olcsNyu0JOX1+p/REEUnC8DILxl2Ry+Nlzx
         WGCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dtAw2WT4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id og44-20020a1709071dec00b009ade0fb6ed1sor3976681ejc.3.2023.10.10.04.57.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 10 Oct 2023 04:57:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dtAw2WT4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696939064; x=1697543864; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGeU3cXek8o+T1iEneqtkwd23YAA4t01QHHMZH8DEJ4=;
        b=dtAw2WT4Ly0NPOCAuOHYdaDLKXEocUC80roantDk3Yp/mKJOUbQqIJUwNPb1VaiJeG
         A8qM0KpdOuN34uvIUxmg2PiokcpJIx+3QwGhGuPFOy09smSBcFMVAINhl7O3jFvdlJs6
         wp+P1tWKEQpCMj7Ln4Wq50FP8qmC6NkY4rCbcOcSaG4IHHfy/wMh7/3zdWLIJElADpUX
         4L5Qde/Vwx05Wx8DItP4ezVFq292EvNvLhV+jp4njdQLYlCfn6H+nvoC+oNFK9uOAb5Q
         36lQZQVvdDozUm2HOSisbW5U4m4FT7YMZZ6X7W4dLRfd87tRc6skHVbXbfaBaiYMK5ey
         n5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696939064; x=1697543864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGeU3cXek8o+T1iEneqtkwd23YAA4t01QHHMZH8DEJ4=;
        b=WX71ARhu1WzBQaDymRGLCYUilBdMEy6oUb7NeWHttgVrvuCogkQe5Hd5Gxc4JPRLI3
         6CtEz1qpXMUWhSI6IIWqhEInSyMKd7x6qsBIMTEnsoW+yBlUus67LkNACCg0cnUJVGEY
         zBpmatR3sLSUwOWggXEM3Mn0Lbjobf7QP48kgeHHByAAFA16A+rM/Yu8JyRwQkKEoCIQ
         Phnzj6aJvS9SD/yoWyhoUYdQjy3hfKYVO0LePx9HAhvyIpMimgAnHJqEOGE2xQdmXvna
         W2P+6tVq+wh5ogquxJu+j7NYFAUFtIJlCmPmHUYAqZ08XKgbghloKq76z6SL9vXeH3os
         htVg==
X-Gm-Message-State: AOJu0Yzc3CGQkY52LC6epP/Ij2vf64PMtW8N7fABRfZuzhsIf+WVl1rP
	l9UFzkukMaZ6H0iPhXSsuBaPPPMcE4+TeoTwgbv07MA4
X-Google-Smtp-Source: AGHT+IGU0HbB2cfpV+3WoSB2ZrZhhAuNnOoSXIqzOSH1LZXoMzi1T3GTxxcY1fZiB57PKnTRiAgF3w==
X-Received: by 2002:a17:906:538f:b0:9a2:1ce5:1243 with SMTP id g15-20020a170906538f00b009a21ce51243mr16947130ejo.60.1696939064299;
        Tue, 10 Oct 2023 04:57:44 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (aif79-h01-176-172-113-148.dsl.sta.abo.bbox.fr. [176.172.113.148])
        by smtp.gmail.com with ESMTPSA id lf18-20020a170906ae5200b009ae5e46210asm8362356ejb.99.2023.10.10.04.57.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Oct 2023 04:57:43 -0700 (PDT)
Message-ID: <89cbf1ea-8c4e-a582-68c9-ab7844554b49@linaro.org>
Date: Tue, 10 Oct 2023 13:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH 07/25] configure: remove gcc version suffixes
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Brad Smith <brad@comstyle.com>, Radoslaw Biernacki <rad@semihalf.com>,
 David Hildenbrand <david@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, qemu-riscv@nongnu.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Leif Lindholm
 <quic_llindhol@quicinc.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Alistair Francis <alistair.francis@wdc.com>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Maydell
 <peter.maydell@linaro.org>, Yanan Wang <wangyanan55@huawei.com>,
 Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Beraldo Leal <bleal@redhat.com>, Yoshinori Sato
 <ysato@users.sourceforge.jp>, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-s390x@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20231009164104.369749-1-alex.bennee@linaro.org>
 <20231009164104.369749-8-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20231009164104.369749-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: MV8dYMlGOz9W

On 9/10/23 18:40, Alex Bennée wrote:
> The modern packaging of cross GCC's doesn't need the explicit version
> number at the end.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   configure | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
