Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA8C606A31C
	for <qemu-arm@archiver.kernel.org>; Sat, 28 Nov 2026 06:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wMal4bYy
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xXBuC-0004W3-2A; Sat, 28 Nov 2026 01:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xXBuA-0004TV-Hx
 for qemu-arm@nongnu.org; Sat, 28 Nov 2026 01:27:27 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xXBu9-0001tY-2q
 for qemu-arm@nongnu.org; Sat, 28 Nov 2026 01:27:26 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4bba5e17cbeso32703125e9.1
 for <qemu-arm@nongnu.org>; Fri, 27 Nov 2026 22:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795847243; x=1796452043; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=wcZBeuMIMZGh5V5Nkisgmrflj3EBBSr6rcajrufM/Cw=;
 b=wMal4bYyhw9L2rLHaTHSiHHr0Pq4jmtpj4dSgaaYAhBbUdl9TX3bJnr2oWAsyNKyMk
 cUN7K/Zt+6PfOMtgbJs39d0/E4T/XuogKSUg1veQ+9fAGTc7apm9B90RnXLJtv0wqd2j
 Babx+dnn+5SfVFXBKkeZ+5QCiCUKtvm4YgkxhMwnEPiWCf9Uk8wOxq0djFftE9iQh5J3
 Jx8ealg7bksFb48T5zDPwCwOPlWZYdra9seNEmNUg++zZvBJgxhv/GsqMIGan3R6qU9d
 4dJoiS+zXueXSAnXNYYkKdkZ+E78O5X96BegHN62JVQV12jKQGOAJQ957PbBK/cWwPk0
 pZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795847243; x=1796452043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=wcZBeuMIMZGh5V5Nkisgmrflj3EBBSr6rcajrufM/Cw=;
 b=mI01BUo/HDI/0zD01NxlZ4KNqCoXnhbaFDXzxzNd2vTOGoFSY5TWdJNYTBHoBn/0Hw
 voAUy11JigpAy1w19JzrGFEPK6a9rES53EK5zQrnktelRrnBszpTUi34nciaIqL2c/Xe
 qsuIt6jnZm2e4gedrw9YapVrY4noP4f0sSrfsyscmEY6qaNSTBI+4gnEx3b1JNeKqAhr
 DBoUI7vSdQWNtJifAjMA6okt2rGXlnbbgRhQpyWNvptC8F5ob4VSjwQoTK5x/3P8KjfN
 NlvAFMRsvbGDknDOrcXi2wIJikHNIR1JvmCTAYjzMehe5tIPRIGfMVCqC/oJQCCEbCKp
 nhvw==
X-Forwarded-Encrypted: i=1;
 AL+hErG/GfizzgwDeoAJMVQgCFJHAYqghXRqpdyEBm/gS1WTXHclMdSLouCCId5v67m9DARKRhV1H3Rhww==@nongnu.org
X-Gm-Message-State: APuU4Z/GBoacQl8VlWUTtRKIM3f1KwZbM0hBQGxDkfiQRZec0TRJ/LuV
 WqKOi27FyHZxjyl3lBnVp1EpwM6eBXC0S8yTjcuXqG7j0nW+aSdE7S24
X-Gm-Gg: AZFdTZc8SfbJOisDq0+YlozbRIO53NP/U6hf/o0EKJjFAXHPjwK8pdWKEI3FsL3oZlK
 MVwoplByrRGh+D9kyQ5ShNeoTT3FeXNaDwG1v6rJ2lz/0GYXhI0erMmsGTLxuXK+h5VKoIZyUoi
 FBhvo0g5P3O3EyGmxK8HcR8FfZUNh+pY9oGlGKnGBOKUxB1hzySm3G7+nODkzjBnU88OsmOZz8k
 aFop012pkhOaQyKEvol5K3vS9nKxc3HLrR7nb1DoA4r417PGClrwPgRORSX753PxQsT6CBUqI48
 GIpnbNLc6kbPMt8fvgiDK0GbH9M3G5WY2C/3botsnbhcxrK1e87sBxGL5swF9pLRjA8fcEdj69T
 /2gbt6Q7k1cYBtputqhUxcczZlRKN2KQfJne9BHKuC/QEHxNUj/L8vwb+C+1mHYdOaMlHMSDw+G
 BF4gHWE5EkM8ZTKmFCAwAzrhLR4NBQCCoio3g/gTAYxcB4BAq05SvJFwCVv4rO150pP9TRqqU/m
 HStyIWvuoVWZDr0N+aR06I8aKuos7/80K7QCSyV6l8C8AfKGay6SmkzzdEZgrD1YV8QvGS1AJr2
 fAr7QgJO+a1qsjNUMnKRq2EDMkDHLF5tVPdajlEMEJ9GmBcEgei1f0ySc3aWS/6D8OeC/DLuLlS
 QKCnrc4pXfpG9BmkXegfAnzaE
X-Received: by 2002:a05:600c:1d8c:b0:4a1:c5eb:b445 with SMTP id
 5b1f17b1804b1-4bb88820436mr553100495e9.35.1795847242750; 
 Fri, 27 Nov 2026 22:27:22 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.25.192])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884a15absm685756885e9.9.2026.11.27.22.27.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2026 22:27:22 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: Haseeb Ashraf <haseebashraf091@gmail.com>, Eric Auger <eauger@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Khushit Shah <khushit.shah@nutanix.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Haseeb Ashraf <haseeb.ashraf@siemens.com>, Marc Zyngier <maz@kernel.org>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH v3 0/3] arm/kvm: select an nVHE-only EL2 with
 SYSREG_ID_AA64MMFR1_EL1_VH
Date: Sat, 28 Nov 2026 11:27:15 +0500
Message-ID: <20261128062715.130056-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9746F4BB-6688-4B39-AC6E-DC0295599927@unpredictable.fr>
References: <9746F4BB-6688-4B39-AC6E-DC0295599927@unpredictable.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=haseebashraf091@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi all,

Thanks for the feedback.

For the ID-register cache, I can drop
kvm_arm_refresh_e2h0_idregs() from this series and let Eric's SYSREG
series refresh the affected ID registers generically after property
write-back. Please let me know if that is preferred.

Regarding the interface, there appear to be two possible directions:

1. Keep VH in the SYSREG framework with an explicit init-time
   exception, as in the current RFC; or

2. Introduce a higher-level CPU property:

     -cpu host,vhe=on|off|auto

   Here, on would require VHE, off would require nVHE/E2H=0, and auto
   would retain the accelerator's default behavior.

The first approach follows the SYSREG_<REG>_<FIELD> model, but VH
differs from ordinary writable ID-register fields because its selection
takes effect during vCPU initialization. The second approach keeps that
implementation detail out of the SYSREG interface and lets each
accelerator evaluate the requested mode before vCPU creation. That may
also make future HVF support less awkward, as Mohamed noted.

Since v1 used the separate-property approach and Marc objected to it,
while the current approach adds an init-time exception to Eric's
framework, I would appreciate guidance from the maintainers on which
direction they prefer.

For now, I will wait for that design decision before posting v4 and
will adjust the implementation accordingly.

Thanks,
Haseeb

