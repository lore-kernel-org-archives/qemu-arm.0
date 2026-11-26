Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24D3606A31C
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 06:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OtafoG8/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWSqA-0003dj-DG; Thu, 26 Nov 2026 01:20:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xWSq3-0003ct-Iy
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 01:20:13 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xWSq1-00066S-IZ
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 01:20:10 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a2000d5fb1so38040695e9.1
 for <qemu-arm@nongnu.org>; Wed, 25 Nov 2026 22:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795674008; x=1796278808; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=20hk+nfMYZ26edHCTo6znUbrjDsyrRSunBG5oc5JPOk=;
 b=OtafoG8/63aGGSC2HSGf6teg101KxlSWYm0BRj2bhQjlx6ZzAYdvXmnDdti+Y7+sT6
 1jVHFbAooHvC34A0lKQOXMR0CnXIwvXmjCJNx6FXYdOfM69DcLvEOJVJMOZGobx9HhuI
 19UeAOTHQbi0aZbtZNg5WYquZiIdsVwqdNfS1/fPWr6c8s2NgsKKpHIFZP7BG8SQyjcn
 e+xJtZbw7oD47h+kOUHX671zs8JFnUfGsl7YM1lFRxn8+gR1zCTI0Vox/VWzk0sMk1jE
 PubbOdkmLvbw+clD0E9EWt0G5G8spGRD8mI+Y7L1Bq9VPNz6o/lCKBcdSmwIGwZLeBAB
 /A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795674008; x=1796278808;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=20hk+nfMYZ26edHCTo6znUbrjDsyrRSunBG5oc5JPOk=;
 b=JRP/ToMZKtvdbtC1J6PGfq1oJmNhfuVX5IcSZ5baHbhfaLJ2/5XItKL8gAI4hTioKX
 g7Mwpu3tjNgtyuF5hjKr3aiJnEa8lQR8fxLxay68E4BMy882SbMxpmRyxgV5sgYp4B/W
 OWuBYsj9WEmOCrgNQXPb0Fyvuxs8EFwoeCh3PtKg4UhM39dUUbsEztQaVZKK8gI2iaBD
 r89ur/6ytFDIl09Pcn8Mn10FoLrc5PuQLcJxOZME8oeAoSerywaRtaSrPOMa4ObyQa23
 qsyvcnJqmCRL7erCeYptPCogqv4/4YV3aVOH8oGJEPiZu8aGFU6FAwkm46Y0OR7ULhx3
 wnVg==
X-Forwarded-Encrypted: i=1;
 AL+hErGlCQ5nVecwIF42PrXgpvcGz64Jlip6nySEXSG011RRgxvO9LQ//AjjIXdK5oSXiOA797qV3E6V/Q==@nongnu.org
X-Gm-Message-State: APuU4Z+y0CdPjY8F2uRLwK4EGUQauQghzFNta56T36p67m1t2ymiRBox
 l95fFgHlDDlDJcJLw0oibx3iAED3sATGexCsdUhTEjfxcBX/0N2b17aS
X-Gm-Gg: AZFdTZd5zK4Ve8KcRvSPSQyqbHy/NZyj3rWQYG18wQaboHBzHA5/smMthcRV7+64ui4
 pQMvxIf9p49WPdi6GHUz9WRCxBlUkY5QtCfsnxq/SwgOqS2LWbGk+sbI0TYV48R8SGHeIJK4Wtm
 fuVLCIY4Ta5IQpXyw/KljSWtObADb5RLpComJ9YYZUa19xMFHj8YcbtzYhCWvGGkWUB7rcxY1Fh
 +iPYOyezj5V7fYnccITeXnYmCg1bIhxvOF8Sj/6Prq4ORWczvEVxZnT9W8mqUjpkvbkv4ffnzGr
 JsQ6Zu+z8hJlFkGJ/3uotK0UBKER+PpAaaTo4T22eHUZ+8YxoI8j5ckLHtOlE3Lf1R3JR8+ilo1
 IFgvjEy0wgCsetBUqfHn9vY6N394pJ2emmRmSxwOxVYAT36faxyW83PmkKr/FMNo4VJ8Zbb4A3R
 dyoWRFNgaZZC9oDxHsPy+6xSU2d/QjMbEmF6RdFztEq5XcR0MubCBAExS3wCCAP/De/QP8awg4m
 eCewVvqsHmlVU6YJ8SNCMFlyVmiKxNRFd1GVN/5x7UYh2I9f/ddIrgKkCDy3EgkKmCAxDe0TmLk
 iZ08O6clQz8fjROYMkuxgDXFxKn8XlJp5mEtmzd4OffLAko4xNsHDy4y3CiYYBsvJQI3sx4D5TC
 BOmnz7g8YkMpfFdugMzL0p3vq
X-Received: by 2002:a05:600c:468c:b0:4bb:6d61:af7c with SMTP id
 5b1f17b1804b1-4bb88944bf5mr391819155e9.35.1795674007829; 
 Wed, 25 Nov 2026 22:20:07 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.25.192])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884865b1sm580133385e9.5.2026.11.25.22.20.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 22:20:07 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: Khushit Shah <khushit.shah@nutanix.com>
Cc: Haseeb Ashraf <haseebashraf091@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, kvm@vger.kernel.org,
 Haseeb Ashraf <haseeb.ashraf@siemens.com>,
 Eric Auger <eric.auger@redhat.com>, Marc Zyngier <maz@kernel.org>,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH v3 0/3] arm/kvm: select an nVHE-only EL2 with
 SYSREG_ID_AA64MMFR1_EL1_VH
Date: Thu, 26 Nov 2026 11:20:02 +0500
Message-ID: <20261126062002.136401-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <8A57A0C8-9E85-4BAC-803A-DAFC6DBD6612@nutanix.com>
References: <8A57A0C8-9E85-4BAC-803A-DAFC6DBD6612@nutanix.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Hi Khushit,

On 26/11/26 11:38, Khushit Shah wrote:

> There are many such fields like PAuth (APA, GPA, …) and SVE. They are
> not part of the SYSREG_ framework as there already exists boolean
> properties for them.
> (Another way to do this is having -cpu …,vhe=on/off property)

The v1 series was closer to what you are suggesting: it added a
standalone `vhe=on/off` property and used it to select the
requested KVM vCPU initialization mode.

Could you please also review the v1 implementation?

https://lore.kernel.org/qemu-devel/20261121095636.289814-1-haseebashraf091@gmail.com/

I changed direction for v2 following Marc's feedback against adding a
separate property.

Thanks,
Haseeb

