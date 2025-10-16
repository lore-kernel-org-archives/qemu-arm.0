Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD5FCCD19A
	for <qemu-arm@archiver.kernel.org>; Thu, 16 Oct 2025 17:17:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9RaS-0005VH-1V; Thu, 16 Oct 2025 13:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RZT-000541-G0
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:15:26 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1v9RZL-0004Yf-E8
 for qemu-arm@nongnu.org; Thu, 16 Oct 2025 13:15:21 -0400
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-7835321bc98so1010290b3a.2
 for <qemu-arm@nongnu.org>; Thu, 16 Oct 2025 10:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760634909; x=1761239709; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tof3EVSvHhBUpVi7ajOyVgIJrNKqbMisVbLCxByvW5s=;
 b=Fqj90toHeOtgQ9OoWG0XX1DbbJeulXW6ioSso58JJqZgCfu1M303Kp/w/goxHqKJPo
 f9N69dAV1sCvkpfe+uR4yZjJl1gRsI9AgNwd/byPzvZWTAFP76LcF2b1aHJ4so4okkoE
 tLvV7JCkZ+ZojYEImtA/ZTq9s4QuXEBxVq7EQaH9xR/Pc5OvovyE1YR0CtNbQClfmNAw
 lO7IzV74vSHtp4gl7LM3pIGqQtKIyPgqgt3EV5GgAALefKRtSDKaaUGxhZ3VvEjAXV6j
 MkoWrG4tsTGillnFnQHudeQS7+/3zPrFrEThYnFeE0u8ziGXl37FEFe8gO9NvdkBKBSg
 7rOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760634909; x=1761239709;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tof3EVSvHhBUpVi7ajOyVgIJrNKqbMisVbLCxByvW5s=;
 b=h4lGZi3C6ZUyAPnKndSwwoWrqkZ4t6RbuytpHmxndM3f4/e9n/FtrVH1ukzrHjj2a/
 63g4+zwQWKUEfh4dKZk7YiYtUm8D4j5UlJCT+piWAG4/X8YFNezkPB8Mwgb2fA28FS1D
 WqP4jm9Zyno7nvzK3CwFrQAvNTnNarDKVpkPKUyFy1Poxfzf6Y0ZN8yWNpLLGLX60L1U
 9pOB4plgUJychzw89nubpvKJtmD7beVDOz9KaWeB35Tg80+ZLdZArTYrJy1e0w/DmNEx
 8DY+jTMUJAHQAwFJcXbkT02l7iIzLGiUZTfVOE6KPPxvgOffHO7GS8XciQsH3IXwY7bP
 dR/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8tYnBVPr1lc3fzBqCwn7fkaPS0xj4VZVLXufWrTLzRIlLmxXEVTkiJKMquyAjFHpB1WsxrEn2dQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz6EnUC+RSU1lS1VZUH52GJkpQe9myhdqfzg4z71GXkUJdQTHNe
 +SfzRB0jpUHzhmMAgSb10D7phJ4yctBXo/qqQ8MrshTCnVNGxW/Ou/ozHLPB5vWulXE=
X-Gm-Gg: ASbGncsaxtoDq/j9moH9uYaV7dXLVgodVo2Ft98D3pcZC8mdQ9H3DyYxBoH26Bqo7/8
 dVOEBAgvhEikANt9LEHYqKz+JG4ez3WXdzl95jtt9R9PSjOyBC+XRK0BdFx4wC5b4eh0oVRRCV1
 KEcv8oKpPjcjmNV5DvdtTzyVka9jGD5Y0zCPjHZfc8yM/lLiTGOKJ5qu0Wpp4zS/hDQu+NzjRVw
 uYmge3avqsEHdShUEL0ZrQVa8jofAPuGpPmie7U1WCpr8JSxllrMbd9G95yc/xFpQDn44LBeSkB
 SMnDd8nomBEkM1JZjWeqDNEXt2sMsb5gdV3zMVSbNEOd8E4MX07iJzVFdAXg8rV6Qvl4Bjqu5tZ
 EexVFqavIc/13laK7Vf8L6ZDW0Np1Xoiph9zE3wpJ5A2QbggS77Ktfl0u0MZg9glKbyMKhRvedo
 Xv8MYfRvq9Snk5
X-Google-Smtp-Source: AGHT+IHfOj2/RGEhI9uYqAiueQ5geH38L5kdOF1sE9vNJMIOJ7LSbEsFzN5vZE3JkIhfd+nJud+MPg==
X-Received: by 2002:a05:6a20:3c8e:b0:334:9c41:bdcb with SMTP id
 adf61e73a8af0-334a86445ddmr785445637.58.1760634909132; 
 Thu, 16 Oct 2025 10:15:09 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7992b060962sm23224426b3a.1.2025.10.16.10.15.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Oct 2025 10:15:08 -0700 (PDT)
Message-ID: <faf3cd2b-4961-4d7c-899f-bfaa9f2ee271@linaro.org>
Date: Thu, 16 Oct 2025 10:15:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 23/24] MAINTAINERS: update maintainers for WHPX
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
 <20251016165520.62532-24-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251016165520.62532-24-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x433.google.com
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

On 10/16/25 9:55 AM, Mohamed Mediouni wrote:
> And add arm64 files.
> 
>  From Pedro Barbuda (on Teams):
> 
>> we meant to have that switched a while back. you can add me as the maintainer. Pedro Barbuda (pbarbuda@microsoft.com)
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   MAINTAINERS | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


