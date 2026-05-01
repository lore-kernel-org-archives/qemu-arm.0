Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2421CD3424
	for <qemu-arm@archiver.kernel.org>; Fri,  1 May 2026 09:50:53 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wIkVn-00036I-LX; Fri, 01 May 2026 05:50:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIkVg-00030H-FW
 for qemu-arm@nongnu.org; Fri, 01 May 2026 05:50:12 -0400
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wIkVe-0007bF-QJ
 for qemu-arm@nongnu.org; Fri, 01 May 2026 05:50:12 -0400
Received: by mail-yx1-xb136.google.com with SMTP id
 956f58d0204a3-65c37eafcbeso96856d50.1
 for <qemu-arm@nongnu.org>; Fri, 01 May 2026 02:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777629009; cv=none;
 d=google.com; s=arc-20240605;
 b=joofXHwztiGmV9tjqZ1bW9wzHxyM7H6F+TUaZ4PCC4zF5VNYanYFgY5WzuI0KjivFF
 hwgg1j8KByMmuncFKTqbUXtY88cSqd+iniLyQNsz+sjawVNR1WoaI5iqig5PNM5PHwyz
 ZzzCxDnRhl8I7mU7cI90R6XkrwzYLZedZ/Lz8XYd+qtQIfC+qq3EUnrZfulsTDlWd+lj
 C2IhAwxJtJAOB1YNHtm4VkthUH97d4huIzTFdG3L55HicD5V6tXlo0D+ruKfQPUxpNII
 bhKMBcXRvap/RT/ghhhM/kZyS3oTZ8YptbET4Ielq+TWuJnQBFH6wbWAAoHX5MDowqEC
 svew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=hIWpiTawUseQQPCN+9bltXY0EQ2B4/qK0zGFjkzJBcE=;
 fh=CCehHZ2+tP2shSqhB2givRvPLbj9x5KmxchLI2NwSIU=;
 b=ID7OWzuQTxb25AAWKY4PoTfDRrE3Ur9t8h1qMPp1f1MrtPeIW8CfxtE8EgPg2UgxhO
 H3NlPR3d6qhP2vPPGSZC6t6arrSImzT5nuxfrTmAZNyCK1Ywhtl7jk1XyJrzIEdRuhpl
 xybrhCq8UmE9uwMOgGLE4UiXqLvnYBLUTOcAC39CaxNZjGeS2xkIx8QlcMuyVoE/ZZoD
 cdGldxKRclNvven94ANWkC/JaKi8KYlPO8J/Jho+BoVtoq4TrTcc353P+WqICANlvIbk
 CSP5f8Ql9rOJTvapwVtOOzxyA51g7gY2rXg63eMrdggE7rwfb35ha6ZGR3LRoQ4h/C4j
 N/sQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1777629009; x=1778233809; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hIWpiTawUseQQPCN+9bltXY0EQ2B4/qK0zGFjkzJBcE=;
 b=LFZWR8Ky4xs5ylmoMMr2cskrZz7YWD5xE/Mb54SRfKvhKBTNKk2EU4hDgcmWhs17qY
 +diFi4tJyHzMjJGHta5BX4M1r4TTMuELjVzvdNAJzZIf0/HbQF/rseSB1B/wouA885SF
 1Q9Y1k+SFG5tOCrsp4ntYTZxD78jNc/pIhLkkeVzHuENCODUj+FuL0ykGjnIqfBdoQNV
 yIdL/AZGZfdboFKpWW+OxZrpsRm0b3CZeojnbFRTh5N4V6kmB+MQS9Q8FnHBhZ7eSO3f
 z9hvAj558eSHKdcv6Es3ff8kPWA8mmoeP9YnbfA8RVYzEbanGODaqWCE1pWOHrbaNsIy
 9mhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777629009; x=1778233809;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hIWpiTawUseQQPCN+9bltXY0EQ2B4/qK0zGFjkzJBcE=;
 b=GucvAh1baZDG41PIFpKQUsXrVsdiLE9PtFmqf8X91ycQNBIibG318ix2oIGniLcMn3
 hBSvFi6jrnN7k6wz5cXrDs0/qe+WWtjDlDdaiNS2QfP5C8+fGxgbGEOIk0MtCbZrzjrA
 glCj3Cgm/g9lI/cyAxXS9WI4cmtoNx3THOftR8TUZbb5lyhY8Exlzhh6jWK/2CuP5WiU
 aRksVstnYmqpb6NO7diU6Eizu0ySnz0SMLnuU7wRbWEH/Cet2gHHgddhG+7f1dEvP4+s
 AQXYVFULFJKxi/pZ8xUN0oWOmPKZcfWhfwwpZtQL42MV32ri5kUSUStKhHECnuQ2Xgdd
 2OLA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8+pdx0okMpFVVFZTOJhfIZ5GEPPSxjrrlN5b/HPsrZoeURlWl0JJ15HOsaDYrWQa0xKePgcCGGeg==@nongnu.org
X-Gm-Message-State: AOJu0Yyt/U0Fp0GfyZ5WxjWxxNx/ncu8KoTDaO4C22PYa+lXTd/grTJB
 ZjW6YDOvE438V4NfuzspbqIcGONor1F1o4F5/QbE+7DFp+iVqQgNYK1GgyezH0AGsSkSUPCYb+j
 7NPOKxOcVafkGeDiQPrY7EUrp3Ww0UZujneizc1yniw==
X-Gm-Gg: AeBDietvFW9JzCbjpqgM+0ST7sfr0PWxNKUUsdSiWr5EQZbhCJl23syxohdwu9ft97C
 6dbiMQsUU2QYtm6n9nDuR+H8Pio5wvxPPS/RSaUi2B3tzFOZE4pWlpl8dTCa9YE5DQmifczMAdi
 2aEbx5AeCmrEfDU9ikyreVMtuwfd3Pyk+9U3yuWBwRE0yt0T/SgmE0EJNKIkY4Hj5+RZ3jnJ4T6
 DhdgwZzkQYnTj86vBYKXcO5/vOaINTjA8jRWl9hDMoAFTHW/O88gGAB/ChyMLoWrCxYmlo5N2z0
 X0xAhjhSzWFKiIaT9WXWKydYRFavV9Q2colAdl1cIkspSks/ZIBWGueeE0oiJatOToeJ4ZqjZoE
 z6g==
X-Received: by 2002:a53:db07:0:b0:654:6a61:fb5a with SMTP id
 956f58d0204a3-65c18aedae4mr4030050d50.2.1777629009103; Fri, 01 May 2026
 02:50:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260429190532.26538-1-mohamed@unpredictable.fr>
In-Reply-To: <20260429190532.26538-1-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 May 2026 10:49:56 +0100
X-Gm-Features: AVHnY4I4HtaW2t8cz9v0J4YSOM_Gp0HgSC_gzLnG8im95OhzidTduIqee8IOS_Q
Message-ID: <CAFEAcA_Rq+ggHLJEAmviCpTUfK8opcJ9B0wpD-WacbS2GP3abg@mail.gmail.com>
Subject: Re: [PATCH v21 00/15] HVF: Add support for platform vGIC and nested
 virtualisation
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Phil Dennis-Jordan <phil@philjordan.eu>, 
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Roman Bolshakov <rbolshakov@ddn.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alexander Graf <agraf@csgraf.de>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb136.google.com
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

On Wed, 29 Apr 2026 at 20:05, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> Link to branch: https://github.com/mediouni-m/qemu hvf-irqchip-and-nested
> (tag for this submission: hvf-irqchip-and-nested-v21)
>
> This series adds support for nested virtualisation when using HVF on arm64 Macs.
>
> The first two patches are from the SME enablement series and are present for the
> series to be buildable on its own.
>
> It has two parts:
> - Apple vGICv3 support and necessary infrastructure changes for it
> - Nested virtualisation support. Note that the nested virtualisation implementation
> shipping as of macOS 26.3 is nVHE only (but it _does_ use VNCR as shipped).

I've reviewed the last two patches and applied this to target-arm.next;
hopefully it won't get tripped up by the CI this time.

I had to fix a few checkpatch nits -- it would be helpful if you could
run it on your end before submitting patches. It has a bit of a high
false positive rate (especially the "long lines" one it's often better
to keep the long line than make a particularly ugly linebreak), but
things like "open brace for function definition is on its own line"
and "multiline comments have the /* on their own" it will catch.

thanks
-- PMM

