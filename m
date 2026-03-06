Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CA3F0180E
	for <qemu-arm@archiver.kernel.org>; Fri,  6 Mar 2026 09:05:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vyR7a-0002I3-2A; Fri, 06 Mar 2026 04:05:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyR7S-0002Ff-TN
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:05:14 -0500
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vyR7R-0007K8-0e
 for qemu-arm@nongnu.org; Fri, 06 Mar 2026 04:05:14 -0500
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-64aea64bf15so8196116d50.2
 for <qemu-arm@nongnu.org>; Fri, 06 Mar 2026 01:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772787912; cv=none;
 d=google.com; s=arc-20240605;
 b=DSqBIz8YnFRYxJLg78gOs0uYw/CpIvc7eqrDVPpPyegbxs8BhuQxYTqm+2yAfrpqF4
 b6ohZJ0/7FcYKnCtwVnvGRLVX40ognF1GGyksbASKclCJnEJ5mUzuG1CqGJSVQbFxWWZ
 7zAEON1c+h3JNRJkiNSKrREopmyw79h+W0LeJTFbtFBAdZejF1ForYJdlxndfpgke234
 +y6f/Mxorg5aNx8rdxf3/2zxAP9jBtcZI5Hbi1S7Dm1y8oK8IdvLwyMgZbEY7sXzY2i0
 KlVHTrzkd7T03+rJbK78V8D/yOp9rMTrC/R47pJ9414aEFcwNmJ4bL3bqKvTH2eoAT98
 qgOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2D9mnmF9YIc1ASiULt752ZFEY40HMTd19gFA3OqX15I=;
 fh=k1/E4d9qff1hxvfebcCEW69UtkLOc9sW8c+4t6hswEY=;
 b=AXuS2m6so+yBwNLD+F2HGQVOe4gS8f7hZSXO+LAnbhNHLbRyD5LSriaMXlGe5vxyBG
 6lwHlibDyIJIlUaNUaT/jcszLqT82egTB4GfYNafblG6F6D1DOQ8/TvM0/Jh0EfYCGpV
 NCL1B9VG2UwvKL15Pa+kaxxOGPSj5BAqJt/Ra5k6GRLe9WsK0QmjPBJc98PPsGbxJOVM
 y37ZR/cVnzhrIFEdmVWqs5SVmebRlM3bLMbMQg+bZTmBnSRqQw1cuWCc3xYs5kXE9ONE
 Wlm0bB/4q6ZbehwecBqxd1nBs9Q9/Azz/KE94AHZm7yXyQoB8qm6BhOPFAsLDaECoSOE
 Ji0w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772787912; x=1773392712; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2D9mnmF9YIc1ASiULt752ZFEY40HMTd19gFA3OqX15I=;
 b=mIBpYgTjcBdFUJzwtg3FApa8ukoIyym3OnZmlSTewnvwHTVD67N4LwynjN9RzrQf7Q
 dcGbL6g6gjThT0E6JsSXq/GQVuWHRsGe2DpYGurzcK9XMguB5R/8pI/pIOTIA9kzD38j
 b0UwwQt1822KdbYbSr1E+vlWry9ejtxxnnMIYMPLSvEijrtBfrkIJ0K8lqDflI9Wq6e9
 mmgL0z5kDcH919O2eDtUOfdViwEcFQqQ0ncqelVt0iXAcYgFGleZxcmSYV6WKyHqJzth
 dYsB34yfEYLS9nzmpNoTbH33xTuPa7FomlOnk1IHKlKvGfbs9vaS4Y3LLoYJc9TIQI5S
 H1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772787912; x=1773392712;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2D9mnmF9YIc1ASiULt752ZFEY40HMTd19gFA3OqX15I=;
 b=e6VsNtt26rAfjE8LUC13EKZIa6+vZs6D9yZ5SR7cLMnB0SHudF2yHF/0iz5jGd1YRG
 7mb0m7xkIiM2ew2la/aPCUdLKEqXQ5Mbz3TkUUwQNffUpyby/hWu6xyz7wpQbEWpoOmv
 oCwlT61tDyi1JRtzzSz8MIme1PLnWDC94y5HvwPb8MfWAIv2OWYp9mYydtE+W1Uwk8+I
 RJ1CTuyRyPFDenxYGwQaysU55d7tb6steswLmvPQ4TFaepLgRWvtOiCJE7Q+50Sbu/vq
 mAE4Yul2DKouY5mOh0c+XuyLLFw2628dFkpwaAQITZEbAjYVFe7vqLwDhBtPW4Y5gYgc
 w9HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfi6/Dbalw358Xvtj+lwj8BJ5VkukA9828sbOW9Z89H/PjUfmkAKgijSI+Rv0UiuH1BNrByIbdlA==@nongnu.org
X-Gm-Message-State: AOJu0YxvUxNiRH0l2XnSjIExeFJKutWFhtA+9QNM5IzvkiKsAqITOxEd
 VAKcgb68ewfYcSeQThpGGYCuV3z80B/tj5vIHzktJ2nIHdq93hHPUUI3llJk9/EsQ5+t7PRqvFx
 I6PbvPon+Fx5Em5y0d4M1Cld/ZalTtC5/q5+Qs8xUow==
X-Gm-Gg: ATEYQzzMJoKnD7s0oAmep2Tm3TPoykw4wqvE5kAVHbJ27I+nf2BgZTcnxNOMerY+mtY
 9g1CkYV0sWcUw2E8InMbaau12EmwEk2gzMgdeFfMNyxjOB+XU+nm2CdqXmGUUy/zUxeOyecLnTM
 Dkf7GX3+4zRZwV7NGzMBRv1bnI4OnRfsLRIE1mZMg7K4cAFHwMfyiQsa5X6XZbQyMbN9j7/Eb8E
 VK6PcfH0UfyxPbDY6i/y2BMlf0RBnbIfRFrdogMJ7eMiAcSlrw8V2OfLzT6vLbQ3mouR/iYbkrG
 b4kkcf4z0WJiQCnpFNI4SDQJSzh6R8AqTAVTdZdwKSgCGI2blR73iKXCa+rXWHg2wNU4BfiVRsE
 UiA==
X-Received: by 2002:a05:690e:4192:b0:64a:ec39:dd64 with SMTP id
 956f58d0204a3-64d1427be45mr1108120d50.43.1772787911735; Fri, 06 Mar 2026
 01:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20260306083113.74177-1-mohamed@unpredictable.fr>
 <20260306083113.74177-2-mohamed@unpredictable.fr>
In-Reply-To: <20260306083113.74177-2-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Mar 2026 09:04:59 +0000
X-Gm-Features: AaiRm53vWqwli0FhM_mGRBpWQchwO7OdoMSJ2p2kh1F5wemoaiGQOuTQodt80jw
Message-ID: <CAFEAcA_dXMOzHuisenC+uEq5CyXBLgAjrA0SWVf8e+bmJ4Gsxw@mail.gmail.com>
Subject: Re: [PATCH v14 01/19] hw/arm: virt: remove hvf_arm.h include
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Mads Ynddal <mads@ynddal.dk>,
 qemu-arm@nongnu.org, Cameron Esfahani <dirty@apple.com>,
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, 
 Phil Dennis-Jordan <phil@philjordan.eu>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Fri, 6 Mar 2026 at 08:31, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Having that include breaks the build for Linux after inclusion of SME support.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>

Why does this break the Linux build? This is with Manos's two
patches "hvf/arm: handle FEAT_SME2 migration" and "hvf/arm: expose FEAT_SME2
to guest if available", right? Linux builds fine for me with those.

There doesn't seem to be anything in the hvf_arm.h header that would
be a problem on systems without hvf -- there's a couple of prototype
declarations which don't use any HVF specific types, and a block
of code protected by "#ifdef __MAC_OS_X_VERSION_MAX_ALLOWED" which
won't be defined on non-macos hosts.

thanks
-- PMM

