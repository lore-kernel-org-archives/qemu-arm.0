Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58672CD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 07:32:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSVDD-0007ib-Hf; Thu, 28 May 2026 03:31:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVDB-0007gY-E1
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:31:25 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVD8-0005Xa-TN
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:31:25 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-45ee6d32402so166719f8f.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 00:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779953481; x=1780558281; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QqSpy9gXjopYGP/FUc8iV+kdLobOzc5QVYJuEhyfONg=;
 b=eF8kMPYKqKugpmyxHhFx4RFXWVkm1g3DWkOr+Oh/xuW8yOv72gOVK3HLQwPmKlyAsA
 9un2WRxVHLWn2DGMC+cfNHXQp9896vEUereV7fJuxolV21qUQw5J50bJOpONFEZ0edjc
 Kzc7Nm2F9BEup/XBveWACpSdLRgdNEubkWRUo3jzzp+VR/SJgA7wr7nXfGZ6GgI2sVI8
 j8fEmwQlVjUgJQOtfA6QIAmon2apInL6xpbXJp1pvRZIhbKToWF2ewMfZmW+nck0uu3f
 qQq2iT+gyitdDWQOxmrQ9cdGRMaieGY3Lae7KeaF9JFa7IYgKZ5MfL2wnm/rQDll6eY9
 pAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779953481; x=1780558281;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QqSpy9gXjopYGP/FUc8iV+kdLobOzc5QVYJuEhyfONg=;
 b=ccI3yMtlmf4BEPhplm41y29G+99iucVidMHA9Zy22ASIWJ1q/POAE2iqOdmu0RmrBc
 A7W930q3yQYxpjzCzVYuCrwtmSspy0bVZPrJOY05Z97of7+M8pogz2Ua0R0wcJxnNzwK
 VJWIxbUZNiNmau7Zkq6tvfFRIsADHK+SKBNJI4hzP10TUJKl5UQL2AFQZd0LWtC/r3lM
 VbSjWpunDYu1PhihxyLn2WDbjEv8H56OV134pxyo9atqbGGbyGMhhC8uauEyrAMRko1A
 rhDMHpkYBqQpuMWqxHuWqAEvXb+L8XDAXORmxkO86lg5JYL5srqw7m69/tRQCKIZG2no
 gYVw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/sl/HForF8B22oknuBOVEOqXdonbkUjQ0te9hluvzXyoq2GsmNpo8Bv5yiVxPE2EpEsTh9GLoyIA==@nongnu.org
X-Gm-Message-State: AOJu0YziIMHU6APWdEIE0qwfv2r19EEZl1VEKrKd2U6c7cnvPG9w1fyw
 +EGOZb4KcyEdHXHabFp4jJ1CmNFGVwl7bbj/KuGJ6hx2IFNjS9RJ1/G5LHzwYhIAulc=
X-Gm-Gg: Acq92OFzT5cT1nqCeJkJEIKf7f1Sj/F1ezKJIDZaAFGtMBXrkljOX4/rPlWf7B0BTiz
 qsiiCEJ742Cb2kXeuxZlBjH3Fdw/OmJ2K4DENrM6C46q1pXp8zt/J78gFRSMH27P/7MrmIfCDCJ
 +SmpP4FSsk+o731/Y3wL6gzUdCr31Y3F09tB0Q7UN0YFkaL1JK2GfxOsHnfOkjHQb0xAYkUhK3n
 fyjV9MByMB+8IE/A5ZGfkhbGoXcKulqL1iCTOi2uCDEoaoibkztwrIUsAdkbYakuBRi7KnMh5rE
 iQ9kkIMGUt6YsgI6VnuGoHBCGs6ZFIPZPzO255xKcSj7PKg7EY4U10JCu2Zu/XeY0Cjaqcq4nr0
 0dL545VSu/ym6PuXwBZOhThosuwW1HCHDQcMAKdLaDxgjBwBRZrRwkSwjEiuESglaQy45g48Jru
 Smi1g7Lw7c7TgYEHhNWPLJ5s9IA21YHzApZ4TaOIxkRVQCObERl+ifFm60eAixjPgWwI5Cg5Skr
 n5p
X-Received: by 2002:a5d:64c8:0:b0:452:8286:86bf with SMTP id
 ffacd0b85a97d-45eb3673381mr45717444f8f.1.1779953481137; 
 Thu, 28 May 2026 00:31:21 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5a2a07sm10841875f8f.19.2026.05.28.00.31.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 00:31:20 -0700 (PDT)
Message-ID: <051ce9d7-5b41-4d81-a454-352ba2b91dfb@linaro.org>
Date: Thu, 28 May 2026 09:31:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/10] migration: use stub_ss for vfio-stub.c
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
 <20260528051642.115721-8-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260528051642.115721-8-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>   migration/meson.build | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

