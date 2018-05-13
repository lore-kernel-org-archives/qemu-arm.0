Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp2899561wme;
        Sun, 13 May 2018 02:58:09 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrEDcmIksBFLsU0bAECy/8W5SNDGSHK4fctoPz1UABkRt/8NXC1APML5Gif/SfC9haGVFkM
X-Received: by 2002:a37:c558:: with SMTP id p85-v6mr4301961qki.221.1526205489687;
        Sun, 13 May 2018 02:58:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526205489; cv=none;
        d=google.com; s=arc-20160816;
        b=SazzEZQIozcxirtbaWM1rn20ZK8GcGWuHA+IjrNzl2ONj7CHWbiKHzyuuKBETIGV/p
         LrRQI/v7fpr7FpatzjEgY01sXKbAqlZHTdIQWhdw1/ZjHh6X1t/R3RKCmJ0HzkYhG3Tt
         nBfDqxpja1mRlrSrrC9jDmOjZjIb6jwYYWaaq6NrwnBiQSX9Ipc5CuQjyDJ4+aVM9HuL
         lu6H5OFvFEbFeWhT5yqQ4M3dNhQ5Xl3+FK6QhqO6rWCSy7X7AsyuVy23f7M3k/Dh0HQs
         z2yj5mOQsfmDALIPFhzQbxf6ov7E/A68N4ee0YKM5pxrhvgknGIA2FW9cfJjamvrGDl1
         DHgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=LTEiQaLTFeMejX1Khp+3uBhH2KUP4g25deyAw688zhA=;
        b=lwjT+R/1eoUnFjnLB/OWWJz6XbH2ibSSRM0TN8LJ6CAULqoAk+Ywd3LM4hb4hqf+lY
         Ooc78iHRsg+k++God/hB7/X5aZ+3FDGps3rTPvDbU53Q8Iqou8eR7pFuvIL+3bKZeErp
         4z39DBtyn8jKzbxp3ZA0HTUZc+NL1oRdF+BzoLCMDRuMbqtxhsRlIXVMaRqBJogV9F/e
         Z6PycCLXZzo/zGR2chAkMQ+R8eWN62i0tvoS5aCyyL/asliWXhmNrsjMYx87zkKfutF5
         PUuPQowmI4UVlWTlGXRFcep/ADW7OZW301YJweptjRlhUXUJwRDpGSF9TJR+mtaA26xi
         Kukg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x64-v6si3225709qvx.96.2018.05.13.02.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 13 May 2018 02:58:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56702 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fHnlZ-0002nY-8f
	for alex.bennee@linaro.org; Sun, 13 May 2018 05:58:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40180)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1fHnlS-0002gl-2q
	for qemu-arm@nongnu.org; Sun, 13 May 2018 05:58:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1fHnlN-00074V-4f
	for qemu-arm@nongnu.org; Sun, 13 May 2018 05:58:02 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:41950
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1fHnlM-00073c-Tg; Sun, 13 May 2018 05:57:57 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 62115DAC719;
	Sun, 13 May 2018 11:57:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xiyt6Gz6AotQ; Sun, 13 May 2018 11:57:51 +0200 (CEST)
Received: from [192.168.178.24] (p5B151186.dip0.t-ipconnect.de [91.21.17.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
	bits)) (No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 7BC33DAC714; 
	Sun, 13 May 2018 11:57:51 +0200 (CEST)
To: Peter Maydell <peter.maydell@linaro.org>,
	QEMU Developer <qemu-devel@nongnu.org>
References: <20180513090613.27960-1-sw@weilnetz.de>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
Date: Sun, 13 May 2018 11:57:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180513090613.27960-1-sw@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-arm] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro
 for QEMU
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dAY8Kf8qICCn

Am 13.05.2018 um 11:06 schrieb Stefan Weil:
> It now prevents compiler warnings (enabled with -Wimplicit-fallthrough=
> or -Wextra) as intended.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
> 
> I suggest to add and use a similar macro QEMU_FALLTHROUGH()
> for the rest of the code and can provide a patch if that's
> fine for everyone.
> 
> Regards
> Stefan
> 
>  disas/libvixl/vixl/globals.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/disas/libvixl/vixl/globals.h b/disas/libvixl/vixl/globals.h
> index 61dc9f7f7e..33c4231d91 100644
> --- a/disas/libvixl/vixl/globals.h
> +++ b/disas/libvixl/vixl/globals.h
> @@ -112,6 +112,8 @@ inline void USE(T1, T2, T3, T4) {}
>  // C++11(201103L).
>  #if __has_warning("-Wimplicit-fallthrough") && __cplusplus >= 201103L
>    #define VIXL_FALLTHROUGH() [[clang::fallthrough]] //NOLINT
> +#elif defined(__GNUC__)
> +  #define VIXL_FALLTHROUGH() __attribute__((fallthrough))
>  #else
>    #define VIXL_FALLTHROUGH() do {} while (0)
>  #endif


Even with the above patch, disas/libvixl raises a compiler warning for a
fall through case. The patch below fixes that warning, but I am not sure
whether a fall through is correct there.

Stefan


diff --git a/disas/libvixl/vixl/a64/disasm-a64.cc
b/disas/libvixl/vixl/a64/disasm-a64.cc
index 7a58a5c087..5481d94209 100644
--- a/disas/libvixl/vixl/a64/disasm-a64.cc
+++ b/disas/libvixl/vixl/a64/disasm-a64.cc
@@ -2986,6 +2986,7 @@ int Disassembler::SubstituteImmediateField(const
Instruction* instr,
           return 3;
         }
       }
+      VIXL_FALLTHROUGH(); // ???
     }
     case 'C': {  // ICondB - Immediate Conditional Branch.
       int64_t offset = instr->ImmCondBranch() << 2;

