Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C65C87FCF
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 19:45:13 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uj17B-00029J-4O; Mon, 04 Aug 2025 15:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj178-00026N-QG
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:44:55 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uj177-0007Uq-3G
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 15:44:54 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-2403c13cac3so44498745ad.0
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 12:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754336691; x=1754941491; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/M2pfZ3IVJzagLMECh6P3gXE47qrtA8ADSUmzBH4aYA=;
 b=Zt8zJeZQzywoTA4jj6Gv6O89aCMQ+WgBu3pVcsZUHt9Au/X75MAwMLbcOJTVCAk6g1
 oCE9HYNKJs3wlcX37HaP9gq9VR00PJA0qWkAPJqL/Rtmd4P5RlILQ9T2GbHnBkJ9ipol
 qFZ4zwSOm8RiuK6WqhF1F01GCqNNfbsRecDinZbuLlrm55BhABetu7SyJeM5gjpzt2e5
 QQMpKSeHE2gMtnyTzFIOHZUbzPpK/b+OFcfm4lxi3pmqbsHwU32nU3h+ox6UQ+RWa1Xd
 3iXtG3onM0EvBrRgsJ5+KAzigzTQ/FWYaej7nBaGIXUPnuk0APYuLa3KUL7ZNsJHrzeu
 IpKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754336691; x=1754941491;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/M2pfZ3IVJzagLMECh6P3gXE47qrtA8ADSUmzBH4aYA=;
 b=MQvQcscS2pwFVYVuzWafRbo77LJ+VmxzmPowscjho/x+imTgTOxDQMVabPZDaXVj7X
 pQteOjuOrZ/2HamHxoIAt1qqqpGqOB1Rgqw+lW3x5x5x7rC9a7OC77MxTEwUuOTi4jYb
 x3tFsfINOYls8osBsaAjH8u4dUuRdqdgyDGo2mtH7vDRE41WPeegRBRO+kzlkCLhU2nL
 kG2DxkDTOXuOekiHW5C3JgvRn/EPAL5LzLFbXW/7x45gHCISA2pWy3r961otOjh1TJTv
 drhH5R0BZyi+pgZgQQUKFpEg2gLXp5l9dqS0S4AhFMWFev4QooYJj2powdmShtYLeIa3
 ESWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVVfXotTkZYQstnqzVvFCH0NG6ywpaKnDa5qOyUIGAyRg9kCclniZWJ4m3vzJNCSh2lls/moZWXQ==@nongnu.org
X-Gm-Message-State: AOJu0YzcOHrkhWCekyniYaocvUr80wOd514UfKJ7VD8tAfLeQj8vzp6z
 EAxiKuzXHf9KK8Ib30ZB02sEJBm6ihwYXCt2RIZ1hwc3jIEUsQCMiYWS8wvtwEpX5zk=
X-Gm-Gg: ASbGncsLusADmxADgVGE/PGqDY6vj33VhgTwsJTNtaLOI1CndZUvzoS6au1Tr5biY9o
 kUZAlh14TubAVhLBmkf+0OsqdbIa6XURoAVDHKl0wvOraOKTbJl0C96oNVDwTdNX+SqrlaURhBr
 Fn6CB28Xo/ivf1Vyu0YsFPZV9IX+BJL811EOEBONOnUunLzELHCHioWraZp1bA4UP/q44WRaPPa
 jHBnGykpaZkCpBBLZ9vEOHgLfwsjjoN0w9YwN+g6z5AZiDsR8EF8gMqmgOwI8GI4gkbvwOOTWGd
 w7evjmyrbXnSfdxF9YuGshJadfYWBhnlY9hM+l4em6XtlRPcx7Ok+RHry4wOiVxt4z8+dBEqqDj
 0qUPX7tE5hluGiTXYevPljSLMRDFXvJh2Zy4=
X-Google-Smtp-Source: AGHT+IEO3zmBrTux8983FgcXeTVpnOp1O5CXmf+NoTtWEDLEB4xA4BwmObJeu+UYuZrZ9rRvSRJz/w==
X-Received: by 2002:a17:902:e5c6:b0:235:e1d6:2ac0 with SMTP id
 d9443c01a7336-24288e2205cmr8676275ad.24.1754336691372; 
 Mon, 04 Aug 2025 12:44:51 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa77sm115629135ad.174.2025.08.04.12.44.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Aug 2025 12:44:50 -0700 (PDT)
Message-ID: <84f9c541-f9d2-4bc4-b2fc-980d71c1da49@linaro.org>
Date: Mon, 4 Aug 2025 12:44:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/17] whpx: ifdef out winhvemulation on non-x86_64
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>, qemu-devel@nongnu.org
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, Ani Sinha <anisinha@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Roman Bolshakov
 <rbolshakov@ddn.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, Mads Ynddal <mads@ynddal.dk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Zhao Liu <zhao1.liu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
References: <20250804142326.72947-1-mohamed@unpredictable.fr>
 <20250804142326.72947-6-mohamed@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250804142326.72947-6-mohamed@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x632.google.com
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

On 8/4/25 7:23 AM, Mohamed Mediouni wrote:
> winhvemulation is x86_64 only.
> 
> In the future, we might want to get rid of winhvemulation usage
> entirely.
> 
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> ---
>   accel/whpx/whpx-common.c       | 16 ++++++++++++----
>   include/system/whpx-common.h   |  2 ++
>   include/system/whpx-internal.h |  7 ++++++-
>   3 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/accel/whpx/whpx-common.c b/accel/whpx/whpx-common.c
> index b5e5fda696..e2d692126a 100644
> --- a/accel/whpx/whpx-common.c
> +++ b/accel/whpx/whpx-common.c
> @@ -141,9 +143,7 @@ int whpx_first_vcpu_starting(CPUState *cpu)
>    */
>   int whpx_last_vcpu_stopping(CPUState *cpu)
>   {
> -#ifdef __x86_64__
>       whpx_apply_breakpoints(whpx_global.breakpoints.breakpoints, cpu, false);
> -#endif
>       return 0;

Rebase mistake?
This was added with previous commit, but I don't think it was intended.

Else,
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


