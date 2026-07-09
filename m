Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0151C43458
	for <qemu-arm@archiver.kernel.org>; Thu,  9 Jul 2026 11:06:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1whma8-00058X-05; Thu, 09 Jul 2026 07:06:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whma2-00055v-8x
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:06:10 -0400
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1whmZy-0006SI-Vz
 for qemu-arm@nongnu.org; Thu, 09 Jul 2026 07:06:09 -0400
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-664cdeab266so2537298d50.3
 for <qemu-arm@nongnu.org>; Thu, 09 Jul 2026 04:06:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783595165; cv=none;
 d=google.com; s=arc-20260327;
 b=cBvUAobpULKZ3OhvHXs/CSh0uWUHXagbjogO70hv4CWjgjjOnIuuuxGQoeLxK+AqLy
 Co7yIHHvaKVu8LeNuaSmB3AFt0VWrbD9bN3pmvWQGhTPJi+NvV/hcrWtp/xrWWgxn3Kd
 W9lVvqp/0r0/1FRMFFfJnjDZ6oWD8SywRrZSE/AqGEXR7JiJzPPqo6EkX6daBiVHFEXL
 hfTEQkBYxMpv8hIXYPClES/HsBB9Q6ad1OlK10E/P3hMa2bV449VYClWZVJtQrXAMHe8
 4MdUUPZldLUlEsnjgsvm+xX8erACo5uKqhBOvshyElYnNZqYUM3N19ELtDcRcP7LkzQy
 qq2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=mOSDUjw16rV2I/2vBm9luEKa0YvI0G/Jv3ltRP4yr0E=;
 fh=YJkt6vpRznjPmE6gR4ZF/nJzSrthtqdWKcz/QK8C4Is=;
 b=rlzaWwP1tv7g1sESJW0I+RgWXKQdUTuJ+8Y4bA2GIntvhdhp2BN6C5/0pWbTTe0LXm
 xeVNuRZjD9NHBAcEHk2uclbhMWLjoO/+tZk5D/oZE8L4/Gg82gqethQrDZf0U5nzgI1q
 BHCwgt5o0iDBcypFnjb09s2FZM1Jmombtmx+RtQeF/GQNffGbgtCudUVC9I/x/TQR+Jy
 TPVuhCnmihUk4zryopyZJLZQh8JdmqvwEYZKj6vitk7IC9ASa5gy/SRxzQnqbz6XhDfk
 AqicCxdQ6t9P0CcOXFBYOvpeKp8g1tHqReSM9rdxl/MeR7/Knrw+Rx+dgLzoAtNNKxfx
 av2w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1783595165; x=1784199965; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=mOSDUjw16rV2I/2vBm9luEKa0YvI0G/Jv3ltRP4yr0E=;
 b=bGsmzhnKm16TF9Smm3BoAGPrkce58xtIXU9iiNIShMz/r6iYZb8ehZbIzSNw0N2DnY
 ZRRjVUA3LWpRnPZe1zvcZbJiDqMy1unjyBcNDo6Tvoj7Jz7Jk+2WhWvhbFxEk9F5sKM3
 ceVSMEioo3uD27ltkdcX0nrDx0Wlt/8QxFO6eReFlioB17j9bxov2WIVrlrWPQduWntw
 WpaQ7QAlOsBZG21d+TGR+ohM98wQIoCzgt4AV8BgyosMVx/ikY5Okwwu8oXzQJYEyhD0
 8R6nI2S6zVCdeXV17A7rGCnwu/W7J45kpK2iFbuPSRJUO2IVd86IR1tTj3sX0dBTRfhV
 ZTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783595165; x=1784199965;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mOSDUjw16rV2I/2vBm9luEKa0YvI0G/Jv3ltRP4yr0E=;
 b=PjgOOwci41LnyD/hjKnxVBW+laP6gkoTpRV9ib6nrahgylVzlsHM5JCnh0owPciv8b
 f1juCRyI+UnT6qiYXdOdDPYW5bemj3MwOb5X8i6aBpriVxhgiDU33hSoRxxrdYCIVbje
 Wow+FL64a+RI3FmWjV+lXvvGiqAwpNhtpp+3al1jFLHCwC0EfWIuQ/Ni8wzfN/Lgs2wn
 zbFRky3PQzpmHG6GJ9mRboEJ04gnP3/SYaNgs94O4rpA8r7cTq6eJ4fGyzbQiCJFe/vy
 p5Lq0D/ubPUWann9tbU99lOJvkcvsGWKTOmUnx6+d5U1sE11ok7k518n+9b4Hke8PY7y
 LUwg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpgLxfSWr2w5e2DRi+GxUQnqLNKy88sFTxi1FeJMtK2RjY6egYc0zB0CWPdRnnWbnyVX28m3YTKCQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz4fS1bFjx2qYDWA8WnsZ1M/Hw2R8cO+RR4Z8S0jAtnMceeE+sc
 O4mXdt8lWMJl6j9QWRhxBiaB8Ihs8zMR9OYT8YyyT2B0cbvb4WQeYFuK88/d4SU2Lxdhp6KQ1WJ
 TOI2pYg646h+lD+pWV5qXtdto6A0Z6As/CLcltH964w==
X-Gm-Gg: AfdE7cmReLoUrOffEbDFgB2Lzx1Xly4fvqocYKIsvq+u2kBr9YaUvqtFRw4ohoEIaxJ
 zLfx3y7UMXYJCzT9PMxf8J3nZzmvqeXUXwGDSH3WcE7NGuyvU3qHq6CxakZsMFNUySIbvw+Qib8
 WmZgrym9MUVd+pnUvnUXYKPSasCCA7JFTChIAEsT2J16ntdSIbmsn7PDiP1rLisySioWF0aB8Up
 /YfWiGV5lyioNfE7pj6MzcRGdO0mBva3WULNyOe1m5vPg8pc/pxFtLvh/6qhML8lD2a2d5VEUkS
 L11BryqmIP7Ho1CY76zsNoeMxytrU5GzuxeZS1qkw+Kqqn5kfJBwXUK6
X-Received: by 2002:a05:690e:c49:b0:664:ae68:33a2 with SMTP id
 956f58d0204a3-6679f17d732mr4716060d50.67.1783595165490; Thu, 09 Jul 2026
 04:06:05 -0700 (PDT)
MIME-Version: 1.0
References: <20260707085028.165557-1-eric.auger@redhat.com>
In-Reply-To: <20260707085028.165557-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jul 2026 12:05:53 +0100
X-Gm-Features: AVVi8Ccb_jNGog6PhCMuqSu3Kw2eK3d0YM1oiUGP5asaYJe2olY7AhWifW1tg4s
Message-ID: <CAFEAcA-6DfJJ_6oJdbYwwEDp6s4sqLKLMEUp7Cj0+6ozGq7UUQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] SMMUV3: STE lookup fixes
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 berrange@redhat.com, skolothumtho@nvidia.com, nicolinc@nvidia.com, 
 nathanc@nvidia.com, philmd@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 7 Jul 2026 at 09:50, Eric Auger <eric.auger@redhat.com> wrote:
>
> The current code fails to sanitize SMMU_S_STRTAB_BASE_CFG
> LOG2SIZE and SPLIT which are used in the STE lookup. This
> could potentially lead to wrong shifts/masks in
> smmu_find_ste() and does not fully comply with the spec.
>
> Also the series fixes different issues related to strtab base
> address alignment computations: off-by-one mask, unchecked span,
> missing L2ptr base address alignment. Those issues
> were not visible because the guest kernel does what it should
> but better comply with the spec.
>
> Best Regards
>
> Eric
>
> This series is available at:
> https://github.com/eauger/qemu/tree/smmu_sanitize_v3
>
> v2 -> v3:
> - Introduced STE_SIZE and L1STD_SIZE
> - Just cap strtab_size to 64



Applied to target-arm.next, thanks.

-- PMM

