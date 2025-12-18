Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0EFED6E2AD
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Dec 2025 16:25:51 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vWGor-0004FL-FX; Thu, 18 Dec 2025 11:25:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWGod-0004Ak-JY
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 11:25:24 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vWGoX-0005Db-VL
 for qemu-arm@nongnu.org; Thu, 18 Dec 2025 11:25:22 -0500
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42fbc305552so656537f8f.0
 for <qemu-arm@nongnu.org>; Thu, 18 Dec 2025 08:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1766075114; x=1766679914; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Yj065qvmeGi0pgZMJluVqCbP5H9nWVIv095AQoQr/Ak=;
 b=QEb/Pn8FYc9DsWdQk30KwOGike3H0q9SegijjaoAG1ncW1b0x0ElBB580YD27sAIu1
 EgdZCqek/zAByb+hXiqANj4+31R9BytBFsgwOF3chSrcakm4SK0U9rH79SbcC9b/YPpz
 FmFTadmolK1AVnrvQ8rgozDKYh5TQ3HEEMs8ixn1pwGOMsDQSMUwFH0e08sxNn8W0Vne
 i6mWAsr6h/9syeExhL0uBIUpQQ8SZDkNLUV2rhhwODbDYny50oehHGCYVuRD+T/otDHF
 8bBkoY1MdwmDqXuKbUGpRKGMn6t+YkvnQoGZCt/pCCt8xCg4SsIMJ5DS6OM9WOeRepeA
 WLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766075114; x=1766679914;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yj065qvmeGi0pgZMJluVqCbP5H9nWVIv095AQoQr/Ak=;
 b=XjP7XEdhUWzLYCRnzrqMfWGOcC5qKY4tjTyA0ook+XJpDaIuaBAWUbJBrJtQPdJHkj
 NrqyEyT8h7DRBgXzZzaJz4P29KxWnvzlUUNpua+4cDKQhR5Ez5NjxbWgTt0+NAUXGD8T
 xQW5T6xyG/vjE72bC/CWDce1MTob58pSxXkeEgtFUYKKA1on+2a4pN+DjcZ8MRPdLozh
 MLWYdGZ0U7z0J1uHzaqUqnmd0KmqEa4GFWQWQ7hT9PN/J0wbd9WOgcniMKJuclsMivdc
 BnBuMSLsSzSVJRwK+cuYQ/mR//8spwxmmoNsJ93pL49RTM5QU7YrYkK9Ag39TaQD3OQ9
 1ucA==
X-Gm-Message-State: AOJu0YwCfwNs8NSiqLxyL/dnN3O0aBbtzpPLeezGzLXvbd1pzpJChfH4
 /fwsfjX9+Wbk7lPOs6m+OJsOGjaDcdLBeiUEK7quWOvIAlP2KC164pLRVUKsPC0Agm8=
X-Gm-Gg: AY/fxX6pWy+9YMCxOzCmbEjS3jKjBoggWFdDOuGDHGS5RccxlFt1bkfOAunMsUisYKK
 KISkRqAUEHQi3btaz++lFWjgbOpvm1+RevHcAIn0W8MopyF4njh4xVIrY49NjCQcfU/hG29OCBj
 7oKecocEextupi8ut5yajAItiByjHwUMpn7K++OEAwhEELu/+K+oT2CETz4vOBBXaZSZ/xQjj9y
 hGo5aOejIEUo+mYwb9XBXHOzxkDbRILZR54LIQNF3XEOHmpraH31giAHksFEk0A4o+RrN5+t0gI
 +tubRu351F0SYUgumu6SuM8OLQTUOQ2mSVyk7auhpkzOr4XnANE9c5E95MgHgDpGSSB4HGB8PZW
 i+ZFnozt6xxM9izv8+gZB8gS/jZZeBCdp65voze/0pc8Ol1kzfZhKCPj7x4t+k9buHJ+DmHUMvy
 eD7G7WC+yq1cUupZj7VJfBGDCaIQ3RNKMqTFMPfSorubhs6FhhoH5zhw==
X-Google-Smtp-Source: AGHT+IHhsvcvEOg3+7rQU5uGiqNiaGTNElJwFStNkDhScJ2IH3mBuBge0Ykz5MI7dYYd9C/CPElsfg==
X-Received: by 2002:a05:6000:22c8:b0:431:104:6db2 with SMTP id
 ffacd0b85a97d-4324e4c7440mr76096f8f.3.1766075114453; 
 Thu, 18 Dec 2025 08:25:14 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324498fbd2sm6124654f8f.27.2025.12.18.08.25.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 08:25:13 -0800 (PST)
Message-ID: <4558e5ad-57e6-4ee9-9993-ca9e2df323bc@linaro.org>
Date: Thu, 18 Dec 2025 17:25:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/19] config/target: Implement per-binary TargetInfo
 structure (ARM, AARCH64)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Luc Michel <luc.michel@amd.com>, Zhao Liu <zhao1.liu@intel.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20251021205741.57109-1-philmd@linaro.org>
 <20251021205741.57109-7-philmd@linaro.org>
 <73bbe76e-5813-47bf-8ad9-6cb3cabbde59@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <73bbe76e-5813-47bf-8ad9-6cb3cabbde59@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

On 18/12/25 16:04, Thomas Huth wrote:
> On 21/10/2025 22.57, Philippe Mathieu-Daudé wrote:
>> Implement the TargetInfo structure for qemu-system-arm
>> and qemu-system-aarch64 binaries.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   configs/targets/aarch64-softmmu.c | 26 ++++++++++++++++++++++++++
>>   configs/targets/arm-softmmu.c     | 26 ++++++++++++++++++++++++++
>>   configs/targets/meson.build       |  1 +
>>   3 files changed, 53 insertions(+)
>>   create mode 100644 configs/targets/aarch64-softmmu.c
>>   create mode 100644 configs/targets/arm-softmmu.c
> 
>   Hi Philippe,
> 
> I noticed that the "max78000fthr" machine does not show up in the qemu- 
> system-aarch64 binary anymore, and bisecting pointed me to this patch here.
> Could you please have a look?

:/

Likely fix (untested):

-- >8 --
diff --git a/hw/arm/max78000fthr.c b/hw/arm/max78000fthr.c
index c4f6b5b1b04..0dc13eadd82 100644
--- a/hw/arm/max78000fthr.c
+++ b/hw/arm/max78000fthr.c
@@ -50 +50 @@ static void max78000_machine_init(MachineClass *mc)
-DEFINE_MACHINE("max78000fthr", max78000_machine_init)
+DEFINE_MACHINE_ARM("max78000fthr", max78000_machine_init)
---

