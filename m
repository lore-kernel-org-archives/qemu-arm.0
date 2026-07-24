Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F05A2C531C9
	for <qemu-arm@archiver.kernel.org>; Fri, 24 Jul 2026 16:10:22 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wnIT8-0007Wk-Qy; Fri, 24 Jul 2026 12:09:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wnIT8-0007Wa-98
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 12:09:50 -0400
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <simonxhy0404@gmail.com>)
 id 1wnIT6-0007lM-Tq
 for qemu-arm@nongnu.org; Fri, 24 Jul 2026 12:09:49 -0400
Received: by mail-ot1-x333.google.com with SMTP id
 46e09a7af769-7eb61bbeb25so351719a34.1
 for <qemu-arm@nongnu.org>; Fri, 24 Jul 2026 09:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784909388; x=1785514188; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=8IvMsfbKwm20zX2K1vOpEBr7NC9psua0BzNL+gVOX44=;
 b=XiM2TAB1wOBr2hpSBsPhCrgp194rgA+QajTJP1jFbvM63qLf9ocjKFeZXH+VH0WgO5
 +tbdYxUj7yVwRaGVKl5EOxTxTZ9aJPD0dh13pYN8b7DyXEWJTEE3IaSq3BtHJ3g893ES
 Z5xdmfwUO9PYrR68pPpm6v/XBhb6doFT9slsHqjZ08qlo+B1luqGKHAp22zgygtGnmhT
 U9Ek0v5Fynedk/96cbHZ/rjtSxFnwH+HrHqnPNebR6XZXAWl5omF+YogvWVeUMCTXX3o
 g8VgePue4rPEQVNTUVkIb9NTBK/06gGs98hd2HuC9vXb0DOyJpgJstoKtV1SMxxU3QW9
 1vtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784909388; x=1785514188;
 h=content-transfer-encoding:mime-version:content-type:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=8IvMsfbKwm20zX2K1vOpEBr7NC9psua0BzNL+gVOX44=;
 b=Gp4L7XX/HfKPDXDmzzqPl5NrvJcpaopv3MHWReWT5IcTB0xrcDYx8QPr7ikT2wyzrB
 GiCPzsdpRiNY/IKbZ24a0FIXctbJo50AnLpej47Gfz6a4XBcJ5EuH8nh5QFp9wqbU4YD
 hZuwlMCfaF7zbZa4JHbiCmb2cVG6gOvdfyNpacCNTpvwA6ZeLlxVRUyPgHdDLD5Yxacw
 BsSg/6CZgx7GBELPPUlQAMuRpWF/YjLftkUa0f3hOxc/DIFUqbEdyuQbnDoEKzsY8T2n
 igqOU+u5AVr6POHlgfkTKpa1SvBJsLcRDc8logAgIwRnp9B7pKN+baxNgGTpAGZZVHD4
 iHJw==
X-Gm-Message-State: AOJu0YwK55DBwclYCQJEIIWaPWrN/LXxBdxPglKMuxQZctUrDGF44YDq
 8vLV5yVMehrgt3ymfEXqfO2kb7wTBivRys4q0LoqB0ZPQGEuEmARQ+j3
X-Gm-Gg: AR+sD12onQBybBJKcDL+rsCHhYJDY5jCagVAaSq9X3kgs1bNdbKTWrC6pZZyG5fuUZB
 kiRVwOIqKBH05plNA/Whvc3CidemR3hd42qSs7v/KsuFpeaUsJV7yKD4YSAFCQBtXnh0JjU+Uf/
 Be7/z+OnPLMC1fB1iRRT+mz3BTSrkTAkjOSmNcx8UrR7jbCUyUA7I6Eod3e0vtY8oGQi0RNrFPP
 rAJltKipbivFpxyXh53zM1I9geezeEXKbiOP+/TCxK4bkPJ3u81bas3qpioVjGkiBPQYnAHF5BS
 zuhVLOuL8CtipkDiHufA9w2eafFORij4BBLZ2/JM93Ju9GEJKq67RPOpjcVmHq5nYpixheB2Ysv
 tgPfn1zpMM8/LMzn6UVMRTqUE4DGXu6tj6YAg3aQ0Oh+Hp/6WPvOKx/XaYI57O3mY8zLgPnAwNo
 hozl/qYwTE1aPaQn3y7+At7g8=
X-Received: by 2002:a05:6808:d49:b0:495:ecd3:ba29 with SMTP id
 5614622812f47-4ab3571ccdfmr5102040b6e.35.1784909387572; 
 Fri, 24 Jul 2026 09:09:47 -0700 (PDT)
Received: from HPE-2MQ6131DV6.home.local ([23.124.244.239])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-457ab7405a9sm4542753fac.18.2026.07.24.09.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 09:09:46 -0700 (PDT)
From: Simon Xu <simonxhy0404@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Simon Xu <simonxhy0404@gmail.com>
Subject: [PATCH 0/2] hw/misc/mps2-scc.c: fix scc_partno and cfg7 write
Date: Fri, 24 Jul 2026 11:09:41 -0500
Message-ID: <20260724160943.52509-1-simonxhy0404@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::333;
 envelope-from=simonxhy0404@gmail.com; helo=mail-ot1-x333.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

Split commit from v1 into 2 as they are unrelated.

Signed-off-by: Simon Xu <simonxhy0404@gmail.com>

Simon Xu (2):
  hw/misc/mps2-scc.c: fix cfg7 write
  hw/misc/mps2-scc.c: fix scc_partno field width

 hw/misc/mps2-scc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.53.0


