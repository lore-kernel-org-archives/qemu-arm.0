Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp473242ejb;
        Thu, 5 Jan 2023 09:26:42 -0800 (PST)
X-Received: by 2002:a7b:ca4f:0:b0:3c6:edc0:5170 with SMTP id m15-20020a7bca4f000000b003c6edc05170mr36028701wml.25.1672939602284;
        Thu, 05 Jan 2023 09:26:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672939602; cv=none;
        d=google.com; s=arc-20160816;
        b=RJHuDuWIiyVzd8MYHEVJsaWwfrqPUOM+5LYy/dw+furaf8PmnfUkeI5vkO4SBuBy9Q
         q572A4lnaq243fKwmVaj6U31Eyo+Z9YUq8wfc+yN/aHP7fMtrLiStLlOWmSz/PiQbUPb
         Zm5haZKhpOLO0vqWNow5s9IYyi5tt2hc7M1GZ6jTFuTX9eCGKD6KJX4iW3/v3VdLD1vV
         HfgY+RWYETjgLLwQEChPfM8Qj1u7i3af6O/+SR9zQVtr2oMRSVGj/JAuhwg82OQwBS92
         AZ7qYv4VnWR2/BTDMfBbkDkjenUUzycqLqg4VaESELU4x33HT48k4QrBUeOOU2MybjUM
         VUZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=YJ9R9RXtjscsZqJEnjO20+62buuIfhCqeryuH+omc1U=;
        b=Kbkh2oMRVsbgycuqoLlT2AV81gM/0Kalz/QL+ITb1hMWaa1NNV53On+JdebiA7/vz+
         ctqohbUcvIn1Xq1z6GJHf3EDkuY5dUZGeyBjAn7N/IC3JoNGB2ti2SRgPZwYQgtxqV4p
         noK640TCcIBAy3DyEU5IJumQjfwLimOjBx7giFA+BLDbVKrbcLN36p9WiEb0NtAyIagB
         CcZEBhwAqMD9sqCks10IrBoO757Rd9Yxw6/wL9saKyPvwwThhHcyQOGXaE3XhSm2CR53
         pb7EmQ3gzoge7pqHTXa8SHR3bmtfaBSJHRImZsZwHMizGoHLPHvpVHRsflkp6haB5IYW
         mscQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x2O4i4Yv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k31-20020a05600c1c9f00b003cf684bef83sor2107572wms.1.2023.01.05.09.26.42
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 05 Jan 2023 09:26:42 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x2O4i4Yv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJ9R9RXtjscsZqJEnjO20+62buuIfhCqeryuH+omc1U=;
        b=x2O4i4Yvt+VOEEhJTeqBAX2ZZH9HOGHi9BCYO2B50iDwu9plmEH/dXFX7RX+6DkTQZ
         LG/Rc2Zh7NiQ67BpEaQLXVD/0HqDo0LN/+1tuXesvbunNeSDxpZgWqziHbRUpAYw1Zbp
         7BxZYB2X1PrHDUnPCTvLWG4B+R/AcJDXcectJ4H7LlEqKsn8SScgsjr11E8F/dGwtA1y
         YfwiKIVHokOgU2rIdBnkExAT7D9hLv0+73nBMzwJItqTHF6qHApQgIqxszEBFWL8tYZ/
         YPWxlQNSmnmgUMtu9hcJm80mt/FbwQYL0hT0cPRf4nhnPJiPw1fHxud3TLtCz3S84qYQ
         6Y8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJ9R9RXtjscsZqJEnjO20+62buuIfhCqeryuH+omc1U=;
        b=tzyciO+CDBjYOoz1dkA5SFH9QF8U9tNtKIO7kmQfAvszMivgSm9vxPNRapGgScwZzr
         zHeDPSYgoAef5vgV/xkPGS87L6RXH+/bmqFc/s+eeb4XSQJOJNkrGdINpiFzjSa6W68+
         VzoOV/F1ytsKswBNwGviQxmzEtoheZOvY9QM3n42hDlk6A+RE4vC2H0GhI9slY1ouuLQ
         sylLzNBWWfY+Y5mN8Jm76n0UjENEHm6Vl1s1wHT5mFHaMiom7Ymvnn/v62DPb6JKsQK7
         yk975YVc42eyENojhWvLJ1f16msjFtBUKc6/ukVyHMglk3idOA59vXn96wqsDH1f2xB+
         2knw==
X-Gm-Message-State: AFqh2kqAsiVMYZQvSVCzozK2Jj7VBUGiOcRYsX5jMcdW2MelqkqMm8US
	Wm2MDrEFfbtcZiiJDb6SNVwd9Qc7EHcRLOztPRg=
X-Google-Smtp-Source: AMrXdXt4tXUQ+WgtBP8T0TQkuq3QEoOCebVqsYx3qjzPi4ZeiOLcHp/FfaFFQkJQIJhddq/US5ii7g==
X-Received: by 2002:a05:600c:d1:b0:3d3:4d21:704d with SMTP id u17-20020a05600c00d100b003d34d21704dmr37046020wmm.14.1672939601883;
        Thu, 05 Jan 2023 09:26:41 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id h10-20020a05600c2caa00b003cfd58409desm3158151wmc.13.2023.01.05.09.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jan 2023 09:26:41 -0800 (PST)
Message-ID: <bdb3339f-e753-7911-6767-98b1279d311a@linaro.org>
Date: Thu, 5 Jan 2023 18:26:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 17/21] gdbstub: fix address type of gdb_set_cpu_pc
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
 <20230105164320.2164095-18-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105164320.2164095-18-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: iovlKn/4GUQk

On 5/1/23 17:43, Alex Bennée wrote:
> The underlying call uses vaddr and the comms API uses unsigned long
> long which will always fit. We don't need to deal in target_ulong
> here.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   gdbstub/gdbstub.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Yay \o/

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

