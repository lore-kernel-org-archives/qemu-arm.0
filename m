Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp286053ejx;
        Thu, 1 Dec 2022 02:55:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5oclRBW/eMLjYpsxO9nqcU53ZOpYmzfimEaaVJa4aaLwWugQqnWTUTGi0DEq3rmOq2amHX
X-Received: by 2002:a05:6214:3246:b0:4c7:3114:b20e with SMTP id mt6-20020a056214324600b004c73114b20emr975314qvb.48.1669892145431;
        Thu, 01 Dec 2022 02:55:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1669892145; cv=none;
        d=google.com; s=arc-20160816;
        b=PWjUefV70yzU5E8ln6isFkEw/fdWNs++6EzdX/I74ld6ITigkMcztRNxmv7QnrmNnv
         XDF7wc3zugGsW9kaR/XUBxNcU/dsd5F7S162FkzOcXSdSmyIhS27FGH1ldIeBD3EtYHX
         oZcX4KVi7oD9vvPygRGOVKXmnc7VKUg/YO4Nqw48D+wuk6Z6QKzoY+aX2Awmy2m9ef+8
         dxu3y/UkcMiCv1+v79omahNyI1uuS9QW0xKXg+pSE0qo5c/pNjXTYEbax1pnemRChQfe
         l+EY4iVucj2/qRknrtDr8hU5wIv69wR78IWToQhVx2II/pA8ompKudW7AuT0IuM+SZV+
         39nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=HYhA+2MgskD82Ci9dtBI+xdxX2AiiS9T6VnsRFJcu5c=;
        b=BR2U+WZ7EQz7ShqHxrx2wf3+CGBWLcgbW5V3h8NX5GCDg0Q3eJlkDWpBU9SNT+fzgY
         16QltslXLhbzxD2O8KMBLOU7lNINiPUaq36ts5yiO/Ozur7aXeZUA55VVGDMtiv1ED/b
         2MKdYc5wAyLGDM4V5F/Mcal6G9/tSDOrXw0jkh+aKj18+T7yTxaix/4dN9XWzQ70on3C
         ZEW72nGgST42wu/gOYxzeTO8gbAPBLJLd0+59NbALOtV0G0vX6WZcDeBuXiu5NnetOWR
         t8lt2Tnt0wQCYYWJFhedljAQMqOCwP+tQ99L9U1g4WNx2lQ1kmcQyq6oNuWviT8tKzEl
         Gxkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PE+UMPWI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g3-20020ac87743000000b00390c5a13497si2038575qtu.43.2022.12.01.02.55.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Dec 2022 02:55:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=PE+UMPWI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p0hE5-0002lE-9N; Thu, 01 Dec 2022 05:55:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1p0hE4-0002l2-6s
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 05:55:32 -0500
Received: from mail-yb1-xb2d.google.com ([2607:f8b0:4864:20::b2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <tkutergin@gmail.com>)
 id 1p0hE1-0003VL-S2
 for qemu-arm@nongnu.org; Thu, 01 Dec 2022 05:55:31 -0500
Received: by mail-yb1-xb2d.google.com with SMTP id z192so1578712yba.0
 for <qemu-arm@nongnu.org>; Thu, 01 Dec 2022 02:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HYhA+2MgskD82Ci9dtBI+xdxX2AiiS9T6VnsRFJcu5c=;
 b=PE+UMPWI8iDHnwBMbxbp9Wat+WnC4oSKCjgNsuCWSnF7z83HuhMAspCqJxClFYaq02
 EhzO6BkPuj5eWnrbX+jDtMmHE/u9qQM2Wz1Hl+t0AG9oPBPZVxpSoKuXgwPOS3lQE5Mp
 HvAC7jpxAYdRrvDSTxy1QHHnAqmx1aFxqsIcIJr44PMnQhHzHCNBM6Z2dPmuEB7/sdIT
 oZKtO0R4Mfb4XjcrxpHRqLJxLrG/oBYi6IHt9/MEHRQ5RJoNb94QtcTprOEJKtgJEcT5
 Sacp/BYZ19j1cjWX37BJS5r2G5uyBNCoptXfWuey90Mhwhvi9gQP+3l8P5jYdYo8JGil
 Jflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HYhA+2MgskD82Ci9dtBI+xdxX2AiiS9T6VnsRFJcu5c=;
 b=nT28xlnbKaUniI1n4zM/JikFEiwViqpylqYGSW0VIlwKBsaY31yUWvBWJhX78gbhpO
 OvnSHvKksH1BGwq0AJkQogCF8SNrvXt/BytSZSMpFHQeclzjFJ9X3+hMOAqR2HVsxc+k
 XlTV5gMt3SZULmrIW8Rrr4Byh0suwnzmZanx1QTkLcwDwpTmg+TaAbDK0ImLjPPcvYwz
 k4bOZfrKclpwj7OPI2w1/VUSnMkaMp55578LrqeeGcbQNBtFdrxPjeU6KBneUwDd7JC6
 1RUFSG8qzGgAJE9ScrwmKWoFKFSKpgqHL8Pc2kvHywrFum2ZpJ1KH1pQZ2g5DwQj/aaX
 VuWA==
X-Gm-Message-State: ANoB5pkbIHFmVdrC0ywYLICJCphmGgzczfZbkibrzqGvNaIy7aj4zq4b
 pGMfAaoIkF2r5/SGHw5FOmAKGfDEVS3PmHBmQcIRekgo+aA=
X-Received: by 2002:a25:40d4:0:b0:6f0:118d:f77c with SMTP id
 n203-20020a2540d4000000b006f0118df77cmr38853151yba.205.1669892128262; Thu, 01
 Dec 2022 02:55:28 -0800 (PST)
MIME-Version: 1.0
From: Timofey Kutergin <tkutergin@gmail.com>
Date: Thu, 1 Dec 2022 13:55:17 +0300
Message-ID: <CACKEeROyAvp+rjRZxExQ1kX_Fb_Yn1h-4DHpp7ryGKYJ0TcCAw@mail.gmail.com>
Subject: cortex-a55/a75/a76 MPIDR_EL1 specifica
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000001e4dc405eec20f44"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2d;
 envelope-from=tkutergin@gmail.com; helo=mail-yb1-xb2d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Sz7zPWXc16c8

--0000000000001e4dc405eec20f44
Content-Type: text/plain; charset="UTF-8"

Dear all,

After submitting a patch for cortex-a55 support and trying to run SMP on
odroid-c4 I have found concern about mpidr_el1 register.

cortex-a55 (and also a75/76/78) seem to be considered SMT CPUs with single
SMT thread. As a result,
they publish core numbers in AFF1 rather than in AFF0 and AFF0 is always
zero. In the cortex-a55 TRM:

Aff1, [11:8] Part of Affinity level 1. Third highest level affinity field.
  CPUID. Identification number for each CPU in the Cortex-A55 cluster:
  0x0 MP1: CPUID: 0. to
  0x7 MP8: CPUID: 7.
Aff0, [7:0]
  Affinity level 0. The level identifies individual threads within a
multi-threaded core. The
  Cortex-A55 core is single-threaded, so this field has the value 0x00.

Plus MT (bit 24) is set to 1.

But it seems that qemu does not take it into account. Is this intentional?
Does it make sense to change this behaviour to something closer to
real CPU ?

--0000000000001e4dc405eec20f44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear all,=C2=A0<div><br></div><div><div>After submitting a=
 patch=C2=A0for cortex-a55 support and trying to run SMP on odroid-c4 I hav=
e found concern about mpidr_el1 register.</div><div><br></div><div>cortex-a=
55 (and also a75/76/78) seem to be considered SMT CPUs with single SMT thre=
ad. As a result,</div><div>they publish core numbers in AFF1 rather than in=
 AFF0 and AFF0 is always zero. In the cortex-a55 TRM:<br><br>Aff1, [11:8] P=
art of Affinity level 1. Third highest level affinity field.<br>=C2=A0 CPUI=
D. Identification number for each CPU in the Cortex-A55 cluster:<br>=C2=A0 =
0x0 MP1: CPUID: 0. to<br>=C2=A0 0x7 MP8: CPUID: 7.<br>Aff0, [7:0]<br>=C2=A0=
 Affinity level 0. The level identifies individual threads within a multi-t=
hreaded core. The<br>=C2=A0 Cortex-A55 core is single-threaded, so this fie=
ld has the value 0x00.<br><br>Plus MT (bit 24) is set to 1.<br><br>But it s=
eems that qemu does not take it into account. Is this intentional? Does it =
make sense to change this behaviour to something closer to</div><div>real C=
PU ?</div><div><br></div></div></div>

--0000000000001e4dc405eec20f44--
