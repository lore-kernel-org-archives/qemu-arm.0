Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9C5CD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 07:30:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSVBz-0006PK-7G; Thu, 28 May 2026 03:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVBx-0006LU-Jo
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:30:09 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVBv-000435-QA
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:30:09 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-44e1ebb3122so7592109f8f.2
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 00:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779953406; x=1780558206; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B4doBTP7RL+vSsK/fXJjlfnnv+aKVFRlngwM2gF5Pfs=;
 b=GoG471fcgptTf49U0uHBhhFdz7eNcTT+ckT/qCQGfAw165j3DN1Y1DMMHDWcHiKtLn
 BoPdkS1jAWLWsSe/jJ7/XSRicD2OdVHFUbtdQc28IKP7X+hUTQrq+kbb0RAaqo3JuGMx
 bFi/pLSQzbcYVRb4tktlb9ebO7we4UWCEsUpbPlboaxXIFsrMfDBEWKfUDr52l2r90e7
 q5zUwpvL8dKmphyCOw0NilGvNY/xrkN1mh9FrcmOaQ4yp9uKYJlUvzWlN9dKafSvHmMO
 jIY0jzsJKm+M2PBpAwebZDOqobpjyem5Ddk/5KO20bwId1mDljyYFreryyie3CkE1f0s
 usew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779953406; x=1780558206;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B4doBTP7RL+vSsK/fXJjlfnnv+aKVFRlngwM2gF5Pfs=;
 b=iE6PLN5uISwpiUfJMsjLArbpMWhbwtwBpBz7Y8rymc8TmxS9PfeGycD1/Scgom1Mk2
 4yekvTEGrZ0q4F5Sw7Jj9TiOwlhwzfPzLtkmgQ2xfIA0h7N2ahiGl5BK+mqVQKzrRFjn
 NKUuN/wQqXjbc1MH23Wp5lCCE83wffdTewNXuJ4Axo0/fiXSNTdbnnNV0yM0fFKkFNGb
 Qt7D9nWnEHry0VDjPCRCgyfgYuUnn5T4sXvEOP0Rq7aBif3yArckO7EoFR55xFs1Su2q
 8qI/J94Dngewmf17/OiccHotqNgmiWaHPICC0g8+F5BznozNGm61fjBX5Ad54Q3tfxXY
 3kRA==
X-Forwarded-Encrypted: i=1;
 AFNElJ/SkuZIr3/GH0f8Ndaf5T0HQqVTFtpbjbL9Qw95OMBD2mTBHWjuL6MyW59cJJuOMLANgyIzTEQ3CA==@nongnu.org
X-Gm-Message-State: AOJu0YxTXsIknXDQtfXjqbzo61k6uoUyaF8+WXFHW9P+wjxYrF4crlDl
 gkdjmpdQCbz7gTlcZWpyn4y0ryaTaBrrbI3zrbHAwNZgEhwL48u+jRB83HFyU5BZR38=
X-Gm-Gg: Acq92OE+uXFFGi5b+shV3LUBLVTshHyfh1RZEHIMlWwMVGQuCp2EdeNitqBWw1pvsVq
 OT0lzSIRmdwZS7mRxaE/ZkPbmzbWEP2JYO0n9GO7XYlvr6P8rz6Ot8lxBoVhZhZZUuTgtHbs3i+
 tdoyZnkEonG/7WiEo+dlUp2o80Ya58JrlMfa4Cs/5Wi1dXFNWgIENuKtGorxM8IPI+LR2grYg+Z
 rrTrrPKZAiDYBGutEXR3tK760cJhHnM/rNaJPY/g8T56dVtTAi1ZUxTsZTuyJbriFWxM17XA65b
 7s2ETcQua3+EbS7MDUk6JLx2DOgfpts0ZDhXEjaL7H4tP44RWgIBYTgK7hpnoomc0A/VtB1MFX8
 mIWm1wMSqeMyH+RDAWnIOR4W16HuIdc4lW35Fq1aMuC1llddoiCRiSK/ZqXHpW9nzUAtCT3HqCk
 klJH7d53fml3X88osxZYL+kmyHB/SuoXgBNEVuuD0bV4ZAa8hYK8bu4I1S2AUC0WMDoD4OEtqTK
 bjCsiGlss+yrB8=
X-Received: by 2002:a05:6000:4b04:b0:45e:9420:ed16 with SMTP id
 ffacd0b85a97d-45eb38b0045mr44515750f8f.10.1779953405728; 
 Thu, 28 May 2026 00:30:05 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb557679sm20257650f8f.10.2026.05.28.00.30.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 00:30:02 -0700 (PDT)
Message-ID: <fb51931d-be40-4206-a2f4-74250fb35ff8@linaro.org>
Date: Thu, 28 May 2026 09:30:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] hw/vfio: use stub_ss for iommufd-stubs.c
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
 <20260528051642.115721-11-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260528051642.115721-11-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
> Solves conflict for vmstate_cpr_vfio_devices.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>   hw/vfio/meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

