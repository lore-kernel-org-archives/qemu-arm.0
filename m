Received: by 10.25.208.211 with SMTP id h202csp2746618lfg;
        Thu, 3 Mar 2016 07:09:32 -0800 (PST)
X-Received: by 10.140.223.17 with SMTP id t17mr2217347qhb.65.1457017772864;
        Thu, 03 Mar 2016 07:09:32 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e7si14071978qga.19.2016.03.03.07.09.32
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 07:09:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:35712 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abUsd-0006uw-Nj
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 10:09:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48074)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUsX-0006on-VX
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:09:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUsU-0002Pc-5a
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:09:25 -0500
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:34134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abUsT-0002PD-KR
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 10:09:22 -0500
Received: by mail-vk0-x22d.google.com with SMTP id e185so24208568vkb.1
	for <qemu-arm@nongnu.org>; Thu, 03 Mar 2016 07:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S21bP/QHMJRQ0eBGMdv4yRGXngN0KU60NEisxdU4c1U=;
	b=bU/EAviyohZhHPoGp7cr11dzE9xWoLU1CKTQ+V8chpJuQKFcvDlfS1PIJxpKgDsM8y
	+Mt9A/dcQmbggvNSfXVg1lxwKjED/Urn0luZ8GyMZej/wB/mK1QnuCS4qBU2ONzyyfaH
	jGib88IbBV2ywYReA78B3UuWa1N3Eb8SaNtZ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S21bP/QHMJRQ0eBGMdv4yRGXngN0KU60NEisxdU4c1U=;
	b=kROqpnEHu1+id0KlJbyeWu8Ky1DfZ8GO5UiqSY4qK4ZEngS5wK3is9nxA20FhDJSd8
	+X3Vu7YN+Oy4cBC8E/lKr6N6H0xvkrVqxMashrso+mowKv1qbQvoe5XrUWrhZzgxK82v
	jOXbDeQPNBU5rmtWv9BvDoSsYQwa3p1blN52KVLGOHXzr8xdY2N9DIxWNkAvCRrzh+2E
	DQTV1GU+zxndE1GOX84LJeP+q5+RSxK1i+j2sdauNorrKW0yoKAdo9CnBh9Ec+Qc1TzN
	sEqo59VL+hujjhIGu/ZqsJBIXnj5UBl3CpvkykfYYgF9TQlrS9XUK97gKXYqmIpoVupG
	9ifA==
X-Gm-Message-State: AD7BkJK7NHBGsYB4vYV9mPW6bTUiC43zQMXl3S7XqZIvEr9Yp9rE4Hur19BnCyY90mOiuwE+R0mynM4q0ZYUr8FJ
X-Received: by 10.31.52.147 with SMTP id b141mr2344733vka.82.1457017761036;
	Thu, 03 Mar 2016 07:09:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 07:09:01 -0800 (PST)
In-Reply-To: <7aa451b4cadc8d4d5a342feb6011920bfc251aaa.1456901522.git.crosthwaite.peter@gmail.com>
References: <cover.1456901522.git.crosthwaite.peter@gmail.com>
	<7aa451b4cadc8d4d5a342feb6011920bfc251aaa.1456901522.git.crosthwaite.peter@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 15:09:01 +0000
Message-ID: <CAFEAcA9u5nkjJ2+QLryr-=YrTnoytW7m8dDrhZpfSs0M+aeNSg@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: Stefan Weil <sw@weilnetz.de>, QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	sridhar kulkarni <sridhar_kulk@yahoo.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Piotr_Kr=C3=B3l?= <piotr.krol@3mdeb.com>
Subject: Re: [Qemu-arm] [PATCH v2 07/18] linux-user: arm: handle CPSR.E
 correctly in strex emulation
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bYDJzXDJuP32

On 2 March 2016 at 06:56, Peter Crosthwaite <crosthwaitepeter@gmail.com> wrote:
> From: Paolo Bonzini <pbonzini@redhat.com>
> @@ -610,11 +642,11 @@ static int do_strex(CPUARMState *env)
>          segv = get_user_u8(val, addr);
>          break;
>      case 1:
> -        segv = get_user_u16(val, addr);
> +        segv = get_user_data_u16(val, addr, env);
>          break;
>      case 2:
>      case 3:
> -        segv = get_user_u32(val, addr);
> +        segv = get_user_data_u32(val, addr, env);
>          break;
>      default:
>          abort();
> @@ -625,12 +657,16 @@ static int do_strex(CPUARMState *env)
>      }
>      if (size == 3) {
>          uint32_t valhi;
> -        segv = get_user_u32(valhi, addr + 4);
> +        segv = get_user_data_u32(valhi, addr + 4, env);
>          if (segv) {
>              env->exception.vaddress = addr + 4;
>              goto done;
>          }
> -        val = deposit64(val, 32, 32, valhi);
> +        if (arm_cpu_bswap_data(env)) {
> +            val = deposit64((uint64_t)valhi, 32, 32, val);
> +        } else {
> +            val = deposit64(val, 32, 32, valhi);
> +        }
>      }
>      if (val != env->exclusive_val) {
>          goto fail;
> @@ -642,11 +678,11 @@ static int do_strex(CPUARMState *env)
>          segv = put_user_u8(val, addr);
>          break;
>      case 1:
> -        segv = put_user_u16(val, addr);
> +        segv = put_user_data_u16(val, addr, env);
>          break;
>      case 2:
>      case 3:
> -        segv = put_user_u32(val, addr);
> +        segv = put_user_data_u32(val, addr, env);
>          break;
>      }
>      if (segv) {
> @@ -655,7 +691,7 @@ static int do_strex(CPUARMState *env)
>      }
>      if (size == 3) {
>          val = env->regs[(env->exclusive_info >> 12) & 0xf];
> -        segv = put_user_u32(val, addr + 4);
> +        segv = put_user_data_u32(val, addr + 4, env);
>          if (segv) {
>              env->exception.vaddress = addr + 4;
>              goto done;

This confused me for a bit because it doesn't swap the two
halves of a 64-bit word on the 'store new value' codepath,
but it is correct -- for STREXD for AArch32 the first word
in memory is Rt and the second is Rt2, regardless of
endianness.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
