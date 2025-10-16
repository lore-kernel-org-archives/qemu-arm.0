Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35E6CCD199
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 17:10:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9RUa-0000lu-Ly; Thu, 16 Oct 2025 13:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RUZ-0000lE-34
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:10:19 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RUV-0003XD-RB
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:10:18 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-b62ed9c3e79so655369a12.0
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 10:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760634611; x=1761239411; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W+y9590Rju55IBWNEEnri44H8IFlGQsvQbodRDeKMnE=;
 b=b05ygwiUzLm7S3GtlRL27lIH6WT13WjJQgp6T2xpFnt+zlm/+KzmkqdrZxpWIFJjEO
 Cq74KrQoKbCNaNs4UKaGLQhyroS7I6AjOAoJxt6J/6xsDCjYihfc/FsI/LqCq0cD6f/E
 gIXMs25vzP4bdglDxrZtgG/k5Rtj/kqlxyIaxKa9aYARPusTg+hZqzLG4Z0Jop+YAImm
 ZExp+El6onUh6iBiqJ9PV+PdvMyjZK6sEtbv+lNH9DRlEgxLInIuflWkTwYwO5hMRBxX
 yIEgnREe1UrEWDeEEP3/uSYYcX+Mz7DTV+74DtW3cSA5LG0ndBlCTMbUUHZr6+dwBsTf
 CnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760634611; x=1761239411;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W+y9590Rju55IBWNEEnri44H8IFlGQsvQbodRDeKMnE=;
 b=dYXoiv5c/bPO4zhugHLARapCseqM2iKs0u3C9OTTnP6LXzNKrYcB+vfszrprtPLJYb
 qJPJXwI2dRBRAZ8c3wrrDXznWqPwpu730uGNoCthgdX1OgbJ0J9v74Z/kitBm97MCWUr
 3oVpztFOJuDFula8LzlCWlvnIWMp2f+c/o4J4CFaXCleZDF5ah7MNubjNSevBT8wWXjM
 6IDr3snOjaBjpj61RB3QGR1+4N4Sk6cqY75C+9rl3eyrXP9X38tHSrvX3lmA75G2p01p
 tphmOXldtleA1ySGUTzvlD6xzlXaSB3bWVWv9v0lANkhAnZTL7AktYzSkhNqVh3hS4NE
 mC1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+JbIh8ocU+jn9EzzdPOPExFpTgJdXkZvUK4sH00goPFpulqVOu8oGxhA3JDfUyasd5l5wj9K1fw==@nongnu.org
X-Gm-Message-State: AOJu0Yx3mtseX8DHnq9OSIIpmqx/ZV1cSLzp4iKpLkHS8M+wxvq9smN7
 coQtAgfQ2QcIXu2CKL+MNzmqAJpRw8cX1Roqw820s0RIWl/5KsLrn0aGyt/uShM0GXU=
X-Gm-Gg: ASbGnctqCm+OLmfWcJJbq5KnWSscngbSCo3gXSDObRnWN3e5gvIRzlDt6MWK9m6llZI
 c7U3UqmwTTqi9rwYaFwu/M0qwE0wiFFe8dLJ4hITuQtPCGEzIxFbjy6nzrwaDZwh3Go07LOxxE0
 N5Si4RU72slA++/WfEj/v51+ZxPa8eOU0E0cqYGwDP/c7MGZ4/haTBNWtGtQZNuTD/LQ0Hcx7Ra
 1rx9/i0RmDTHM251L+1vY+Ughb1YpEIs3DvH0h6PU2s/pkml5o9AxGE8oyCGiJwkuiuDjjoqE3v
 zRZUlmlJXNqmEuBeGVLtECPHbY1X3jbAKzaPnzfkrAYpDp0AZ5nmmGXpmxh4k1jDYZziffjHnxJ
 1lL+k4OmBmQSB2Z3R2Srt1trzQu1o68qksxpJ0g5s7y18r9X4gYp5TG2PbePXgqxueNdQ0wCfoS
 3nA8wi/bgMIPEH7k6Xty1M7Jg=
X-Google-Smtp-Source: AGHT+IG7g9yccGCOr/5huwpVE+juN7DtgCivkbOxdSHJ6ZzNVUlh2v23F9GTlu369LKOQmKWdP6tJA==
X-Received: by 2002:a17:902:e944:b0:290:b14c:4f36 with SMTP id
 d9443c01a7336-290cba4edaemr7926005ad.31.1760634611255; 
 Thu, 16 Oct 2025 10:10:11 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-290c5c7d305sm10174435ad.70.2025.10.16.10.10.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 10:10:10 -0700 (PDT)
Message-ID: <72f680c3-e2f4-4023-a6c2-b508e5af1c0c@linaro.org>
Date: Thu, 16 Oct 2025 10:10:09 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/24] tests: data: update AArch64 ACPI tables
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
 <20251016165520.62532-6-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251016165520.62532-6-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pg1-x529.google.com
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
> After the previous commit introducing GICv3 + GICv2m configurations,
> update the AArch64 ACPI table for the its=off case.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   tests/data/acpi/aarch64/virt/APIC.its_off   | Bin 164 -> 188 bytes
>   tests/qtest/bios-tables-test-allowed-diff.h |   1 -
>   2 files changed, 1 deletion(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


