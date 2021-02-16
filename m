Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6535975lfc;
        Tue, 16 Feb 2021 07:02:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw8vi2f82SgnbeykzW7KW48zrN/Uyb7BN+TQ1sMvozDd8AKWSRnAN5Vq+5fh4Oaa8ZDmuA1
X-Received: by 2002:a25:6c45:: with SMTP id h66mr29559022ybc.490.1613487731827;
        Tue, 16 Feb 2021 07:02:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613487731; cv=none;
        d=google.com; s=arc-20160816;
        b=sRJ8u8Lzo5BWhTnpLQ9EkISX/T6RNIOYyLMM/e0CsduMKzUJyG7/0d3BfOl03S9uIa
         +kIHmse97V33ZM/QBAQnjJdGydCHzbnK0wjJPurQ2qNes9sfoh8jF4ZkSzOaqFS4RBS/
         iOgyetT+74xqETvf3s0eeLq92Y/6MZlTlCM8sA5j8aH71Rq0YNOvkG1bCxxj6jMYbE+s
         CO7EBQNYxsmF+ZvY6pePzUL3DgjsCiHHMVTItO/BhrmprWELdguinvQBfCsGQuNo27Tu
         SQjgPnigMAPbeVsqHHFacbXy0tv33r0dETXc1vdVImjX5JNJwareVyWgFH0Pm2WkAsSy
         eoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from;
        bh=KBp5cZw+wKuRdrhC3K/p0LzltUJSsam+qrLyCuVTvKM=;
        b=IJeCGG/uuAJL2y22njAJjMnEVRs/PFviNpxZX7QqkAWX/q+++SHgLlmos9VFD1eib8
         N5vpU736BZTcjzi3GJuHvrIU0pLmF4qpxP+YM6hru0w0aqZWQPZzIbxIdk0XiE8gIsjs
         ydSsXSQ+Qz56tQM4i6aafHWizCRA0DtxhAsW9SOGwOEXbUazWWI/VE08C8DlsRVPqX9v
         CCuJXrCmZZ/3PhJqqRO0Eg0xdd5OboxNwm63gvl3pznnQzcvDIfqA6Ht4Wxap5Z8CjDz
         v7AmyrwS+NLOKLFNfSLEIm9mtkPd3K40I3TIClWBRIZ7paQA0cVv1pzQYAz0peXlK8gL
         PCnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f4si22292817ybr.481.2021.02.16.07.02.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Feb 2021 07:02:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lC1rf-00036t-16
	for alex.bennee@linaro.org; Tue, 16 Feb 2021 10:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lC1rI-0002f3-Ry; Tue, 16 Feb 2021 10:01:48 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221]:53082)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1lC1rG-00069U-6z; Tue, 16 Feb 2021 10:01:48 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 107DA26074B;
 Tue, 16 Feb 2021 16:01:44 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CHThkAHAMDju; Tue, 16 Feb 2021 16:01:41 +0100 (CET)
Received: from puchatek.com (89-67-26-161.dynamic.chello.pl [89.67.26.161])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 15786260131;
 Tue, 16 Feb 2021 16:01:41 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-arm@nongnu.org
Subject: [PATCH v3 1/2] sbsa-ref: remove cortex-a53 from list of supported cpus
Date: Tue, 16 Feb 2021 16:01:21 +0100
Message-Id: <20210216150122.3830863-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
References: <20210216150122.3830863-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Rados=C5=82aw=20Biernacki?= <rad@semihalf.com>,
 qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Leif Lindholm <leif@nuviainc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jOhSClvXETsq

Cortex-A53 supports 40bits of address space. sbsa-ref's memory starts
above this limit.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Leif Lindholm <leif@nuviainc.com>
---
 hw/arm/sbsa-ref.c | 1 -
 1 file changed, 1 deletion(-)

diff --git hw/arm/sbsa-ref.c hw/arm/sbsa-ref.c
index 9f70735153..276243d122 100644
--- hw/arm/sbsa-ref.c
+++ hw/arm/sbsa-ref.c
@@ -145,7 +145,6 @@ static const int sbsa_ref_irqmap[] = {
 };
 
 static const char * const valid_cpus[] = {
-    ARM_CPU_TYPE_NAME("cortex-a53"),
     ARM_CPU_TYPE_NAME("cortex-a57"),
     ARM_CPU_TYPE_NAME("cortex-a72"),
 };
-- 
2.29.2

