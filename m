Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB99DFF60C8
	for <qemu-arm@archiver.kernel.org>; Tue, 31 Mar 2026 05:20:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w7RWe-0006Ay-RO; Tue, 31 Mar 2026 01:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w7RWd-0006AR-4p
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 01:20:27 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w7RWb-0003xk-Hw
 for qemu-arm@nongnu.org; Tue, 31 Mar 2026 01:20:26 -0400
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-82735a41920so1718705b3a.2
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2026 22:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774934423; x=1775539223; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XnMLL3dGmcOhUfTFiIbOi0uB4KD932Kmb2NWbTFQtmg=;
 b=MKaW2bS3W4i9qhSQ5FCAc1vGMHN6l9p2hHGITg7eWxOhfAfMffDM6G/dxORWu3xv5e
 tfyaTY9bEtwrZAX/KyWRWPgKShBwI9TgqFplhofcMrxIzYLyws8KTS624FyLZUfPD6t2
 DgMbGOENsT/WC78dpB2L3/vmX6q+cmFjH6vfZXqqDjXjIBjVMKAakDMJLdL0qcPWVHnl
 ZV2swWyoQ5lEzqUSCuOt9U8H3W+c4NFcxf59luazLqM0oAe7Pms8tOMPwVgYfsoLH9Mf
 JfAajJNBS//XJ1Qu55igcHrq6dLj692gasHhZ8o1bbmi4EPM47MVAEDTMPxU8IiFOhi1
 p/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774934423; x=1775539223;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XnMLL3dGmcOhUfTFiIbOi0uB4KD932Kmb2NWbTFQtmg=;
 b=kSykUsdt9pBEvw9qGDMb/VeTSCoZgQSvMnZrSJ3P9c/cpqe5irddjMOcv7RX/BH6K2
 wli4JRjaL6zeDEoKzlMI+mgRRmAVtdX9brhK2fuAloXN4CSRGBdDsJ5h88NpjmjJprsQ
 SDUTPtoGZ5TAa/BwyUHsPnnS+JKjZHUgpzzeBcv8SJbpLCM+tFmZEZe/z7IiwdW8YLyY
 gcxCp4QOhdP/KyYBxUgmme8niudK2WrvQp+jQOmOjT+Yb7FbSQ4gex4MWWp6ZPtCbiGt
 s3uJ1tnZx9OPnaVCW46pyQ09Fnj6PiapMV6c9Sbx8h7ke4g7GtWfbmNtYuCZn65l+pWT
 9VuQ==
X-Gm-Message-State: AOJu0YzZUBBb/rXMLgSM/5ohstClbLX69TI8XrTHAfjGFLrrDA5WXpCB
 H6MoGTFhoxDJnbIAvOxMQQFuA/uajP2b5F1f/YyqIIQpeda6bSINGXEqcUvQSJ0t4iI=
X-Gm-Gg: ATEYQzyLkrBLLXAVX59D2jApcIs5UxhNSVoCoBhUF9xeuhf9Dabue8EV3XFOE9xdqZo
 7kz1G1sceLvuMsKFQWS4/1sq1C1lFkD8AeD9OtOw0QudNznw38jozqji8Msfg3uT1pCnIPQIN2j
 +y0LS3NWxBKncF1ijTeTMEm44QCwn4LNghy7s1A1oNbyMU+6UXhg9PImqhlL9aHU2/lOYDyd+Ww
 bbTcjUuFQInpsBQChQrnctov6XrAJsU6yqyVcWxMQ9kdnLBgKbnZAeaHyntHKouhVynqwKLpXOP
 eM+aVze/YYLKa6IuvRXeha0SeGZT6+POWeXHS0/uGzAOMjm7mttFVhfkdcm63HpCdW7cbg+9ZJq
 rpNYvU/Y3sr7AF2UsipAbthyuZRXn1k3Y6Y64PfOI5FVwUZyVcn7a1CbTEnUyHJPvMepJT1Epsw
 gSwQUvy/hz8GxSNBT7zJDEXmQWND3UgO1n4dvmRWc=
X-Received: by 2002:a05:6a00:2e27:b0:82a:7dfd:9757 with SMTP id
 d2e1a72fcca58-82c95c27e6amr13496023b3a.4.1774934423312; 
 Mon, 30 Mar 2026 22:20:23 -0700 (PDT)
Received: from [192.168.4.112] ([103.73.85.112])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82ca8625269sm10510328b3a.53.2026.03.30.22.20.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Mar 2026 22:20:22 -0700 (PDT)
Message-ID: <67a38c39-ac5f-4243-b3d3-fb6c1a02f346@linaro.org>
Date: Tue, 31 Mar 2026 15:20:13 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/12] target/arm/tcg/translate-vfp.c: make compilation
 unit common
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-6-pierrick.bouvier@linaro.org>
 <b6895297-c24b-4605-8d2a-a8566dfd3604@linaro.org>
 <1c34141c-7b26-4e15-885e-27c15382ac07@linaro.org>
 <8e71cd16-7938-487e-91b9-2863f1eef15f@linaro.org>
 <c94c2f42-812d-48fc-a971-fe5bb7379a06@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <c94c2f42-812d-48fc-a971-fe5bb7379a06@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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

On 3/31/26 01:38, Pierrick Bouvier wrote:
>> If you want to share these, do we need one invocation, storing the file object in a local
>> variable?  Akin to
>>
>> vfp_d = decodetree.process('vfp.decode', extra_args: '--decode=disas_vfp')
>>
>> gen_a32 = [
>>     ...
>>     vfp_d,
>>     ...
>> ]
>>
>> arm_common_system_ss.add(
>>     vfp_d,
>>     ...
>> )
>>
>>
>> r~
> 
> Yes, your idea works. It will still result in duplicated .c.inc though.
> 
> We can't have a single invocation of the generator, since the result will be private to a 
> specific binary/library.
> 
> You can see it by inspecting build.ninja directly:
> 
> $ grep 'decodetree.py.*decode-vfp.c.inc' build/build.ninja
> ... -o libsystem_arm.a.p/decode-vfp.c.inc
> ... -o libqemu-aarch64-linux-user.a.p/decode-vfp.c.inc
> ...
> 
> As you see, the output folder is releated to the final library (or executable) that will 
> include it, and not to where we are in terms in source folder.
> build/libsystem_arm.a.p is only included for common-system-arm code while libqemu-aarch64- 
> linux-user.a.p is only visible for arm-user code.

Before:

$ fgrep decode-vfp.c.inc buildlog
[2638/6697] Generating 'libqemu-aarch64-linux-user.a.p/decode-vfp.c.inc'
[2719/6697] Generating 'libqemu-aarch64_be-linux-user.a.p/decode-vfp.c.inc'
[2830/6697] Generating 'libqemu-arm-linux-user.a.p/decode-vfp.c.inc'
[2904/6697] Generating 'libqemu-armeb-linux-user.a.p/decode-vfp.c.inc'
[4070/6697] Generating 'libqemu-aarch64-softmmu.a.p/decode-vfp.c.inc'
[4174/6697] Generating 'libqemu-arm-softmmu.a.p/decode-vfp.c.inc'

After:

$ fgrep decode-vfp.c.inc buildlog
[2504/6701] Generating 'libsystem_arm.a.p/decode-vfp.c.inc'
[2651/6701] Generating 'libqemu-aarch64-linux-user.a.p/decode-vfp.c.inc'
[2732/6701] Generating 'libqemu-aarch64_be-linux-user.a.p/decode-vfp.c.inc'
[2843/6701] Generating 'libqemu-arm-linux-user.a.p/decode-vfp.c.inc'
[2918/6701] Generating 'libqemu-armeb-linux-user.a.p/decode-vfp.c.inc'
[4085/6701] Generating 'libqemu-aarch64-softmmu.a.p/decode-vfp.c.inc'
[4183/6701] Generating 'libqemu-arm-softmmu.a.p/decode-vfp.c.inc'

You're still building in libqemu-{arm,aarch64}-softmmu.a.p.
Which you say above you aren't.


r~

