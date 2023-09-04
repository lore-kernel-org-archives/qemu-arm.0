Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1123237ejb;
        Sun, 3 Sep 2023 22:54:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7um4NPli+q5WnyJpQVHs0BUDGbqM9R1KO6b8JskTmjAT9SrGAI+HrjgOP5LZgIFtG9mU6
X-Received: by 2002:a05:6512:b8d:b0:500:95d8:1b01 with SMTP id b13-20020a0565120b8d00b0050095d81b01mr6246279lfv.65.1693806853029;
        Sun, 03 Sep 2023 22:54:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693806853; cv=none;
        d=google.com; s=arc-20160816;
        b=euVf9glmkjy3OdjJ4jgmPNNmKy5r/zNa/JGbuXRptj8YhuoWv7t7Nv5FEaShlUPzbu
         ipUsbrU6sfKld7rVgchgLD7fJRfYjKN9dCbZLV2higAxs/wLjVHUL0p4zrrSRVFj8rdJ
         DMagYe14GenMO0AtXZdSg16ihZiXthkOi3dn0OpVA/l2z27wQYtzrgqMMZAS9wo4VQ+G
         OvYQHnom0171NL7cjB0H8FLb2zUYcZi7mzEjcD2wRJIn9O0EwMt6Q7DR/cyT/3ZR+Lv/
         uVXXHpRI3NUDWF3mQqmwSpTJTFpJBLlJ05O3s0OCTX+Qag+BzONOt6SMl9sL1sTTWDdH
         vvDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id;
        bh=7YW1+9PM9WWfis8hQG7lKKRnIe4+RHk/ddSWpmI3jyw=;
        fh=fs0JBmGYrpLYe5Y9MMzXsy7Md8vfaj5MSqEsjE3tGCU=;
        b=zeGK0r8+k5q1vsXTYUc901P127qSe/AZ9mbhG5srJvLapzPP90Ikshi5duipms1U05
         pYE27cUAPBumkKU6ILxrzv1HJ0V2I39EyegSpc8c7YxPxZz+dnjWimlWzV7oKpGM8fhW
         6xImSLDYf2Fvtk1FUJcvnqFJlVzgGJkAH1RUjblfYhchbLOwgxpcamvNdztvk5gopKD3
         8jCF0tOiBi06UeqO25Fx6Tl4SQIHmRW3Vua3mrsvRgBWUGficJ5KN7KHQhvmTvP5OX5X
         I1gc4uvsm+rHxR5Zpw2ZNIYSotHpHTVsTVR/pbum2ZHj8ZjPGW6Hu3h/8D9ewUK9ROgD
         vKng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Return-Path: <mjt@tls.msk.ru>
Received: from isrv.corpit.ru (isrv.corpit.ru. [86.62.121.231])
        by mx.google.com with ESMTPS id t14-20020ac243ae000000b004ffa282b947si2763809lfl.425.2023.09.03.22.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Sep 2023 22:54:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) client-ip=86.62.121.231;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of mjt@tls.msk.ru designates 86.62.121.231 as permitted sender) smtp.mailfrom=mjt@tls.msk.ru
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id F36FF1EC2D;
	Mon,  4 Sep 2023 08:54:51 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
	by tsrv.corpit.ru (Postfix) with ESMTP id B7CC2256A0;
	Mon,  4 Sep 2023 08:54:10 +0300 (MSK)
Message-ID: <fe9021cf-727f-aa8b-c22a-7432ce928fb6@tls.msk.ru>
Date: Mon, 4 Sep 2023 08:54:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 4/8] hw/core/cpu: Return static value with gdb_arch_name()
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mikhail Tyutin <m.tyutin@yadro.com>, Aleksandr Anenkov
 <a.anenkov@yadro.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Maydell
 <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>
References: <20230903043030.20708-1-akihiko.odaki@daynix.com>
 <20230903043030.20708-5-akihiko.odaki@daynix.com>
Content-Language: en-US
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230903043030.20708-5-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: u6hv0yp2xLS4

03.09.2023 07:30, Akihiko Odaki wrote:
> All implementations of gdb_arch_name() returns dynamic duplicates of
> static strings. It's also unlikely that there will be an implementation
> of gdb_arch_name() that returns a truly dynamic value due to the nature
> of the function returning a well-known identifiers. Qualify the value
> gdb_arch_name() with const and make all of its implementations return
> static strings.

Why it needs to be a function, can't it be a char pointer
initialized at the cpu init time?

Reviewed-By: Michael Tokarev <mjt@tls.msk.ru>

(What a huge list of recipients in the Cc..)

/mjt
