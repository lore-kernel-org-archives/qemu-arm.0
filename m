Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1030792ejb;
        Mon, 18 Mar 2024 19:55:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmNZDfPr+udMXDYBnfQsscZhiOAh6gZC008nwuBHThCNrcIAjdq4d2TkOMimgqdgl2I3CPjLMr8AzqBQZi0kkcsRCEQTAq
X-Google-Smtp-Source: AGHT+IH9MKK/83/VGi+jNO/Uqt7u2nY6YmadCtJHXU3y4ClRdnsybugIgdP4smLedB0BmhEpAPn2
X-Received: by 2002:a05:620a:8010:b0:789:e14c:5d00 with SMTP id ee16-20020a05620a801000b00789e14c5d00mr17397081qkb.28.1710816935816;
        Mon, 18 Mar 2024 19:55:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710816935; cv=none;
        d=google.com; s=arc-20160816;
        b=YZxSRWgg/wOeGvR03oATSNYEOsszV9XjYoWknELAzFGrQBlZFCd3plbH7mdoCePNZU
         aadNpfZrVjTFduFaecIi+Hc+ajJaMRncCVDcuauIo/lWA72ySYf5pGZ0elOjhuFl1u+p
         DJx8Wk70mhjo+vtlFpqyHCFTYtneUkN0tmE5sZTgv/LAQ2EUWjkhjXZUTEYE35p6p3M4
         rIu4ahmGkv5/a5Ugalu3H+SS/7mGCRoliovBri552apuyI1B9uRrBdXrg1pfo1mWNwqt
         g4/xhEnzzc/Q/fWSX6iVly5BmGERCYuMO5R+Ksbzebt2FHs5LyoZUquvUZxmRaMKDXAt
         /gJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=LUFyKgFYLSCV3YFW5lpKa0Px1abb1/xX829AhzB9eRs=;
        fh=5E1giC0VznBfpv+3JklUSc7gVLiRWzSfv0ij67qlDNo=;
        b=te9ECvy7VzxuZUP77BI9C8mVs87ftgAW4ybFQnZhSr82UlbGZwdF0PfU9B5SDolH2Y
         oM8SRX+RzRmjkpfnCI65icqFA3+YAKtAA+A/Ex7/XYfEjAx8Vhb7ShadiUzuIh7gLYDH
         uiyHrqfVbhuSvtUHB7mdaQoYfGyWgz0XknHLjVf7T2hYbbspgv/+IRk5JT4YlRdvuBju
         w6gCP6yg01n51wsodyQtGhTlmp7CxjVwuQecalfDRR94cpsI9NYdpF3NHHF6zG5Mwypd
         m25r8c9vSYSAxTPKOJFbH8R/oX68vjum/6vBsWLPx+YkFp4EVrXa3r7LbPBqE5KtqCyg
         +HLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=CPpVOsUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10-20020a05620a210a00b00789eca5fc61si6427759qkl.14.2024.03.18.19.55.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Mar 2024 19:55:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20230601.gappssmtp.com header.s=20230601 header.b=CPpVOsUP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmPd0-0000Bq-IR; Mon, 18 Mar 2024 22:55:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rmPcx-00009i-FF
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 22:54:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1rmPcv-0004kE-W9
 for qemu-arm@nongnu.org; Mon, 18 Mar 2024 22:54:59 -0400
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6e6ade6a66aso4468926b3a.3
 for <qemu-arm@nongnu.org>; Mon, 18 Mar 2024 19:54:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1710816897; x=1711421697;
 darn=nongnu.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=LUFyKgFYLSCV3YFW5lpKa0Px1abb1/xX829AhzB9eRs=;
 b=CPpVOsUP0yDgy997TddVnr3znrwu4zF6F2VLnJJJ6xmKoUM2tRIBnpKeXLpl5aWc8c
 T94BDvWw3PwFZzKYgLlr5CYgwZ+e1x+1HzKdT0RoL5VpV/FEDkdQdklQpSQgOibze/h9
 GKTUJb3zj6762Qb3adFv5/xQbT0oWHD2+gsd0GgxUKFKlSpgSm/B3pJ+SpWCA56uuno4
 s1kuTYiddvm84zylqA1aAlxUBDepI62pIPMocuFf1Xa+QSlfSdwOznPp1pkSYMR+Pi3R
 cX2dPim80sZYsQCHFeu4ZepmOL22smPJyJhQd8kUNZm5NEkVC4gYsFfm+4oNKu1B9Y8S
 naJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710816897; x=1711421697;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=LUFyKgFYLSCV3YFW5lpKa0Px1abb1/xX829AhzB9eRs=;
 b=g29TorFNVpebYrczm6PteF/4QkoS7l9hItD0/cPUJFveMM2XCzxfq4Ic2e1NoO91+z
 n/jw/TIF4T02lqB1ogxFGnPbf0BkICYDKJenWJO+fJKZ4PlLCEciUkFC8ZkNVqWTMnTd
 Xnovpf7pCAiX30lCQteWn4fZPf2lNM9jhiXHIlNUy6w7D3mp8pOyENkEZghFsEaRphvi
 83kHdGsVjyKjtK2znQaf7ICOVkZqIjDauu3+QkBWI60YjxtyOIzpx14a0szIP2eCSA1Z
 fhrwYU5VjkIcCUfCRk/FVF/I+L3sswQFUHsiwhIqCxWAOCmCY5WbDgLbsGh6Wg93VqLC
 39sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoH8yvZmpJR7lVSQxpkRmvxaBYtURViBKiGCyODWP+gPMISg/oTnN+Gqqq2XJngYdwnUbgUmTXiDRsFfijeDGl/tH9
X-Gm-Message-State: AOJu0YwYYUuvXWWmNMxlqU6gheiwy8d0TSgqOQge2v0Pa3A/niVm+RIh
 mgF1/gStSheZHYvq5zFsiKALJaVqJIG/ZSKZzSxBwc0yCJn25JqPvK9xmDKRTr0=
X-Received: by 2002:a05:6a00:9a4:b0:6e6:98e4:99a1 with SMTP id
 u36-20020a056a0009a400b006e698e499a1mr16697544pfg.14.1710816896681; 
 Mon, 18 Mar 2024 19:54:56 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932?
 ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
 by smtp.gmail.com with ESMTPSA id
 z3-20020aa79e43000000b006e6fd17069fsm6188632pfq.37.2024.03.18.19.54.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Mar 2024 19:54:56 -0700 (PDT)
Message-ID: <f36ecb7c-5ce4-44e6-ad07-f8a82e4b8eeb@daynix.com>
Date: Tue, 19 Mar 2024 11:54:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.1 v2 3/3] ui/console: Add 'rotate_arcdegree' field
 to allow per-console rotation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20240318113140.88151-1-philmd@linaro.org>
 <20240318113140.88151-4-philmd@linaro.org>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20240318113140.88151-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::42a;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: l/KMnS8+JQcw

On 2024/03/18 20:31, Philippe Mathieu-Daudé wrote:
> Add the 'rotate_arcdegree' field to QemuGraphicConsole and
> remove the use of the 'graphic_rotate' global.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: Akihiko Odaki <akihiko.odaki@daynix.com>

> ---
>   ui/console.c | 15 +++++++++++----
>   1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/ui/console.c b/ui/console.c
> index 84aee76846..94624c37ae 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -37,7 +37,6 @@
>   #include "trace.h"
>   #include "exec/memory.h"
>   #include "qom/object.h"
> -#include "sysemu/sysemu.h"
>   
>   #include "console-priv.h"
>   
> @@ -51,6 +50,8 @@ typedef struct QemuGraphicConsole {
>   
>       QEMUCursor *cursor;
>       int cursor_x, cursor_y, cursor_on;
> +
> +    unsigned rotate_arcdegree;
>   } QemuGraphicConsole;
>   
>   typedef QemuConsoleClass QemuGraphicConsoleClass;
> @@ -210,17 +211,23 @@ void qemu_console_set_window_id(QemuConsole *con, int window_id)
>   
>   void qemu_console_set_rotate(QemuConsole *con, unsigned arcdegree)
>   {
> -    graphic_rotate = arcdegree;
> +    QemuGraphicConsole *gc = QEMU_GRAPHIC_CONSOLE(con);
> +
> +    gc->rotate_arcdegree = arcdegree;
>   }
>   
>   bool qemu_console_is_rotated(QemuConsole *con)
>   {
> -    return graphic_rotate != 0;
> +    QemuGraphicConsole *gc = QEMU_GRAPHIC_CONSOLE(con);
> +
> +    return gc->rotate_arcdegree != 0;
>   }
>   
>   unsigned qemu_console_get_rotate_arcdegree(QemuConsole *con)
>   {
> -    return graphic_rotate;
> +    QemuGraphicConsole *gc = QEMU_GRAPHIC_CONSOLE(con);
> +
> +    return gc->rotate_arcdegree;
>   }
>   
>   void graphic_hw_invalidate(QemuConsole *con)
