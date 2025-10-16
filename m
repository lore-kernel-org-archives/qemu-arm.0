Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8187CCD183
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 17:09:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9RTV-0008Ta-K6; Thu, 16 Oct 2025 13:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RTM-0008M2-FP
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:09:05 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RT4-0003FK-Vp
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:08:59 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-33bafd5d2adso850918a91.3
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 10:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760634522; x=1761239322; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uEb7VEbvyYjCc8j5dVK2DcmXJGpMPlFdSk8E1hsGY2s=;
 b=Y50qy9Ig0G7+AAVf4Ycjut4Iww/2RF/YTt89T7nG7KF7fBAkxDBP4fZMijJCxuAU47
 oMCrOKLSxCs8S3OtDcn+dDO2N1zpPxXk4vUwvaUiee8zXdiYLYuVXvPv7kYCidRKh2g/
 MB7DAoNixyBiXSkjIhZjIHdHU/O14EkdyAoYoKwZNhgsMzE72YTqVZhajYxd5aHvwtJo
 cCNYQU0XmrXfU/xioLjHob/ABL65FYkHQgpq+hXBs3A5/VXt+ZIhgYcgNnBbE2APGjij
 TOa/1+MgNLJNi1YxLJdgmHYc04gNY52ThLyS5kHu1KrUpOLQX0zOQNJTqeoSoWFjtWNm
 rVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760634522; x=1761239322;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uEb7VEbvyYjCc8j5dVK2DcmXJGpMPlFdSk8E1hsGY2s=;
 b=Ee631WuPC6xHOy+9EEN4DQVv0XpZiuVP/FFnFQwEfNWQR4T+lhCKlEAi5xd/7lNDVQ
 ypXieYkA875vEZVBe/qVJzhecg9CJ0tL/R/qRtJ6QS7IfXpxcsp2SNkPcrwGvwbdNCnJ
 h+hzyDVIixX2LpfrFOlwoAGpVnyzn2TBLEhdNeRroG6GYxsnr4zESv1rfmcm2D5YWd2P
 v7/b04JXJkCbbPYqLWxnuFK2Ez8P5hOndLqqOS6+BhJKy/y/NnFQDpI2d1SVTUySDszx
 agIsuuThIxn2rr93vr9Vze5Dq0haEtwTQmtATOaq8xxibMogM7/DOUkl9CeYGqENTOqC
 C66A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKawaKMuNF/P+/cIWLJpF5MT9scZlYr7/PGMINs3VqWbrF8rfCG7kAx3cXhK4lUS9zvLfU3/qaoQ==@nongnu.org
X-Gm-Message-State: AOJu0YwBvPe7PVNJ2APh+BzsxcHxzqe2xEvA+JRfxc/Byg49bXY0qOFP
 BhGJr9UG8YpDf0+87tMN/sBMXBc9LGzVsNmtq1ufbuT0c6b59FDwCMB7DgSvZc3NUy4=
X-Gm-Gg: ASbGncsEzXvEROWD2n8TcIA+iqV+YRnG9T1lZntVom+V6Ap/iRxvLoOX42VdlxDECcy
 vxq/owbTJ47lohXpPHQghqz7Lu9DVrDeIJqP5BWVPYjfJeu8ArDG2V2TEMcJlJFC+cyVH2yUtS9
 YaXK10fROUN1gi6JHf8zCZQqqz/67w4pAtUu2rPqhEgJpngiq417i3KfbAlYyLNAovu5me5DAHj
 Gle2bEDpCdZU9JHwTsKlHXkCikjV2a1cLqX+AscOqv/aY6Z/vrbmwSNLsG2gnEEAeWj5ChcWvbZ
 dK8jMWPXmi3XMtbq04UloTM0m2X5eKHckjLW38jgDrKabM4di3BRxM/vJH0SaDVrLHLWbXEUe74
 A83CfloDR2XQC8zjy0grc4itWuI44Yiv7HAKOuSxSOKVH4LH4NkoMQAF7NdCi5Ojk5ni7jWbD8v
 vR8tjWD55jfI0F
X-Google-Smtp-Source: AGHT+IGvlt/Fftn9IU6QjMkh9CuyfliAiXLfcmx5y43Vo4TArp0VvHRZtq2j14CuUV2d8EZCmHthIQ==
X-Received: by 2002:a17:90a:e70f:b0:32f:98da:c397 with SMTP id
 98e67ed59e1d1-33bcf8f735emr569066a91.24.1760634522240; 
 Thu, 16 Oct 2025 10:08:42 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33bb6522fc6sm2541227a91.2.2025.10.16.10.08.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 10:08:41 -0700 (PDT)
Message-ID: <eeca5101-ac66-496c-beec-e6b17853be44@linaro.org>
Date: Thu, 16 Oct 2025 10:08:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/24] qtest: hw/arm: virt: skip ACPI test for ITS off
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
 <20251016165520.62532-4-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251016165520.62532-4-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On 10/16/25 9:54 AM, Mohamed Mediouni wrote:
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


