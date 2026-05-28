Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321BECD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 07:31:48 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSVDU-000861-Rs; Thu, 28 May 2026 03:31:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVDP-00083M-BL
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:31:39 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVDN-0005yd-KQ
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:31:39 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4891e5b9c1fso107543055e9.2
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779953496; x=1780558296; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iBcsPHpeORLFwkSUrxks6ls24E0nrkuKUrAAkhe4+E8=;
 b=nyHNzNQruWKnqoP7o8ehHOzuntXIoleX0SKTwzp8q1ka8LjSKuj1Bi+b2lvyseO7Hx
 cFY955B8Msrf00Lmm+M2m17EH8Dt2z4wwz7BgPSMTSiO1Jo1laXB87p+d/+miS5MYFV5
 OMw2s3l431AK9sa7VeG9vL/XvmomduliZcHICOPb1BHNWpKRfRNF7g4yVJYhV0FUAzvn
 lFju8kb0Yki7kbiea5wB35x2BmwkKCEzD0Op27kk9+kmkmg0ZbrOgSD1aLcCOPRq+fWC
 mN7xwWjfpU4lJl/Q162UgHAkxI06vi9dYHXZ9KiIvssZSoXe8QuSXyDNmvXdL9q+Q2h/
 r8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779953496; x=1780558296;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iBcsPHpeORLFwkSUrxks6ls24E0nrkuKUrAAkhe4+E8=;
 b=iYjvF0Yyu4mK1S7NcAy6qgRydbx+4UU64D9yVMVq5WJJj221Vya9WehsoK7V1yi1qH
 mGvRZY4hAgKZdFGWnoQt4pWKf2Xv8XlaPp6UXEFDhPxhO3m1UgEgbNpn7vSlNfKzXThk
 fpLFQ/g7KrbbEa+6Fhakpjw9X0kO9Z1nn0Xmb2rOU4/zRzACeb6VgOPxAYTGjqyIqjR3
 pXQCeMYJyaH5wvk1b+lIE64QZMKw4GufcKZO91wTeDoODyJNWV90GOWfcQzRa5DJxi38
 71uBp31S3mI5R5abhvCuGzp+ZVk4uU7tLxlMPdrLRj4kWhPEwFn/nIWXXTtY63exfRnR
 OEDg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/o+5H1lLH2+mXThHwZ5dbu5Q9TqM/aIIFT63yqUT7ur2xieo4pj7QCf4yTdm8/cMI9JHHL4i3Qsg==@nongnu.org
X-Gm-Message-State: AOJu0Yyfsnj1xiujQcxPFFRHdzUmHXt0agevfQIPFwbnOpwm4ai3TuFZ
 BwzgTsJPlE8Ofe3NCZyoBdS7pu4WcxpS5Bxshpx6Pv1QkUthcBmSMzu4puEM49xewJg=
X-Gm-Gg: Acq92OEh578MmSxDKp3BHcXAmhaLaFXFZhwDE92mf6EgH/SgJx/1+dPwKi+/bBsoy+X
 +8ldEI8sUdSCoVys5OsdjpBJVZHRssy8fDL+EUt636Apfrb7TnUaBmrKdJZjMn7ESFcwWymjvGa
 8YqRTQGLVS7mmQ6PDuvJhXh2vIuCE9O1XEvBeGoequzPqq7BS/rGBxqV+NwVZo9YZrGuYOo9iLu
 uv2hNZBGbZFqvcbYZtQc6suCNJdZ7mjvHY3R4Wyv8q4q52NU7xdNAi3kOUbXQQ4cQxYiVInNKOk
 q76f3nM6FCPBi0srDy6wNb+LQLxNeQRm4ZkKABGSRGDq4cg+j0Hr3w2XFp+1I61pf36WkNZM/YF
 5MZDK2eeykiU7NI25tnbnxBpm6G9+lsdmybFQDIQ4X2idVh6ENZibdey5cvecl+jxjNr/XbLfui
 kjZYOV1lVaM0AzfLAT13hL1qNIG8Uuppkx776o3/JwKphSk9EoxsoezOKou99ZO2bz7mydiHzCf
 F4s
X-Received: by 2002:a05:600c:8217:b0:490:51e9:deba with SMTP id
 5b1f17b1804b1-49051e9e233mr350959295e9.27.1779953496033; 
 Thu, 28 May 2026 00:31:36 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909284a895sm20109615e9.8.2026.05.28.00.31.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 00:31:35 -0700 (PDT)
Message-ID: <0fc476ae-b546-4fe4-b6f2-31ada0d9e89b@linaro.org>
Date: Thu, 28 May 2026 09:31:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] hw/net: use stub_ss for vhost_net-stub.c
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex@shazbot.org>, Brian Cain
 <brian.cain@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowang@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, Peter Xu <peterx@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Fabiano Rosas <farosas@suse.de>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
 <20260528051642.115721-7-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260528051642.115721-7-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 28/5/26 07:16, Pierrick Bouvier wrote:
> Removes conflict with several targets where some support vhost, and some
> don't.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>   hw/net/meson.build | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

