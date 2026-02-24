Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81414F3C9AC
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 16:03:09 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuusK-0002bu-AA; Tue, 24 Feb 2026 11:03:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuusF-0002V5-V3
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 11:03:01 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuus9-0001pC-RB
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 11:02:57 -0500
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-b8d7f22d405so899226366b.0
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 08:02:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771948965; cv=none;
 d=google.com; s=arc-20240605;
 b=imjkmV16NyZ0A7RsJdK9p43EiL266arcTjdTCZY8UC0vctMHUyIGnXSNWk1VOTYQi/
 IVUvwyZplM05c51xg52ISX0VtsEP4AjIcCtdd3dqBXEmYuddGt3ftqMcZ64HuszYzzLE
 3AUrYolZAWoP55P/Th9f5HxnQttMWUR31UCjWRbEBu7GdsxShNPPaURVmZhOS0VXY5Ec
 G/bGHgpStzgnwJQJLGcb0wWBm9W9T91pIaeITC/JjbdNrSpwyVyKTa2BTOd2RXSbHOqj
 umDjc9a6IoNr1d2yQslDXSDaxy3DGSpmvQ+n2sOmbORQXZYM1Zyf9TPPQrQHthSlSf/D
 bm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=u7sPKV3brofakR1UEqXphmFxjaegh21/9ejPoGpH5zM=;
 fh=gg4C4HFYiQhrfmxdt0c30EIEtRlRWgwN7clbfjpwD6k=;
 b=C3iACckIjVE6QEUArbk2I3MG8ZZvgQqcKxFzO9n1Tt/c+CyXE1Mr9YxkDd7ZntZz29
 E1AU6szneU27DlkF0M+uu7CdyUww3hMjLG7AtWMj2tff29lWUfuWK3HPIGHE39WiRoNN
 ETlFr/NyBwYMB43pZXkEt/1AkEKJbisCmykULRID8/Rz4MHrEvMgeW8rIpr8SD0tGYhv
 tPFjzF6zl9ybzdf1S8PfiSDkRerJkaigfUbryR9tMrFolKGQTk7Vevr7RV4ANLhljI71
 ikff5VjGWD8jFbw4XDfKHd1zBNuflVrb7G+x3cldXfVmUdK04eH0O5m8BJLi0m3e6nHl
 vS2w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771948965; x=1772553765; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=u7sPKV3brofakR1UEqXphmFxjaegh21/9ejPoGpH5zM=;
 b=rPVxuaPrlEInPAFq4x44mAi3Hjb4Y70TLfvzpM/QT7fw0m/Knp+SNeOcQ7FH1zMBfw
 84kMaY61X5LfQ7PuP85AN06YvvUO5HawF90HRhfmeRVdC4QfT0mPGGH9b+aQTuzjSURN
 eKILpjh2eFSTVQspNWHlLKqLSFQWlBj07c1Z5rgHgmJBuPHxcbVDLoGm1a1HVrXjzAt6
 NawWtaO+VSScR0xaiOgvTO+zKT9dOsrCaNY/MJAL7XhbyWXJ0ib+A4PBrYIb7ApK3r8q
 yivVXNuHmH7sUamBv2au/hYm4FqSaL5+61aepWW4GqWwSxqOE2qSu2F6XgOu/+QxXuAV
 VQKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771948965; x=1772553765;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u7sPKV3brofakR1UEqXphmFxjaegh21/9ejPoGpH5zM=;
 b=SL3vZAZFWN97K8ANAz8sGeOPDKaQuc17vbcXIETvmK6Ha76Yf5Xr4OcICfPDbOIHI7
 ISQP6agO0WhQDiBzZk4p7e4Mtg6ImK9g2fVCPeX3pTuyGSSz7pucuVa+eAm7Dd6F3hBY
 FuPMTKEth/g61kxIH837r3RrX2gHX6SEqrhM4qLOL4oidrFpj7ViPYruM1Lmf2IDHWPt
 7JS3Of2KjiZoDNw9rhJrp/DuKqGmYrZ90F+VPbQ7Pq7sWP989X9lzVXd/34GDBvYiB4j
 I8D9TzjkLMIGIo2Mmyx2FeKPb2n7asrWRMxgIy+Bu0P60zzXdYu82ok7JdpO1uh/x/I6
 U4+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWn5ds/WBDH/xebHtDrlVfLUBFkCLmxLE+jSewVVmriRApkU8+1MgFb377WnlA/J788gMHDJMHig==@nongnu.org
X-Gm-Message-State: AOJu0YwDEDCxuEUEGrWZLgnvuvps3EiyDsESn7BTIdLQS0BsHw1Mqggb
 JFEygZPqZG0YMeElun14+9xImdpp0eZ3XBpUBfI6ASR8+L+y0Ad6me7pGLchU9/AimZPsmLOHrn
 FkCJ9JHKm/0lGNUgXTrR9CG5tepgvf51JiGrLInsXFg==
X-Gm-Gg: ATEYQzy69QWY8HEG6KVUaJtu3HeoAeRehC6MpUzOtI7OBubU49cwrW8yrbRQXLxKtp4
 /91bH424ZbPOMQOleefCKou5D0JNwrF39ATzb0B/TuPr2WhODyILXej1cJ/MlnHk4YtKUa0jYyd
 q4leVpM/8gCEQ2+ae4K6LUWgIzJVBDUc2/q7fYwJoz/W8N69AUI+OpJK3/iyzXro4LHo8oU0quf
 ikTCt4WAjfJH+AgCA54fcoGCJxfMLszUR0C2zLb7+StEEftzdTaRMPsVjBwX/mucGrr4Rm2HNsu
 m+eHHi9yAkbPFdhNALlwsXsN8lH8lRFyukSjFVfcotblRoZk7JytW7Udkj5xneCVHLM=
X-Received: by 2002:a17:906:ccc7:b0:b8e:12fa:ff2b with SMTP id
 a640c23a62f3a-b9081b4d924mr570141566b.37.1771948963351; Tue, 24 Feb 2026
 08:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20260215112543.4817-1-mohamed@unpredictable.fr>
 <20260215112543.4817-2-mohamed@unpredictable.fr>
In-Reply-To: <20260215112543.4817-2-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 16:02:30 +0000
X-Gm-Features: AaiRm53uaqUzd4MwsSPn8k1-CBW-0DmoQs0pO6vJXn01wDPs4seH__B43Cfv4rE
Message-ID: <CAFEAcA9VjwDW8qdR3xQaqaJqge6LP_fvuBg15N9N09JcOsR8cg@mail.gmail.com>
Subject: Re: [PATCH v10 01/14] Revert "target/arm/hvf: Sync CNTV_CTL_EL0 &
 CNTV_CVAL_EL0"
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Mads Ynddal <mads@ynddal.dk>, 
 Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Alexander Graf <agraf@csgraf.de>, Paolo Bonzini <pbonzini@redhat.com>, 
 Cameron Esfahani <dirty@apple.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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

On Sun, 15 Feb 2026 at 11:25, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> This reverts commit bfbea371ef2cabc47effac5a286e2644d727a8d6.
>
> This commit breaks VM save/restore:
>
> Assertion failed: (b), function hvf_arch_get_registers, file hvf.c, line 667.
> zsh: abort      ./qemu-system-aarch64 -m 8192 -M virt,accel=hvf -cdrom  -device virtio-gpu
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>
> --

As this patch is a revert to fix a regression, I've picked it
up for target-arm.next so it isn't held up by review of the
rest of this series. Let me know if you'd rather I didn't do that.

-- PMM

