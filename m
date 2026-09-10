Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D99FC79F9F
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Sep 2026 11:04:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x4cZx-0004kf-Fl; Thu, 10 Sep 2026 07:04:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x4cZv-0004kG-QT
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 07:04:27 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x4cZu-0006KL-9g
 for qemu-arm@nongnu.org; Thu, 10 Sep 2026 07:04:27 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-86cba60d4f2so52740007b3.1
 for <qemu-arm@nongnu.org>; Thu, 10 Sep 2026 04:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789038265; cv=none;
 d=google.com; s=arc-20260327;
 b=RMdy0Bm14GiduFl6rrZ0a3jdP8qbBlMQZ4HWo1OffgkHkP+bhgpEqo4JQQSteo67Q8
 ceAvw5yX9G8Ysr49QU6IF5JJRPYOj9cx+Um4Jw36pznH+WXPAPfmoTxM2KInra2+25fb
 UtkCYEZFxXGG/lQz9LQx9Y/9VvdWuqkOKJpxxOYvh8OXH2BiOGQmw4hSG7UpJWSHrxzw
 xc6cmIhOkliSCOCAXU10d7rcI0Z+W8VEkG4SGO5HilRlHBmNVQoyXorwGCrUGEzYD7dW
 5rezOhUsEX1rTN/GPY2lzM0aKahwT7PDtJysgAj2vuNpjRI5WDomxooWUT4q5GKj5fN5
 07Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=y1DpiDcwcVxZnJupti1cSNma3xCB7QBpmm/Z0yCi9Fk=;
 fh=SRBlzNvdhxR4e/114gIq/bUC7y90wAT6iPiQSj3DQRw=;
 b=mvQ4bDRYqLJrd8lUlWPLi/ejSU2Q2EZ4vKjzqNfBZhyAg5z0Hq/bm7tLG9pp+C9hBT
 9pFER27VW9zSnnyy8pPMN7kl1bq+5xuEhdA0EZS6cncHwPr+9sgZM9mMa00F/PReii4a
 GeTMSP9CETizhZUio3HMx62ARpugnTe9eB9gLSw1NtQikwM2wtt/56kjIzusRxzq0OSP
 o2d46qVbtIJSbh1wIN3/dnmfnXovzL4wdt018MwnGjbM2dUuneYPbzlhTWiHc03O0HY7
 nZhOkBgzS7Si0dh9+Z2LDYGcFeIzu9T5EoMvUZgU6YyBQLxQGmhCxRmF3ryiS5nxzm4U
 IJ+Q==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789038265; x=1789643065; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=y1DpiDcwcVxZnJupti1cSNma3xCB7QBpmm/Z0yCi9Fk=;
 b=ct7/bjNPBgqfY84wm5QjAOXBUYH2uPqT7DCiVlUdEXXNuuDa+kB7W/mmY6I+TKkVL9
 Ny45L8PHooQ6bEKheZxQ4Nd35a5+W2u1d4qzgI+TWUc+TDTyaP2Xfqj1wfhf/6rmjUlx
 AVBvsO4yDQBqUJhKE3b+Z2CWfjRObEianL9AXxYCaNHHWQVWZ4sNVUHJEVKFJiuYNm/6
 ScquEMm9b6uNTfWdlfqaJFvkmN32egS77ciPru6+3Ch8Wru90KcL8bRU0rmspGjVgxgc
 8rDtg0UjaixEAxtsMDbnrGe0RQDfVzTB3gAbllwXCHs7BKX3oEelw9smBgYmP5vx5f+d
 M71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1789038265; x=1789643065;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=y1DpiDcwcVxZnJupti1cSNma3xCB7QBpmm/Z0yCi9Fk=;
 b=Zd9CNlNr8xA1UCeYcGczlc1417plQPQuztQsdxoxdiAx1hj/Jv87AKlaxTA9f75gZb
 amGb6CHUAebPAUL9f5r+Li8BQGKIRyxEACq/R7fKjFAam4mGDlNhdWf+0qX2NnD8z4la
 MijjhCHVhU6EyNOvN5+u8Du+klgla8fi+gouY6H7iUM88j/GMQ1X9aNeK4UnBq0fZfja
 ja+GHSot3MJ62lWzihkVVgOW4sAGVLd9cPCisTUVZZr09taIfC0TCdfoPs5qyMhpreSY
 eS3AVaMfyqYzK+7EOyy2P6g3J13ECsLga1ZDCE6A+0ovSBTfJp8G3Vp+8ZsDC1KVAZPL
 ePQg==
X-Forwarded-Encrypted: i=1;
 AKwUvBzpObRU1h71yYvSETKk/Kv/dS/aryn35DSARCS/N3CnNNrLvnTb1UAZc8UjR4ZPs33+1UjD2Tc81w==@nongnu.org
X-Gm-Message-State: AFuF++k2g8g/P1Z0Yo6ZWz7MxySkOtbvuS4Hc9PhhhlSJ3MSvJxIaPjm
 P/FfZENlH7eOzOJY9IgnALpQDA3YCzMnj8RP1S834uKab1S4G+vZnYb3icKSLdZIZGwUB9ARvG2
 bhrMOqWxgOLxC1FOSCLVnRHYBUIa2HIXmf5xCBL4wVg==
X-Gm-Gg: AYBFou3b0Foaek6cu999/bm6ejJyUGH7rfvfHwT9kiS9EkUtKNheMURc1Ws4RS5pgpR
 Q2CyPblK2zFj/d8s9Fjk+IR7aLZXEc6ejhyT7Yy9madtn6kx+uJG56k3uNXCCrgy+sSEwBxT2s6
 bSFwcqzDbzWuDTiVd17Xp/mRvvXuiFlX8GnkCP+Ssa29Zd6QmYiSH8DXNKVy81xaMEJzDNNk2Ew
 7WbHdLLs3AyukzI8mt/9t1j5cdbCzi3TNIckEMvVo65X03A4Cnze/5K7VNk9pJJpozFOC7xJd2l
 UTU9RD5DEtizClqDkRzaO53YbYFU94nKbFocalnEdYp05FIjD51ng3sfJF0pQJG6JFdhjYe0zsB
 JQP++XUGL94nqJPEGiseWAo2aUfcQ9ljiGWa1HFE=
X-Received: by 2002:a05:690c:31a:b0:871:8a81:a2c9 with SMTP id
 00721157ae682-8718a81b972mr182038267b3.22.1789038263341; Thu, 10 Sep 2026
 04:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260906194438.93046-1-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260906194438.93046-1-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Sep 2026 12:04:11 +0100
X-Gm-Features: AcwNN1X6r3KOwglgBeJamxNql1SDCtWiEXPICRghG26PE3e-JWxzX8pzMuqBB6w
Message-ID: <CAFEAcA8s4UXp=hp9R=Pq1mMP6VvB8ergnsm7Yq1xooOGgTPsCg@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/36] arm: add Raspberry Pi Pico/RP2040 machine
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
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

On Sun, 6 Sept 2026 at 20:44, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> This RFC adds a Raspberry Pi Pico / RP2040 machine to QEMU.
>
> The work continues the RP2040/Pico RFC posted by Alex Bennee in 2022:
>
>   https://patchew.org/QEMU/20220110175104.2908956-1-alex.bennee%40linaro.org/
>
> The target is intended primarily for debugging bare-metal Pico firmware and
> for running firmware tests in CI without physical hardware. It provides a
> functional, test-oriented model rather than a cycle-accurate RP2040 model.

Something odd seems to have happened with the way you sent this
patchset. Instead of the expected structure where all the patch
emails are replies to the cover letter, instead, what we got was
that patches 18-30 are replies to patch 17, and patches 32-36 are
replies to patch 31. You can see this in the "thread overview" in
the mailing list archive:
https://lore.kernel.org/qemu-devel/20260906194438.93046-1-gilles.grimaud@univ-lille.fr/

The result is that automated tooling like patchew doesn't see the
whole series:
https://patchew.org/QEMU/20260906194438.93046-1-gilles.grimaud@univ-lille.fr/
(it thinks only 18 patches arrived).

If you could have a look at what went wrong there for your next
revision of the patchset that would be helpful.

thanks
-- PMM

