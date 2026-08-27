Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBF83C61DC6
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 13:05:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzZnG-0007rn-8j; Thu, 27 Aug 2026 09:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzZnE-0007nN-KU
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:05:20 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzZnD-0003V3-2J
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 09:05:20 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-81f64e8dfbcso15858977b3.2
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 06:05:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787835918; cv=none;
 d=google.com; s=arc-20260327;
 b=ZYNWWZL6D0tchQg3DlJOor8ze/puggdKCOmCQgWtiq4D1xnvULJ7n4dUUo/1X6IFBf
 SqSuw2V8xfllEbYy63kEPvQ3nKf72JtTaX2/DenvaYXihO8ma3OitEDInADVrGQURrYJ
 AP1W3kWSUF9QOkvkinPg94EP+pNhMlrorrW3PO/TkIuV7Jx/yUFjcqS5W7CPPa9sicjk
 mdZOr4CA3wstqa9KB+muW2K1nty6a3EKHgjuodyMjprgxISbTtws4Cc0eGBdPPeQG/mA
 7rc1zlB91UfZpeuxni0fReFH/UGDzq7EVeYDnijX1sEP5TT0l5lPJe0nIMtDK/5hzi/R
 QgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Cbo0OxZfYoOgj/TCxI2up1y7VYLdVDum/RFjOP8ndiE=;
 fh=IGtMNg0cTUSH0XGvf7lkMF3ITFDOAqGdeTPm9ElYrkQ=;
 b=N/7uPwVyHLBnvj7mmYtj+DZxPKd8nzPI5m6kWhY0a7uH7v+ZgPPEx9hXj3e66DKKQi
 aileGvA8bBIZ4FJ88s4l+hKbwr2ItvcQINLnkbVP3MQcVaDnQ5NbFRRd7S7Q1W5YLuS/
 ialqA1wmQcPhUVO+3bL2K+Cy8IsXjvLbYFQaEYS/kQP5II0mhf2l4S0UE/hW9seM8ZPw
 rBN+th3NLs0Tj3eEvvbpUhWqu26dkTNbQv7xdM0MdL3h+J+IdwhQDLYlYJelwB84CNR4
 Ai+CDIFMglpVxO8ZhGszEIVN2DBoGca29EPnmzvCk8N+CI7fBkf0u911NBfxHgO5UEV6
 wgsg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787835918; x=1788440718; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Cbo0OxZfYoOgj/TCxI2up1y7VYLdVDum/RFjOP8ndiE=;
 b=UeoLtN7HHltcL/YSXbdztlEMsgrc06qQNWkzkiHa03skqpzBQ7BZfVQFujMV8aQ4nv
 tg3/QjIobmCaIzZWq5MP89PDJdZnvtUZCk4DKZMAFYkgky89QZkFijhD75KgFNfwuxLw
 18JqyGvBjzFTXNvHIWTPo3JqRuqsALnSA1V6Ixrsux8t+CwFq6ovM/DCwfgcfbFsMooC
 8a4qRNKU4GShZlXxTMMwIuthF2o2UI+dNVkoOadb/iiGcQ08PUIM2eSdPy2kSp/4dvSM
 RdusX0ejm9WWnJYz7XBT/N1CuaWvMR0qieV7HXLyriUzEMVW4Ev/lPUDQMbb+2BF2S7w
 nYiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787835918; x=1788440718;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Cbo0OxZfYoOgj/TCxI2up1y7VYLdVDum/RFjOP8ndiE=;
 b=qOudA1AJ+Q8zVoUOAn7AxuTidCH8RNqKESG1VXCBGg5QWky0EzOMiGuEZtf9I6U+AT
 A7JNr1EROubGpzAapaYyRvOdHy4DLD6pb1vRY1bTZu2WZDnyakY0KD5kmAETRLqMlKSi
 z+uTHxKEmwMXTqs+bdtSpYzBnEvB2q2kRy2nUnboyohKMOlGiOKF7tJVdW4ClJsBeyt7
 z4/pzWL/GMQrZVfYggE/xKaTYlyMOKTGT7YwffXmRrQEC5cTFcFYmWHMZAc22yDBQ89C
 UMqZefK0RYQ6Jh5J/47AA1lE4nwUPgPjnEDcZfI0bDUvJnnz5+PVfIkAXyJ0ys/oA5Gq
 8+bw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqRlhZAqUthGYhDs5RevrDl+kGy0rBhaabwndvcfGDijOl3+9hCmnGgx5nffB5hcqMOEKa1ydfqew==@nongnu.org
X-Gm-Message-State: AFuF++nGw4Zy2NfsykC0igaSTFcQErjipYzbKkQtqYWKoY50h251q/j9
 XsoeYmnn33dWbeXE/hUZ2eYxxvxSmdD6pgF0F2j+2RKmLqHDUCR7nZVWAbcjJmo5Chx5v3NqeL/
 F42lebc4VggVXl+yiAtMGkNiQpyiCYGdCO4mXpf2VPZJXKAQX4hWfgdc=
X-Gm-Gg: AR+sD13tqHXtG14QCxmb6tDDYrro8w8E6lLNQSKy6ln1nNcU5Lpr73EdgKwh6Ney1Kz
 ObrNzEc1ush8E01/N9jCAYY6qS0kwTDmmuAUGTfGp+YQgi3oJvD31WYBGMTymoyOjdoA3miUmep
 EG8UB5btfbK0935zVvuBkGESmIEO3RLX2oD+FtLWJmlSLL+XPpqv5v/6If4k6B7WD9ciM3RxkMu
 g085fx7KBD/MpqT9pjo92Uwz5vgZgeexwBq1qmu1+Zi1yZ6tTEo4Q5QLKzccNzbuW8qDjQr7GYU
 Z7xB5q0I1ZIubpjEGyK7Yr2m+XzpN3pyb/6MMP+9oWPQ6thEGOaTaqk14Wyr0ivO0aQEyK3lH9w
 7aTNDgYusnZpV1lFdNd/juj45amAfzae9hlrE6gg=
X-Received: by 2002:a05:690c:5c09:b0:845:ddf4:a393 with SMTP id
 00721157ae682-8574124d537mr57351867b3.29.1787835917357; Thu, 27 Aug 2026
 06:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260826174213.614571-1-richard.henderson@linaro.org>
 <20260826174213.614571-5-richard.henderson@linaro.org>
In-Reply-To: <20260826174213.614571-5-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 14:05:05 +0100
X-Gm-Features: AcwNN1WFtZ0uJIBBGeW4VRplAPu3QIPTNxoWdvUImzmyJW2rly56XwSY8J7-4SU
Message-ID: <CAFEAcA9duyTnvhTsdxAn7cXoO-7jv_CpjZHRJe=eQFLUkfOyEA@mail.gmail.com>
Subject: Re: [PATCH v2 04/25] target/arm: Implement FMUL (multiple/multiple
 and single vectors)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
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

On Wed, 26 Aug 2026 at 18:44, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-sme.c |  9 +++++++++
>  target/arm/tcg/sme.decode      | 15 ++++++++++++---
>  2 files changed, 21 insertions(+), 3 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

