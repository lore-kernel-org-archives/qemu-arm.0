Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4082710lfm;
        Mon, 27 Apr 2020 06:04:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ6c10/m8f7egHbt+JaILCCZkUFf9c90Q/IYf54cg6ankxBK1j5m85mcdjuBX8wrSn3jKhz
X-Received: by 2002:a0c:a899:: with SMTP id x25mr22682697qva.232.1587992672437;
        Mon, 27 Apr 2020 06:04:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587992672; cv=none;
        d=google.com; s=arc-20160816;
        b=HNo39rMKGDULGqKUfjuQzmyLhcZ8uS44QE2T2WW4kkt0Ld/vIJpm2cgJghljHq+mj8
         OEfC9r+SYLf2bN22lRty96ED6mEVhhYzuyzV4zxcIJ+wxaae69tcWT2r+94TKgsC+mq/
         sx89jmI49qTcmAdnOs3DPLY//CGRMcrtwXn0ywxxwT+cTV52jfaObZdkmqD5wD+FZz+s
         48YCNzZVdZUTgpweDQfiLDviQkIl4pUQFGXILijg7l6EH1/NJN/abQpwzOH9CfcIs0Aj
         EbEO+x3u5EwXMx0GPFr8z/A/7hxbNqqEP5EtluQXnaAKqW1spp/rph4C+smRU6RLJk5x
         ALqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=PuRd6I5K4cYio7H8Dul4eqCBWbrS3XwjI28PCJSaHLk=;
        b=hO2QsTHv405bmKANwmzDqhj2FMg06RU+Al3R1lhLfglvJXZS86Q8cIl8/12qregDMh
         NuxeMgdJucFBDZYgyOxqlB2HoOR4CCWVAG7jomYXnDdGyhe6EHk3++jEVChDyXyiCxfk
         hpV2NvP2cG3TTd+nOb7bXCDishbOcXICGanwNFJdoZBNSRL+rp8POVPO198UUxj0XV3W
         2U6bL7tsTcoPM3+mcKcng90neWg84Cq6MLDLj4Pk5McuDp5P1IjOTKvtB05+MoVKhcKs
         vCFe0XakvUUJJK0sfovHRWl3LjzmP5SWc7pnpvZt3Q6Mq916hd3zJJLUCEGnFHMt8mj6
         73Cg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="AACA6q/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g20si358675qvx.171.2020.04.27.06.04.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Apr 2020 06:04:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="AACA6q/q";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jT3R1-0000Ny-P3
	for alex.bennee@linaro.org; Mon, 27 Apr 2020 09:04:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42128)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3Qo-0000Nb-Pm
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:04:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jT3Ql-0007wz-Aw
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:04:18 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:45143)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jT3Qk-0007wf-Tp
 for qemu-arm@nongnu.org; Mon, 27 Apr 2020 09:04:14 -0400
Received: by mail-ot1-x341.google.com with SMTP id e20so25931465otk.12
 for <qemu-arm@nongnu.org>; Mon, 27 Apr 2020 06:04:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=PuRd6I5K4cYio7H8Dul4eqCBWbrS3XwjI28PCJSaHLk=;
 b=AACA6q/qcYkgadALa3zbEspFiB5o/AuHoGvdvMk6dGHRod+S+0Hv7C4/R665OWIWNY
 vBHfTPWd/6VGYgDVO08OajiHNKMGJd4nR3hvhYt2anK4Uk4PFZemsBENRtKqereGmgHU
 PLPe5V7Ioc++xKMgfXslCUFmBNn7UkBz2wr+1YFEZ8/AFhhhhdKSSbtkq+2Y+Ve987KT
 rCSeSYSKYkDBVggbXMCC0H61hf2MIfOb+wg8UlYrqMiHn2u5xTmv08uGh7e4P20Aynd6
 MO8wuI5qeNbWcbSNrKuW4XFGkpWV1LCEEHm7m/j0cyNF+5U0+owT33hyfCh1UysoUC9r
 oH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=PuRd6I5K4cYio7H8Dul4eqCBWbrS3XwjI28PCJSaHLk=;
 b=ZyGh2GHHNFjLHO/CZs1n+AIVTtd90vjsk8SnzGAFP8cmhCW+AIP6a7vxcLNj9WON7x
 6TnpbkfKSl+kGA1KJ+7djSrMmWwNQO607+xIy6B9Idw9OHZyPRjcBCfg93ZWOI+zPnxG
 5sPTbMfTFvqSdoZUr5iT4ZK4XqjcCaxY10/5QqaAqfCPmZMlFbnnMp2fGm3sIrle0Ush
 1+fMa9BgESBNBILroer/MAlsHKA0kDvQzjmfofJ7iGfRV5KB1m5Obr/pevW4iYtxzEhV
 Qopi1HYxSzaX40UCSywp1dkFa8J+PpGlfQG0wn+IgAzCDcbit0ashuPYTkS8pU1gblhL
 7lsw==
X-Gm-Message-State: AGi0PuZAse1q7dtg3MD4H1ZHV9yqrF9eGoR9OivQSj0xnxWFSFYdw4qS
 wRkzONf6W1mmBbU+o8vyTJWyfaJUGCvhgtCltwp0Hw==
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr17279263otc.221.1587992653227; 
 Mon, 27 Apr 2020 06:04:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200423073358.27155-1-philmd@redhat.com>
In-Reply-To: <20200423073358.27155-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Apr 2020 14:04:01 +0100
Message-ID: <CAFEAcA8j7y2VbM1U0Df-TEjS6Kh-iBGXA8Vg1ZrD5Ff6=WthjA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] target/arm: Restrict TCG cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::341
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uKZUTSIMnkXR

On Thu, 23 Apr 2020 at 08:34, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> These are the uncontroversial patches from "Support disabling
> TCG on ARM (part 2)"
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689168.html
>
> The other patches are blocked by the "accel: Allow targets to
> use Kconfig" series:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg689024.html
>
> All patches reviewed.
>
> Since v1:
> - Dropped 'Make set_feature() available for other files' patch
>   which fails to build with KVM only, see:
> https://lists.gnu.org/archive/html/qemu-devel/2020-04/msg03843.html
>
> Many thanks to Richard Henderson for his patience!
>
> Regards,
>
> Phil.
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   target/arm: Restric the Address Translate write operation to TCG accel
>   target/arm/cpu: Use ARRAY_SIZE() to iterate over ARMCPUInfo[]
>   target/arm/cpu: Update coding style to make checkpatch.pl happy
>   target/arm: Restrict TCG cpus to TCG accel
>
> Thomas Huth (1):
>   target/arm: Make cpu_register() available for other files


Patch 5 doesn't compile, because it moves code out from
cpu.c to cpu_tcg.c, where it no longer has access to the
file-local set_feature() function:

  CC      arm-softmmu/target/arm/cpu_tcg.o
/home/petmay01/linaro/qemu-from-laptop/qemu/target/arm/cpu_tcg.c:47:5:
error: implicit declaration of function 'set_feature' is invalid in
C99
      [-Werror,-Wimplicit-function-declaration]
    set_feature(&cpu->env, ARM_FEATURE_V5);
    ^
/home/petmay01/linaro/qemu-from-laptop/qemu/target/arm/cpu_tcg.c:47:5:
note: did you mean 'arm_feature'?
/home/petmay01/linaro/qemu-from-laptop/qemu/target/arm/cpu.h:1940:19:
note: 'arm_feature' declared here
static inline int arm_feature(CPUARMState *env, int feature)
                  ^
/home/petmay01/linaro/qemu-from-laptop/qemu/target/arm/cpu_tcg.c:47:5:
error: this function declaration is not a prototype
[-Werror,-Wstrict-prototypes]
    set_feature(&cpu->env, ARM_FEATURE_V5);
    ^
/home/petmay01/linaro/qemu-from-laptop/qemu/target/arm/cpu_tcg.c:74:5:
error: implicit declaration of function 'set_feature' is invalid in
C99
      [-Werror,-Wimplicit-function-declaration]
    set_feature(&cpu->env, ARM_FEATURE_V5);
    ^
/home/petmay01/linaro/qemu-from-laptop/qemu/target/arm/cpu_tcg.c:87:5:
error: implicit declaration of function 'set_feature' is invalid in
C99
      [-Werror,-Wimplicit-function-declaration]
    set_feature(&cpu->env, ARM_FEATURE_V5);
    ^
[etc]

I've applied patches 1-4 to target-arm.next.


thanks
-- PMM
