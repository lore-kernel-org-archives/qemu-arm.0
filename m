Received: by 10.28.71.27 with SMTP id u27csp2955834wma;
        Thu, 15 Feb 2018 10:07:46 -0800 (PST)
X-Google-Smtp-Source: AH8x227f+Hc9Gm8xT9iSgbocqKFjYI4uMQjvtRaHOVvhsu/mStCxdumMAx5bteI+h8C6yg7eXqrp
X-Received: by 10.13.246.129 with SMTP id g123mr2716473ywf.124.1518718066040;
        Thu, 15 Feb 2018 10:07:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518718066; cv=none;
        d=google.com; s=arc-20160816;
        b=p+FSsHtcKgG+PE9k+DqYI+ju5V4vIhwX0eReWPwblMDECCqRXNxYmOazBXX3pLmgp0
         EORhJbevrJT/MKzDtHfz4LllLDgrtZVIYGVR7O5jUoHZSJg9ovFeDNKVKIHCqsGLZsUP
         quma5Rtx/g6ZRIajygp12VTE8tg50zAaeSRpMb1GGNiWS2ExLCI/JUGWB0BjKY9+K32L
         aQNlk7tw6tBFVrE0DLVCI6dW3WPZNBhQsGqe39NP++i3BjcubPaY3P3zi70Xdoj1yamA
         TCRFUC6s29jOVXnnUoqKjwcLtgH2yY9xyrnubhSxgx/u2JWkE/L+diMoOtMzBgWqlIjQ
         NLfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=Fx2kBNhP2E1u8dC9bkzI25NYAOuiV8vxDEsTpXn0VvY=;
        b=TW67+JDLhYZqnR8L8ANdNdOlYRb0b9SfKBKEWJsju9sNswytqoxYjyBMiy4QT/cKJ+
         715uG8dAGE/VSm7pvcLz95anP/udxRJBNnNnb/3jH9KdBO18VRgA86xft5PX18I+U3es
         /V+WdJENbG85Nhkj+F9crxdvYf96YQvpXu808DJjcENbvyGQDHJQpPDipkVPkjV+ppXF
         Tvh3O/4N0gFcLhAiL6Fpy7RkA8P6o0KbsFiZ1bkjdvg8CcjTAngQr35Nv6RMUb6vfOZb
         2DnqKR4FpZ7DZENMoYdl2+piqZJRw4mChaogUISZaHYfUS2MurfhfGzfLEeWSBk6VmuS
         ekPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o7VaQy4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j11si2749176ywa.426.2018.02.15.10.07.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 15 Feb 2018 10:07:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=o7VaQy4D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1emNwf-000101-BB
	for alex.bennee@linaro.org; Thu, 15 Feb 2018 13:07:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57917)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emNwR-0000y1-6B
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 13:07:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emNwQ-0004NI-BA
	for qemu-arm@nongnu.org; Thu, 15 Feb 2018 13:07:31 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:43549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1emNwL-0004M1-VJ; Thu, 15 Feb 2018 13:07:26 -0500
Received: by mail-qk0-x243.google.com with SMTP id i184so639045qkf.10;
	Thu, 15 Feb 2018 10:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Fx2kBNhP2E1u8dC9bkzI25NYAOuiV8vxDEsTpXn0VvY=;
	b=o7VaQy4DPBt1FO+hFFbASYpr0sPF7iSJwIvZsxd5e94zsSphjJDfSvfPFZsFmT6Nev
	cCHjyHW6JESdiIUeCJKg2Mbf1xWj8nNRYq3kUZJlCJLe1rOh5Vtg14mgc3tydTC/m8qt
	GRFzlDIAllF4oV14ieLS6mg0d0NWsdKQVdkBUy5wUJq9c7LKSvtwzRDubZzvOXMc8Onz
	CD+sAZDhDbJIAk1lSnOhmOu1QIhKyLuNE8JoHIWhgeJdbPp3qsnXwJepJu9cgMJEoALV
	SCt5WfA4qttj4ekfa3OjFTP0cKmAdiWb9HxAbVmh6FGyexyutRe2yRMr+PMz7zxG+ouB
	3cEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=Fx2kBNhP2E1u8dC9bkzI25NYAOuiV8vxDEsTpXn0VvY=;
	b=SXGQwhEdksnV/0LOOabk3ADI3sWcy3IVQPUjTNwobro8srgvfhCIS4sC2UD8JIiYB0
	vHILa2recZzPx3KtEQdTUF1BJ9ZtZgUrECs3JeiDyEsTImV7RQwkjj5SslIgxYRWcpiD
	dOaDdMVVSxPu+VwzNt7+XhP9ytWEFi1rooctfpDAexmsjynfOyNk49KxXyRxulcAqHPZ
	NyolbXrSt9A9m2dFpMiyVCwluWBEntNilHsmuclDqvk6Yyw21ZB+obi9dkkydFEb1ysq
	6hHf7LrOiUwEpSScXVxJLubf9dTa4MTxoP361BizZiNE1mBJBpDU02QqgGLxZ+dtpGQP
	Q6wQ==
X-Gm-Message-State: APf1xPCB8+uTJ0k1vZxRuZRRZYsOqY96QIto4S7Y5UX/YooFfwOGIM75
	Xe/wUSL9+6CCstcuWDZ/lrM=
X-Received: by 10.55.135.70 with SMTP id j67mr5445438qkd.34.1518718045464;
	Thu, 15 Feb 2018 10:07:25 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	r186sm10661361qkb.14.2018.02.15.10.07.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 15 Feb 2018 10:07:24 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <20180215175707.15491-1-peter.maydell@linaro.org>
	<20180215175707.15491-4-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <7745fafb-ddf6-06b0-c6b0-857e846403c0@amsat.org>
Date: Thu, 15 Feb 2018 15:07:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180215175707.15491-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 3/3] hw/arm/armv7m: Honour CPU's address
 space for image loads
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SSYy4hl1ZiXn

On 02/15/2018 02:57 PM, Peter Maydell wrote:
> Instead of loading guest images to the system address space, use the
> CPU's address space.  This is important if we're trying to load the
> file to memory or via an alias memory region that is provided by an
> SoC object and thus not mapped into the system address space.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/armv7m.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index 56770a7048..facc536b07 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -270,6 +270,9 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
>      uint64_t entry;
>      uint64_t lowaddr;
>      int big_endian;
> +    AddressSpace *as;
> +    int asidx;
> +    CPUState *cs = CPU(cpu);
>  
>  #ifdef TARGET_WORDS_BIGENDIAN
>      big_endian = 1;
> @@ -282,11 +285,19 @@ void armv7m_load_kernel(ARMCPU *cpu, const char *kernel_filename, int mem_size)
>          exit(1);
>      }
>  
> +    if (arm_feature(&cpu->env, ARM_FEATURE_EL3)) {
> +        asidx = ARMASIdx_S;
> +    } else {
> +        asidx = ARMASIdx_NS;
> +    }
> +    as = cpu_get_address_space(cs, asidx);
> +
>      if (kernel_filename) {
> -        image_size = load_elf(kernel_filename, NULL, NULL, &entry, &lowaddr,
> -                              NULL, big_endian, EM_ARM, 1, 0);
> +        image_size = load_elf_as(kernel_filename, NULL, NULL, &entry, &lowaddr,
> +                                 NULL, big_endian, EM_ARM, 1, 0, as);
>          if (image_size < 0) {
> -            image_size = load_image_targphys(kernel_filename, 0, mem_size);
> +            image_size = load_image_targphys_as(kernel_filename, 0,
> +                                                mem_size, as);
>              lowaddr = 0;
>          }
>          if (image_size < 0) {
> 
