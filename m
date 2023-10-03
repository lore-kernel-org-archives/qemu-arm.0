Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2265242ejb;
        Tue, 3 Oct 2023 14:58:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfKyxGTf0a05o6Q/v1YM0aJZfnOF56cfn8J0zv8IGfxTBfZxnz83UJP1Mkp0TbVlHWFTyH
X-Received: by 2002:a05:622a:1d1:b0:417:8ce7:7467 with SMTP id t17-20020a05622a01d100b004178ce77467mr717393qtw.45.1696370298828;
        Tue, 03 Oct 2023 14:58:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696370298; cv=none;
        d=google.com; s=arc-20160816;
        b=Vc5Nvq6J6wXljsHEhPKTbnGgKPd8Ic07iou+N8zsGLe9xW3sNTUSt16kkuGoeAUh0I
         WNJJcN+b55FeJ2WsbcsDVOoacR8GC2UVRR0ZSLE8wfj/1Velojd4LgogOQ4ri91JIho0
         1GBV0iruMqsQ+vDS5Uc3yXqjFZ4+K/qFB0Q4xiQNnOWiY5YfZiNAmDh92J1scAS9rhMG
         iuEnPU7iVcr66Fy9p49o6fGemybNH06UCX+t5TKI1yJgHhImxDdwHaEtzqlyDWZv4t56
         uyX5ocm1C3XaNa2QqDsK5THfxY9pM9EHjUQ1UNkwgFZw8e5dw+WyWfKs2Ii+t2i9S1QK
         Vlyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Fmd0ruSXRQF78BEiAtGvhQnasV8gj9hL8DDa8uFmDi0=;
        fh=DBwo5oYV+Zl89FPcGyBzo6mnqwnGCoM6YpiQGc4/RNc=;
        b=KP8CwHbP9f1+gJO8KyZwKHIDyQYmhOz3Hv0DThhoafKb4gzXvSG4LUIWk2UYuHyFpd
         Q8CvbGaFyuWUUzT7Ht7HLFfvFMTArF1PKMwO07+JPBy0ji5o8GABCriu5X0YEMtcLmFz
         G9u/fmXnpiE7471UbMzVEOErUtsYkRo3/4LpC8hoBRwJvh6bJQgiLuGbs+hOVsOj3ni5
         1MSIQ+Y5rbTsedPNtxhM+6u8aH0JOacGBwjBIsY1dV+QSOybjPZycbHXnyS/zFIR9iU8
         DLaEHNucTEvKJh7AJncTVhy7jBAjW5JU06JpkD7AD7VC9xrTIwI0UVJRtlO1q+rUAaBL
         FHNA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q2SqXSXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020a05620a280900b00775c5458f6esi683142qkp.267.2023.10.03.14.58.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Oct 2023 14:58:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=Q2SqXSXa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qnnP0-000704-TY; Tue, 03 Oct 2023 17:58:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hossein.masoumibadakhsh@gmail.com>)
 id 1qnmoE-0001Jz-2b
 for qemu-arm@nongnu.org; Tue, 03 Oct 2023 17:20:02 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hossein.masoumibadakhsh@gmail.com>)
 id 1qnmoC-00032N-6R
 for qemu-arm@nongnu.org; Tue, 03 Oct 2023 17:20:01 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so2480914a12.1
 for <qemu-arm@nongnu.org>; Tue, 03 Oct 2023 14:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696367993; x=1696972793; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Fmd0ruSXRQF78BEiAtGvhQnasV8gj9hL8DDa8uFmDi0=;
 b=Q2SqXSXaXVSAHJG55/P6osA1rQTwTnYl1x6zX/ZMJijef2WE7QiSfVxyJwm0beRbYj
 P3rxNCLLI4959kQD2cdDh3U+t+UC84lO8n3uz+iolxe06ST1WX2pLc+rW5T5g6a/xULT
 j032F5hZIgl771w23QiMRV7exSBSJTGOjFXimoTIJsA9etnCjTpErzczNcq3+Kf/ef+Y
 gSCVxWvCGDovXjqESvwbhiDbE8vd5tXavyUCeXZa1LTetuOSeR2TUiwpOa4a+MJViZA3
 sHrg1gBmBbb/x5e4dtRCL1L9SAE3MbaaiB6on6Ea9Q4v/k+wVJ36sq7Zjpr17kXw5xFP
 SR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696367993; x=1696972793;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Fmd0ruSXRQF78BEiAtGvhQnasV8gj9hL8DDa8uFmDi0=;
 b=cCsrSBJf8Y8/s1zbBbSE5Clzn8MDVUuVEyyT7R92ZkQipZyX+50M6Oq/RR3yr1iH4w
 h9OWV4SDrO7TywaQ3KttCHdHLGoH2lGAFoMn5OQ6rnFCy697r/IGAt/C2RNFWHXCzMBp
 8d0/xwr1npMHQNErW02v9MsPJfQUe/qN9oTOxyOKbZKcbeOXAuFcopFJ9l59JxtgipQQ
 //ChuJWqSlkX7jfIeyaZJ1Gv/KlJQT7+dZwHgSn6UNSHAI1EBL7zoIWIpfeUn5+TzEUI
 Vqd9/TL/aI3duIafRJyXMO5IOcU0lry84v8BK1TwcIvsNirebLcnZCbK+8nlH1JzZ2RN
 zfFg==
X-Gm-Message-State: AOJu0YxFhjaSMHOPuCD++pMC4fFOiMhQfdUj+2tddD+qGoFYszy3R0Wl
 pt7VCSh/UCbG3Y9il2m/sImulzzmuOq1IMRwQl6f5X1PJ50=
X-Received: by 2002:a50:ee19:0:b0:522:38cb:d8cb with SMTP id
 g25-20020a50ee19000000b0052238cbd8cbmr308353eds.20.1696367993043; Tue, 03 Oct
 2023 14:19:53 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?2LnZgdiqINmF2LnYtdmI2YXbjA==?=
 <hossein.masoumibadakhsh@gmail.com>
Date: Tue, 3 Oct 2023 17:19:42 -0400
Message-ID: <CADEoQcGkfLxkKoLe6guVK=UG17W3hRGay_NWWi0k5Le__48pjA@mail.gmail.com>
Subject: Software emulator for ARM Corstone-500
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000a23dc60606d67399"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=hossein.masoumibadakhsh@gmail.com; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 03 Oct 2023 17:58:02 -0400
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
X-TUID: 9i+z3fIqlfO2

--000000000000a23dc60606d67399
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I am looking for a software emulator compatible with the ARM Corstone-500
(SSE-500) board, enabling me to run software on it in bare-metal mode. I
could find the ARM SSE-300 board on the QEMU repo, but it seems that it
does not currently support SSE-500. Is there any instructions/tutorial on
how to add a new ARM board to QEMU?

Thank you!

--000000000000a23dc60606d67399
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><div dir="ltr"><div style="max-width:800px"><div><p>Hi everyone,</p><p>I
  am looking for a software emulator compatible with the ARM 
Corstone-500  (SSE-500)  board, enabling me to run software on it in 
bare-metal mode. I could find the ARM SSE-300 board on the QEMU repo, but it seems that it does not
 currently  support SSE-500. Is there any instructions/tutorial on how to add a new ARM board to QEMU?<br></p><p>Thank you!</p></div></div></div></div>

--000000000000a23dc60606d67399--
