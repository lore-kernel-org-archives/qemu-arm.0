Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp3490734ejb;
        Tue, 19 Sep 2023 03:14:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFk15XVZixGV7StPifb88URRdFuaPGc3nwt0gh2WqzUCRfYz40Kt3zZlVh2CnUY9GuhSy3B
X-Received: by 2002:a0c:f047:0:b0:655:ced0:bffe with SMTP id b7-20020a0cf047000000b00655ced0bffemr10402659qvl.54.1695118463102;
        Tue, 19 Sep 2023 03:14:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695118463; cv=none;
        d=google.com; s=arc-20160816;
        b=H6Gukj9+4fKEtvAHjI46joPwajT+c8WfGqb2q9XK6hB57efkvbn1M46VoecuxYLW8r
         paRKpdxQ+ucynLZx8GflJRK11AragKseLBZIsm5e1vyBCLOOX6lq2Gr0wgCjp5/pG9LY
         ySXwRtjnQsm9coGpdGCSBmT5DHDKVotCK46Z7Xd9SqBkgWzLSDRvuFzPVGhVLfA2A4q/
         nqzeRutRFs0NxXI+eU3ONr5W4G1K6GcOl6R49nlRcAmFyEZ1JZD0F05zs7b70dYJ7Mjs
         gowahZ4iA7JiuM0JbUiMZKerKRfOGgftx8S/1QqXEDQ1insSq48tiFA/c1v+GfVfJGCH
         48tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Qr6Clrpkq6ESZV/UlTcHGYlZcIctctlsSFi4SWetSSw=;
        fh=VnLaRVPcN1gpaQWLnE0jAsSHd7/auwbL0WCytLamgZU=;
        b=Y1yi77MvSf4Hda9F00qX9VxlMmI0BCNjigI9z5FpRioI6DRrJy2L2IuX+3ElFR0XqC
         pFUBxdVibEWpP7pb2yV1QS516uvKfgJX0te5XlNpspvvuQutNbjmPfp0HCVQ5uttinUs
         i8kw/rghXAQe/pHPgR3a+o7qbEj3PWd4iIh/V63w7nGDVpEKYxBVwXcLWVjU0vC71myF
         rs48QvcDxQcwlXAA6hOAuA/jXLeYgln0n6g1blYgP7dbAjjj/M38Fx8TDdbWOGcl1XrG
         HBJ+MZF1LT1RHecK9LaZ4aNd9GMrhpzd7bPBqobqCLzgIi8vvwKkWAjX5Xz6p24z0PU5
         mwng==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v0xR1bP7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e17-20020a0cf351000000b00653589bac4fsi1688782qvm.48.2023.09.19.03.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Sep 2023 03:14:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=v0xR1bP7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1qiXix-0003IQ-0H; Tue, 19 Sep 2023 06:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiXiq-0003Ej-Vb
 for qemu-devel@nongnu.org; Tue, 19 Sep 2023 06:12:50 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qiXin-0005Lp-Kq
 for qemu-devel@nongnu.org; Tue, 19 Sep 2023 06:12:47 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3216ba1b01eso217008f8f.2
 for <qemu-devel@nongnu.org>; Tue, 19 Sep 2023 03:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695118363; x=1695723163; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qr6Clrpkq6ESZV/UlTcHGYlZcIctctlsSFi4SWetSSw=;
 b=v0xR1bP749p2pcUKZwyFb3EWhFGtTSoMvTqLj34LgjbjOc3w8MkCdGKnrcrci0nSke
 H1VD68xYLe50Wxwi9U/7jjyTmd8mU+BHpXFsfs0qtVpxXd2yF17UCokCI0Uwtr/0LRXa
 2kl6i0cm8qtfNFWNLjnAeYMkDftO6UEWwKZfIWZViqRk0Q4Dx4xw/Fob6KAVBv1Q8DMj
 BTWeIqfm3Ymftz5fRwNi4q/tAiVvghhnBf0jyqGAGavbIMUKl6WfcHgId9r3WHKr+wB4
 XZnqUvwZ3JRnokBEKTHXrhzFdHcroiTkwchIH/tDxj1W7isqLNLhk0VK0gSte791qLTk
 PHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695118363; x=1695723163;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qr6Clrpkq6ESZV/UlTcHGYlZcIctctlsSFi4SWetSSw=;
 b=pKjNgSA1TN+b9WLyyBcKdrNabUwuVspz+vac/3UnzJHQmV+/iOLy04B7v/bT+JtWGx
 3anfPI8xOmCfZL/P9GHR6rl2f/nRgJs1WByZTQLdcn/9MZV7QTmFs998RgiiPAK5um8W
 lklkRGY5ABWbjsNZmt3+KT88WknoGvmG2eDuNM4anWF7fAwtaObM0Dsi6YALob2jUdEy
 CNoskSZxaQOeocHrAvgywj1ifeFjti84KB5sCz79ZWu/8z3unRXMD8g1SI44LzajON7O
 n7E3pNUlg4XmoyrXSCrDXNScLnpZQRXKRPbIiFIT9m5Vjd0Dxfv1MIer2b5b24sTuvyf
 g0tA==
X-Gm-Message-State: AOJu0Yw3DIxj9v1MpACnSwQXXtFbJMyBReD9YDySfO6ev9Of/50fEJw4
 En34M+pkFFABnDNXRKe+dwslVA==
X-Received: by 2002:a5d:6851:0:b0:31f:e5b8:4693 with SMTP id
 o17-20020a5d6851000000b0031fe5b84693mr9285336wrw.25.1695118363207; 
 Tue, 19 Sep 2023 03:12:43 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ba13-20020a0560001c0d00b0031ddf6cc89csm12290136wrb.98.2023.09.19.03.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 03:12:42 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Leif Lindholm <quic_llindhol@quicinc.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Ani Sinha <anisinha@redhat.com>
Subject: [RFC 1/3] tests/qtest/bios-tables-test: Allow changes to virt GTDT
Date: Tue, 19 Sep 2023 11:12:38 +0100
Message-Id: <20230919101240.2569334-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230919101240.2569334-1-peter.maydell@linaro.org>
References: <20230919101240.2569334-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7Tv70sPS5dPX

Allow changes to the virt GTDT -- we are going to add the IRQ
entry for a new timer to it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf..bcf131fc160 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/GTDT",
-- 
2.34.1

