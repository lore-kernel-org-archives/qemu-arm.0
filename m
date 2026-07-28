Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA642C53219
	for <qemu-arm@archiver.kernel.org>; Tue, 28 Jul 2026 13:33:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wohvW-00005G-De; Tue, 28 Jul 2026 09:32:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohvU-00004w-RJ
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:32:56 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wohvT-0006QI-EH
 for qemu-arm@nongnu.org; Tue, 28 Jul 2026 09:32:56 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-664c6304683so3640543d50.2
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2026 06:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785245574; cv=none;
 d=google.com; s=arc-20260327;
 b=dQaoR+Ggr73rFBFz2LyBm/6TMzZnzZkS3uDMGvR8Hk0BQIwwWpUqIX9MtuFNEHpwz6
 7buos12x0gzqjsiVCb58vp7p4y/qHYaiiRdDX9C7hNtGaeWO64QW0MJTqvD7jq8WBRL0
 jDndqtvBGgrhuDDsQYzmOcONhOyWSBK6AN5LaR4NuSLNhtkoWCBe9LRiP95PMD+W7PW0
 ehVmXkCa1ukpSjhk/yfhi/kklvLXfPePB1tVIJ/rJKmw0IdjaQqI2m6obVVAgJGvWz+D
 nWzwkmvuUL5RPQnIe6Ir+5vAb8dcauM0seV1TT/eNuR79gFFgi3X5a06NHtJJ6EbVykX
 Q0tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6sPYaJgB1hdPcWM+7vs02Bb72JIY3vo8H5ekZMbOJig=;
 fh=UxY1hCfhYNJarV2kXcZ2nAExAMg0D0jpUkOJDOABOYM=;
 b=BX2auAurejKFyj0RfwrFIqAogrnNuBeGSun9IX5++OlGP0+VsNvQEl4zyJgd0zyEwx
 GIjx0DnGX1kWzBKFSRcKsUVUqEK6yEoS6LwR/wbHacKo7ksfLNuvBh4K1fm/XNpuooVb
 wmOfFwYmF+K2TldYS44LTioYAGom+nJnX7WiCx3urK8BGnkJXByX4Qwc/oWDtloYcP6L
 UvIVklPytaVTr/MUjjr5+N88CMC720gN/DxuC99aTzh8tszjO9Y36ADkReQqL8AxFc1z
 WsBl7XvN5tW+cbt5HxXslL1xXZ33bNyJBm3/KbQbTjDV/ZxOM7WYrXJWLbNo6vs58tnp
 EXBQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1785245574; x=1785850374; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6sPYaJgB1hdPcWM+7vs02Bb72JIY3vo8H5ekZMbOJig=;
 b=Tod+Xrb+fzUWqshaqjuHNIcfYe3YrQIHnkCY0FMmtcA8HmGehj7Ch6jqNUVrEMsTcq
 4QJWMVbpEHfPBFfF92DxyJVEZe8ICDW460P5ETq6GIm2RKMODWc73zbzXuRCo83Vc6FD
 oYFPErSWHtR4VqKW64k2RvnTPzsD67u4kyIxR8R2tTnxmtECbrcsAPxoJomK6hH5b786
 9TODn7flZVUBObnOeulPPki7GzlyOMSmZoIev6nKCQCf7bRQUQCKVdDJe7tAJ6NySM68
 bitHCQBUv4d+SaRDwiopk30jvE4AxiebQpZ78JZKlDzBvMZejESL9eOXBBAMovUTsOiR
 BIeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785245574; x=1785850374;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6sPYaJgB1hdPcWM+7vs02Bb72JIY3vo8H5ekZMbOJig=;
 b=o0ALkjgnGqNDqLY4r3WRkgYhyMoiPMHXL03WEkqGOoSO3TWJUx4ptLoRCFje9GSGOJ
 L6TSVzEWF8p/8Qhm+Qr2WPzxlzQxF6QZGhci+hX9Fc4OBTBbUtnmIPwKMR2o3pQ66H2S
 8oYPGw5LUqGYxxkjFeQwwhoz4mdNWAHt48RHum2JsxzzzuDMvrJcF8+ur6Edd2b477OU
 V0O8C3Xju1cmNQgnT+w3XcFaU69lIHGc8NI7N2fxy1EhOHMpNxLMWaHp3ecM1mwPHwkU
 K4aByAdOlrGvsXx329hmuzh1kZpDtwThkVSb2kZRYaoA1wiujVN+Ij1XEV2kEJ8ILTmd
 JnZg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpNMZMy7IUL1BfcE34wPb9RpKvVduGS82iQRabmcCINC5P543Vjf7Np3zPEWVxpDHMOiuPBBTAOSA==@nongnu.org
X-Gm-Message-State: AOJu0YzQy6iHwQxGPOxW7R9TUTkwx/aDl+xbUiH86eBHKuWm8ldiiNmo
 TQtmKETzmhWYXyM19jDipdF6/s/tPlOTIxXc5AOnEG3fIjS2T6BIu+IX4JRGB/otPTGOG3n6Jxw
 o/79kaFHwC0ojUZhbjlizHROkzqeQHGwMlJYHd0ZryA==
X-Gm-Gg: AR+sD12uK2y4CWKsgNphjnBjfpcMhyvSlbWQ17NdC7txKBzmXS/MFBwFH1OrnXDzGZC
 woA23fHdtR2LfP9yP471eMdkXZdvxsqtmd0OKMYoMTEOF/UY3fxk1r4PHJv0f6xH7VvaJLT2aUC
 gzrDqxIU0I2zwA4wYiS4yUBBMfdhecY/R/9+5Fni2kBiyqvsvz7ikwhj1TeB9coX6/4bTff6rFT
 8GSHId+Cr7z7cBGF66ADZon8d4ga5kvyR6HW67VtwxeHzlAzZr7SXk/SSfUG0Z+pgrvpL2TB5Lu
 NcDLsHvKEQAAB4byxqG8d+pqPZ92qRhVMrZFNwnw6cYWew==
X-Received: by 2002:a05:690e:810:20b0:667:c3c0:f2b7 with SMTP id
 956f58d0204a3-6690547b262mr627184d50.19.1785245573873; Tue, 28 Jul 2026
 06:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260719174905.420725-1-richard.henderson@linaro.org>
 <20260719174905.420725-2-richard.henderson@linaro.org>
In-Reply-To: <20260719174905.420725-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 28 Jul 2026 14:32:41 +0100
X-Gm-Features: AUfX_mwSQHdmraRIB0oA2fRz0o0h-NQyxZpkdRlySEMS0L3wMuNcBs_yV4Yq_JQ
Message-ID: <CAFEAcA-gmA0_VHWQVdk8=1v4usje19wu4SHwS=Lk+dgfxTWiOw@mail.gmail.com>
Subject: Re: [PATCH 1/6] target/arm: Split zdn in do_z2z_n1 and do_z2z_n1_fpst
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Sun, 19 Jul 2026 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from z2z to zzz to indicate zd and zn may not overlap.
> During decode, retain z2z name and duplicate the same field
> into zd and zn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

