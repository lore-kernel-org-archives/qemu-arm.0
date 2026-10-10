Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02BECA6017
	for <qemu-arm@archiver.kernel.org>; Sat, 10 Oct 2026 09:08:03 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xFT3T-0006nn-BU; Sat, 10 Oct 2026 05:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFT3Q-0006mq-VE
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 05:07:44 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1xFT3O-0003ZS-Cw
 for qemu-arm@nongnu.org; Sat, 10 Oct 2026 05:07:44 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a1688d7769so4128955e9.0
 for <qemu-arm@nongnu.org>; Sat, 10 Oct 2026 02:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791623260; x=1792228060; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=0XTXNhKe4zu8MekEggFfMrDuZH76AHJgaDl/beJfpe4=;
 b=SOpXjhp2vqOiCulzqUJHTTPaJYPgjghKwJbRF33OvAhmzVR1GFsGFrthZNjXn3DRf9
 eJ+T0pjNOf9TeBVl1cE6QGLNpjY1gc/EF6S6LNVpPdx+D5pn8+04ZmlDj9FAFdFMneaJ
 pH2Y5GtSeMN07IDF3Lj88Yqidi5kqzYVISlKAoFSetEZjtemCT5rcgFcUEVMav+f8Iu9
 1WaIr+GzvTspzcDNSEYcTnAUsWzJE2KRoiydu4ZkHi8ixi7BD3LC8J6xPhChqukbQOEY
 SKUK7XEGP6eJ19faTJj6StJrhgH2uI3zdpn86bOP4sNx17nrZWxvmJmCY87rp8nd9ytX
 /46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791623260; x=1792228060;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=0XTXNhKe4zu8MekEggFfMrDuZH76AHJgaDl/beJfpe4=;
 b=NKJACS0dBmYFU0Y/vuuPCqQfqOoHHqbMgdDY+PQaJfV1j7E96VxsAaMgQGpjGxwdFS
 7cHxu3+kdbj/4FfK6B8tgXCDjknsk7GlcPklfgyJNQr71fKAoFXPgZJN3+0WmlLTIxYv
 qTCguQvyeA0ZN4+gWpscq1cVYpUjaAVUiHUNC6uRudOJnHM2jKpxCPzy/Y2M6Omxw+Wc
 p7e2FUCKXcCIbAtA3t8Qmkn7xNiDcxt7qa2Bd9ACgqYmSs2giThRUB8/asoO7wfnA03l
 hfLsYWKBmUyzvPAUfc0E8CAlVPgMGX3paMENZsUWFhT340VD/3Xt3/MU9LK1JkyT3DMQ
 bitg==
X-Forwarded-Encrypted: i=1;
 AKwUvBx6jK8UI47K+05C3vGvsmPWsTRJ3nYjknPh/bnWvCc3MAbTkemEfg/tXkZ8hg8nZgPICYTXk+9h3Q==@nongnu.org
X-Gm-Message-State: AFq9FYIzMRx76bxPG/Tq9Ret9XVMOFz6OMhBY8ZcEeYYJ0k8hlY1H9+n
 9p8vk+93/Rsy/+6RDOw6G1PtEzlt+MeLy4rYPJfR7zEeAo/btmDQo88VyvjBxO6DgMU=
X-Gm-Gg: AYBFou11F3SMRtUBnT1dP6yxSPCVGLNCTFDh5GnJMkeWYP0Yr7jH2neD2Xm4Wp/247R
 GAC+xu7wDHfc3dXY9X7DzJ4B7Qu50PcaVOVKbXKsYfU+7C5CtC4mkVuP6wgoLwTMqxiVezVyNen
 7fSPRosxi/bZMPFGw26LMFtAo+tEZu4kp5hTvQxKyDH2MYQaaKyLyMtkMur8S5jHtUFKEOTRDgt
 mFh2E7NVoXvcHRMl9Gm2rMkhijnctkIIqSbNFvKk+K/uMgWnvnMs5F2KyOb+orhZaFj+1qNITsc
 EtNHedyK2dZhR6uojQZXKETVp6ArYE3BXdBxeKw0t0pWs25w8VlyJ5UJNG/Bq8tpdM0TAFNeeNP
 X8gXPrhpOqnDR8Z49mjH0g9LgoTmmWDqdHraMXjxcVnrByuoGFITQntlRZTRxiV36ORZP15dioq
 H6rt5a4LNX4JvdGiRZg5UAMqUOqxlbbUaizXZt9WuN1UHReURw1GRvG9fAXOgiCoAqLcC4/m8JQ
 tFMLYXuw361cAIBi5DD+rfBy7Vu6nufaK7sn99rJg/iikfjvDmh
X-Received: by 2002:a05:600d:82d3:b0:4a1:7856:f4b0 with SMTP id
 5b1f17b1804b1-4a18e4ce9acmr94649155e9.30.1791623260553; 
 Sat, 10 Oct 2026 02:07:40 -0700 (PDT)
Received: from ?IPV6:2a00:1e:e082:2901:af75:ea30:318:dfb3?
 ([2a00:1e:e082:2901:af75:ea30:318:dfb3])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18e49792bsm178126865e9.4.2026.10.10.02.07.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 02:07:40 -0700 (PDT)
Message-ID: <e87d9000-6f45-40ec-80e1-f6d0954538f0@linaro.org>
Date: Sat, 10 Oct 2026 11:07:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] tcg: namespace target helper symbols for combined
 builds
To: luoyonggang@gmail.com
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 qemu-devel@nongnu.org, Song Gao <17746591750@163.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Peter Maydell <peter.maydell@linaro.org>, Paolo Bonzini
 <pbonzini@redhat.com>, Weiwei Li <liwei1518@gmail.com>,
 Sunil V L <sunilvl@ventanamicro.com>,
 Philippe Mathieu-Daude <philmd@mailo.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-riscv@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu@processmission.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>, qemu-arm@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
References: <20260930073935.712-1-luoyonggang@gmail.com>
 <20260930073935.712-5-luoyonggang@gmail.com>
 <374ba010-b530-4310-b20f-65ada56cda6b@oss.qualcomm.com>
 <f8ea6e43-2e6e-48b7-a61c-d9ec2200872c@linaro.org>
 <CAE2XoE97kuRkF4i2+t=tH0d0dXWjCaNmUjUaVZDPekWimSN3gw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <CAE2XoE97kuRkF4i2+t=tH0d0dXWjCaNmUjUaVZDPekWimSN3gw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 10/10/26 10:53, Yonggang Luo wrote:
> On Sat, Oct 10, 2026 at 3:45 PM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 10/1/26 18:51, Pierrick Bouvier wrote:
>>> On 9/30/2026 12:39 AM, Yonggang Luo wrote:
>>>> Use target-specific assembler names and helper metadata for TCG helpers
>>>> when multiple targets share a binary. The generated prototype maps the
>>>> generic C helper name to a target-specific linker symbol, for example:
>>>>
>>>>       helper_raise_exception
>>>>           __asm__("helper_i386_raise_exception")
>>>>
>>>> This lets target helper definitions keep generic C names while avoiding
>>>> linker symbol collisions between targets.
>>>>
>>> Hi Richard, do you have an opinion on this patch?
>>>
>>> We are trying to see if we do renaming per helper, or if we introduce a
>>> "generic" way to deal with it. I don't have a strong opinion, renaming
>>> things or adding more macros and build system soup are both ok on my
>>> side, so direction would depend on your culinary taste.
>> I think the general direction is good.  Perhaps the specifics need
>> adjustment.  In particular, using __asm__ to rename symbols is suspect
>> and likely non-portable to non-ELF hosts like Darwin and Windows.
> 
> I have already tested on windows, only not sure about Darwin, let's me
> create a test on Darwin,
> because I do not have a CI for Darwin to test it.
In particular, I saw no use of __USER_LABEL_PREFIX__, which is required 
for portability.


r~

