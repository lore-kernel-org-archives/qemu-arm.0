Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp4038814lfc;
        Mon, 31 Aug 2020 15:11:52 -0700 (PDT)
X-Received: by 2002:a05:6a00:16c2:: with SMTP id l2mr2941159pfc.112.1598911912661;
        Mon, 31 Aug 2020 15:11:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598911912; cv=none;
        d=google.com; s=arc-20160816;
        b=A1OKazWYbnud8231mR5/9Ik08mOQOXACPo6D1V+gKP1TQKWcCmFpgWzjproxQbNIK3
         ALiAtGvFuSf11Rc6284e0qt8cNQ9hIfyDYCv3Xsc4WvjqrtkM2eaBLPDLSAIeMYzqZ4o
         59D09p00ybdymnyEpsBUh0IJxGp5F8IV9nVIY96AnrCzO94JlvSckkYv161y1T6tJG8+
         uAaB7NTRRfBSLOY2i5xHJK0T560ZHc54fCdj4urMzg4IQvyj0p16V5p/PRWTJyECBqAU
         TBikMKZZjD6bM4dUA1DmO55UH77atX0YNrDApvKRvbC7Xg/RgF8o/aDjUGNjJTrHh70Y
         fkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=PH2RCbNEIaLhQ86NxGfy7qBIeGRthZo3i/8Dmi3lax0=;
        b=rVMJZ1mdSu5tLy/oAVBaGsCnqfSd6jtmO3ld7UYwcVW5kd++PT65q9BXCvcZVOku+z
         +aNjKhI+Z6jdNOP3hZrSgmAcZjUPckzHq7ie7FzlpT23s132lk7SQx7MEZNGHbabb1JG
         NqwrOKd8CyObufwYfxvJU6LSHU0PU/QjdXwuU4rVKjKWux6NnbTEOs72t5oE6l2MkFRW
         BkfGwLuvM7052577wpTmJexFTEfFX6apcTSThj2w0Mfw4mPBWFyYkVlafPlf7M7jz1sa
         gFjPdDf2n7cYiGFt314IDhw9fcLkyMGBdYjjWJS3JKYnsLvF0iLG1eSbzHJD9v0sjQhJ
         c6+w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KvnRRUTn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id f20sor3458974plr.48.2020.08.31.15.11.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Aug 2020 15:11:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KvnRRUTn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PH2RCbNEIaLhQ86NxGfy7qBIeGRthZo3i/8Dmi3lax0=;
        b=KvnRRUTnd/5QvDOn6OMc5rfq5gF7hJSDAC4DssiiKpDawFgv/IjxYfzaPuueMJK1dw
         cRuaY+H1utJG+L/oyhWvZsyShv7WMEwK4lmKw8QJ9+W3hiMwbLyKYyDNNQr1yG1B5a3q
         7FNPxs88Eq0Glz9weNy0J+E5x+/YXFGQTPh8pNdqr3BIk+Ydtzvuv1+t1GDLpOVquovq
         +bSwMx8jTqfXHDZzbG/E5FCqsweQrUSLyGoD+GDpCyzDB0kQVlsM82yJdOwOa8Zly+Uq
         /TasIU9Q7OvkxqPUSW5e09fkeJOH/cysg9SH79ptf530yVeiuMnFRDfOztoGf5x9EVAj
         7fjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PH2RCbNEIaLhQ86NxGfy7qBIeGRthZo3i/8Dmi3lax0=;
        b=qZuSIW6X5NVT8XXNkPnKBDBIl/TqatINAncpNEP/7bXMO3EbSBKhqxvsVtpnlUFxS4
         G7LQO9n0UqPZlk/9V7bta+qqoeZwzIZbCy2eX4stlP6hai0yvz1J80+R0ALoSJsbD/rk
         O/F+yxe+HMZTM801ptHmmf0yEchdC/snVJ4DOISFVWd2HL0ugS8mY4AeB8f93kRNloQF
         xPd3oXCq9X1+egMSmduf7C3S74lc9hWAVHViESeZ86iZzSO5+YNbgctQvKl7btykHmIA
         t6kfs0N/TGhpmjpCjMoRBwRRm6vZr3WhavLy+fFj5JXaN/DIkeFRG7R8nyiAtRhfPVtu
         toQQ==
X-Gm-Message-State: AOAM531lgjmiQCLkOq5KQTX8NBSCpcY3UkLKQpMBfn823nwnDge7vO5s
	NXGFoaDU7jOeGu18tKH9OfKVOe26
X-Google-Smtp-Source: ABdhPJyHeAhyq90Hw33BP93AMzx+wEo1MdvVb9FmV0StgvoewtulFfAzNG2O4KMOTxThoXtAhLT44g==
X-Received: by 2002:a17:902:6ac9:: with SMTP id i9mr2726606plt.128.1598911912064;
        Mon, 31 Aug 2020 15:11:52 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.141.89])
        by smtp.gmail.com with ESMTPSA id 2sm590033pjg.32.2020.08.31.15.11.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 15:11:50 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] target: Push BQL on ->cpu_exec_interrupt down into
 per-arch implementation
To: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Sarah Harris <S.E.Harris@kent.ac.uk>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Eduardo Habkost <ehabkost@redhat.com>,
 Marek Vasut <marex@denx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 "open list:S390 TCG CPUs" <qemu-s390x@nongnu.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Michael Rolnik <mrolnik@gmail.com>, pbonzini@redhat.com,
 Stafford Horne <shorne@gmail.com>, alex.bennee@linaro.org,
 David Gibson <david@gibson.dropbear.id.au>,
 "open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, Palmer Dabbelt <palmer@dabbelt.com>,
 peter.puhov@linaro.org, Aurelien Jarno <aurelien@aurel32.net>
References: <20200819182856.4893-1-robert.foley@linaro.org>
 <20200819182856.4893-8-robert.foley@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <42dc8454-9835-fc52-a7e2-73835672f3f9@linaro.org>
Date: Mon, 31 Aug 2020 15:11:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200819182856.4893-8-robert.foley@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Bz3qqZkdDKFf

On 8/19/20 11:28 AM, Robert Foley wrote:
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 499a8bdc5e..c4e54baa6f 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -599,7 +599,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>             True when it is, and we should restart on a new TB,
>             and via longjmp via cpu_loop_exit.  */
>          else {
> -            qemu_mutex_lock_iothread();
>              if (cc->cpu_exec_interrupt(cpu, interrupt_request)) {
>                  replay_interrupt();
>                  /*
> @@ -614,7 +613,6 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>              /* The target hook may have updated the 'cpu->interrupt_request';
>               * reload the 'interrupt_request' value */
>              interrupt_request = cpu_interrupt_request(cpu);
> -            qemu_mutex_unlock_iothread();
>          }
>          if (interrupt_request & CPU_INTERRUPT_EXITTB) {
>              cpu_reset_interrupt(cpu, CPU_INTERRUPT_EXITTB);

I think you need a change to patch 5, because this patch reduces the scope
further, around cpu_interrupt_request, etc.

I think patch 5 should have

+    bool success;
+    qemu_mutex_lock_iothread();
+    success = cc->cpu_exec_interrupt(cpu, interrupt_request);
+    qemu_mutex_unlok_iothread();
+    if (success) {
-    if (cc->cpu_exec_interrupt(cpu, interrupt_request)) {

That way this patch maintains the scope of the lock.


r~
