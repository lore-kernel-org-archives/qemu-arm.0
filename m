Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp472778ejb;
        Thu, 5 Jan 2023 09:25:52 -0800 (PST)
X-Received: by 2002:a7b:c39a:0:b0:3d2:640:c4e5 with SMTP id s26-20020a7bc39a000000b003d20640c4e5mr35482487wmj.8.1672939552567;
        Thu, 05 Jan 2023 09:25:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672939552; cv=none;
        d=google.com; s=arc-20160816;
        b=gJYPyqEazjaJj4d6Q97dpz+TgjS38FPO729UMZRUQTG8TB+n0WTr/SBwzzK+4+1viB
         r9VFLwJ9s6Rd+U3CyTHL695R5STgCg+nCPONdupXUCEMN5VCt0I+jlJXpm5rH/p0K7q0
         vaouC4hd5KmAd0M9fDz77cSV3XOWpnu63XYmBz9QNyI7jygn71R19ZF1oN5c+SMBPx/w
         b6u8c7uYBiOCLLG5WWfjrR5Avzh6+cQ5byZa9mlYEgjT2JFp1DvJxT5fwWR8POL/1lRo
         0yhE8F8CP67fcoONsgL8TFMB9ZJpJv3qK1SrfQWphq17FHY64GawPoPsSb+DJ3K511FI
         YB4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3T91HwQOAnWIpRn3SvTRnOAfUKhwZ/jeHHmRfduj66s=;
        b=O4qQnjc+fnKrpq6RiMDEnCrFm3GtLnzqAc6bU5VAJlsYjIZhNid9uFNpOu0yXL/LT7
         mx2Fy35gZwIetLTbvvzFMoyL1iKKOI+UoL2qyPfIUXOQn6v6jfJNfrGDtWL+ODwa2POe
         LStCKaJd2lBYIK7E6X7A/WwNpGEQTc0ppDB56/sAN1taGcJFHCmf4/9VL3dOTTW/AB1T
         XbBcB1emgdkaDfKyHLskPGoY9eSjqKVPVku/MAzdaD1GUfTU4i3KSqqpbXgMZUlpt4Nb
         S7LVk+qMLAiAZavbPSx+FEYD01kqlE2OTxTRk8K19KwynvjTTHbvMqlKCWoSwDlgu7eB
         XZhg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=quMu6EnV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a4-20020a1cf004000000b003d9980c5e5fsor842583wmb.14.2023.01.05.09.25.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jan 2023 09:25:52 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=quMu6EnV;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3T91HwQOAnWIpRn3SvTRnOAfUKhwZ/jeHHmRfduj66s=;
        b=quMu6EnVbim77rg8p+wR/ErN2PVaJe6qBy1KNSodJi9NcQDJdhB2ABvMzqYXcvyfPn
         Zs5h7Aivn93mFTn8iHCGJOA5hf6uhT0xlc9JO7Pf2X1KX2Xv0xFKe+ZT9aBI37LU1HRK
         XxOQY0/SSkaPehewXM/yhDXZTof2aqyp4FD0NIBVhy8kSFfPewIe2gVnAsNdM2LcZfi0
         krWOZdLTMzjWUJePkf29e6gxj9PeoumBDIYhD26F/wFg4vHsSQBpnFymSyKSUbP8NBgK
         d0swAkVoEoUjWMTNeBQxeqGf9tOTtG+o7hXeQ8qU8+xaaXOzNdBOCJlw+LAszPOBwdt1
         /xWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3T91HwQOAnWIpRn3SvTRnOAfUKhwZ/jeHHmRfduj66s=;
        b=bSzTRwIGNhYH1akDeW/h7GOAAThhTv8KWSOrWoygwa5ThGBK9y0/TkVopQhOGPv++9
         sSxyY2mmjQUbXP8b4Q/RjKHGjZiawSwC3FesHkp7NaDfD1lssIw0tpfWqGnD2owEfqcM
         F8p9kY7aFM3eAF8YDzgGNJFAPWG1T4EzWuG91gRVLDqwShUoGB+B/+KFuEWIrAJMmgBU
         RofnraSemQaEwQBEMwcvFVM8AfMlY6AksCinDoS7juj97B8CgFlkUXpH9ZYkeRV76jxK
         LGk6Geqxr7xDehEGcO1IILuHoqwBJrOaEbkKCJba7bzz9q9n8Nr7uinUgLu8Bm0OsFKf
         yHrA==
X-Gm-Message-State: AFqh2kpMWa4jG8j0BiYOkooHWz9iwy3B+TPKeS6EHNyz/9Dvlz3GhvH6
	E69FuN5o4f7qvhIU4RcVUsRro3c8zyVIfOhj8Bs=
X-Google-Smtp-Source: AMrXdXvsHBe9d9GUMJ95WBX2h+TeF4Aisk1ydk+fuVdZmjxULJqBXMxuCgLrZGU3vG1D7A4Ueus7Hw==
X-Received: by 2002:a05:600c:4e53:b0:3c6:e60f:3f4a with SMTP id e19-20020a05600c4e5300b003c6e60f3f4amr35763244wmq.1.1672939552111;
        Thu, 05 Jan 2023 09:25:52 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c3b0700b003cfd4cf0761sm3611995wms.1.2023.01.05.09.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:25:51 -0800 (PST)
Message-ID: <460dc896-f3bf-26ac-5c0d-95ebe1e3ecfd@linaro.org>
Date: Thu, 5 Jan 2023 18:25:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 16/21] gdbstub: specialise stub_can_reverse
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
 <20230105164320.2164095-17-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-17-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: JP0c7rjJi9ZQ

On 5/1/23 17:43, Alex Bennée wrote:
> Currently we only support replay for softmmu mode so it is a constant
> false for user-mode.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/internals.h |  1 +
>   gdbstub/gdbstub.c   | 13 ++-----------
>   gdbstub/softmmu.c   |  5 +++++
>   gdbstub/user.c      |  5 +++++
>   4 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/gdbstub/internals.h b/gdbstub/internals.h
> index a371373c1d..1def9dfc9c 100644
> --- a/gdbstub/internals.h
> +++ b/gdbstub/internals.h
> @@ -126,6 +126,7 @@ CPUState *gdb_first_attached_cpu(void);
>   void gdb_append_thread_id(CPUState *cpu, GString *buf);
>   int gdb_get_cpu_index(CPUState *cpu);
>   unsigned int gdb_get_max_cpus(void); /* both */
> +bool gdb_stub_can_reverse(void); /* softmmu, stub for user */
Maybe without the 'stub', gdb_can_reverse()?

Anyhow,
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
