Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81454E92FCA
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Dec 2025 17:55:59 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vaHT8-0007MT-Bn; Mon, 29 Dec 2025 12:55:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHT1-0007JW-ML
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:55:41 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vaHT0-00053P-5C
 for qemu-arm@nongnu.org; Mon, 29 Dec 2025 12:55:39 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-34c7d0c5ddaso5130493a91.0
 for <qemu-arm@nongnu.org>; Mon, 29 Dec 2025 09:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767030936; x=1767635736; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xcF97KlrXNRG0gM8bCfa1jut/8WfK/9bOClnty/0Pek=;
 b=OiurIwByelhdnAfCHSg4bLlKs5hfV9dkuBI8q5sa34RyP3vN1yo393wqcDc7g83Qry
 LpND1+7/izUQcdVU6XqYdT2wdYgdexqSXM9xRXt2eCvklbadi8EATQ1CdP1WGwrOk4OD
 w2qkkyYT1NV7oJvwvlxZhyXquO9KvprCYsPwArlZNVo1nnA6W9pCa8sH3IZjMCGOBaTT
 XF1nIsUQbZhx9eN58vaNUqDN0k6+IB8/34jFKZbtPIKh9Ft6eA/9c1OVjQqhNCarbeXt
 hkzna/5tWo8mNE+tDLcDFYQsMoup/eJQ03QB08oufD36JOcEDczXqYVdqnM4K3D19SvX
 XgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767030936; x=1767635736;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xcF97KlrXNRG0gM8bCfa1jut/8WfK/9bOClnty/0Pek=;
 b=CcuuMUjX5kLSCu2SIeSZ2xMqjE4n549o62EbdrwRJspzKczsFs60TUESuc7Lnggu37
 3G8w0ghxYy9O6vNeN5ZctVdWffYuIV9WLDMjs/e1xz7+KEj3XDk5eLWhTOE3zFb+veS2
 0qNltJtH2rqymr4F4sQNthghdsWUtAhDMZDiA9AOpfapi66kxNyLqziWbaHQdSUfhans
 gMRHMTEBL74i8xyKyn5vM9yWl39g16hsr4C9m81L1iWTaev2KEh/ZeATOnWZnBO48jRv
 SUtE2T4WTh/qMd0P47z1JeBqlagWLKkY+h6TUnmTU9NyfXgjYeUO+uI47jrf4CzYvOde
 e0sA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe7tz5jSnqDIRFWIM8JnikWfd7f/ZC1l+3qx2iYlBmoVbTSXzMY94BIvOYxc57U8H5020R8b/k1g==@nongnu.org
X-Gm-Message-State: AOJu0Yz/4DAg1lgGy2Fx1raa+PwbatpV14ZKrXaDEIARasma50v7Cjp4
 EdF2ilzdCD/N2DZcqBGYgwx7M9UD4yZ13b8bKdf1U6Texy1YzKP/X2RDLaoi3/YOVu0=
X-Gm-Gg: AY/fxX7Ko8Y3u/sVMv1QVpEDtm/MDSb3yYKy/7U9Q03EXpARyKTvCLXYijV6rCQKidv
 BWP6EoiA3hzg167aaaa+IztzVHADI+bMIIuZWXDkWkzA9EgGOa645DnA/3aLad4LzOPLyopIZmx
 PpblFbzMjXQ04/YW8Rt2CfpeqYA7me/Cr8cOhsTHsofXoqF3y39BLDcYFyf7fomGH26XF4S2prA
 cZL873TkJe7pwrjY3FCFJYbFiOj7wzdaufl/0QdaX8H+EXs2QolEg3bS+QDXilTvm+BraMKqTWG
 ixC7SNKFt5huqsyT9hlzbiZkUggaejN50GsTMNH1CaPiW/dNbkX+OCjHntCrcZMa7R5IMs0VGP8
 KEQRF4MfBGPcbTAPX2v4ixX1VAZ8Ni/vfolYwpmOOCBCbHhfsn70rv83uJw2rrJ+flb7NkX04LY
 hCZhh8rlJhEr4qt9JFeooIC4fpE115X3ycL1a9T9PzgyUVAq6JmAQyFTdR
X-Google-Smtp-Source: AGHT+IG5pKPIbgCZ+/t/NTtXRh7gSD4tBjI5MGLqwu+CadBnV8CKYEfqdkOPnfFH50bbinsjuzBHiw==
X-Received: by 2002:a17:90b:5487:b0:343:cfa1:c458 with SMTP id
 98e67ed59e1d1-34e90df6b79mr26125375a91.18.1767030936148; 
 Mon, 29 Dec 2025 09:55:36 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-34e70d676b8sm30759702a91.8.2025.12.29.09.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Dec 2025 09:55:35 -0800 (PST)
Message-ID: <1f680262-eee4-4924-9dff-b938f8035a9b@linaro.org>
Date: Mon, 29 Dec 2025 09:55:35 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 26/28] whpx: arm64: check for physical address width
 after WHPX availability
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Zhao Liu <zhao1.liu@intel.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 kvm@vger.kernel.org, Roman Bolshakov <rbolshakov@ddn.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, qemu-arm@nongnu.org,
 Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
 Yanan Wang <wangyanan55@huawei.com>, Peter Xu <peterx@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Ani Sinha <anisinha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>
References: <20251228235422.30383-1-mohamed@unpredictable.fr>
 <20251228235422.30383-27-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251228235422.30383-27-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x1032.google.com
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

On 12/28/25 3:54 PM, Mohamed Mediouni wrote:
> In the case where WHPX isn't supported on the platform, makes the
> intended error appear instead of failing at getting the IPA width.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   target/arm/whpx/whpx-all.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


