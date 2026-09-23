Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA08C9830B
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Sep 2026 21:10:19 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x9UEE-0004FF-9H; Wed, 23 Sep 2026 17:10:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1x9UE4-0004Bo-Dw
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 17:10:06 -0400
Received: from mail-ua2-x0f.google.com ([2a00:1450:4864:39::f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcelomanzo@gmail.com>)
 id 1x9UE2-0008R0-RM
 for qemu-arm@nongnu.org; Wed, 23 Sep 2026 17:09:59 -0400
Received: by mail-ua2-x0f.google.com with SMTP id
 a1e0cc1a2514c-9852048ab71so407504241.3
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2026 14:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790197797; x=1790802597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2jZ5E27TAd+15Z/w22xWfUZE4mFmL95RTG8LK5diRaw=;
 b=aONXwwplHA6/QyPAB/cOD1KgeRGIL+iRAqzS+5WJcYSaRzxcznTcK0grahcdt/lKt0
 siPJAy45WNbDvx6gMoVJqziKlohKENyxOYkpON/OrAEzHxnNbDd30BK0NUqJNSFcoDJa
 1fKnU14t362AycgCCdgMZ1DqK9cV2kSQPX+nW5Q080WoXVh4eBz0TUxfSyD1FTmmpO4L
 eqqr4bWfWw2nqDWlf04VurcrhIQtKTXMAKZZUQDZ1aTya3onsZ1YU15ap1q1+tsHy/AP
 h54YL0i4wRqAtEwDlTq9V6NUKnIAKC9xiJVHqhx0gPOBdtKQ3XFDnGIIaPSC2dPUFiAo
 O8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790197797; x=1790802597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=2jZ5E27TAd+15Z/w22xWfUZE4mFmL95RTG8LK5diRaw=;
 b=DCE/gjRFm6g4kuwBohZ1T4/BtCcPTQ6nQFz6cPmNiqsKs2qj1KgSwtEk4z61ksbubT
 iNCnBKgaoYm0mPJJPzZhaKbNejRG6uytA62qRjc1l2xwBV/axNcCg61sAyZ7rK4UJ5q7
 psw5V1yswklLeW1LlnEgU+ee1We159J5QuEwL+glzWtDNXDD6RjIEH3QHMt1JF/5dM74
 o9YxXk49Sb+2LC5yNA8SBH6C/UK+4aqCdsZ3HJ1FsfFCjdhKWBdkFckKWq3DbKbLp5S5
 CTqvyyo0SMK+LD6SwyYk5dvUlsu10IwYSFlNohmBhNjFCFWhlYJpM3Afd74q9m8pDJaF
 xZxA==
X-Forwarded-Encrypted: i=1;
 AKwUvBx9bo58dbwM5Q/oTelKBraW4J+08CxwXTkryJ9H1w24MZfxxJbpgCPR5ZZS1MQ8urOIFVRhhjfQfA==@nongnu.org
X-Gm-Message-State: AFuF++k9gYFPt8UF94Wb0ha6wK2R2Z4xy/+d57trKhqfYZ5P/g3aunm0
 ulr0AdXttFbFE3DDQEhyn1ozA0TNrGJBUczAdeo5NotjwhhIdc+Vvm57OhHlApFtwLU=
X-Gm-Gg: AYBFou27BPgXA3wEM7FmJlKq+tnkkPkDC0gZ+Fb6pBjOeVxSNKW7NYzNAE+Pzgy7SCv
 Yry9EEQxSrU/QOMHSfwmhZliFMOS6FW6KpWJ8+hWZFaVs8ti8gJsHh25g2oHAkcBuFDOR9w3JUd
 lBZzg9wb6zK1rOYriIW05DN4sTTC6QFxcSZ9v+8Px/OrJFpYn4S1w9GFogk7/pWVCyk6A99yjR5
 wmxylkhDuxLD3XQ5XLDUOKBiOkVS94666+ByOPxhQy+rc3cwYqDgAK3sRusRmZEBsJODk6YYR3l
 oSkNnF9FJewefGwwuDEvR/WNTD9z+cu7pYTykQgAz8jOvaRdB/xiCrCAIswCT+vhonuUIpbRpA/
 mcgiBkt3OHuuRMbO0PedB29swe66T1p0DGjLyqmMGJHigTIT75PZCW0jqvv7SoQ5UeUSbVcvBc2
 ovivQa8FaFYp5/N/go/NnHZ9Be10UBMR0jGK3j5cG7hsRaZGzuHZq9a2T2OrihWfRNn0RViCEzx
 cJR16AgA23hJj8phT/KfA8e5+qSzNKTmSVVTcA=
X-Received: by 2002:a05:6102:38ce:b0:7a3:3d26:5c67 with SMTP id
 ada2fe7eead31-7af1e4f2ddamr406952137.24.1790197797329; 
 Wed, 23 Sep 2026 14:09:57 -0700 (PDT)
Received: from localhost.localdomain ([2606:6d00:159:2900:8d8d:5fed:813e:d8db])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-7af25964441sm455715137.10.2026.09.23.14.09.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 23 Sep 2026 14:09:56 -0700 (PDT)
From: Marcelo Manzo <marcelomanzo@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/5] hw/arm/raspi4b: RNG200 and thermal sensor
Date: Wed, 23 Sep 2026 17:09:55 -0400
Message-ID: <20260923210956.52940-1-marcelomanzo@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260725012635.4925-1-marcelomanzo@gmail.com>
References: <20260725012635.4925-1-marcelomanzo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:39::f;
 envelope-from=marcelomanzo@gmail.com; helo=mail-ua2-x0f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Hi Peter,

Gentle ping on this one too -- it's been about eight weeks with no
review yet. Happy to rebase/resend if anything's gone stale in the
meantime, just let me know.

thanks,
Marcelo

