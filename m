Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3899353lfb;
        Mon, 30 Aug 2021 02:18:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLo63gjzM29rgkOeHNtOALodCommCQ02kyfCpSQ7cuipP3JyUnOGK1L9U+c2HKWCGJd8Hs
X-Received: by 2002:a25:2548:: with SMTP id l69mr23507918ybl.371.1630315112186;
        Mon, 30 Aug 2021 02:18:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630315112; cv=none;
        d=google.com; s=arc-20160816;
        b=M09p+M1hjZj4Kr5WjSj96DpsxJkT2I0WOrV8w+JdJsiaNjcL9RoJZI04w1nG1olRGv
         gDZGy+hy1wGVbpkNuXby0p10pa5Ekz4At3aRMHXO6pXgfWI7ghqDLb44uVbiyINbcMgS
         xBAdRIJwdCdPS6Oy/G06b83SMBGbE8kwM3GQg2VgID77NxmUsfpN9bVu02GLh/ZnQQj+
         D8EedRqYquLHv1BdNzy6UwbPo/gW9r1TfEokqJE0ui/KHUX8YM/2CSOMpncisTJ90wRq
         os5WMBciSTTBKlJXCVu15B8u/YaZg9pv18e0c5HZydUF1ugFyIYx5RLHJ3bnsgzt/Slv
         4cFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nGnWNeqjPZGVSMiwdYMev+aH1orq5xIssQR95XnHGgo=;
        b=PCVBC0dUllCTtbXHOg+l/tq/yx83oAhmNwCwaxe6yyb0K2e87QuDBwoeNzmuOme113
         u+wJE+68pe/5Yq1BxKoA87VZCuIltZKSKsOWluneXAYxz2wb9oM283N58tjw2RcCYBCo
         dO9zYuCbaZZuOL9VCJO3KLbR5zPnGDJJ1ZIsP21GF+nYhU5V9Wu2aQ3LOW4y/xVoV0LY
         bFHb2jAUPzahonxXkcUwdsmay3WQYSKjkpC504sMiomgNAoh8Vu0bMGzhUkdESH78FX4
         BE7RSQm73YqQA2jSNk81EmXNyw8VAeefD7T3h/yrafGcld4XAISBgmfgxuj6vdzM5569
         9Xbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/bD0xN0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d68si16801006ybi.175.2021.08.30.02.18.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Aug 2021 02:18:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Y/bD0xN0";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mKdR1-0008HP-FX
	for alex.bennee@linaro.org; Mon, 30 Aug 2021 05:18:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45514)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKdQj-0008DT-3m
 for qemu-arm@nongnu.org; Mon, 30 Aug 2021 05:18:13 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:45783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mKdQd-0000qc-Nw
 for qemu-arm@nongnu.org; Mon, 30 Aug 2021 05:18:12 -0400
Received: by mail-ej1-x632.google.com with SMTP id e21so29602858ejz.12
 for <qemu-arm@nongnu.org>; Mon, 30 Aug 2021 02:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=nGnWNeqjPZGVSMiwdYMev+aH1orq5xIssQR95XnHGgo=;
 b=Y/bD0xN0F3KQMD/mO2ZoCjWZOAGu0gCzm/guJmKeY7WmJf4DwQVwjGW4tZXY1yqAW0
 r59QFxvQT8Uyvkx2M7DRfMgtW1g86Pl9RrJzlq0V5rKNqrNwcBPFoesv3AAoT1IzffPU
 9rOf0/BiN28pyQfAGKILvFBM53I7zcXyMRYhuQDlY5JzuNC2+EgLN5A9jGUa+qWyD6iC
 NYFcgNX83oMMcE0OVF3eHVEddGYJs7n8sJCW/kThxy6IykKMXFA8u1YIkIIaJ0UgRcFI
 OdvQopckA0QT2haEH/Usts7N3FUEKExrp4tSpvkBbyTNOAwt3bl0Kr7dY8o2jaoVk/uz
 pk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=nGnWNeqjPZGVSMiwdYMev+aH1orq5xIssQR95XnHGgo=;
 b=aCN0U9iNoozgP+/cJzFbwLDn+aKZqewzf37oY4WGNrIA56LuWrHxuMyxaPFEOPaDDJ
 l4hJ3tZUpjuYHyiI4rutyFBq/1mFlUCKTUEMIwzVLCNVfvWxypejgDdTiX+qgbkLL+9n
 3EOu0gX8IINmwAL7mR0hgfrEaAs2cie7Of4kuvFpR2R1O9L7rIIBzWBmkrWG+jQ0FII5
 zsKL2zC6X3Q06NsO5LMZn56RdOgCca99VlrcWjAZXIf+fMb2Trp35SbKdbi+FcLufAlI
 yV5uVVLvHqAOS1YLxAukxWC1/AcBnhg3r9v9C73zV6zfPSGQalOVNDWfBG9l7PfBBFs5
 N5Dw==
X-Gm-Message-State: AOAM5309soD3Q89axNoTJCwcNltHUMi4mlW9hepylKCU1HLb1XvYemrJ
 Yj9rXKk0A5MnMoKZiHHqRLSD1BxY+pGYZDm3fkBcoC7lgq0a7Q==
X-Received: by 2002:a17:906:c085:: with SMTP id
 f5mr24641414ejz.250.1630315086142; 
 Mon, 30 Aug 2021 02:18:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210826131725.22449-1-peter.maydell@linaro.org>
 <20210826131725.22449-11-peter.maydell@linaro.org>
In-Reply-To: <20210826131725.22449-11-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Aug 2021 10:17:18 +0100
Message-ID: <CAFEAcA-hCtXa7OpHqhP6CAzvHg5n73j3XB=TuwHOoBV3JeAntA@mail.gmail.com>
Subject: Re: [PATCH v2 10/18] target/arm: Implement MVE FP max/min across
 vector
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jd7ISmfWVwzo

On Thu, 26 Aug 2021 at 14:17, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Implement the MVE VMAXNMV, VMINNMV, VMAXNMAV, VMINNMAV insns.  These
> calculate the maximum or minimum of floating point elements across a
> vector, starting with a value in a general purpose register and
> returning the result there.
>

> @@ -440,6 +444,10 @@ VMLADAV_S        1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
>  VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
>
>  {
> +  VMAXNMAV       1110 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
> +  VMINNMAV       1110 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
> +  VMAXNMV        1110 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
> +  VMINNMV        1110 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
>    VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
>    VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
>    VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
> @@ -449,6 +457,10 @@ VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz
>  }
>
>  {
> +  VMAXNMAV       1111 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
> +  VMINNMAV       1111 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
> +  VMAXNMV        1111 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
> +  VMINNMV        1111 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
>    VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
>    VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
>    VMLADAV_U      1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz

I just realized that I forgot to do part of Richard's review
comments on the first version of this patch, about adding some
extra [] blocks here.

https://patchew.org/QEMU/20210729111512.16541-1-peter.maydell@linaro.org/20210729111512.16541-46-peter.maydell@linaro.org/

Diff to squash in:

index 1a18c3b8eeb..a46372f8c77 100644
--- a/target/arm/mve.decode
+++ b/target/arm/mve.decode
@@ -444,25 +444,33 @@ VMLADAV_S        1110 1110 1111  ... 0 ... .
1111 . 0 . 0 ... 1 @vmladav_nosz
 VMLADAV_U        1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 1 @vmladav_nosz

 {
-  VMAXNMAV       1110 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
-  VMINNMAV       1110 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
-  VMAXNMV        1110 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
-  VMINNMV        1110 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
-  VMAXV_S        1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
-  VMINV_S        1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
-  VMAXAV         1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
-  VMINAV         1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  [
+    VMAXNMAV     1110 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
+    VMINNMAV     1110 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
+    VMAXNMV      1110 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=2
+    VMINNMV      1110 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=2
+  ]
+  [
+    VMAXV_S      1110 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+    VMINV_S      1110 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+    VMAXAV       1110 1110 1110  .. 00 ....  1111 0 0 . 0 ... 0 @vmaxv
+    VMINAV       1110 1110 1110  .. 00 ....  1111 1 0 . 0 ... 0 @vmaxv
+  ]
   VMLADAV_S      1110 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
   VRMLALDAVH_S   1110 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 }

 {
-  VMAXNMAV       1111 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
-  VMINNMAV       1111 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
-  VMAXNMV        1111 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
-  VMINNMV        1111 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
-  VMAXV_U        1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
-  VMINV_U        1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  [
+    VMAXNMAV     1111 1110 1110  11 00 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
+    VMINNMAV     1111 1110 1110  11 00 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
+    VMAXNMV      1111 1110 1110  11 10 ....  1111 0 0 . 0 ... 0 @vmaxnmv size=1
+    VMINNMV      1111 1110 1110  11 10 ....  1111 1 0 . 0 ... 0 @vmaxnmv size=1
+  ]
+  [
+    VMAXV_U      1111 1110 1110  .. 10 ....  1111 0 0 . 0 ... 0 @vmaxv
+    VMINV_U      1111 1110 1110  .. 10 ....  1111 1 0 . 0 ... 0 @vmaxv
+  ]
   VMLADAV_U      1111 1110 1111  ... 0 ... . 1111 . 0 . 0 ... 0 @vmladav_nosz
   VRMLALDAVH_U   1111 1110 1 ... ... 0 ... . 1111 . 0 . 0 ... 0 @vmlaldav_nosz
 }


-- PMM
