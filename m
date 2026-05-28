Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91375CD5BD1
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 07:30:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSVCF-0006jy-02; Thu, 28 May 2026 03:30:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVCD-0006iC-DQ
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:30:25 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVCB-0004Jf-Km
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:30:25 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-45ea19f412aso4176752f8f.3
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 00:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779953422; x=1780558222; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MIYOm45HKLIkfZLveq09PjDarV95RI0539rL5PJdKUk=;
 b=cl/eX3o64q2V40a2kPAhQjJCYvDO9KRq+gBVHNzTcGWDpkzxio1Kddn2JD0zlJu6eA
 FeTvSeR78hvV6qH9WQVXIVta+uM4pcgZCP77x0oLQTSYHQW8N5r9zLHnkKQjZ59EspPI
 vU71b+hw97BmQhEXKSaUn2SGqN76wtGZGss9syiZkMuIrw0R8dC04aMoqhCKZKClbOtu
 nk16ZZbGD/iWqDJaL7qO3Nr3zkEv7phgpTXyfU5EAHoGjdtmgudEHyY0ZUNAzTtUpoyO
 GIFjcEzTnC3GBqbChJTcdpg2mEbZtlC0a5u3ezaZL37q2acgXg0tIUnLAC/B42G9JSru
 IVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779953422; x=1780558222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MIYOm45HKLIkfZLveq09PjDarV95RI0539rL5PJdKUk=;
 b=le7NMRpkBY/vIToc5suJfaTosNh4BES7SyzJew3SA6gc/+7yFrL4ay6oh0w8VpjM2b
 mCwxbav12bGcxd4kuzEp7ZcSJW1cPN1g8cNOE43oR1XvLKjSZm+qWNvirMWi7W/XVGVi
 Cfe1onz8+ay+9yq+r448da1fhH/adTmXirppDAqGNZVJTANO3CI0LHrEStD8tmJLGIuZ
 XhHs+dmkMnjTOHLJCjw4ThVSwcncQV/ZABgNC5uIvFjU+IxoAenzLJZXdj5nLxrieXzq
 PXGiWeSIr/WYgOg7Ezoe5LT/0mCqxdcC79LdZAYQYL2w27LQCezRq3/Nj1Vv26VXz6AW
 g7Wg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8mHl40V1bktZ9F4hmQkNWknxIUs699P7mE5LI85ZBS8EgC6cwWLsd8mItQNUgctAr6AlKyHoNH/A==@nongnu.org
X-Gm-Message-State: AOJu0YxRyquYX6p3tMqvBXIy71PcdOmy1bOLymhGbdq6df7H8epqoFz1
 hGfIdUrX26NNACOpxnNkB92H3ZIh8WnCAdx1bJtw8l6+ak5frZ/XvZ9CZAGqQ7fCo+4=
X-Gm-Gg: Acq92OGHPYBnZaPhncdB09YV4QklrqKAeAu3Eu04AglYToDgfuoilFIi+1w8sMyLOwt
 62yWX16AtLGB0I/VhvI34OHbEDuCg4DxkqFiyTasE45Iaj/Pm3y1c2ttAztawdI/PmyCJPj+3CK
 KfeYIrmPW48GA+4XBHFO4ionFFBi7RaWnI8TcHAFOYhgIWh24jhHSjMGl6riBtBFv3L+5cB1Fpv
 5DqYn+1GQ6wyKezbRoe1AMXPeFD+0JggAmpVlgq0tul/YGZdmrHw6x72fSqYoZdk3Y2Xhrh1+34
 6HhI947cJn9gsx8pEPyIwlAcfGihlJJOjZilpouziTDMokmQ22xS1MDR4GZnup/uv5QLtz4MERc
 f0Qpf9qzdx65a+vRSUnkitfpUGRuptWHY/7fNAaeqEp7GzEji65wxutK8fpaxSjacdh+tRzC8ge
 TMOabaPIgtg6/vNYbf5n/dQv9R1kT4dLrBodYmrWwEqGNh+glC8sSGnBhC+jHhLTU7JNI33Y4Qf
 Qcw
X-Received: by 2002:a05:600c:a402:b0:48f:d1c0:721e with SMTP id
 5b1f17b1804b1-490426b294amr300869545e9.12.1779953422014; 
 Thu, 28 May 2026 00:30:22 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49092a925acsm38797545e9.14.2026.05.28.00.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 00:30:19 -0700 (PDT)
Message-ID: <9be6fb5f-c75f-45ad-b8db-658037946e19@linaro.org>
Date: Thu, 28 May 2026 09:30:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/10] net: use stub_ss for vhost-user-stub.c and
 vhost-vdpa-stub.c
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
 <20260528051642.115721-9-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260528051642.115721-9-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>   net/meson.build | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

