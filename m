Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp1306777njk;
        Fri, 29 Nov 2024 22:14:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWaLT6BuLU3eRc9nTBp+rDmaukxhT5xhFv/2zEegRw9zzsQZm+fm7VzKQsaCBa6RAEGI2LrAmMtaAab3A==@linaro.org
X-Google-Smtp-Source: AGHT+IGrkEq0SoX/7TaQbXG4YkH8JDSfGXVXiairC6mrAiAKP3Qa5EyK7kRhDkcPjtKRIfHGQAkK
X-Received: by 2002:ac8:5f14:0:b0:466:a9e6:6d6b with SMTP id d75a77b69052e-466b3516260mr192673871cf.15.1732947254531;
        Fri, 29 Nov 2024 22:14:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732947254; cv=none;
        d=google.com; s=arc-20240605;
        b=BXOUL/ojithVfqW/mVar3+8f5UFvoeSLg/yB05/Tz5SMglCEhxJBqVDOfRw7jEuVpj
         I4MG/HfgEZceHHASaOuZiwAML/jgz7xv7F/24l00wY00JRkRPZFDie7i1OZIeXWymkXd
         aOn9KPPQXrxptwWXumRdD832lMatPKdNVMY8c77lRIBaTzsUVIJ5mwHrIykl+I5Gm5wG
         1GrHsuR0dYCPNC2t3vBkHoNqBxkAentNj1soiMr7WZariDZOuWf3KLMnkX3S0AyxSm8t
         bMIBAG1R7U72DMTgTlfvEpipSkY6RXdeNQQleDWJUC+MpYeyUjvY+vn17szAWPce8GRs
         cv8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0cSOkNFUc4ZXADQXD91Veo1S7vpMMbKlSC76D0xMA+M=;
        fh=osJmwBNFs8kQnsiGeGhBh1YZovnulI9PZ9CzY211BZA=;
        b=OR1wm3OdIyk/CVJFABZn2s03/BBD5W2OsvY3MGnnM3o3CIZTmc3Pc2fPjLxk6NR9mJ
         3MjNrDrwdOgmshn6hOz+k/yNVZ1urcPApHfREy7xOuqrrK88Zd26osCchIXaJjsEr2Ur
         2i63gEr3yHzpaet33obs7p7g9876Xxn8as5mKVlPIJa85gWRAlIGlH8t87lUqshkcVnZ
         V2NFVt7gFQyu5DqvL1qIUMLigm7UC6uuS8rVpwjwUN9bX1OgbnmAl5Cba8NAh0L+ENlA
         KZ/vuEuFxgLflKTH+GMqSAPt0URS8Wkxru3WpFsIdYxf241pmgzwALNtbHx4U+RxLygp
         LAwA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=UPya3VdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c4227114si68502321cf.438.2024.11.29.22.14.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2024 22:14:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=UPya3VdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tHGj6-0003D0-55; Sat, 30 Nov 2024 01:13:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGj1-0003Bw-9a
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:13:03 -0500
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1tHGix-0001qj-GN
 for qemu-arm@nongnu.org; Sat, 30 Nov 2024 01:13:02 -0500
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-21210eaa803so22097605ad.2
 for <qemu-arm@nongnu.org>; Fri, 29 Nov 2024 22:12:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1732947173; x=1733551973;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0cSOkNFUc4ZXADQXD91Veo1S7vpMMbKlSC76D0xMA+M=;
 b=UPya3VdAxviY50Ha7ggpzcK4vQh9s1m/UV0ZwH+aOUSKLXnY788VYKmm96zEWpYMzj
 54A3cxg6by8E+NUk+X2WC8oXmyVeQU5fZk9UhptZR7szMT+ZDPo+hOlis9m+mZ2KTYzc
 OO+Ptlh1JTYcYoWfK44Si7QndssJk2N//mXz3fnf2pvu18bifGEbcVCIrvDi0oQHOS6B
 5UsPt94VvkDfgxM05MpI28eBWdnJCi0lHz2g56iDE7jYwF5P1FSajIFyzIe2Vu4/zwac
 4Tr++nh+OeZdg2eVtzVlTlh5zKM9CHcrEWS+K4VpEwEb9CdrLKkY/yCNPgh0GCIqxCFF
 8p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732947173; x=1733551973;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0cSOkNFUc4ZXADQXD91Veo1S7vpMMbKlSC76D0xMA+M=;
 b=rr0lBiJqmJlFLQyeIlmOestNKI1wCcNAJ8dlu87Tu+WTuNI6+BNgfcsH64k+KPmDis
 xhm9cQptSqnnPivQHitBjMDz/H8rdyCtEx4T7ivMHRn8oIc/GZTaLRc63b9dGNorOQtV
 1YlWhA5Ad3PsyD+nvyzPwTpDabTZug6XvWy+QcratHrp/tR6Oz+G6Lp042HBkaNSPCsJ
 4yIUl9IfVsVmDWdU1HkWeGqr0X/SA5dS8DgTM4wUAfPJ/TYiSxLcyuxUFASzIKfrnRZR
 Gz9DDLlCZppJgXrnLP/D2A80w9EAJse+rNzrenZSaVITKY1PrJXxB9w142ivjbLzHTkd
 hv9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJ4MOcn0GxLPGxx/gX6dQHuim79hmLG8jDrGSqR4Py2GGRT8afqugFFofbw/PdnZZhzlutL+y4lQ==@nongnu.org
X-Gm-Message-State: AOJu0YygzjcxwXqrDeoa6bq4I/5ZQCYdPcbN3tZrGQWZxM2n0s3+N+6d
 pfY4f16l7Y2hhpF2oJxE+jWhvb0n+68taFbiTJAuOOAF4utu0f3UxA9LyamhNv0=
X-Gm-Gg: ASbGnctmFexSirmcN83X4aiKqYf+KPCnhe8ZXZQXK1cSaRwHFFuIh/o5Y9j4hP21wc9
 BM3KRxxprbsdt+IKOYE74xDx1YPB20s1QBMay4qCHNF84AmF25Wy9qj3EZoltDg1F+exGz1CA+H
 cfO8A2qgLlnifBMr7PF7RUEN8GY4VbLnPbbPQHaRIEXewLUMzo004WLIgUc3EcTLfUOdp4ZolyS
 eRzVadmzuDDWlXanrGfA3HmiNAvEoq8Bho4agP/fV/q1rKfpyPzAq7xDWuWVbY=
X-Received: by 2002:a17:903:2381:b0:20c:89b1:e76c with SMTP id
 d9443c01a7336-2150138506cmr193276565ad.30.1732947173233; 
 Fri, 29 Nov 2024 22:12:53 -0800 (PST)
Received: from [157.82.207.167] ([157.82.207.167])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-215219672e7sm40136055ad.130.2024.11.29.22.12.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Nov 2024 22:12:52 -0800 (PST)
Message-ID: <28237c12-4420-405f-9d30-d1578e0155c2@daynix.com>
Date: Sat, 30 Nov 2024 15:12:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 01/15] ui & main loop: Redesign of system-specific
 main thread event handling
To: Phil Dennis-Jordan <phil@philjordan.eu>, qemu-devel@nongnu.org
Cc: agraf@csgraf.de, peter.maydell@linaro.org, pbonzini@redhat.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, stefanha@redhat.com,
 mst@redhat.com, slp@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, gaosong@loongson.cn,
 jiaxun.yang@flygoat.com, chenhuacai@kernel.org, kwolf@redhat.com,
 hreitz@redhat.com, philmd@linaro.org, shorne@gmail.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bmeng.cn@gmail.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, jcmvbkbc@gmail.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-block@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu
References: <20241129152506.59390-1-phil@philjordan.eu>
 <20241129152506.59390-2-phil@philjordan.eu>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20241129152506.59390-2-phil@philjordan.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: feaGnvsUmNE9

On 2024/11/30 0:24, Phil Dennis-Jordan wrote:
> macOS's Cocoa event handling must be done on the initial (main) thread
> of the process. Furthermore, if library or application code uses
> libdispatch, the main dispatch queue must be handling events on the main
> thread as well.
> 
> So far, this has affected Qemu in both the Cocoa and SDL UIs, although
> in different ways: the Cocoa UI replaces the default qemu_main function
> with one that spins Qemu's internal main event loop off onto a
> background thread. SDL (which uses Cocoa internally) on the other hand
> uses a polling approach within Qemu's main event loop. Events are
> polled during the SDL UI's dpy_refresh callback, which happens to run
> on the main thread by default.
> 
> As UIs are mutually exclusive, this works OK as long as nothing else
> needs platform-native event handling. In the next patch, a new device is
> introduced based on the ParavirtualizedGraphics.framework in macOS.
> This uses libdispatch internally, and only works when events are being
> handled on the main runloop. With the current system, it works when
> using either the Cocoa or the SDL UI. However, it does not when running
> headless. Moreover, any attempt to install a similar scheme to the
> Cocoa UI's main thread replacement fails when combined with the SDL
> UI.
> 
> This change tidies up main thread management to be more flexible.
> 
>   * The qemu_main global function pointer is a custom function for the
>     main thread, and it may now be NULL. When it is, the main thread
>     runs the main Qemu loop. This represents the traditional setup.
>   * When non-null, spawning the main Qemu event loop on a separate
>     thread is now done centrally rather than inside the Cocoa UI code.
>   * For most platforms, qemu_main is indeed NULL by default, but on
>     Darwin, it defaults to a function that runs the CFRunLoop.
>   * The Cocoa UI sets qemu_main to a function which runs the
>     NSApplication event handling runloop, as is usual for a Cocoa app.
>   * The SDL UI overrides the qemu_main function to NULL, thus
>     specifying that Qemu's main loop must run on the main
>     thread.
>   * The GTK UI also overrides the qemu_main function to NULL.
>   * For other UIs, or in the absence of UIs, the platform's default
>     behaviour is followed.
> 
> This means that on macOS, the platform's runloop events are always
> handled, regardless of chosen UI. The new PV graphics device will
> thus work in all configurations. There is no functional change on other
> operating systems.
> 
> Implementing this via a global function pointer variable is a bit
> ugly, but it's probably worth investigating the existing UI thread rule
> violations in the SDL (e.g. #2537) and GTK+ back-ends. Fixing those
> issues might precipitate requirements similar but not identical to those
> of the Cocoa UI; hopefully we'll see some kind of pattern emerge, which
> can then be used as a basis for an overhaul. (In fact, it may turn
> out to be simplest to split the UI/native platform event thread from the
> QEMU main event loop on all platforms, with any UI or even none at all.)
> 
> Signed-off-by: Phil Dennis-Jordan <phil@philjordan.eu>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Tested-by: Akihiko Odaki <akihiko.odaki@daynix.com>
