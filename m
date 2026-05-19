Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE7FCD4F3C
	for <qemu-arm@archiver.kernel.org>; Tue, 19 May 2026 15:28:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wPMMV-0006Wb-2J; Tue, 19 May 2026 11:28:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPMMT-0006WK-NZ
 for qemu-arm@nongnu.org; Tue, 19 May 2026 11:28:01 -0400
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wPMMS-0000wL-35
 for qemu-arm@nongnu.org; Tue, 19 May 2026 11:28:01 -0400
Received: by mail-yx1-xb133.google.com with SMTP id
 956f58d0204a3-65dead17c24so3450274d50.2
 for <qemu-arm@nongnu.org>; Tue, 19 May 2026 08:27:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779204479; cv=none;
 d=google.com; s=arc-20240605;
 b=RadRPGbiscyw9L6kmsKNTWDzoADyrXeloTl38jSSB0Nada7JwBP0QILOUnRc1VWV8F
 h8oDlvEIq+Z8r3KCmdEqrEikRCktFZ4HBEkG3mj4cqEGBvRX5tKgWoi03PZG8mL+KrGP
 P3bEyVxIuIbzKWMV5iNHpXv/v9i0AZZKpr5mnmZ2pp8CgFcGP3wBFJy79p/yOHjLMaAv
 YTIGUjKOK1jHXyNJtW1xMrbIiSIG1mxrXshFV4rB0FR/veVUv0tIiGhpgYzuzjJi/e8+
 ytrDFVhXw3FUB56UUUycB48WMYlgA3jBsev94rWtuDrTiZTA6FV+RzqSJAPOrGXPCxS8
 DfCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=sGrQGLNdI11dxVOlQcjvVQwr8FImet4PCaIQ6Gi2Tq4=;
 fh=pun+LzBOmAQD4zxcL+HYULB0USRea22EJ73JnNiMKyk=;
 b=U/Txfad+fEho2n13gFQGtlp405CUUhRwNune2nPqD21NXmLwpb2syjv365EWoS+CiH
 NzpZ2eZP4asocDHgMjaF/km+w6Rc7N61SFHx1OdR6R4hPfG2Fq1np2XMm2YdKpna8z2B
 sbNL5Eo6UiFu8I+4pYwuBQUTx8nfRckcTpnYdIXbJ5VBqCzwGbyc7zFBdZXSBDVjTNv9
 eBsLLWFOptkHEypUsRki0VDtrnEAxyjJPWTj2l6PT4x/fd5HdzTITIS5wOBV4mjpkfH4
 5Gw52yMxlNimslPHtHNCzgpEL4wpxCx7fgXyZVn9pbwifad1NqAuS3fjLr5i843ElUN4
 Gazw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779204478; x=1779809278; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sGrQGLNdI11dxVOlQcjvVQwr8FImet4PCaIQ6Gi2Tq4=;
 b=zzIPLkOXu23TCTjdA9wp25RlYdMmOVzoKSFEHM13nL4wtt7Y2O1Uv/VGXIcYyh/+3W
 nAyswbmi31d8xV5OPZ53cgfjkbJrrFfz0gITxdWE4FdXQngd+VsQjqTL0COSsK7PeSwu
 gNCoz6UgIe2djdZGjaY3bjc3F/AVLtLH8jgYpzMk5tcZ4J7nYW9hQocMEbT3iVvK0a4G
 kMO66wjtOV56O/7YkjpMbrddOCuedHcIn1ogySiv+1HAPylRjcjuDqQiXMxPuZRzeCva
 UR9xIWIG5S+FZjjexKi2PnAiU70U4Ngt710pODfgG99KEWo5rgatQ5NE7ezjKl6P0fQy
 Lxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779204479; x=1779809279;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sGrQGLNdI11dxVOlQcjvVQwr8FImet4PCaIQ6Gi2Tq4=;
 b=p2Psj4zLrHLuxO40HbzdqcXbJr6H5pGq3BKog0pUAiqYPcG3y3OzssJ0cfgN8ev/h0
 S2gKyrDsFlrgpOU8lX4bPbRxrMhWAIGnmeeHeSxSarQBfIgAH0X3rED2LRqfXoZXxG2I
 YWUEo6sGc/AnoatUx7L24l0mkO3w+XC4wyPDW35BvV+42stIBFjtgAvQqvMJ5b3d0ILJ
 nXb4qIwfGn63RUoLiGjpNaKkiBm/shHAAPkumiOP4d7/PO2wGqgqGvOJcVhrgnsKRRza
 ClX5VkKDeM91fHBw7kUTbdJCa+wzwZvH/4mxGf04V8LlNoedBcJFyypN/wSkSNNsUfm2
 O7Tw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+kQE2hOQmIY5DNU+yl3Gi/4a/iFylMWqYM9ATgWSZhjGw+6/geuqhjoTlC3JPCYhn/zfuDsrh0/g==@nongnu.org
X-Gm-Message-State: AOJu0YxWSb90VQoF1QT27w0CTMXO6I2GKIL8jMYb3UR1tQFxoj2LwJKt
 Yzev6KOzrqvFLC4QILf2/7uM2SZ/F1qItCvc05XOmCBJSI3SqMttQVb/fwWN69rfYg+K5G6Qwin
 sXT2ocxeJ51Us7rKT3Ns0g8I5GcylYktY2vFT6vzCP9Enb9iMHthQPTA=
X-Gm-Gg: Acq92OHNldpmu0v621FVK34JrEG1GSbcqFOeycUFzIk9kNsGPRmFxKXS3TNz6zGsr6K
 lHrkjz3SLYyT/UEtS+D9L3mDpiruFGLMtZgHq5ssjo02u56jXJ640htI4i+sdn6C1dkRS8y5i8K
 WsCgMtlCkaIUDW83Zrily/7Ihb2hv/js9UaswKTL0yl+Kh5gu++fUjcaxLfXQQUsLaY1zujRBL6
 gegrY3zedjBX0No3pqQYuYuiHQjLxiZiQmo1bY5c8p49xaqNG1+GzlK3HdS1p1KTX9hAQvIYPyJ
 sgS3KMc8H8d79foE4Rm16odZJ32LaEDaOZeaEnCyKZGKRl/bR6oSgG038lE5aNav+DQ=
X-Received: by 2002:a05:690e:1689:b0:65e:4e7d:9c3e with SMTP id
 956f58d0204a3-65e57b34374mr9120059d50.61.1779204478368; Tue, 19 May 2026
 08:27:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260517003002.321430-1-richard.henderson@linaro.org>
 <20260517003002.321430-31-richard.henderson@linaro.org>
 <CAFEAcA-q4GdT-uawv-hw6j9ixdO=Nw60hkJ=mq61G3CxRE5t0w@mail.gmail.com>
 <CAFEAcA_5nrmafaL8oGr9Oax5BJ=bJUXZ9XjNt0ZL4bcxzcebTQ@mail.gmail.com>
In-Reply-To: <CAFEAcA_5nrmafaL8oGr9Oax5BJ=bJUXZ9XjNt0ZL4bcxzcebTQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 May 2026 16:27:47 +0100
X-Gm-Features: AVHnY4L7BQirOr6E-xdMbApCddObIHgE08LpGnlK5A5PAKUwv3OdhXrxWcD3exw
Message-ID: <CAFEAcA_VS4xH09PwdpxuScsCrrkJtePp2x4ioTt1fMMTs5n+=g@mail.gmail.com>
Subject: Re: [PATCH v5 30/63] target/arm: Implement BFCVTN for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 19 May 2026 at 14:27, Peter Maydell <peter.maydell@linaro.org> wrote:
> If we do take this approach we also need something like:
>
> --- a/fpu/softfloat-parts.c.inc
> +++ b/fpu/softfloat-parts.c.inc
> @@ -288,6 +288,7 @@ static void
> partsN(uncanon_e4m3_overflow)(FloatPartsN *p, float_status *s,
>          p->frac_hi = E4M3_NORMAL_FRAC_MAX;
>      } else {
>          *p = partsN(default_nan)(s);
> +        fracN(allones)(p);
>      }
>  }
>
> because the NaN value from uncanon_e4m3_overflow isn't passed
> through the NaN handling part of uncanon.

This isn't sufficient for the e4m3_overflow case, because we
need to return a NaN with the sign of the input. In the
Arm pseudocode FP8Round() calls FP8Infinity() for the overflow
case for both E4M3 and E5M2; for E5M2 that function returns the
format's Infinity representation, but for E4M3 as there is no
Infinity it returns the NaN with the sign of the input.

diff --git a/fpu/softfloat-parts.c.inc b/fpu/softfloat-parts.c.inc
index d267bb4bbd..efd130bf16 100644
--- a/fpu/softfloat-parts.c.inc
+++ b/fpu/softfloat-parts.c.inc
@@ -287,7 +287,9 @@ static void
partsN(uncanon_e4m3_overflow)(FloatPartsN *p, float_status *s,
         p->exp = fmt->exp_max;
         p->frac_hi = E4M3_NORMAL_FRAC_MAX;
     } else {
-        *p = partsN(default_nan)(s);
+        /* SNaN with sign of input */
+        p->cls = float_class_snan;
+        p->exp = INT_MAX;
+        fracN(allones)(p);
     }
 }

gives the right answers but IDK if riscv wants this behaviour
or some other one.

-- PMM

