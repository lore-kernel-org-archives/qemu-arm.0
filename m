Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92146CCD199
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 17:15:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9RYl-0004ds-3c; Thu, 16 Oct 2025 13:14:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RYf-0004bf-2o
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:14:36 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RYZ-0004Fa-6X
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:14:32 -0400
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-27eceb38eb1so11821995ad.3
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 10:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760634863; x=1761239663; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xbf8AuRX9mwiNpLkN8rUpE4f3cRZY7K2AwrEPz3vr+0=;
 b=Tk7MghiQVEGI4P16BQi6NRkHuKFyUTkmp3zW21eH5JHhhRK04yufRj0/ZSESE+2qZL
 +8pYw4n+WrAoo8x14w3DD2jmZm2NxPs5rkhba8x+2a4hSD1t2zMFeure56EQ0hlzMA7y
 tiPZmoLj70vzHbXigT564Y28ThhC5kJc5kBKjEdRj+2AawAyOilY9kBE8ziceoWAHapr
 UPNO6CLnWyYI6twmZJZFUN6fFRbxgdgaiNit1H8qbg/oE+1LHiTSpB6YQq8ryehmxX+Z
 bFbtdvJL6XUfFLoGULbdo03fuAgWbkdkmSDwurLSjaEBQbNAsR1ppBsgMtVJ49nQqoSY
 1MtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760634863; x=1761239663;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xbf8AuRX9mwiNpLkN8rUpE4f3cRZY7K2AwrEPz3vr+0=;
 b=ULBKe5wfL2AxBGTJGFLvTGhEGZpCMfvgPgW49DX4cmZG3DsW0+8Z4LJGSaRTG7epMh
 lmvwS8lykvY2EtbsHxpmKung8eMZnVg1uu36pI9enHCDF47nWLAmTDGuDIWqYaiWOaAs
 UrA6XDsPCilPk4vB+pweiyxg0DjHY/INGgGfaq/FZGxWyts8aGVIaAthfer2GBfRXf1S
 dALSGam7OGy7If9GfHtiiBUbxIQX7oDpSRG6YqJG5qn/4TOHPWYeXOtI3ipxQw3tY5G1
 jUL823rdzlI77ItPqjGxyTkn2Cmv28E7b0atW8hp06glDB/qtTGjbfX9pezBez2X+toI
 IDZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU42PzI+JXicOzmlPZcwe4uinhHx76wNOG0ybOzP9ti3w8qiH55peJ5+JqdyfY6HTEnzdnV2NyKDQ==@nongnu.org
X-Gm-Message-State: AOJu0YwNSfY4VzM1o6B87JN2Frth62nWZ7R2g0l95m83bg/CCpN+59k9
 EBGJ2H4jiGnnqf5yi9xsDY5WVCIEgpx5l33rFTKBGSrXm0c2Lf6P5W/eaMLZcAvKxYw=
X-Gm-Gg: ASbGncuH5eAhFVgtF+mfax1sAY2ssnYniFN9OFPTTyx34fK3FheMJctPUsRp5CfZ1c0
 yv9mLKnQP7chDBDuhv/ePXIRG7lMXOE+W8MFf46SvbVDJqJekqD8BzDubnxTcpr6UyfTF219qFn
 yAUQaEHUuYvc2bwU37u8Xu44MsRvdoSRhSRsanc008NXmW8WUvhD5Y+xGjwTKGcGPWCU1qXP9a7
 1NEljhd9bOLqptycQCh7bC3rNYmHgrDj8AZWPCuoz7WFgmt0HmbxtMUvLbfS6gKlCGrV17SkO7q
 htQ3Zx3GrIA5ka2zl4VxX3+lMHkVDI3MYk5I8tCQ89v+ZW1kym+7YireyvDSHF3Te81flWSNYSq
 oNuSCDBh6MEtz+LIxbN6Fj/2e0fM9on3SeN80E7/mT2N+678UVLmMNTyYM0Ird+h/fu/sBCeDYE
 jvuqWDNPtW/ibK7d+uoiqlSr4=
X-Google-Smtp-Source: AGHT+IF182F4lmL6LvxLkrYofl7mXVzTygfR3b9k9De4jgcnqkzNqlvOwYury9mzQ7IWDkZNzFWKJQ==
X-Received: by 2002:a17:902:db11:b0:240:48f4:40f7 with SMTP id
 d9443c01a7336-290cba4efc9mr8442235ad.39.1760634862800; 
 Thu, 16 Oct 2025 10:14:22 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29099aba062sm35990345ad.98.2025.10.16.10.14.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 10:14:22 -0700 (PDT)
Message-ID: <e760f90e-497a-4e8c-9e2c-87195f2b98de@linaro.org>
Date: Thu, 16 Oct 2025 10:14:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 21/24] whpx: arm64: gicv3: add migration blocker
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Eduardo Habkost <eduardo@habkost.net>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 Roman Bolshakov <rbolshakov@ddn.com>
References: <20251016165520.62532-1-mohamed@unpredictable.fr>
 <20251016165520.62532-22-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251016165520.62532-22-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62b.google.com
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

On 10/16/25 9:55 AM, Mohamed Mediouni wrote:
> GICv3 state save-restore is currently not implemented yet.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   hw/intc/arm_gicv3_whpx.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


