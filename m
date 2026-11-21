Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF4F606A320
	for <qemu-arm@archiver.kernel.org>; Sat, 21 Nov 2026 13:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=znZGxply
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUl39-00014u-8P; Sat, 21 Nov 2026 08:22:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xUhpu-0000Ow-77
 for qemu-arm@nongnu.org; Sat, 21 Nov 2026 04:56:46 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <haseebashraf091@gmail.com>)
 id 1xUhps-0001Lw-OC
 for qemu-arm@nongnu.org; Sat, 21 Nov 2026 04:56:45 -0500
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-497614c95f0so1015879f8f.1
 for <qemu-arm@nongnu.org>; Sat, 21 Nov 2026 01:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795255003; x=1795859803; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=mjaLMzSfEvQAVnmmmaDH+RrdPNS8d+XwRyrHjllT/B0=;
 b=znZGxplySLgjsTJfroUaCz+Do6D6zJKB94tl2VkrBTmqgDSMeSj/tItKFuX8yEg7M8
 R2KIFp9Ix0q7wXapMnz4gEFzkGIPlwIX1CiOmun43NkefqiWhnWOWebcnwOMiSD5lr7F
 CvKl9r8sf/xYeTYyM9mHIcGh6vXQTyOHoQK8+N5VM3FBTMKCsuXtiTVw0Z36e6ezo/Nj
 fzjA7VprXD8CgKD8/D6RfvNus5IXqJJ/nMpnJLyOhAS327sxy9U2EzZ60Gee/zP9T5WZ
 GKNEZ/CxTPYRNuMfXETw2r/WaloQ2mIztf970KD4c25pwKRExmXgIvvnWZ7xcdOk0nib
 QT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795255003; x=1795859803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mjaLMzSfEvQAVnmmmaDH+RrdPNS8d+XwRyrHjllT/B0=;
 b=g3XnkDulsFloxFTQ8jfS1X3k2gLcCtogV4p+bzUvTEjQ5SnmMTYWsFEE2E1nl3CZlE
 scbZz1WfeAIPyXW+TTqjuzdYqgyWqAR4m2l8JdvSusRcPmJ88gqbjJuUi6ZWMOgnrpiu
 fd9O37EpPwn3/mOHMbe6SuRxpb5BQ8zGLMGbMl5AtIQxgyjQ15vYDi+XK0UAQPvXTTOW
 JMJA8Uwz97rseEGnVEHYZFVrKowJmwERsqVAgsx5q/jJr/0GFrh2gEBU7S2ul6GapeMM
 VWYVF67oBx+o+AxWhz6r0JU5StClllJR44G3kNjb4uwetmBh9PJu3nwmVsDb3T9GkDxz
 mt1g==
X-Forwarded-Encrypted: i=1;
 AL+hErHtlUWhOBYIQEI34VWVWoUi3iUP6eEWvY7Rl33qilZl2WpyeWBS3TtfbtY28BfGoYytF+ttiGJGHQ==@nongnu.org
X-Gm-Message-State: APuU4Z/gm0NPXnfkac688XBTwfrwaHO06xEFCtPOlEpZG5t/c/SEDksX
 dxs8nn9U5mbaR2l0wvhc643YxzFYvezOUylC0+9+q+F4twIzb9kacV3N
X-Gm-Gg: AZFdTZeFytJOqw1BLfGfTpv18tEKnad47RewxpG00XUzaWbkvygHlNS9OyyRqWCDSJQ
 QQmsWbpyC6BJlAv+VXLcWhbpk3fNsVAjNL1rtBFFEPUAZiSygK39mE67telTNKqgPOcK8G2NrwN
 8Wu0/LkCMLBMs8f6NpUiNLqfyp8zGLA3Z5qQiZL2OQ3Ba30nnPXMpre3NhlITeTngEphblLOQf3
 2INZ6USJ1pdVYqt1JqVe6X+/YwGnkMXg4tBMhECKSl7fEYTXjnty6rxclsyKircSB29a8aA7DYi
 wHR73iN1diQn1SWb+3J0XjaQTG00aTbAj+5P3Vx6eh8FNWzm8j1zzjiZOsYbQEXfWGlBmfDcrHt
 MYBuV5xQ0O/QA8OYYTtVZiaUoqGxzWQaaMD5fk5NreRoex/1bZDqqNGuJKQNYUpxEgy4F4wO4nt
 pJHJrQ28/1b3w1KcLv0MmZB5tLAQvA419+Iko9kHDP+Sc6S5R58ZJbQFRZhzNpzs6eKZlJbCTxX
 n5+Dl6a7NKGVSgYdvgHZ6Aow0ybd9mpyUopOTLCPvZnsi2T6JErOWKa3QxGlED/pBh2pj76L8cv
 f1QTkbcyTshECe6Dii4uxnOxaoHIbXqFoYDZiwqpXlwjk8Flcyv2GqpLUCxDWkxOn05vpTgyrX9
 rEHQlMoD0b6lpa22du2QTJsWp
X-Received: by 2002:adf:e010:0:20b0:492:b221:ac38 with SMTP id
 ffacd0b85a97d-4abb2ce4bb5mr8957776f8f.26.1795255002703; 
 Sat, 21 Nov 2026 01:56:42 -0800 (PST)
Received: from PKL-HASEEBA-LT.. ([39.36.59.78])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab658e2e6dsm10741748f8f.6.2026.11.21.01.56.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Nov 2026 01:56:42 -0800 (PST)
From: Haseeb Ashraf <haseebashraf091@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org
Cc: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Volodymyr Babchuk <volodymyr.babchuk@epam.com>,
 Haseeb Ashraf <haseeb.ashraf@siemens.com>, qemu-devel@nongnu.org,
 kvm@vger.kernel.org
Subject: [PATCH 0/1] hw/arm/virt: add vhe option for nested virtualization
Date: Sat, 21 Nov 2026 14:56:35 +0500
Message-ID: <20261121095636.289814-1-haseebashraf091@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=haseebashraf091@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FORGED_GMAIL_RCVD=1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 21 Nov 2026 08:22:37 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FORGED_GMAIL_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

The virt board currently enables VHE whenever virtualization=on.  There
is no way to expose EL2 in nVHE mode to a type-1 guest hypervisor.

This series adds a vhe machine property, enabled by default for
compatibility.  Setting vhe=off propagates the requested mode to the
guest CPU, limits TCG's advertised VHE feature, and requests the KVM
HAS_EL2_E2H0 vCPU initialization feature.  Unsupported accelerators
and KVM hosts fail clearly instead of silently ignoring the option.

Validation was performed on an AmpereOne A192-32X (Ampere-1a) machine:

  - KVM with L0 kernels 6.18.29 and 7.2.11:
    - Linux 6.12.67 initializes KVM in nVHE mode with vhe=off and VHE
      mode with vhe=on.
    - QNX Hypervisor 8.0.5 detects the requested EL1/nVHE or EL2/VHE mode.
    - Xen dom0 boots with vhe=off.
    - Xen does not boot with vhe=on.
  - TCG:
    - QNX Hypervisor 8.0.5 boots to login with vhe=on and vhe=off.
    - Xen dom0 boots to login with vhe=off.
    - Both AArch64 KVM functional self-tests pass.
  - TCG-only, KVM-only, and aarch64-linux-user builds succeed.

Thanks,
Haseeb

Haseeb Ashraf (1):
  hw/arm/virt: add vhe option for nested virtualization

